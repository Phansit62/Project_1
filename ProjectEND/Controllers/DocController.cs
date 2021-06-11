using ProjectEND.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectEND.Controllers
{
    public class DocController : Controller
    {
        private ProjectDEntities db = new ProjectDEntities();
        // GET: Doc
        public ActionResult Index()
        {
            return View(db.Dormitory);
        }
        // GET: Title/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Title/Create
        [HttpPost]
        public ActionResult Create(Dormitory cre)
        {
            try
            {
                db.Dormitory.Add(cre);
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
            var ed = db.Dormitory.Find(id);
            return View(ed);
        }

        // POST: Title/Edit/5
        [HttpPost]
        public ActionResult Edit(Dormitory edit)
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
            var del = db.Dormitory.Find(id);
            try
            {
                db.Dormitory.Remove(del);
                db.SaveChanges();
                TempData["Com"] = true;
                return RedirectToAction("Index");
            }
            catch
            {
                TempData["ChkDelete"] = true;
            }
            return RedirectToAction("Index");
        }
    }
}