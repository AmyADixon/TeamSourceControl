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
    public partial class Form1 : Form {
        public Form1() {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e) {
            // Create an instance of a DB context
            CtrlArtGalleryEntities dbContext = new CtrlArtGalleryEntities();

            // Get All Artists in the DB (LINQ Query Syntax)
            List<Artists> allArtists = (from person in dbContext.Artists
                                                        orderby person.ArtistFirstName
                                                        select person).ToList();

            //Display artists in the combo box
            cbArtists.DataSource = allArtists; 

            cbArtists.DisplayMember = "ArtistFirstName";
            cbArtists.DisplayMember = nameof(Artists.ArtistFirstName);

        }
    }
}
