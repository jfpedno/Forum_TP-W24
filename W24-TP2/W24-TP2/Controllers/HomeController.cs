using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using W24_TP2.Models;
using W24_TP2.Tools;
using Microsoft.EntityFrameworkCore;
using W24_TP2.ViewModels;
using Microsoft.AspNetCore.Authorization;

namespace W24_TP2.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly Forum01Context _context;

        public HomeController(ILogger<HomeController> logger, Forum01Context context)
        {
            _context = context;
            _logger = logger;
        }

        //public IActionResult Index()
        //{
        //    return View();
        //}

        public async Task<IActionResult> Index(int? pageIndex)
        {
            var pageSize = 6;
            var mesCategories = _context.Categories.Select
            (c => new HomeCat
            {

                CatId = c.CatId,
                CatNom = c.CatNom,
                CatDescription = c.CatDescription,
                CatActif = c.CatActif,
                NbrSujets = _context.Sujets.Where(s => s.CatId == c.CatId).Count()
            });

            //return View(await _context.Categories.ToListAsync());
            return View(await PaginatedList<HomeCat>.CreateAsync(mesCategories, pageIndex ??= 1, pageSize));
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        // GET: Categories/Create
        [Authorize(Roles = "zeMasterAdmin")]
        public IActionResult Create()
        {
            return View();
        }

        // POST: Categories/Create
        [HttpPost]
        [Authorize(Roles = "zeMasterAdmin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CatId,CatNom,CatDescription,CatImg,CatActif")] Category category)
        {
            category.CatActif = true;
            if (ModelState.IsValid)
            {
                _context.Add(category);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(category);
        }

        // GET: Categories/Edit/5
        [Authorize(Roles = "zeMasterAdmin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Categories == null)
            {
                return NotFound();
            }

            var category = await _context.Categories.FindAsync(id);
            if (category == null)
            {
                return NotFound();
            }
            return View(category);
        }

        // POST: Categories/Edit/5
        [HttpPost]
        [Authorize(Roles = "zeMasterAdmin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CatId,CatNom,CatDescription,CatActif")] Category category)
        {
            if (id != category.CatId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(category);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CategoryExists(category.CatId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(category);
        }

        // GET: Categories/Delete/5
        [Authorize(Roles = "zeMasterAdmin")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Categories == null)
            {
                return NotFound();
            }

            var category = await _context.Categories
                .FirstOrDefaultAsync(m => m.CatId == id);
            if (category == null)
            {
                return NotFound();
            }

            return View(category);
        }

        // POST: Categories/Delete/5
        [HttpPost, ActionName("Delete")]
        [Authorize(Roles = "zeMasterAdmin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Categories == null)
            {
                return Problem("Entity set 'Forum01Context.Categories'  is null.");
            }
            var category = await _context.Categories.FindAsync(id);
            if (category != null)
            {
                //_context.Categories.Remove(category);
                category.CatActif = false;
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CategoryExists(int id)
        {
            return _context.Categories.Any(e => e.CatId == id);
        }
    }
}