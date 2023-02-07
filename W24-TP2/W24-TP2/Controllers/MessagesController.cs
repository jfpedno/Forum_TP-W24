using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using W24_TP2.Models;
using W24_TP2.ViewModels;
using W24_TP2.Tools;

namespace W24_TP2.Controllers
{
    public class MessagesController : Controller
    {
        private readonly Forum01Context _context;

        public MessagesController(Forum01Context context)
        {
            _context = context;
        }

        //GET: Messages
        public async Task<IActionResult> Index()
        {
            var forum01Context = _context.Messages.Include(m => m.Sujet).Include(m => m.User);
            return View(await forum01Context.ToListAsync());
        }

        public async Task<IActionResult> Index_mess_par_suj(int id, int MsgId, int? pageIndex)
        {
            /* C'est ici que je voulais ajouter le décompte des vues
             * Pourquoi ça ne fonctionne pas ? c ben compiquer my god!
            int SujetId = id;
            SujetId = SujetId;
            var sujet = await _context.Sujets.FindAsync(SujetId);
            sujet.SujetView = sujet.SujetView + 1;
            _context.Update(sujet);
            await _context.SaveChangesAsync();
            */
            var pageSize = 4;
            var mesMessages2 = _context.Messages.AsQueryable();
            if (User.IsInRole("zeMasterAdmin") == false)
            {
                mesMessages2 = mesMessages2.Where(s => s.MsgActif).Where(m => m.SujetId == id);
            }
            var mesMessages = mesMessages2.Include(m => m.Sujet).Include(m => m.User).Select
            (m => new MonMessage
            {
                MsgId = m.MsgId,
                UserName = m.User.UserName,
                MsgDate = m.MsgDate,
                MsgTexte = m.MsgText,
                MsgActif = m.MsgActif,
                SujetId = m.SujetId,
                UserId = m.User.Id

            });
            return View(await PaginatedList<MonMessage>.CreateAsync(mesMessages, pageIndex ??= 1, pageSize));
        }

        // GET: Messages/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Messages == null)
            {
                return NotFound();
            }
            var message = await _context.Messages
                .Include(m => m.Sujet)
                .Include(m => m.User)
                .FirstOrDefaultAsync(m => m.MsgId == id);
            if (message == null)
            {
                return NotFound();
            }
            return View(message);
        }

        // GET: Messages/Create
        [Authorize]
        public IActionResult Create(int SujetId)
        {
            ViewData["SujetId"] = SujetId;

            return View();
        }

        // POST: Messages/Create
        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MsgId,SujetId,UserId,MsgActif,MsgText,MsgDate,MsgView")] Message message)
        {
            message.MsgActif = true;
            ViewData["MsgActif"] = message.MsgActif;
            message.MsgDate = DateTime.Now;
            message.MsgView = 0;
            message.UserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            if (ModelState.IsValid)
            {               
                ViewData["SujetId"] = message.SujetId;
                ViewData["UserId"] = message.UserId;                
                ViewData["MsgView"] = message.MsgView;
                _context.Add(message);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index_mess_par_suj), new { id = message.SujetId, MsgId = message.MsgId, pageIndex = 1 });
            }
            
            return View(message);
        }

        // GET: Messages/Edit/5
        [Authorize]
        public async Task<IActionResult> Edit(int? MsgId, int SujetId, string UserId)
        {
            ViewData["UserId"] = UserId;
            ViewData["MsgId"] = MsgId;
            ViewData["SujetId"] = SujetId;
            //On peut modifier seulement si on a créer le message
            if (User.FindFirstValue(ClaimTypes.NameIdentifier) == UserId)
            {
                if (MsgId == null || _context.Messages == null)
                {
                    return NotFound();
                }

                var message = await _context.Messages.FindAsync(MsgId);
                if (message == null)
                {
                    return NotFound();
                }
                return View(message);
            }
            //Ou si on est admin
            else if (User.IsInRole("zeMasterAdmin"))
            {
                if (MsgId == null || _context.Messages == null)
                {
                    return NotFound();
                }

                var message = await _context.Messages.FindAsync(MsgId);
                if (message == null)
                {
                    return NotFound();
                }
                return View(message);
            }
                return RedirectToAction(nameof(Index_mess_par_suj), new { id = SujetId, MsgId, pageIndex = 1 });
        }

        // POST: Messages/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int MsgId, int SujetId, [Bind("MsgId,SujetId,UserId,MsgActif,MsgText,MsgDate,MsgView")] Message message)
        {
            ViewData["SujetId"] = SujetId;
            ViewData["MsgId"] = MsgId;
            if (MsgId != message.MsgId)
            {
                return NotFound();
            }

            message.MsgActif = true;
            message.MsgDate = DateTime.Now;

            if (ModelState.IsValid)
            {
                ViewData["MsgDate"] = message.MsgDate;
                try
                {
                    _context.Update(message);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MessageExists(message.MsgId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index_mess_par_suj), new { id = SujetId, MsgId, pageIndex = 1 });
            }
            return View(message);
        }

        // GET: Messages/Delete/5
        [Authorize]
        public async Task<IActionResult> Delete(int? MsgId, int SujetId, string UserId)
        {

            ViewData["UserId"] = UserId;
            ViewData["sujetId"] = SujetId;
            ViewData["MsGIdId"] = MsgId;
            //On peut supprimer sin on est admin
            if (User.IsInRole("zeMasterAdmin"))
            {
                if (MsgId == null || _context.Messages == null)
                {
                    return NotFound();
                }

                var message = await _context.Messages
                    .Include(m => m.Sujet)
                    .Include(m => m.User)
                    .FirstOrDefaultAsync(m => m.MsgId == MsgId);
                if (message == null)
                {
                    return NotFound();
                }

                return View(message);
                //return RedirectToAction(nameof(Index_mess_par_suj), new { id = SujetId, pageIndex = 1 });
            }
            //Ou si on est celui qui a créer le message
            else if(User.FindFirstValue(ClaimTypes.NameIdentifier) == UserId)
            {
                if (MsgId == null || _context.Messages == null)
                {
                    return NotFound();
                }

                var message = await _context.Messages
                    .Include(m => m.Sujet)
                    .Include(m => m.User)
                    .FirstOrDefaultAsync(m => m.MsgId == MsgId);
                if (message == null)
                {
                    return NotFound();
                }

                return View(message);
            }

            return RedirectToAction(nameof(Index_mess_par_suj), new { id = SujetId, MsgId, pageIndex = 1 });
        }

        // POST: Messages/Delete/5
        [HttpPost, ActionName("Delete")]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int MsgId, int SujetId)
        {
            ViewData["MsgId"] = MsgId;
            ViewData["SujetId"] = SujetId;
            if (_context.Messages == null)
            {
                return Problem("Entity set 'Forum01Context.Messages'  is null.");
            }
            var message = await _context.Messages.FindAsync(MsgId);
            if (message != null)
            {
                //_context.Messages.Remove(message);
                message.MsgActif = false;
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index_mess_par_suj), new { id = SujetId, SujetId, pageIndex = 1 });
        } 

        private bool MessageExists(int MsgId)
        {
          return _context.Messages.Any(e => e.MsgId == MsgId);
        }
    }
}
