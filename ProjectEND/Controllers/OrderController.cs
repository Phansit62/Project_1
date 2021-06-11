using ProjectEND.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace ProjectEND.Controllers
{
    
    public class OrderController : Controller
    {
        private ProjectDEntities db = new ProjectDEntities();
        // GET: Order
        public ActionResult Index()
        {
            var li = db.Order.ToList();
            return View(li);
        }
        public ActionResult AddOrder(Order dataorder, int id)
        {
            var user = Session["USER"] as ProjectEND.Models.DataUser;
            var RD = db.Room.Find(id);
            var UD = db.DataUser.Find(user.User_id);
            var last = db.Order.OrderByDescending(c => c.Oder_Id).FirstOrDefault();
            if (last == null)
            {
                dataorder.Oder_Id = 1;
            }
            else
            {
                dataorder.Oder_Id = last.Oder_Id + 1;
            }
            dataorder.User_Id = user.User_id;
            dataorder.Date_In = Convert.ToDateTime(DateTime.Now.ToString("yyyy/MM/dd"));
            dataorder.Sta_Id = 1;
            dataorder.Room_Id = id;
            RD.StaRoom_ID = 3;
            UD.Sta_User_id = 2;
            db.Order.Add(dataorder);
            db.SaveChanges();
            return RedirectToAction("Pay","PaymentRoom",new { id = dataorder.Oder_Id});
        }
        public ActionResult Delete(int id)
        {
            var del = db.Order.Find(id);
            try
            {
                del.Room.StaRoom_ID = 1;
                del.DataUser.Sta_User_id = 1;
                db.Order.Remove(del);
                db.SaveChanges();
                TempData["Com"] = true;
                return RedirectToAction(nameof(Index));
            }
            catch(Exception) {
                TempData["ChkDelete"] = true;
            }
            return RedirectToAction("Index");
        }
    }
}