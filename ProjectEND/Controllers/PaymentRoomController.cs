using ProjectEND.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectEND.Controllers
{
    public class PaymentRoomController : Controller
    {
        private ProjectDEntities db = new ProjectDEntities();
        // GET: PaymentRoom
        public ActionResult Index()
        {
            var data = db.Payment.ToList();
            return View(data);
        }
        public ActionResult Pay(int id)
        {
            ViewBag.StaPay_Id = new SelectList(db.StatusPayment,"StaPay_Id","StaPay_Name");
            Session["OrderID"] = id;
            return View();
        }
        [HttpPost]
        public ActionResult Pay(Payment payroom)
        {
            if (payroom.Upfile != null)
            {
                byte[] Temp = new byte[payroom.Upfile.ContentLength];
                payroom.Upfile.InputStream.Read(Temp, 0, payroom.Upfile.ContentLength);
                payroom.Payment_Pic = Temp; // เนื้อภาพ
            }
            var user = Session["USER"] as ProjectEND.Models.DataUser;
            var UD = db.DataUser.Find(user.User_id);
            UD.Sta_User_id = 4;

            try
            {
                var last = db.Payment.OrderByDescending(c => c.Payment_Id).FirstOrDefault();
                if (last == null)
                {
                    payroom.Payment_Id = 1;
                }
                else
                {
                    payroom.Payment_Id = last.Payment_Id + 1;
                }
                db.Payment.Add(payroom);
                db.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
            catch (Exception)
            {
            }
            ViewBag.StaPay_Id = new SelectList(db.StatusPayment,"StaPay_Id","StaPay_Name");
            return View();
        }
        public ActionResult Confirm(int id)
        {
            var data = db.Payment.Find(id);
            data.Order.Sta_Id = 2;
            data.Order.DataUser.Sta_User_id = 3;
            data.Order.Room.StaRoom_ID = 2;
            db.SaveChanges();
            return RedirectToAction(nameof(Index));
        }
        public ActionResult Delete(int id)
        {
            var del = db.Payment.Find(id);
            try
            {
                db.Payment.Remove(del);
                db.SaveChanges();
                TempData["Com"] = true;
                return RedirectToAction(nameof(Index));
            }
            catch { TempData["ChkDelete"] = true; }
            return RedirectToAction(nameof(Index));


        }
        public ActionResult Detail(int id)
        {
            var de = db.Payment.Find(id);
            return View(de);
        }
    }
}