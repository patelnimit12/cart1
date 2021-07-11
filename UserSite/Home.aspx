<%@ Page Title="" Language="C#" MasterPageFile="~/UserSite/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication.UserSite.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <table class="w-100">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="UserId" DataSourceID="SqlDataSource1" ForeColor="#333333" RepeatColumns="3" RepeatDirection="Horizontal">
        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <ItemTemplate>
            <table class="w-100">
                <tr>
                    <td>ID</td>
                    <td>:</td>
                    <td>
                        <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td>:</td>
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Contact No</td>
                    <td>:</td>
                    <td>
                        <asp:Label ID="ContactNoLabel" runat="server" Text='<%# Eval("ContactNo") %>' />
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>:</td>
                    <td>
                        <asp:Label ID="EmailIdLabel" runat="server" Text='<%# Eval("EmailId") %>' />
                    </td>
                </tr>
                <tr>
                    <td>State Name</td>
                    <td>:</td>
                    <td>
                        <asp:Label ID="StateNameLabel" runat="server" Text='<%# Eval("StateName") %>' />
                    </td>
                </tr>
                <tr>
                    <td>City Name</td>
                    <td>:</td>
                    <td style="margin-left: 40px">
                        <asp:Label ID="CityNameLabel" runat="server" Text='<%# Eval("CityName") %>' />
                    </td>
                </tr>
            </table>
            <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("Img") %>' Width="200px" />
            <br />
            <br />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT UserMst.UserId, UserMst.Name, UserMst.ContactNo, UserMst.EmailId, UserMst.Img, StateMst.StateName, CityMst.CityName FROM UserMst INNER JOIN StateMst ON UserMst.StateId = StateMst.StateId INNER JOIN CityMst ON UserMst.CityId = CityMst.CityId WHERE (UserMst.UserName = @Param1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" Name="Param1" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>
<p>
</p>
</asp:Content>
