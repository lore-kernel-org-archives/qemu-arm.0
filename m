Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp271807lfm;
        Thu, 20 May 2021 08:29:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKYOVXOxrArBtPPoo1dKKSDvmnzb8KikHXcVXD0SeLWAC3fmps9n2CycYd5HHR3RfssKbu
X-Received: by 2002:a05:6602:242b:: with SMTP id g11mr5671888iob.105.1621524579872;
        Thu, 20 May 2021 08:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621524579; cv=none;
        d=google.com; s=arc-20160816;
        b=MlEnHQkv7uoLLF2iyKN+DtT+fSIpiGylWRDv3pAgz7M3Hc6/RY1ITpZJnwRVySaojY
         IExK2cmBBdw3YlKRhS0PYyrptKfjxMKa5opGIrEepAGsvnQlfLaJZmVL0msk2soXTnmm
         FzLW2/3kuO5pYozzhoLaw41zS8WC2yB6hpK/fbPZujZ6BouqF1MbONaMbjBQjYWX6YKk
         MeYgML1Tcs5XtlLmCXXeKJWqPZAwFHXZDmkLYR5DTd+wlHg7Iv7XMqAQRPEeKcUiW2FG
         bd34NYgyahGvEBxMTJY6SvJY+tToNe4ijFnT6K2dpF2yo9y76zrg+omFkfSTehAQeaYI
         Zt8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=n9p8pwMQumtdp/ZJ3zle1+NP3mYs3Ow9NwHjhceO1EI=;
        b=sREg0NTnA404pEmqkJiaCvUkIDkZLZb/UcrpusYWjQSODnPRCSbq7/Uk9KnVH9gExA
         gyuUh3MvQinaT8ejWLqKqfF/WsfsRUxrsIANAzwpXJOA+g3nduoN2d0UiGxYzbETtWtG
         hd5jdQOQ2qVlRwo33RpG6LiaXS+iiueorceMw0tAwVPg6PBAY7ZsaoBtRZF8EaP6ccmL
         ZRwHh3JpU8TeXBHACsEya8P5lEcpga7O1j+HjNz17RpFrgPm5s/6vkOBNyXhmzr/ll9f
         otoLiXtxDOWqq1y7fgJOoka3DYuE5aBHprIMb+xPs4z7K2svCFERX6Lzt3e1ZWbOD628
         B+eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n8P1asFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si2564511jaq.89.2021.05.20.08.29.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 08:29:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n8P1asFL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljkcF-00008I-5v
	for alex.bennee@linaro.org; Thu, 20 May 2021 11:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbP-0007pX-Ms
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:28:47 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbN-0000eB-2N
 for qemu-arm@nongnu.org; Thu, 20 May 2021 11:28:47 -0400
Received: by mail-wr1-x431.google.com with SMTP id x8so18096394wrq.9
 for <qemu-arm@nongnu.org>; Thu, 20 May 2021 08:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=n9p8pwMQumtdp/ZJ3zle1+NP3mYs3Ow9NwHjhceO1EI=;
 b=n8P1asFLSIAnOGCd12KUnDnQixup+dyPgnetfxege+3L+qcw9yd/zTN98KnM4J4w7z
 9nX/zyfBH0gAX7OzatbfkEuzn/sVFe8qMsrPau++X85ip5j2e1VS/tRBCxu3FhJZeE+f
 yMNn/wc9Nrr62N/d1VeQcHbVogE6pcpDJON3IsApFpZaa6YZt4X3JIBwC2jgVimrendr
 VBQQkxsAmVhdFOOJr23nnszwzjaMRc+Yu32QWhWMM2libzd90qIKYVKO/W9mhyn36Q5i
 hYJ2fLLaNq0G+8nr3PgY1w3jKLuMq7IVcB7eR7mTcinesnMQodw4aQ5HdGBILiQ9h6hM
 NHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n9p8pwMQumtdp/ZJ3zle1+NP3mYs3Ow9NwHjhceO1EI=;
 b=K4s3elzPcsmcLhYxVfnDtVsfEPzSpPm4gKhndiGJIf8VXBJJb7XDl8sBqTaZTizsDw
 wDVvmEIwGT7VEh5CsUqn17DTXHJmdZl5fvdPViu1DVcDnjBthzedVIjgsxmFdyQdEE/N
 uHFAOwCkJEpn8RIqaJJeXtcxjiSGRO6gFBEy6zOTfpxk0XVMheXL4Zh3VI39LoDYLptS
 haRN+HHUroUma4PKCXrG5jk4+8NLsrI4iKf/O81WcgwREiL2Wxx276xBfnp6pSc0308/
 LROafROjRmlQCt2PtVMrWBvFPPWMYeXVy+EguN4Ep+ANi03d4oTO1O/ouA7HxbwC+FAB
 Nl7w==
X-Gm-Message-State: AOAM531k4iW1p0sbQLkNwuHAhB87o7jKBcNIRp/aw/5NZtOBhnxMUeFA
 yfYQ8kQ/48a3R4VTnmavjjGjhsGF65NR7NUo
X-Received: by 2002:a5d:58d0:: with SMTP id o16mr4895414wrf.420.1621524523763; 
 Thu, 20 May 2021 08:28:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/9] target/arm: Update feature checks for insns which are
 "MVE or FP"
Date: Thu, 20 May 2021 16:28:33 +0100
Message-Id: <20210520152840.24453-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520152840.24453-1-peter.maydell@linaro.org>
References: <20210520152840.24453-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: yRDkcPPHtVoU

Some v8M instructions are present if either the floating point
extension or MVE is implemented.  Update our implementation of them
to check for MVE as well as for FP.

This is all the insns which use CheckDecodeFaults(ExtType_MveOrFp) or
CheckDecodeFaults(ExtType_MveOrDpFp) in their pseudocode, which are
essentially the loads and stores, moves and sysreg accesses, except
for VMOV_reg_sp and VMOV_reg_dp, which we handle in subsequent
patches because they need a refactor to provide a place to put the
new MVE check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c | 48 +++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 3da84f30a01..2202f8985d2 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -543,11 +543,16 @@ static bool trans_VMOV_to_gp(DisasContext *s, arg_VMOV_to_gp *a)
     /* VMOV scalar to general purpose register */
     TCGv_i32 tmp;
 
-    /* SIZE == MO_32 is a VFP instruction; otherwise NEON.  */
-    if (a->size == MO_32
-        ? !dc_isar_feature(aa32_fpsp_v2, s)
-        : !arm_dc_feature(s, ARM_FEATURE_NEON)) {
-        return false;
+    /*
+     * SIZE == MO_32 is a VFP instruction; otherwise NEON. MVE has
+     * all sizes, whether the CPU has fp or not.
+     */
+    if (!dc_isar_feature(aa32_mve, s)) {
+        if (a->size == MO_32
+            ? !dc_isar_feature(aa32_fpsp_v2, s)
+            : !arm_dc_feature(s, ARM_FEATURE_NEON)) {
+            return false;
+        }
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
@@ -571,11 +576,16 @@ static bool trans_VMOV_from_gp(DisasContext *s, arg_VMOV_from_gp *a)
     /* VMOV general purpose register to scalar */
     TCGv_i32 tmp;
 
-    /* SIZE == MO_32 is a VFP instruction; otherwise NEON.  */
-    if (a->size == MO_32
-        ? !dc_isar_feature(aa32_fpsp_v2, s)
-        : !arm_dc_feature(s, ARM_FEATURE_NEON)) {
-        return false;
+    /*
+     * SIZE == MO_32 is a VFP instruction; otherwise NEON. MVE has
+     * all sizes, whether the CPU has fp or not.
+     */
+    if (!dc_isar_feature(aa32_mve, s)) {
+        if (a->size == MO_32
+            ? !dc_isar_feature(aa32_fpsp_v2, s)
+            : !arm_dc_feature(s, ARM_FEATURE_NEON)) {
+            return false;
+        }
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
@@ -671,7 +681,7 @@ typedef enum FPSysRegCheckResult {
 
 static FPSysRegCheckResult fp_sysreg_checks(DisasContext *s, int regno)
 {
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return FPSysRegCheckFailed;
     }
 
@@ -1254,7 +1264,7 @@ static bool trans_VMOV_single(DisasContext *s, arg_VMOV_single *a)
 {
     TCGv_i32 tmp;
 
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
@@ -1287,7 +1297,7 @@ static bool trans_VMOV_64_sp(DisasContext *s, arg_VMOV_64_sp *a)
 {
     TCGv_i32 tmp;
 
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
@@ -1329,7 +1339,7 @@ static bool trans_VMOV_64_dp(DisasContext *s, arg_VMOV_64_dp *a)
      * floating point register.  Note that this does not require support
      * for double precision arithmetic.
      */
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
@@ -1368,7 +1378,7 @@ static bool trans_VLDR_VSTR_hp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     uint32_t offset;
     TCGv_i32 addr, tmp;
 
-    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
@@ -1403,7 +1413,7 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     uint32_t offset;
     TCGv_i32 addr, tmp;
 
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
@@ -1439,7 +1449,7 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
     TCGv_i64 tmp;
 
     /* Note that this does not require support for double arithmetic.  */
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
@@ -1479,7 +1489,7 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
     TCGv_i32 addr, tmp;
     int i, n;
 
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
@@ -1557,7 +1567,7 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
     int i, n;
 
     /* Note that this does not require support for double arithmetic.  */
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
-- 
2.20.1

