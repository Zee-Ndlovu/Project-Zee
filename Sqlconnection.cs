using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace NonkosiBoutique
{
    public class Sqlconnection
    {
        private string sql;
        private SqlConnection conn;
        private SqlCommand command;
        private SqlDataAdapter da;

        public Sqlconnection()
        {
            sql = "Server=143.128.146.30\\ist3;Database=group8;User ID=group8;Password=983djd";
            conn = new SqlConnection(sql);
        }

        public DataSet GetDataset()
        {
            sql = "select * from booking";
            command = new SqlCommand(sql, conn);
            da = new SqlDataAdapter(command);
            DataSet ds = new DataSet();
            da.Fill(ds, "booking");
            return ds;
        }
    }
}