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
    public partial class CityMst : System.Web.UI.Page
    {
        Class1 obj = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            errlbl.Visible = false;
            SqlParameter cid = new SqlParameter("@CityId", SqlDbType.Int);

            txtCityId.Text = obj.scalar("CityIdMax", cid).ToString();
            txtCityId.Enabled = false;
            Label5.Visible = false; //  (Already Exist
            if (!Page.IsPostBack)
            {
                DropDownList1.DataBind();

                DropDownList1.Items.Insert(0, new ListItem("---Select----", string.Empty));

            }



        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            SqlParameter cid = new SqlParameter("@CityId", txtCityId.Text);
            SqlParameter cname = new SqlParameter("@CityName", txtCityName.Text);
            SqlParameter sid = new SqlParameter("@StateId", DropDownList1.SelectedValue);
            SqlParameter[] pdata = new SqlParameter[3] { cid, cname, sid };
            obj.x = obj.transaction("CityInsert", pdata);

            if (obj.x != 0)
            {
                errlbl.Visible = true;
                errlbl.Text = "Successfully Inserted";
                GridView1.DataBind();
                Response.Redirect("CityMst.aspx");
            }

        }

        protected void txtCityName_TextChanged(object sender, EventArgs e)
        {
            SqlParameter cname = new SqlParameter("@CityName", txtCityName.Text);
            obj.x = obj.check("CityNameCheck", cname);

            if (obj.x != 0)
            {
                Label5.Visible = true;
                txtCityName.Text = string.Empty;
                txtCityName.Focus();

            }
        }
    }
}

    