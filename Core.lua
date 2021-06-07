MY__FRAME = CreateFrame("FRAME");

MY__FRAME:SetScript("OnEvent", function (self, event, ...)

	if (event == "UNIT_SPELLCAST_SUCCEEDED")and arg2 == "Wehklagen der Hochgeborenen" then

		local mRank = nil;
		local playerName = UnitName("player")

		for i = 1, MAX_RAID_MEMBERS do
			local name, rank = GetRaidRosterInfo(i)
			if name == playerName then
				mRank = rank;
			end
		end
		
		local name = GetUnitName(arg1)
		
		if name == Bastard then return end
		
		Bastard = name;
		
		if(GetNumRaidMembers() > 0) then
			if mRank >= 1 then
				SendChatMessage(name .. " hat Klagegeister gestellt, du Bastard!!!", "RAID_WARNING");
			else 
				SendChatMessage(name .. " hat Klagegeister gestellt, du Bastard!!!", "RAID");
			end
		elseif(GetNumGroupMembers() > 0) then
			SendChatMessage(name .. " hat Klagegeister gestellt, du Bastard!!!", "PARTY");
		else
			SendChatMessage(name .. " hat Klagegeister gestellt, du Bastard!!!", "SAY");
		end
	end

end);

MY__FRAME:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED");
