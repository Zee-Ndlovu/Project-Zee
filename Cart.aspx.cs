using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace NonkosiBoutique
{
    public partial class Cart : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                Label1.Text = User.Identity.Name;
                DataTable myCart = (Session["cart"]) as DataTable;

                GridView1.DataSource = myCart;
                GridView1.DataBind();
                
                    int count = 0;
                    double tolprice = 0;
                    foreach (DataRow t in myCart.Rows)
                    {
                        count += Int32.Parse((t["Quantity"]).ToString());
                        tolprice += ((double)(Int32.Parse((t["Quantity"]).ToString()))*Convert.ToDouble((t["Price"]).ToString()));
                    }
                    Qty.Text = "You have " + count.ToString() + " quantity in your cart";
                    price.Text = "Your total price is: R"+tolprice;
                    Qty.Visible = true;
                    empty.Visible = false;
                
            }
            catch {
                empty.Visible = true;
                Qty.Visible = false;
            }   
        }

        protected void Checkout_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable myCart = (Session["cart"]) as DataTable;
                foreach (DataRow row in myCart.Rows)
                {
                    // insert item details to booking table
                    if (((row["Type of an Item"]).ToString()).Contains("Package"))
                    {
                        double price = Convert.ToDouble(((row["Price"]).ToString()).Substring(1));
                        string connStr = "Server=143.128.146.30\\ist3;Database=group8;User ID=group8;Password=983djd";
                        SqlConnection conn = new SqlConnection(connStr);
                        string insertItem = " INSERT INTO booking(outfit_id, decor_id, schedulDate, returnDate, totalprice, bookDate, time, deliver, fine, Qty, comment)VALUES(@outfit_id, @decor_id, @schedulDate, @returnDate, @totalprice, @bookDate, @time, @deliver, @fine, @Qty, @comment)";
                        SqlCommand cmd = new SqlCommand(insertItem, conn);
                        cmd.Parameters.AddWithValue("@outfit_id", DBNull.Value);
                        cmd.Parameters.AddWithValue("@decor_id", Int32.Parse(((row["Item Number"]).ToString())));
                        cmd.Parameters.AddWithValue("@schedulDate", Convert.ToDateTime(((row["Schedule Date"]).ToString())));
                        cmd.Parameters.AddWithValue("@returnDate", (Convert.ToDateTime(((row["Schedule Date"]).ToString()))).AddDays(3));
                        cmd.Parameters.AddWithValue("@totalprice", price);
                        cmd.Parameters.AddWithValue("@bookDate", DateTime.Now);
                        cmd.Parameters.AddWithValue("@time", DateTime.Now.TimeOfDay);
                        cmd.Parameters.AddWithValue("@deliver", "No");
                        cmd.Parameters.AddWithValue("@fine", 0);
                        cmd.Parameters.AddWithValue("@Qty", Int32.Parse(((row["Quantity"]).ToString())));
                        cmd.Parameters.AddWithValue("@comment", "Active");
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        //get last item that was booked
                        cmd = new SqlCommand("SELECT MAX(book_id) AS Expr1 FROM booking", conn);
                        conn.Open();
                        int result = (Int32)cmd.ExecuteScalar();
                        conn.Close();
                        //get client id
                        cmd = new SqlCommand("SELECT [client_id] FROM [client] WHERE ([email] = @email)", conn);
                        cmd.Parameters.AddWithValue("@email", Label1.Text);
                        conn.Open();
                        int resultid = (Int32)cmd.ExecuteScalar();
                        conn.Close();
                        //insert data to bridge which connect client and bookings
                        string insertbridge = " INSERT INTO clientBooking(client_id, book_id)VALUES(@client_id, @book_id)";
                        cmd = new SqlCommand(insertbridge, conn);
                        cmd.Parameters.AddWithValue("@client_id", resultid);
                        cmd.Parameters.AddWithValue("@book_id", result);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    else
                    {
                        double price = Convert.ToDouble(((row["Price"]).ToString()).Substring(1));
                        string connStr = "Server=143.128.146.30\\ist3;Database=group8;User ID=group8;Password=983djd";
                        SqlConnection conn = new SqlConnection(connStr);
                        string insertItem = " INSERT INTO booking(outfit_id, decor_id, schedulDate, returnDate, totalprice, bookDate, time, deliver, fine, Qty, comment)VALUES(@outfit_id, @decor_id, @schedulDate, @returnDate, @totalprice, @bookDate, @time, @deliver, @fine, @Qty, @comment)";
                        SqlCommand cmd = new SqlCommand(insertItem, conn);
                        cmd.Parameters.AddWithValue("@outfit_id", Int32.Parse(((row["Item Number"]).ToString())));
                        cmd.Parameters.AddWithValue("@decor_id", DBNull.Value);
                        cmd.Parameters.AddWithValue("@schedulDate", Convert.ToDateTime(((row["Schedule Date"]).ToString())));
                        cmd.Parameters.AddWithValue("@returnDate", (Convert.ToDateTime(((row["Schedule Date"]).ToString()))).AddDays(3));
                        cmd.Parameters.AddWithValue("@totalprice", price);
                        cmd.Parameters.AddWithValue("@bookDate", DateTime.Now);
                        cmd.Parameters.AddWithValue("@time", DateTime.Now.TimeOfDay);
                        cmd.Parameters.AddWithValue("@deliver", "No");
                        cmd.Parameters.AddWithValue("@fine", 0);
                        cmd.Parameters.AddWithValue("@Qty", Int32.Parse(((row["Quantity"]).ToString())));
                        cmd.Parameters.AddWithValue("@comment", "Active");
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        //get last item that was booked
                        cmd = new SqlCommand("SELECT MAX(book_id) AS Expr1 FROM booking", conn);
                        conn.Open();
                        int result = (Int32)cmd.ExecuteScalar();
                        conn.Close();
                        //get client id
                        cmd = new SqlCommand("SELECT [client_id] FROM [client] WHERE ([email] = @email)", conn);
                        cmd.Parameters.AddWithValue("@email", Label1.Text);
                        conn.Open();
                        int resultid = (Int32)cmd.ExecuteScalar();
                        conn.Close();
                        //insert data to bridge which connect client and bookings
                        string insertbridge = " INSERT INTO clientBooking(client_id, book_id)VALUES(@client_id, @book_id)";
                        cmd = new SqlCommand(insertbridge, conn);
                        cmd.Parameters.AddWithValue("@client_id", resultid);
                        cmd.Parameters.AddWithValue("@book_id", result);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }


                }

                Response.Redirect("~/User/Recipt");
            }
            catch {

            }
            
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try {
                if (e.CommandName == "pdf_click")
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = GridView1.Rows[index];
                    nom.Text = (index).ToString();
                    remove.Enabled = true;
                }
            }
            catch{
            }
            
        }

        protected void remove_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable myCart = (Session["cart"]) as DataTable;
                DataRow dr = myCart.Rows[Int32.Parse(nom.Text)];
                dr.Delete();
                Session["cart"] = myCart;
                Page_Load(sender, e);
            }
            catch {

            }
        }

        protected void claerall_Click(object sender, EventArgs e)
        {
            try
            {
                Session["cart"] = null;
                Page_Load(sender, e);
            }
            catch
            {

            }
            
        }
    }
}