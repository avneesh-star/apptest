using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;

namespace app03102020
{
    public partial class registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sds"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCourse();
                BindGrid();
            }
        }
        public void BindCourse()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_get_course", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                ddl_course.DataTextField = "course_name";
                ddl_course.DataValueField = "course_id";
                ddl_course.DataSource = dr;
                ddl_course.DataBind();
            }

            con.Close();
            ddl_course.Items.Insert(0, new ListItem("Select", "0"));
        }
        public void BindGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_registration_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                gv.DataSource = dr;
                gv.DataBind();
                con.Close();
            }
            else
            {
                lbl_msh.Text = "No record avialable!!";
                lbl_msh.ForeColor = Color.Red;
            }
        }
        public void clear()
        {
            txt_name.Text = "";
            rbl_bloodgroup.ClearSelection();
            rbl_gender.ClearSelection();
            ddl_course.SelectedValue = "0";
            btn_save.Text = "Save";
            btn_save.CssClass = "btn btn-primary";
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (btn_save.Text == "Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_registration_insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", txt_name.Text);
                cmd.Parameters.AddWithValue("@Gender", rbl_gender.SelectedValue);
                cmd.Parameters.AddWithValue("@BloodGroup", rbl_bloodgroup.SelectedValue);
                cmd.Parameters.AddWithValue("@Course", ddl_course.SelectedValue);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    lbl_msh.Text = "Record inserted successfully!!";
                    lbl_msh.ForeColor = Color.Green;
                }
                else
                {
                    lbl_msh.Text = "No record inserted!!";
                    lbl_msh.ForeColor = Color.BlueViolet;
                }
                BindGrid();
                clear();
            }
            else if (btn_save.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_registration_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", ViewState["cd"]);
                cmd.Parameters.AddWithValue("@Name", txt_name.Text);
                cmd.Parameters.AddWithValue("@Gender", rbl_gender.SelectedValue);
                cmd.Parameters.AddWithValue("@BloodGroup", rbl_bloodgroup.SelectedValue);
                cmd.Parameters.AddWithValue("@Course", ddl_course.SelectedValue);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    lbl_msh.Text = "Record Update successfully!!";
                    lbl_msh.ForeColor = Color.Green;
                }
                else
                {
                    lbl_msh.Text = "No record updated!!";
                    lbl_msh.ForeColor = Color.BlueViolet;
                }
                BindGrid();
                clear();
            }

        }

        protected void gv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_registration_delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    lbl_msh.Text = "Record deleted successfully!!";
                    lbl_msh.ForeColor = Color.Green;

                }
                else
                {
                    lbl_msh.Text = "No record deleted!!";
                    lbl_msh.ForeColor = Color.BlueViolet;
                }
                BindGrid();
            }
            else if (e.CommandName == "edt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_registration_edit", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txt_name.Text = dt.Rows[0]["Name"].ToString();
                rbl_gender.SelectedValue = dt.Rows[0]["Gender"].ToString();
                rbl_bloodgroup.SelectedValue = dt.Rows[0]["BloodGroup"].ToString();
                ddl_course.SelectedValue = dt.Rows[0]["Course"].ToString();
                btn_save.Text = "Update";
                btn_save.CssClass = "btn btn-success";
                ViewState["cd"] = e.CommandArgument;
            }
        }
    }
}