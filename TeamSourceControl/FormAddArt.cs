using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
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

            //Set all combo boxes to first choice
            cbStyle.SelectedIndex = 0;
            cbInteractive.SelectedIndex = 0;
            cbAgeRange.SelectedIndex = 0;
        }

        private void btnCreate_Click(object sender, EventArgs e) {
            //Convert cbInteractive answer to bit
            bool bitAnswer = false;
            if (cbInteractive.SelectedText == "Yes") {
                bitAnswer = true;
            }

            //Set default if dtp for optional not checked
            DateTime removed = Convert.ToDateTime("01/01/1700"); //earliest time possible
            DateTime forSale = Convert.ToDateTime("01/01/1700");

            if(dtpRemoved.Checked) {
                removed = dtpRemoved.Value.Date;
            }

            if(dtpSale.Checked) {
                forSale = dtpSale.Value.Date;
            }

            //Create Art object
            Art piece = new Art() {
                Title = tbTitle.Text,
                DateDisplayed = dtpDisplayed.Value.Date,
                ArrivalDate = dtpArrival.Value.Date,
                DateCreated = dtpCreated.Value.Date,
                Style = cbStyle.SelectedItem.ToString(),
                IsInteractive = bitAnswer,
                TargetedAgeRange = cbAgeRange.SelectedItem.ToString(),
                ArtURL = tbArtURL.Text,
                DateRemoved = removed,
                DateAvailableForSale = forSale,
                Price = Convert.ToDecimal(tbPrice.Text),
                Description = tbDescription.Text
            };

            try {
                ArtDB.Add(piece);
                MessageBox.Show("Art piece added successfully");

                Close();
            }
            catch (DbEntityValidationException) {
                MessageBox.Show("Validation Error");
            }
            catch (DbUpdateException) {
                MessageBox.Show("Database error, try again later");
            }
        }
    }
}
