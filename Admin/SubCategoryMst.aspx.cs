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
    public partial class SubCategoryMst : System.Web.UI.Page
    {
        Class1 obj = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            errlbl.Visible = false;
            SqlParameter scaid = new SqlParameter("@SubCatId", SqlDbType.Int);

            txtSubCatId.Text = obj.scalar("SubCatIdMax", scaid).ToString();
            txtSubCatId.Enabled = false;
            Label5.Visible = false; //  (Already Exist
            if (!Page.IsPostBack)
            {
                DropDownList1.DataBind();

                DropDownList1.Items.Insert(0, new ListItem("---Select----", string.Empty));

            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            SqlParameter scaid = new SqlParameter("@SubCatId", txtSubCatId.Text);
            SqlParameter scaname = new SqlParameter("@SubCatName", txtSubCatName.Text);
            SqlParameter caid = new SqlParameter("@CatId", DropDownList1.SelectedValue);
            SqlParameter[] pdata = new SqlParameter[3] { scaid, scaname, caid };
            obj.x = obj.transaction("SubCatInsert", pdata);

            if (obj.x != 0)
            {
                errlbl.Visible = true;
                errlbl.Text = "Successfully Inserted";
                GridView1.DataBind();
                Response.Redirect("SubCategoryMst.aspx");
            }
        }

        protected void txtSubCatName_TextChanged(object sender, EventArgs e)
        {
            SqlParameter scaname = new SqlParameter("@SubCatName", txtSubCatName.Text);
            obj.x = obj.check("SubCatNameCheck", scaname);

            if (obj.x != 0)
            {
                Label5.Visible = true;
                txtSubCatName.Text = string.Empty;
                txtSubCatName.Focus();

            }
        }
    }
}