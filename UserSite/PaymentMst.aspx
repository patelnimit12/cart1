<%@ Page Title="" Language="C#" MasterPageFile="~/UserSite/Site1.Master" AutoEventWireup="true" CodeBehind="PaymentMst.aspx.cs" Inherits="WebApplication.PaymentMst" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Payment Form"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Payment Id"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPaymentId" runat="server" ValidationGroup="P2"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPaymentId" ErrorMessage="Not Null" ForeColor="Red" SetFocusOnError="True" ValidationGroup="P2 "></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Payment Date"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPaymentDate" runat="server" ValidationGroup="P2"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtPaymentDate" ErrorMessage="Not Null" ForeColor="Red" SetFocusOnError="True" ValidationGroup="P2 "></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Buy Id"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBuyId" runat="server" ValidationGroup="P2"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtBuyId" ErrorMessage="Not Null" ForeColor="Red" SetFocusOnError="True" ValidationGroup="P2 "></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="UserName"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server" ValidationGroup="P2"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtUserName" ErrorMessage="Not Null" ForeColor="Red" SetFocusOnError="True" ValidationGroup="P2 "></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Amount"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAmount" runat="server" ValidationGroup="P2"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="txtAmount" ErrorMessage="Not Null" ForeColor="Red" SetFocusOnError="True" ValidationGroup="P2 "></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Payment Type"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Cash</asp:ListItem>
                    <asp:ListItem>Card</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="errlbl" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
