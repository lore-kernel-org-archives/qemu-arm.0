Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2428652lfy;
        Fri, 7 Aug 2020 01:15:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySzW/GnLV3Hm7FfvPWqARQBwZ6CuSm9mkJxnXWHQhRYeueNBdvi6Xd1a1j/+OXoglUtsHL
X-Received: by 2002:a25:870a:: with SMTP id a10mr19801811ybl.257.1596788126688;
        Fri, 07 Aug 2020 01:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596788126; cv=none;
        d=google.com; s=arc-20160816;
        b=U4hj0TuRuzf+leBIJ46MfwCZ+/qKn79NAYbz0G2u3igoXP6udZnrOyrP6hFe3irXB1
         1A/XlgbLfTxsZlYDeE0zhWJ6wEtBAqe4ic7StS5z2m4m77r+N97Qtr44VOpI3jBwM4EW
         L6KD7JQWC7TC7wPxkw+DEiFGVd/hmNpvC6kLMRofj8PUAu6vYkKqEO33CD5yPCQPwcEG
         aPd5rhrFGfT4l4nW1UU42Kn1ZAuUeH01NUYdLEkaPzLyILbMNP8se0LjAM1jU+hm2tz4
         y+g53VUsShxGKrJjXD3R/SCSOV65CTgqByVf/z1kYVd+Wtb1LFLYK9k2804GXzdzvkgl
         XPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=k9EtU7qoqqVliH9xoeZ1LmKv9XpHBnu6eM6bbX8j8B0=;
        b=aE5cb3yWYdNLqMaBBrUdupWvP0qQFI7wgxiUmFovEqHZdE3gQhe0idL5ZIL/Sxy8dr
         615osEoaV/9BQ04l2O8nzqGGGIaUiN7aHu8EDNe9+WFC9D2zpxwDsCabsKN4bewWLmU1
         gPcqFhcLtRvrpeyd/7cVGYgOPiQ0UYmVhjWm6p51KjZoExbZN9IokmBY161MWn/V3N1A
         zsNvjyqoNh5LiYPWzwE4sv9yvFM7GfdKOBMTzag3LaoRg2rUV7tVO66FQn83n4QFbIML
         oo3AKq9Onua+aYwrMp4EBaDGyEy0tg/NPblBLVPq5+ACK3gN0ElEpX5C+5ac4wE5L7AO
         qCag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VzMK4AMM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si10179046ybt.339.2020.08.07.01.15.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Aug 2020 01:15:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VzMK4AMM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3xXB-0006zT-V8
	for alex.bennee@linaro.org; Fri, 07 Aug 2020 04:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k3xSj-0007Ai-H7
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 04:10:49 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:41474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1k3xSh-0001iK-1n
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 04:10:49 -0400
Received: by mail-io1-xd41.google.com with SMTP id g19so1058142ioh.8
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 01:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k9EtU7qoqqVliH9xoeZ1LmKv9XpHBnu6eM6bbX8j8B0=;
 b=VzMK4AMM03CD6piAtOty8shk2rqBueFuMKbQMQ5SH894nDPFSk29lmXvw14m2EaCBQ
 p3A3IlZVIpoHzA8alas/XC9te0eWHhxGv2KYtmrjBVJocsoh9O1x6vgmS9IvWY62Sl2a
 dCILYQce5J+E5OqrpyUbpcjoyJH+xDm+qV+bG/DZqIpIV1v11z2jUNmF8N+89HP312rh
 x6ikRBz/KFI848NbF2SMzthMbrrLm9sEHGRBfsQsMBkT/BxjgGNwO6Q1BEn7xWB5qQOA
 0xMO/UOLzSH+9N9zsAQAQ7a6gbmU7SLwsAIvxBLTou8YihLCQsfL5m4NisFiYpT+tcDF
 h2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k9EtU7qoqqVliH9xoeZ1LmKv9XpHBnu6eM6bbX8j8B0=;
 b=bjuiq5YhpXYXjGIqsYfktIiBxuIvIoJ3yqS6kJd+MPydh5OKCdoLofVCg2dpOZ6/eS
 UDHq90QahArjoBrKtTcZUoyrCjnlC/H57k4JH2VO5NNeq3L7EsosjrrohAwvqiInH9gU
 sjN8dUMnq/+O6UkPXpz+OuR2Mk2nonlMvX/gtlVZc0pIvx1UQPAl/yeMlrEkKjcw+r2e
 JWtYDM0MNzYTmvtFqNrWw6CNNOzG0e//86EHbGIRZFkI1zYPHruCMOOGgLMx8UIHvD+o
 pZg/9hZc0ZLhbNT9W1zxJOZdRSW/DIvYX7xSRmBU9JyPGOmJ+iohnwGqzwJB2ytgEwSy
 4sog==
X-Gm-Message-State: AOAM533s+Z3Lb71Saa4+vI2phJnBvTi64ptGAoEELhl0Go4UkfBDcHWm
 6oVv7Usdfct9ofH0ajP+lhxr18cVOSqNxh4=
X-Received: by 2002:a5e:dd02:: with SMTP id t2mr3158305iop.90.1596787845770;
 Fri, 07 Aug 2020 01:10:45 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id l144sm6233546ill.6.2020.08.07.01.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 01:10:45 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: peter.maydell@linaro.org
Subject: [PATCH 6/7] hw/arm/virt: spe: Add SPE fdt binding for virt machine
Date: Fri,  7 Aug 2020 08:10:36 +0000
Message-Id: <1663d06172cffa723e00893837ba04634f061fc8.1596768588.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1596768588.git.haibo.xu@linaro.org>
References: <cover.1596768588.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gWt/unyj8Vub

Add a virtual SPE device for virt machine while using PPI 
5 for SPE overflow interrupt number.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 hw/arm/virt-acpi-build.c    |  3 +++ 
 hw/arm/virt.c               | 42 +++++++++++++++++++++++++++++++++++++
 include/hw/acpi/acpi-defs.h |  1 + 
 include/hw/arm/virt.h       |  1 + 
 target/arm/cpu.c            |  2 ++
 target/arm/cpu.h            |  2 ++
 target/arm/kvm.c            |  6 ++++++
 7 files changed, 57 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 91f0df7b13..5073ba22a5 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -666,6 +666,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
             gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
         }
+        if (arm_feature(&armcpu->env, ARM_FEATURE_SPE)) {
+            gicc->spe_interrupt = cpu_to_le32(PPI(VIRTUAL_SPE_IRQ));
+        }
         if (vms->virt) {
             gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GIC_MAINT_IRQ));
         }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ecfee362a1..c40819705d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -555,6 +555,42 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
     }
 }

+static void fdt_add_spe_nodes(const VirtMachineState *vms)
+{
+    CPUState *cpu;
+    ARMCPU *armcpu;
+    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
+
+    CPU_FOREACH(cpu) {
+        armcpu = ARM_CPU(cpu);
+        if (!arm_feature(&armcpu->env, ARM_FEATURE_SPE)) {
+            return;
+        }
+        if (kvm_enabled()) {
+            if (kvm_irqchip_in_kernel()) {
+                kvm_arm_spe_set_irq(cpu, PPI(VIRTUAL_SPE_IRQ));
+            }
+            kvm_arm_spe_init(cpu);
+        }
+    }
+
+    if (vms->gic_version == VIRT_GIC_VERSION_2) {
+        irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
+                             GIC_FDT_IRQ_PPI_CPU_WIDTH,
+                             (1 << vms->smp_cpus) - 1);
+    }
+
+    armcpu = ARM_CPU(qemu_get_cpu(0));
+    qemu_fdt_add_subnode(vms->fdt, "/spe");
+    if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
+        const char compat[] = "arm,statistical-profiling-extension-v1";
+        qemu_fdt_setprop(vms->fdt, "/spe", "compatible",
+                         compat, sizeof(compat));
+        qemu_fdt_setprop_cells(vms->fdt, "/spe", "interrupts",
+                               GIC_FDT_IRQ_TYPE_PPI, VIRTUAL_SPE_IRQ, irqflags);
+    }
+}
+
 static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 {
     DeviceState *dev;
@@ -727,6 +763,10 @@ static void create_gic(VirtMachineState *vms)
                                     qdev_get_gpio_in(vms->gic, ppibase
                                                      + VIRTUAL_PMU_IRQ));

+        qdev_connect_gpio_out_named(cpudev, "spe-interrupt", 0,
+                                    qdev_get_gpio_in(vms->gic, ppibase
+                                                     + VIRTUAL_SPE_IRQ));
+
         sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
         sysbus_connect_irq(gicbusdev, i + smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
@@ -1915,6 +1955,8 @@ static void machvirt_init(MachineState *machine)

     fdt_add_pmu_nodes(vms);

+    fdt_add_spe_nodes(vms);
+
     create_uart(vms, VIRT_UART, sysmem, serial_hd(0));

     if (vms->secure) {
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 38a42f409a..56a7f38ae4 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -302,6 +302,7 @@ struct AcpiMadtGenericCpuInterface {
     uint32_t vgic_interrupt;
     uint64_t gicr_base_address;
     uint64_t arm_mpidr;
+    uint16_t spe_interrupt; /* ACPI 6.3 */
 } QEMU_PACKED;

 typedef struct AcpiMadtGenericCpuInterface AcpiMadtGenericCpuInterface;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index dff67e1bef..56c83224d2 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -49,6 +49,7 @@
 #define ARCH_TIMER_NS_EL1_IRQ 14
 #define ARCH_TIMER_NS_EL2_IRQ 10

+#define VIRTUAL_SPE_IRQ 5
 #define VIRTUAL_PMU_IRQ 7

 #define PPI(irq) ((irq) + 16)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 40768b4d19..67ab0089fd 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1038,6 +1038,8 @@ static void arm_cpu_initfn(Object *obj)
                              "gicv3-maintenance-interrupt", 1);
     qdev_init_gpio_out_named(DEVICE(cpu), &cpu->pmu_interrupt,
                              "pmu-interrupt", 1);
+    qdev_init_gpio_out_named(DEVICE(cpu), &cpu->spe_interrupt,
+                             "spe-interrupt", 1);
 #endif

     /* DTB consumers generally don't in fact care what the 'compatible'
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fe0ac14386..4bf8591df8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -790,6 +790,8 @@ struct ARMCPU {
     qemu_irq gicv3_maintenance_interrupt;
     /* GPIO output for the PMU interrupt */
     qemu_irq pmu_interrupt;
+    /* GPIO output for the SPE interrupt */
+    qemu_irq spe_interrupt;

     /* MemoryRegion to use for secure physical accesses */
     MemoryRegion *secure_memory;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 58f991e890..ecafdda364 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -820,6 +820,12 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
             switched_level &= ~KVM_ARM_DEV_PMU;
         }

+        if (switched_level & KVM_ARM_DEV_SPE) {
+            qemu_set_irq(cpu->spe_interrupt,
+                         !!(run->s.regs.device_irq_level & KVM_ARM_DEV_SPE));
+            switched_level &= ~KVM_ARM_DEV_SPE;
+        }
+
         if (switched_level) {
             qemu_log_mask(LOG_UNIMP, "%s: unhandled in-kernel device IRQ %x\n",
                           __func__, switched_level);
-- 
2.17.1

