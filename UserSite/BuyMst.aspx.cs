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
    public partial class BuyMst : System.Web.UI.Page
    {
        Class1 obj = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtBuyDate.Text = DateTime.Now.ToString("dd-MMM-yyyy").ToString();
            errlbl.Visible = false;
            SqlParameter bid = new SqlParameter("@BuyId", SqlDbType.Int);

            txtBuyId.Text = obj.scalar("BuyIdMax", bid).ToString();
            txtBuyId.Enabled = false;
            int itemid = Convert.ToInt32(Request.QueryString[0]);
            SqlParameter iid = new SqlParameter("@ItemId", itemid);
            SqlParameter iname = new SqlParameter("@ItemName", SqlDbType.VarChar, 30);
            SqlParameter rate = new SqlParameter("@Rate", SqlDbType.Int);
            SqlParameter iid1 = new SqlParameter("@ItemId", itemid);
            SqlParameter[] pdata = new SqlParameter[2] { iid, iname };
            SqlParameter[] pdata1 = new SqlParameter[2] { iid1, rate };

            txtItemName.Text = obj.fetchname("ItemName", pdata).ToString();
            txtRate.Text = obj.fetchrate("ItemRate", pdata1).ToString();
            txtUserName.Text = Session["User"].ToString();
            Session["Amount"] = txtAmount.Text;
            Session["BuyId"] = txtBuyId.Text;
            Session["User"] = txtUserName.Text;
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            SqlParameter bid = new SqlParameter("@BuyId", txtBuyId.Text);
            SqlParameter bdate = new SqlParameter("@BuyDate", txtBuyDate.Text);
            
            SqlParameter iname = new SqlParameter("@ItemName", txtItemName.Text);
            SqlParameter bqty = new SqlParameter("@QTY", txtQty.Text);
            SqlParameter brate = new SqlParameter("@Rate", txtRate.Text);
            SqlParameter bamount = new SqlParameter("@Amount", txtAmount.Text);
            SqlParameter username = new SqlParameter("@UserName", txtUserName.Text);
            SqlParameter[] pdata = new SqlParameter[7] { bid, bdate, iname, bqty, brate, bamount, username};
            obj.x = obj.transaction("BuyInsert", pdata);

            if (obj.x != 0)
            {
                errlbl.Visible = true;
                errlbl.Text = "Successfully Inserted";
                Response.Redirect("PaymentMst.aspx");
            }
        }

        protected void txtQty_TextChanged(object sender, EventArgs e)
        {
            int amount;
            amount = (Convert.ToInt32(txtQty.Text) * Convert.ToInt32(txtRate.Text));
            txtAmount.Text = amount.ToString();
        }
    }
}