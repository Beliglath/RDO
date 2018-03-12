void main()
{
    int modificador = -1;
    if (GetAlignmentGoodEvil(OBJECT_SELF)==GetAlignmentGoodEvil(GetMaster(OBJECT_SELF))) {
        if (!(GetAlignmentGoodEvil(OBJECT_SELF)==GetAlignmentGoodEvil(GetPCSpeaker())))
            modificador = modificador + 2;
    } else {
        if (GetAlignmentGoodEvil(OBJECT_SELF)==GetAlignmentGoodEvil(GetPCSpeaker()))
            modificador = modificador - 2;
    }
    int DC = GetLocalInt(OBJECT_SELF, "vsDC") + modificador;
    if (GetIsSkillSuccessful(GetPCSpeaker(), SKILL_PERSUADE, DC)) {
        SetCustomToken(108, "Esta bien. Ire contigo.");
        RemoveHenchman(GetMaster(OBJECT_SELF));
        AddHenchman(GetPCSpeaker(), OBJECT_SELF);
        TakeGoldFromCreature(GetLocalInt(OBJECT_SELF, "Precio")+GetLevelByPosition(1)+GetLevelByPosition(2)+GetLevelByPosition(3), GetPCSpeaker());
    } else {
        SetCustomToken(108, "Bah! Prefiero seguir con quien estoy.");
        SetLocalInt(GetPCSpeaker(), GetName(OBJECT_SELF), 1);
    }
    AdjustAlignment(GetPCSpeaker(), ALIGNMENT_CHAOTIC, 1);
    string sID = GetName(GetPCSpeaker()); if(GetStringLength(sID) > 0) { sID = GetStringLeft(sID, 25); }
    SetLocalInt(OBJECT_SELF, "Rob"+sID, 1);
}
