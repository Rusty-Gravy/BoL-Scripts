local voteVar = 0
local new = {}
    new['surr_start_end_header'] = 0x005C --
    new['surr_vote_header'] = 0x0124 --
    new['surr_vote_netid_pos'] = 19 --
    new['surr_vote_val_pos'] = 16 --

local decoded_table_4_new = { -- 5.19 surrender netids
    [0x01] = 0x6D,[0x02] = 0xB3,[0x03] = 0x55,[0x04] = 0x94,[0x05] = 0x87,[0x06] = 0xE5,[0x07] = 0xE6,[0x08] = 0x3F,
    [0x09] = 0x42,[0x0A] = 0x84,[0x0B] = 0x7E,[0x0C] = 0x3D,[0x0D] = 0xDD,[0x0E] = 0x33,[0x0F] = 0xDC,[0x10] = 0xA7,
    [0x11] = 0xAC,[0x12] = 0x7D,[0x13] = 0xA4,[0x14] = 0xDE,[0x15] = 0x44,[0x16] = 0xD4,[0x17] = 0x2B,[0x18] = 0xE1,
    [0x19] = 0xA2,[0x1A] = 0x6E,[0x1B] = 0x4C,[0x1C] = 0x6B,[0x1D] = 0x32,[0x1E] = 0x98,[0x1F] = 0x23,[0x20] = 0x99,
    [0x21] = 0xCD,[0x22] = 0xEA,[0x23] = 0x81,[0x24] = 0xCC,[0x25] = 0xD2,[0x26] = 0x74,[0x27] = 0x13,[0x28] = 0x08,
    [0x29] = 0x78,[0x2A] = 0x95,[0x2B] = 0xA1,[0x2C] = 0x68,[0x2D] = 0x19,[0x2E] = 0xBB,[0x2F] = 0x85,[0x30] = 0xA5,
    [0x31] = 0x5C,[0x32] = 0x31,[0x33] = 0x77,[0x34] = 0x9A,[0x35] = 0xEF,[0x36] = 0xF7,[0x37] = 0x50,[0x38] = 0x53,
    [0x39] = 0x7F,[0x3A] = 0x63,[0x3B] = 0x2C,[0x3C] = 0x61,[0x3D] = 0x8E,[0x3E] = 0xAA,[0x3F] = 0x89,[0x40] = 0xB9,
    [0x41] = 0x8D,[0x43] = 0xCB,[0x44] = 0xC4,[0x45] = 0x05,[0x46] = 0x97,[0x47] = 0x1A,[0x48] = 0x30,[0x49] = 0xDA,
    [0x4A] = 0x38,[0x4B] = 0x96,[0x4C] = 0xD5,[0x4D] = 0xB2,[0x4E] = 0xCA,[0x4F] = 0x1D,[0x50] = 0x71,[0x51] = 0x62,
    [0x52] = 0x35,[0x53] = 0x0B,[0x54] = 0x92,[0x55] = 0xC9,[0x56] = 0xBF,[0x57] = 0xF3,[0x58] = 0xE0,[0x59] = 0x0D,
    [0x5A] = 0x9B,[0x5B] = 0xF2,[0x5C] = 0x11,[0x5D] = 0xA3,[0x5E] = 0xF8,[0x5F] = 0x88,[0x60] = 0x45,[0x61] = 0x76,
    [0x62] = 0xE4,[0x63] = 0x1E,[0x64] = 0x5E,[0x65] = 0x14,[0x66] = 0x06,[0x67] = 0x60,[0x68] = 0xC1,[0x69] = 0xBE,
    [0x6A] = 0xD1,[0x6B] = 0x57,[0x6C] = 0x2E,[0x6D] = 0x9F,[0x6E] = 0xAE,[0x6F] = 0x59,[0x70] = 0x01,[0x71] = 0x91,
    [0x72] = 0xFE,[0x73] = 0x9C,[0x74] = 0xA6,[0x75] = 0x8B,[0x76] = 0x12,[0x77] = 0x02,[0x78] = 0x48,[0x79] = 0x5B,
    [0x7A] = 0x1F,[0x7B] = 0xF0,[0x7C] = 0x8F,[0x7D] = 0x58,[0x7E] = 0xB5,[0x7F] = 0x03,[0x80] = 0xED,[0x81] = 0x5D,
    [0x82] = 0x17,[0x83] = 0x21,[0x84] = 0xD0,[0x85] = 0x67,[0x86] = 0x1C,[0x87] = 0x18,[0x88] = 0xE3,[0x89] = 0x39,
    [0x8A] = 0x8C,[0x8B] = 0x4E,[0x8C] = 0x72,[0x8D] = 0x5F,[0x8E] = 0xAF,[0x8F] = 0xC2,[0x90] = 0x22,[0x91] = 0x40,
    [0x92] = 0xB1,[0x93] = 0xC6,[0x94] = 0xA8,[0x95] = 0x09,[0x96] = 0x83,[0x97] = 0xD7,[0x98] = 0xE2,[0x99] = 0x73,
    [0x9A] = 0x37,[0x9B] = 0x6C,[0x9C] = 0x93,[0x9D] = 0xCE,[0x9E] = 0x04,[0x9F] = 0x47,[0xA0] = 0xB7,[0xA1] = 0x3A,
    [0xA2] = 0x41,[0xA3] = 0xF5,[0xA4] = 0x3C,[0xA5] = 0xA9,[0xA7] = 0x52,[0xA8] = 0xBC,[0xA9] = 0x69,[0xAA] = 0x70,
    [0xAB] = 0xFA,[0xAC] = 0x0F,[0xAD] = 0xBD,[0xAE] = 0x2F,[0xAF] = 0x8A,[0xB0] = 0x54,[0xB1] = 0x2A,[0xB2] = 0x9D,
    [0xB3] = 0x75,[0xB4] = 0xD9,[0xB5] = 0xC5,[0xB6] = 0xFF,[0xB7] = 0x79,[0xB8] = 0x6F,[0xB9] = 0x7B,[0xBA] = 0x00,
    [0xBB] = 0x6A,[0xBC] = 0x65,[0xBD] = 0x46,[0xBE] = 0xD8,[0xBF] = 0x2D,[0xC0] = 0xAD,[0xC1] = 0x3E,[0xC2] = 0x4D,
    [0xC3] = 0x27,[0xC4] = 0x7A,[0xC5] = 0x51,[0xC6] = 0x66,[0xC7] = 0xC8,[0xC8] = 0xB4,[0xC9] = 0x86,[0xCA] = 0xD3,
    [0xCB] = 0x9E,[0xCC] = 0x0E,[0xCD] = 0x5A,[0xCE] = 0x49,[0xCF] = 0x29,[0xD0] = 0x26,[0xD1] = 0xD6,[0xD2] = 0x4A,
    [0xD3] = 0xB8,[0xD4] = 0xDF,[0xD5] = 0xDB,[0xD6] = 0x07,[0xD7] = 0x20,[0xD8] = 0x4F,[0xD9] = 0xA0,[0xDA] = 0xFB,
    [0xDB] = 0x4B,[0xDC] = 0x0C,[0xDD] = 0xF6,[0xDE] = 0xF4,[0xDF] = 0x24,[0xE0] = 0x28,[0xE1] = 0x10,[0xE2] = 0x1B,
    [0xE3] = 0xB0,[0xE4] = 0x90,[0xE5] = 0xB6,[0xE6] = 0xAB,[0xE7] = 0xEE,[0xE8] = 0xEB,[0xE9] = 0xEC,[0xEA] = 0xC7,
    [0xEB] = 0xC3,[0xEC] = 0x80,[0xED] = 0x43,[0xEE] = 0x36,[0xEF] = 0xCF,[0xF0] = 0x3B,[0xF1] = 0x15,[0xF2] = 0x64,
    [0xF3] = 0x16,[0xF4] = 0x25,[0xF5] = 0x56,[0xF6] = 0x82,[0xF7] = 0x7C,[0xF8] = 0x0A,[0xF9] = 0xF9,[0xFA] = 0xFD,
    [0xFB] = 0x34,[0xFC] = 0xFC,[0xFD] = 0xC0,[0xFF] = 0xBA,[0x00] = 0xF1,
}

function OnRecvPacket(p)
    if p.header == new['surr_start_end_header'] then
        voteVar = 0
    elseif p.header == new['surr_vote_header'] then
        p.pos = new['surr_vote_netid_pos']
        local networkID = PacketDecryptF(p:DecodeF(), decoded_table_4_new)
        local who = objManager:GetObjectByNetworkId(networkID)
        
        p.pos = new['surr_vote_val_pos']
        local vote = p:Decode1()
        
        if voteVar == 0 then
            voteVar = vote
        end
        
        if vote == voteVar then
            voteTxt = "<font color=\"#00FF00\">YES</font>"
        else 
            voteTxt = "<font color=\"#FF0000\">NO</font>"
        end
        
        if who then
            PrintChat("<font color=\"#00FF00\">[Surrender]</font><font color=\"#FFCC00\"> "..who.charName.."</font><font color=\"#00FF00\"> voted </font>"..voteTxt)
        else
            print("Error on detecting who votes, detected vote is: "..voteTxt)
        end
    end
end

function PacketDecryptF(float, mapTable)
    local dummy = CLoLPacket(0)
    dummy:EncodeF(float)
    dummy.pos = dummy.pos - 4
    local F = { dummy:Decode1(), dummy:Decode1(), dummy:Decode1(), dummy:Decode1() }
    if mapTable[F[1]] and mapTable[F[2]] and mapTable[F[3]] and mapTable[F[4]] then
        dummy:Encode1(mapTable[F[1]])
        dummy:Encode1(mapTable[F[2]])
        dummy:Encode1(mapTable[F[3]])
        dummy:Encode1(mapTable[F[4]])
        dummy.pos = dummy.pos - 4
        return dummy:DecodeF()
    end
    return 0
end

-- scriptstatus
assert(load(Base64Decode("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"), nil, "bt", _ENV))() ScriptStatus("QDGCLIKIGJK") 
--
