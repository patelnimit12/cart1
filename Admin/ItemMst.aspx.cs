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
    public partial class ItemMst : System.Web.UI.Page
    {
        Class1 obj = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            errlbl.Visible = false;
            SqlParameter iid = new SqlParameter("@ItemId", SqlDbType.Int);

            txtItemId.Text = obj.scalar("ItemIdMax", iid).ToString();
            txtItemId.Enabled = false;
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string temp=null;
            if(FileUpload1.HasFile)
            {
                temp = "~/img/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(temp));
            }
            SqlParameter iid = new SqlParameter("@ItemId", txtItemId.Text);
            SqlParameter iname = new SqlParameter("@ItemName", txtItemName.Text);
            SqlParameter idesc = new SqlParameter("@ItemDesc", txtItemDesc.Text);
            SqlParameter iunit = new SqlParameter("@ItemUnit", txtItemUnit.Text);
            SqlParameter iprice = new SqlParameter("@ItemPrice", txtItemPrice.Text);
            SqlParameter iimg = new SqlParameter("@ItemImg", temp);
            SqlParameter iscaname = new SqlParameter("@SubCatId", DropDownList1.SelectedValue);
            SqlParameter[] pdata = new SqlParameter[7] { iid, iname, idesc, iunit, iprice,iimg, iscaname };
            obj.x = obj.transaction("ItemInsert", pdata);

            if (obj.x != 0)
            {
                errlbl.Visible = true;
                errlbl.Text = "Successfully Inserted";
                Response.Redirect("ItemMst.aspx");
            }
        }

        protected void txtItemName_TextChanged(object sender, EventArgs e)
        {
            SqlParameter iname = new SqlParameter("@ItemName", txtItemName.Text);
            obj.x = obj.check("ItemNameCheck", iname);

            if (obj.x != 0)
            {
                Label5.Visible = true;
                txtItemName.Text = string.Empty;
                txtItemName.Focus();

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row;
            row = GridView1.SelectedRow;
            TextBox1.Text = row.Cells[1].Text;
            TextBox2.Text = row.Cells[2].Text;
            TextBox3.Text = row.Cells[3].Text;
            TextBox4.Text = row.Cells[5].Text;
        }
    }
}