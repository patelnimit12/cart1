using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication
{
    public partial class Date : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlParameter Idate = new SqlParameter("@IDate", TextBox1.Text);
            Class1 obj = new Class1();
            DataSet ds = new DataSet();
            ds = obj.FetchAll("IDateSp", Idate);
            GridView2.DataSource = ds;
            GridView2.DataBind();
            Label1.Text = "Hi";
            GridView2.Visible = true;
        }
    }
}