using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace GelisimYonetimLoglamaMantigi.Models
{
    public class URUN_AGACI_MASTER_Log : URUN_AGACI_MASTER
    {
        private int uam_Rev_No = 0;
        public int Uam_Rev_No // Encapsulation
        {
            get
            {
                return uam_Rev_No;
            }
            set
            {
                uam_Rev_No = Math.Abs(value);
            }
        }

        private string uam_Rev_User = "";
        public string Uam_Rev_User// Encapsulation
        {
            get
            {
                return uam_Rev_User;
            }
            set
            {
                uam_Rev_User = value.ToUpper();
            }
        }

        private DateTime uam_Rev_Date = DateTime.Now;
        public DateTime Uam_Rev_Date// Encapsulation
        {
            get
            {
                return uam_Rev_Date;
            }
            set
            {
                if (value.ToString().Trim() == string.Empty || value == null)
                    uam_Rev_Date = DateTime.Now;
                else
                    uam_Rev_Date = value;
            }
        }

        public URUN_AGACI_MASTER_Log() { }
        public URUN_AGACI_MASTER_Log(int ID)
        {
            DataTable dt = Classes.SQLConnectionClass.Table("select * from URUN_AGACI_MASTER where uam_ID = " + ID + "");
            this.Uam_Adi = dt.Rows[0]["uam_Adi"].ToString();
            this.Uam_Kod = dt.Rows[0]["uam_Kod"].ToString();
            this.Uam_Versiyon = Convert.ToInt16(dt.Rows[0]["uam_Versiyon"].ToString());
            this.Uam_Rev_Date = DateTime.Now;
            this.Uam_Rev_No = Convert.ToInt32(Classes.SQLConnectionClass.Command("select count(*)+1 from URUN_AGACI_MASTER_Log where uam_Kod = '" + this.Uam_Kod + "' and uam_Versiyon = " + this.Uam_Versiyon + ""));
            this.Uam_Rev_User = "Mustafa";
        }

        public void Kaydet_Log()
        {
            Classes.SQLConnectionClass.Command(""
                     + "   INSERT INTO[dbo].[URUN_AGACI_MASTER_Log] "
                     + "          ([uam_Versiyon]               "
                     + "          ,[uam_Kod]                    "
                     + "          ,[uam_Adi], uam_Rev_Date, uam_Rev_No, uam_Rev_User)                   "
                     + "    VALUES                              "
                     + "          ( " + Uam_Versiyon + "      "
                     + "          ,'" + Uam_Kod + "'   "
                     + "          ,'" + Uam_Adi + "' , '" + this.Uam_Rev_Date.ToString("yyyyMMdd") + "', " + this.Uam_Rev_No + " , '" + this.Uam_Rev_User + "')   ");
        }

        public static DataTable LogListele(string kod)
        {
            return Classes.SQLConnectionClass.Table("Select "
                    + "  uam_ID as ID  "
                    + ", uam_Adi as Adı "
                    + ", uam_Kod as Kod "
                    + ", uam_Versiyon as Versiyon "
                    + ", uam_Rev_No as Rev_No "
                    + ", uam_Rev_Date as [Date] "
                    + ", uam_Rev_User as [User] "
                    + "  from URUN_AGACI_MASTER_Log where uam_Kod = '"+kod+"' ");

        }

    }
}
