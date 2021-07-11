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
    public partial class StateMst : System.Web.UI.Page
    {
        Class1 obj = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            errlbl.Visible = false;
            SqlParameter sid = new SqlParameter("@StateId", SqlDbType.Int);

            txtStateId.Text = obj.scalar("StateIdMax", sid).ToString();
            txtStateId.Enabled = false;
            Label4.Visible = false; //  (Already Exist)

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            SqlParameter sid = new SqlParameter("@StateId", txtStateId.Text);
            SqlParameter sname = new SqlParameter("@StateName", txtStateName.Text);

            SqlParameter[] pdata = new SqlParameter[2] { sid, sname };
            obj.x = obj.transaction("StateInsert", pdata);

            if (obj.x != 0)
            {
                errlbl.Visible = true;
                errlbl.Text = "Successfully Inserted";
                GridView1.DataBind();
                Response.Redirect("StateMst.aspx");
            }

        }

        protected void txtStateName_TextChanged(object sender, EventArgs e)
        {
            SqlParameter sname = new SqlParameter("@StateName", txtStateName.Text);
            obj.x = obj.check("StateNameCheck", sname);

            if (obj.x != 0)
            {
                Label4.Visible = true;
                txtStateName.Text = string.Empty;
                txtStateName.Focus();
            }

        }
    }
}