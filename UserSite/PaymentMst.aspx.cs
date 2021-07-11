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
    public partial class PaymentMst : System.Web.UI.Page
    {
        Class1 obj = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtPaymentDate.Text = DateTime.Now.ToString("dd-MMM-yyyy").ToString();
            errlbl.Visible = false;

            SqlParameter pid = new SqlParameter("@PaymentId", SqlDbType.Int);

            txtPaymentId.Text = obj.scalar("PaymentIdMax", pid).ToString();
            txtPaymentId.Enabled = false;
            txtAmount.Text = Session["Amount"].ToString();
            txtBuyId.Text = Session["BuyId"].ToString();
            txtUserName.Text = Session["User"].ToString();


        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            SqlParameter pid = new SqlParameter("@PaymentId", txtPaymentId.Text);
            SqlParameter pdate = new SqlParameter("@PaymentDate", txtPaymentDate.Text);

            SqlParameter bid = new SqlParameter("@BuyId", txtBuyId.Text);
            SqlParameter uname = new SqlParameter("@UserName", txtUserName.Text);
            
            SqlParameter pamount = new SqlParameter("@Amount", txtAmount.Text);
            SqlParameter ptype = new SqlParameter("@PaymentType", DropDownList1.Text);
            SqlParameter[] pdata = new SqlParameter[6] { pid, pdate, bid, uname, pamount, ptype };
            obj.x = obj.transaction("PaymentInsert", pdata);

            if (obj.x != 0)
            {
                errlbl.Visible = true;
                errlbl.Text = "Successfully Inserted";
                Response.Redirect("Home.aspx");
            }
        }
    }
}