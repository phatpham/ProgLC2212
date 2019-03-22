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
happyExpList = Happy_Data_Array.listArray (0,150) ([992,163,8,0,0,49152,24591,0,1,0,0,0,0,0,0,0,0,57344,41731,15872,2608,992,163,4032,112,16636,49158,24655,0,16,12350,57354,41731,15872,2608,992,163,12350,57354,41731,15872,2608,992,163,3968,32,8,32768,8192,34816,512,3200,32,232,32770,0,63488,1536,12350,57354,41731,0,0,0,0,36800,96,8,15872,2608,64512,1536,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Exp","Type","Bool","Int","int","true","false","'<'","'=='","'+'","'*'","'-'","'/'","var","if","then","else","'='","'('","')'","'['","']'","','","';'","%eof"]
        bit_start = st * 28
        bit_end = (st + 1) * 28
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..27]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (6) = happyShift action_5
action_0 (7) = happyShift action_6
action_0 (8) = happyShift action_2
action_0 (9) = happyShift action_7
action_0 (10) = happyShift action_8
action_0 (17) = happyShift action_9
action_0 (18) = happyShift action_10
action_0 (22) = happyShift action_11
action_0 (24) = happyShift action_12
action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (8) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (11) = happyShift action_17
action_3 (12) = happyShift action_18
action_3 (13) = happyShift action_19
action_3 (14) = happyShift action_20
action_3 (15) = happyShift action_21
action_3 (16) = happyShift action_22
action_3 (26) = happyShift action_23
action_3 (27) = happyShift action_24
action_3 (28) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (17) = happyShift action_16
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_17

action_6 _ = happyReduce_18

action_7 _ = happyReduce_3

action_8 _ = happyReduce_4

action_9 _ = happyReduce_2

action_10 (6) = happyShift action_5
action_10 (7) = happyShift action_6
action_10 (8) = happyShift action_2
action_10 (9) = happyShift action_7
action_10 (10) = happyShift action_8
action_10 (17) = happyShift action_9
action_10 (18) = happyShift action_10
action_10 (22) = happyShift action_11
action_10 (24) = happyShift action_12
action_10 (4) = happyGoto action_15
action_10 (5) = happyGoto action_4
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (6) = happyShift action_5
action_11 (7) = happyShift action_6
action_11 (8) = happyShift action_2
action_11 (9) = happyShift action_7
action_11 (10) = happyShift action_8
action_11 (17) = happyShift action_9
action_11 (18) = happyShift action_10
action_11 (22) = happyShift action_11
action_11 (24) = happyShift action_12
action_11 (4) = happyGoto action_14
action_11 (5) = happyGoto action_4
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (6) = happyShift action_5
action_12 (7) = happyShift action_6
action_12 (8) = happyShift action_2
action_12 (9) = happyShift action_7
action_12 (10) = happyShift action_8
action_12 (17) = happyShift action_9
action_12 (18) = happyShift action_10
action_12 (22) = happyShift action_11
action_12 (24) = happyShift action_12
action_12 (4) = happyGoto action_13
action_12 (5) = happyGoto action_4
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (11) = happyShift action_17
action_13 (12) = happyShift action_18
action_13 (13) = happyShift action_19
action_13 (14) = happyShift action_20
action_13 (15) = happyShift action_21
action_13 (16) = happyShift action_22
action_13 (25) = happyShift action_36
action_13 (26) = happyShift action_23
action_13 (27) = happyShift action_24
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (11) = happyShift action_17
action_14 (12) = happyShift action_18
action_14 (13) = happyShift action_19
action_14 (14) = happyShift action_20
action_14 (15) = happyShift action_21
action_14 (16) = happyShift action_22
action_14 (23) = happyShift action_35
action_14 (26) = happyShift action_23
action_14 (27) = happyShift action_24
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (11) = happyShift action_17
action_15 (12) = happyShift action_18
action_15 (13) = happyShift action_19
action_15 (14) = happyShift action_20
action_15 (15) = happyShift action_21
action_15 (16) = happyShift action_22
action_15 (19) = happyShift action_34
action_15 (26) = happyShift action_23
action_15 (27) = happyShift action_24
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (21) = happyShift action_33
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (6) = happyShift action_5
action_17 (7) = happyShift action_6
action_17 (8) = happyShift action_2
action_17 (9) = happyShift action_7
action_17 (10) = happyShift action_8
action_17 (17) = happyShift action_9
action_17 (18) = happyShift action_10
action_17 (22) = happyShift action_11
action_17 (24) = happyShift action_12
action_17 (4) = happyGoto action_32
action_17 (5) = happyGoto action_4
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (6) = happyShift action_5
action_18 (7) = happyShift action_6
action_18 (8) = happyShift action_2
action_18 (9) = happyShift action_7
action_18 (10) = happyShift action_8
action_18 (17) = happyShift action_9
action_18 (18) = happyShift action_10
action_18 (22) = happyShift action_11
action_18 (24) = happyShift action_12
action_18 (4) = happyGoto action_31
action_18 (5) = happyGoto action_4
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (6) = happyShift action_5
action_19 (7) = happyShift action_6
action_19 (8) = happyShift action_2
action_19 (9) = happyShift action_7
action_19 (10) = happyShift action_8
action_19 (17) = happyShift action_9
action_19 (18) = happyShift action_10
action_19 (22) = happyShift action_11
action_19 (24) = happyShift action_12
action_19 (4) = happyGoto action_30
action_19 (5) = happyGoto action_4
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (6) = happyShift action_5
action_20 (7) = happyShift action_6
action_20 (8) = happyShift action_2
action_20 (9) = happyShift action_7
action_20 (10) = happyShift action_8
action_20 (17) = happyShift action_9
action_20 (18) = happyShift action_10
action_20 (22) = happyShift action_11
action_20 (24) = happyShift action_12
action_20 (4) = happyGoto action_29
action_20 (5) = happyGoto action_4
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (6) = happyShift action_5
action_21 (7) = happyShift action_6
action_21 (8) = happyShift action_2
action_21 (9) = happyShift action_7
action_21 (10) = happyShift action_8
action_21 (17) = happyShift action_9
action_21 (18) = happyShift action_10
action_21 (22) = happyShift action_11
action_21 (24) = happyShift action_12
action_21 (4) = happyGoto action_28
action_21 (5) = happyGoto action_4
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (6) = happyShift action_5
action_22 (7) = happyShift action_6
action_22 (8) = happyShift action_2
action_22 (9) = happyShift action_7
action_22 (10) = happyShift action_8
action_22 (17) = happyShift action_9
action_22 (18) = happyShift action_10
action_22 (22) = happyShift action_11
action_22 (24) = happyShift action_12
action_22 (4) = happyGoto action_27
action_22 (5) = happyGoto action_4
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (6) = happyShift action_5
action_23 (7) = happyShift action_6
action_23 (8) = happyShift action_2
action_23 (9) = happyShift action_7
action_23 (10) = happyShift action_8
action_23 (17) = happyShift action_9
action_23 (18) = happyShift action_10
action_23 (22) = happyShift action_11
action_23 (24) = happyShift action_12
action_23 (4) = happyGoto action_26
action_23 (5) = happyGoto action_4
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (6) = happyShift action_5
action_24 (7) = happyShift action_6
action_24 (8) = happyShift action_2
action_24 (9) = happyShift action_7
action_24 (10) = happyShift action_8
action_24 (17) = happyShift action_9
action_24 (18) = happyShift action_10
action_24 (22) = happyShift action_11
action_24 (24) = happyShift action_12
action_24 (4) = happyGoto action_25
action_24 (5) = happyGoto action_4
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (12) = happyShift action_18
action_25 (13) = happyShift action_19
action_25 (14) = happyShift action_20
action_25 (15) = happyShift action_21
action_25 (16) = happyShift action_22
action_25 (26) = happyShift action_23
action_25 _ = happyReduce_16

action_26 (12) = happyShift action_18
action_26 _ = happyReduce_14

action_27 (12) = happyShift action_18
action_27 (26) = happyShift action_23
action_27 _ = happyReduce_11

action_28 (12) = happyShift action_18
action_28 (16) = happyShift action_22
action_28 (26) = happyShift action_23
action_28 _ = happyReduce_10

action_29 (12) = happyShift action_18
action_29 (15) = happyShift action_21
action_29 (16) = happyShift action_22
action_29 (26) = happyShift action_23
action_29 _ = happyReduce_9

action_30 (12) = happyShift action_18
action_30 (14) = happyShift action_20
action_30 (15) = happyShift action_21
action_30 (16) = happyShift action_22
action_30 (26) = happyShift action_23
action_30 _ = happyReduce_8

action_31 (12) = happyShift action_18
action_31 _ = happyReduce_6

action_32 (12) = happyShift action_18
action_32 (13) = happyShift action_19
action_32 (14) = happyShift action_20
action_32 (15) = happyShift action_21
action_32 (16) = happyShift action_22
action_32 (26) = happyShift action_23
action_32 (27) = happyShift action_24
action_32 _ = happyReduce_5

action_33 (6) = happyShift action_5
action_33 (7) = happyShift action_6
action_33 (8) = happyShift action_2
action_33 (9) = happyShift action_7
action_33 (10) = happyShift action_8
action_33 (17) = happyShift action_9
action_33 (18) = happyShift action_10
action_33 (22) = happyShift action_11
action_33 (24) = happyShift action_12
action_33 (4) = happyGoto action_38
action_33 (5) = happyGoto action_4
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (6) = happyShift action_5
action_34 (7) = happyShift action_6
action_34 (8) = happyShift action_2
action_34 (9) = happyShift action_7
action_34 (10) = happyShift action_8
action_34 (17) = happyShift action_9
action_34 (18) = happyShift action_10
action_34 (22) = happyShift action_11
action_34 (24) = happyShift action_12
action_34 (4) = happyGoto action_37
action_34 (5) = happyGoto action_4
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_13

action_36 _ = happyReduce_15

action_37 (11) = happyShift action_17
action_37 (12) = happyShift action_18
action_37 (13) = happyShift action_19
action_37 (14) = happyShift action_20
action_37 (15) = happyShift action_21
action_37 (16) = happyShift action_22
action_37 (20) = happyShift action_39
action_37 (26) = happyShift action_23
action_37 (27) = happyShift action_24
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (12) = happyShift action_18
action_38 _ = happyReduce_7

action_39 (6) = happyShift action_5
action_39 (7) = happyShift action_6
action_39 (8) = happyShift action_2
action_39 (9) = happyShift action_7
action_39 (10) = happyShift action_8
action_39 (17) = happyShift action_9
action_39 (18) = happyShift action_10
action_39 (22) = happyShift action_11
action_39 (24) = happyShift action_12
action_39 (4) = happyGoto action_40
action_39 (5) = happyGoto action_4
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (11) = happyShift action_17
action_40 (12) = happyShift action_18
action_40 (13) = happyShift action_19
action_40 (14) = happyShift action_20
action_40 (15) = happyShift action_21
action_40 (16) = happyShift action_22
action_40 (26) = happyShift action_23
action_40 (27) = happyShift action_24
action_40 _ = happyReduce_12

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

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (TmList happy_var_2
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TmBreak happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  5 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn5
		 (TyBool
	)

happyReduce_18 = happySpecReduce_1  5 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn5
		 (TyInt
	)

happyNewToken action sts stk [] =
	action 28 28 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenTypeBool _ -> cont 6;
	TokenTypeInt _ -> cont 7;
	TokenInt _ happy_dollar_dollar -> cont 8;
	TokenTrue _ -> cont 9;
	TokenFalse _ -> cont 10;
	TokenLessThan _ -> cont 11;
	TokenEqualTo _ -> cont 12;
	TokenPlus _ -> cont 13;
	TokenMulti _ -> cont 14;
	TokenMinus _ -> cont 15;
	TokenDivide _ -> cont 16;
	TokenVar _ happy_dollar_dollar -> cont 17;
	TokenIf _ -> cont 18;
	TokenThen _ -> cont 19;
	TokenElse _ -> cont 20;
	TokenAssign _ -> cont 21;
	TokenLParen _ -> cont 22;
	TokenRParen _ -> cont 23;
	TokenLList _ -> cont 24;
	TokenRList _ -> cont 25;
	TokenComma _ -> cont 26;
	TokenBreak _ -> cont 27;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 28 tk tks = happyError' (tks, explist)
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

data Type = TyInt | TyBool | TyString
   deriving (Show,Eq)

type Environment = [ (String,Expr) ]

data Expr = TmInt Int | TmTrue | TmFalse | TmLessThan Expr Expr 
            | TmAdd Expr Expr | TmVar String | TmMulti Expr Expr | TmSubtract Expr Expr | TmDivide Expr Expr
            | TmIf Expr Expr Expr  
            | TmComma Expr Expr | TmList Expr
			| TmAssign Type String Expr
			| TmEqualTo Expr Expr
			| TmBreak Expr Expr
    deriving (Show,Eq)
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
