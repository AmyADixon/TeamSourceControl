using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TeamSourceControl {
    public partial class FormAddArt : Form {
        public FormAddArt() {
            InitializeComponent();
        }

        private void FormAddArt_Load(object sender, EventArgs e) {
            // Populate style combo box (may add more later)
            cbStyle.Items.Add("Sculpture/Carving");
            cbStyle.Items.Add("Painting");
            cbStyle.Items.Add("Digital");
            cbStyle.Items.Add("Live Performance");
            cbStyle.Items.Add("Traditional Illustration/Drawing");
            cbStyle.Items.Add("Other");

            //Populate IsInteractive combo box
            cbInteractive.Items.Add("Yes");
            cbInteractive.Items.Add("No");

            //Populate Targeted Age Range combo box
            cbAgeRange.Items.Add("Any");
            cbAgeRange.Items.Add("13+");
            cbAgeRange.Items.Add("18+");
        }

        private void btnCreate_Click(object sender, EventArgs e) {
            //Convert cbInteractive answer to bit
            bool bitAnswer = false;
            if (cbInteractive.SelectedText == "Yes") {
                bitAnswer = true;
            }

            Art piece = new Art() {
                Title = tbTitle.Text,
                DateDisplayed = dtpDisplayed.Value,
                ArrivalDate = dtpArrival.Value,
                DateCreated = dtpCreated.Value,
                Style = cbStyle.SelectedText,
                IsInteractive = bitAnswer,
                TargetedAgeRange = cbAgeRange.SelectedText,
                ArtURL = tbArtURL.Text,
                DateRemoved = dtpRemoved.Value,
                DateAvailableForSale = dtpSale.Value,
                Price = Convert.ToDecimal(tbPrice.Text),
                Description = tbDescription.Text
            };
        }
    }
}
