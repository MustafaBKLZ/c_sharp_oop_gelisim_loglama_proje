using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace GelisimYonetimLoglamaMantigi.Models
{
    public class URUN_AGACI_DETAY : Interfaces.ISQL_Islemleri

    {
        private int uad_ID = 0; // burada dikkat. private değişken küçük harfle başlıyor
        public int Uad_ID // bu büyük harfle başlıyor.
        {
            get
            {
                return uad_ID;
            }
            set
            {
                uad_ID = Math.Abs(value); // mutlak değer alır.
            }
        }

        private string uad_uam_Kod = "";
        public string Uad_uam_Kod // bu büyük harfle başlıyor.
        {
            get
            {
                return uad_uam_Kod;
            }
            set
            {
                uad_uam_Kod = value.ToUpper(); // büyük harf olsun
            }
        }

        private string uad_uam_Versiyon = "";
        public string Uad_uam_Versiyon // bu büyük harfle başlıyor.
        {
            get
            {
                return uad_uam_Versiyon;
            }
            set
            {
                uad_uam_Versiyon = value.ToUpper(); // büyük harf olsun
            }
        }

        private int uad_Parca_Sira = 0;
        public int Uad_Parca_Sira // bu büyük harfle başlıyor.
        {
            get
            {
                return uad_Parca_Sira;
            }
            set
            {
                uad_Parca_Sira = Math.Abs(value); // mutlak değer alır.
            }
        }

        private string uad_Parca_No = "";
        public string Uad_Parca_No // bu büyük harfle başlıyor.
        {
            get
            {
                return uad_Parca_No;
            }
            set
            {
                uad_Parca_No = value.ToUpper(); // büyük harf olsun
            }
        }

        private string uad_Parca_Ismi = "";
        public string Uad_Parca_Ismi // bu büyük harfle başlıyor.
        {
            get
            {
                return uad_Parca_Ismi;
            }
            set
            {
                uad_Parca_Ismi = value.ToUpper(); // büyük harf olsun
            }
        }

        private double uad_Miktar = 0;
        public double Uad_Miktar // bu büyük harfle başlıyor.
        {
            get
            {
                return uad_Miktar;
            }
            set
            {
                uad_Miktar = value;
            }
        }

        private double uad_Parca_Maliyet = 0;
        public double Uad_Parca_Maliyet // bu büyük harfle başlıyor.
        {
            get
            {
                return uad_Parca_Maliyet;
            }
            set
            {
                uad_Parca_Maliyet = value;
            }
        }

        private string uad_Aciklama = "";
        public string Uad_Aciklama // bu büyük harfle başlıyor.
        {
            get
            {
                return uad_Aciklama;
            }
            set
            {
                uad_Aciklama = value.ToUpper(); // büyük harf olsun
            }
        }

        public URUN_AGACI_DETAY()
        {
            // constructor metodumuz
        }

        public URUN_AGACI_DETAY(int Id, string Kod, string Versiyon, int Sira, string ParcaNo, string ParcaIsmi, double Miktar, double Parca_Maliyet, string aciklama)
        {
            this.Uad_ID = Id; // büyük harflerle başlşayanları kullanmamız lazım. Yoksa encapsulation uygulamamızın bir anlamı kalmıyor.
            this.Uad_uam_Kod = Kod;
            this.Uad_uam_Versiyon = Versiyon;
            this.Uad_Parca_Sira = Sira;
            this.Uad_Parca_No = ParcaNo;
            this.Uad_Parca_Ismi = ParcaIsmi;
            this.Uad_Miktar = Miktar;
            this.Uad_Parca_Maliyet = Parca_Maliyet;
            this.Uad_Aciklama = aciklama;
        }

        public virtual void Kaydet()
        {
            new URUN_AGACI_DETAY_Log(this.uad_uam_Kod, this.uad_uam_Versiyon).Kaydet();

            if (this.Uad_ID == 0)
            {
                Classes.SQLConnectionClass.Command(""
                  + "  INSERT INTO[dbo].[URUN_AGACI_DETAY]       "
                  + "         ([uad_uam_Kod]                     "
                  + "         ,[uad_uam_Versiyon]                "
                  + "         ,[uad_Parca_Sira]                  "
                  + "         ,[uad_Parca_No]                    "
                  + "         ,[uad_Parca_Ismi]                  "
                  + "         ,[uad_Miktar]                      "
                  + "         ,[uad_Parca_Maliyet]               "
                  + "         ,[uad_Aciklama])                   "
                  + "   VALUES                                   "
                  + "         ( '" + Uad_uam_Kod + "' "// < uad_uam_Kod, nvarchar(50),>     "
                  + "         , '" + Uad_uam_Versiyon + "' "// < uad_uam_Versiyon, nvarchar(50),>"
                  + "         ,  " + Uad_Parca_Sira + "  "//< uad_Parca_Sira, int,>           "
                  + "         , '" + Uad_Parca_No + "'    "//< uad_Parca_No, nvarchar(50),>    "
                  + "         , '" + Uad_Parca_Ismi + "'    "//< uad_Parca_Ismi, nvarchar(50),>  "
                  + "         ,  " + Uad_Miktar.ToString().Replace(",", ".") + "    "//< uad_Miktar, float,>             "
                  + "         ,  " + Uad_Parca_Maliyet.ToString().Replace(",", ".") + "    "//< uad_Parca_Maliyet, float,>      "
                  + "         , '" + Uad_Aciklama + "' )   "//< uad_Aciklama, nvarchar(50),>)   "
                  );
                // .ToString().Replace(",", ".") bunun anlamı virgül olarak giden ondalık ayracını nokta yaparak SQL kabul ettiği hale getiriyoruz.
                // EF (Entity Framework) veya parametre kullanmadığımız için bu şekilde çözüyoruz :)
            }
            else
            {
                
                Classes.SQLConnectionClass.Command(""
                 + "  update [dbo].[URUN_AGACI_DETAY]       set  "
                 + "          [uad_uam_Kod]         =  '" + Uad_uam_Kod + "'    "// < uad_uam_Kod, nvarchar(50),>     "
                 + "         ,[uad_uam_Versiyon]    =  '" + Uad_uam_Versiyon + "' "// < uad_uam_Versiyon, nvarchar(50),>"
                 + "         ,[uad_Parca_Sira]      =   " + Uad_Parca_Sira + "  "//< uad_Parca_Sira, int,>           "
                 + "         ,[uad_Parca_No]        =  '" + Uad_Parca_No + "'    "//< uad_Parca_No, nvarchar(50),>    "
                 + "         ,[uad_Parca_Ismi]      =  '" + Uad_Parca_Ismi + "'    "//< uad_Parca_Ismi, nvarchar(50),>  "
                 + "         ,[uad_Miktar]          =   " + Uad_Miktar.ToString().Replace(",", ".") + "    "//< uad_Miktar, float,>             "
                 + "         ,[uad_Parca_Maliyet]   =   " + Uad_Parca_Maliyet.ToString().Replace(",", ".") + "    "//< uad_Parca_Maliyet, float,>      "
                 + "         ,[uad_Aciklama]        =  '" + Uad_Aciklama + "'    "//< uad_Aciklama, nvarchar(50),>)   "
                 + "   where        Uad_ID = " + Uad_ID + "                            ");
            }
        }




        public void Sil(int id)
        {
            Classes.SQLConnectionClass.Command("delete from URUN_AGACI_DETAY   where        Uad_ID = " + Uad_ID + "  ");
        }

        public static DataTable Listele(string kod, int versiyon) // bu sınıfa özel metod olsun bu :)
        {
            return Classes.SQLConnectionClass.Table("select * from dbo.Urun_Agaci_Detaylari('" + kod + "', " + versiyon + ")");
        }
    }
}