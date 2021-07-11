using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication.Admin
{
    public partial class Report1 : System.Web.UI.Page
    {
        Class1 obj = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlParameter sum = new SqlParameter("Sum", SqlDbType.Int);
            SqlParameter iname = new SqlParameter("@ItemName", DropDownList2.SelectedValue);
            SqlParameter[] pdata = new SqlParameter[2] { sum, iname};
            

            DropDownList2.Text = obj.fetchrate("SumAmount", pdata).ToString();
        }
    }
}