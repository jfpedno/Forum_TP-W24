using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using W24_TP2.Models;
using W24_TP2.ViewModels;
using W24_TP2.Tools;
using System.Security.Claims;

namespace W24_TP2.Controllers
{
    public class SujetsController : Controller
    {
        private readonly Forum01Context _context;

        public SujetsController(Forum01Context context)
        {
            _context = context;
        }

        // GET: Sujets
        public async Task<IActionResult> Index()
        {
            var sujet = _context.Sujets.Include(s => s.Cat).Include(s => s.User);
            return View(await sujet.ToListAsync());
        }
        //Fonction pour préparer la vue des sujets
        public async Task<IActionResult> Index_sujets_par_cat(int? id, int? pageIndex) 
        {
            var pageSize = 4;
            var mesSujets2 = _context.Sujets.AsQueryable();
            if (User.IsInRole("zeMasterAdmin") == false)
            {
                mesSujets2 = mesSujets2.Where(s => s.SujetActif);
            }

            var mesSujets = mesSujets2.Where(s => s.CatId == id).Include(s => s.Cat).Include(s => s.User).Select
            (s => new MonSujet
            {
                CatNom = s.Cat.CatNom,
                CatId = s.Cat.CatId,
                UserName = s.User.UserName,
                UserId = s.User.Id,
                SujetId = s.SujetId,
                SujetTexte = s.SujetTexte,
                SujetDate = s.SujetDate,
                SujetActif = s.SujetActif,
                SujetView = s.SujetView,
                NbrMessages = s.Messages.Count,
                DerniereRep = _context.Messages.Where(m => m.SujetId == s.SujetId).OrderBy(m => m.MsgDate).Max(m => m.MsgDate),
                DernierUsager = _context.Messages.OrderByDescending(m => m.MsgDate).Select(m => m.User.UserName).FirstOrDefault()
            });
            return View(await PaginatedList<MonSujet>.CreateAsync(mesSujets, pageIndex ??= 1, pageSize));                     
        }

        public async Task<IActionResult> ZiAdmin()
        {
            //int? pageIndex
            //var pageSize = 4;
            var admin = _context.Sujets.Include(s => s.Messages).Include(s => s.User).Select
                (s => new ZiAdmin
            {
                UserName = s.User.UserName,
                NbrSujets = s.Messages.Where(m => m.SujetId == s.SujetId).Select(s => s.SujetId).Count(), //je comprends fuck all à linq comment grouper ça par user no clue ?
                NbrMessages = s.Messages.Where(m => m.SujetId == s.SujetId).Select(s => s.MsgId).Count(),
                //DerniereActivite = s.Messages.Where(m => m.SujetId == s.SujetId).Select(s => s.MsgDate).FirstOrDefault() // comment ça je lui demande pas une conversion de string à date je lui demande une date grrr
                //DerniereActivite = _context.Messages.Where(m => m.SujetId == s.SujetId).OrderBy(m => m.MsgDate) // pas capable de faire un order de date pourtant ça devrait être simple j'ai hâte de comprendre linq

                });
            //return View(await PaginatedList<ZiAdmin>.CreateAsync(admin, pageIndex ??= 1, pageSize));
            return View(await admin.ToListAsync());
        }

        public async Task<IActionResult> Adminxxx()
        {
            var admin = _context.Sujets.Include(s => s.Messages).Include(s => s.User).Select
                (s => new ZiAdmin
                {
                    UserName = s.User.UserName,
                    NbrSujets = s.Messages.Where(m => m.SujetId == s.SujetId).Select(s => s.SujetId).Count(),
                    NbrMessages = s.Messages.Count,
                    DerniereActivite = s.Messages.Where(m => m.SujetId == s.SujetId).Select(m => m.MsgDate).FirstOrDefault()                   
                });
            return View(await admin.ToListAsync());
        }

        // GET: Sujets/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Sujets == null)
            {
                return NotFound();
            }

            var sujet = await _context.Sujets
                .Include(s => s.Cat)
                .Include(s => s.User)
                .FirstOrDefaultAsync(m => m.SujetId == id);
            if (sujet == null)
            {
                return NotFound();
            }
            return View(sujet);
        }
        // GET: Sujets/Create
        [Authorize]
        public IActionResult Create(int CatId)
        {
            //ici le param id = CatId
            ViewData["CatId"] = CatId;
            return View();
        }

        // POST: Sujets/Create
        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]       
        public async Task<IActionResult> Create([Bind("SujetId,CatId,UserId,SujetTexte,SujetDate,SujetView,SujetActif")] Sujet sujet)
        {
            //valeurs nullables je sais mais plus facile à gérer pour moi comme ça pour l'instant

            //sujet.CatId = ViewData["CatId"];  Comment ça ça marche pas c'est dur à suivre MVC
            sujet.SujetView = 0;
            sujet.SujetActif = true;
            sujet.SujetDate = DateTime.Now;
            sujet.UserId = User.FindFirstValue(ClaimTypes.NameIdentifier); //retourne l'id du user qui créer le sujet
            if (ModelState.IsValid)
            {
                _context.Add(sujet);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index_sujets_par_cat), new { id = sujet.CatId , pageIndex = 1});
            }
            return View(sujet);
        }

        // GET: Sujets/Edit/5
        [Authorize]
        public async Task<IActionResult> Edit(int? CatId, int SujetId, string? UserId)
        {
            ViewData["UserId"] = UserId;
            ViewData["CatId"] = CatId;
            ViewData["SujetId"] = SujetId;
            //seul l'utilisateur qui a créé le sujet peut l'éditer 
            if (User.FindFirstValue(ClaimTypes.NameIdentifier) == UserId)
            {
                if (_context.Sujets == null)
                {
                    return NotFound();
                }

                var sujet = await _context.Sujets.FindAsync(SujetId);
                if (sujet == null)
                {
                    return NotFound();
                }
                return View(sujet);
            }
            else 
            {
                  //Oou l'admin évidemment!
                if (User.IsInRole("zeMasterAdmin"))
                {
                    if (_context.Sujets == null)
                    {
                        return NotFound();
                    }

                    var sujet = await _context.Sujets.FindAsync(SujetId);
                    if (sujet == null)
                    {
                        return NotFound();
                    }
                    return View(sujet);
                }
            }           
            return RedirectToAction(nameof(Index_sujets_par_cat), new { id = CatId, pageIndex = 1 });
        }

        // POST: Sujets/Edit/5
        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int CatId, int SujetId, string UserId, [Bind("SujetId,CatId,UserId,SujetTexte,SujetDate,SujetView,SujetActif")] Sujet sujet)
        {
            //certaines valeurs nullables je sais mais plus facile à gérer pour moi comme ça pour l'instant
            sujet.UserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            ViewData["UserId"] = sujet.UserId;
            ViewData["CatId"] = CatId;
            ViewData["SujetId"] = SujetId;
            sujet.SujetActif = true;
            sujet.SujetDate = DateTime.Now;
            if (SujetId != sujet.SujetId)
            {
                return NotFound();
            }
            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(sujet);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SujetExists(sujet.SujetId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index_sujets_par_cat), new { id = CatId, pageIndex = 1 });
            }
            return View(sujet);
        }

        // GET: Sujets/Delete/5
        //Seul l'admin peut supprimer ldes sujets
        [Authorize(Roles = "zeMasterAdmin")]
        public async Task<IActionResult> Delete(int? CatId, int SujetId, string? UserId)
        {
            ViewData["CatId"] = CatId;
            ViewData["SujetId"] = SujetId;

                if (UserId == null || _context.Sujets == null)
                {
                    return NotFound();
                }

                var sujet = await _context.Sujets
                    .Include(s => s.Cat)
                    .Include(s => s.User)
                    .FirstOrDefaultAsync(m => m.SujetId == SujetId);
                if (sujet == null)
                {
                    return NotFound();
                }

                return View(sujet);
        }

        // POST: Sujets/Delete/5
        [HttpPost, ActionName("Delete")]
        [Authorize(Roles = "zeMasterAdmin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int SujetId)
        {
            if (_context.Sujets == null)
            {
                return Problem("Entity set 'Forum01Context.Sujets'  is null.");
            }
            var sujet = await _context.Sujets.FindAsync(SujetId);
            if (sujet != null)
            {
                //_context.Sujets.Remove(sujet);
                sujet.SujetActif = false;
            }
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index_sujets_par_cat), new { id = sujet?.CatId, pageIndex = 1 });          
        }

        private bool SujetExists(int SujetId)
        {
          return _context.Sujets.Any(e => e.SujetId == SujetId);
        }
    }
}
