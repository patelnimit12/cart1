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
    public partial class Login : System.Web.UI.Page
    {
        Class1 obj = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            errlbl.Visible = false;
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            int flag = 0;
            if (String.Compare("Admin", txtUserName.Text) == 0)
            {
                if (String.Compare("Admin", txtPassword.Text) == 0)
                {
                    flag = 1;
                    Session["Admin"] = txtUserName.Text;
                    Response.Redirect("~/Admin/StateMst.aspx");
                }
            }
            if (flag==0)
            {
                SqlParameter un = new SqlParameter("@UserName", txtUserName.Text);
                SqlParameter pw = new SqlParameter("@Password", txtPassword.Text);
                SqlParameter[] pdata = new SqlParameter[2] { un, pw };
                int x = obj.check1("LoginSp", pdata);
                if(x!=0)
                {
                    flag = 1;
                    Session["User"] = txtUserName.Text;
                    Response.Redirect("~/UserSite/ViewItem.aspx");
                }
            }

            if (flag == 0)
            {
                errlbl.Visible = true;
                errlbl.Text = "Invalid Info";
            }
        }
    }
}