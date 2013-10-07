using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using umbraco.cms.businesslogic.datatype;

public partial class UserControls_BingMapPropertyEditor : System.Web.UI.UserControl, umbraco.editorControls.userControlGrapper.IUsercontrolDataEditor
{
    [DataEditorSetting("Bing Maps key", description="get your key on http://www.bingmapsportal.com/")]
    public string BingKey { get; set; }

    [DataEditorSetting("Width", defaultValue = "400px")]
    public string MapWidth { get; set; }

    [DataEditorSetting("Height", defaultValue = "450px")]
    public string MapHeight { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtLocation.Text = value.ToString();
        }
    }

    public object value
    {
        get
        {
            return txtLocation.Text;
        }
        set
        {
            txtLocation.Text = value.ToString();
        }
    }
}