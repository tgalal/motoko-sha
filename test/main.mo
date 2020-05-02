/**
 * Module      : main.mo
 * Description : Unit tests.
 * Copyright   : 2020 DFINITY Stiftung
 * License     : Apache 2.0 with LLVM Exception
 * Maintainer  : Enzo Haussecker <enzo@dfinity.org>
 * Stability   : Stable
 */

import Array "mo:stdlib/array";
import SHA256 "../src/sha256";

actor {

  private type Test = {
    data : [Word8];
    expect : [Word8];
  };

  private let tests = [
    {
      data = [
      ] : [Word8];
      expect = [
        227, 176, 196, 066, 152, 252, 028, 020,
        154, 251, 244, 200, 153, 111, 185, 036,
        039, 174, 065, 228, 100, 155, 147, 076,
        164, 149, 153, 027, 120, 082, 184, 085,
      ] : [Word8];
    },
    {
      data = [
        097,
      ] : [Word8];
      expect = [
        202, 151, 129, 018, 202, 027, 189, 202,
        250, 194, 049, 179, 154, 035, 220, 077,
        167, 134, 239, 248, 020, 124, 078, 114,
        185, 128, 119, 133, 175, 238, 072, 187,
      ] : [Word8];
    },
    {
      data = [
        097, 098,
      ] : [Word8];
      expect = [
        251, 142, 032, 252, 046, 076, 063, 036,
        140, 096, 195, 155, 214, 082, 243, 193,
        052, 114, 152, 187, 151, 123, 139, 077,
        089, 003, 184, 080, 085, 098, 006, 003,
      ] : [Word8];
    },
    {
      data = [
        097, 098, 099,
      ] : [Word8];
      expect = [
        186, 120, 022, 191, 143, 001, 207, 234,
        065, 065, 064, 222, 093, 174, 034, 035,
        176, 003, 097, 163, 150, 023, 122, 156,
        180, 016, 255, 097, 242, 000, 021, 173,
      ] : [Word8];
    },
    {
      data = [
        097, 098, 099, 100,
      ] : [Word8];
      expect = [
        136, 212, 038, 111, 212, 230, 051, 141,
        019, 184, 069, 252, 242, 137, 087, 157,
        032, 156, 137, 120, 035, 185, 033, 125,
        163, 225, 097, 147, 111, 003, 021, 137,
      ] : [Word8];
    },
    {
      data = [
        097, 098, 099, 100, 101,
      ] : [Word8];
      expect = [
        054, 187, 229, 014, 217, 104, 065, 209,
        004, 067, 188, 182, 112, 214, 085, 079,
        010, 052, 183, 097, 190, 103, 236, 156,
        074, 138, 210, 192, 196, 076, 164, 044,
      ] : [Word8];
    },
    {
      data = [
        097, 098, 099, 100, 101, 102,
      ] : [Word8];
      expect = [
        190, 245, 126, 199, 245, 058, 109, 064,
        190, 182, 064, 167, 128, 166, 057, 200,
        059, 194, 154, 200, 169, 129, 111, 031,
        198, 197, 198, 220, 217, 060, 071, 033,
      ] : [Word8];
    },
    {
      data = [
        097, 098, 099, 100, 101, 102, 103,
      ] : [Word8];
      expect = [
        125, 026, 084, 018, 123, 034, 037, 002,
        245, 183, 155, 095, 176, 128, 048, 097,
        021, 042, 068, 249, 043, 055, 226, 060,
        101, 039, 186, 246, 101, 212, 218, 154,
      ] : [Word8];
    },
    {
      data = [
        097, 098, 099, 100, 101, 102, 103, 104,
      ] : [Word8];
      expect = [
        156, 086, 204, 081, 179, 116, 195, 186,
        024, 146, 016, 213, 182, 212, 191, 087,
        121, 013, 053, 028, 150, 196, 124, 002,
        025, 014, 207, 030, 067, 006, 053, 171,
      ] : [Word8];
    },
    {
      data = [
        097, 098, 099, 100, 101, 102, 103, 104,
        105,
      ] : [Word8];
      expect = [
        025, 204, 002, 242, 109, 244, 060, 197,
        113, 188, 158, 215, 176, 196, 210, 146,
        036, 163, 236, 034, 149, 041, 034, 023,
        037, 239, 118, 208, 033, 200, 050, 111,
      ] : [Word8];
    },
    {
      data = [
        097, 098, 099, 100, 101, 102, 103, 104,
        105, 106,
      ] : [Word8];
      expect = [
        114, 057, 147, 097, 218, 106, 119, 084,
        254, 201, 134, 220, 165, 183, 203, 175,
        028, 129, 010, 040, 222, 212, 171, 175,
        086, 178, 016, 109, 006, 203, 120, 176,
      ] : [Word8];
    },
    {
      data = [
        068, 105, 115, 099, 097, 114, 100, 032,
        109, 101, 100, 105, 099, 105, 110, 101,
        032, 109, 111, 114, 101, 032, 116, 104,
        097, 110, 032, 116, 119, 111, 032, 121,
        101, 097, 114, 115, 032, 111, 108, 100,
        046,
      ] : [Word8];
      expect = [
        161, 068, 006, 028, 039, 031, 021, 045,
        164, 209, 081, 003, 069, 008, 254, 209,
        193, 056, 184, 201, 118, 051, 157, 226,
        041, 195, 187, 109, 075, 187, 079, 206,
      ] : [Word8];
    },
    {
      data = [
        072, 101, 032, 119, 104, 111, 032, 104,
        097, 115, 032, 097, 032, 115, 104, 097,
        100, 121, 032, 112, 097, 115, 116, 032,
        107, 110, 111, 119, 115, 032, 116, 104,
        097, 116, 032, 110, 105, 099, 101, 032,
        103, 117, 121, 115, 032, 102, 105, 110,
        105, 115, 104, 032, 108, 097, 115, 116,
        046,
      ] : [Word8];
      expect = [
        109, 174, 092, 170, 113, 058, 016, 173,
        004, 180, 096, 040, 191, 109, 173, 104,
        131, 124, 088, 022, 022, 161, 088, 154,
        038, 090, 017, 040, 141, 075, 181, 196,
      ] : [Word8];
    },
    {
      data = [
        073, 032, 119, 111, 117, 108, 100, 110,
        039, 116, 032, 109, 097, 114, 114, 121,
        032, 104, 105, 109, 032, 119, 105, 116,
        104, 032, 097, 032, 116, 101, 110, 032,
        102, 111, 111, 116, 032, 112, 111, 108,
        101, 046,
      ] : [Word8];
      expect = [
        174, 122, 112, 042, 149, 009, 003, 157,
        219, 242, 159, 007, 101, 231, 013, 000,
        001, 023, 121, 020, 184, 100, 089, 040,
        077, 171, 139, 052, 140, 045, 206, 063,
      ] : [Word8];
    },
    {
      data = [
        070, 114, 101, 101, 033, 032, 070, 114,
        101, 101, 033, 047, 065, 032, 116, 114,
        105, 112, 047, 116, 111, 032, 077, 097,
        114, 115, 047, 102, 111, 114, 032, 057,
        048, 048, 047, 101, 109, 112, 116, 121,
        032, 106, 097, 114, 115, 047, 066, 117,
        114, 109, 097, 032, 083, 104, 097, 118,
        101,
      ] : [Word8];
      expect = [
        103, 072, 069, 011, 001, 197, 104, 088,
        103, 021, 041, 029, 250, 062, 224, 024,
        218, 007, 211, 107, 183, 234, 111, 024,
        012, 026, 246, 039, 002, 021, 198, 079,
      ] : [Word8];
    },
    {
      data = [
        084, 104, 101, 032, 100, 097, 121, 115,
        032, 111, 102, 032, 116, 104, 101, 032,
        100, 105, 103, 105, 116, 097, 108, 032,
        119, 097, 116, 099, 104, 032, 097, 114,
        101, 032, 110, 117, 109, 098, 101, 114,
        101, 100, 046, 032, 032, 045, 084, 111,
        109, 032, 083, 116, 111, 112, 112, 097,
        114, 100,
      ] : [Word8];
      expect = [
        020, 184, 032, 020, 173, 043, 017, 246,
        097, 181, 174, 106, 153, 183, 081, 005,
        194, 255, 172, 039, 140, 208, 113, 205,
        108, 005, 131, 039, 147, 099, 087, 116,
      ] : [Word8];
    },
    {
      data = [
        078, 101, 112, 097, 108, 032, 112, 114,
        101, 109, 105, 101, 114, 032, 119, 111,
        110, 039, 116, 032, 114, 101, 115, 105,
        103, 110, 046,
      ] : [Word8];
      expect = [
        113, 002, 207, 215, 110, 046, 050, 072,
        137, 238, 206, 093, 108, 065, 146, 027,
        030, 020, 042, 074, 197, 162, 105, 043,
        231, 136, 003, 009, 127, 106, 072, 216,
      ] : [Word8];
    },
    {
      data = [
        070, 111, 114, 032, 101, 118, 101, 114,
        121, 032, 097, 099, 116, 105, 111, 110,
        032, 116, 104, 101, 114, 101, 032, 105,
        115, 032, 097, 110, 032, 101, 113, 117,
        097, 108, 032, 097, 110, 100, 032, 111,
        112, 112, 111, 115, 105, 116, 101, 032,
        103, 111, 118, 101, 114, 110, 109, 101,
        110, 116, 032, 112, 114, 111, 103, 114,
        097, 109, 046,
      ] : [Word8];
      expect = [
        035, 177, 001, 140, 216, 029, 177, 214,
        121, 131, 197, 247, 065, 124, 068, 218,
        157, 235, 088, 036, 089, 227, 120, 215,
        160, 104, 085, 046, 166, 073, 220, 159,
      ] : [Word8];
    },
    {
      data = [
        072, 105, 115, 032, 109, 111, 110, 101,
        121, 032, 105, 115, 032, 116, 119, 105,
        099, 101, 032, 116, 097, 105, 110, 116,
        101, 100, 058, 032, 039, 116, 097, 105,
        110, 116, 032, 121, 111, 117, 114, 115,
        032, 097, 110, 100, 032, 039, 116, 097,
        105, 110, 116, 032, 109, 105, 110, 101,
        046,
      ] : [Word8];
      expect = [
        128, 001, 241, 144, 223, 181, 039, 038,
        028, 076, 252, 171, 112, 201, 142, 128,
        151, 167, 161, 146, 033, 041, 188, 064,
        150, 149, 014, 087, 199, 153, 154, 090,
      ] : [Word8];
    },
    {
      data = [
        084, 104, 101, 114, 101, 032, 105, 115,
        032, 110, 111, 032, 114, 101, 097, 115,
        111, 110, 032, 102, 111, 114, 032, 097,
        110, 121, 032, 105, 110, 100, 105, 118,
        105, 100, 117, 097, 108, 032, 116, 111,
        032, 104, 097, 118, 101, 032, 097, 032,
        099, 111, 109, 112, 117, 116, 101, 114,
        032, 105, 110, 032, 116, 104, 101, 105,
        114, 032, 104, 111, 109, 101, 046, 032,
        045, 075, 101, 110, 032, 079, 108, 115,
        101, 110, 044, 032, 049, 057, 055, 055,
      ] : [Word8];
      expect = [
        140, 135, 222, 182, 085, 005, 195, 153,
        062, 178, 075, 122, 021, 012, 065, 085,
        232, 046, 238, 105, 096, 207, 012, 058,
        129, 020, 255, 115, 109, 105, 202, 213,
      ] : [Word8];
    },
    {
      data = [
        073, 116, 039, 115, 032, 097, 032, 116,
        105, 110, 121, 032, 099, 104, 097, 110,
        103, 101, 032, 116, 111, 032, 116, 104,
        101, 032, 099, 111, 100, 101, 032, 097,
        110, 100, 032, 110, 111, 116, 032, 099,
        111, 109, 112, 108, 101, 116, 101, 108,
        121, 032, 100, 105, 115, 103, 117, 115,
        116, 105, 110, 103, 046, 032, 045, 032,
        066, 111, 098, 032, 077, 097, 110, 099,
        104, 101, 107,
      ] : [Word8];
      expect = [
        191, 176, 166, 122, 025, 205, 236, 054,
        070, 073, 139, 046, 015, 117, 027, 221,
        196, 027, 186, 075, 127, 048, 008, 027,
        011, 147, 042, 173, 033, 077, 022, 215,
      ] : [Word8];
    },
    {
      data = [
        115, 105, 122, 101, 058, 032, 032, 097,
        046, 111, 117, 116, 058, 032, 032, 098,
        097, 100, 032, 109, 097, 103, 105, 099,
      ] : [Word8];
      expect = [
        127, 154, 011, 155, 245, 099, 050, 225,
        159, 090, 014, 193, 173, 156, 020, 037,
        161, 083, 218, 028, 098, 072, 104, 253,
        164, 069, 097, 214, 183, 077, 175, 054,
      ] : [Word8];
    },
    {
      data = [
        084, 104, 101, 032, 109, 097, 106, 111,
        114, 032, 112, 114, 111, 098, 108, 101,
        109, 032, 105, 115, 032, 119, 105, 116,
        104, 032, 115, 101, 110, 100, 109, 097,
        105, 108, 046, 032, 032, 045, 077, 097,
        114, 107, 032, 072, 111, 114, 116, 111,
        110,
      ] : [Word8];
      expect = [
        177, 063, 129, 184, 170, 217, 227, 102,
        104, 121, 175, 025, 136, 097, 064, 144,
        079, 127, 066, 158, 240, 131, 040, 097,
        149, 152, 042, 117, 136, 133, 140, 252,
      ] : [Word8];
    },
    {
      data = [
        071, 105, 118, 101, 032, 109, 101, 032,
        097, 032, 114, 111, 099, 107, 044, 032,
        112, 097, 112, 101, 114, 032, 097, 110,
        100, 032, 115, 099, 105, 115, 115, 111,
        114, 115, 032, 097, 110, 100, 032, 073,
        032, 119, 105, 108, 108, 032, 109, 111,
        118, 101, 032, 116, 104, 101, 032, 119,
        111, 114, 108, 100, 046, 032, 032, 067,
        067, 070, 101, 115, 116, 111, 111, 110,
      ] : [Word8];
      expect = [
        178, 108, 056, 214, 021, 025, 232, 148,
        072, 012, 112, 200, 055, 078, 163, 090,
        160, 173, 005, 178, 174, 061, 102, 116,
        238, 197, 245, 042, 105, 048, 094, 212,
      ] : [Word8];
    },
    {
      data = [
        073, 102, 032, 116, 104, 101, 032, 101,
        110, 101, 109, 121, 032, 105, 115, 032,
        119, 105, 116, 104, 105, 110, 032, 114,
        097, 110, 103, 101, 044, 032, 116, 104,
        101, 110, 032, 115, 111, 032, 097, 114,
        101, 032, 121, 111, 117, 046,
      ] : [Word8];
      expect = [
        004, 157, 094, 038, 212, 241, 002, 034,
        205, 132, 026, 017, 158, 056, 189, 141,
        046, 013, 017, 041, 114, 134, 136, 068,
        149, 117, 212, 255, 066, 184, 066, 193,
      ] : [Word8];
    },
    {
      data = [
        073, 116, 039, 115, 032, 119, 101, 108,
        108, 032, 119, 101, 032, 099, 097, 110,
        110, 111, 116, 032, 104, 101, 097, 114,
        032, 116, 104, 101, 032, 115, 099, 114,
        101, 097, 109, 115, 047, 084, 104, 097,
        116, 032, 119, 101, 032, 099, 114, 101,
        097, 116, 101, 032, 105, 110, 032, 111,
        116, 104, 101, 114, 115, 039, 032, 100,
        114, 101, 097, 109, 115, 046,
      ] : [Word8];
      expect = [
        014, 017, 104, 056, 227, 204, 028, 026,
        020, 205, 004, 083, 151, 226, 155, 077,
        008, 122, 161, 027, 008, 083, 252, 105,
        236, 130, 233, 003, 048, 214, 009, 073,
      ] : [Word8];
    },
    {
      data = [
        089, 111, 117, 032, 114, 101, 109, 105,
        110, 100, 032, 109, 101, 032, 111, 102,
        032, 097, 032, 084, 086, 032, 115, 104,
        111, 119, 044, 032, 098, 117, 116, 032,
        116, 104, 097, 116, 039, 115, 032, 097,
        108, 108, 032, 114, 105, 103, 104, 116,
        058, 032, 073, 032, 119, 097, 116, 099,
        104, 032, 105, 116, 032, 097, 110, 121,
        119, 097, 121, 046,
      ] : [Word8];
      expect = [
        079, 125, 142, 181, 188, 241, 029, 226,
        165, 107, 151, 016, 033, 164, 068, 170,
        078, 175, 214, 236, 208, 243, 007, 181,
        016, 158, 078, 119, 108, 208, 254, 070,
      ] : [Word8];
    },
    {
      data = [
        067, 032, 105, 115, 032, 097, 115, 032,
        112, 111, 114, 116, 097, 098, 108, 101,
        032, 097, 115, 032, 083, 116, 111, 110,
        101, 104, 101, 100, 103, 101, 033, 033,
      ] : [Word8];
      expect = [
        097, 192, 204, 076, 075, 216, 064, 109,
        081, 032, 179, 251, 078, 188, 049, 206,
        135, 102, 124, 022, 047, 041, 070, 139,
        060, 119, 150, 117, 168, 090, 235, 206,
      ] : [Word8];
    },
    {
      data = [
        069, 118, 101, 110, 032, 105, 102, 032,
        073, 032, 099, 111, 117, 108, 100, 032,
        098, 101, 032, 083, 104, 097, 107, 101,
        115, 112, 101, 097, 114, 101, 044, 032,
        073, 032, 116, 104, 105, 110, 107, 032,
        073, 032, 115, 104, 111, 117, 108, 100,
        032, 115, 116, 105, 108, 108, 032, 099,
        104, 111, 111, 115, 101, 032, 116, 111,
        032, 098, 101, 032, 070, 097, 114, 097,
        100, 097, 121, 046, 032, 045, 032, 065,
        046, 032, 072, 117, 120, 108, 101, 121,
      ] : [Word8];
      expect = [
        031, 178, 235, 054, 136, 009, 060, 074,
        063, 128, 205, 135, 165, 084, 126, 044,
        233, 064, 164, 249, 035, 036, 058, 121,
        162, 161, 226, 066, 034, 006, 147, 172,
      ] : [Word8];
    },
    {
      data = [
        084, 104, 101, 032, 102, 117, 103, 097,
        099, 105, 116, 121, 032, 111, 102, 032,
        097, 032, 099, 111, 110, 115, 116, 105,
        116, 117, 101, 110, 116, 032, 105, 110,
        032, 097, 032, 109, 105, 120, 116, 117,
        114, 101, 032, 111, 102, 032, 103, 097,
        115, 101, 115, 032, 097, 116, 032, 097,
        032, 103, 105, 118, 101, 110, 032, 116,
        101, 109, 112, 101, 114, 097, 116, 117,
        114, 101, 032, 105, 115, 032, 112, 114,
        111, 112, 111, 114, 116, 105, 111, 110,
        097, 108, 032, 116, 111, 032, 105, 116,
        115, 032, 109, 111, 108, 101, 032, 102,
        114, 097, 099, 116, 105, 111, 110, 046,
        032, 032, 076, 101, 119, 105, 115, 045,
        082, 097, 110, 100, 097, 108, 108, 032,
        082, 117, 108, 101,
      ] : [Word8];
      expect = [
        057, 085, 133, 206, 048, 097, 123, 098,
        200, 011, 147, 232, 032, 140, 232, 102,
        212, 237, 200, 017, 161, 119, 253, 180,
        184, 045, 057, 017, 216, 105, 100, 035,
      ] : [Word8];
    },
    {
      data = [
        072, 111, 119, 032, 099, 097, 110, 032,
        121, 111, 117, 032, 119, 114, 105, 116,
        101, 032, 097, 032, 098, 105, 103, 032,
        115, 121, 115, 116, 101, 109, 032, 119,
        105, 116, 104, 111, 117, 116, 032, 067,
        043, 043, 063, 032, 032, 045, 080, 097,
        117, 108, 032, 071, 108, 105, 099, 107,
      ] : [Word8];
      expect = [
        079, 155, 024, 154, 019, 208, 048, 131,
        130, 105, 220, 232, 070, 177, 106, 028,
        233, 206, 129, 254, 099, 230, 093, 226,
        246, 054, 134, 051, 054, 169, 143, 230,
      ] : [Word8];
    },
  ];

  private func eq(a : Word8, b : Word8) : Bool {
    return a == b;
  };

  public func run() {
    for (test in tests.vals()) {
      let expect = test.expect;
      let actual = SHA256.sha256(test.data);
      assert(Array.equals<Word8>(expect, actual, eq));
    };
  };
};
