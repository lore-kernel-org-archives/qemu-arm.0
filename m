Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4762546wrg;
        Thu, 6 Jun 2019 11:02:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxBu8Ne7mUQ8iBzVcF8W6hKerb1rtEx5EivXpJE2AtyC36cfCdJrXXJK+KWwqKmtsVrCIcf
X-Received: by 2002:a37:9ac9:: with SMTP id c192mr39818674qke.30.1559844155065;
        Thu, 06 Jun 2019 11:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559844155; cv=none;
        d=google.com; s=arc-20160816;
        b=Bv52QrTCjVq7+Ft0JSAqAWc9u2XQQgPJKG7sWup/uUdXHkPcsmItZ0gZBuRg1JkUy1
         6eS3bNcCIZmaUrVASI8dUzKihxdZy2Z7XqAKXLJlQq6B1Uv4qSOa1bk/j8vyPsWRibwP
         rHoNG532PCTgcDtbiIUfgy2JDLjnzKyLij71Q3gDxZvjVS0CCqQNYIRlR72RiyFN3s9Q
         2U1uv/CBFEKDtTt3f0OKxzP6Z/HGYfxTfwdGv5BlGvx8M68+V/305LHfrOLKD0gx1U5D
         vXPMiTKA/wnJs5R7gKDIVsj971q//dy5Xmal9nvFhSlCse9zUu8chCsgGanqOtyfii8r
         8kiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ELVX9mpiICAoImlyrSnIvE4rv+CnGilnkJ9v9OB0C0U=;
        b=SL4vEgoqGwPgpUd/gV+Jh18GtHrtuEgH+1zk5FzRwo9shfpWi1TGBec7zORALjgvQ3
         fPhVKn714hYaZKJ0YQikIkVcy3ixGcmdpluk+TspXm0bOh7ye7WG96DbFCf9V59WkXyh
         qTtg+ywpRE0esstoH8heSaQzUAqwKOaFz67d3al8iNqXAXoU0opjWm1gmmdaQD1qt3pv
         Fs5GL6hBhlUS/YFdpArNsaQPJD+9jgC/AYIq9D29h4rrbyC7eVMzLdUsqfB1j1hi4QhN
         qHJdeDGZDjc0BidbYqED8pspaeBWxckloLJJy5Aztg0nUNOSqTpmy3EEwCrxcPr2ORsz
         nRhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MIInXsNN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d186si2534294qke.252.2019.06.06.11.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 11:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MIInXsNN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36131 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwig-0002xc-Ef
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 14:02:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwU6-0004Sm-LE
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwU4-00046K-2x
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:29 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52742)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwU2-0003HE-MQ
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 13:47:27 -0400
Received: by mail-wm1-x342.google.com with SMTP id s3so804080wms.2
	for <qemu-arm@nongnu.org>; Thu, 06 Jun 2019 10:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ELVX9mpiICAoImlyrSnIvE4rv+CnGilnkJ9v9OB0C0U=;
	b=MIInXsNNAaSFb6PofaMJwA4MeJu+v0IyO8pnsEA+M818y01TKkItqztMPaChV733Tx
	nJnksToTB+tP4YsNp5YBG+bBOidrgHWuqkbZz2wdxe8Q5KMXidlb9WqOj+efaaiGo6gq
	KG/LwmsdYVqkUKEUi4tBnWK50qSQ2U5EFh+B7TCWc2zj7AZEetOts2SCGV23ZW0sF65G
	wnno0WnOeMvKmMnLwr/OnaZdOMv329VKP4N/q/5QE9zyFX2pDoGRUUi02wgg4EtwYDao
	hFrKCZbHKxuDLVNsBPcI8jWyg+RtcUHao+KxFKRMNwhu1e7wUZnroslZZ1aSUXj8JrDX
	iomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ELVX9mpiICAoImlyrSnIvE4rv+CnGilnkJ9v9OB0C0U=;
	b=j2s2ABHCZr4X2TVIfsAPYDStktuZ8g0o5V+h8n8oGeMD8P3WMJTxfciJQT1R2weeh1
	YYynTTZ0MTBn0Qw5iUYEsE2E2bzoeQY1Ohz5NecNawqQef2lO7QBjwPOA6naEVxt8X1F
	rLLzz450bT4S77LB0DyABx1cIgvslqnBh3kiJAWuJs+CckNeIugfVjFN6fIOPXQQnypc
	OLMQg60m18Dlk0SkX9wnaY2VgRng60FhUT9IGHPawuftCL4Qzq2W7XwJoP1pJmxGD5w9
	1ZhRIqq1ytEBSiJvGSD7wR+TfZwFJSQqUiS/aiGMf9hLpvTg5ydAR/nmQ9pHVVC2CLRY
	l7cA==
X-Gm-Message-State: APjAAAVRgSgBX+vICjToELKc9ZuicCBW49dtkDGNgNDkOgeIt39faAdR
	Ctgrv7nFFvj3gLWzmLNQxtEuf1zeIfArzQ==
X-Received: by 2002:a7b:cb48:: with SMTP id v8mr803177wmj.108.1559843208078;
	Thu, 06 Jun 2019 10:46:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:46:00 +0100
Message-Id: <20190606174609.20487-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH 33/42] target/arm: Convert VFP comparison insns
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
X-TUID: Z/nROc8ps6C9

Convert the VFP comparison instructions to decodetree.

Note that comparison instructions should not honour the VFP
short-vector length and stride information: they are scalar-only
operations.  This applies to all the 2-operand instructions except
for VMOV, VABS, VNEG and VSQRT.  (In the old decoder this is
implemented via the "if (op == 15 && rn > 3) { veclen = 0; }" check.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 67 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c         | 51 +-------------------------
 target/arm/vfp.decode          |  5 +++
 3 files changed, 73 insertions(+), 50 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index a7e4ae31985..872b01621cc 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1938,3 +1938,70 @@ static bool trans_VSQRT_dp(DisasContext *s, arg_VSQRT_dp *a)
 {
     return do_vfp_2op_dp(s, gen_VSQRT_dp, a->vd, a->vm);
 }
+
+static bool trans_VCMP_sp(DisasContext *s, arg_VCMP_sp *a)
+{
+    TCGv_i32 vd, vm;
+
+    /* Vm/M bits must be zero for the Z variant */
+    if (a->z && a->vm != 0) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vd = tcg_temp_new_i32();
+    vm = tcg_temp_new_i32();
+
+    neon_load_reg32(vd, a->vd);
+    if (a->z) {
+        tcg_gen_movi_i32(vm, 0);
+    } else {
+        neon_load_reg32(vm, a->vm);
+    }
+
+    if (a->e) {
+        gen_helper_vfp_cmpes(vd, vm, cpu_env);
+    } else {
+        gen_helper_vfp_cmps(vd, vm, cpu_env);
+    }
+    return true;
+}
+
+static bool trans_VCMP_dp(DisasContext *s, arg_VCMP_dp *a)
+{
+    TCGv_i64 vd, vm;
+
+    /* Vm/M bits must be zero for the Z variant */
+    if (a->z && a->vm != 0) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    vd = tcg_temp_new_i64();
+    vm = tcg_temp_new_i64();
+
+    neon_load_reg64(vd, a->vd);
+    if (a->z) {
+        tcg_gen_movi_i64(vm, 0);
+    } else {
+        neon_load_reg64(vm, a->vm);
+    }
+
+    if (a->e) {
+        gen_helper_vfp_cmped(vd, vm, cpu_env);
+    } else {
+        gen_helper_vfp_cmpd(vd, vm, cpu_env);
+    }
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 639e0f5f91e..26994e0d427 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1390,30 +1390,6 @@ static inline void gen_vfp_neg(int dp)
         gen_helper_vfp_negs(cpu_F0s, cpu_F0s);
 }
 
-static inline void gen_vfp_cmp(int dp)
-{
-    if (dp)
-        gen_helper_vfp_cmpd(cpu_F0d, cpu_F1d, cpu_env);
-    else
-        gen_helper_vfp_cmps(cpu_F0s, cpu_F1s, cpu_env);
-}
-
-static inline void gen_vfp_cmpe(int dp)
-{
-    if (dp)
-        gen_helper_vfp_cmped(cpu_F0d, cpu_F1d, cpu_env);
-    else
-        gen_helper_vfp_cmpes(cpu_F0s, cpu_F1s, cpu_env);
-}
-
-static inline void gen_vfp_F1_ld0(int dp)
-{
-    if (dp)
-        tcg_gen_movi_i64(cpu_F1d, 0);
-    else
-        tcg_gen_movi_i32(cpu_F1s, 0);
-}
-
 #define VFP_GEN_ITOF(name) \
 static inline void gen_vfp_##name(int dp, int neon) \
 { \
@@ -3091,6 +3067,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             case 15:
                 switch (rn) {
                 case 0 ... 3:
+                case 8 ... 11:
                     /* Already handled by decodetree */
                     return 1;
                 default:
@@ -3135,11 +3112,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                     rd_is_dp = false;
                     break;
 
-                case 0x08: case 0x0a: /* vcmp, vcmpz */
-                case 0x09: case 0x0b: /* vcmpe, vcmpez */
-                    no_output = true;
-                    break;
-
                 case 0x0c: /* vrintr */
                 case 0x0d: /* vrintz */
                 case 0x0e: /* vrintx */
@@ -3240,14 +3212,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             /* Load the initial operands.  */
             if (op == 15) {
                 switch (rn) {
-                case 0x08: case 0x09: /* Compare */
-                    gen_mov_F0_vreg(dp, rd);
-                    gen_mov_F1_vreg(dp, rm);
-                    break;
-                case 0x0a: case 0x0b: /* Compare with zero */
-                    gen_mov_F0_vreg(dp, rd);
-                    gen_vfp_F1_ld0(dp);
-                    break;
                 case 0x14: /* vcvt fp <-> fixed */
                 case 0x15:
                 case 0x16:
@@ -3357,19 +3321,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                         gen_vfp_msr(tmp);
                         break;
                     }
-                    case 8: /* cmp */
-                        gen_vfp_cmp(dp);
-                        break;
-                    case 9: /* cmpe */
-                        gen_vfp_cmpe(dp);
-                        break;
-                    case 10: /* cmpz */
-                        gen_vfp_cmp(dp);
-                        break;
-                    case 11: /* cmpez */
-                        gen_vfp_F1_ld0(dp);
-                        gen_vfp_cmpe(dp);
-                        break;
                     case 12: /* vrintr */
                     {
                         TCGv_ptr fpst = get_fpstatus_ptr(0);
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index b72ab8b8067..9db7aa7021a 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -176,3 +176,8 @@ VSQRT_sp     ---- 1110 1.11 0001 .... 1010 11.0 .... \
              vd=%vd_sp vm=%vm_sp
 VSQRT_dp     ---- 1110 1.11 0001 .... 1011 11.0 .... \
              vd=%vd_dp vm=%vm_dp
+
+VCMP_sp      ---- 1110 1.11 010 z:1 .... 1010 e:1 1.0 .... \
+             vd=%vd_sp vm=%vm_sp
+VCMP_dp      ---- 1110 1.11 010 z:1 .... 1011 e:1 1.0 .... \
+             vd=%vd_dp vm=%vm_dp
-- 
2.20.1

