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
    public partial class FormAddArtist : Form {
        public FormAddArtist() {
            InitializeComponent();
        }

        private void btnCreate_Click(object sender, EventArgs e) {
            //Add textbox information to Artist object
            Artists artist = new Artists() {
                ArtistFirstName = tbFirstName.Text,
                ArtistEmail = tbEmail.Text,
                ArtistCity = tbCity.Text,
                ArtistState = tbState.Text,
                ArtistLastName = tbLastName.Text,
                ArtistTag = tbTag.Text,
                ArtistPhone = tbPhone.Text,
                AboutTheArtist = tbAbout.Text,
                ArtistWebsite = tbWebsite.Text
            };

            //Pop up success message if added successfully
            try {
                ArtistDB.Add(artist);
                MessageBox.Show("Artist added successfully");
            }
            catch(DbEntityValidationException) {
                MessageBox.Show("Validation Error");
            }
            catch(DbUpdateException) {
                MessageBox.Show("Database error, try again later");
            }
        }
    }
}
