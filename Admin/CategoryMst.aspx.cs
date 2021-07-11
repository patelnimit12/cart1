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
    public partial class CategoryMst : System.Web.UI.Page
    {
        Class1 obj = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            errlbl.Visible = false;
            SqlParameter cid = new SqlParameter("@CatId", SqlDbType.Int);

            txtCatId.Text = obj.scalar("CatIdMax", cid).ToString();
            txtCatId.Enabled = false;
            Label4.Visible = false; //  (Already Exist)
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlParameter cid = new SqlParameter("@CatId", txtCatId.Text);
            SqlParameter cname = new SqlParameter("@CatName", txtCatName.Text);

            SqlParameter[] pdata = new SqlParameter[2] { cid, cname };
            obj.x = obj.transaction("CatInsert", pdata);

            if (obj.x != 0)
            {
                errlbl.Visible = true;
                errlbl.Text = "Successfully Inserted";
            }
        }

        protected void txtCatName_TextChanged(object sender, EventArgs e)
        {
            SqlParameter cname = new SqlParameter("@CatName", txtCatName.Text);
            obj.x = obj.check("CatNameCheck", cname);

            if (obj.x != 0)
            {
                Label4.Visible = true;
                txtCatName.Text = string.Empty;
                txtCatName.Focus();

            }
        }
    }
}