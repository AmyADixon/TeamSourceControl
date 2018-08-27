namespace TeamSourceControl {
    partial class Form1 {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing) {
            if (disposing && (components != null)) {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent() {
            this.cbArtists = new System.Windows.Forms.ComboBox();
            this.lvDisplayArt = new System.Windows.Forms.ListView();
            this.btnAddArtist = new System.Windows.Forms.Button();
            this.btnDeleteArtist = new System.Windows.Forms.Button();
            this.lblArtist = new System.Windows.Forms.Label();
            this.btnAddArt = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // cbArtists
            // 
            this.cbArtists.Font = new System.Drawing.Font("Palatino Linotype", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbArtists.ForeColor = System.Drawing.Color.Green;
            this.cbArtists.FormattingEnabled = true;
            this.cbArtists.Location = new System.Drawing.Point(146, 64);
            this.cbArtists.Name = "cbArtists";
            this.cbArtists.Size = new System.Drawing.Size(375, 30);
            this.cbArtists.TabIndex = 0;
            // 
            // lvDisplayArt
            // 
            this.lvDisplayArt.Font = new System.Drawing.Font("Palatino Linotype", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lvDisplayArt.ForeColor = System.Drawing.Color.Green;
            this.lvDisplayArt.Location = new System.Drawing.Point(146, 125);
            this.lvDisplayArt.Name = "lvDisplayArt";
            this.lvDisplayArt.Size = new System.Drawing.Size(375, 149);
            this.lvDisplayArt.TabIndex = 1;
            this.lvDisplayArt.UseCompatibleStateImageBehavior = false;
            // 
            // btnAddArtist
            // 
            this.btnAddArtist.Font = new System.Drawing.Font("Palatino Linotype", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAddArtist.Location = new System.Drawing.Point(146, 294);
            this.btnAddArtist.Name = "btnAddArtist";
            this.btnAddArtist.Size = new System.Drawing.Size(121, 63);
            this.btnAddArtist.TabIndex = 2;
            this.btnAddArtist.Text = "Add Artist";
            this.btnAddArtist.UseVisualStyleBackColor = true;
            this.btnAddArtist.Click += new System.EventHandler(this.btnAddArtist_Click);
            // 
            // btnDeleteArtist
            // 
            this.btnDeleteArtist.Font = new System.Drawing.Font("Palatino Linotype", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDeleteArtist.Location = new System.Drawing.Point(400, 294);
            this.btnDeleteArtist.Name = "btnDeleteArtist";
            this.btnDeleteArtist.Size = new System.Drawing.Size(121, 63);
            this.btnDeleteArtist.TabIndex = 3;
            this.btnDeleteArtist.Text = "Delete Artist";
            this.btnDeleteArtist.UseVisualStyleBackColor = true;
            // 
            // lblArtist
            // 
            this.lblArtist.AutoSize = true;
            this.lblArtist.Font = new System.Drawing.Font("Palatino Linotype", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblArtist.Location = new System.Drawing.Point(40, 67);
            this.lblArtist.Name = "lblArtist";
            this.lblArtist.Size = new System.Drawing.Size(89, 22);
            this.lblArtist.TabIndex = 4;
            this.lblArtist.Text = "Select Artist";
            // 
            // btnAddArt
            // 
            this.btnAddArt.Font = new System.Drawing.Font("Palatino Linotype", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAddArt.Location = new System.Drawing.Point(273, 294);
            this.btnAddArt.Name = "btnAddArt";
            this.btnAddArt.Size = new System.Drawing.Size(121, 63);
            this.btnAddArt.TabIndex = 5;
            this.btnAddArt.Text = "Add Art";
            this.btnAddArt.UseVisualStyleBackColor = true;
            this.btnAddArt.Click += new System.EventHandler(this.btnAddArt_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(615, 434);
            this.Controls.Add(this.btnAddArt);
            this.Controls.Add(this.lblArtist);
            this.Controls.Add(this.btnDeleteArtist);
            this.Controls.Add(this.btnAddArtist);
            this.Controls.Add(this.lvDisplayArt);
            this.Controls.Add(this.cbArtists);
            this.Name = "Form1";
            this.Text = "Artist Gallery App";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cbArtists;
        private System.Windows.Forms.ListView lvDisplayArt;
        private System.Windows.Forms.Button btnAddArtist;
        private System.Windows.Forms.Button btnDeleteArtist;
        private System.Windows.Forms.Label lblArtist;
        private System.Windows.Forms.Button btnAddArt;
    }
}

