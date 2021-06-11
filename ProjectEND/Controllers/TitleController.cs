using ProjectEND.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectEND.Controllers
{
    public class TitleController : Controller
    {
        private ProjectDEntities db = new ProjectDEntities();
        // GET: Title
        public ActionResult Index()
        {
            return View(db.Title);
        }


        // GET: Title/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Title/Create
        [HttpPost]
        public ActionResult Create(Title cre)
        {
            try
            {
                db.Title.Add(cre);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Title/Edit/5
        public ActionResult Edit(int id)
        {
            var ed = db.Title.Find(id);
            return View(ed);
        }

        // POST: Title/Edit/5
        [HttpPost]
        public ActionResult Edit(Title edit)
        {
            try
            {
                db.Entry(edit).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Title/Delete/5
        public ActionResult Delete(int id)
        {
            try
            {
                var del = db.Title.Find(id);
                db.Title.Remove(del);
                db.SaveChanges();
                TempData["Com"] = true;
                return RedirectToAction("Index");
            }
            catch {
                TempData["ChkDelete"] = true;
            }
            return RedirectToAction("Index");
        }
    }
}
