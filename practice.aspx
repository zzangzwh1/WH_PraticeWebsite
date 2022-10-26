<%@ Page Language="C#" AutoEventWireup="true" CodeFile="practice.aspx.cs" Inherits="practice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <header>
        <h1>practice</h1>
    </header>
    <hr />
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
            
            </asp:DropDownList>
                
            <asp:Button Text="Show Prodcucts" runat="server" id="_btnShowProduct" OnClick="_btnShowProduct_Click" />
             <asp:Button Text="Edit Employee" runat="server" ID="_btnShowEmployee" OnClick="_btnShowEmployee_Click" />
        </div>
        <section>
            <asp:MultiView ID="_mWizard" runat="server">
                <asp:View runat="server" ID="_product">
                    <asp:SqlDataSource ID="_sdsNorthWindProduct"
                        runat="server"
                        ConnectionString='<%$ ConnectionStrings:wcho2_Northwind_CS %>'
                        SelectCommand="SELECT [ProductName], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [CategoryName] FROM [Alphabetical list of products]"
                        ProviderName='<%$ ConnectionStrings:wcho2_Northwind_CS.ProviderName %>'>

                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="_sdsNorthWindProduct" 
                        AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BackColor="White" 
                        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical"
                        OnRowDataBound="GridView1_RowDataBound">


                        <AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>
                        <Columns>
                            <asp:BoundField DataField="ProductName" HeaderText="ProductName" ItemStyle-HorizontalAlign="Center"  SortExpression="ProductName" ControlStyle-CssClass="_products"></asp:BoundField>
                            <asp:BoundField DataField="QuantityPerUnit" HeaderText="QuantityPerUnit" ItemStyle-HorizontalAlign="Center"  SortExpression="QuantityPerUnit"></asp:BoundField>
                            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" ItemStyle-HorizontalAlign="Center"  SortExpression="UnitPrice" DataFormatString="{0:C}"></asp:BoundField>
                            <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" ItemStyle-HorizontalAlign="Center"  SortExpression="UnitsInStock" ></asp:BoundField>
                            <asp:BoundField DataField="UnitsOnOrder" HeaderText="UnitsOnOrder" ItemStyle-HorizontalAlign="Center"  SortExpression="UnitsOnOrder"></asp:BoundField>
                            <asp:BoundField DataField="ReorderLevel" HeaderText="ReorderLevel" ItemStyle-HorizontalAlign="Center"  SortExpression="ReorderLevel"></asp:BoundField>
                            <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" ItemStyle-HorizontalAlign="Center"  SortExpression="Discontinued"></asp:CheckBoxField>
                            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" ItemStyle-HorizontalAlign="Center"  SortExpression="CategoryName"></asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC"></FooterStyle>

                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>

                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                    </asp:GridView>

                </asp:View>
                <asp:View runat="server" ID="_editEmployee" >
                    <asp:SqlDataSource ID="_sdsNorthWindEmployee" runat="server"
                        ConnectionString='<%$ ConnectionStrings:wcho2_Northwind_CS %>'
                        ProviderName='<%$ ConnectionStrings:wcho2_Northwind_CS.ProviderName %>'
                        SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [HireDate], [Address], [City], [Country] FROM [Employees]"
                        DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @EmployeeID" 
                        InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title], [HireDate], [Address], [City], [Country]) VALUES (@LastName, @FirstName, @Title, @HireDate, @Address, @City, @Country)"
                        UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Title] = @Title, [HireDate] = @HireDate, [Address] = @Address, [City] = @City, [Country] = @Country WHERE [EmployeeID] = @EmployeeID">

                        <DeleteParameters>
                            <asp:Parameter Name="EmployeeID" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Title" Type="String"></asp:Parameter>
                            <asp:Parameter Name="HireDate" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                            <asp:Parameter Name="City" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Country" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Title" Type="String"></asp:Parameter>
                            <asp:Parameter Name="HireDate" Type="DateTime"></asp:Parameter>
                            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                            <asp:Parameter Name="City" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Country" Type="String"></asp:Parameter>
                            <asp:Parameter Name="EmployeeID" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="_showEmployee" 
                        runat="server" AutoGenerateColumns="False"
                        OnSelectedIndexChanged="_showEmployee_SelectedIndexChanged"
                        DataKeyNames="EmployeeID" DataSourceID="_sdsNorthWindEmployee" AllowPaging="True" AllowSorting="True"
                        OnRowDataBound="_showEmployee_RowDataBound">
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" ReadOnly="True" InsertVisible="False" SortExpression="EmployeeID"></asp:BoundField>
                            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName"></asp:BoundField>
                            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"></asp:BoundField>
                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"></asp:BoundField>
                            <asp:BoundField DataField="HireDate" HeaderText="HireDate" SortExpression="HireDate"></asp:BoundField>
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
                            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    

                </asp:View>
            </asp:MultiView>
        </section>
    </form>
</body>
</html>
