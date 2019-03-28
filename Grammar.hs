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
happyExpList = Happy_Data_Array.listArray (0,281) ([2016,8518,256,8,0,0,0,0,61440,6147,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,49152,35855,66,32258,5216,4098,1008,4259,128,0,1,0,64,0,0,0,512,12351,266,8,32894,3,61440,6403,0,40832,192,0,0,32640,0,128,0,49404,1064,57376,17927,33,16129,2608,2049,33272,2129,49216,35855,66,32258,5216,4098,1008,4259,32896,6175,133,4,32831,0,4096,0,0,128,32,0,68,1,8192,2051,0,7424,64,0,8,0,49152,4103,0,49404,1064,32,16384,0,0,512,0,0,16,0,32768,0,0,1024,0,0,32,0,0,1,0,2048,0,2016,8518,256,0,0,0,0,0,61440,6403,0,0,0,0,0,32,57344,12359,0,49404,1064,32,512,0,16128,2608,2049,33272,2129,49216,35855,66,32258,5216,4098,0,64,32768,6175,133,4,32830,0,63488,3201,0,0,0,0,8318,3,61440,6403,0,8064,192,0,16636,6,0,512,0,16128,384,57344,17927,33,16129,2608,2049,32256,8960,0,1008,24,32256,5216,4098,0,0,0,0,0,64512,10432,8196,0,0,0,0,0,0,0,0,8192,256,0,256,8,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Exp","Type","Bool","Int","Stream","int","true","false","'<'","'=='","'+'","'*'","'-'","'/'","var","if","then","else","'='","'('","')'","'['","']'","','","';'","'.'","while","'{'","'}'","get","size","add","remove","insert","delete","zip","getElem","'\\*'","'*/'","%eof"]
        bit_start = st * 43
        bit_end = (st + 1) * 43
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..42]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (6) = happyShift action_5
action_0 (7) = happyShift action_6
action_0 (8) = happyShift action_7
action_0 (9) = happyShift action_2
action_0 (10) = happyShift action_8
action_0 (11) = happyShift action_9
action_0 (18) = happyShift action_10
action_0 (19) = happyShift action_11
action_0 (23) = happyShift action_12
action_0 (25) = happyShift action_13
action_0 (30) = happyShift action_14
action_0 (41) = happyShift action_15
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
action_3 (43) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (18) = happyShift action_22
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_27

action_6 _ = happyReduce_28

action_7 _ = happyReduce_29

action_8 _ = happyReduce_3

action_9 _ = happyReduce_4

action_10 (29) = happyShift action_21
action_10 _ = happyReduce_2

action_11 (6) = happyShift action_5
action_11 (7) = happyShift action_6
action_11 (8) = happyShift action_7
action_11 (9) = happyShift action_2
action_11 (10) = happyShift action_8
action_11 (11) = happyShift action_9
action_11 (18) = happyShift action_10
action_11 (19) = happyShift action_11
action_11 (23) = happyShift action_12
action_11 (25) = happyShift action_13
action_11 (30) = happyShift action_14
action_11 (41) = happyShift action_15
action_11 (4) = happyGoto action_20
action_11 (5) = happyGoto action_4
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (6) = happyShift action_5
action_12 (7) = happyShift action_6
action_12 (8) = happyShift action_7
action_12 (9) = happyShift action_2
action_12 (10) = happyShift action_8
action_12 (11) = happyShift action_9
action_12 (18) = happyShift action_10
action_12 (19) = happyShift action_11
action_12 (23) = happyShift action_12
action_12 (25) = happyShift action_13
action_12 (30) = happyShift action_14
action_12 (41) = happyShift action_15
action_12 (4) = happyGoto action_19
action_12 (5) = happyGoto action_4
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (6) = happyShift action_5
action_13 (7) = happyShift action_6
action_13 (8) = happyShift action_7
action_13 (9) = happyShift action_2
action_13 (10) = happyShift action_8
action_13 (11) = happyShift action_9
action_13 (18) = happyShift action_10
action_13 (19) = happyShift action_11
action_13 (23) = happyShift action_12
action_13 (25) = happyShift action_13
action_13 (30) = happyShift action_14
action_13 (41) = happyShift action_15
action_13 (4) = happyGoto action_18
action_13 (5) = happyGoto action_4
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (23) = happyShift action_17
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (18) = happyShift action_16
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (42) = happyShift action_52
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (6) = happyShift action_5
action_17 (7) = happyShift action_6
action_17 (8) = happyShift action_7
action_17 (9) = happyShift action_2
action_17 (10) = happyShift action_8
action_17 (11) = happyShift action_9
action_17 (18) = happyShift action_10
action_17 (19) = happyShift action_11
action_17 (23) = happyShift action_12
action_17 (25) = happyShift action_13
action_17 (30) = happyShift action_14
action_17 (41) = happyShift action_15
action_17 (4) = happyGoto action_51
action_17 (5) = happyGoto action_4
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (12) = happyShift action_23
action_18 (13) = happyShift action_24
action_18 (14) = happyShift action_25
action_18 (15) = happyShift action_26
action_18 (16) = happyShift action_27
action_18 (17) = happyShift action_28
action_18 (26) = happyShift action_50
action_18 (27) = happyShift action_29
action_18 (28) = happyShift action_30
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (12) = happyShift action_23
action_19 (13) = happyShift action_24
action_19 (14) = happyShift action_25
action_19 (15) = happyShift action_26
action_19 (16) = happyShift action_27
action_19 (17) = happyShift action_28
action_19 (24) = happyShift action_49
action_19 (27) = happyShift action_29
action_19 (28) = happyShift action_30
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (12) = happyShift action_23
action_20 (13) = happyShift action_24
action_20 (14) = happyShift action_25
action_20 (15) = happyShift action_26
action_20 (16) = happyShift action_27
action_20 (17) = happyShift action_28
action_20 (20) = happyShift action_48
action_20 (27) = happyShift action_29
action_20 (28) = happyShift action_30
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (33) = happyShift action_40
action_21 (34) = happyShift action_41
action_21 (35) = happyShift action_42
action_21 (36) = happyShift action_43
action_21 (37) = happyShift action_44
action_21 (38) = happyShift action_45
action_21 (39) = happyShift action_46
action_21 (40) = happyShift action_47
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (22) = happyShift action_39
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (6) = happyShift action_5
action_23 (7) = happyShift action_6
action_23 (8) = happyShift action_7
action_23 (9) = happyShift action_2
action_23 (10) = happyShift action_8
action_23 (11) = happyShift action_9
action_23 (18) = happyShift action_10
action_23 (19) = happyShift action_11
action_23 (23) = happyShift action_12
action_23 (25) = happyShift action_13
action_23 (30) = happyShift action_14
action_23 (41) = happyShift action_15
action_23 (4) = happyGoto action_38
action_23 (5) = happyGoto action_4
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (6) = happyShift action_5
action_24 (7) = happyShift action_6
action_24 (8) = happyShift action_7
action_24 (9) = happyShift action_2
action_24 (10) = happyShift action_8
action_24 (11) = happyShift action_9
action_24 (18) = happyShift action_10
action_24 (19) = happyShift action_11
action_24 (23) = happyShift action_12
action_24 (25) = happyShift action_13
action_24 (30) = happyShift action_14
action_24 (41) = happyShift action_15
action_24 (4) = happyGoto action_37
action_24 (5) = happyGoto action_4
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (6) = happyShift action_5
action_25 (7) = happyShift action_6
action_25 (8) = happyShift action_7
action_25 (9) = happyShift action_2
action_25 (10) = happyShift action_8
action_25 (11) = happyShift action_9
action_25 (18) = happyShift action_10
action_25 (19) = happyShift action_11
action_25 (23) = happyShift action_12
action_25 (25) = happyShift action_13
action_25 (30) = happyShift action_14
action_25 (41) = happyShift action_15
action_25 (4) = happyGoto action_36
action_25 (5) = happyGoto action_4
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (6) = happyShift action_5
action_26 (7) = happyShift action_6
action_26 (8) = happyShift action_7
action_26 (9) = happyShift action_2
action_26 (10) = happyShift action_8
action_26 (11) = happyShift action_9
action_26 (18) = happyShift action_10
action_26 (19) = happyShift action_11
action_26 (23) = happyShift action_12
action_26 (25) = happyShift action_13
action_26 (30) = happyShift action_14
action_26 (41) = happyShift action_15
action_26 (4) = happyGoto action_35
action_26 (5) = happyGoto action_4
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (6) = happyShift action_5
action_27 (7) = happyShift action_6
action_27 (8) = happyShift action_7
action_27 (9) = happyShift action_2
action_27 (10) = happyShift action_8
action_27 (11) = happyShift action_9
action_27 (18) = happyShift action_10
action_27 (19) = happyShift action_11
action_27 (23) = happyShift action_12
action_27 (25) = happyShift action_13
action_27 (30) = happyShift action_14
action_27 (41) = happyShift action_15
action_27 (4) = happyGoto action_34
action_27 (5) = happyGoto action_4
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (6) = happyShift action_5
action_28 (7) = happyShift action_6
action_28 (8) = happyShift action_7
action_28 (9) = happyShift action_2
action_28 (10) = happyShift action_8
action_28 (11) = happyShift action_9
action_28 (18) = happyShift action_10
action_28 (19) = happyShift action_11
action_28 (23) = happyShift action_12
action_28 (25) = happyShift action_13
action_28 (30) = happyShift action_14
action_28 (41) = happyShift action_15
action_28 (4) = happyGoto action_33
action_28 (5) = happyGoto action_4
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (6) = happyShift action_5
action_29 (7) = happyShift action_6
action_29 (8) = happyShift action_7
action_29 (9) = happyShift action_2
action_29 (10) = happyShift action_8
action_29 (11) = happyShift action_9
action_29 (18) = happyShift action_10
action_29 (19) = happyShift action_11
action_29 (23) = happyShift action_12
action_29 (25) = happyShift action_13
action_29 (30) = happyShift action_14
action_29 (41) = happyShift action_15
action_29 (4) = happyGoto action_32
action_29 (5) = happyGoto action_4
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (6) = happyShift action_5
action_30 (7) = happyShift action_6
action_30 (8) = happyShift action_7
action_30 (9) = happyShift action_2
action_30 (10) = happyShift action_8
action_30 (11) = happyShift action_9
action_30 (18) = happyShift action_10
action_30 (19) = happyShift action_11
action_30 (23) = happyShift action_12
action_30 (25) = happyShift action_13
action_30 (30) = happyShift action_14
action_30 (41) = happyShift action_15
action_30 (4) = happyGoto action_31
action_30 (5) = happyGoto action_4
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (12) = happyShift action_23
action_31 (13) = happyShift action_24
action_31 (14) = happyShift action_25
action_31 (15) = happyShift action_26
action_31 (16) = happyShift action_27
action_31 (17) = happyShift action_28
action_31 (27) = happyShift action_29
action_31 _ = happyReduce_17

action_32 (13) = happyShift action_24
action_32 _ = happyReduce_14

action_33 (13) = happyShift action_24
action_33 (27) = happyShift action_29
action_33 _ = happyReduce_11

action_34 (13) = happyShift action_24
action_34 (17) = happyShift action_28
action_34 (27) = happyShift action_29
action_34 _ = happyReduce_10

action_35 (13) = happyShift action_24
action_35 (16) = happyShift action_27
action_35 (17) = happyShift action_28
action_35 (27) = happyShift action_29
action_35 _ = happyReduce_9

action_36 (13) = happyShift action_24
action_36 (15) = happyShift action_26
action_36 (16) = happyShift action_27
action_36 (17) = happyShift action_28
action_36 (27) = happyShift action_29
action_36 _ = happyReduce_8

action_37 (13) = happyShift action_24
action_37 _ = happyReduce_6

action_38 (13) = happyShift action_24
action_38 (14) = happyShift action_25
action_38 (15) = happyShift action_26
action_38 (16) = happyShift action_27
action_38 (17) = happyShift action_28
action_38 (27) = happyShift action_29
action_38 _ = happyReduce_5

action_39 (6) = happyShift action_5
action_39 (7) = happyShift action_6
action_39 (8) = happyShift action_7
action_39 (9) = happyShift action_2
action_39 (10) = happyShift action_8
action_39 (11) = happyShift action_9
action_39 (18) = happyShift action_10
action_39 (19) = happyShift action_11
action_39 (23) = happyShift action_12
action_39 (25) = happyShift action_13
action_39 (30) = happyShift action_14
action_39 (41) = happyShift action_15
action_39 (4) = happyGoto action_63
action_39 (5) = happyGoto action_4
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (23) = happyShift action_62
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (23) = happyShift action_61
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (23) = happyShift action_60
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (23) = happyShift action_59
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (23) = happyShift action_58
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (23) = happyShift action_57
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (23) = happyShift action_56
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (23) = happyShift action_55
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (6) = happyShift action_5
action_48 (7) = happyShift action_6
action_48 (8) = happyShift action_7
action_48 (9) = happyShift action_2
action_48 (10) = happyShift action_8
action_48 (11) = happyShift action_9
action_48 (18) = happyShift action_10
action_48 (19) = happyShift action_11
action_48 (23) = happyShift action_12
action_48 (25) = happyShift action_13
action_48 (30) = happyShift action_14
action_48 (41) = happyShift action_15
action_48 (4) = happyGoto action_54
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
action_51 (24) = happyShift action_53
action_51 (27) = happyShift action_29
action_51 (28) = happyShift action_30
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_26

action_53 (31) = happyShift action_73
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (12) = happyShift action_23
action_54 (13) = happyShift action_24
action_54 (14) = happyShift action_25
action_54 (15) = happyShift action_26
action_54 (16) = happyShift action_27
action_54 (17) = happyShift action_28
action_54 (21) = happyShift action_72
action_54 (27) = happyShift action_29
action_54 (28) = happyShift action_30
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (6) = happyShift action_5
action_55 (7) = happyShift action_6
action_55 (8) = happyShift action_7
action_55 (9) = happyShift action_2
action_55 (10) = happyShift action_8
action_55 (11) = happyShift action_9
action_55 (18) = happyShift action_10
action_55 (19) = happyShift action_11
action_55 (23) = happyShift action_12
action_55 (25) = happyShift action_13
action_55 (30) = happyShift action_14
action_55 (41) = happyShift action_15
action_55 (4) = happyGoto action_71
action_55 (5) = happyGoto action_4
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (18) = happyShift action_70
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (6) = happyShift action_5
action_57 (7) = happyShift action_6
action_57 (8) = happyShift action_7
action_57 (9) = happyShift action_2
action_57 (10) = happyShift action_8
action_57 (11) = happyShift action_9
action_57 (18) = happyShift action_10
action_57 (19) = happyShift action_11
action_57 (23) = happyShift action_12
action_57 (25) = happyShift action_13
action_57 (30) = happyShift action_14
action_57 (41) = happyShift action_15
action_57 (4) = happyGoto action_69
action_57 (5) = happyGoto action_4
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (6) = happyShift action_5
action_58 (7) = happyShift action_6
action_58 (8) = happyShift action_7
action_58 (9) = happyShift action_2
action_58 (10) = happyShift action_8
action_58 (11) = happyShift action_9
action_58 (18) = happyShift action_10
action_58 (19) = happyShift action_11
action_58 (23) = happyShift action_12
action_58 (25) = happyShift action_13
action_58 (30) = happyShift action_14
action_58 (41) = happyShift action_15
action_58 (4) = happyGoto action_68
action_58 (5) = happyGoto action_4
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (6) = happyShift action_5
action_59 (7) = happyShift action_6
action_59 (8) = happyShift action_7
action_59 (9) = happyShift action_2
action_59 (10) = happyShift action_8
action_59 (11) = happyShift action_9
action_59 (18) = happyShift action_10
action_59 (19) = happyShift action_11
action_59 (23) = happyShift action_12
action_59 (25) = happyShift action_13
action_59 (30) = happyShift action_14
action_59 (41) = happyShift action_15
action_59 (4) = happyGoto action_67
action_59 (5) = happyGoto action_4
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (6) = happyShift action_5
action_60 (7) = happyShift action_6
action_60 (8) = happyShift action_7
action_60 (9) = happyShift action_2
action_60 (10) = happyShift action_8
action_60 (11) = happyShift action_9
action_60 (18) = happyShift action_10
action_60 (19) = happyShift action_11
action_60 (23) = happyShift action_12
action_60 (25) = happyShift action_13
action_60 (30) = happyShift action_14
action_60 (41) = happyShift action_15
action_60 (4) = happyGoto action_66
action_60 (5) = happyGoto action_4
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (24) = happyShift action_65
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (6) = happyShift action_5
action_62 (7) = happyShift action_6
action_62 (8) = happyShift action_7
action_62 (9) = happyShift action_2
action_62 (10) = happyShift action_8
action_62 (11) = happyShift action_9
action_62 (18) = happyShift action_10
action_62 (19) = happyShift action_11
action_62 (23) = happyShift action_12
action_62 (25) = happyShift action_13
action_62 (30) = happyShift action_14
action_62 (41) = happyShift action_15
action_62 (4) = happyGoto action_64
action_62 (5) = happyGoto action_4
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (13) = happyShift action_24
action_63 (14) = happyShift action_25
action_63 (15) = happyShift action_26
action_63 (16) = happyShift action_27
action_63 (17) = happyShift action_28
action_63 (27) = happyShift action_29
action_63 _ = happyReduce_7

action_64 (12) = happyShift action_23
action_64 (13) = happyShift action_24
action_64 (14) = happyShift action_25
action_64 (15) = happyShift action_26
action_64 (16) = happyShift action_27
action_64 (17) = happyShift action_28
action_64 (24) = happyShift action_82
action_64 (27) = happyShift action_29
action_64 (28) = happyShift action_30
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_19

action_66 (12) = happyShift action_23
action_66 (13) = happyShift action_24
action_66 (14) = happyShift action_25
action_66 (15) = happyShift action_26
action_66 (16) = happyShift action_27
action_66 (17) = happyShift action_28
action_66 (24) = happyShift action_81
action_66 (27) = happyShift action_29
action_66 (28) = happyShift action_30
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (12) = happyShift action_23
action_67 (13) = happyShift action_24
action_67 (14) = happyShift action_25
action_67 (15) = happyShift action_26
action_67 (16) = happyShift action_27
action_67 (17) = happyShift action_28
action_67 (24) = happyShift action_80
action_67 (27) = happyShift action_29
action_67 (28) = happyShift action_30
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (12) = happyShift action_23
action_68 (13) = happyShift action_24
action_68 (14) = happyShift action_25
action_68 (15) = happyShift action_26
action_68 (16) = happyShift action_27
action_68 (17) = happyShift action_28
action_68 (27) = happyShift action_79
action_68 (28) = happyShift action_30
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (12) = happyShift action_23
action_69 (13) = happyShift action_24
action_69 (14) = happyShift action_25
action_69 (15) = happyShift action_26
action_69 (16) = happyShift action_27
action_69 (17) = happyShift action_28
action_69 (24) = happyShift action_78
action_69 (27) = happyShift action_29
action_69 (28) = happyShift action_30
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (24) = happyShift action_77
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (12) = happyShift action_23
action_71 (13) = happyShift action_24
action_71 (14) = happyShift action_25
action_71 (15) = happyShift action_26
action_71 (16) = happyShift action_27
action_71 (17) = happyShift action_28
action_71 (27) = happyShift action_76
action_71 (28) = happyShift action_30
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (6) = happyShift action_5
action_72 (7) = happyShift action_6
action_72 (8) = happyShift action_7
action_72 (9) = happyShift action_2
action_72 (10) = happyShift action_8
action_72 (11) = happyShift action_9
action_72 (18) = happyShift action_10
action_72 (19) = happyShift action_11
action_72 (23) = happyShift action_12
action_72 (25) = happyShift action_13
action_72 (30) = happyShift action_14
action_72 (41) = happyShift action_15
action_72 (4) = happyGoto action_75
action_72 (5) = happyGoto action_4
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (6) = happyShift action_5
action_73 (7) = happyShift action_6
action_73 (8) = happyShift action_7
action_73 (9) = happyShift action_2
action_73 (10) = happyShift action_8
action_73 (11) = happyShift action_9
action_73 (18) = happyShift action_10
action_73 (19) = happyShift action_11
action_73 (23) = happyShift action_12
action_73 (25) = happyShift action_13
action_73 (30) = happyShift action_14
action_73 (41) = happyShift action_15
action_73 (4) = happyGoto action_74
action_73 (5) = happyGoto action_4
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (12) = happyShift action_23
action_74 (13) = happyShift action_24
action_74 (14) = happyShift action_25
action_74 (15) = happyShift action_26
action_74 (16) = happyShift action_27
action_74 (17) = happyShift action_28
action_74 (27) = happyShift action_29
action_74 (28) = happyShift action_30
action_74 (32) = happyShift action_85
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (12) = happyShift action_23
action_75 (13) = happyShift action_24
action_75 (14) = happyShift action_25
action_75 (15) = happyShift action_26
action_75 (16) = happyShift action_27
action_75 (17) = happyShift action_28
action_75 (27) = happyShift action_29
action_75 (28) = happyShift action_30
action_75 _ = happyReduce_12

action_76 (6) = happyShift action_5
action_76 (7) = happyShift action_6
action_76 (8) = happyShift action_7
action_76 (9) = happyShift action_2
action_76 (10) = happyShift action_8
action_76 (11) = happyShift action_9
action_76 (18) = happyShift action_10
action_76 (19) = happyShift action_11
action_76 (23) = happyShift action_12
action_76 (25) = happyShift action_13
action_76 (30) = happyShift action_14
action_76 (41) = happyShift action_15
action_76 (4) = happyGoto action_84
action_76 (5) = happyGoto action_4
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_24

action_78 _ = happyReduce_23

action_79 (6) = happyShift action_5
action_79 (7) = happyShift action_6
action_79 (8) = happyShift action_7
action_79 (9) = happyShift action_2
action_79 (10) = happyShift action_8
action_79 (11) = happyShift action_9
action_79 (18) = happyShift action_10
action_79 (19) = happyShift action_11
action_79 (23) = happyShift action_12
action_79 (25) = happyShift action_13
action_79 (30) = happyShift action_14
action_79 (41) = happyShift action_15
action_79 (4) = happyGoto action_83
action_79 (5) = happyGoto action_4
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_21

action_81 _ = happyReduce_20

action_82 _ = happyReduce_18

action_83 (13) = happyShift action_24
action_83 (24) = happyShift action_87
action_83 _ = happyReduce_14

action_84 (13) = happyShift action_24
action_84 (24) = happyShift action_86
action_84 _ = happyReduce_14

action_85 _ = happyReduce_15

action_86 _ = happyReduce_25

action_87 _ = happyReduce_22

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
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmGet happy_var_1 happy_var_5
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 5 4 happyReduction_19
happyReduction_19 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmGetSize happy_var_1
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 6 4 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmAddElem happy_var_1 happy_var_5
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 6 4 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmRemoveElem happy_var_1 happy_var_5
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 8 4 happyReduction_22
happyReduction_22 (_ `HappyStk`
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

happyReduce_23 = happyReduce 6 4 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmDeleteElem happy_var_1 happy_var_5
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 6 4 happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_5)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmZip happy_var_1 happy_var_5
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 8 4 happyReduction_25
happyReduction_25 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (TmGetElem happy_var_1 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_3  4 happyReduction_26
happyReduction_26 _
	(HappyTerminal (TokenVar _ happy_var_2))
	_
	 =  HappyAbsSyn4
		 (TmComment happy_var_2
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  5 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn5
		 (TyBool
	)

happyReduce_28 = happySpecReduce_1  5 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn5
		 (TyInt
	)

happyReduce_29 = happySpecReduce_1  5 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn5
		 (TyStream
	)

happyNewToken action sts stk [] =
	action 43 43 notHappyAtAll (HappyState action) sts stk []

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
	TokenApply _ -> cont 29;
	TokenWhile _ -> cont 30;
	TokenLBracket _ -> cont 31;
	TokenRBracket _ -> cont 32;
	TokenGet _ -> cont 33;
	TokenSize _ -> cont 34;
	TokenAdd _ -> cont 35;
	TokenRemove _ -> cont 36;
	TokenInsert _ -> cont 37;
	TokenDelete _ -> cont 38;
	TokenZip _ -> cont 39;
	TokenGetElem _ -> cont 40;
	TokenCommentOpen _ -> cont 41;
	TokenCommentClose _ -> cont 42;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 43 tk tks = happyError' (tks, explist)
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
            | TmIf Expr Expr Expr 
            | TmComma Expr Expr | TmStream Expr | TmGet String Expr | TmGetSize String | TmAddElem String Expr
            | TmRemoveElem String Expr | TmInsertElem String Expr Expr | TmDeleteElem String Expr
			| TmAssign Type String Expr | TmWhile Expr Expr | TmZip String String | TmGetElem String Expr Expr
			| TmEqualTo Expr Expr
			| TmBreak Expr Expr
			| TmComment String
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
