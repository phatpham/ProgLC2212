{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t4 t5
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,282) ([10208,16710,0,1,0,0,0,0,504,44,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,32,10208,16710,57344,17959,65,10208,16710,0,16384,0,10208,16710,0,504,46,63488,11393,0,2552,44,0,0,126,0,0,0,32,57344,17959,65,10208,16710,57344,17959,65,10208,16710,57344,17959,65,10208,16710,57344,17959,65,10208,16710,0,0,16,0,64,0,504,36,4096,8192,0,16,36,4096,9217,0,400,36,53248,9217,0,16,0,61440,9217,57344,17959,65,0,64,0,16384,0,0,64,0,16384,0,0,64,0,16384,0,10208,16710,0,0,0,0,0,0,33272,44,0,32768,0,4600,44,10208,16710,57344,17959,65,10208,16710,57344,17959,65,0,128,0,1,0,61440,9217,57344,17959,65,63488,11393,0,32768,0,0,0,0,33272,44,63488,11393,0,504,44,63488,11393,57344,17959,65,10208,16710,0,504,300,63488,11265,0,0,0,10208,16710,0,0,0,0,0,0,0,0,0,0,0,32784,32,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Exp","Type","Bool","Int","Stream","int","true","false","'<'","'=='","'+'","'*'","'-'","'/'","var","if","then","else","'='","'('","')'","'['","']'","','","';'","map","'.'","while","'{'","'}'","get","size","add","remove","insert","delete","%eof"]
        bit_start = st * 40
        bit_end = (st + 1) * 40
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..39]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (6) = happyShift action_5
action_0 (7) = happyShift action_6
action_0 (8) = happyShift action_7
action_0 (9) = happyShift action_2
action_0 (10) = happyShift action_8
action_0 (11) = happyShift action_9
action_0 (14) = happyShift action_10
action_0 (18) = happyShift action_11
action_0 (19) = happyShift action_12
action_0 (23) = happyShift action_13
action_0 (25) = happyShift action_14
action_0 (31) = happyShift action_15
action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (9) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (12) = happyShift action_23
action_3 (13) = happyShift action_24
action_3 (14) = happyShift action_25
action_3 (15) = happyShift action_26
action_3 (16) = happyShift action_27
action_3 (17) = happyShift action_28
action_3 (27) = happyShift action_29
action_3 (28) = happyShift action_30
action_3 (30) = happyShift action_31
action_3 (40) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (18) = happyShift action_22
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_26

action_6 _ = happyReduce_27

action_7 _ = happyReduce_28

action_8 _ = happyReduce_3

action_9 _ = happyReduce_4

action_10 (9) = happyShift action_21
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (30) = happyShift action_20
action_11 _ = happyReduce_2

action_12 (6) = happyShift action_5
action_12 (7) = happyShift action_6
action_12 (8) = happyShift action_7
action_12 (9) = happyShift action_2
action_12 (10) = happyShift action_8
action_12 (11) = happyShift action_9
action_12 (14) = happyShift action_10
action_12 (18) = happyShift action_11
action_12 (19) = happyShift action_12
action_12 (23) = happyShift action_13
action_12 (25) = happyShift action_14
action_12 (31) = happyShift action_15
action_12 (4) = happyGoto action_19
action_12 (5) = happyGoto action_4
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (6) = happyShift action_5
action_13 (7) = happyShift action_6
action_13 (8) = happyShift action_7
action_13 (9) = happyShift action_2
action_13 (10) = happyShift action_8
action_13 (11) = happyShift action_9
action_13 (14) = happyShift action_10
action_13 (18) = happyShift action_11
action_13 (19) = happyShift action_12
action_13 (23) = happyShift action_13
action_13 (25) = happyShift action_14
action_13 (31) = happyShift action_15
action_13 (4) = happyGoto action_18
action_13 (5) = happyGoto action_4
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (6) = happyShift action_5
action_14 (7) = happyShift action_6
action_14 (8) = happyShift action_7
action_14 (9) = happyShift action_2
action_14 (10) = happyShift action_8
action_14 (11) = happyShift action_9
action_14 (14) = happyShift action_10
action_14 (18) = happyShift action_11
action_14 (19) = happyShift action_12
action_14 (23) = happyShift action_13
action_14 (25) = happyShift action_14
action_14 (31) = happyShift action_15
action_14 (4) = happyGoto action_17
action_14 (5) = happyGoto action_4
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (23) = happyShift action_16
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (6) = happyShift action_5
action_16 (7) = happyShift action_6
action_16 (8) = happyShift action_7
action_16 (9) = happyShift action_2
action_16 (10) = happyShift action_8
action_16 (11) = happyShift action_9
action_16 (14) = happyShift action_10
action_16 (18) = happyShift action_11
action_16 (19) = happyShift action_12
action_16 (23) = happyShift action_13
action_16 (25) = happyShift action_14
action_16 (31) = happyShift action_15
action_16 (4) = happyGoto action_51
action_16 (5) = happyGoto action_4
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (12) = happyShift action_23
action_17 (13) = happyShift action_24
action_17 (14) = happyShift action_25
action_17 (15) = happyShift action_26
action_17 (16) = happyShift action_27
action_17 (17) = happyShift action_28
action_17 (26) = happyShift action_50
action_17 (27) = happyShift action_29
action_17 (28) = happyShift action_30
action_17 (30) = happyShift action_31
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (12) = happyShift action_23
action_18 (13) = happyShift action_24
action_18 (14) = happyShift action_25
action_18 (15) = happyShift action_26
action_18 (16) = happyShift action_27
action_18 (17) = happyShift action_28
action_18 (24) = happyShift action_49
action_18 (27) = happyShift action_29
action_18 (28) = happyShift action_30
action_18 (30) = happyShift action_31
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (12) = happyShift action_23
action_19 (13) = happyShift action_24
action_19 (14) = happyShift action_25
action_19 (15) = happyShift action_26
action_19 (16) = happyShift action_27
action_19 (17) = happyShift action_28
action_19 (20) = happyShift action_48
action_19 (27) = happyShift action_29
action_19 (28) = happyShift action_30
action_19 (30) = happyShift action_31
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (34) = happyShift action_42
action_20 (35) = happyShift action_43
action_20 (36) = happyShift action_44
action_20 (37) = happyShift action_45
action_20 (38) = happyShift action_46
action_20 (39) = happyShift action_47
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_19

action_22 (22) = happyShift action_41
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (6) = happyShift action_5
action_23 (7) = happyShift action_6
action_23 (8) = happyShift action_7
action_23 (9) = happyShift action_2
action_23 (10) = happyShift action_8
action_23 (11) = happyShift action_9
action_23 (14) = happyShift action_10
action_23 (18) = happyShift action_11
action_23 (19) = happyShift action_12
action_23 (23) = happyShift action_13
action_23 (25) = happyShift action_14
action_23 (31) = happyShift action_15
action_23 (4) = happyGoto action_40
action_23 (5) = happyGoto action_4
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (6) = happyShift action_5
action_24 (7) = happyShift action_6
action_24 (8) = happyShift action_7
action_24 (9) = happyShift action_2
action_24 (10) = happyShift action_8
action_24 (11) = happyShift action_9
action_24 (14) = happyShift action_10
action_24 (18) = happyShift action_11
action_24 (19) = happyShift action_12
action_24 (23) = happyShift action_13
action_24 (25) = happyShift action_14
action_24 (31) = happyShift action_15
action_24 (4) = happyGoto action_39
action_24 (5) = happyGoto action_4
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (6) = happyShift action_5
action_25 (7) = happyShift action_6
action_25 (8) = happyShift action_7
action_25 (9) = happyShift action_2
action_25 (10) = happyShift action_8
action_25 (11) = happyShift action_9
action_25 (14) = happyShift action_10
action_25 (18) = happyShift action_11
action_25 (19) = happyShift action_12
action_25 (23) = happyShift action_13
action_25 (25) = happyShift action_14
action_25 (31) = happyShift action_15
action_25 (4) = happyGoto action_38
action_25 (5) = happyGoto action_4
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (6) = happyShift action_5
action_26 (7) = happyShift action_6
action_26 (8) = happyShift action_7
action_26 (9) = happyShift action_2
action_26 (10) = happyShift action_8
action_26 (11) = happyShift action_9
action_26 (14) = happyShift action_10
action_26 (18) = happyShift action_11
action_26 (19) = happyShift action_12
action_26 (23) = happyShift action_13
action_26 (25) = happyShift action_14
action_26 (31) = happyShift action_15
action_26 (4) = happyGoto action_37
action_26 (5) = happyGoto action_4
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (6) = happyShift action_5
action_27 (7) = happyShift action_6
action_27 (8) = happyShift action_7
action_27 (9) = happyShift action_2
action_27 (10) = happyShift action_8
action_27 (11) = happyShift action_9
action_27 (14) = happyShift action_10
action_27 (18) = happyShift action_11
action_27 (19) = happyShift action_12
action_27 (23) = happyShift action_13
action_27 (25) = happyShift action_14
action_27 (31) = happyShift action_15
action_27 (4) = happyGoto action_36
action_27 (5) = happyGoto action_4
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (6) = happyShift action_5
action_28 (7) = happyShift action_6
action_28 (8) = happyShift action_7
action_28 (9) = happyShift action_2
action_28 (10) = happyShift action_8
action_28 (11) = happyShift action_9
action_28 (14) = happyShift action_10
action_28 (18) = happyShift action_11
action_28 (19) = happyShift action_12
action_28 (23) = happyShift action_13
action_28 (25) = happyShift action_14
action_28 (31) = happyShift action_15
action_28 (4) = happyGoto action_35
action_28 (5) = happyGoto action_4
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (6) = happyShift action_5
action_29 (7) = happyShift action_6
action_29 (8) = happyShift action_7
action_29 (9) = happyShift action_2
action_29 (10) = happyShift action_8
action_29 (11) = happyShift action_9
action_29 (14) = happyShift action_10
action_29 (18) = happyShift action_11
action_29 (19) = happyShift action_12
action_29 (23) = happyShift action_13
action_29 (25) = happyShift action_14
action_29 (31) = happyShift action_15
action_29 (4) = happyGoto action_34
action_29 (5) = happyGoto action_4
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (6) = happyShift action_5
action_30 (7) = happyShift action_6
action_30 (8) = happyShift action_7
action_30 (9) = happyShift action_2
action_30 (10) = happyShift action_8
action_30 (11) = happyShift action_9
action_30 (14) = happyShift action_10
action_30 (18) = happyShift action_11
action_30 (19) = happyShift action_12
action_30 (23) = happyShift action_13
action_30 (25) = happyShift action_14
action_30 (31) = happyShift action_15
action_30 (4) = happyGoto action_33
action_30 (5) = happyGoto action_4
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (29) = happyShift action_32
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (23) = happyShift action_61
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (12) = happyShift action_23
action_33 (13) = happyShift action_24
action_33 (14) = happyShift action_25
action_33 (15) = happyShift action_26
action_33 (16) = happyShift action_27
action_33 (17) = happyShift action_28
action_33 (27) = happyShift action_29
action_33 (30) = happyShift action_31
action_33 _ = happyReduce_17

action_34 (13) = happyShift action_24
action_34 (30) = happyShift action_31
action_34 _ = happyReduce_14

action_35 (13) = happyShift action_24
action_35 (27) = happyShift action_29
action_35 (30) = happyShift action_31
action_35 _ = happyReduce_11

action_36 (13) = happyShift action_24
action_36 (17) = happyShift action_28
action_36 (27) = happyShift action_29
action_36 (30) = happyShift action_31
action_36 _ = happyReduce_10

action_37 (13) = happyShift action_24
action_37 (16) = happyShift action_27
action_37 (17) = happyShift action_28
action_37 (27) = happyShift action_29
action_37 (30) = happyShift action_31
action_37 _ = happyReduce_9

action_38 (13) = happyShift action_24
action_38 (15) = happyShift action_26
action_38 (16) = happyShift action_27
action_38 (17) = happyShift action_28
action_38 (27) = happyShift action_29
action_38 (30) = happyShift action_31
action_38 _ = happyReduce_8

action_39 (13) = happyShift action_24
action_39 _ = happyReduce_6

action_40 (13) = happyShift action_24
action_40 (14) = happyShift action_25
action_40 (15) = happyShift action_26
action_40 (16) = happyShift action_27
action_40 (17) = happyShift action_28
action_40 (27) = happyShift action_29
action_40 (30) = happyShift action_31
action_40 _ = happyReduce_5

action_41 (6) = happyShift action_5
action_41 (7) = happyShift action_6
action_41 (8) = happyShift action_7
action_41 (9) = happyShift action_2
action_41 (10) = happyShift action_8
action_41 (11) = happyShift action_9
action_41 (14) = happyShift action_10
action_41 (18) = happyShift action_11
action_41 (19) = happyShift action_12
action_41 (23) = happyShift action_13
action_41 (25) = happyShift action_14
action_41 (31) = happyShift action_15
action_41 (4) = happyGoto action_60
action_41 (5) = happyGoto action_4
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (23) = happyShift action_59
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (23) = happyShift action_58
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (23) = happyShift action_57
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (23) = happyShift action_56
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (23) = happyShift action_55
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (23) = happyShift action_54
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (6) = happyShift action_5
action_48 (7) = happyShift action_6
action_48 (8) = happyShift action_7
action_48 (9) = happyShift action_2
action_48 (10) = happyShift action_8
action_48 (11) = happyShift action_9
action_48 (14) = happyShift action_10
action_48 (18) = happyShift action_11
action_48 (19) = happyShift action_12
action_48 (23) = happyShift action_13
action_48 (25) = happyShift action_14
action_48 (31) = happyShift action_15
action_48 (4) = happyGoto action_53
action_48 (5) = happyGoto action_4
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_13

action_50 _ = happyReduce_16

action_51 (12) = happyShift action_23
action_51 (13) = happyShift action_24
action_51 (14) = happyShift action_25
action_51 (15) = happyShift action_26
action_51 (16) = happyShift action_27
action_51 (17) = happyShift action_28
action_51 (24) = happyShift action_52
action_51 (27) = happyShift action_29
action_51 (28) = happyShift action_30
action_51 (30) = happyShift action_31
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (32) = happyShift action_70
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (12) = happyShift action_23
action_53 (13) = happyShift action_24
action_53 (14) = happyShift action_25
action_53 (15) = happyShift action_26
action_53 (16) = happyShift action_27
action_53 (17) = happyShift action_28
action_53 (21) = happyShift action_69
action_53 (27) = happyShift action_29
action_53 (28) = happyShift action_30
action_53 (30) = happyShift action_31
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (6) = happyShift action_5
action_54 (7) = happyShift action_6
action_54 (8) = happyShift action_7
action_54 (9) = happyShift action_2
action_54 (10) = happyShift action_8
action_54 (11) = happyShift action_9
action_54 (14) = happyShift action_10
action_54 (18) = happyShift action_11
action_54 (19) = happyShift action_12
action_54 (23) = happyShift action_13
action_54 (25) = happyShift action_14
action_54 (31) = happyShift action_15
action_54 (4) = happyGoto action_68
action_54 (5) = happyGoto action_4
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (6) = happyShift action_5
action_55 (7) = happyShift action_6
action_55 (8) = happyShift action_7
action_55 (9) = happyShift action_2
action_55 (10) = happyShift action_8
action_55 (11) = happyShift action_9
action_55 (14) = happyShift action_10
action_55 (18) = happyShift action_11
action_55 (19) = happyShift action_12
action_55 (23) = happyShift action_13
action_55 (25) = happyShift action_14
action_55 (31) = happyShift action_15
action_55 (4) = happyGoto action_67
action_55 (5) = happyGoto action_4
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (6) = happyShift action_5
action_56 (7) = happyShift action_6
action_56 (8) = happyShift action_7
action_56 (9) = happyShift action_2
action_56 (10) = happyShift action_8
action_56 (11) = happyShift action_9
action_56 (14) = happyShift action_10
action_56 (18) = happyShift action_11
action_56 (19) = happyShift action_12
action_56 (23) = happyShift action_13
action_56 (25) = happyShift action_14
action_56 (31) = happyShift action_15
action_56 (4) = happyGoto action_66
action_56 (5) = happyGoto action_4
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (6) = happyShift action_5
action_57 (7) = happyShift action_6
action_57 (8) = happyShift action_7
action_57 (9) = happyShift action_2
action_57 (10) = happyShift action_8
action_57 (11) = happyShift action_9
action_57 (14) = happyShift action_10
action_57 (18) = happyShift action_11
action_57 (19) = happyShift action_12
action_57 (23) = happyShift action_13
action_57 (25) = happyShift action_14
action_57 (31) = happyShift action_15
action_57 (4) = happyGoto action_65
action_57 (5) = happyGoto action_4
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (24) = happyShift action_64
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (9) = happyShift action_63
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (13) = happyShift action_24
action_60 (14) = happyShift action_25
action_60 (15) = happyShift action_26
action_60 (16) = happyShift action_27
action_60 (17) = happyShift action_28
action_60 (27) = happyShift action_29
action_60 (30) = happyShift action_31
action_60 _ = happyReduce_7

action_61 (6) = happyShift action_5
action_61 (7) = happyShift action_6
action_61 (8) = happyShift action_7
action_61 (9) = happyShift action_2
action_61 (10) = happyShift action_8
action_61 (11) = happyShift action_9
action_61 (14) = happyShift action_10
action_61 (18) = happyShift action_11
action_61 (19) = happyShift action_12
action_61 (23) = happyShift action_13
action_61 (25) = happyShift action_14
action_61 (31) = happyShift action_15
action_61 (4) = happyGoto action_62
action_61 (5) = happyGoto action_4
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (12) = happyShift action_23
action_62 (13) = happyShift action_24
action_62 (14) = happyShift action_25
action_62 (15) = happyShift action_26
action_62 (16) = happyShift action_27
action_62 (17) = happyShift action_28
action_62 (24) = happyShift action_78
action_62 (27) = happyShift action_29
action_62 (28) = happyShift action_30
action_62 (30) = happyShift action_31
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (24) = happyShift action_77
action_63 _ = happyFail (happyExpListPerState 63)

action_64 _ = happyReduce_21

action_65 (12) = happyShift action_23
action_65 (13) = happyShift action_24
action_65 (14) = happyShift action_25
action_65 (15) = happyShift action_26
action_65 (16) = happyShift action_27
action_65 (17) = happyShift action_28
action_65 (24) = happyShift action_76
action_65 (27) = happyShift action_29
action_65 (28) = happyShift action_30
action_65 (30) = happyShift action_31
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (12) = happyShift action_23
action_66 (13) = happyShift action_24
action_66 (14) = happyShift action_25
action_66 (15) = happyShift action_26
action_66 (16) = happyShift action_27
action_66 (17) = happyShift action_28
action_66 (24) = happyShift action_75
action_66 (27) = happyShift action_29
action_66 (28) = happyShift action_30
action_66 (30) = happyShift action_31
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (12) = happyShift action_23
action_67 (13) = happyShift action_24
action_67 (14) = happyShift action_25
action_67 (15) = happyShift action_26
action_67 (16) = happyShift action_27
action_67 (17) = happyShift action_28
action_67 (27) = happyShift action_74
action_67 (28) = happyShift action_30
action_67 (30) = happyShift action_31
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (12) = happyShift action_23
action_68 (13) = happyShift action_24
action_68 (14) = happyShift action_25
action_68 (15) = happyShift action_26
action_68 (16) = happyShift action_27
action_68 (17) = happyShift action_28
action_68 (24) = happyShift action_73
action_68 (27) = happyShift action_29
action_68 (28) = happyShift action_30
action_68 (30) = happyShift action_31
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (6) = happyShift action_5
action_69 (7) = happyShift action_6
action_69 (8) = happyShift action_7
action_69 (9) = happyShift action_2
action_69 (10) = happyShift action_8
action_69 (11) = happyShift action_9
action_69 (14) = happyShift action_10
action_69 (18) = happyShift action_11
action_69 (19) = happyShift action_12
action_69 (23) = happyShift action_13
action_69 (25) = happyShift action_14
action_69 (31) = happyShift action_15
action_69 (4) = happyGoto action_72
action_69 (5) = happyGoto action_4
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (6) = happyShift action_5
action_70 (7) = happyShift action_6
action_70 (8) = happyShift action_7
action_70 (9) = happyShift action_2
action_70 (10) = happyShift action_8
action_70 (11) = happyShift action_9
action_70 (14) = happyShift action_10
action_70 (18) = happyShift action_11
action_70 (19) = happyShift action_12
action_70 (23) = happyShift action_13
action_70 (25) = happyShift action_14
action_70 (31) = happyShift action_15
action_70 (4) = happyGoto action_71
action_70 (5) = happyGoto action_4
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (12) = happyShift action_23
action_71 (13) = happyShift action_24
action_71 (14) = happyShift action_25
action_71 (15) = happyShift action_26
action_71 (16) = happyShift action_27
action_71 (17) = happyShift action_28
action_71 (27) = happyShift action_29
action_71 (28) = happyShift action_30
action_71 (30) = happyShift action_31
action_71 (33) = happyShift action_80
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (12) = happyShift action_23
action_72 (13) = happyShift action_24
action_72 (14) = happyShift action_25
action_72 (15) = happyShift action_26
action_72 (16) = happyShift action_27
action_72 (17) = happyShift action_28
action_72 (27) = happyShift action_29
action_72 (28) = happyShift action_30
action_72 (30) = happyShift action_31
action_72 _ = happyReduce_12

action_73 _ = happyReduce_25

action_74 (6) = happyShift action_5
action_74 (7) = happyShift action_6
action_74 (8) = happyShift action_7
action_74 (9) = happyShift action_2
action_74 (10) = happyShift action_8
action_74 (11) = happyShift action_9
action_74 (14) = happyShift action_10
action_74 (18) = happyShift action_11
action_74 (19) = happyShift action_12
action_74 (23) = happyShift action_13
action_74 (25) = happyShift action_14
action_74 (31) = happyShift action_15
action_74 (4) = happyGoto action_79
action_74 (5) = happyGoto action_4
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_23

action_76 _ = happyReduce_22

action_77 _ = happyReduce_20

action_78 _ = happyReduce_18

action_79 (13) = happyShift action_24
action_79 (24) = happyShift action_81
action_79 (30) = happyShift action_31
action_79 _ = happyReduce_14

action_80 _ = happyReduce_15

action_81 _ = happyReduce_24

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn4
		 (TmInt happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn4
		 (TmVar happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn4
		 (TmTrue
	)

happyReduce_4 = happySpecReduce_1  4 happyReduction_4
happyReduction_4 _
	 =  HappyAbsSyn4
		 (TmFalse
	)

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmLessThan happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmEqualTo happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 4 4 happyReduction_7
happyReduction_7 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_2)) `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmAssign happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmAdd happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  4 happyReduction_9
happyReduction_9 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmMulti happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmSubtract happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmDivide happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 6 4 happyReduction_12
happyReduction_12 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_3  4 happyReduction_13
happyReduction_13 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  4 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmComma happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 7 4 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmWhile happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (TmStream happy_var_2
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  4 happyReduction_17
happyReduction_17 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmBreak happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 6 4 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmMap happy_var_1 happy_var_5
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_2  4 happyReduction_19
happyReduction_19 (HappyTerminal (TokenInt _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (TmAddFunc happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 6 4 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyTerminal (TokenInt _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmGetElem happy_var_1 happy_var_5
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 5 4 happyReduction_21
happyReduction_21 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmGetSize happy_var_1
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 6 4 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmAddElem happy_var_1 happy_var_5
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 6 4 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmRemoveElem happy_var_1 happy_var_5
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 8 4 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmInsertElem happy_var_1 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 6 4 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmDeleteElem happy_var_1 happy_var_5
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_1  5 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn5
		 (TyBool
	)

happyReduce_27 = happySpecReduce_1  5 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn5
		 (TyInt
	)

happyReduce_28 = happySpecReduce_1  5 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn5
		 (TyStream
	)

happyNewToken action sts stk [] =
	action 40 40 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenTypeBool _ -> cont 6;
	TokenTypeInt _ -> cont 7;
	TokenTypeStream _ -> cont 8;
	TokenInt _ happy_dollar_dollar -> cont 9;
	TokenTrue _ -> cont 10;
	TokenFalse _ -> cont 11;
	TokenLessThan _ -> cont 12;
	TokenEqualTo _ -> cont 13;
	TokenPlus _ -> cont 14;
	TokenMulti _ -> cont 15;
	TokenMinus _ -> cont 16;
	TokenDivide _ -> cont 17;
	TokenVar _ happy_dollar_dollar -> cont 18;
	TokenIf _ -> cont 19;
	TokenThen _ -> cont 20;
	TokenElse _ -> cont 21;
	TokenAssign _ -> cont 22;
	TokenLParen _ -> cont 23;
	TokenRParen _ -> cont 24;
	TokenLStream _ -> cont 25;
	TokenRStream _ -> cont 26;
	TokenComma _ -> cont 27;
	TokenBreak _ -> cont 28;
	TokenMap _ -> cont 29;
	TokenApply _ -> cont 30;
	TokenWhile _ -> cont 31;
	TokenLBracket _ -> cont 32;
	TokenRBracket _ -> cont 33;
	TokenGet _ -> cont 34;
	TokenSize _ -> cont 35;
	TokenAdd _ -> cont 36;
	TokenRemove _ -> cont 37;
	TokenInsert _ -> cont 38;
	TokenDelete _ -> cont 39;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 40 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data Type = TyInt | TyBool | TyString | TyStream
   deriving (Show,Eq, Ord)

type Environment = [ (String,Expr) ]

data Expr = TmInt Int | TmTrue | TmFalse | TmLessThan Expr Expr 
            | TmAdd Expr Expr | TmVar String | TmMulti Expr Expr | TmSubtract Expr Expr | TmDivide Expr Expr
            | TmIf Expr Expr Expr | TmMap Expr Expr | TmAddFunc Int
            | TmComma Expr Expr | TmStream Expr | TmGetElem String Int | TmGetSize String | TmAddElem String Expr
            | TmRemoveElem String Expr | TmInsertElem String Expr Expr | TmDeleteElem String Expr
			| TmAssign Type String Expr | TmWhile Expr Expr
			| TmEqualTo Expr Expr
			| TmBreak Expr Expr
    deriving (Show,Eq, Ord)
{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "D:/GitHub/haskell-platform/build/ghc-bindist/local/lib/include/ghcversion.h" #-}















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "F:/Users/randy/AppData/Local/Temp/ghc5880_0/ghc_2.h" #-}


























































































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates\\\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates\\\\GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 75 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 84 "templates\\\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates\\\\GenericTemplate.hs" #-}

{-# LINE 147 "templates\\\\GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates\\\\GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates\\\\GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
