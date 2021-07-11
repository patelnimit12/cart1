<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="ItemMst.aspx.cs" Inherits="WebApplication.ItemMst" %>
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
                <asp:Label ID="Label1" runat="server" Text="Item Form"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Item Id"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtItemId" runat="server" ValidationGroup="P2 "></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtItemId" ErrorMessage="Not Null" ForeColor="Red" SetFocusOnError="True" ValidationGroup="P2"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Item Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtItemName" runat="server" ValidationGroup="P2 " OnTextChanged="txtItemName_TextChanged"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtItemName" ErrorMessage="Not Null" ForeColor="Red" SetFocusOnError="True" ValidationGroup="P2"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Item Desc"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtItemDesc" runat="server" ValidationGroup="P2 "></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtItemDesc" ErrorMessage="Not Null" ForeColor="Red" SetFocusOnError="True" ValidationGroup="P2"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Item Unit"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtItemUnit" runat="server" ValidationGroup="P2 "></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtItemUnit" ErrorMessage="Not Null" ForeColor="Red" SetFocusOnError="True" ValidationGroup="P2"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Item Price"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtItemPrice" runat="server" ValidationGroup="P2 "></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtItemPrice" ErrorMessage="Not Null" ForeColor="Red" SetFocusOnError="True" ValidationGroup="P2"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Item Image"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="SubCategory Name"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="SubCatName" DataValueField="SubCatId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CatId], [SubCatId], [SubCatName] FROM [SubCatMst]"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
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
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ItemId" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                        <asp:BoundField DataField="ItemDesc" HeaderText="ItemDesc" SortExpression="ItemDesc" />
                        <asp:BoundField DataField="ItemPrice" HeaderText="ItemPrice" SortExpression="ItemPrice" />
                        <asp:BoundField DataField="ItemId" HeaderText="ItemId" ReadOnly="True" SortExpression="ItemId" />
                        <asp:BoundField DataField="ItemUnit" HeaderText="ItemUnit" SortExpression="ItemUnit" />
                        <asp:BoundField DataField="ItemImg" HeaderText="ItemImg" SortExpression="ItemImg" />
                        <asp:BoundField DataField="SubCatId" HeaderText="SubCatId" SortExpression="SubCatId" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [ItemMst] WHERE [ItemId] = @original_ItemId AND [ItemName] = @original_ItemName AND [ItemDesc] = @original_ItemDesc AND [ItemPrice] = @original_ItemPrice AND [ItemUnit] = @original_ItemUnit AND [ItemImg] = @original_ItemImg AND [SubCatId] = @original_SubCatId" InsertCommand="INSERT INTO [ItemMst] ([ItemName], [ItemDesc], [ItemPrice], [ItemId], [ItemUnit], [ItemImg], [SubCatId]) VALUES (@ItemName, @ItemDesc, @ItemPrice, @ItemId, @ItemUnit, @ItemImg, @SubCatId)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ItemName], [ItemDesc], [ItemPrice], [ItemId], [ItemUnit], [ItemImg], [SubCatId] FROM [ItemMst]" UpdateCommand="UPDATE [ItemMst] SET [ItemName] = @ItemName, [ItemDesc] = @ItemDesc, [ItemPrice] = @ItemPrice, [ItemUnit] = @ItemUnit, [ItemImg] = @ItemImg, [SubCatId] = @SubCatId WHERE [ItemId] = @original_ItemId AND [ItemName] = @original_ItemName AND [ItemDesc] = @original_ItemDesc AND [ItemPrice] = @original_ItemPrice AND [ItemUnit] = @original_ItemUnit AND [ItemImg] = @original_ItemImg AND [SubCatId] = @original_SubCatId">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ItemId" Type="Int32" />
                        <asp:Parameter Name="original_ItemName" Type="String" />
                        <asp:Parameter Name="original_ItemDesc" Type="String" />
                        <asp:Parameter Name="original_ItemPrice" Type="Int32" />
                        <asp:Parameter Name="original_ItemUnit" Type="String" />
                        <asp:Parameter Name="original_ItemImg" Type="String" />
                        <asp:Parameter Name="original_SubCatId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ItemName" Type="String" />
                        <asp:Parameter Name="ItemDesc" Type="String" />
                        <asp:Parameter Name="ItemPrice" Type="Int32" />
                        <asp:Parameter Name="ItemId" Type="Int32" />
                        <asp:Parameter Name="ItemUnit" Type="String" />
                        <asp:Parameter Name="ItemImg" Type="String" />
                        <asp:Parameter Name="SubCatId" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ItemName" Type="String" />
                        <asp:Parameter Name="ItemDesc" Type="String" />
                        <asp:Parameter Name="ItemPrice" Type="Int32" />
                        <asp:Parameter Name="ItemUnit" Type="String" />
                        <asp:Parameter Name="ItemImg" Type="String" />
                        <asp:Parameter Name="SubCatId" Type="Int32" />
                        <asp:Parameter Name="original_ItemId" Type="Int32" />
                        <asp:Parameter Name="original_ItemName" Type="String" />
                        <asp:Parameter Name="original_ItemDesc" Type="String" />
                        <asp:Parameter Name="original_ItemPrice" Type="Int32" />
                        <asp:Parameter Name="original_ItemUnit" Type="String" />
                        <asp:Parameter Name="original_ItemImg" Type="String" />
                        <asp:Parameter Name="original_SubCatId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
