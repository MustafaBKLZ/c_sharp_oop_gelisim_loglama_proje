using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace GelisimYonetimLoglamaMantigi.Models
{
    public class URUN_AGACI_DETAY_Log : URUN_AGACI_DETAY
    {
        private int uad_uam_Rev_No = 0; // miras aldığımız tabloda sadece bu kolon yok. 
        public int Uad_uam_Rev_No // bu büyük harfle başlıyor.
        {
            get
            {
                return uad_uam_Rev_No;
            }
            set
            {
                uad_uam_Rev_No = Math.Abs(value); // mutlak değer alır.
            }
        }

        public URUN_AGACI_DETAY_Log() { }
        public URUN_AGACI_DETAY_Log(string Kod, string Versiyon)
        {
            this.Uad_uam_Kod = Kod;
            this.Uad_uam_Versiyon = Versiyon;
        }

        public override void Kaydet()
        {
            Classes.SQLConnectionClass.Command(""
              + "  INSERT INTO[dbo].[URUN_AGACI_DETAY_Log] "
              + "             ([uad_uam_Versiyon]          "
              + "             ,[uad_uam_Rev_No]            "
              + "             ,[uad_uam_Kod]               "
              + "             ,[uad_Parca_Sira]            "
              + "             ,[uad_Parca_No]              "
              + "             ,[uad_Parca_Ismi]            "
              + "             ,[uad_Miktar]                "
              + "             ,[uad_Parca_Maliyet]         "
              + "             ,[uad_Aciklama])             "
              + "  SELECT                                  "
              + "         [uad_uam_Versiyon]               "
              + "        , (select max(uam_Rev_No) from URUN_AGACI_MASTER_log where  [uam_Kod] = '" + this.Uad_uam_Kod + "' and [uam_Versiyon] = " + this.Uad_uam_Versiyon + ")                              "
              + "        ,[uad_uam_Kod]                    "
              + "        ,[uad_Parca_Sira]                 "
              + "        ,[uad_Parca_No]                   "
              + "        ,[uad_Parca_Ismi]                 "
              + "        ,[uad_Miktar]                     "
              + "        ,[uad_Parca_Maliyet]              "
              + "        ,[uad_Aciklama]                   "
              + "          FROM[dbo].[URUN_AGACI_DETAY] where  [uad_uam_Kod] = '" + this.Uad_uam_Kod + "' and [uad_uam_Versiyon] = " + this.Uad_uam_Versiyon + "");
        }


        public static DataTable LogListele(string kod, int versiyon, int rev) // bu sınıfa özel metod olsun bu :)
        {
            return Classes.SQLConnectionClass.Table("select * from dbo.Urun_Agaci_Detaylari_log('" + kod + "', " + versiyon + "," + rev + " )");
        }

    }
}
