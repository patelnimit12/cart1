using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace WebApplication
{
    public class Class1
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        public int x;

        public Class1()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
        }
        public int transaction(string sp, SqlParameter[] pdata)  // Insert, Update, Delete
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand(sp);
            cmd.Connection = this.con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(pdata);
            x = cmd.ExecuteNonQuery();
            return x;

        }
        public int scalar(string sp, SqlParameter pdata)   // max
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand(sp);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = this.con;

            cmd.Parameters.Add(pdata);
            pdata.Direction = ParameterDirection.Output;

            cmd.ExecuteScalar();
            int x = Convert.ToInt32(cmd.Parameters[0].Value);
            return x;
        }
        public int check(string sp, SqlParameter pdata)// Login, already exist
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand(sp);
            cmd.Connection = this.con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(pdata);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                return 1;

            }
            else
            {
                return 0;
            }

        }

        public int check1(string sp, SqlParameter[] pdata)// Login, already exist
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand(sp);
            cmd.Connection = this.con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(pdata);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                return 1;

            }
            else
            {
                return 0;
            }

        }

        public string fetchname(string sp, SqlParameter[] pdata)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand(sp);
            cmd.Connection = this.con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(pdata);
            pdata[0].Direction = ParameterDirection.Input;
            pdata[1].Direction = ParameterDirection.Output;
            cmd.ExecuteScalar();
            string itemname = cmd.Parameters[1].Value.ToString();
            return itemname;
        }

        public int fetchrate(string sp, SqlParameter[] pdata1)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand(sp);
            cmd.Connection = this.con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(pdata1);
            pdata1[0].Direction = ParameterDirection.Input;
            pdata1[1].Direction = ParameterDirection.Output;
            cmd.ExecuteScalar();
            int rate = Convert.ToInt32(cmd.Parameters[1].Value.ToString());
            return rate;
        }

        public DataSet FetchAll(string sp, SqlParameter pdata)
        {
            con.Close();
            con.Open();
            cmd = new SqlCommand(sp);
            cmd.Connection = this.con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(pdata);

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}
