using ProjectEND.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectEND.Reports
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private ProjectDEntities db = new ProjectDEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var data = db.ViewPayBill.ToList();
                var rd = new Microsoft.Reporting.WebForms.ReportDataSource("DataPayBill", data); // binding datatable
                ReportViewer3.LocalReport.ReportPath = Server.MapPath("~/Reports/Report3.rdlc");
                ReportViewer3.LocalReport.DataSources.Clear();
                ReportViewer3.LocalReport.DataSources.Add(rd);
            }
        }
    }
}