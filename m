Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1249266wrq;
        Fri, 22 Jun 2018 13:33:19 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLW5Xpqd6+XNOaCPsQxMXEcw393iJnSGGNOzj2rUOqhFRArVY6gGpBue4djgWCA+GtL4wzH
X-Received: by 2002:a37:32cd:: with SMTP id y196-v6mr2662274qky.431.1529699599506;
        Fri, 22 Jun 2018 13:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529699599; cv=none;
        d=google.com; s=arc-20160816;
        b=FKzukNpiA0M4gK5qUgH7n3FI8p5peW05T0LPMRJJ5KOZStqDl07I1Ws2UeNZEfCGou
         qFq/t13UbZPCRRTs6xTVObFUqnTbCSSeYGZ5mHKFOvw/DI6LDWBI80GQ+QCPLB8CcZ7V
         oD7KVJ7O7mJlm+E21Tz4oGN33MnSlPoPzmPDl+r73JsoLQYvOkrFPh9kijDMDsZcdj41
         aHMXSUf+d5uYj2xSvStK4FsTdbW0A48rmecHxub3NgdkG64xmZCPtrnfnCfUgqk6mTMg
         /6Esp4IXSogdMIKW6LBeTK7iS3/qNBnHmqAs6xn5pA1De2pPt1JuzVpkdrfBMslJrJue
         35fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=ARBBB9jMp8eg+HsuSaBve5So0tK8pjAYZwtSsGCpM5E=;
        b=Mgo4K0XFfSdyb9nc5ch9lwGipvmb0GbGsBYJ5FeDuMRSvgQmn6J9sYHQ3WVo8VZW0X
         dsEG889IsvPogv5OtWJZaOryuRzDt2XYK65EmY/p4a2lAZuNXF+C5KymF2ZvOQW7SaaO
         r0NAxmtSlEuMh7qpTE6tCSgLd3hQCHslKmk0Hz6L6WoScPe+ISiubkxme1zHUXWYOQt1
         OttA69glRBIaZ0EfwH9yqkokcoH1qXOs0ypNLW6bATJ+cgNoVUksFeNewYbIAN2LDK0/
         LdlObnw7TrqP/S23B4CEadWbPkOaMEE03g6Laj0Ob4rPSweTbwTbxb9UN5JcgPjeSJ2N
         op5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=WmJecBEg;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=QxI1KYTx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s1-v6si8132242qte.304.2018.06.22.13.33.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 13:33:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=WmJecBEg;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=QxI1KYTx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWSkB-0002SM-1S
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 16:33:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjb-00026W-2g
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1fWSjZ-0005Q8-DU
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 16:32:43 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45352)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1fWSjZ-0005Pk-54; Fri, 22 Jun 2018 16:32:41 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 3A34E60714; Fri, 22 Jun 2018 20:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699560;
	bh=XTmuX2iM+99Gb7/BTmleRvZIMQ5tShdo/3KBsIlV7Ec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WmJecBEgb38NWb9QNpvSDcZcOG/qrpp/LCRq3UvdTsKWcKqpSjSZnxcfawFMELGjU
	aFjhR6UU9i5bh1ZA2cBEkIg6WW0kl9kNVfR3FeK9LTgq5B5bXbEaERylmazxDBZOz+
	RBZ40yqeir0NJt54896a6zykIKcIkEM+cxsKvvUw=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 37B7A60B18;
	Fri, 22 Jun 2018 20:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1529699559;
	bh=XTmuX2iM+99Gb7/BTmleRvZIMQ5tShdo/3KBsIlV7Ec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QxI1KYTx+Tu5aDrC1LFgHsgtICcY+6JR6RP2zADhzQj/Buwj7rySpuaSq9plCV04V
	EWQ1p1yDeqhhwyNjXofMva2RnCQNn/F+JKxEEqMFH+G1AQjUzMucnr9mXEjuLhZI2J
	WMxLYzPWJ4Ot3L8m0TzlHabsHI5Kxo5DyAqIqcOE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37B7A60B18
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 22 Jun 2018 16:32:18 -0400
Message-Id: <1529699547-17044-5-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v5 04/13] target/arm: Add ARM_FEATURE_V7VE for v7
 Virtualization Extensions
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XurcOYkOEnrZ

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c   | 21 ++++++++++++++-------
 target/arm/cpu.h   |  1 +
 target/arm/kvm32.c |  8 ++++----
 3 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 08ce1bc..98790b1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -793,9 +793,20 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
     /* Some features automatically imply others: */
     if (arm_feature(env, ARM_FEATURE_V8)) {
-        set_feature(env, ARM_FEATURE_V7);
+        set_feature(env, ARM_FEATURE_V7VE);
+    }
+    if (arm_feature(env, ARM_FEATURE_V7VE)) {
+        /* v7 Virtualization Extensions. In real hardware this implies
+         * EL2 and also the presence of the Security Extensions.
+         * For QEMU, for backwards-compatibility we implement some
+         * CPUs or CPU configs which have no actual EL2 or EL3 but do
+         * include the various other features that V7VE implies.
+         * Presence of EL2 itself is ARM_FEATURE_EL2, and of the
+         * Security Extensions is ARM_FEATURE_EL3.
+         */
         set_feature(env, ARM_FEATURE_ARM_DIV);
         set_feature(env, ARM_FEATURE_LPAE);
+        set_feature(env, ARM_FEATURE_V7);
     }
     if (arm_feature(env, ARM_FEATURE_V7)) {
         set_feature(env, ARM_FEATURE_VAPA);
@@ -1509,15 +1520,13 @@ static void cortex_a7_initfn(Object *obj)
     ARMCPU *cpu = ARM_CPU(obj);
 
     cpu->dtb_compatible = "arm,cortex-a7";
-    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_V7VE);
     set_feature(&cpu->env, ARM_FEATURE_VFP4);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_ARM_DIV);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_LPAE);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A7;
     cpu->midr = 0x410fc075;
@@ -1554,15 +1563,13 @@ static void cortex_a15_initfn(Object *obj)
     ARMCPU *cpu = ARM_CPU(obj);
 
     cpu->dtb_compatible = "arm,cortex-a15";
-    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_V7VE);
     set_feature(&cpu->env, ARM_FEATURE_VFP4);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_ARM_DIV);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_LPAE);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
     cpu->midr = 0x412fc0f1;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 800c4ec..852743b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1474,6 +1474,7 @@ enum arm_features {
     ARM_FEATURE_OMAPCP, /* OMAP specific CP15 ops handling.  */
     ARM_FEATURE_THUMB2EE,
     ARM_FEATURE_V7MP,    /* v7 Multiprocessing Extensions */
+    ARM_FEATURE_V7VE, /* v7 Virtualization Extensions (non-EL2 parts) */
     ARM_FEATURE_V4T,
     ARM_FEATURE_V5,
     ARM_FEATURE_STRONGARM,
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 1740cda..fb9ea37 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -98,12 +98,12 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     /* Now we've retrieved all the register information we can
      * set the feature bits based on the ID register fields.
      * We can assume any KVM supporting CPU is at least a v7
-     * with VFPv3, LPAE and the generic timers; this in turn implies
-     * most of the other feature bits, but a few must be tested.
+     * with VFPv3, virtualization extensions, and the generic
+     * timers; this in turn implies most of the other feature
+     * bits, but a few must be tested.
      */
-    set_feature(&features, ARM_FEATURE_V7);
+    set_feature(&features, ARM_FEATURE_V7VE);
     set_feature(&features, ARM_FEATURE_VFP3);
-    set_feature(&features, ARM_FEATURE_LPAE);
     set_feature(&features, ARM_FEATURE_GENERIC_TIMER);
 
     switch (extract32(id_isar0, 24, 4)) {
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

