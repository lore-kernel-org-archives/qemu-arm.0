Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDF5C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 18:42:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfMLN-0007Wq-RP; Thu, 02 Jul 2026 14:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfMLK-0007KE-Lo
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 14:40:58 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfMLD-0005NZ-Lq
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 14:40:58 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-47122683cf3so1566436f8f.0
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 11:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783017630; x=1783622430; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ERT5FGdTM2la0VXNAKarQCU8EPQ7kfgNCQO83CFn2Vo=;
 b=UR6PAXGUcJZAJkLSFXacYP2r97VRxUyh62WNiyAqVnSX7J1wyqL8UYkNGRb/83f4Rh
 J0n/S+Do/pp7tSiyS4XXSJTlrRDjYXuH7Sy8bOxBRReOcIITCiXw/7Yl5WK2Ub0il7Ez
 kQlnCrzYX3wdlB85b9mSZO4emguX9xTFpEp48AVQspFWU1Gp3fwLGMDocXVY5fdRhy4n
 5ePCPDFIMl8PHPbEJOOD4z/E1AzUgJgnJyAp+T6rLYod0xAv0Vp1USNolLbPaKNwuR3a
 xUc6Lie7hMMW4y2LzIiUmg/bfDfhmuPsuQmFIawnRDITtBRe7BNbEz0beKjw7bQvQExw
 2DCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783017630; x=1783622430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ERT5FGdTM2la0VXNAKarQCU8EPQ7kfgNCQO83CFn2Vo=;
 b=Y6e0l/s8sUsyjpsYIKN4arkSrIjke/I2fVdbZ6PnoPawJZ2jr4HpnmyAQtf9dLDBox
 zbPI3KsKd/hWeZkOVzMJd4Mfu5g3R9eIU4Pj/BFo62mj2Vd7WPtRb8Xe0ZXNQpAhF1G6
 OlNONF75e4jqvmvNuS/s9Q3eGlIyNecbWxX/gdRvTITApjATWpbE5cigzT05C1ajbXvW
 lx/bdBkskR+/6XZrJvJHuJOr4D91wGu+14009SpQ6j3AjyJJYv0BrMYmY85ziCEV+6Pg
 lw/CEkOlqjhzTKzVncer4Ye6xrNEMW00J4kh1X0GzcsSgN+GMXA1VSAgyyMHQq+A4zx8
 o+TQ==
X-Gm-Message-State: AOJu0YzjoZqUe/DmOBVUBM+ZHCO/bcCjwFaSIUvsimUa7Mw89s95N11+
 kKuK75SGQZQ2KxDZaQq+ObvhuQ3Q5qVHohZzQXvzdhqXj3KUsqXpF5H/IB7JRGt1WkLVU3yGFjo
 Mowl78lAjQQ==
X-Gm-Gg: AfdE7cnObGfqHIN8oG5tOBRgvV8sEaxQFk33zX601+Dbex6D810J3+T9G26dLRzWyai
 2JNSMXCZeFRv9gvaY/1zjB49+QZDCLsXPHWSgvNyy3xhES3DwLW4vXXgz+gpTsY1C9Wd9OYqajD
 Un586s51xmPN1+Hl1BCts2L9Gr2DI/uTGWwXgNYLhu1Uqmwg9Q22pu4AxwT8Dc7NOOd3VQKACnU
 sp7t0B9qGFrQYh3A2Pf0dlSZgtfkOrGKpLMgFi0R+qZTlOkRr35UaocCqI4XQ6AMxnE9gofWkaV
 WPrept3PtDyJr7N0oCA4hkr/PbyCYGGvL7xuobWDuX52AZpFYK0gwDx2l4Lr2gOpQdAL0PR2J/a
 ZgyCU2x8dtLAWxep8PXoB5w5tTAgiLdYqaDs8PuxFkmzpZdaJRnTuJrldzGTfHa6v5j22MvsdtB
 ASnZguAIzv/8v+sGUBs7lgWdG9U4HfwYLsCko4LwEnCThZ1n6vAa/7/mlGaB2zqmGRIAuucFUdY
 jN6rLAos+BeopT1ON8QEeEio8jXigmf
X-Received: by 2002:a05:6000:240c:b0:46e:6210:ad4a with SMTP id
 ffacd0b85a97d-47757e57e77mr10943105f8f.5.1783017630044; 
 Thu, 02 Jul 2026 11:40:30 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a4a09sm11628213f8f.13.2026.07.02.11.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 11:40:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/11] target/arm: Pull VFP "can we use D16-D31" checks out
 into a function
Date: Thu,  2 Jul 2026 19:40:18 +0100
Message-ID: <20260702184019.3431139-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702184019.3431139-1-peter.maydell@linaro.org>
References: <20260702184019.3431139-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Currently we directly call dc_isar_feature(aa32_simd_r32, s) for VFP
insns that use D16-D31 to see if they should UNDEF.  For some v7A
CPUs (Cortex-A7, Cortex-A9) there is also a CPACR.D32DIS trap bit
that will make VFP (and only VFP, not Neon) insns using D16-D31
UNDEF.

Pull out a function vfp_d16_d31_ok() that currently just does the
feature check but which will provide us a place where we can make
this check.  Since D32DIS takes precedence over traps to EL2 and EL3
and simply makes the insns UNDEF, we are OK to do this early rather
than having to wait until vfp_access_check().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-vfp.c | 61 ++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/target/arm/tcg/translate-vfp.c b/target/arm/tcg/translate-vfp.c
index 4db4b14841..3d6c67efb9 100644
--- a/target/arm/tcg/translate-vfp.c
+++ b/target/arm/tcg/translate-vfp.c
@@ -207,6 +207,17 @@ static void gen_update_fp_context(DisasContext *s)
     }
 }
 
+/*
+ * Return true if a VFP insn is OK to access D16..D31, false if
+ * it should UNDEF. This checks whether the D16-D31 regs are
+ * implemented by the CPU. Eventually we will also check CPACR.D32DIS.
+ * Note that Neon insns accessing D16..D31 do not need to check D32DIS.
+ */
+static bool vfp_d16_d31_ok(DisasContext *s)
+{
+    return dc_isar_feature(aa32_simd_r32, s);
+}
+
 /*
  * Check that VFP access is enabled, A-profile specific version.
  *
@@ -347,7 +358,7 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
-    if (sz == 3 && !dc_isar_feature(aa32_simd_r32, s) &&
+    if (sz == 3 && !vfp_d16_d31_ok(s) &&
         ((a->vm | a->vn | a->vd) & 0x10)) {
         return false;
     }
@@ -473,7 +484,7 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
-    if (sz == 3 && !dc_isar_feature(aa32_simd_r32, s) &&
+    if (sz == 3 && !vfp_d16_d31_ok(s) &&
         ((a->vm | a->vd) & 0x10)) {
         return false;
     }
@@ -541,7 +552,7 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
-    if (sz == 3 && !dc_isar_feature(aa32_simd_r32, s) && (a->vm & 0x10)) {
+    if (sz == 3 && !vfp_d16_d31_ok(s) && (a->vm & 0x10)) {
         return false;
     }
 
@@ -662,7 +673,7 @@ static bool trans_VMOV_to_gp(DisasContext *s, arg_VMOV_to_gp *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
-    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vn & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && (a->vn & 0x10)) {
         return false;
     }
 
@@ -709,7 +720,7 @@ static bool trans_VMOV_from_gp(DisasContext *s, arg_VMOV_from_gp *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
-    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vn & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && (a->vn & 0x10)) {
         return false;
     }
 
@@ -745,7 +756,7 @@ static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
-    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vn & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && (a->vn & 0x10)) {
         return false;
     }
 
@@ -1030,7 +1041,7 @@ static bool trans_VMOV_64_dp(DisasContext *s, arg_VMOV_64_dp *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
-    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vm & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && (a->vm & 0x10)) {
         return false;
     }
 
@@ -1132,7 +1143,7 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
-    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vd & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && (a->vd & 0x10)) {
         return false;
     }
 
@@ -1261,7 +1272,7 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
-    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vd + n) > 16) {
+    if (!vfp_d16_d31_ok(s) && (a->vd + n) > 16) {
         return false;
     }
 
@@ -1513,7 +1524,7 @@ static bool do_vfp_3op_dp(DisasContext *s, VFPGen3OpDPFn *fn,
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
-    if (!dc_isar_feature(aa32_simd_r32, s) && ((vd | vn | vm) & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && ((vd | vn | vm) & 0x10)) {
         return false;
     }
 
@@ -1685,7 +1696,7 @@ static bool do_vfp_2op_dp(DisasContext *s, VFPGen2OpDPFn *fn, int vd, int vm)
     /* Note that the caller must check the aa32_fpdp_v2 feature. */
 
     /* UNDEF accesses to D16-D31 if they don't exist */
-    if (!dc_isar_feature(aa32_simd_r32, s) && ((vd | vm) & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && ((vd | vm) & 0x10)) {
         return false;
     }
 
@@ -2252,7 +2263,7 @@ static bool do_vfm_dp(DisasContext *s, arg_VFMA_dp *a, bool neg_n, bool neg_d)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) &&
+    if (!vfp_d16_d31_ok(s) &&
         ((a->vd | a->vn | a->vm) & 0x10)) {
         return false;
     }
@@ -2380,7 +2391,7 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) && (vd & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && (vd & 0x10)) {
         return false;
     }
 
@@ -2555,7 +2566,7 @@ static bool trans_VCMP_dp(DisasContext *s, arg_VCMP_dp *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) && ((a->vd | a->vm) & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && ((a->vd | a->vm) & 0x10)) {
         return false;
     }
 
@@ -2621,7 +2632,7 @@ static bool trans_VCVT_f64_f16(DisasContext *s, arg_VCVT_f64_f16 *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vd  & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && (a->vd  & 0x10)) {
         return false;
     }
 
@@ -2702,7 +2713,7 @@ static bool trans_VCVT_f16_f64(DisasContext *s, arg_VCVT_f16_f64 *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vm  & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && (a->vm  & 0x10)) {
         return false;
     }
 
@@ -2777,7 +2788,7 @@ static bool trans_VRINTR_dp(DisasContext *s, arg_VRINTR_dp *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) && ((a->vd | a->vm) & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && ((a->vd | a->vm) & 0x10)) {
         return false;
     }
 
@@ -2856,7 +2867,7 @@ static bool trans_VRINTZ_dp(DisasContext *s, arg_VRINTZ_dp *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) && ((a->vd | a->vm) & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && ((a->vd | a->vm) & 0x10)) {
         return false;
     }
 
@@ -2930,7 +2941,7 @@ static bool trans_VRINTX_dp(DisasContext *s, arg_VRINTX_dp *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) && ((a->vd | a->vm) & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && ((a->vd | a->vm) & 0x10)) {
         return false;
     }
 
@@ -2956,7 +2967,7 @@ static bool trans_VCVT_sp(DisasContext *s, arg_VCVT_sp *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vd & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && (a->vd & 0x10)) {
         return false;
     }
 
@@ -2982,7 +2993,7 @@ static bool trans_VCVT_dp(DisasContext *s, arg_VCVT_dp *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vm & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && (a->vm & 0x10)) {
         return false;
     }
 
@@ -3063,7 +3074,7 @@ static bool trans_VCVT_int_dp(DisasContext *s, arg_VCVT_int_dp *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vd & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && (a->vd & 0x10)) {
         return false;
     }
 
@@ -3100,7 +3111,7 @@ static bool trans_VJCVT(DisasContext *s, arg_VJCVT *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vm & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && (a->vm & 0x10)) {
         return false;
     }
 
@@ -3240,7 +3251,7 @@ static bool trans_VCVT_fix_dp(DisasContext *s, arg_VCVT_fix_dp *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vd & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && (a->vd & 0x10)) {
         return false;
     }
 
@@ -3369,7 +3380,7 @@ static bool trans_VCVT_dp_int(DisasContext *s, arg_VCVT_dp_int *a)
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) && (a->vm & 0x10)) {
+    if (!vfp_d16_d31_ok(s) && (a->vm & 0x10)) {
         return false;
     }
 
-- 
2.43.0


