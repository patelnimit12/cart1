<%@ Page Title="" Language="C#" MasterPageFile="~/UserSite/Site1.Master" AutoEventWireup="true" CodeBehind="ViewItem.aspx.cs" Inherits="WebApplication.ViewItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
        .auto-style2 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <table class="w-100">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
    </p>
    <p>
        <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="ItemId" DataSourceID="SqlDataSource1" ForeColor="#333333" RepeatColumns="3" RepeatDirection="Horizontal">
            <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <ItemTemplate>
                <table class="w-100">
                    <tr>
                        <td>Item Id</td>
                        <td>:</td>
                        <td>
                            <asp:Label ID="ItemIdLabel" runat="server" Text='<%# Eval("ItemId") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Item Name</td>
                        <td>:</td>
                        <td>
                            <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Description</td>
                        <td class="auto-style1">:</td>
                        <td class="auto-style1">
                            <asp:Label ID="ItemDescLabel" runat="server" Text='<%# Eval("ItemDesc") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Item Unit</td>
                        <td>:</td>
                        <td>
                            <asp:Label ID="ItemUnitLabel" runat="server" Text='<%# Eval("ItemUnit") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">SubCategory Name</td>
                        <td class="auto-style2">:</td>
                        <td class="auto-style2">
                            <asp:Label ID="SubCatNameLabel" runat="server" Text='<%# Eval("SubCatName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style2">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ItemImg") %>' Width="200px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<%#Eval("ItemId", "BuyMst.aspx?ItemId={0}")  %>'>Buy</asp:LinkButton>
                        </td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                    </tr>
                </table>
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT ItemMst.ItemId, ItemMst.ItemName, ItemMst.ItemDesc, ItemMst.ItemUnit, ItemMst.ItemImg, SubCatMst.SubCatName FROM ItemMst INNER JOIN SubCatMst ON ItemMst.SubCatId = SubCatMst.SubCatId"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
