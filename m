Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D525FD3776
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 17:38:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvIqV-0006YQ-FY; Wed, 25 Feb 2026 12:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3mjOfaQsKCNEzB8GBA81J5F3BB381.zB9D19H-xE9ABA3AH.BE3@flex--coltonlewis.bounces.google.com>)
 id 1vvIqR-0006WT-D0
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 12:38:43 -0500
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3mjOfaQsKCNEzB8GBA81J5F3BB381.zB9D19H-xE9ABA3AH.BE3@flex--coltonlewis.bounces.google.com>)
 id 1vvIqO-0003PR-On
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 12:38:43 -0500
Received: by mail-oo1-xc49.google.com with SMTP id
 006d021491bc7-679c448d15cso67087726eaf.3
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 09:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772041115; x=1772645915; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FxE+A5J4HGPNO2s3hfVFIukZ/uILKNBM11tjPpp3P/Y=;
 b=KVcYUFJq8j64SzyW99+xbRbhQxxk7EJbJj6WI+2T1p6UHgl6YlqZIccZm49IXt8J3q
 1Et/QLL9t5R82MC9T3skVPPFb+qbTJgQICksQIRCKVwDCcWKcdW19kpoe5AB7hawQBLB
 lUfdkJmVifaV6Ze8rlxzbETerCThoGhaNaJz9uRzJq4QugLM1k/wBut+hE2KruHQrP/r
 TeksxDEPMVVCZ3WeS/uLitCm+PvOmwpvF+mv+6DDxDzU+YwhLI+yv3gwq7gjbtR9z0E8
 QNtPFbq9n4yaIRkT4z7IUhRU+jzvAoSta4f3OffA9kQRNsDHZt8BCQvw//TVkYntlPpg
 35og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772041115; x=1772645915;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FxE+A5J4HGPNO2s3hfVFIukZ/uILKNBM11tjPpp3P/Y=;
 b=TD7lNyfXV6xAHNTaub/nl7D/LSdJ5gVI5L7S/NoV83hoFkxrgG89nGX0Uw+xsdAreb
 GKflRM8ai6a58H+ingP4cVHtsJAsEz4IpSWl9HEMhf35yN+XrkcaTX4P8DW1jK1kCBMW
 nETcISYK+gGm4zSw4AQMNprpc4MdNNSBGQe6XwPD4GmPLnbRs0e/rX3mOOc6dnlKd73l
 HoPBV8l2hCkHEaqPPnsRSNWToeH+lajBfwT64JaL2JnSHL82MHoT5eUg22kX/eGJbwa5
 UHyIfctRi+r5dfQ7bc6v+CNvXHXZX9sNzOITDNczkB+vDMUI9Thy80+Lb+gtNWqMQ3hw
 u0mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUubO3UWn4a6UpsV26P4dK1CtNwc/JEyPieeIdLK65+JtFk7IPK2XgLRDwNvj4HAWP1gmft7LZRRw==@nongnu.org
X-Gm-Message-State: AOJu0YyHcOamM3MJyFpVI7HjtkN7LpIe5oCUcEQuJ4qt2lpwPX9crJNw
 nVjru3Wbgv9ejZx0wE8p3irry5bEqFVGymf6+1j4sBkHSv6j2RCiKTfCjpMdX+IRRIttIS0xwMN
 E87xAiFjflsGEP6Zy7nGGOtfN2A==
X-Received: from ilbcf6.prod.google.com ([2002:a05:6e02:2306:b0:447:81b5:ae34])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a4a:b68a:0:b0:679:dcd7:fbe6 with SMTP id
 006d021491bc7-679dcd80797mr3115611eaf.31.1772041114890; 
 Wed, 25 Feb 2026 09:38:34 -0800 (PST)
Date: Wed, 25 Feb 2026 17:37:32 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225173732.3135526-1-coltonlewis@google.com>
Subject: [RFC PATCH] arm: enable PMU partitioning
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
 Shuah Khan <shuah@kernel.org>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
 kvmarm@lists.linux.dev, qemu-arm@nongnu.org, 
 Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c49;
 envelope-from=3mjOfaQsKCNEzB8GBA81J5F3BB381.zB9D19H-xE9ABA3AH.BE3@flex--coltonlewis.bounces.google.com;
 helo=mail-oo1-xc49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

This sets the vCPU device attribute to unconditionally enable
partitioning when a PMU is available on an ARM host.

Note that this patch is experimental to demonstrate the API. That is
why it aborts immediately if the call does not succeed.

For the call to succeed, the host must be running a kernel with the
ARM64 PMU Partitioning feature [1] and set the kernel command line
arm_pmuv3.reserved_host_counters=n where n is between 0 and the number
of counters on the system, inclusive.

[1] https://lore.kernel.org/kvmarm/20260209221414.2169465-1-coltonlewis@google.com/

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 hw/arm/virt.c                 |  1 +
 linux-headers/asm-arm64/kvm.h |  2 ++
 target/arm/kvm-stub.c         |  5 +++++
 target/arm/kvm.c              | 18 ++++++++++++++++++
 target/arm/kvm_arm.h          |  1 +
 5 files changed, 27 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 50865e8115..29082df31c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2234,6 +2234,7 @@ static void virt_post_cpus_gic_realized(VirtMachineState *vms,
                 if (kvm_irqchip_in_kernel()) {
                     kvm_arm_pmu_set_irq(ARM_CPU(cpu), VIRTUAL_PMU_IRQ);
                 }
+                kvm_arm_pmu_set_partition(ARM_CPU(cpu), true);
                 kvm_arm_pmu_init(ARM_CPU(cpu));
             }
             if (steal_time) {
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 46ffbddab5..69309a182e 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -424,6 +424,8 @@ enum {
 #define   KVM_ARM_VCPU_PMU_V3_FILTER		2
 #define   KVM_ARM_VCPU_PMU_V3_SET_PMU		3
 #define   KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS	4
+#define   KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION	5
+
 #define KVM_ARM_VCPU_TIMER_CTRL		1
 #define   KVM_ARM_VCPU_TIMER_IRQ_VTIMER		0
 #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1
diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index ea67deea52..afbfffe2cd 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -80,6 +80,11 @@ void kvm_arm_pmu_set_irq(ARMCPU *cpu, int irq)
     g_assert_not_reached();
 }
 
+void kvm_arm_pmu_set_partition(ARMCPU *cpu, bool partition)
+{
+    g_assert_not_reached();
+}
+
 void kvm_arm_pmu_init(ARMCPU *cpu)
 {
     g_assert_not_reached();
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ded582e0da..db1d564462 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1817,6 +1817,24 @@ void kvm_arm_pmu_set_irq(ARMCPU *cpu, int irq)
     }
 }
 
+void kvm_arm_pmu_set_partition(ARMCPU *cpu, bool partition)
+{
+    struct kvm_device_attr part_attr = {
+        .group = KVM_ARM_VCPU_PMU_V3_CTRL,
+        .attr = KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION,
+        .addr = (uint64_t)&partition
+    };
+
+    if (!cpu->has_pmu) {
+        return;
+    }
+
+    if (!kvm_arm_set_device_attr(cpu, &part_attr, "PMU partition")) {
+        error_report("failed to set PMU partition");
+        abort();
+    }
+}
+
 void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa)
 {
     struct kvm_device_attr attr = {
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index cc0b374254..2b55f2956e 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -248,6 +248,7 @@ int kvm_arm_vgic_probe(void);
 
 void kvm_arm_pmu_init(ARMCPU *cpu);
 void kvm_arm_pmu_set_irq(ARMCPU *cpu, int irq);
+void kvm_arm_pmu_set_partition(ARMCPU *cpu, bool partition);
 
 /**
  * kvm_arm_pvtime_init:

base-commit: afe653676dc6dfd49f0390239ff90b2f0052c2b8
-- 
2.53.0.414.gf7e9f6c205-goog


