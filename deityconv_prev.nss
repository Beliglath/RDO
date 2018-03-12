// Advance to the previous deity.

#include "deityconv_inc"

// Assumes at least one deity.

void main()
{
    // Retrieve the current deity and subtract 1.
    int nDeity = GetLocalInt(OBJECT_SELF, "DeityToTalkAbout") - 1;

    object oModule = GetModule();
    int iMax;
    int iMin;
    int iPanteon = GetLocalInt(OBJECT_SELF, "NroPanteon");
    switch (iPanteon) {
        case 0:     iMax = GetLocalInt(oModule, "NroDiosesPanteonGeneral");
                    iMin = 0;
                    break;
        case 1:     iMax = GetLocalInt(oModule, "NroDiosesPanteonGeneral") + GetLocalInt(oModule, "NroDiosesPanteonElfico");
                    iMin = GetLocalInt(oModule, "NroDiosesPanteonGeneral");
                    break;
        case 2:     iMax = GetLocalInt(oModule, "NroDiosesPanteonGeneral") + GetLocalInt(oModule, "NroDiosesPanteonElfico") + GetLocalInt(oModule, "NroDiosesPanteonEnano");
                    iMin = GetLocalInt(oModule, "NroDiosesPanteonGeneral") + GetLocalInt(oModule, "NroDiosesPanteonElfico");
                    break;
        case 3:     iMax = GetLocalInt(oModule, "NroDiosesPanteonGeneral") + GetLocalInt(oModule, "NroDiosesPanteonElfico") + GetLocalInt(oModule, "NroDiosesPanteonEnano") + GetLocalInt(oModule, "NroDiosesPanteonGnomo");
                    iMin = GetLocalInt(oModule, "NroDiosesPanteonGeneral") + GetLocalInt(oModule, "NroDiosesPanteonElfico") + GetLocalInt(oModule, "NroDiosesPanteonEnano");
                    break;
        case 4:     iMax = GetLocalInt(oModule, "NroDiosesPanteonGeneral") + GetLocalInt(oModule, "NroDiosesPanteonElfico") + GetLocalInt(oModule, "NroDiosesPanteonEnano") + GetLocalInt(oModule, "NroDiosesPanteonGnomo") + GetLocalInt(oModule, "NroDiosesPanteonMediano");
                    iMin = GetLocalInt(oModule, "NroDiosesPanteonGeneral") + GetLocalInt(oModule, "NroDiosesPanteonElfico") + GetLocalInt(oModule, "NroDiosesPanteonEnano") + GetLocalInt(oModule, "NroDiosesPanteonGnomo");
                    break;
    }
    // Adjust for underflow.
    if ( nDeity < iMin )
        nDeity = iMax -1;

    // Record this as the current deity.
    SetLocalInt(OBJECT_SELF, "DeityToTalkAbout", nDeity);

    // Initialize the conversation tokens.
    SetupDeityConversationTokens(nDeity);
}
