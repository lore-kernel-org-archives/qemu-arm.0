Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1876918ejb;
        Mon, 7 Aug 2023 20:13:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQauj/1SKxlR1JEZ04Nrissz+YqZSy4LkyKBSgrM2HpteDcgTJrFSGjBTAXQeMCl3gO8wk
X-Received: by 2002:a05:622a:48b:b0:406:94af:c912 with SMTP id p11-20020a05622a048b00b0040694afc912mr10215118qtx.54.1691464388905;
        Mon, 07 Aug 2023 20:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691464388; cv=none;
        d=google.com; s=arc-20160816;
        b=cHG38t1Cev5XrGIjEvTOsFBjmFF5g9Zvv7w1cNf/rSiHOtbTdnam2sdCoIIu05opel
         qI4LwhYXCNRbc1g9zz/W22PrDJfJ0TtAY4yapTgvQIATEju3x2XWDX2gGXrAK376h7po
         Aqxp8WAlWbkQ8qVfkFUHJzOqVY2B8g/Lzz7mHqHzGhRNvLRyPRwLkZUbPGxl5v7HFjN1
         ke8hzgp2MugkwBlW9XHUshLh8jbI/Z5MSfsLCE+wrX0bJE6Pae6tMFFo6ETkFWOnQa1Q
         niSWS4ZAMbFbHUe43DwDtTKAxweQcbuyLTxbq4yHn7rdKc8fUGevjRn4mTwdoukl9zw5
         k0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Y3IZmf0/JLBly+6xTxYogTNg3uwMcup6esfMrWAxxv4=;
        fh=hqs26moy805PsHbwd88lUczy2QdlfF59ojSMxj/DeWg=;
        b=GwXUlIcOVXyweN86CU8lGwJQpkBy4SoZOv/dumOI/3jQz0shF7N6zkxtMOsYZPqYVP
         SbOptonuqwlLZ/74k6K7/4fy34zwzBQ7F3wNw+7jM/sOwoiH9UI44wbI2ObONmQBhWqg
         G+Tse7AxPpO2VAzuU3K1KP7m80FPmtjFxSd/kPRHrbBFfM7ITlikh/fodoE2++ZesgMQ
         Kar51Bxs/0PQKbGai7FFTASFMyKUyc2gxqgxmJkr1A2vdeisTxWXL5c7NuRxzh8rVUfm
         6jVGqvEKnvL09k07uPertfve23uyN8R8ZIG30eku/6Lshlh/3dPRBLeJlmq6m3e61Ce0
         QNcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ENrJwAtd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020a05622a044f00b004030d8b3d81si5416773qtx.483.2023.08.07.20.13.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 20:13:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ENrJwAtd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTD99-0002HY-1V; Mon, 07 Aug 2023 23:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8o-0001Z9-5k
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:12:15 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8Z-0000HP-Oy
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:12:13 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6b9c9944da8so4667652a34.3
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 20:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464318; x=1692069118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y3IZmf0/JLBly+6xTxYogTNg3uwMcup6esfMrWAxxv4=;
 b=ENrJwAtdVWSVn1Y24A09cYH26DzdnrIytsIsvkXp3LElgGFVG81rgJq/Js+SqFQ+Ib
 ulr85hqr2ky85EoxMH2QAyxsWL+qJGUACgHHyqpsF+tavD5JZenJPXDT1n8pUGpZJ95w
 AxZfovVLcnnL6a3DGD9UH4usqzzSsoUCdHblUQBnj0UhNh61H8/TyvK22EMdM3n8npDR
 ksH64CwDdKrZBDzp6tLX4RQa1gpRZDMMLP/afAfzmLECNV8vJRqZ2tJ/lvx3c73ZYevo
 +Uz4BS/xTno08xjbEpTogsvUVL/l8GD1i+kywf0OwLPm2OOgRYxyN+K2iRl/v7QVCvTB
 QKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464318; x=1692069118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y3IZmf0/JLBly+6xTxYogTNg3uwMcup6esfMrWAxxv4=;
 b=QrKOtAeTrglxO4DXePzVo9tvWdeCftWby0v2HP1y3SB0ZgvLAKApbpaYt3CblahnxW
 iVlWMKe2w8vZcv8VT0S6KeRFewwK49EL2KeqrDYoTO8arL5NVltUTDn5DB1dqWFeqjLC
 qUzYelsoYqX2g7Mk+3f4wVJ8RUuD1hrN5lXzQF1AW0jaL97PtTNK98uCQpY/dY8mSj3c
 k5UoBI4f0vaRP18cP7w2/+iqMMXy6oU/zRLkDELIs+uFr3x0PbdAL/4VCEp3JI5Pgeol
 xrtKaaBspi6u7JzadduwVWuJhthlUFg9zO7vjUxJhcqik4EfDeIAsZ+CPsq9bG2szgz/
 ms8g==
X-Gm-Message-State: AOJu0Yxt78FbUL2YdZvxHqVa9RpoCO9bDxPGGbbVHOu1Iej4d+vVMyQa
 eJY8wIN/Z2PrkjLhPw40WYMtTbfRf4mPBIfeVnM=
X-Received: by 2002:a05:6358:919e:b0:133:b33:3b9a with SMTP id
 j30-20020a056358919e00b001330b333b9amr8840748rwa.3.1691464318174; 
 Mon, 07 Aug 2023 20:11:58 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 15/24] tcg/s390x: Implement negsetcond_*
Date: Mon,  7 Aug 2023 20:11:34 -0700
Message-Id: <20230808031143.50925-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qAZsqfgI3pRQ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  4 +-
 tcg/s390x/tcg-target.c.inc | 78 +++++++++++++++++++++++++-------------
 2 files changed, 54 insertions(+), 28 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 24e207c2d4..cd3d245be0 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -104,7 +104,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_mulsh_i32      0
 #define TCG_TARGET_HAS_extrl_i64_i32  0
 #define TCG_TARGET_HAS_extrh_i64_i32  0
-#define TCG_TARGET_HAS_negsetcond_i32 0
+#define TCG_TARGET_HAS_negsetcond_i32 1
 #define TCG_TARGET_HAS_qemu_st8_i32   0
 
 #define TCG_TARGET_HAS_div2_i64       1
@@ -139,7 +139,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_muls2_i64      HAVE_FACILITY(MISC_INSN_EXT2)
 #define TCG_TARGET_HAS_muluh_i64      0
 #define TCG_TARGET_HAS_mulsh_i64      0
-#define TCG_TARGET_HAS_negsetcond_i64 0
+#define TCG_TARGET_HAS_negsetcond_i64 1
 
 #define TCG_TARGET_HAS_qemu_ldst_i128 1
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index a94f7908d6..ecd8aaf2a1 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1266,7 +1266,8 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
 }
 
 static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
-                         TCGReg dest, TCGReg c1, TCGArg c2, int c2const)
+                         TCGReg dest, TCGReg c1, TCGArg c2,
+                         bool c2const, bool neg)
 {
     int cc;
 
@@ -1275,11 +1276,27 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
         /* Emit: d = 0, d = (cc ? 1 : d).  */
         cc = tgen_cmp(s, type, cond, c1, c2, c2const, false);
         tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
-        tcg_out_insn(s, RIEg, LOCGHI, dest, 1, cc);
+        tcg_out_insn(s, RIEg, LOCGHI, dest, neg ? -1 : 1, cc);
         return;
     }
 
- restart:
+    switch (cond) {
+    case TCG_COND_GEU:
+    case TCG_COND_LTU:
+    case TCG_COND_LT:
+    case TCG_COND_GE:
+        /* Swap operands so that we can use LEU/GTU/GT/LE.  */
+        if (!c2const) {
+            TCGReg t = c1;
+            c1 = c2;
+            c2 = t;
+            cond = tcg_swap_cond(cond);
+        }
+        break;
+    default:
+        break;
+    }
+
     switch (cond) {
     case TCG_COND_NE:
         /* X != 0 is X > 0.  */
@@ -1292,11 +1309,20 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
 
     case TCG_COND_GTU:
     case TCG_COND_GT:
-        /* The result of a compare has CC=2 for GT and CC=3 unused.
-           ADD LOGICAL WITH CARRY considers (CC & 2) the carry bit.  */
+        /*
+         * The result of a compare has CC=2 for GT and CC=3 unused.
+         * ADD LOGICAL WITH CARRY considers (CC & 2) the carry bit.
+         */
         tgen_cmp(s, type, cond, c1, c2, c2const, true);
         tcg_out_movi(s, type, dest, 0);
         tcg_out_insn(s, RRE, ALCGR, dest, dest);
+        if (neg) {
+            if (type == TCG_TYPE_I32) {
+                tcg_out_insn(s, RR, LCR, dest, dest);
+            } else {
+                tcg_out_insn(s, RRE, LCGR, dest, dest);
+            }
+        }
         return;
 
     case TCG_COND_EQ:
@@ -1310,27 +1336,17 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
 
     case TCG_COND_LEU:
     case TCG_COND_LE:
-        /* As above, but we're looking for borrow, or !carry.
-           The second insn computes d - d - borrow, or -1 for true
-           and 0 for false.  So we must mask to 1 bit afterward.  */
+        /*
+         * As above, but we're looking for borrow, or !carry.
+         * The second insn computes d - d - borrow, or -1 for true
+         * and 0 for false.  So we must mask to 1 bit afterward.
+         */
         tgen_cmp(s, type, cond, c1, c2, c2const, true);
         tcg_out_insn(s, RRE, SLBGR, dest, dest);
-        tgen_andi(s, type, dest, 1);
-        return;
-
-    case TCG_COND_GEU:
-    case TCG_COND_LTU:
-    case TCG_COND_LT:
-    case TCG_COND_GE:
-        /* Swap operands so that we can use LEU/GTU/GT/LE.  */
-        if (!c2const) {
-            TCGReg t = c1;
-            c1 = c2;
-            c2 = t;
-            cond = tcg_swap_cond(cond);
-            goto restart;
+        if (!neg) {
+            tgen_andi(s, type, dest, 1);
         }
-        break;
+        return;
 
     default:
         g_assert_not_reached();
@@ -1339,7 +1355,7 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
     cc = tgen_cmp(s, type, cond, c1, c2, c2const, false);
     /* Emit: d = 0, t = 1, d = (cc ? t : d).  */
     tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
-    tcg_out_movi(s, TCG_TYPE_I64, TCG_TMP0, 1);
+    tcg_out_movi(s, TCG_TYPE_I64, TCG_TMP0, neg ? -1 : 1);
     tcg_out_insn(s, RRFc, LOCGR, dest, TCG_TMP0, cc);
 }
 
@@ -2288,7 +2304,11 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_setcond_i32:
         tgen_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1],
-                     args[2], const_args[2]);
+                     args[2], const_args[2], false);
+        break;
+    case INDEX_op_negsetcond_i32:
+        tgen_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1],
+                     args[2], const_args[2], true);
         break;
     case INDEX_op_movcond_i32:
         tgen_movcond(s, TCG_TYPE_I32, args[5], args[0], args[1],
@@ -2566,7 +2586,11 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_setcond_i64:
         tgen_setcond(s, TCG_TYPE_I64, args[3], args[0], args[1],
-                     args[2], const_args[2]);
+                     args[2], const_args[2], false);
+        break;
+    case INDEX_op_negsetcond_i64:
+        tgen_setcond(s, TCG_TYPE_I64, args[3], args[0], args[1],
+                     args[2], const_args[2], true);
         break;
     case INDEX_op_movcond_i64:
         tgen_movcond(s, TCG_TYPE_I64, args[5], args[0], args[1],
@@ -3109,8 +3133,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rotr_i32:
     case INDEX_op_rotr_i64:
     case INDEX_op_setcond_i32:
+    case INDEX_op_negsetcond_i32:
         return C_O1_I2(r, r, ri);
     case INDEX_op_setcond_i64:
+    case INDEX_op_negsetcond_i64:
         return C_O1_I2(r, r, rA);
 
     case INDEX_op_clz_i64:
-- 
2.34.1

