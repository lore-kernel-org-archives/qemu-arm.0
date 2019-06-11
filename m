Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4230209wrg;
        Tue, 11 Jun 2019 04:27:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzUPavvY665tJJBVVz1FhC8T5Ie6We5jCAHkixvz5DvEpY/Xtiy+Ye6TBXwshiuWZDEw8mT
X-Received: by 2002:ac8:5315:: with SMTP id t21mr53804070qtn.229.1560252472801;
        Tue, 11 Jun 2019 04:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560252472; cv=none;
        d=google.com; s=arc-20160816;
        b=uqUU3K/4lVOPeUgQSOuDxu8EBc+Y74OCY+0Jz8aClkdhNXPFBfVRbUZCI41EMuXufg
         q3glPRr4gqyeUpqDX57dUzPQJU4TxtXLcohNYoeD4NbcKKjHhSw2RtPF1XNUGoigr9uq
         TmhhrC/H3lhq3+W+8onvd9/CWeEUFyEZVqpk0D3eroOculcLhUauAi3gey+JHiR1hi+Z
         tCp+odHxa6g4iwjPZeKFPIEddM1W7NGO0CvA6dHUOz0X6TJFpkv1U/JSoaYLNTexCOHx
         sRxOEu5IQROUiaaYCvtrZ8zAQmuBbl/K77HKfat60aKGBRmoW3+jGPdhpEsVhRvqknhN
         tjfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=kVKIoFWbneLBSnXC8j5sTcaVOKy6BEkeJ62qtn6SHIs=;
        b=m7vvoCIXWNQhHcLBT1dcWed1Er92Wa4oOg7piaLAtT+Bi0oHbGrs2Og4Ggpd5PvIkl
         EYD2LHh17yqL9jXvHwSdnyjBMm32+iiDdvP7cdjxu1ThJJ5yz4cs8loAti8HUGzyUSn3
         D95CnRqCTnFMQld2GamUeUpY31NI/R1Dg2BDKhnp3ktThStJI6oID3OQhl647OUn8617
         BeQGTWfhMxqMmFHeVWPyuI9mA5An1PQRslrjfSiZ14BaRvi6+Uf+YVj4VAE/nsfQxH93
         v9RaVFqpjPRxo8Se4fDocZ+a69komT6AHxRkIDdI4M254sziuHRLyfhPkZ5YcGctgvPk
         JBNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xWjiRNZn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si7324353qva.47.2019.06.11.04.27.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 04:27:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xWjiRNZn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haewS-0002Sd-B3
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 07:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39567)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQM-0007XI-S9
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQK-0007pf-0x
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:42 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50497)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQH-0007lE-Qf
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 06:54:39 -0400
Received: by mail-wm1-x341.google.com with SMTP id c66so2437152wmf.0
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 03:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kVKIoFWbneLBSnXC8j5sTcaVOKy6BEkeJ62qtn6SHIs=;
 b=xWjiRNZnt1lI5dWIBti/RuGrGxAlYXLsV72Fmz61JROZ62gL7oB5orPXBizWMufHjz
 wRq+IJVuLnPUK7bnNUBO7+tW9O0dC5jcJwe3qwLdsLTpWehJTogXjDPeQCfx3VRB6YlO
 4Wgi/Jh0mdexxa4+8xsJg+SiRHbbyLXRHkPlECEuRT0w5R8zaM0CP3oorBugoauK/DpT
 0mdcBJugt3EpVa9TxrVPAYmoG8kZU8TQ30V3qtz6AqrP6PQK7PxAeCK29tOgwvKY5saC
 rLmRcec3ATtsKtIvYIgW9UDqjvBqXdMbowSWvY1UROtrKibJZRzFaNWQR7zJt+zEBHGO
 CRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kVKIoFWbneLBSnXC8j5sTcaVOKy6BEkeJ62qtn6SHIs=;
 b=bUC5EZZWktWxSjHa3AtbjuFi5Sw14HVu5MciF1nmKgFhAMRTwGfLLwR/xiFlNtDs24
 26tjHX3Z/abLKSJXLwVvuYJfbnNhrTrwHTYoakfva33ox6xQCcyL8dOCB1ZOnoA9O/H5
 Gmtw6JjhKbykWk5K+z+615VAjwT0h1pNtlm7BzkFFNzvxNKFRxi7Jihq5STQtRg5etM3
 QIWSnjUC1QNTOFsm9fb6KibXrBXcR8Eb7Q6wD6cUGhbX4PaYGbjEpdagC1G5OTvLhoJ1
 wTnSqTu/Vv9v5savVB8ZEdhuaYc0GHGnlq2C3ARnCO3jI4uYvZrQgt51B8/TMk2XDp7C
 /q0A==
X-Gm-Message-State: APjAAAV2lMTnvtoIp6FBDOexBi9rtz+4dhJp0HE7073qXzIExLCQU2Ut
 kLZCg9gSoDDCg9i39WcM8CubEbyqMs1iUQ==
X-Received: by 2002:a1c:9dc4:: with SMTP id g187mr15866026wme.86.1560250474395; 
 Tue, 11 Jun 2019 03:54:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:47 +0100
Message-Id: <20190611105351.9871-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH v2 38/42] target/arm: Convert integer-to-float
 insns to decodetree
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
X-TUID: twHs0G//EgIz

Convert the VCVT integer-to-float instructions to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 58 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 12 +------
 target/arm/vfp.decode          |  6 ++++
 3 files changed, 65 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index c50093776b6..cc3f61d9c41 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -2368,3 +2368,61 @@ static bool trans_VCVT_dp(DisasContext *s, arg_VCVT_dp *a)
     tcg_temp_free_i64(vm);
     return true;
 }
+
+static bool trans_VCVT_int_sp(DisasContext *s, arg_VCVT_int_sp *a)
+{
+    TCGv_i32 vm;
+    TCGv_ptr fpst;
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vm = tcg_temp_new_i32();
+    neon_load_reg32(vm, a->vm);
+    fpst = get_fpstatus_ptr(false);
+    if (a->s) {
+        /* i32 -> f32 */
+        gen_helper_vfp_sitos(vm, vm, fpst);
+    } else {
+        /* u32 -> f32 */
+        gen_helper_vfp_uitos(vm, vm, fpst);
+    }
+    neon_store_reg32(vm, a->vd);
+    tcg_temp_free_i32(vm);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
+
+static bool trans_VCVT_int_dp(DisasContext *s, arg_VCVT_int_dp *a)
+{
+    TCGv_i32 vm;
+    TCGv_i64 vd;
+    TCGv_ptr fpst;
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && (a->vd & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vm = tcg_temp_new_i32();
+    vd = tcg_temp_new_i64();
+    neon_load_reg32(vm, a->vm);
+    fpst = get_fpstatus_ptr(false);
+    if (a->s) {
+        /* i32 -> f64 */
+        gen_helper_vfp_sitod(vd, vm, fpst);
+    } else {
+        /* u32 -> f64 */
+        gen_helper_vfp_uitod(vd, vm, fpst);
+    }
+    neon_store_reg64(vd, a->vd);
+    tcg_temp_free_i32(vm);
+    tcg_temp_free_i64(vd);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 05ee76da77c..1e28308aa6a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3050,7 +3050,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 return 1;
             case 15:
                 switch (rn) {
-                case 0 ... 15:
+                case 0 ... 17:
                     /* Already handled by decodetree */
                     return 1;
                 default:
@@ -3063,10 +3063,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             if (op == 15) {
                 /* rn is opcode, encoded as per VFP_SREG_N. */
                 switch (rn) {
-                case 0x10: /* vcvt.fxx.u32 */
-                case 0x11: /* vcvt.fxx.s32 */
-                    rm_is_dp = false;
-                    break;
                 case 0x18: /* vcvtr.u32.fxx */
                 case 0x19: /* vcvtz.u32.fxx */
                 case 0x1a: /* vcvtr.s32.fxx */
@@ -3181,12 +3177,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 switch (op) {
                 case 15: /* extension space */
                     switch (rn) {
-                    case 16: /* fuito */
-                        gen_vfp_uito(dp, 0);
-                        break;
-                    case 17: /* fsito */
-                        gen_vfp_sito(dp, 0);
-                        break;
                     case 19: /* vjcvt */
                         gen_helper_vjcvt(cpu_F0s, cpu_F0d, cpu_env);
                         break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 56b8b4e6046..6da9a7913da 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -214,3 +214,9 @@ VCVT_sp      ---- 1110 1.11 0111 .... 1010 11.0 .... \
              vd=%vd_dp vm=%vm_sp
 VCVT_dp      ---- 1110 1.11 0111 .... 1011 11.0 .... \
              vd=%vd_sp vm=%vm_dp
+
+# VCVT from integer to floating point: Vm always single; Vd depends on size
+VCVT_int_sp  ---- 1110 1.11 1000 .... 1010 s:1 1.0 .... \
+             vd=%vd_sp vm=%vm_sp
+VCVT_int_dp  ---- 1110 1.11 1000 .... 1011 s:1 1.0 .... \
+             vd=%vd_dp vm=%vm_sp
-- 
2.20.1

