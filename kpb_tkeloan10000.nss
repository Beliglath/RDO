/////////////////////////////////////////////
//  Kittrell's Persistent Banking System   //
//  Designed by: Brian J. Kittrell         //
//                                         //
//  This script does the following:        //
//                                         //
//  kpb_tkeloan10000 - This script allows  //
//  players to take a loan of 10000 gold.  //
/////////////////////////////////////////////

void main()
{
object oPC = GetPCSpeaker();

SetCampaignInt("kpb_bank", "KPB_LOAN_YEAR", GetCalendarYear(), oPC);
SetCampaignInt("kpb_bank", "KPB_LOAN_MONTH", GetCalendarMonth(), oPC);
SetCampaignInt("kpb_bank", "KPB_LOAN_DAY", GetCalendarDay(), oPC);

int iMonth = GetCalendarMonth();
int iDay = GetCalendarDay();
int iYear = GetCalendarYear();

int nLoan = 10000;
    GiveGoldToCreature(oPC, nLoan);
    SetCampaignInt("kpb_bank", "KPB_LOAN_AMT", nLoan, oPC);
    SpeakString("Bien los intereses se cobraran en una semana.", TALKVOLUME_TALK);
}
