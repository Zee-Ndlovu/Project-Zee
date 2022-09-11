<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="NonkosiBoutique.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" visible="true"></asp:Label><h1> Booking list</h1>
    <asp:Label ID="empty" runat="server" Text="Add same items in your cart." Visible="false"></asp:Label>
    <asp:Label ID="Qty" runat="server" Visible="false"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" Height="187px" OnRowCommand="GridView1_RowCommand" Width="1123px" >
        <Columns>
            <asp:ButtonField Text="Select" CommandName="pdf_click"/>
        </Columns>
    </asp:GridView>
    <br />
    
    <%if (Qty.Visible) { %>
    <asp:Label ID="price" runat="server" ></asp:Label>
        <h3>Select row to update</h3>
        <div class="form-group">
            <asp:Label AssociatedControlID="nom" runat="server" CssClass="col-md-2 control-label" >Select Row Number</asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="nom" runat="server" CssClass="form-control" Style="width:3cm" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <asp:Button ID="remove" runat="server" Text="Clear" Enabled = "false" CssClass="btn btn-default" OnClick="remove_Click"/>
        <br />
        <br />
        <asp:Button ID="claerall" runat="server" Text="Empty Cart" CssClass="btn btn-default" OnClick="claerall_Click"/>
        <br />
        <br />
        <asp:LinkButton ID="Checkout" runat="server" style='font-size:18px;color:black; background-color:transparent; border: 2px solid black;  padding: 10px 50px; text-align: center;' OnClick="Checkout_Click">Checkout</asp:LinkButton>
    <%} %>
    <asp:SqlDataSource ID="sbo" runat="server"></asp:SqlDataSource>
    <asp:SqlDataSource ID="insert" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:group8ConnectionString %>" DeleteCommand="DELETE FROM [booking] WHERE [book_id] = @original_book_id AND (([outfit_id] = @original_outfit_id) OR ([outfit_id] IS NULL AND @original_outfit_id IS NULL)) AND (([decor_id] = @original_decor_id) OR ([decor_id] IS NULL AND @original_decor_id IS NULL)) AND [schedulDate] = @original_schedulDate AND [returnDate] = @original_returnDate AND [totalprice] = @original_totalprice AND (([bookDate] = @original_bookDate) OR ([bookDate] IS NULL AND @original_bookDate IS NULL)) AND (([time] = @original_time) OR ([time] IS NULL AND @original_time IS NULL)) AND (([deliver] = @original_deliver) OR ([deliver] IS NULL AND @original_deliver IS NULL)) AND (([fine] = @original_fine) OR ([fine] IS NULL AND @original_fine IS NULL)) AND [Qty] = @original_Qty AND (([comment] = @original_comment) OR ([comment] IS NULL AND @original_comment IS NULL))" InsertCommand="INSERT INTO [booking] ([outfit_id], [decor_id], [schedulDate], [returnDate], [totalprice], [bookDate], [time], [deliver], [fine], [Qty], [comment]) VALUES (@outfit_id, @decor_id, @schedulDate, @returnDate, @totalprice, @bookDate, @time, @deliver, @fine, @Qty, @comment)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [booking]" UpdateCommand="UPDATE [booking] SET [outfit_id] = @outfit_id, [decor_id] = @decor_id, [schedulDate] = @schedulDate, [returnDate] = @returnDate, [totalprice] = @totalprice, [bookDate] = @bookDate, [time] = @time, [deliver] = @deliver, [fine] = @fine, [Qty] = @Qty, [comment] = @comment WHERE [book_id] = @original_book_id AND (([outfit_id] = @original_outfit_id) OR ([outfit_id] IS NULL AND @original_outfit_id IS NULL)) AND (([decor_id] = @original_decor_id) OR ([decor_id] IS NULL AND @original_decor_id IS NULL)) AND [schedulDate] = @original_schedulDate AND [returnDate] = @original_returnDate AND [totalprice] = @original_totalprice AND (([bookDate] = @original_bookDate) OR ([bookDate] IS NULL AND @original_bookDate IS NULL)) AND (([time] = @original_time) OR ([time] IS NULL AND @original_time IS NULL)) AND (([deliver] = @original_deliver) OR ([deliver] IS NULL AND @original_deliver IS NULL)) AND (([fine] = @original_fine) OR ([fine] IS NULL AND @original_fine IS NULL)) AND [Qty] = @original_Qty AND (([comment] = @original_comment) OR ([comment] IS NULL AND @original_comment IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_book_id" Type="Int32" />
            <asp:Parameter Name="original_outfit_id" Type="Int32" />
            <asp:Parameter Name="original_decor_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_schedulDate" />
            <asp:Parameter DbType="Date" Name="original_returnDate" />
            <asp:Parameter Name="original_totalprice" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="original_bookDate" />
            <asp:Parameter DbType="Time" Name="original_time" />
            <asp:Parameter Name="original_deliver" Type="String" />
            <asp:Parameter Name="original_fine" Type="Decimal" />
            <asp:Parameter Name="original_Qty" Type="Int32" />
            <asp:Parameter Name="original_comment" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="outfit_id" Type="Int32" />
            <asp:Parameter Name="decor_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="schedulDate" />
            <asp:Parameter DbType="Date" Name="returnDate" />
            <asp:Parameter Name="totalprice" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="bookDate" />
            <asp:Parameter DbType="Time" Name="time" />
            <asp:Parameter Name="deliver" Type="String" />
            <asp:Parameter Name="fine" Type="Decimal" />
            <asp:Parameter Name="Qty" Type="Int32" />
            <asp:Parameter Name="comment" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="outfit_id" Type="Int32" />
            <asp:Parameter Name="decor_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="schedulDate" />
            <asp:Parameter DbType="Date" Name="returnDate" />
            <asp:Parameter Name="totalprice" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="bookDate" />
            <asp:Parameter DbType="Time" Name="time" />
            <asp:Parameter Name="deliver" Type="String" />
            <asp:Parameter Name="fine" Type="Decimal" />
            <asp:Parameter Name="Qty" Type="Int32" />
            <asp:Parameter Name="comment" Type="String" />
            <asp:Parameter Name="original_book_id" Type="Int32" />
            <asp:Parameter Name="original_outfit_id" Type="Int32" />
            <asp:Parameter Name="original_decor_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_schedulDate" />
            <asp:Parameter DbType="Date" Name="original_returnDate" />
            <asp:Parameter Name="original_totalprice" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="original_bookDate" />
            <asp:Parameter DbType="Time" Name="original_time" />
            <asp:Parameter Name="original_deliver" Type="String" />
            <asp:Parameter Name="original_fine" Type="Decimal" />
            <asp:Parameter Name="original_Qty" Type="Int32" />
            <asp:Parameter Name="original_comment" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="clientinfo" runat="server" ConnectionString="<%$ ConnectionStrings:group8ConnectionString %>" SelectCommand="SELECT MAX(book_id) AS Expr1 FROM booking"></asp:SqlDataSource>
    <asp:SqlDataSource ID="clientinfoid" runat="server" ConnectionString="<%$ ConnectionStrings:group8ConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [client_id] FROM [client] WHERE ([email] = @email)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" Name="email" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
</asp:Content>
