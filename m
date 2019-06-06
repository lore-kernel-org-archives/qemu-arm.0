Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4748225wrg;
        Thu, 6 Jun 2019 10:47:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzZwQ0CQAKstEx/wDV4uoD9UoXIly2D7URpKMQMvFL47UVgmSKSBt1et3WHI4fs9tdrU+Vb
X-Received: by 2002:a05:620a:124f:: with SMTP id a15mr40303498qkl.173.1559843229999;
        Thu, 06 Jun 2019 10:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559843229; cv=none;
        d=google.com; s=arc-20160816;
        b=JsnDciM6IP8b0nnQh8V+A0OBhxRp5A7Q7kuMcGnnUTse5lOANKDBk1oAfn5dz53kim
         zX5Y2RKq6s63IJwoPTZdRJgXOhVeq8ToDv43EwKLIJ6f3lQBwFxEVqseOxtv7lEpoMHI
         KhKnlwNoWeBSdiZ6/jl/nIAoxEO7Kj6se2IwwrX5HiuQDj2Dsbcai52oz+H0pPCLD5lI
         2KAnZPkaKt1/cGfm+8cuisigb5MqHxswMVNzb15kooHYR1kztDHjh2bCcqA5C2xC4ZGU
         HRpEaVP1CBdracjKKm5KdFZzyWJbteNwl2uf7W7cVWU/ak+juo6ww4lpsYndKnrHiYR8
         r11g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=sfcSfieW8Ddeo0hEC2vM6Cq6H+ydZkZrWTeso5fNmQk=;
        b=AkM35DAoBUA+JOb3+bSq62xbg2hZ6WFgb1WbiUdinAqjIVhxQtrknWzKlD5dgjlZIV
         oqLn89LaRjYA/BPKlwUlPzTVYYBouu8g//eoiauoEECu4ANlZj/mmfs06XoyJTN4ScRr
         3NQZ5KqW7thZPCalTNruYEfyrDLNrfcswZ8WaXfUvfCcpn/3rL0j1DLRGheYxzyx8vMw
         MZYCNW/oT2MNt+BTs4RBhaK9M2dePpWYkLCAN5euyCVAFaV9o69GZoP8xsaq46l10nwy
         iAgC86kHEGjqQ39Nb9gVCHEs54+kb+nFwcQ0IcS6Njvn9M3+LMNIO2TfW/c7sYVuMCmz
         bZJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=omsel48L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u125si82816qkf.1.2019.06.06.10.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 10:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=omsel48L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwTl-0003qT-BP
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 13:47:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTU-0003o7-I7
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:46:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwTP-0003GQ-H4
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:46:50 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55542)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTL-0002qM-Mi
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:46:45 -0400
Received: by mail-wm1-x341.google.com with SMTP id a15so783157wmj.5
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sfcSfieW8Ddeo0hEC2vM6Cq6H+ydZkZrWTeso5fNmQk=;
	b=omsel48Lb+6uuwQEsB9Gpvke64DQJnGVuVtN5TQUFlXtjNRMSudslszzDfgEQOPjhH
	PopwCX73f0SDuF3bf+mLhaxzwOurwz0nczl5aI7N4dqBe0wKnqYkLjazpKC8xwH6xIOX
	sf/umB7VuziIeLbAMstgvaFDUVQsTqOt1OZ8dWXmrISRhnDKF0pdSIEnfv72xv/SklMh
	ZxEgcAjOY++Q7YZhfcKqkQud5rBQFj/3wF1rirnZ+6Qe2CbY0hV6S283tv62AkuIw1Od
	mSRwtSAPH0UjJiYUFR3JcXhnIFHDqXdhMf16IW2p8b4vTzCzdbEEhHid5LAdeflf+KCR
	XqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sfcSfieW8Ddeo0hEC2vM6Cq6H+ydZkZrWTeso5fNmQk=;
	b=okObZxlkj2Vls3+qQtPgksDdF+LQq7yjcqA5B2q9CjqmOcH808zQCbQWAEQ23EWe3w
	TPYru99oWfunl4y31M27kaG3UP+Jpwu6ohj47ADjkNQnrsJF++g9qTAgKScPgwCMiagp
	dodaYWmLFHtc0Nz0ZxCVxOfOApb67VZpNt9MxR0nBwZsmheVU1HqhtnfpCkjKUkwc1m9
	8EXFSWmuqnixFouOG8zDJGB9yS9Bs6+33aUCCtQluSONbLBsBl4q6HsF3aPdxwxym97D
	N4UFk5zFMzzeWNtvnYIMH+CU349uw7L9OMuHrAoWH8lU4T/OaX7SML7WF+tdHfI4whMi
	Z/6A==
X-Gm-Message-State: APjAAAWpJuPsbqilWBR7seUB+hEAg6+LMv6FpSnIdTSc6xTheCfNOAQs
	11wc8oU64/BUC/xjb6AbdbDTmJmuruZhDg==
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr867964wma.120.1559843177622; 
	Thu, 06 Jun 2019 10:46:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:33 +0100
Message-Id: <20190606174609.20487-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH 06/42] target/arm: Convert the VSEL instructions
 to decodetree
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: snH3ZcQ9B5tC

Convert the VSEL instructions to decodetree.
We leave trans_VSEL() in translate.c for now as this allows
the patch to show just the changes from the old handle_vsel().

In the old code the check for "do D16-D31 exist" was hidden in
the VFP_DREG macro, and assumed that VFPv3 always implied that
D16-D31 exist. In the new code we do the correct ID register test.
This gives identical behaviour for most of our CPUs, and fixes
previously incorrect handling for  Cortex-R5F, Cortex-M4 and
Cortex-M33, which all implement VFPv3 or better with only 16
double-precision registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h               |  6 ++++++
 target/arm/translate-vfp.inc.c |  9 +++++++++
 target/arm/translate.c         | 35 ++++++++++++++++++++++++----------
 target/arm/vfp-uncond.decode   | 19 ++++++++++++++++++
 4 files changed, 59 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c34207611ba..30fb107c605 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3408,6 +3408,12 @@ static inline bool isar_feature_aa32_fp16_arith(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, FP) == 1;
 }
 
+static inline bool isar_feature_aa32_fp_d32(const ARMISARegisters *id)
+{
+    /* Return true if D16-D31 are implemented */
+    return FIELD_EX64(id->mvfr0, MVFR0, SIMDREG) >= 2;
+}
+
 /*
  * We always set the FP and SIMD FP16 fields to indicate identical
  * levels of support (assuming SIMD is implemented at all), so
diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index cf3d7febaa7..f7535138d0f 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -129,3 +129,12 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
 
     return true;
 }
+
+/*
+ * The most usual kind of VFP access check, for everything except
+ * FMXR/FMRX to the always-available special registers.
+ */
+static bool vfp_access_check(DisasContext *s)
+{
+    return full_vfp_access_check(s, false);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6088ffdc6ee..50545062195 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3076,10 +3076,27 @@ static void gen_neon_dup_high16(TCGv_i32 var)
     tcg_temp_free_i32(tmp);
 }
 
-static int handle_vsel(uint32_t insn, uint32_t rd, uint32_t rn, uint32_t rm,
-                       uint32_t dp)
+static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
 {
-    uint32_t cc = extract32(insn, 20, 2);
+    uint32_t rd, rn, rm;
+    bool dp = a->dp;
+
+    if (!dc_isar_feature(aa32_vsel, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (dp && !dc_isar_feature(aa32_fp_d32, s) &&
+        ((a->vm | a->vn | a->vd) & 0x10)) {
+        return false;
+    }
+    rd = a->vd;
+    rn = a->vn;
+    rm = a->vm;
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
 
     if (dp) {
         TCGv_i64 frn, frm, dest;
@@ -3101,7 +3118,7 @@ static int handle_vsel(uint32_t insn, uint32_t rd, uint32_t rn, uint32_t rm,
 
         tcg_gen_ld_f64(frn, cpu_env, vfp_reg_offset(dp, rn));
         tcg_gen_ld_f64(frm, cpu_env, vfp_reg_offset(dp, rm));
-        switch (cc) {
+        switch (a->cc) {
         case 0: /* eq: Z */
             tcg_gen_movcond_i64(TCG_COND_EQ, dest, zf, zero,
                                 frn, frm);
@@ -3148,7 +3165,7 @@ static int handle_vsel(uint32_t insn, uint32_t rd, uint32_t rn, uint32_t rm,
         dest = tcg_temp_new_i32();
         tcg_gen_ld_f32(frn, cpu_env, vfp_reg_offset(dp, rn));
         tcg_gen_ld_f32(frm, cpu_env, vfp_reg_offset(dp, rm));
-        switch (cc) {
+        switch (a->cc) {
         case 0: /* eq: Z */
             tcg_gen_movcond_i32(TCG_COND_EQ, dest, cpu_ZF, zero,
                                 frn, frm);
@@ -3182,7 +3199,7 @@ static int handle_vsel(uint32_t insn, uint32_t rd, uint32_t rn, uint32_t rm,
         tcg_temp_free_i32(zero);
     }
 
-    return 0;
+    return true;
 }
 
 static int handle_vminmaxnm(uint32_t insn, uint32_t rd, uint32_t rn,
@@ -3354,10 +3371,8 @@ static int disas_vfp_misc_insn(DisasContext *s, uint32_t insn)
         rm = VFP_SREG_M(insn);
     }
 
-    if ((insn & 0x0f800e50) == 0x0e000a00 && dc_isar_feature(aa32_vsel, s)) {
-        return handle_vsel(insn, rd, rn, rm, dp);
-    } else if ((insn & 0x0fb00e10) == 0x0e800a00 &&
-               dc_isar_feature(aa32_vminmaxnm, s)) {
+    if ((insn & 0x0fb00e10) == 0x0e800a00 &&
+        dc_isar_feature(aa32_vminmaxnm, s)) {
         return handle_vminmaxnm(insn, rd, rn, rm, dp);
     } else if ((insn & 0x0fbc0ed0) == 0x0eb80a40 &&
                dc_isar_feature(aa32_vrint, s)) {
diff --git a/target/arm/vfp-uncond.decode b/target/arm/vfp-uncond.decode
index b1d9dc507c2..b7f7c27fe86 100644
--- a/target/arm/vfp-uncond.decode
+++ b/target/arm/vfp-uncond.decode
@@ -26,3 +26,22 @@
 #  1111 1110 .... .... .... 101. .... ....
 # (but those patterns might also cover some Neon instructions,
 # which do not live in this file.)
+
+# VFP registers have an odd encoding with a four-bit field
+# and a one-bit field which are assembled in different orders
+# depending on whether the register is double or single precision.
+# Each individual instruction function must do the checks for
+# "double register selected but CPU does not have double support"
+# and "double register number has bit 4 set but CPU does not
+# support D16-D31" (which should UNDEF).
+%vm_dp  5:1 0:4
+%vm_sp  0:4 5:1
+%vn_dp  7:1 16:4
+%vn_sp  16:4 7:1
+%vd_dp  22:1 12:4
+%vd_sp  12:4 22:1
+
+VSEL        1111 1110 0. cc:2 .... .... 1010 .0.0 .... \
+            vm=%vm_sp vn=%vn_sp vd=%vd_sp dp=0
+VSEL        1111 1110 0. cc:2 .... .... 1011 .0.0 .... \
+            vm=%vm_dp vn=%vn_dp vd=%vd_dp dp=1
-- 
2.20.1

