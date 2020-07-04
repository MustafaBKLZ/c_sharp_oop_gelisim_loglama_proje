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
    public partial class AnaForm : Form
    {
        public AnaForm()
        {
            InitializeComponent();
        }
        private void AnaForm_Load(object sender, EventArgs e)
        {
            GridUpdate_Master();
        }
        void GridUpdate_Master()
        {
            if (txt_ua_ID.Text.Trim() == string.Empty) txt_ua_ID.Text = "0";
            if (txt_uad_ID.Text.Trim() == string.Empty) txt_uad_ID.Text = "0";

            dataGridView1.DataSource = Models.URUN_AGACI_MASTER.Listele();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                DataGridViewRow row = dataGridView1.Rows[e.RowIndex];
                txt_ua_ID.Text = row.Cells["ID"].Value.ToString();
                txt_ua_adi.Text = row.Cells["Adı"].Value.ToString();
                txt_ua_kodu.Text = row.Cells["Kod"].Value.ToString();
                txt_ua_versiyon.Text = row.Cells["Versiyon"].Value.ToString();
                txt_uad_parca_sira.Text = "";
                GridUpdate_Detay();
                DetayBilgileri();
                txt_ua_kodu.Enabled = false;
            }
            catch(ArgumentOutOfRangeException)
            {

            }
        }

        void DetayBilgileri()
        {

            if (txt_uad_parca_sira.Text.Trim() == string.Empty)
            {
                txt_uad_parca_sira.Text = Classes.SQLConnectionClass.Command("select count(*) +1                "
                    + " from DBO.Urun_Agaci_Detaylari('" + txt_ua_kodu.Text + "'," + Convert.ToInt16(txt_ua_versiyon.Text) + ")").ToString();
            }



            if (txt_uad_ID.Text.Trim() == string.Empty) txt_uad_ID.Text = "0";


        }

        private void btn_Detay_kaydet_Click(object sender, EventArgs e)
        {
            MasterKayet();
            Detay_Kadyet();
        }

        void MasterKayet()
        {
            Models.URUN_AGACI_MASTER urun = new Models.URUN_AGACI_MASTER()
            {
                Uam_Adi = txt_ua_adi.Text,
                Uam_Kod = txt_ua_kodu.Text,
                Uam_Versiyon = Convert.ToInt16(txt_ua_versiyon.Text),
                Uam_ID = Convert.ToInt32(txt_ua_ID.Text),
            };
            urun.Kaydet();
            GridUpdate_Master();
            DetayBilgileri();
        }
        void Detay_Kadyet()
        {
            if (txt_uad_ID.Text == "0" && (txt_uad_parca_miktar.Text.Trim() == string.Empty || txt_uad_parca_maliyet.Text.Trim() == string.Empty))
            {

            }
            else
            {


                Models.URUN_AGACI_DETAY detay = new Models.URUN_AGACI_DETAY()
                {
                    Uad_ID = Convert.ToInt32(txt_uad_ID.Text),
                    Uad_Parca_Sira = Convert.ToInt32(txt_uad_parca_sira.Text),
                    Uad_Miktar = Convert.ToDouble(txt_uad_parca_miktar.Text),
                    Uad_Parca_Maliyet = Convert.ToDouble(txt_uad_parca_maliyet.Text),
                    Uad_Aciklama = txt_uad_parca_aciklama.Text,
                    Uad_Parca_Ismi = txt_uad_parca_ismi.Text,
                    Uad_Parca_No = txt_uad_parca_no.Text,
                    Uad_uam_Kod = txt_ua_kodu.Text,
                    Uad_uam_Versiyon = txt_ua_versiyon.Text,
                };
                detay.Kaydet();
                txt_uad_parca_sira.Text = Classes.SQLConnectionClass.Command("select count(*) +1                "
                   + " from DBO.Urun_Agaci_Detaylari('" + txt_ua_kodu.Text + "'," + Convert.ToInt16(txt_ua_versiyon.Text) + ")").ToString();
                GridUpdate_Detay();
            }
        }

        void GridUpdate_Detay()
        {
            dataGridView2.DataSource = Models.URUN_AGACI_DETAY.Listele(txt_ua_kodu.Text, Convert.ToInt16(txt_ua_versiyon.Text));
        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {

                DataGridViewRow row = dataGridView2.Rows[e.RowIndex];
                txt_uad_parca_aciklama.Text = row.Cells["Aciklama"].Value.ToString();
                txt_uad_ID.Text = row.Cells["ID"].Value.ToString();
                txt_uad_parca_miktar.Text = row.Cells["Miktar"].Value.ToString();
                txt_uad_parca_maliyet.Text = row.Cells["Parça Maliyet"].Value.ToString();
                txt_uad_parca_sira.Text = row.Cells["Parça Sıra"].Value.ToString();
                txt_uad_parca_ismi.Text = row.Cells["Parça İsmi"].Value.ToString();
                txt_uad_parca_no.Text = row.Cells["Parça No"].Value.ToString();
            }
            catch (ArgumentOutOfRangeException)
            {

            }
        }

        private void btn_temizle_Click(object sender, EventArgs e)
        {
            temizle();
            txt_ua_kodu.Enabled = true;
        }
        void temizle()
        {
            dataGridView2.DataSource = null;
            txt_uad_ID.Text = "0";
            txt_uad_parca_maliyet.Text = "0";
            txt_uad_parca_sira.Text = "0";
            txt_uad_parca_miktar.Text = "0";
            txt_ua_ID.Text = "0";

            txt_uad_parca_aciklama.Text = "";
            txt_uad_parca_ismi.Text = "";
            txt_uad_parca_no.Text = "";
            txt_ua_adi.Text = "";
            txt_ua_kodu.Text = "";
            txt_ua_versiyon.Text = "0";
        }

        private void gelişimLoglarıToolStripMenuItem_Click(object sender, EventArgs e)
        {
            GelisimLogGoster fr = new GelisimLogGoster();
            fr.lbl_ua_kod.Text = txt_ua_kodu.Text;
            fr.ShowDialog();
        }
    }
}
