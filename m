Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4207763wrg;
        Tue, 11 Jun 2019 04:04:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBqL7mI4Mu7UnY2y6dcYgbO3uzMqE9kDazF8sduPjGkqezCD7j6Ce/vJyNht8W5Ls+6f97
X-Received: by 2002:ac8:28fc:: with SMTP id j57mr928980qtj.330.1560251075359;
        Tue, 11 Jun 2019 04:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560251075; cv=none;
        d=google.com; s=arc-20160816;
        b=BQoKpXhl3JD7lgGf1g1q4Wu/fSmlu3lgVOjXoO4rDoltouQvNC8kMjpn+3zl34984Q
         BnexETZzc+ZkmRmLxI0Z1niSm5O9NYQ1B/yEalon4UtxqGR9JLTT22fzanmEiSUfy6L3
         3Ga+lOcRdSXa5s0bZT7HjHGA0JODMJ+TZCBh+IO5RFKc1TNBdxkxn+IeBoXkGg5Guvbo
         lxSctxNW+Cxjm7Ed1BFUCHt1I98V+jyBlA1XjzCmM4WdwDu5YnwOmq6+aSL3Vt50dDAV
         YJNcuVOWO7hwjcctzriXRpK/M4u4RPIQds1wuVvDBdTubROvm/yYqTgq05ghi6h44f7s
         i1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ntqFWnYKEOd6do5Dv+t7ajMLbUOjNo0hPh/YM8tuMAg=;
        b=nnB7IWSA22YXOctVK8FWMwwsq/EVOiFwMiV2brp8VpjMO/zSmGO3WoGDXzesDrHbVd
         6s+eyvE3OPEJsAnTkur98s/Lux//rDVLWTeyxKxXJIZnHXthUimJKGEBkZroyzoJnFD/
         jz33ZkmT14jciOzdbOG30X6prhbxatsJQVT5PbbQCbync/GgE8OHsjqzd9cqxiDsVN41
         mORQEy/fV+S+QD7B01N87B6ocE5weUEu2dknxVfQtW0fo04Fjc8DAOhil3dAjS3gUp0i
         Hj8QfMewWM72BhEBBQxLXASi4XErcsLsWmLbLQxTFZwHgG2REZpyC2nZ+JewAj+/9G1h
         xBGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HATPupoE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y51si259082qtk.289.2019.06.11.04.04.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:04:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HATPupoE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56250 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haeZu-0008FL-JZ
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38935)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haePl-00078O-4u
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePi-0007Gd-WF
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:04 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:34814)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePg-0007Du-UZ
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:02 -0400
Received: by mail-wm1-x343.google.com with SMTP id w9so1653106wmd.1
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ntqFWnYKEOd6do5Dv+t7ajMLbUOjNo0hPh/YM8tuMAg=;
 b=HATPupoEgeWJUI4YHLuth9hpywYEqGYa+KoN3boD9+UOulIaWcEzRSZKIVMB/tIlM2
 7dXNdW9NMSDFjyY7f3GmB8lwNS5eMAirW54le4A9i8OSSUILv77VkBaQm2H7vg/wcljS
 QWNbOTVSh/iMrtUhpP/c0C75ve5hhAg44Fklg1tZS4ggCqe/9kJsTGF6uqLsx9FJLu1s
 2zndeRs3wk0pnFOR7UeYujzhKRXfQAxbiCib0EjYTji+ryAjjMYS3zWjinMGomsgg4n2
 iO3lZpG4+IrMcZrGFwvp26hefL0inkSIz0sS6yhxN8DizwhdqYMz/CRf0HDjbdUftAkC
 Mrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ntqFWnYKEOd6do5Dv+t7ajMLbUOjNo0hPh/YM8tuMAg=;
 b=WhDKtIDWmGDJMyvhAEH6MsQSHSPZCExZkj7D8YF23lC/DCpKbdLT3anI3KWtosbeZi
 UExLfqBdourBoBbDqwqROSzdBU28MetvwuLw6n82BHnNNOwYPqlP+SZAB8V/gtyOn/ba
 q0x/AF0swHXXmgiM6RgOiSItp8Jf7+itP8a5VY5MptFkf3c9pEFiBNtvsSIdvY7kB3Rg
 sWeL7d2ThtXUja/gZ/WL+amLey+P9kF0z0omwaKO8RKVbKPSg81IH+FDQ1wW0n3mHArg
 prSU/j2leMpTEim8Er2ur1BR77lE4R5eXm4cYaJP2rBVHkWultl8F5Ztl2m5G7Gb/ImC
 BCYg==
X-Gm-Message-State: APjAAAViqlFVGhYroNMBUpVfBftns6h9U1SorTY8ORqhiN+NTxc13vEP
 UZM7VKLLd0v7Z7k5KtyjGD0S5KVF9RSvyg==
X-Received: by 2002:a1c:e715:: with SMTP id e21mr18044295wmh.16.1560250439475; 
 Tue, 11 Jun 2019 03:53:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.53.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:53:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:15 +0100
Message-Id: <20190611105351.9871-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH v2 06/42] target/arm: Convert the VSEL
 instructions to decodetree
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ehV65TrNW2A

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h               |  6 ++++++
 target/arm/translate-vfp.inc.c |  9 +++++++++
 target/arm/translate.c         | 35 ++++++++++++++++++++++++----------
 target/arm/vfp-uncond.decode   | 19 ++++++++++++++++++
 4 files changed, 59 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8fa9772c9da..c612901daeb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3372,6 +3372,12 @@ static inline bool isar_feature_aa32_fp16_arith(const ARMISARegisters *id)
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
index 4ba3f1287ee..6ee60303eeb 100644
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

