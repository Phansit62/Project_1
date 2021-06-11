using ProjectEND.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProjectEND.Controllers
{
    public class AccountController : Controller
    {
        private ProjectDEntities db = new ProjectDEntities();
        // GET: Account
        public ActionResult Login()
        {
            ViewBag.Title_id = new SelectList(db.Title, "Title_id", "Title_name");
            return View();
        }
        [HttpPost]
        public ActionResult Login(DataUser login)

        {
           
            var admin = db.Admin.Where(p => p.Admin_Id == login.User_id && p.Admin_Pass == login.Password).FirstOrDefault();
            var result = db.DataUser.Where(p => p.User_id == login.User_id && p.Password == login.Password).FirstOrDefault();
            try
            {
                if (admin != null)
                {
                    Session["Admin"] = admin;
                    return RedirectToAction("Register", "Account");
                }
                if (result != null)
                {
                    Session["USER"] = result;
                    return RedirectToAction("Index", "Home");
                }
                if (result == null)
                {
                    TempData["Chklog"] = true;
                }
            } catch(Exception) 
            {
                
            }
            ViewBag.Title_id = new SelectList(db.Title, "Title_id", "Title_name");
            return RedirectToAction("Login");
        }
        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }
        public ActionResult Register()
        {
            ViewBag.Title_id = new SelectList(db.Title, "Title_id", "Title_name");
            var Li = db.DataUser.ToList();
            return View(Li);
        }
        [HttpPost]
        public ActionResult Register(DataUser Register)
        {
            if (Register.Upfile != null)
            {
                byte[] Temp = new byte[Register.Upfile.ContentLength];
                Register.Upfile.InputStream.Read(Temp, 0, Register.Upfile.ContentLength);
                Register.User_Image = Temp; // เนื้อภาพ
            }
            try
            {
                Register.Sta_User_id = 1;
                //Register.Title_id = 1;
                db.DataUser.Add(Register);
                db.SaveChanges();
                return RedirectToAction("Index", "Home");
            }catch(Exception) {
                TempData["Chkdup"] = true;
            }
            ViewBag.Title_id = new SelectList(db.Title, "Title_id", "Title_name",Register.Title_id);
            return RedirectToAction("Login");
        }
        public ActionResult Delete(string id)
        {
            var del = db.DataUser.Find(id);
            try {

                db.DataUser.Remove(del);
                db.SaveChanges();
                TempData["Com"] = true;
                return RedirectToAction(nameof(Register));
            } catch (Exception) 
            {
                TempData["ChkDelete"] = true;
            }
            return RedirectToAction("Register");
        }
        public ActionResult ProfileDe(string id)
        {
            var pro = db.DataUser.Find(id);
            return View(pro);
        }
        public ActionResult ProfileEdit(string id)
        {
            var pro = db.DataUser.Find(id);
            ViewBag.Title_id = new SelectList(db.Title, "Title_id", "Title_name");
            return View(pro);
        }
        [HttpPost] 
        public ActionResult ProfileEdit(DataUser edit)
        {
            if (edit.Upfile != null)
            {
                byte[] Temp = new byte[edit.Upfile.ContentLength];
                edit.Upfile.InputStream.Read(Temp, 0, edit.Upfile.ContentLength);
                edit.User_Image = Temp; // เนื้อภาพ
            }
            db.Entry(edit).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            ViewBag.Title_id = new SelectList(db.Title, "Title_id", "Title_name");
            return RedirectToAction("ProfileDe",new {id=edit.User_id });
        }
    }
}