using ProjectEND.Models;
using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Cryptography;

namespace ProjectEND.Controllers
{
    public class RoomBillController : Controller
      
    {
        private ProjectDEntities db = new ProjectDEntities();
        // GET: RoomBill
        public ActionResult Index()
        {
            var list = db.RoomBill.ToList();
            return View(list);
        }
        public ActionResult Billforuser()
        {
            var user = Session["USER"] as ProjectEND.Models.DataUser;
            var list = db.RoomBill.Where(x => x.Order.User_Id == user.User_id ).ToList();
            return View(list);
        }
        // GET: RoomBill/Create
        public ActionResult AddBill()
        {
            
            ViewBag.Order_id = new SelectList(db.Order,"Oder_Id", "Oder_Id");
            return View();
        }

        [HttpPost]
        public ActionResult AddBill(RoomBill bill,int? Order_id)
        {
            var odid = db.Order.Find(Order_id);
            ViewBag.Order_id = new SelectList(db.Order, "Oder_Id", "Oder_Id", bill.Order_Id);
            try {
                var last = db.RoomBill.OrderByDescending(c => c.RoomBill_Id).FirstOrDefault();
                if (last == null)
                {
                    bill.RoomBill_Id = 1;
                }
                else
                {
                    bill.RoomBill_Id = last.RoomBill_Id + 1;
                }
                bill.StaBill_id = 1;
                bill.Room_Price = Convert.ToInt32(odid.Room.CatePrice.RoomPrice);
                bill.Total_Price = bill.Ele + bill.Water + bill.Room_Price;
                db.RoomBill.Add(bill);
                db.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            catch 
            {
                if (Order_id != null)
                {
                    ViewBag.fname = odid.DataUser.User_FristName; 
                     ViewBag.lname=odid.DataUser.User_LastName;
                    ViewBag.room = odid.Room_Id;
                }
                return View();
            }
        }
        public ActionResult Edit(int id)
        {
            var ed = db.RoomBill.Find(id);
            ViewBag.Order_id = new SelectList(db.Order, "Oder_Id", "Oder_Id",ed.Order_Id);
            return View(ed);
        }

        // POST: Title/Edit/5
        [HttpPost]
        public ActionResult Edit(RoomBill edit)
        {
            try
            {
                db.Entry(edit).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                ViewBag.Order_id = new SelectList(db.Order, "Oder_Id", "Oder_Id");
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        // GET: RoomBill/Delete/5
        public ActionResult Delete(int id)
        {
            var del = db.RoomBill.Find(id);
            try {
                db.RoomBill.Remove(del);
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
