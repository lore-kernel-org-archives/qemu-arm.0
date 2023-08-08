Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1877334ejb;
        Mon, 7 Aug 2023 20:14:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYvdhqDbfBnFOo5MDiYBOsT3GWiyAmd8D7y0hMAQBBOhG97eriJuRabd0YpwYA16U+RjwB
X-Received: by 2002:a0c:ead1:0:b0:5ef:46a9:15d2 with SMTP id y17-20020a0cead1000000b005ef46a915d2mr10388666qvp.7.1691464451847;
        Mon, 07 Aug 2023 20:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691464451; cv=none;
        d=google.com; s=arc-20160816;
        b=ULjIjPJUFulEFXycbmW1kubR0DC6xqTyy9yOq6W7WplAMfTcPMe/+YNQP0IY/bZhr9
         YkTgf/IULK5NreqEYC3jbl9x5yY4n7s1BBbFj9R2aDap5wMHf6hDD/wso/OmO8JFsuRg
         wO9J0ayg0H1JT/iNaA8/BUi9sn+QgY+tPKTRuH7ohyY3ByULE4Xpi3tnpIKA2BjbvYy1
         yg2UKfltcOEobzC/WHiXbA7yXWCAtNOW8DctsUm54MnOZbbHmw0f+BSk1kB6Q4bHy4z6
         kw5+5PQyWIIfGcIsk2L9PNOPHFSb6ynsmZszoahELpuKTFKc34LeCqzXn4MJONPoryTA
         2Byg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LA0FQj2p5NOMPjxNHlx5J0GOa6DvzlceCBNs3CReXBc=;
        fh=hqs26moy805PsHbwd88lUczy2QdlfF59ojSMxj/DeWg=;
        b=gBHUNM3K/yxj2nsCbD/VXiACSjCFVV99pDjdyprlxzhpPJRY89SLc0l9gFXfBLg0z5
         lPqXiqiM2dDKDyL/eAbQUgIhm5Z4B2hWE5B9O7nuMoxQCI6edwQnk9JyLC7eQQVWxAJv
         uGTrqIxRCo9PRf+2guMPwiuUwQtoITEL4P6n0KWfog/7qL+PljQj10hUzvrHIgOCtjTR
         CwP5K7axUG05eN2B6igteNLjbEglphKf3B4+hbKlWRU13hoK/kdRnGh3SXHBJ4/IEIGA
         Bnkzu2sQbCTuBhgFLrTaueIOllUT//nmJxhy9QRrdem8O7OrbE9Mjo6rP05AqT6PjCl7
         6u4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kU83p5nP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020a0c9c0b000000b00635dd2f5284si5618660qve.376.2023.08.07.20.14.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 20:14:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kU83p5nP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTD9K-00039Q-LS; Mon, 07 Aug 2023 23:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8q-0001Zk-4l
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:12:17 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8a-0000I2-Mm
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:12:15 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6bd0425ad4fso256887a34.2
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 20:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464319; x=1692069119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LA0FQj2p5NOMPjxNHlx5J0GOa6DvzlceCBNs3CReXBc=;
 b=kU83p5nPzMvIgAEvaluvjKSB1imcE389RR1ZfD+7jq5JwWBUmDk9kaLFkIoa3dBd/G
 TCVnHLBiK+HAE63pvrmR3yXzIAFpXMB1p6bMFDKPYrDfho0LIxSVFdpSO+1snWYWY3g5
 xGKJ1wL3LVzMqAkbPAVhurH2LZ511gkROm8chGGPVTo5zLqeAaHWFBEJkhhCW2AEcXKa
 rJbDNSIr+ZknwrZVy2tU+uMvHEnEwDdWSyxMkP528q2Kl2xtl2zsF5+91o/aQZm298AJ
 jqw8bTcQr4WSjWzyS5GphVoq09FAJH6La2AWrRvg5wwPhu38Tjnxyd7+A1CHCoVPxSgF
 +fhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464319; x=1692069119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LA0FQj2p5NOMPjxNHlx5J0GOa6DvzlceCBNs3CReXBc=;
 b=eWKstnAc4cZEMojewgFPTYVfcakbaoIdK58XhOIJxHPUo8gmOYAbcMWm1LueCPpHYv
 gVPtODT60MniwElFKTwiCdNf+Se1fb8QzzBeEPnfSwdQuY9Pdqs1D+SpyA7IU1fMcbDT
 +0tddbhQNcwEpRJMztMSO0z8xGUGCDBV7H42x9xBvyM4gRJKkxARtBXLNEwGT+FdxwCN
 OCWN+w3a9I4GP9U/jaabDg5LkV1Eu7PlJcjQEvAm5qFYTQf6Stq8nedcmOGm4S0oVihd
 sASpC7lTQccZ6zW2OUw422Zwyl4BTCQVYi+ilSeYo6yUCIiNw7HhDPMTs7MqYMxgCrRq
 2aXA==
X-Gm-Message-State: AOJu0YwBz+suQYG+AKc1gDyzELvWcGg8MS2jP+YKnnF7a6CXp6L7CxtJ
 gbmewQ4Qfeg2lTBGyXVdvYiDFA==
X-Received: by 2002:a05:6358:70d:b0:134:e8c6:a888 with SMTP id
 e13-20020a056358070d00b00134e8c6a888mr10032318rwj.8.1691464319089; 
 Mon, 07 Aug 2023 20:11:59 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:11:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 16/24] tcg/sparc64: Implement negsetcond_*
Date: Mon,  7 Aug 2023 20:11:35 -0700
Message-Id: <20230808031143.50925-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
X-TUID: MqRLoPibw3wx

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.h     |  4 ++--
 tcg/sparc64/tcg-target.c.inc | 36 ++++++++++++++++++++++++++----------
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/tcg/sparc64/tcg-target.h b/tcg/sparc64/tcg-target.h
index 1faadc704b..4bbd825bd8 100644
--- a/tcg/sparc64/tcg-target.h
+++ b/tcg/sparc64/tcg-target.h
@@ -112,7 +112,7 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
-#define TCG_TARGET_HAS_negsetcond_i32   0
+#define TCG_TARGET_HAS_negsetcond_i32   1
 #define TCG_TARGET_HAS_qemu_st8_i32     0
 
 #define TCG_TARGET_HAS_extrl_i64_i32    1
@@ -150,7 +150,7 @@ extern bool use_vis3_instructions;
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_muluh_i64        use_vis3_instructions
 #define TCG_TARGET_HAS_mulsh_i64        0
-#define TCG_TARGET_HAS_negsetcond_i64   0
+#define TCG_TARGET_HAS_negsetcond_i64   1
 
 #define TCG_TARGET_HAS_qemu_ldst_i128   0
 
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index ffcb879211..37839f9a21 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -720,7 +720,7 @@ static void tcg_out_movcond_i64(TCGContext *s, TCGCond cond, TCGReg ret,
 }
 
 static void tcg_out_setcond_i32(TCGContext *s, TCGCond cond, TCGReg ret,
-                                TCGReg c1, int32_t c2, int c2const)
+                                TCGReg c1, int32_t c2, int c2const, bool neg)
 {
     /* For 32-bit comparisons, we can play games with ADDC/SUBC.  */
     switch (cond) {
@@ -760,22 +760,30 @@ static void tcg_out_setcond_i32(TCGContext *s, TCGCond cond, TCGReg ret,
     default:
         tcg_out_cmp(s, c1, c2, c2const);
         tcg_out_movi_s13(s, ret, 0);
-        tcg_out_movcc(s, cond, MOVCC_ICC, ret, 1, 1);
+        tcg_out_movcc(s, cond, MOVCC_ICC, ret, neg ? -1 : 1, 1);
         return;
     }
 
     tcg_out_cmp(s, c1, c2, c2const);
     if (cond == TCG_COND_LTU) {
-        tcg_out_arithi(s, ret, TCG_REG_G0, 0, ARITH_ADDC);
+        if (neg) {
+            tcg_out_arithi(s, ret, TCG_REG_G0, 0, ARITH_SUBC);
+        } else {
+            tcg_out_arithi(s, ret, TCG_REG_G0, 0, ARITH_ADDC);
+        }
     } else {
-        tcg_out_arithi(s, ret, TCG_REG_G0, -1, ARITH_SUBC);
+        if (neg) {
+            tcg_out_arithi(s, ret, TCG_REG_G0, -1, ARITH_ADDC);
+        } else {
+            tcg_out_arithi(s, ret, TCG_REG_G0, -1, ARITH_SUBC);
+        }
     }
 }
 
 static void tcg_out_setcond_i64(TCGContext *s, TCGCond cond, TCGReg ret,
-                                TCGReg c1, int32_t c2, int c2const)
+                                TCGReg c1, int32_t c2, int c2const, bool neg)
 {
-    if (use_vis3_instructions) {
+    if (use_vis3_instructions && !neg) {
         switch (cond) {
         case TCG_COND_NE:
             if (c2 != 0) {
@@ -796,11 +804,11 @@ static void tcg_out_setcond_i64(TCGContext *s, TCGCond cond, TCGReg ret,
        if the input does not overlap the output.  */
     if (c2 == 0 && !is_unsigned_cond(cond) && c1 != ret) {
         tcg_out_movi_s13(s, ret, 0);
-        tcg_out_movr(s, cond, ret, c1, 1, 1);
+        tcg_out_movr(s, cond, ret, c1, neg ? -1 : 1, 1);
     } else {
         tcg_out_cmp(s, c1, c2, c2const);
         tcg_out_movi_s13(s, ret, 0);
-        tcg_out_movcc(s, cond, MOVCC_XCC, ret, 1, 1);
+        tcg_out_movcc(s, cond, MOVCC_XCC, ret, neg ? -1 : 1, 1);
     }
 }
 
@@ -1355,7 +1363,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond_i32(s, a2, a0, a1, const_args[1], arg_label(args[3]));
         break;
     case INDEX_op_setcond_i32:
-        tcg_out_setcond_i32(s, args[3], a0, a1, a2, c2);
+        tcg_out_setcond_i32(s, args[3], a0, a1, a2, c2, false);
+        break;
+    case INDEX_op_negsetcond_i32:
+        tcg_out_setcond_i32(s, args[3], a0, a1, a2, c2, true);
         break;
     case INDEX_op_movcond_i32:
         tcg_out_movcond_i32(s, args[5], a0, a1, a2, c2, args[3], const_args[3]);
@@ -1437,7 +1448,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_brcond_i64(s, a2, a0, a1, const_args[1], arg_label(args[3]));
         break;
     case INDEX_op_setcond_i64:
-        tcg_out_setcond_i64(s, args[3], a0, a1, a2, c2);
+        tcg_out_setcond_i64(s, args[3], a0, a1, a2, c2, false);
+        break;
+    case INDEX_op_negsetcond_i64:
+        tcg_out_setcond_i64(s, args[3], a0, a1, a2, c2, true);
         break;
     case INDEX_op_movcond_i64:
         tcg_out_movcond_i64(s, args[5], a0, a1, a2, c2, args[3], const_args[3]);
@@ -1564,6 +1578,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sar_i64:
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
+    case INDEX_op_negsetcond_i32:
+    case INDEX_op_negsetcond_i64:
         return C_O1_I2(r, rZ, rJ);
 
     case INDEX_op_brcond_i32:
-- 
2.34.1

