Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2109961wrg;
        Fri, 17 May 2019 10:41:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybEv4OFCeuT/cNCruC1P2Mko48z1tMO+Y8Da1zoC7uQoW6z1IHZlvk5rLt/tK2Ei/yjfFi
X-Received: by 2002:a17:906:4244:: with SMTP id r4mr31341460ejl.211.1558114886849;
        Fri, 17 May 2019 10:41:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558114886; cv=none;
        d=google.com; s=arc-20160816;
        b=h80NwdRn4Yjobhaa+Sc1VhEOw7mUNaZKRAfV2I7i97Zy+qrdFBrzfgNckZmTYJJ8jL
         Mdr7DNKNZhY+CRLBj+gLH1/TPFhBMm1NjN0gd5Evw2d0/YYkDowd2cCdYhedThCeA8Qy
         pCh5Vi+nFk2EKM/qrnCpXSdtP3MrmKVgLc0KSxPu4YrvpnPLKhcjH/rkOtuXe/XFa63j
         OpJkJSKdd4tWRu3XIu/poIUTidmwlGZQEh6+LRzH9haCBMytEuGN08GKFIBCewxM4Lu9
         1cLjz1ryQQRLI5S4j3JjVNicBVYk2a/tSoV3xEeUvapmOqxvSHRWoqI+pipj78FiBbHL
         pzCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Qyh9QRofBjuXAYy2j4FsTuWpdCj9fZJCXoA469HqUHk=;
        b=ZK2YigX5ytaEmuHFI5frPWOdUTfRjmxt8KdDnuZPZC8le3KsuOXJ+Ci8+tr0t/qen5
         1kk7jFjA53JzGamaBJASiuP2GG/bE6QIdUpbaSFKL4BOpxv6Htibsux9wCEZ5qas+gIr
         ic5ECzwPLX+BHyYK5EfJwc/Hsm6KTAlxjVmgm6csb94+REgbf/2A5KuYV6fRMtjXdxks
         NvqxFz4KQ6wFcjLVAHEH9uegMAuIE/ApZ6rIfb7m+v2uIqMQGE9YZoC1f7RLnnlYlIeH
         NvemuedBHPr/lzODFr3GzcbAhHZQsoPmclv1NDinRtWMaTvZArSXTaozU86s5McrHLl/
         lrNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bsNKYk4R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i42si55782ede.114.2019.05.17.10.41.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 May 2019 10:41:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bsNKYk4R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:51712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRgrF-000812-Q6
	for alex.bennee@linaro.org; Fri, 17 May 2019 13:41:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRgqu-0007wN-Fm
	for qemu-arm@nongnu.org; Fri, 17 May 2019 13:41:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRgqq-0003DC-Qt
	for qemu-arm@nongnu.org; Fri, 17 May 2019 13:41:02 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hRgqo-0002vc-85
	for qemu-arm@nongnu.org; Fri, 17 May 2019 13:40:58 -0400
Received: by mail-wr1-x442.google.com with SMTP id c5so7956431wrs.11
	for <qemu-arm@nongnu.org>; Fri, 17 May 2019 10:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Qyh9QRofBjuXAYy2j4FsTuWpdCj9fZJCXoA469HqUHk=;
	b=bsNKYk4R/MBsNaGj2AZlQYTfBpoUNo5zdvxpGcorOY1dyNNvio7yaB1xh0wzIcsFgZ
	jznO5LYvWDwPEVPj5laOBYeSlGGT41fRcgJuB9g5NHTpHVjn9nvR8x2nMb5TFES/2bON
	hS51k/R3yPtK9ctNACuvio1IipK7cEuMdBtB9ZaY7ym1uJSjuVB5Isb7HLQ8aKcGH2Cj
	FENbFRGDS0YaAxe5fvYrawgxXg20IyjfOxDT37ab+T7dmtw8tC5IAhNoob7ot5Lv9d6q
	i+WtZwLj7C7iWBQU+ldSOv9PxkehKGK5K24Qw5OvrpPaY7MKD4tJZe+FTIBVu1ke76qZ
	OEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Qyh9QRofBjuXAYy2j4FsTuWpdCj9fZJCXoA469HqUHk=;
	b=Z2V8ws22VgARs6WT2AowOHa8M/QQibM1ofxu+gtGADDhJ2zJaR8qvzV59vn3DA++5f
	PCxXSVT6p16d9BPrADxQxtqLvPEKFauzeoedCJS8eNE5RSqG1iiuKhGdCXRzaNXIFsTQ
	KaXKJa4qAu3gcZezCfKSkyey7Z9mmcIUzgQlk+P5aImsJ9Mgy2YL7Wd6l1n1ykcGSFlc
	1gFUEDeFKelXOH0nsar+fsoQLy3W6NkFGta2Phcxcix5oBE9IxZqqn5gipsThA4cdMsH
	JNhWmNjPX55woaWiYTE4c+IQ9drA5ith858hhWu4Wukh1O2JTKaHQYptcAfgJ8MxpbvZ
	JZgg==
X-Gm-Message-State: APjAAAXn2w/h0CrA44/bdZ7bzWis84RSWm0YsX0jBjOt1VYPfyY+K/rB
	Gxzdii3EW2ltdX9aSKHZHXEv7L/32Co=
X-Received: by 2002:a5d:534b:: with SMTP id t11mr19267565wrv.297.1558114850121;
	Fri, 17 May 2019 10:40:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	y18sm5418641wmd.29.2019.05.17.10.40.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 10:40:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 17 May 2019 18:40:43 +0100
Message-Id: <20190517174046.11146-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190517174046.11146-1-peter.maydell@linaro.org>
References: <20190517174046.11146-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 1/4] target/arm: Allow VFP and Neon to be
 disabled via a CPU property
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a8lOw4j0qBJz

Allow VFP and neon to be disabled via a CPU property. As with
the "pmu" property, we only allow these features to be removed
from CPUs which have it by default, not added to CPUs which
don't have it.

The primary motivation here is to be able to optionally
create Cortex-M33 CPUs with no FPU, but we provide switches
for both VFP and Neon because the two interact:
 * AArch64 can't have one without the other
 * Some ID register fields only change if both are disabled

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h |   4 ++
 target/arm/cpu.c | 150 +++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 148 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 733b840a712..778fb293e7c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -797,6 +797,10 @@ struct ARMCPU {
     bool has_el3;
     /* CPU has PMU (Performance Monitor Unit) */
     bool has_pmu;
+    /* CPU has VFP */
+    bool has_vfp;
+    /* CPU has Neon */
+    bool has_neon;
 
     /* CPU has memory protection unit */
     bool has_mpu;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8eee1d8c59a..406fd360a2a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -763,6 +763,12 @@ static Property arm_cpu_cfgend_property =
 static Property arm_cpu_has_pmu_property =
             DEFINE_PROP_BOOL("pmu", ARMCPU, has_pmu, true);
 
+static Property arm_cpu_has_vfp_property =
+            DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
+
+static Property arm_cpu_has_neon_property =
+            DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
+
 static Property arm_cpu_has_mpu_property =
             DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
 
@@ -803,6 +809,13 @@ void arm_cpu_post_init(Object *obj)
     if (arm_feature(&cpu->env, ARM_FEATURE_M)) {
         set_feature(&cpu->env, ARM_FEATURE_PMSA);
     }
+    /* Similarly for the VFP feature bits */
+    if (arm_feature(&cpu->env, ARM_FEATURE_VFP4)) {
+        set_feature(&cpu->env, ARM_FEATURE_VFP3);
+    }
+    if (arm_feature(&cpu->env, ARM_FEATURE_VFP3)) {
+        set_feature(&cpu->env, ARM_FEATURE_VFP);
+    }
 
     if (arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
         arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO)) {
@@ -847,6 +860,27 @@ void arm_cpu_post_init(Object *obj)
                                  &error_abort);
     }
 
+    /*
+     * Allow user to turn off VFP and Neon support, but only for TCG --
+     * KVM does not currently allow us to lie to the guest about its
+     * ID/feature registers, so the guest always sees what the host has.
+     */
+    if (arm_feature(&cpu->env, ARM_FEATURE_VFP)) {
+        cpu->has_vfp = true;
+        if (!kvm_enabled()) {
+            qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_property,
+                                     &error_abort);
+        }
+    }
+
+    if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
+        cpu->has_neon = true;
+        if (!kvm_enabled()) {
+            qdev_property_add_static(DEVICE(obj), &arm_cpu_has_neon_property,
+                                     &error_abort);
+        }
+    }
+
     if (arm_feature(&cpu->env, ARM_FEATURE_PMSA)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property,
                                  &error_abort);
@@ -956,6 +990,116 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
+        cpu->has_vfp != cpu->has_neon) {
+        /*
+         * This is an architectural requirement for AArch64; AArch32 is
+         * more flexible and permits VFP-no-Neon and Neon-no-VFP.
+         */
+        error_setg(errp,
+                   "AArch64 CPUs must have both VFP and Neon or neither");
+        return;
+    }
+
+    if (!cpu->has_vfp) {
+        uint64_t t;
+        uint32_t u;
+
+        unset_feature(env, ARM_FEATURE_VFP);
+        unset_feature(env, ARM_FEATURE_VFP3);
+        unset_feature(env, ARM_FEATURE_VFP4);
+
+        t = cpu->isar.id_aa64isar1;
+        t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 0);
+        cpu->isar.id_aa64isar1 = t;
+
+        t = cpu->isar.id_aa64pfr0;
+        t = FIELD_DP64(t, ID_AA64PFR0, FP, 0xf);
+        cpu->isar.id_aa64pfr0 = t;
+
+        u = cpu->isar.id_isar6;
+        u = FIELD_DP32(u, ID_ISAR6, JSCVT, 0);
+        cpu->isar.id_isar6 = u;
+
+        u = cpu->isar.mvfr0;
+        u = FIELD_DP32(u, MVFR0, FPSP, 0);
+        u = FIELD_DP32(u, MVFR0, FPDP, 0);
+        u = FIELD_DP32(u, MVFR0, FPTRAP, 0);
+        u = FIELD_DP32(u, MVFR0, FPDIVIDE, 0);
+        u = FIELD_DP32(u, MVFR0, FPSQRT, 0);
+        u = FIELD_DP32(u, MVFR0, FPSHVEC, 0);
+        u = FIELD_DP32(u, MVFR0, FPROUND, 0);
+        cpu->isar.mvfr0 = u;
+
+        u = cpu->isar.mvfr1;
+        u = FIELD_DP32(u, MVFR1, FPFTZ, 0);
+        u = FIELD_DP32(u, MVFR1, FPDNAN, 0);
+        u = FIELD_DP32(u, MVFR1, FPHP, 0);
+        cpu->isar.mvfr1 = u;
+
+        u = cpu->isar.mvfr2;
+        u = FIELD_DP32(u, MVFR2, FPMISC, 0);
+        cpu->isar.mvfr2 = u;
+    }
+
+    if (!cpu->has_neon) {
+        uint64_t t;
+        uint32_t u;
+
+        unset_feature(env, ARM_FEATURE_NEON);
+
+        t = cpu->isar.id_aa64isar0;
+        t = FIELD_DP64(t, ID_AA64ISAR0, DP, 0);
+        cpu->isar.id_aa64isar0 = t;
+
+        t = cpu->isar.id_aa64isar1;
+        t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 0);
+        cpu->isar.id_aa64isar1 = t;
+
+        t = cpu->isar.id_aa64pfr0;
+        t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 0xf);
+        cpu->isar.id_aa64pfr0 = t;
+
+        u = cpu->isar.id_isar5;
+        u = FIELD_DP32(u, ID_ISAR5, RDM, 0);
+        u = FIELD_DP32(u, ID_ISAR5, VCMA, 0);
+        cpu->isar.id_isar5 = u;
+
+        u = cpu->isar.id_isar6;
+        u = FIELD_DP32(u, ID_ISAR6, DP, 0);
+        u = FIELD_DP32(u, ID_ISAR6, FHM, 0);
+        cpu->isar.id_isar6 = u;
+
+        u = cpu->isar.mvfr1;
+        u = FIELD_DP32(u, MVFR1, SIMDLS, 0);
+        u = FIELD_DP32(u, MVFR1, SIMDINT, 0);
+        u = FIELD_DP32(u, MVFR1, SIMDSP, 0);
+        u = FIELD_DP32(u, MVFR1, SIMDHP, 0);
+        u = FIELD_DP32(u, MVFR1, SIMDFMAC, 0);
+        cpu->isar.mvfr1 = u;
+
+        u = cpu->isar.mvfr2;
+        u = FIELD_DP32(u, MVFR2, SIMDMISC, 0);
+        cpu->isar.mvfr2 = u;
+    }
+
+    if (!cpu->has_neon && !cpu->has_vfp) {
+        uint64_t t;
+        uint32_t u;
+
+        t = cpu->isar.id_aa64isar0;
+        t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 0);
+        cpu->isar.id_aa64isar0 = t;
+
+        t = cpu->isar.id_aa64isar1;
+        t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 0);
+        cpu->isar.id_aa64isar1 = t;
+
+        u = cpu->isar.mvfr0;
+        u = FIELD_DP32(u, MVFR0, SIMDREG, 0);
+        cpu->isar.mvfr0 = u;
+    }
+
     /* Some features automatically imply others: */
     if (arm_feature(env, ARM_FEATURE_V8)) {
         if (arm_feature(env, ARM_FEATURE_M)) {
@@ -1016,12 +1160,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     if (arm_feature(env, ARM_FEATURE_V5)) {
         set_feature(env, ARM_FEATURE_V4T);
     }
-    if (arm_feature(env, ARM_FEATURE_VFP4)) {
-        set_feature(env, ARM_FEATURE_VFP3);
-    }
-    if (arm_feature(env, ARM_FEATURE_VFP3)) {
-        set_feature(env, ARM_FEATURE_VFP);
-    }
     if (arm_feature(env, ARM_FEATURE_LPAE)) {
         set_feature(env, ARM_FEATURE_V7MP);
         set_feature(env, ARM_FEATURE_PXN);
-- 
2.20.1

