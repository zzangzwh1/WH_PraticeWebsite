using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class practice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        DropDownList1.Items.Insert(0, "Show Products");
        DropDownList1.Items.Insert(1, "Show Employee");
        }
    }

    protected void _btnShowProduct_Click(object sender, EventArgs e)
    {
        _mWizard.SetActiveView(_product);
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
      if(DropDownList1.SelectedIndex ==0)
            _mWizard.SetActiveView(_product);
      else
            _mWizard.SetActiveView(_editEmployee);

        //if(DropDownList1.SelectedValue =="1")

    }

    protected void _btnShowEmployee_Click(object sender, EventArgs e)
    {
        _mWizard.SetActiveView(_editEmployee);
    }

    protected void _showEmployee_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       
    }

    protected void _showEmployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach(GridViewRow row in _showEmployee.Rows)
        {
            if(row.RowIndex == _showEmployee.SelectedIndex)
            {
                row.BackColor = Color.Yellow;
            }
        }
    }

  

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType ==DataControlRowType.DataRow)
        {
            if (Convert.ToInt32(e.Row.Cells[3].Text) < 20 && Convert.ToInt32(e.Row.Cells[4].Text) < 5)
                e.Row.Cells[3].BackColor = Color.Yellow;
        }
    }
}