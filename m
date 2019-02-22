Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7177895wrx;
        Fri, 22 Feb 2019 09:10:20 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYfOzpybl++c1w3GhxYD0BTzeQaVwpP6iM9g1CkgLmP/fRXzrM55wujdw1epN0fMqUTgoCh
X-Received: by 2002:a5b:447:: with SMTP id s7mr4062353ybp.168.1550855420414;
        Fri, 22 Feb 2019 09:10:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550855420; cv=none;
        d=google.com; s=arc-20160816;
        b=Vf9dxVp2tOIcSj/XrjXjvUBU8/+3xmgmprlhNpzN/3dRRHoX13qMF82AdCfxgi7WfZ
         QnPURQA/ekJ8Ah86xUPARQXtbX0kNkCuWvtx6S7M2pTVfv2de+aVzD7qDvjRCejWKxJ7
         5MFoCuM+VumLMJb8ZGKTb23aABB/pB4GUGMtyBhHBvL1Je8KOrWvjTG8b63jZo0KHp09
         wRjE/P0HVQ1nlmBgm51RFJQZCvEaGilTr3bTIm6AAQuew/chVJjcMVpI02+1yxbXG7+F
         PyRbQgSbwfnxaQm8mGqE5p4UHg4dJRDbXvOBvLqNSlj7+ALStM6/qd3aCuz8jOnIT5Sr
         wd3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=LSf6wMGuBH8QT8k3geTNSuEE3goVFyvjOV9Q7bW9yHI=;
        b=ddQH/MIVm5uJkQYT3dlPYhkRSFVdhzFUx3ONXVSFQndhrdf6fH9Smy8HqC3QOLLGAz
         TRUhujTSRj9YLas8AKVZiTKxtBNxrPgad0ayl+tSQX3NJiyzvssit9Q47kcnN8k0aGd2
         KaOY86rORWY87vu//eAeaKTtM88GMVBhoy2aFjRE7DlKDyTeZFXUPmLKFTobJhZp6JmY
         KjiGqiC2a5kbxzsRWvrgm8V249lT4grLvCfuw7OZchTLm7JKhd2ZYsOooMYplI8Vi3ZX
         j3UYMBYVrJ0tNKAsl1YID8onzlASxi/fMh9zjxG2ZLuhOqOLaEFF7DDrEanSDSjhPK+h
         e6Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k184oxEW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b193si1185134yba.347.2019.02.22.09.10.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 09:10:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k184oxEW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxEL5-0006Hv-Oe
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 12:10:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gxEKu-0006Hh-Nd
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 12:10:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gxEKt-0001db-Dq
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 12:10:08 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35067)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gxEKp-0000rT-JP
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 12:10:05 -0500
Received: by mail-wr1-x444.google.com with SMTP id t18so3175859wrx.2
	for <qemu-arm@nongnu.org>; Fri, 22 Feb 2019 09:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LSf6wMGuBH8QT8k3geTNSuEE3goVFyvjOV9Q7bW9yHI=;
	b=k184oxEWXLgCRcouKw1Lqn1DHxWsY05ADQddz7TJ3+1xbcpRCRNckRImt6XjYy4tx+
	AeOaguTvR0hfZd/BogybMzoifqpySOp3u7kGlImkT/SK2wwz7Npq9Phen8L2KeuQrVUU
	k0A3IlKZTVO6xbR4pLneq0+FkERPbXJTKVTvIBT/mBw/hm9V4rNU9spzeYeKW9G1pbTx
	AJiimFzTFU4RhrymdQ42Li913FirwtYK0O8+sPsodzs8I0WCgjhowBep5nA0/dOtIqL0
	zOnw3KzuEwrGre0zsnV+cQ9YWWoJ54vJdDdQL/lNUWuxMaMgqOn4i682gYrATleIfmUF
	zbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LSf6wMGuBH8QT8k3geTNSuEE3goVFyvjOV9Q7bW9yHI=;
	b=qChkosScPnnftxJbGRSOV1fLUHSVT1fpVjsLkkuEafDGQHVUuiWJQKnpifjwYayCvq
	MSdM4sRDW1RSNs0NkA6q1Orfjait9RSBTYRKMURkYckowlgJu86tTSAyDIyk+kn0bkQ3
	BbpsX+q+qAoduK4rcQXQTrWRwSHSV1MSYfa2ydW+GcrYhbF2bzTKIU9c5Mhb0vFYBopf
	+1nXh7lA79UmWvGLRlbABwz/n1MBmuwaqG0aSWMHubi3XkjVbJ+x5yu/yandJWt4V5Q2
	wmDZlP6pJFMbRubsGdvG3Aurkm7mfw0vZ/uaITCrtmO9OpYRLSZ/ok2aeZ7n6hpjvMGR
	Rmrw==
X-Gm-Message-State: AHQUAua/NQ5dyvERPgUYlF7R+cNE5HUKnwqLrQ/zWWf3pRbOApFqejxu
	34Jhw2elcQghEJdA4B6/cix+KX4FAVc=
X-Received: by 2002:a05:6000:92:: with SMTP id
	m18mr3668638wrx.258.1550855380089; 
	Fri, 22 Feb 2019 09:09:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id f6sm2829077wrt.87.2019.02.22.09.09.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 09:09:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Feb 2019 17:09:35 +0000
Message-Id: <20190222170936.13268-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190222170936.13268-1-peter.maydell@linaro.org>
References: <20190222170936.13268-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 1/2] target/arm: Use MVFR1 feature bits to gate
 A32/T32 FP16 instructions
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AznFsRtciKz2

Instead of gating the A32/T32 FP16 conversion instructions on
the ARM_FEATURE_VFP_FP16 flag, switch to our new approach of
looking at ID register bits. In this case MVFR1 fields FPHP
and SIMDHP indicate the presence of these insns.

This change doesn't alter behaviour for any of our CPUs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 37 ++++++++++++++++++++++++++++++++++++-
 target/arm/cpu.c       |  2 --
 target/arm/kvm32.c     |  3 ---
 target/arm/translate.c | 26 ++++++++++++++++++--------
 4 files changed, 54 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1eea1a408b8..36ea3b58567 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1730,6 +1730,27 @@ FIELD(ID_DFR0, MPROFDBG, 20, 4)
 FIELD(ID_DFR0, PERFMON, 24, 4)
 FIELD(ID_DFR0, TRACEFILT, 28, 4)
 
+FIELD(MVFR0, SIMDREG, 0, 4)
+FIELD(MVFR0, FPSP, 4, 4)
+FIELD(MVFR0, FPDP, 8, 4)
+FIELD(MVFR0, FPTRAP, 12, 4)
+FIELD(MVFR0, FPDIVIDE, 16, 4)
+FIELD(MVFR0, FPSQRT, 20, 4)
+FIELD(MVFR0, FPSHVEC, 24, 4)
+FIELD(MVFR0, FPROUND, 28, 4)
+
+FIELD(MVFR1, FPFTZ, 0, 4)
+FIELD(MVFR1, FPDNAN, 4, 4)
+FIELD(MVFR1, SIMDLS, 8, 4)
+FIELD(MVFR1, SIMDINT, 12, 4)
+FIELD(MVFR1, SIMDSP, 16, 4)
+FIELD(MVFR1, SIMDHP, 20, 4)
+FIELD(MVFR1, FPHP, 24, 4)
+FIELD(MVFR1, SIMDFMAC, 28, 4)
+
+FIELD(MVFR2, SIMDMISC, 0, 4)
+FIELD(MVFR2, FPMISC, 4, 4)
+
 QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <= R_V7M_CSSELR_INDEX_MASK);
 
 /* If adding a feature bit which corresponds to a Linux ELF
@@ -1747,7 +1768,6 @@ enum arm_features {
     ARM_FEATURE_THUMB2,
     ARM_FEATURE_PMSA,   /* no MMU; may have Memory Protection Unit */
     ARM_FEATURE_VFP3,
-    ARM_FEATURE_VFP_FP16,
     ARM_FEATURE_NEON,
     ARM_FEATURE_M, /* Microcontroller profile.  */
     ARM_FEATURE_OMAPCP, /* OMAP specific CP15 ops handling.  */
@@ -3293,6 +3313,21 @@ static inline bool isar_feature_aa32_fp16_arith(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, FP) == 1;
 }
 
+/*
+ * We always set the FP and SIMD FP16 fields to indicate identical
+ * levels of support (assuming SIMD is implemented at all), so
+ * we only need one set of accessors.
+ */
+static inline bool isar_feature_aa32_fp16_spconv(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->mvfr1, MVFR1, FPHP) > 0;
+}
+
+static inline bool isar_feature_aa32_fp16_dpconv(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->mvfr1, MVFR1, FPHP) > 1;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4d7f6a3bc0c..a3baf4eeed1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1014,7 +1014,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
     if (arm_feature(env, ARM_FEATURE_VFP4)) {
         set_feature(env, ARM_FEATURE_VFP3);
-        set_feature(env, ARM_FEATURE_VFP_FP16);
     }
     if (arm_feature(env, ARM_FEATURE_VFP3)) {
         set_feature(env, ARM_FEATURE_VFP);
@@ -1675,7 +1674,6 @@ static void cortex_a9_initfn(Object *obj)
     cpu->dtb_compatible = "arm,cortex-a9";
     set_feature(&cpu->env, ARM_FEATURE_V7);
     set_feature(&cpu->env, ARM_FEATURE_VFP3);
-    set_feature(&cpu->env, ARM_FEATURE_VFP_FP16);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index a75e04cc8f3..327375f6252 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -125,9 +125,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     if (extract32(id_pfr0, 12, 4) == 1) {
         set_feature(&features, ARM_FEATURE_THUMB2EE);
     }
-    if (extract32(ahcf->isar.mvfr1, 20, 4) == 1) {
-        set_feature(&features, ARM_FEATURE_VFP_FP16);
-    }
     if (extract32(ahcf->isar.mvfr1, 12, 4) == 1) {
         set_feature(&features, ARM_FEATURE_NEON);
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c1175798ac9..b7702fb49f7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3663,17 +3663,27 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                      * UNPREDICTABLE if bit 8 is set prior to ARMv8
                      * (we choose to UNDEF)
                      */
-                    if ((dp && !arm_dc_feature(s, ARM_FEATURE_V8)) ||
-                        !arm_dc_feature(s, ARM_FEATURE_VFP_FP16)) {
-                        return 1;
+                    if (dp) {
+                        if (!dc_isar_feature(aa32_fp16_dpconv, s)) {
+                            return 1;
+                        }
+                    } else {
+                        if (!dc_isar_feature(aa32_fp16_spconv, s)) {
+                            return 1;
+                        }
                     }
                     rm_is_dp = false;
                     break;
                 case 0x06: /* vcvtb.f16.f32, vcvtb.f16.f64 */
                 case 0x07: /* vcvtt.f16.f32, vcvtt.f16.f64 */
-                    if ((dp && !arm_dc_feature(s, ARM_FEATURE_V8)) ||
-                        !arm_dc_feature(s, ARM_FEATURE_VFP_FP16)) {
-                        return 1;
+                    if (dp) {
+                        if (!dc_isar_feature(aa32_fp16_dpconv, s)) {
+                            return 1;
+                        }
+                    } else {
+                        if (!dc_isar_feature(aa32_fp16_spconv, s)) {
+                            return 1;
+                        }
                     }
                     rd_is_dp = false;
                     break;
@@ -7876,7 +7886,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     TCGv_ptr fpst;
                     TCGv_i32 ahp;
 
-                    if (!arm_dc_feature(s, ARM_FEATURE_VFP_FP16) ||
+                    if (!dc_isar_feature(aa32_fp16_spconv, s) ||
                         q || (rm & 1)) {
                         return 1;
                     }
@@ -7908,7 +7918,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 {
                     TCGv_ptr fpst;
                     TCGv_i32 ahp;
-                    if (!arm_dc_feature(s, ARM_FEATURE_VFP_FP16) ||
+                    if (!dc_isar_feature(aa32_fp16_spconv, s) ||
                         q || (rd & 1)) {
                         return 1;
                     }
-- 
2.20.1

