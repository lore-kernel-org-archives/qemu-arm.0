Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4299156ejc;
        Sun, 26 Feb 2023 21:46:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8z5ow7ry8xY/Lq2JWQB4HRfZDClevR86T2/1iuWDSL3nAeTwqBDVqOO09TDWUa8LQceCvC
X-Received: by 2002:a05:622a:1703:b0:3b6:9c63:5ca1 with SMTP id h3-20020a05622a170300b003b69c635ca1mr30067413qtk.43.1677476814033;
        Sun, 26 Feb 2023 21:46:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476814; cv=none;
        d=google.com; s=arc-20160816;
        b=Jp6IyU77TUst7+yZzTzUNov+olvQIUU2lxVrB448+Jiazxpupl6SqzOh9AqQAonGf+
         0cwXR+re9tgyTCzgAQ1pSFIu1bTxOY2tRP2zVKD2Ynf4e66ISGrNvJClsGyt/bWFATeW
         qz2etmA5mXwKqJPr4SQQIzGXyJuS/dH6KNXLquRGelyDLNXnkjdT8YmjqSR3QwD3K1Px
         mF2LxFmFCKAvB9VOv1KHwm7Y96yEtXlXhIPImz9wDBuvtOXTWCCT8GocbKuQAkG4cxDH
         HplUzCi6aLKk2nf4wc1nz4bCOGdAv6wq20gGeaPan/SL9pH/TYJPbk3PT5MBFbFRIeKY
         PYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q/8HAAeS3hT4Bnex7q2APNTWH9x2zw557quwYCEIRaQ=;
        b=JUnwuEGXHWJmrA6UePLBgtbl0yXa7TOvEDu7epA6zK5asAw1sbwQsynRAqv/sqX0QW
         T51Uz2tRTFt939zlT6cph2UAdNizMERHjdirlkSq50dCE0lzF2BWRNj6dTCOg6XOmMIy
         47ICG5GeU/bu+XBlgh/ccJXlZO/FSUMof2Xp3aJsGCvXDWjK1brEK2Q0boPHwmFYDZMT
         Noi+Gkih+6KPP2jYYqNY4TSZLhSsmgIbSoR+GFWosYQdsSpPyBXlDYWQbY30AGZBwb+O
         p1rHvrS2S/eEqmZJpK5hshD1BnCyl1mRv6dB9CvJ+GNuptWZqc0IWmI8HyQpWPGXxyCa
         Ho1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u0+BkiBZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020ac85e0d000000b003bbd8bdb93asi6171608qtx.798.2023.02.26.21.46.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:46:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u0+BkiBZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWHk-0001cJ-PF; Mon, 27 Feb 2023 00:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHj-0001XM-5b
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:42:51 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWHg-0004k4-AK
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:42:50 -0500
Received: by mail-pg1-x531.google.com with SMTP id q189so2838797pga.9
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q/8HAAeS3hT4Bnex7q2APNTWH9x2zw557quwYCEIRaQ=;
 b=u0+BkiBZnKnGpUKZF44x1IuFytXnJ2DS20SB/3twp2hCMgwTQZDXltpCSdmHvd2Kmq
 5u87pXXVvDU7RKFCGW2amrGmPB9Le+yT4mXoUk0a5rksZfSlTU50OMOGvkh+c+kyVtgj
 5G/PTATXtWEZhRmxU3RrdOVMWfBRcxg7/+UGo6vSNqo6PudCmvlgz7Yt8gMxpCYAyWN4
 UPvJNO6oSxEu6XNI6A/5ZTJAKu0xm/5QxAwBg4oXQCbgOf/fPvqL0M0C3cyDXNoGp5X6
 4mecqsfzDG1ApX5fuuZfad+RdNMP++jCXx872rPiG3scYHcWD+NRZr1vR8Fb6t8REvt8
 foUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q/8HAAeS3hT4Bnex7q2APNTWH9x2zw557quwYCEIRaQ=;
 b=KEoAGKWLTtLOX/rDRtJAVnv2+06SdJIDMcN4NnD4J8J3aGvtqlYnDSkaGs9BWqh86F
 zC8GujCwCGbVoWa2tpJxA5qTkqINqcTjpcn0hHsmQ0ZwRBwvpE+XCjJPpnDtqbA2+fVS
 2sCKz1mT7VLc7Qx6kIH9KmFY1ZxkKg5yqn90CckwkNKmQAytJpiHYQBkZxAHo79ULg37
 0T9dpxvE6pCsIJngABFav6gH3XAyeKXxF3bw8YC8GW0bohPo17iWkzPReRhSas3JO1Km
 988qXeEQxEGF1CSmls2g8I3NG2Tmu6Vi6ICEy3ooJKGbOz7Bu3P+aI5N/L97aIGxZboF
 6+zQ==
X-Gm-Message-State: AO0yUKUn1u2fFC63ZZqnKxsMnWjDvQGnJmSLGEK5Sp5BM4WKPXlFIS+N
 ND9aJhPoZCQMO52DQHpQn9nBCA==
X-Received: by 2002:a62:1bd2:0:b0:5ab:bf5d:a0d1 with SMTP id
 b201-20020a621bd2000000b005abbf5da0d1mr22325289pfb.7.1677476566772; 
 Sun, 26 Feb 2023 21:42:46 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:42:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 01/70] target/arm: Use rmode >= 0 for need_rmode
Date: Sun, 26 Feb 2023 19:41:24 -1000
Message-Id: <20230227054233.390271-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ytvr8eB2/5NX

Initialize rmode to -1 instead of keeping two variables.
This is already used elsewhere in translate-a64.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 34 ++++++----------------------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b1fa210d64..1c575de3e0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12133,7 +12133,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
     bool need_fpstatus = false;
-    bool need_rmode = false;
     int rmode = -1;
     TCGv_i32 tcg_rmode;
     TCGv_ptr tcg_fpstatus;
@@ -12283,7 +12282,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x7a: /* FCVTPU */
         case 0x7b: /* FCVTZU */
             need_fpstatus = true;
-            need_rmode = true;
             rmode = extract32(opcode, 5, 1) | (extract32(opcode, 0, 1) << 1);
             if (size == 3 && !is_q) {
                 unallocated_encoding(s);
@@ -12293,7 +12291,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x5c: /* FCVTAU */
         case 0x1c: /* FCVTAS */
             need_fpstatus = true;
-            need_rmode = true;
             rmode = FPROUNDING_TIEAWAY;
             if (size == 3 && !is_q) {
                 unallocated_encoding(s);
@@ -12352,7 +12349,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x19: /* FRINTM */
         case 0x38: /* FRINTP */
         case 0x39: /* FRINTZ */
-            need_rmode = true;
             rmode = extract32(opcode, 5, 1) | (extract32(opcode, 0, 1) << 1);
             /* fall through */
         case 0x59: /* FRINTX */
@@ -12364,7 +12360,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             }
             break;
         case 0x58: /* FRINTA */
-            need_rmode = true;
             rmode = FPROUNDING_TIEAWAY;
             need_fpstatus = true;
             if (size == 3 && !is_q) {
@@ -12380,7 +12375,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             break;
         case 0x1e: /* FRINT32Z */
         case 0x1f: /* FRINT64Z */
-            need_rmode = true;
             rmode = FPROUNDING_ZERO;
             /* fall through */
         case 0x5e: /* FRINT32X */
@@ -12406,12 +12400,12 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         return;
     }
 
-    if (need_fpstatus || need_rmode) {
+    if (need_fpstatus || rmode >= 0) {
         tcg_fpstatus = fpstatus_ptr(FPST_FPCR);
     } else {
         tcg_fpstatus = NULL;
     }
-    if (need_rmode) {
+    if (rmode >= 0) {
         tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
     } else {
@@ -12595,7 +12589,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     }
     clear_vec_high(s, is_q, rd);
 
-    if (need_rmode) {
+    if (tcg_rmode) {
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
     }
 }
@@ -12625,9 +12619,8 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     int pass;
     TCGv_i32 tcg_rmode = NULL;
     TCGv_ptr tcg_fpstatus = NULL;
-    bool need_rmode = false;
     bool need_fpst = true;
-    int rmode;
+    int rmode = -1;
 
     if (!dc_isar_feature(aa64_fp16, s)) {
         unallocated_encoding(s);
@@ -12676,27 +12669,22 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x3f: /* FRECPX */
         break;
     case 0x18: /* FRINTN */
-        need_rmode = true;
         only_in_vector = true;
         rmode = FPROUNDING_TIEEVEN;
         break;
     case 0x19: /* FRINTM */
-        need_rmode = true;
         only_in_vector = true;
         rmode = FPROUNDING_NEGINF;
         break;
     case 0x38: /* FRINTP */
-        need_rmode = true;
         only_in_vector = true;
         rmode = FPROUNDING_POSINF;
         break;
     case 0x39: /* FRINTZ */
-        need_rmode = true;
         only_in_vector = true;
         rmode = FPROUNDING_ZERO;
         break;
     case 0x58: /* FRINTA */
-        need_rmode = true;
         only_in_vector = true;
         rmode = FPROUNDING_TIEAWAY;
         break;
@@ -12706,43 +12694,33 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         /* current rounding mode */
         break;
     case 0x1a: /* FCVTNS */
-        need_rmode = true;
         rmode = FPROUNDING_TIEEVEN;
         break;
     case 0x1b: /* FCVTMS */
-        need_rmode = true;
         rmode = FPROUNDING_NEGINF;
         break;
     case 0x1c: /* FCVTAS */
-        need_rmode = true;
         rmode = FPROUNDING_TIEAWAY;
         break;
     case 0x3a: /* FCVTPS */
-        need_rmode = true;
         rmode = FPROUNDING_POSINF;
         break;
     case 0x3b: /* FCVTZS */
-        need_rmode = true;
         rmode = FPROUNDING_ZERO;
         break;
     case 0x5a: /* FCVTNU */
-        need_rmode = true;
         rmode = FPROUNDING_TIEEVEN;
         break;
     case 0x5b: /* FCVTMU */
-        need_rmode = true;
         rmode = FPROUNDING_NEGINF;
         break;
     case 0x5c: /* FCVTAU */
-        need_rmode = true;
         rmode = FPROUNDING_TIEAWAY;
         break;
     case 0x7a: /* FCVTPU */
-        need_rmode = true;
         rmode = FPROUNDING_POSINF;
         break;
     case 0x7b: /* FCVTZU */
-        need_rmode = true;
         rmode = FPROUNDING_ZERO;
         break;
     case 0x2f: /* FABS */
@@ -12775,11 +12753,11 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         return;
     }
 
-    if (need_rmode || need_fpst) {
+    if (rmode >= 0 || need_fpst) {
         tcg_fpstatus = fpstatus_ptr(FPST_FPCR_F16);
     }
 
-    if (need_rmode) {
+    if (rmode >= 0) {
         tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
     }
-- 
2.34.1

