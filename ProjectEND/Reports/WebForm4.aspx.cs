using ProjectEND.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectEND.Reports
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        private ProjectDEntities db = new ProjectDEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var data = db.ViewOrder.ToList();
                var rd = new Microsoft.Reporting.WebForms.ReportDataSource("Order", data); // binding datatable
                ReportViewer4.LocalReport.ReportPath = Server.MapPath("~/Reports/Report4.rdlc");
                ReportViewer4.LocalReport.DataSources.Clear();
                ReportViewer4.LocalReport.DataSources.Add(rd);
            }
        }
    }
}