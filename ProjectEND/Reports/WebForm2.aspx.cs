using ProjectEND.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectEND.Reports
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private ProjectDEntities db = new ProjectDEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                var data = db.ViewPayment.ToList();
                var rd = new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", data); // binding datatable
                ReportViewer2.LocalReport.ReportPath = Server.MapPath("~/Reports/Report5.rdlc");
                ReportViewer2.LocalReport.DataSources.Clear();
                ReportViewer2.LocalReport.DataSources.Add(rd);
            }
        }
    }
}