using ProjectEND.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectEND.Controllers
{
    public class RoomController : Controller
    {
        private ProjectDEntities db = new ProjectDEntities();
        // GET: Room
        public ActionResult Index(int? Doc_id,int? CateP_id)
        {
            ViewBag.Doc_id = new SelectList(db.Dormitory, "Doc_id", "Doc_Name");
            ViewBag.CateP_id = new SelectList(db.CatePrice, "CateP_id", "RoomPrice");
            if (Doc_id != null && CateP_id == null )
            {
                var li = db.Room.Where(x => x.Doc_id == Doc_id && x.StaRoom_ID == 1).ToList();
                return View(li);

            }
            else if (Doc_id == null && CateP_id != null)
            {
                var li = db.Room.Where(x => x.CateP_id == CateP_id && x.StaRoom_ID == 1).ToList();
                return View(li);

            }
            else if (Doc_id != null)
            {
                var li = db.Room.Where(x => x.Doc_id == Doc_id && x.CateP_id == CateP_id && x.StaRoom_ID == 1).ToList();
                return View(li);
            }
            else 
            {
                var d = db.Room.ToList();
                return View(d);
            }
                        
        }
        public ActionResult Admin_Index()
        {
            var li = db.Room.ToList();
            return View(li);
        }
        public ActionResult Create()
        {
            ViewBag.CateP_id = new SelectList(db.CatePrice, "CateP_id", "RoomPrice");
            ViewBag.Doc_id = new SelectList(db.Dormitory, "Doc_id", "Doc_Name");
            return View();
        }
        [HttpPost]
        public ActionResult Create(Room addrooms, int num)
        {
            
            for (var i = 0; i < num; i++)
            {
                var last = db.Room.OrderByDescending(c => c.Room_num).FirstOrDefault();
                if (last != null)
                  {
                   addrooms.Room_num = last.Room_num + 1; 
                  }
                else
                  {
                   addrooms.Room_num = 1;
                  }
                    addrooms.StaRoom_ID = 1;
                db.Room.Add(addrooms);
                db.SaveChanges();
   
            }
            ViewBag.CateP_id = new SelectList(db.CatePrice, "CateP_id", "RoomPrice");
            ViewBag.Doc_id = new SelectList(db.Dormitory, "Doc_id", "Doc_Name");
            return RedirectToAction(nameof(Admin_Index));
        }
        public ActionResult Edit(int id)
        {
            var find = db.Room.Find(id);
            ViewBag.CateP_id = new SelectList(db.CatePrice, "CateP_id", "RoomPrice",find.CateP_id);
            ViewBag.StaRoom_id = new SelectList(db.StatusRoom, "StaRoom_Id", "StaRoom_Type", find.StaRoom_ID);
            ViewBag.Doc_id = new SelectList(db.Dormitory, "Doc_id", "Doc_Name",find.Doc_id);
            return View(find);
        }
        [HttpPost]
        public ActionResult Edit(Room edit)
        {
                db.Entry(edit).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            ViewBag.CateP_id = new SelectList(db.CatePrice, "CateP_id", "RoomPrice");
            ViewBag.StaRoom_id = new SelectList(db.StatusRoom, "StaRoom_Id", "StaRoom_Type");
            ViewBag.Doc_id = new SelectList(db.Dormitory, "Doc_id", "Doc_Name");
            return RedirectToAction(nameof(Admin_Index));
        }
        public ActionResult Delete(int id)
        { 
            var del = db.Room.Find(id);
            try
            {
                db.Room.Remove(del);
                db.SaveChanges();
                TempData["Com"] = true;
                return RedirectToAction(nameof(Admin_Index));
            }
            catch 
            {
                TempData["ChkDelete"] = true;
            }
            return RedirectToAction("Admin_Index");
        }
    }
}