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
    public partial class UserMst : System.Web.UI.Page
    {
        Class1 obj = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            errlbl.Visible = false;
            SqlParameter uid = new SqlParameter("@UserId", SqlDbType.Int);

            txtUserId.Text = obj.scalar("UserIdMax", uid).ToString();
            txtUserId.Enabled = false;
            if (!Page.IsPostBack)
            {
                DropDownList1.DataBind();

                DropDownList1.Items.Insert(0, new ListItem("---Select----", string.Empty));

            }
            if (!Page.IsPostBack)
            {
                DropDownList2.DataBind();

                DropDownList2.Items.Insert(0, new ListItem("---Select----", string.Empty));

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string temp = null;
            if (FileUpload1.HasFile)
            {
                temp = "~/img/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(temp));
            }
            SqlParameter uid = new SqlParameter("@UserId", txtUserId.Text);
            SqlParameter uname = new SqlParameter("@Name", txtName.Text);
            SqlParameter sname = new SqlParameter("@StateId", DropDownList1.SelectedValue);
            SqlParameter cname = new SqlParameter("@CityId", DropDownList2.SelectedValue);
            SqlParameter cno = new SqlParameter("@ContactNo", txtContactNo.Text);
            SqlParameter umail = new SqlParameter("@EmailId", txtEmail.Text);
            SqlParameter username = new SqlParameter("@UserName", txtUserName.Text);
            SqlParameter upass = new SqlParameter("@Password", txtPassword.Text);
            SqlParameter uimg = new SqlParameter("@Img", temp);
            SqlParameter[] pdata = new SqlParameter[9] { uid, uname, sname, cname, cno,umail, username, upass, uimg};
            obj.x = obj.transaction("UserInsert", pdata);

            if (obj.x != 0)
            {
                errlbl.Visible = true;
                errlbl.Text = "Successfully Inserted";
                Response.Redirect("UserMst.aspx");
            }
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {
            SqlParameter username = new SqlParameter("@UserName", txtUserName.Text);
            obj.x = obj.check("UserNameCheck", username);

            if (obj.x != 0)
            {
                Label5.Visible = true;
                txtUserName.Text = string.Empty;
                txtUserName.Focus();

            }
        }
    }
}