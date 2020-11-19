Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp759487lfb;
        Thu, 19 Nov 2020 14:10:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQwLopSYT8ljUefw5OG5Hoj/t/OEBwQCsiqXGVfiz7BPi+ixaMbFRvTvh7N9Ky36F2hRyR
X-Received: by 2002:a25:d305:: with SMTP id e5mr20044357ybf.358.1605823845253;
        Thu, 19 Nov 2020 14:10:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823845; cv=none;
        d=google.com; s=arc-20160816;
        b=JCDYlesQhYiCU9xMvz2vwbUPio0fSnlsl1Q0UCwJUz7C7sGGo+giIOHQ/Ct08aj2II
         KeXqFC1t3qjqUC2Ol2qcxWy5Rt4LvN8t1SOGFFovc6aU7qGAijOdpXERXsTVR3sr3jUb
         s4o+19zjuUAxUUNF68Cup9Mg9tawh4NWwIzG5Wz6iTYos9kMvCkIIGyOImtdUEsEn1yh
         TuVzFuqUvFVDvZPaC2OUhneLRgtjRungETkBmF9ibL5L4r/eWZYFJZMeB8O33PbE4Dh9
         LD1alylyQvHcRPwzqYO4OfHkZnJ13ZDsTONpwZRgtoyyDGDCBN9Y0DVjFLuhLOcrsjpu
         EmyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/ahYnTL2lQGGWoIiaxWssj4cHQQA/2fHIGzeMpMrupQ=;
        b=Ta2KPUt+mU2u+jQYDO5l3N/ec6JU3+z7TSBeno0rKLSd3qUH+w8XeKRAJacFpyT33I
         WxzjUB+YltmivJ5nEDH0IsLYahcG9VMQEu4bAkQOdb5ILBwuOABFx3hKuFVprD7OLPSW
         Z8zY4VzPetPcIfPHXD12YB6q0BVAFifOhdnGArFi+jVZSklw6NCb1G6mtDLn1oAYODWm
         X06KlzMo5ed3SOJ2IaPc6wAEmU4a86/5oyH3HUnLVzGSvCgFLTGhKH6v4vwnrCHSSQyx
         bWYr2RxFA7n0La10S4+whWkfiTOa7uXi0sawAJtm0E1te6mz3pZA7yJ+MgLHRpGQsVzo
         G0nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q925+tpF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si821479ybl.102.2020.11.19.14.10.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:10:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q925+tpF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfs8a-0002YK-Ht
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvD-0000sN-Va
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:56 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:34009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfruz-0004Cu-9Z
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:55 -0500
Received: by mail-wm1-x32a.google.com with SMTP id x13so1671422wmj.1
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2020 13:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/ahYnTL2lQGGWoIiaxWssj4cHQQA/2fHIGzeMpMrupQ=;
 b=q925+tpFFls1vtRVD379U6BT93JWUYXOT52mvfC66NIlG54kjVIkwiDfL2eLxVnYHd
 MgQsO45G7xnhG5xyxqN4siPpQg+3rJGmjJbwGJi82mXqFHp8fRccIdvaEyLWRpRXw3Ev
 KmYpuJq0/kF8Lp1OoD5nQLWysZu3HK69llpIC2EQoaioovm4mN7vMrJCS7lPg3AQLS2w
 PtRbAVbJbE2yYUctUIE92GklChI9ABCZ4kOTei0fS5GogjKuvLln8rNII6/PgytSsCKH
 Q4l4KL6aFmddHLAHasL47LDNN3aniJb6Z95DZwxkBtkhr101zghkC8tbkJS16fGM0imr
 U7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ahYnTL2lQGGWoIiaxWssj4cHQQA/2fHIGzeMpMrupQ=;
 b=SieLKP8zl23r26EJX9Gt9LTM6GOzcMboh85VHVX8NUJDLqkokz1lFHkn5Ml3NtZbTY
 tBg98sK25T/VLXfM3ar/HAbB8Tbr7KwbEAs3n3MuqRrXMSIr8wlMYb0Dps/4y9DRz07y
 10m2D5DmH3eGr7D4PoJXSPlJwNrY7+y+8EZk49HO+XhQT7saRgZWQ3MMi3tNHDiF6mVM
 gRCTTm2F5HgkVhpgqJk5EEe0KUagecGs4zWALQag+OrQD1u2iquBO6uCnvzFU21sShLb
 xcBJ4g37GMNtMxU4qjnrwp6G9eLbkOx7M9SIgAaxw9VwB3acHDHl6BM/Kd15cf0YQj5j
 yPwA==
X-Gm-Message-State: AOAM531GkJarXdysIy8FRE6RZZLsqCip2gX2hxPKLCIuwxnwig6S2Ts6
 6v2I38Dr+RVU72DYDJQxwPujXodK1jkBrw==
X-Received: by 2002:a05:600c:210a:: with SMTP id
 u10mr6566072wml.98.1605822996466; 
 Thu, 19 Nov 2020 13:56:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 14/28] target/arm: Implement FPCXT_NS fp system register
Date: Thu, 19 Nov 2020 21:56:03 +0000
Message-Id: <20201119215617.29887-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NX5XwsVq0mwb

Implement the v8.1M FPCXT_NS floating-point system register.  This is
a little more complicated than FPCXT_S, because it has specific
handling for "current FP state is inactive", and it only wants to do
PreserveFPState(), not the full set of actions done by
ExecuteFPCheck() which vfp_access_check() implements.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c.inc | 110 ++++++++++++++++++++++++++++++---
 1 file changed, 103 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index ebc59daf613..1c2d31f6f30 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -647,8 +647,20 @@ typedef enum fp_sysreg_check_result {
     fp_sysreg_check_continue, /* caller should continue generating code */
 } fp_sysreg_check_result;
 
-static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno)
+/*
+ * Emit code to check common UNDEF cases and handle lazy state preservation
+ * including the special casing for FPCXT_NS. For reads of sysregs, caller
+ * should provide storefn and opaque; for writes to sysregs these can be NULL.
+ * On return, if *insn_end_label is not NULL the caller needs to gen_set_label()
+ * it at the end of the other code generated for the insn.
+ */
+static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno,
+                                               fp_sysreg_storefn *storefn,
+                                               void *opaque,
+                                               TCGLabel **insn_end_label)
 {
+    *insn_end_label = NULL;
+
     if (!dc_isar_feature(aa32_fpsp_v2, s)) {
         return fp_sysreg_check_failed;
     }
@@ -663,6 +675,7 @@ static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno)
         }
         break;
     case ARM_VFP_FPCXT_S:
+    case ARM_VFP_FPCXT_NS:
         if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
             return false;
         }
@@ -674,8 +687,46 @@ static fp_sysreg_check_result fp_sysreg_checks(DisasContext *s, int regno)
         return fp_sysreg_check_failed;
     }
 
-    if (!vfp_access_check(s)) {
-        return fp_sysreg_check_done;
+    /*
+     * FPCXT_NS is a special case: it has specific handling for
+     * "current FP state is inactive", and must do the PreserveFPState()
+     * but not the usual full set of actions done by ExecuteFPCheck().
+     * We don't have a TB flag that matches the fpInactive check, so we
+     * do it at runtime as we don't expect FPCXT_NS accesses to be frequent.
+     * The code emitted here handles the fpInactive special case;
+     * the caller just has to do the codegen for the normal (!fpInactive)
+     * special case, and then set the label at the end.
+     */
+    if (regno == ARM_VFP_FPCXT_NS) {
+        /* fpInactive = FPCCR_NS.ASPEN == 1 && CONTROL.FPCA == 0 */
+        TCGLabel *fp_active_label = gen_new_label();
+        TCGv_i32 aspen, fpca;
+        aspen = load_cpu_field(v7m.fpccr[M_REG_NS]);
+        fpca = load_cpu_field(v7m.control[M_REG_S]);
+        tcg_gen_andi_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
+        tcg_gen_xori_i32(aspen, aspen, R_V7M_FPCCR_ASPEN_MASK);
+        tcg_gen_andi_i32(fpca, fpca, R_V7M_CONTROL_FPCA_MASK);
+        tcg_gen_or_i32(fpca, fpca, aspen);
+        tcg_gen_brcondi_i32(TCG_COND_NE, fpca, 0, fp_active_label);
+        tcg_temp_free_i32(aspen);
+        tcg_temp_free_i32(fpca);
+
+        /* fpInactive case: FPCXT_NS reads as FPDSCR_NS, write is NOP */
+        if (storefn) {
+            TCGv_i32 tmp = load_cpu_field(v7m.fpdscr[M_REG_NS]);
+            storefn(s, opaque, tmp);
+        }
+        /* jump to end of insn */
+        *insn_end_label = gen_new_label();
+        tcg_gen_br(*insn_end_label);
+
+        gen_set_label(fp_active_label);
+        /* !fpInactive: PreserveFPState() and handle register as normal */
+        gen_preserve_fp_state(s);
+    } else {
+        if (!vfp_access_check(s)) {
+            return fp_sysreg_check_done;
+        }
     }
 
     return fp_sysreg_check_continue;
@@ -687,8 +738,10 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
 {
     /* Do a write to an M-profile floating point system register */
     TCGv_i32 tmp;
+    TCGLabel *insn_end_label;
+    bool lookup_tb = false;
 
-    switch (fp_sysreg_checks(s, regno)) {
+    switch (fp_sysreg_checks(s, regno, NULL, NULL, &insn_end_label)) {
     case fp_sysreg_check_failed:
         return false;
     case fp_sysreg_check_done:
@@ -702,7 +755,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         tmp = loadfn(s, opaque);
         gen_helper_vfp_set_fpscr(cpu_env, tmp);
         tcg_temp_free_i32(tmp);
-        gen_lookup_tb(s);
+        lookup_tb = true;
         break;
     case ARM_VFP_FPSCR_NZCVQC:
     {
@@ -721,6 +774,7 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
         break;
     }
     case ARM_VFP_FPCXT_S:
+    case ARM_VFP_FPCXT_NS:
     {
         TCGv_i32 sfpa, control, fpscr;
         /* Set FPSCR[27:0] and CONTROL.SFPA from value */
@@ -743,6 +797,12 @@ static bool gen_M_fp_sysreg_write(DisasContext *s, int regno,
     default:
         g_assert_not_reached();
     }
+    if (insn_end_label) {
+        gen_set_label(insn_end_label);
+    }
+    if (lookup_tb) {
+        gen_lookup_tb(s);
+    }
     return true;
 }
 
@@ -752,8 +812,10 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
 {
     /* Do a read from an M-profile floating point system register */
     TCGv_i32 tmp;
+    TCGLabel *insn_end_label;
+    bool lookup_tb = false;
 
-    switch (fp_sysreg_checks(s, regno)) {
+    switch (fp_sysreg_checks(s, regno, storefn, opaque, &insn_end_label)) {
     case fp_sysreg_check_failed:
         return false;
     case fp_sysreg_check_done:
@@ -810,12 +872,46 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
         fpscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
         gen_helper_vfp_set_fpscr(cpu_env, fpscr);
         tcg_temp_free_i32(fpscr);
-        gen_lookup_tb(s);
+        lookup_tb = true;
+        break;
+    }
+    case ARM_VFP_FPCXT_NS:
+    {
+        TCGv_i32 control, sfpa, fpscr, fpdscr, zero;
+        /* Reads the same as FPCXT_S, but side effects differ */
+        tmp = tcg_temp_new_i32();
+        sfpa = tcg_temp_new_i32();
+        fpscr = tcg_temp_new_i32();
+        gen_helper_vfp_get_fpscr(fpscr, cpu_env);
+        tcg_gen_andi_i32(tmp, fpscr, ~FPCR_NZCV_MASK);
+        control = load_cpu_field(v7m.control[M_REG_S]);
+        tcg_gen_andi_i32(sfpa, control, R_V7M_CONTROL_SFPA_MASK);
+        tcg_gen_shli_i32(sfpa, sfpa, 31 - R_V7M_CONTROL_SFPA_SHIFT);
+        tcg_gen_or_i32(tmp, tmp, sfpa);
+        tcg_temp_free_i32(control);
+        /* Store result before updating FPSCR, in case it faults */
+        storefn(s, opaque, tmp);
+        /* If SFPA is zero then set FPSCR from FPDSCR_NS */
+        fpdscr = load_cpu_field(v7m.fpdscr[M_REG_NS]);
+        zero = tcg_const_i32(0);
+        tcg_gen_movcond_i32(TCG_COND_EQ, fpscr, sfpa, zero, fpdscr, fpscr);
+        gen_helper_vfp_set_fpscr(cpu_env, fpscr);
+        tcg_temp_free_i32(zero);
+        tcg_temp_free_i32(sfpa);
+        tcg_temp_free_i32(fpdscr);
+        tcg_temp_free_i32(fpscr);
+        lookup_tb = true;
         break;
     }
     default:
         g_assert_not_reached();
     }
+    if (insn_end_label) {
+        gen_set_label(insn_end_label);
+    }
+    if (lookup_tb) {
+        gen_lookup_tb(s);
+    }
     return true;
 }
 
-- 
2.20.1

