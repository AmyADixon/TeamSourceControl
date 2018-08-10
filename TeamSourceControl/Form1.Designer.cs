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
            this.SuspendLayout();
            // 
            // cbArtists
            // 
            this.cbArtists.Font = new System.Drawing.Font("UD Digi Kyokasho N-B", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.cbArtists.ForeColor = System.Drawing.Color.Green;
            this.cbArtists.FormattingEnabled = true;
            this.cbArtists.Location = new System.Drawing.Point(246, 63);
            this.cbArtists.Name = "cbArtists";
            this.cbArtists.Size = new System.Drawing.Size(307, 24);
            this.cbArtists.TabIndex = 0;
            // 
            // lvDisplayArt
            // 
            this.lvDisplayArt.Font = new System.Drawing.Font("UD Digi Kyokasho N-B", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.lvDisplayArt.ForeColor = System.Drawing.Color.Green;
            this.lvDisplayArt.Location = new System.Drawing.Point(246, 125);
            this.lvDisplayArt.Name = "lvDisplayArt";
            this.lvDisplayArt.Size = new System.Drawing.Size(307, 149);
            this.lvDisplayArt.TabIndex = 1;
            this.lvDisplayArt.UseCompatibleStateImageBehavior = false;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 372);
            this.Controls.Add(this.lvDisplayArt);
            this.Controls.Add(this.cbArtists);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ComboBox cbArtists;
        private System.Windows.Forms.ListView lvDisplayArt;
    }
}

