using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace GelisimYonetimLoglamaMantigi.Models
{
    public class URUN_AGACI_MASTER : Interfaces.ISQL_Islemleri
    {
        private int uam_ID = 0;
        public int Uam_ID // Encapsulation
        {
            get
            {
                return uam_ID;
            }
            set
            {
                uam_ID = Math.Abs(value); // Math.Abs sayının mutlak değerini alır. Yani eğer negatif sayı gelirse pozitife dönüştürülür. :)
            }
        }

        private int uam_Versiyon = 0;
        public int Uam_Versiyon// Encapsulation
        {
            get
            {
                return uam_Versiyon;
            }
            set
            {
                uam_Versiyon = Math.Abs(value);
            }
        }

        private string uam_Kod = "";
        public string Uam_Kod// Encapsulation
        {
            get
            {
                return uam_Kod;
            }
            set
            {
                uam_Kod = value.ToUpper(); // burada da girilen her verinin büyük harf olmasını istedik. 
            }
        }

        private string uam_Adi = ""; // bunların görünmnesini istemiyoıruyz. o yüzden private yaptık.
        public string Uam_Adi// Encapsulation
        {
            get
            {
                return uam_Adi;
            }
            set
            {
                uam_Adi = value.ToUpper();
            }
        }

        public URUN_AGACI_MASTER() { }

        public URUN_AGACI_MASTER(int ID, int Versiyon, string Kod, string Adi)
        {
            this.Uam_Adi = Adi;
            this.Uam_ID = ID;
            this.Uam_Kod = Kod;
            this.Uam_Versiyon = Versiyon;
        }

        public void Kaydet()
        {
            if (Uam_ID == 0)
            {
                Classes.SQLConnectionClass.Command(""
                         + "   INSERT INTO[dbo].[URUN_AGACI_MASTER] "
                         + "          ([uam_Versiyon]               "
                         + "          ,[uam_Kod]                    "
                         + "          ,[uam_Adi])                   "
                         + "    VALUES                              "
                         + "          ( " + Uam_Versiyon + "      "
                         + "          ,'" + Uam_Kod + "'   "
                         + "          ,'" + Uam_Adi + "')   ");
            }
            else
            {
                new URUN_AGACI_MASTER_Log(Uam_ID).Kaydet_Log();
                Classes.SQLConnectionClass.Command(""
                         + "   UPDATE [dbo].[URUN_AGACI_MASTER]  SET "
                         + "           [uam_Versiyon]  = " + Uam_Versiyon + ""
                         + "          ,[uam_Kod]    = '" + Uam_Kod + "'"
                         + "          ,[uam_Adi] = '" + Uam_Adi + "'"
                         + "    WHERE      uam_ID = " + Uam_ID + "");
            }
        }

        public void Sil(int id)
        {

        }

        public static DataTable Listele()
        {
            return Classes.SQLConnectionClass.Table("Select "
                + "  uam_ID as ID  "
                + ", uam_Adi as Adı "
                + ", uam_Kod as Kod "
                + ", uam_Versiyon as Versiyon "
                + "  from URUN_AGACI_MASTER");
        }
    }
}



