using ProjectEND.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectEND.Controllers
{
    public class PaymentBillController : Controller
    {
        private ProjectDEntities db = new ProjectDEntities();
        // GET: PaymentBill
        public ActionResult Index()
        {
            var paylist = db.PaymentRoomBill.ToList();
            return View(paylist);
        }
        public ActionResult Pay(int id)
        {
            ViewBag.StaPayBill_id = new SelectList(db.StatusPayment, "StaPay_Id", "StaPay_Name");
            Session["PayId"] = id;
            return View();
        }
        [HttpPost]
        public ActionResult Pay(PaymentRoomBill paybill)
        {
            if (paybill.Upfile != null)
            {
                byte[] Temp = new byte[paybill.Upfile.ContentLength];
                paybill.Upfile.InputStream.Read(Temp, 0, paybill.Upfile.ContentLength);
                paybill.PaymentPic = Temp; // เนื้อภาพ
            }

            try
            {
                var last = db.PaymentRoomBill.OrderByDescending(c => c.PaymentBill_Id).FirstOrDefault();
                if (last == null)
                {
                    paybill.PaymentBill_Id = 1;
                }
                else
                {
                    paybill.PaymentBill_Id = last.PaymentBill_Id + 1;
                }
                db.PaymentRoomBill.Add(paybill);
                db.SaveChanges();
                return RedirectToAction("Billforuser", "RoomBill");
            }
            catch (Exception)
            {
            }
            ViewBag.StaPayBill_id = new SelectList(db.StatusPayment, "StaPay_Id", "StaPay_Name");
            return View();
        }
        public ActionResult Confirm(int id)
        {
            var data = db.PaymentRoomBill.Find(id);
            data.RoomBill.StaBill_id = 2;
            db.SaveChanges();
            return RedirectToAction(nameof(Index));
        }
        public ActionResult Delete(int id)
        {
            var del = db.PaymentRoomBill.Find(id);
            try
            {
                db.PaymentRoomBill.Remove(del);
                db.SaveChanges();
                TempData["Com"] = true;
                return RedirectToAction(nameof(Index));

            }
            catch
            {
                TempData["ChkDelete"] = true;
            }
            return RedirectToAction(nameof(Index));

        }
        public ActionResult Detail(int id)
        {
            var de = db.PaymentRoomBill.Find(id);
            return View(de);
        }
    }
}