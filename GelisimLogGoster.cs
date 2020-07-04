using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace GelisimYonetimLoglamaMantigi
{
    public partial class GelisimLogGoster : Form
    {
        public GelisimLogGoster()
        {
            InitializeComponent();
        }

        private void GelisimLogGoster_Load(object sender, EventArgs e)
        {
            GridUpdate_MasterLog();
        }

        void GridUpdate_MasterLog()
        {
            dataGridView1.DataSource = Models.URUN_AGACI_MASTER_Log.LogListele(lbl_ua_kod.Text);
        }

        string kod;
        int versiyon, revizyon;
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = dataGridView1.Rows[e.RowIndex];
            kod = row.Cells["Kod"].Value.ToString();
            versiyon = Convert.ToInt16(row.Cells["Versiyon"].Value.ToString());
            revizyon = Convert.ToInt16(row.Cells["Rev_No"].Value.ToString());
            GridUpdate_DetayLog();
        }

        void GridUpdate_DetayLog()
        {
            dataGridView2.DataSource = Models.URUN_AGACI_DETAY_Log.LogListele(kod, versiyon, revizyon);
        }


    }
}
