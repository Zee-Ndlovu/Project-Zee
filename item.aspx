<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="item.aspx.cs" Inherits="NonkosiBoutique.item" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"> 
               
    <div style="height:auto;width:100%; border-left:2px;background-color:white;text-align:center">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Black" ></asp:Label>
    </div>
    
    <div class="row" >
        <div class="col-md-4" style="margin-left:2cm ;height:auto;width:100%; border-left:2px;background-color:white">
           <%if (Session["search"].Equals("all")) { %>
                <asp:ListView ID="all" runat="server" DataSourceID="Allitem">
                    <ItemTemplate>
                        <div class="col-md-4" style="max-height: 450px;border-style: ridge; width:28%;margin-right:0.5cm ;margin-top:0.5cm">
                            <table>
                                <tr><td><img src='<%# "image/"+Eval("outfit_id")+".JPG" %>' alt="items" width="230" height="300" /></td></tr>
                                <tr><td><h3><%#Eval("outfitTypeName") %></h3></td></tr>
                                <tr><td><p><%# "R"+Eval("price") %></p></td></tr>
                            </table>

                            <div style="width:100%"><asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("outfit_id") %>' runat="server" OnClick="LinkButton2_Click" style='font-size:18px;color:white; background-color:black; border: 2px solid white;  padding: 10px 50px;text-align: center;width:100%'>View Item</asp:LinkButton></div>
                            
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="Allitem" runat="server" ConnectionString="<%$ ConnectionStrings:group8ConnectionString %>" SelectCommand="SELECT outfitType.outfitTypeName, outfitType.fubric, brand.brandName, outfit.outfit_id, outfit.price, outfit.depositPrice, outfit.color, outfit.size, outfit.Qty, outfit.description, outfit.outfitAvailability FROM brand INNER JOIN outfit ON brand.brand_id = outfit.brand_id INNER JOIN outfitType ON outfit.outfitType_id = outfitType.outfitType_id"></asp:SqlDataSource>
                <br />
                <br />
           <%} %>
           <%else if(Session["search"].Equals("Package1") || Session["search"].Equals("Package2") || Session["search"].Equals("Package3") || Session["search"].Equals("Package4") || Session["search"].Equals("Package5")){ %>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="col-md-4" style="border-style: ridge; width:28%;margin-right:0.5cm ;margin-top:0.5cm">
                            <table>
                                <tr><td><img src='<%# "image/"+Eval("decorType")+".JPG" %>' alt="items" width="230" height="300" /></td></tr>
                                <tr><td><h3><%#Eval("decorType") %></h3></td></tr>
                                <tr><td><p><%# "R"+Eval("price") %></p></td></tr>
                            
                            </table>
                            <div style="width:100%"><asp:LinkButton ID="packageItem" CommandArgument='<%# Eval("decor_id") %>' runat="server" OnClick="packageItem_Click" style='font-size:18px;color:white; background-color:black; border: 2px solid white;  padding: 10px 50px;text-align: center;width:100%'>View Item</asp:LinkButton></div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                    
                <br/>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:group8ConnectionString %>" SelectCommand="SELECT decor_id, price, depositPrice, description, decorAvailability, decorType, date, time FROM decoration WHERE (decorType = @type)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label1" Name="type" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
           <%} %>
           <%else if(Session["search"].Equals("Package")){%>
                <asp:ListView ID="ListView2" runat="server" DataSourceID="packageSql">
                    <ItemTemplate>
                        <div class="col-md-4" style="border-style: ridge; width:28%;margin-right:0.5cm ;margin-top:0.5cm">
                            <table>
                                <tr><td><img src='<%# "image/"+Eval("decorType")+".JPG" %>' alt="items" width="230" height="300" /></td></tr>
                                <tr><td><h3><%#Eval("decorType") %></h3></td></tr>
                                <tr><td><p><%# "R"+Eval("price") %></p></td></tr>
                            
                            </table>
                            <div style="width:100%"><asp:LinkButton ID="packageItem" CommandArgument='<%# Eval("decor_id") %>' runat="server" OnClick="packageItem_Click" style='font-size:18px;color:white; background-color:black; border: 2px solid white;  padding: 10px 50px;text-align: center;width:100%'>View Item</asp:LinkButton></div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                    
                <br/>
                <asp:SqlDataSource ID="packageSql" runat="server" ConnectionString="<%$ ConnectionStrings:group8ConnectionString %>" SelectCommand="SELECT * FROM [decoration] WHERE ([decorType] LIKE '%' + @decorType + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label1" Name="decorType" PropertyName="Text" Type="String" />
                    </SelectParameters>
            </asp:SqlDataSource>
           <%} %>
           <%else { %>
                <asp:ListView ID="search" runat="server" DataSourceID="Searcitem">
                    <ItemTemplate>
                        <div class="col-md-4" style="border-style: ridge; width:28%;margin-right:0.5cm ;margin-top:0.5cm">
                            <table>
                                <tr><td><img src='<%# "image/"+Eval("outfit_id")+".JPG" %>' alt="items" width="230" height="300" /></td></tr>
                                <tr><td><h3><%#Eval("outfitTypeName") %></h3></td></tr>
                                <tr><td><p><%# "R"+Eval("price") %></p></td></tr>
                            
                            </table>
                            <div style="width:100%"><asp:LinkButton ID="searchItem" CommandArgument='<%# Eval("outfit_id") %>' runat="server" OnClick="searchItem_Click" style='font-size:18px;color:white; background-color:black; border: 2px solid white;  padding: 10px 50px;text-align: center;width:100%'>View Item</asp:LinkButton></div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="Searcitem" runat="server" ConnectionString="<%$ ConnectionStrings:group8ConnectionString %>" SelectCommand="SELECT outfitType.outfitTypeName AS Expr1, outfitType.outfitTypeName, outfitType.fubric, outfit.price, outfit.color, outfit.size, outfit.depositPrice, outfit.Qty, outfit.description, outfit.outfitAvailability, brand.brandName, outfit.outfit_id FROM outfitType INNER JOIN outfit ON outfitType.outfitType_id = outfit.outfitType_id INNER JOIN brand ON outfit.brand_id = brand.brand_id WHERE (outfitType.outfitTypeName LIKE '%' + @name + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label1" Name="name" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
           <%} %>
        </div>
    </div>
    <br />
    <br />
    <hr />
    <%if (Session["search"].Equals("all")) { %>
        <div style="text-align:center;width:100%">
            <asp:DataPager ID="DataPager3" runat="server" PagedControlID="all" PageSize="9">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                    <asp:NumericPagerField ButtonType="Link" />
                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton="false" />
                </Fields>
            </asp:DataPager>
        </div>
    <%} %>
    <%else if(Session["search"].Equals("Package1") || Session["search"].Equals("Package2") || Session["search"].Equals("Package3") || Session["search"].Equals("Package4") || Session["search"].Equals("Package5")){ %>
        <div style="text-align:center;width:100%">
            <asp:DataPager ID="DataPager4" runat="server" PagedControlID="ListView1" PageSize="9">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                    <asp:NumericPagerField ButtonType="Link" />
                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton="false" />
                </Fields>
            </asp:DataPager>
        </div>
    <%} %>
    <%else if(Session["search"].Equals("Package")){%>
        <div style="text-align:center;width:100%">
            <asp:DataPager ID="DataPager2" runat="server" PagedControlID="ListView2" PageSize="9">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                    <asp:NumericPagerField ButtonType="Link" />
                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton="false" />
                </Fields>
            </asp:DataPager>
        </div>
    <%} %>
    <%else { %>
        <div style="text-align:center;width:100%">
            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="search" PageSize="9">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                    <asp:NumericPagerField ButtonType="Link" />
                    <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="true" ShowPreviousPageButton="false" />
                </Fields>
            </asp:DataPager>
        </div>
    <%} %>
</asp:Content>
