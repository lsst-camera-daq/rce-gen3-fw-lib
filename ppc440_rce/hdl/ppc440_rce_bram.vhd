-------------------------------------------------------------------------------
-- ppc440_rce_bram.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity ppc440_rce_bram is
  port (
    BRAM_Rst_A : in std_logic;
    BRAM_Clk_A : in std_logic;
    BRAM_EN_A : in std_logic;
    BRAM_WEN_A : in std_logic_vector(0 to 7);
    BRAM_Addr_A : in std_logic_vector(0 to 31);
    BRAM_Din_A : out std_logic_vector(0 to 63);
    BRAM_Dout_A : in std_logic_vector(0 to 63);
    BRAM_Rst_B : in std_logic;
    BRAM_Clk_B : in std_logic;
    BRAM_EN_B : in std_logic;
    BRAM_WEN_B : in std_logic_vector(0 to 7);
    BRAM_Addr_B : in std_logic_vector(0 to 31);
    BRAM_Din_B : out std_logic_vector(0 to 63);
    BRAM_Dout_B : in std_logic_vector(0 to 63)
  );

  attribute keep_hierarchy : STRING;
  attribute keep_hierarchy of ppc440_rce_bram : entity is "yes";

end ppc440_rce_bram;

architecture STRUCTURE of ppc440_rce_bram is

  attribute BMM_INFO : STRING;

  attribute BMM_INFO of ramb36_0: label is " ";
  attribute BMM_INFO of ramb36_1: label is " ";
  attribute BMM_INFO of ramb36_2: label is " ";
  attribute BMM_INFO of ramb36_3: label is " ";
  attribute BMM_INFO of ramb36_4: label is " ";
  attribute BMM_INFO of ramb36_5: label is " ";
  attribute BMM_INFO of ramb36_6: label is " ";
  attribute BMM_INFO of ramb36_7: label is " ";
  attribute BMM_INFO of ramb36_8: label is " ";
  attribute BMM_INFO of ramb36_9: label is " ";
  attribute BMM_INFO of ramb36_10: label is " ";
  attribute BMM_INFO of ramb36_11: label is " ";
  attribute BMM_INFO of ramb36_12: label is " ";
  attribute BMM_INFO of ramb36_13: label is " ";
  attribute BMM_INFO of ramb36_14: label is " ";
  attribute BMM_INFO of ramb36_15: label is " ";
  -- Internal signals

  signal net_gnd0 : std_logic;
  signal net_gnd4 : std_logic_vector(3 downto 0);
  signal pgassign1 : std_logic_vector(0 to 0);
  signal pgassign2 : std_logic_vector(0 to 1);
  signal pgassign3 : std_logic_vector(0 to 27);
  signal pgassign4 : std_logic_vector(15 downto 0);
  signal pgassign5 : std_logic_vector(31 downto 0);
  signal pgassign6 : std_logic_vector(31 downto 0);
  signal pgassign7 : std_logic_vector(3 downto 0);
  signal pgassign8 : std_logic_vector(15 downto 0);
  signal pgassign9 : std_logic_vector(31 downto 0);
  signal pgassign10 : std_logic_vector(31 downto 0);
  signal pgassign11 : std_logic_vector(3 downto 0);
  signal pgassign12 : std_logic_vector(15 downto 0);
  signal pgassign13 : std_logic_vector(31 downto 0);
  signal pgassign14 : std_logic_vector(31 downto 0);
  signal pgassign15 : std_logic_vector(3 downto 0);
  signal pgassign16 : std_logic_vector(15 downto 0);
  signal pgassign17 : std_logic_vector(31 downto 0);
  signal pgassign18 : std_logic_vector(31 downto 0);
  signal pgassign19 : std_logic_vector(3 downto 0);
  signal pgassign20 : std_logic_vector(15 downto 0);
  signal pgassign21 : std_logic_vector(31 downto 0);
  signal pgassign22 : std_logic_vector(31 downto 0);
  signal pgassign23 : std_logic_vector(3 downto 0);
  signal pgassign24 : std_logic_vector(15 downto 0);
  signal pgassign25 : std_logic_vector(31 downto 0);
  signal pgassign26 : std_logic_vector(31 downto 0);
  signal pgassign27 : std_logic_vector(3 downto 0);
  signal pgassign28 : std_logic_vector(15 downto 0);
  signal pgassign29 : std_logic_vector(31 downto 0);
  signal pgassign30 : std_logic_vector(31 downto 0);
  signal pgassign31 : std_logic_vector(3 downto 0);
  signal pgassign32 : std_logic_vector(15 downto 0);
  signal pgassign33 : std_logic_vector(31 downto 0);
  signal pgassign34 : std_logic_vector(31 downto 0);
  signal pgassign35 : std_logic_vector(3 downto 0);
  signal pgassign36 : std_logic_vector(15 downto 0);
  signal pgassign37 : std_logic_vector(31 downto 0);
  signal pgassign38 : std_logic_vector(31 downto 0);
  signal pgassign39 : std_logic_vector(3 downto 0);
  signal pgassign40 : std_logic_vector(15 downto 0);
  signal pgassign41 : std_logic_vector(31 downto 0);
  signal pgassign42 : std_logic_vector(31 downto 0);
  signal pgassign43 : std_logic_vector(3 downto 0);
  signal pgassign44 : std_logic_vector(15 downto 0);
  signal pgassign45 : std_logic_vector(31 downto 0);
  signal pgassign46 : std_logic_vector(31 downto 0);
  signal pgassign47 : std_logic_vector(3 downto 0);
  signal pgassign48 : std_logic_vector(15 downto 0);
  signal pgassign49 : std_logic_vector(31 downto 0);
  signal pgassign50 : std_logic_vector(31 downto 0);
  signal pgassign51 : std_logic_vector(3 downto 0);
  signal pgassign52 : std_logic_vector(15 downto 0);
  signal pgassign53 : std_logic_vector(31 downto 0);
  signal pgassign54 : std_logic_vector(31 downto 0);
  signal pgassign55 : std_logic_vector(3 downto 0);
  signal pgassign56 : std_logic_vector(15 downto 0);
  signal pgassign57 : std_logic_vector(31 downto 0);
  signal pgassign58 : std_logic_vector(31 downto 0);
  signal pgassign59 : std_logic_vector(3 downto 0);
  signal pgassign60 : std_logic_vector(15 downto 0);
  signal pgassign61 : std_logic_vector(31 downto 0);
  signal pgassign62 : std_logic_vector(31 downto 0);
  signal pgassign63 : std_logic_vector(3 downto 0);
  signal pgassign64 : std_logic_vector(15 downto 0);
  signal pgassign65 : std_logic_vector(31 downto 0);
  signal pgassign66 : std_logic_vector(31 downto 0);
  signal pgassign67 : std_logic_vector(3 downto 0);
  signal pgassign68 : std_logic_vector(15 downto 0);
  signal pgassign69 : std_logic_vector(31 downto 0);
  signal pgassign70 : std_logic_vector(31 downto 0);
  signal pgassign71 : std_logic_vector(3 downto 0);
  signal pgassign72 : std_logic_vector(15 downto 0);
  signal pgassign73 : std_logic_vector(31 downto 0);
  signal pgassign74 : std_logic_vector(31 downto 0);
  signal pgassign75 : std_logic_vector(3 downto 0);
  signal pgassign76 : std_logic_vector(15 downto 0);
  signal pgassign77 : std_logic_vector(31 downto 0);
  signal pgassign78 : std_logic_vector(31 downto 0);
  signal pgassign79 : std_logic_vector(3 downto 0);
  signal pgassign80 : std_logic_vector(15 downto 0);
  signal pgassign81 : std_logic_vector(31 downto 0);
  signal pgassign82 : std_logic_vector(31 downto 0);
  signal pgassign83 : std_logic_vector(3 downto 0);
  signal pgassign84 : std_logic_vector(15 downto 0);
  signal pgassign85 : std_logic_vector(31 downto 0);
  signal pgassign86 : std_logic_vector(31 downto 0);
  signal pgassign87 : std_logic_vector(3 downto 0);
  signal pgassign88 : std_logic_vector(15 downto 0);
  signal pgassign89 : std_logic_vector(31 downto 0);
  signal pgassign90 : std_logic_vector(31 downto 0);
  signal pgassign91 : std_logic_vector(3 downto 0);
  signal pgassign92 : std_logic_vector(15 downto 0);
  signal pgassign93 : std_logic_vector(31 downto 0);
  signal pgassign94 : std_logic_vector(31 downto 0);
  signal pgassign95 : std_logic_vector(3 downto 0);
  signal pgassign96 : std_logic_vector(15 downto 0);
  signal pgassign97 : std_logic_vector(31 downto 0);
  signal pgassign98 : std_logic_vector(31 downto 0);
  signal pgassign99 : std_logic_vector(3 downto 0);
  signal pgassign100 : std_logic_vector(15 downto 0);
  signal pgassign101 : std_logic_vector(31 downto 0);
  signal pgassign102 : std_logic_vector(31 downto 0);
  signal pgassign103 : std_logic_vector(3 downto 0);
  signal pgassign104 : std_logic_vector(15 downto 0);
  signal pgassign105 : std_logic_vector(31 downto 0);
  signal pgassign106 : std_logic_vector(31 downto 0);
  signal pgassign107 : std_logic_vector(3 downto 0);
  signal pgassign108 : std_logic_vector(15 downto 0);
  signal pgassign109 : std_logic_vector(31 downto 0);
  signal pgassign110 : std_logic_vector(31 downto 0);
  signal pgassign111 : std_logic_vector(3 downto 0);
  signal pgassign112 : std_logic_vector(15 downto 0);
  signal pgassign113 : std_logic_vector(31 downto 0);
  signal pgassign114 : std_logic_vector(31 downto 0);
  signal pgassign115 : std_logic_vector(3 downto 0);
  signal pgassign116 : std_logic_vector(15 downto 0);
  signal pgassign117 : std_logic_vector(31 downto 0);
  signal pgassign118 : std_logic_vector(31 downto 0);
  signal pgassign119 : std_logic_vector(3 downto 0);
  signal pgassign120 : std_logic_vector(15 downto 0);
  signal pgassign121 : std_logic_vector(31 downto 0);
  signal pgassign122 : std_logic_vector(31 downto 0);
  signal pgassign123 : std_logic_vector(3 downto 0);
  signal pgassign124 : std_logic_vector(15 downto 0);
  signal pgassign125 : std_logic_vector(31 downto 0);
  signal pgassign126 : std_logic_vector(31 downto 0);
  signal pgassign127 : std_logic_vector(3 downto 0);
  signal pgassign128 : std_logic_vector(15 downto 0);
  signal pgassign129 : std_logic_vector(31 downto 0);
  signal pgassign130 : std_logic_vector(31 downto 0);
  signal pgassign131 : std_logic_vector(3 downto 0);

begin

  -- Internal assignments

  pgassign1(0 to 0) <= B"1";
  pgassign2(0 to 1) <= B"00";
  pgassign3(0 to 27) <= B"0000000000000000000000000000";
  pgassign4(15 downto 15) <= B"1";
  pgassign4(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign4(1 downto 0) <= B"00";
  pgassign5(31 downto 4) <= B"0000000000000000000000000000";
  pgassign5(3 downto 0) <= BRAM_Dout_A(0 to 3);
  BRAM_Din_A(0 to 3) <= pgassign6(3 downto 0);
  pgassign7(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign7(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign7(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign7(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign8(15 downto 15) <= B"1";
  pgassign8(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign8(1 downto 0) <= B"00";
  pgassign9(31 downto 4) <= B"0000000000000000000000000000";
  pgassign9(3 downto 0) <= BRAM_Dout_B(0 to 3);
  BRAM_Din_B(0 to 3) <= pgassign10(3 downto 0);
  pgassign11(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign11(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign11(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign11(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign12(15 downto 15) <= B"1";
  pgassign12(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign12(1 downto 0) <= B"00";
  pgassign13(31 downto 4) <= B"0000000000000000000000000000";
  pgassign13(3 downto 0) <= BRAM_Dout_A(4 to 7);
  BRAM_Din_A(4 to 7) <= pgassign14(3 downto 0);
  pgassign15(3 downto 3) <= BRAM_WEN_A(0 to 0);
  pgassign15(2 downto 2) <= BRAM_WEN_A(0 to 0);
  pgassign15(1 downto 1) <= BRAM_WEN_A(0 to 0);
  pgassign15(0 downto 0) <= BRAM_WEN_A(0 to 0);
  pgassign16(15 downto 15) <= B"1";
  pgassign16(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign16(1 downto 0) <= B"00";
  pgassign17(31 downto 4) <= B"0000000000000000000000000000";
  pgassign17(3 downto 0) <= BRAM_Dout_B(4 to 7);
  BRAM_Din_B(4 to 7) <= pgassign18(3 downto 0);
  pgassign19(3 downto 3) <= BRAM_WEN_B(0 to 0);
  pgassign19(2 downto 2) <= BRAM_WEN_B(0 to 0);
  pgassign19(1 downto 1) <= BRAM_WEN_B(0 to 0);
  pgassign19(0 downto 0) <= BRAM_WEN_B(0 to 0);
  pgassign20(15 downto 15) <= B"1";
  pgassign20(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign20(1 downto 0) <= B"00";
  pgassign21(31 downto 4) <= B"0000000000000000000000000000";
  pgassign21(3 downto 0) <= BRAM_Dout_A(8 to 11);
  BRAM_Din_A(8 to 11) <= pgassign22(3 downto 0);
  pgassign23(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign23(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign23(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign23(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign24(15 downto 15) <= B"1";
  pgassign24(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign24(1 downto 0) <= B"00";
  pgassign25(31 downto 4) <= B"0000000000000000000000000000";
  pgassign25(3 downto 0) <= BRAM_Dout_B(8 to 11);
  BRAM_Din_B(8 to 11) <= pgassign26(3 downto 0);
  pgassign27(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign27(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign27(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign27(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign28(15 downto 15) <= B"1";
  pgassign28(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign28(1 downto 0) <= B"00";
  pgassign29(31 downto 4) <= B"0000000000000000000000000000";
  pgassign29(3 downto 0) <= BRAM_Dout_A(12 to 15);
  BRAM_Din_A(12 to 15) <= pgassign30(3 downto 0);
  pgassign31(3 downto 3) <= BRAM_WEN_A(1 to 1);
  pgassign31(2 downto 2) <= BRAM_WEN_A(1 to 1);
  pgassign31(1 downto 1) <= BRAM_WEN_A(1 to 1);
  pgassign31(0 downto 0) <= BRAM_WEN_A(1 to 1);
  pgassign32(15 downto 15) <= B"1";
  pgassign32(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign32(1 downto 0) <= B"00";
  pgassign33(31 downto 4) <= B"0000000000000000000000000000";
  pgassign33(3 downto 0) <= BRAM_Dout_B(12 to 15);
  BRAM_Din_B(12 to 15) <= pgassign34(3 downto 0);
  pgassign35(3 downto 3) <= BRAM_WEN_B(1 to 1);
  pgassign35(2 downto 2) <= BRAM_WEN_B(1 to 1);
  pgassign35(1 downto 1) <= BRAM_WEN_B(1 to 1);
  pgassign35(0 downto 0) <= BRAM_WEN_B(1 to 1);
  pgassign36(15 downto 15) <= B"1";
  pgassign36(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign36(1 downto 0) <= B"00";
  pgassign37(31 downto 4) <= B"0000000000000000000000000000";
  pgassign37(3 downto 0) <= BRAM_Dout_A(16 to 19);
  BRAM_Din_A(16 to 19) <= pgassign38(3 downto 0);
  pgassign39(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign39(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign39(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign39(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign40(15 downto 15) <= B"1";
  pgassign40(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign40(1 downto 0) <= B"00";
  pgassign41(31 downto 4) <= B"0000000000000000000000000000";
  pgassign41(3 downto 0) <= BRAM_Dout_B(16 to 19);
  BRAM_Din_B(16 to 19) <= pgassign42(3 downto 0);
  pgassign43(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign43(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign43(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign43(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign44(15 downto 15) <= B"1";
  pgassign44(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign44(1 downto 0) <= B"00";
  pgassign45(31 downto 4) <= B"0000000000000000000000000000";
  pgassign45(3 downto 0) <= BRAM_Dout_A(20 to 23);
  BRAM_Din_A(20 to 23) <= pgassign46(3 downto 0);
  pgassign47(3 downto 3) <= BRAM_WEN_A(2 to 2);
  pgassign47(2 downto 2) <= BRAM_WEN_A(2 to 2);
  pgassign47(1 downto 1) <= BRAM_WEN_A(2 to 2);
  pgassign47(0 downto 0) <= BRAM_WEN_A(2 to 2);
  pgassign48(15 downto 15) <= B"1";
  pgassign48(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign48(1 downto 0) <= B"00";
  pgassign49(31 downto 4) <= B"0000000000000000000000000000";
  pgassign49(3 downto 0) <= BRAM_Dout_B(20 to 23);
  BRAM_Din_B(20 to 23) <= pgassign50(3 downto 0);
  pgassign51(3 downto 3) <= BRAM_WEN_B(2 to 2);
  pgassign51(2 downto 2) <= BRAM_WEN_B(2 to 2);
  pgassign51(1 downto 1) <= BRAM_WEN_B(2 to 2);
  pgassign51(0 downto 0) <= BRAM_WEN_B(2 to 2);
  pgassign52(15 downto 15) <= B"1";
  pgassign52(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign52(1 downto 0) <= B"00";
  pgassign53(31 downto 4) <= B"0000000000000000000000000000";
  pgassign53(3 downto 0) <= BRAM_Dout_A(24 to 27);
  BRAM_Din_A(24 to 27) <= pgassign54(3 downto 0);
  pgassign55(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign55(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign55(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign55(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign56(15 downto 15) <= B"1";
  pgassign56(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign56(1 downto 0) <= B"00";
  pgassign57(31 downto 4) <= B"0000000000000000000000000000";
  pgassign57(3 downto 0) <= BRAM_Dout_B(24 to 27);
  BRAM_Din_B(24 to 27) <= pgassign58(3 downto 0);
  pgassign59(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign59(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign59(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign59(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign60(15 downto 15) <= B"1";
  pgassign60(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign60(1 downto 0) <= B"00";
  pgassign61(31 downto 4) <= B"0000000000000000000000000000";
  pgassign61(3 downto 0) <= BRAM_Dout_A(28 to 31);
  BRAM_Din_A(28 to 31) <= pgassign62(3 downto 0);
  pgassign63(3 downto 3) <= BRAM_WEN_A(3 to 3);
  pgassign63(2 downto 2) <= BRAM_WEN_A(3 to 3);
  pgassign63(1 downto 1) <= BRAM_WEN_A(3 to 3);
  pgassign63(0 downto 0) <= BRAM_WEN_A(3 to 3);
  pgassign64(15 downto 15) <= B"1";
  pgassign64(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign64(1 downto 0) <= B"00";
  pgassign65(31 downto 4) <= B"0000000000000000000000000000";
  pgassign65(3 downto 0) <= BRAM_Dout_B(28 to 31);
  BRAM_Din_B(28 to 31) <= pgassign66(3 downto 0);
  pgassign67(3 downto 3) <= BRAM_WEN_B(3 to 3);
  pgassign67(2 downto 2) <= BRAM_WEN_B(3 to 3);
  pgassign67(1 downto 1) <= BRAM_WEN_B(3 to 3);
  pgassign67(0 downto 0) <= BRAM_WEN_B(3 to 3);
  pgassign68(15 downto 15) <= B"1";
  pgassign68(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign68(1 downto 0) <= B"00";
  pgassign69(31 downto 4) <= B"0000000000000000000000000000";
  pgassign69(3 downto 0) <= BRAM_Dout_A(32 to 35);
  BRAM_Din_A(32 to 35) <= pgassign70(3 downto 0);
  pgassign71(3 downto 3) <= BRAM_WEN_A(4 to 4);
  pgassign71(2 downto 2) <= BRAM_WEN_A(4 to 4);
  pgassign71(1 downto 1) <= BRAM_WEN_A(4 to 4);
  pgassign71(0 downto 0) <= BRAM_WEN_A(4 to 4);
  pgassign72(15 downto 15) <= B"1";
  pgassign72(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign72(1 downto 0) <= B"00";
  pgassign73(31 downto 4) <= B"0000000000000000000000000000";
  pgassign73(3 downto 0) <= BRAM_Dout_B(32 to 35);
  BRAM_Din_B(32 to 35) <= pgassign74(3 downto 0);
  pgassign75(3 downto 3) <= BRAM_WEN_B(4 to 4);
  pgassign75(2 downto 2) <= BRAM_WEN_B(4 to 4);
  pgassign75(1 downto 1) <= BRAM_WEN_B(4 to 4);
  pgassign75(0 downto 0) <= BRAM_WEN_B(4 to 4);
  pgassign76(15 downto 15) <= B"1";
  pgassign76(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign76(1 downto 0) <= B"00";
  pgassign77(31 downto 4) <= B"0000000000000000000000000000";
  pgassign77(3 downto 0) <= BRAM_Dout_A(36 to 39);
  BRAM_Din_A(36 to 39) <= pgassign78(3 downto 0);
  pgassign79(3 downto 3) <= BRAM_WEN_A(4 to 4);
  pgassign79(2 downto 2) <= BRAM_WEN_A(4 to 4);
  pgassign79(1 downto 1) <= BRAM_WEN_A(4 to 4);
  pgassign79(0 downto 0) <= BRAM_WEN_A(4 to 4);
  pgassign80(15 downto 15) <= B"1";
  pgassign80(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign80(1 downto 0) <= B"00";
  pgassign81(31 downto 4) <= B"0000000000000000000000000000";
  pgassign81(3 downto 0) <= BRAM_Dout_B(36 to 39);
  BRAM_Din_B(36 to 39) <= pgassign82(3 downto 0);
  pgassign83(3 downto 3) <= BRAM_WEN_B(4 to 4);
  pgassign83(2 downto 2) <= BRAM_WEN_B(4 to 4);
  pgassign83(1 downto 1) <= BRAM_WEN_B(4 to 4);
  pgassign83(0 downto 0) <= BRAM_WEN_B(4 to 4);
  pgassign84(15 downto 15) <= B"1";
  pgassign84(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign84(1 downto 0) <= B"00";
  pgassign85(31 downto 4) <= B"0000000000000000000000000000";
  pgassign85(3 downto 0) <= BRAM_Dout_A(40 to 43);
  BRAM_Din_A(40 to 43) <= pgassign86(3 downto 0);
  pgassign87(3 downto 3) <= BRAM_WEN_A(5 to 5);
  pgassign87(2 downto 2) <= BRAM_WEN_A(5 to 5);
  pgassign87(1 downto 1) <= BRAM_WEN_A(5 to 5);
  pgassign87(0 downto 0) <= BRAM_WEN_A(5 to 5);
  pgassign88(15 downto 15) <= B"1";
  pgassign88(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign88(1 downto 0) <= B"00";
  pgassign89(31 downto 4) <= B"0000000000000000000000000000";
  pgassign89(3 downto 0) <= BRAM_Dout_B(40 to 43);
  BRAM_Din_B(40 to 43) <= pgassign90(3 downto 0);
  pgassign91(3 downto 3) <= BRAM_WEN_B(5 to 5);
  pgassign91(2 downto 2) <= BRAM_WEN_B(5 to 5);
  pgassign91(1 downto 1) <= BRAM_WEN_B(5 to 5);
  pgassign91(0 downto 0) <= BRAM_WEN_B(5 to 5);
  pgassign92(15 downto 15) <= B"1";
  pgassign92(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign92(1 downto 0) <= B"00";
  pgassign93(31 downto 4) <= B"0000000000000000000000000000";
  pgassign93(3 downto 0) <= BRAM_Dout_A(44 to 47);
  BRAM_Din_A(44 to 47) <= pgassign94(3 downto 0);
  pgassign95(3 downto 3) <= BRAM_WEN_A(5 to 5);
  pgassign95(2 downto 2) <= BRAM_WEN_A(5 to 5);
  pgassign95(1 downto 1) <= BRAM_WEN_A(5 to 5);
  pgassign95(0 downto 0) <= BRAM_WEN_A(5 to 5);
  pgassign96(15 downto 15) <= B"1";
  pgassign96(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign96(1 downto 0) <= B"00";
  pgassign97(31 downto 4) <= B"0000000000000000000000000000";
  pgassign97(3 downto 0) <= BRAM_Dout_B(44 to 47);
  BRAM_Din_B(44 to 47) <= pgassign98(3 downto 0);
  pgassign99(3 downto 3) <= BRAM_WEN_B(5 to 5);
  pgassign99(2 downto 2) <= BRAM_WEN_B(5 to 5);
  pgassign99(1 downto 1) <= BRAM_WEN_B(5 to 5);
  pgassign99(0 downto 0) <= BRAM_WEN_B(5 to 5);
  pgassign100(15 downto 15) <= B"1";
  pgassign100(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign100(1 downto 0) <= B"00";
  pgassign101(31 downto 4) <= B"0000000000000000000000000000";
  pgassign101(3 downto 0) <= BRAM_Dout_A(48 to 51);
  BRAM_Din_A(48 to 51) <= pgassign102(3 downto 0);
  pgassign103(3 downto 3) <= BRAM_WEN_A(6 to 6);
  pgassign103(2 downto 2) <= BRAM_WEN_A(6 to 6);
  pgassign103(1 downto 1) <= BRAM_WEN_A(6 to 6);
  pgassign103(0 downto 0) <= BRAM_WEN_A(6 to 6);
  pgassign104(15 downto 15) <= B"1";
  pgassign104(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign104(1 downto 0) <= B"00";
  pgassign105(31 downto 4) <= B"0000000000000000000000000000";
  pgassign105(3 downto 0) <= BRAM_Dout_B(48 to 51);
  BRAM_Din_B(48 to 51) <= pgassign106(3 downto 0);
  pgassign107(3 downto 3) <= BRAM_WEN_B(6 to 6);
  pgassign107(2 downto 2) <= BRAM_WEN_B(6 to 6);
  pgassign107(1 downto 1) <= BRAM_WEN_B(6 to 6);
  pgassign107(0 downto 0) <= BRAM_WEN_B(6 to 6);
  pgassign108(15 downto 15) <= B"1";
  pgassign108(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign108(1 downto 0) <= B"00";
  pgassign109(31 downto 4) <= B"0000000000000000000000000000";
  pgassign109(3 downto 0) <= BRAM_Dout_A(52 to 55);
  BRAM_Din_A(52 to 55) <= pgassign110(3 downto 0);
  pgassign111(3 downto 3) <= BRAM_WEN_A(6 to 6);
  pgassign111(2 downto 2) <= BRAM_WEN_A(6 to 6);
  pgassign111(1 downto 1) <= BRAM_WEN_A(6 to 6);
  pgassign111(0 downto 0) <= BRAM_WEN_A(6 to 6);
  pgassign112(15 downto 15) <= B"1";
  pgassign112(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign112(1 downto 0) <= B"00";
  pgassign113(31 downto 4) <= B"0000000000000000000000000000";
  pgassign113(3 downto 0) <= BRAM_Dout_B(52 to 55);
  BRAM_Din_B(52 to 55) <= pgassign114(3 downto 0);
  pgassign115(3 downto 3) <= BRAM_WEN_B(6 to 6);
  pgassign115(2 downto 2) <= BRAM_WEN_B(6 to 6);
  pgassign115(1 downto 1) <= BRAM_WEN_B(6 to 6);
  pgassign115(0 downto 0) <= BRAM_WEN_B(6 to 6);
  pgassign116(15 downto 15) <= B"1";
  pgassign116(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign116(1 downto 0) <= B"00";
  pgassign117(31 downto 4) <= B"0000000000000000000000000000";
  pgassign117(3 downto 0) <= BRAM_Dout_A(56 to 59);
  BRAM_Din_A(56 to 59) <= pgassign118(3 downto 0);
  pgassign119(3 downto 3) <= BRAM_WEN_A(7 to 7);
  pgassign119(2 downto 2) <= BRAM_WEN_A(7 to 7);
  pgassign119(1 downto 1) <= BRAM_WEN_A(7 to 7);
  pgassign119(0 downto 0) <= BRAM_WEN_A(7 to 7);
  pgassign120(15 downto 15) <= B"1";
  pgassign120(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign120(1 downto 0) <= B"00";
  pgassign121(31 downto 4) <= B"0000000000000000000000000000";
  pgassign121(3 downto 0) <= BRAM_Dout_B(56 to 59);
  BRAM_Din_B(56 to 59) <= pgassign122(3 downto 0);
  pgassign123(3 downto 3) <= BRAM_WEN_B(7 to 7);
  pgassign123(2 downto 2) <= BRAM_WEN_B(7 to 7);
  pgassign123(1 downto 1) <= BRAM_WEN_B(7 to 7);
  pgassign123(0 downto 0) <= BRAM_WEN_B(7 to 7);
  pgassign124(15 downto 15) <= B"1";
  pgassign124(14 downto 2) <= BRAM_Addr_A(16 to 28);
  pgassign124(1 downto 0) <= B"00";
  pgassign125(31 downto 4) <= B"0000000000000000000000000000";
  pgassign125(3 downto 0) <= BRAM_Dout_A(60 to 63);
  BRAM_Din_A(60 to 63) <= pgassign126(3 downto 0);
  pgassign127(3 downto 3) <= BRAM_WEN_A(7 to 7);
  pgassign127(2 downto 2) <= BRAM_WEN_A(7 to 7);
  pgassign127(1 downto 1) <= BRAM_WEN_A(7 to 7);
  pgassign127(0 downto 0) <= BRAM_WEN_A(7 to 7);
  pgassign128(15 downto 15) <= B"1";
  pgassign128(14 downto 2) <= BRAM_Addr_B(16 to 28);
  pgassign128(1 downto 0) <= B"00";
  pgassign129(31 downto 4) <= B"0000000000000000000000000000";
  pgassign129(3 downto 0) <= BRAM_Dout_B(60 to 63);
  BRAM_Din_B(60 to 63) <= pgassign130(3 downto 0);
  pgassign131(3 downto 3) <= BRAM_WEN_B(7 to 7);
  pgassign131(2 downto 2) <= BRAM_WEN_B(7 to 7);
  pgassign131(1 downto 1) <= BRAM_WEN_B(7 to 7);
  pgassign131(0 downto 0) <= BRAM_WEN_B(7 to 7);
  net_gnd0 <= '0';
  net_gnd4(3 downto 0) <= B"0000";

  ramb36_0 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_0.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign4,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign5,
      DIPA => net_gnd4,
      DOA => pgassign6,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign7,
      ADDRB => pgassign8,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign9,
      DIPB => net_gnd4,
      DOB => pgassign10,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign11
    );

  ramb36_1 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_1.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign12,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign13,
      DIPA => net_gnd4,
      DOA => pgassign14,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign15,
      ADDRB => pgassign16,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign17,
      DIPB => net_gnd4,
      DOB => pgassign18,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign19
    );

  ramb36_2 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_2.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign20,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign21,
      DIPA => net_gnd4,
      DOA => pgassign22,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign23,
      ADDRB => pgassign24,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign25,
      DIPB => net_gnd4,
      DOB => pgassign26,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign27
    );

  ramb36_3 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_3.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign28,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign29,
      DIPA => net_gnd4,
      DOA => pgassign30,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign31,
      ADDRB => pgassign32,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign33,
      DIPB => net_gnd4,
      DOB => pgassign34,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign35
    );

  ramb36_4 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_4.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign36,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign37,
      DIPA => net_gnd4,
      DOA => pgassign38,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign39,
      ADDRB => pgassign40,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign41,
      DIPB => net_gnd4,
      DOB => pgassign42,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign43
    );

  ramb36_5 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_5.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign44,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign45,
      DIPA => net_gnd4,
      DOA => pgassign46,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign47,
      ADDRB => pgassign48,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign49,
      DIPB => net_gnd4,
      DOB => pgassign50,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign51
    );

  ramb36_6 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_6.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign52,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign53,
      DIPA => net_gnd4,
      DOA => pgassign54,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign55,
      ADDRB => pgassign56,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign57,
      DIPB => net_gnd4,
      DOB => pgassign58,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign59
    );

  ramb36_7 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_7.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign60,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign61,
      DIPA => net_gnd4,
      DOA => pgassign62,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign63,
      ADDRB => pgassign64,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign65,
      DIPB => net_gnd4,
      DOB => pgassign66,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign67
    );

  ramb36_8 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_8.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign68,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign69,
      DIPA => net_gnd4,
      DOA => pgassign70,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign71,
      ADDRB => pgassign72,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign73,
      DIPB => net_gnd4,
      DOB => pgassign74,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign75
    );

  ramb36_9 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_9.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign76,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign77,
      DIPA => net_gnd4,
      DOA => pgassign78,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign79,
      ADDRB => pgassign80,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign81,
      DIPB => net_gnd4,
      DOB => pgassign82,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign83
    );

  ramb36_10 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_10.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign84,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign85,
      DIPA => net_gnd4,
      DOA => pgassign86,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign87,
      ADDRB => pgassign88,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign89,
      DIPB => net_gnd4,
      DOB => pgassign90,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign91
    );

  ramb36_11 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_11.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign92,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign93,
      DIPA => net_gnd4,
      DOA => pgassign94,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign95,
      ADDRB => pgassign96,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign97,
      DIPB => net_gnd4,
      DOB => pgassign98,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign99
    );

  ramb36_12 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_12.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign100,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign101,
      DIPA => net_gnd4,
      DOA => pgassign102,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign103,
      ADDRB => pgassign104,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign105,
      DIPB => net_gnd4,
      DOB => pgassign106,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign107
    );

  ramb36_13 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_13.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign108,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign109,
      DIPA => net_gnd4,
      DOA => pgassign110,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign111,
      ADDRB => pgassign112,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign113,
      DIPB => net_gnd4,
      DOB => pgassign114,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign115
    );

  ramb36_14 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_14.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign116,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign117,
      DIPA => net_gnd4,
      DOA => pgassign118,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign119,
      ADDRB => pgassign120,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign121,
      DIPB => net_gnd4,
      DOB => pgassign122,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign123
    );

  ramb36_15 : RAMB36
    generic map (
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      INIT_FILE => "xps_bram_if_cntlr_1_bram_combined_15.mem",
      READ_WIDTH_A => 4,
      READ_WIDTH_B => 4,
      WRITE_WIDTH_A => 4,
      WRITE_WIDTH_B => 4,
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE"
    )
    port map (
      ADDRA => pgassign124,
      CASCADEINLATA => net_gnd0,
      CASCADEINREGA => net_gnd0,
      CASCADEOUTLATA => open,
      CASCADEOUTREGA => open,
      CLKA => BRAM_Clk_A,
      DIA => pgassign125,
      DIPA => net_gnd4,
      DOA => pgassign126,
      DOPA => open,
      ENA => BRAM_EN_A,
      REGCEA => net_gnd0,
      SSRA => BRAM_Rst_A,
      WEA => pgassign127,
      ADDRB => pgassign128,
      CASCADEINLATB => net_gnd0,
      CASCADEINREGB => net_gnd0,
      CASCADEOUTLATB => open,
      CASCADEOUTREGB => open,
      CLKB => BRAM_Clk_B,
      DIB => pgassign129,
      DIPB => net_gnd4,
      DOB => pgassign130,
      DOPB => open,
      ENB => BRAM_EN_B,
      REGCEB => net_gnd0,
      SSRB => BRAM_Rst_B,
      WEB => pgassign131
    );

end architecture STRUCTURE;

