Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEEDEC1114
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:13:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZMZ-0004yd-IN; Mon, 23 Feb 2026 12:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZLD-0002tm-H7
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:30 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZL8-0000RP-1l
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:26 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so57123055e9.2
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866198; x=1772470998; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KnSBbwNAJz8jvmrJ0U5ORYLe/Et4GkGyZ62fZOOX4tE=;
 b=myLcHvwpthYK/PxRjyWYj2RHt9EYCuIKvkdaLUoqboey1pvRsClSJT/HdEPsbyQ0eh
 R+2iMl1eWyHnRopwnuG18vBSr1TBLiRRfc4ehxBCz8Korst6ukkLbeMf0YIjqbH69xdX
 jdACsGf1ziu/yPAkyP2sWnzifFoQ0kzDUiMY37XgCniPfHETx76/FCDlofqdV9iLQvGx
 kVm/suvGj/NjxRq86oA/DaSVILiIl0jg7MayrsVTzb/MN076W5pDTBL/Gq9BzQuijxDP
 Nvno5bIrjeQIsk3ogFHd4+h6Aj9XbOVoEzUA34BW/ctj0OK0lbbf7+2PPUewTRHWtDSE
 NrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866198; x=1772470998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KnSBbwNAJz8jvmrJ0U5ORYLe/Et4GkGyZ62fZOOX4tE=;
 b=cWz4ukldxMg+BdZLxtilqAyGMAzTFAcLyWzYGZKHRJhqA0X0t1yosO0bHFfvSawBWc
 txejVLH6WpyHRtRLytCT61Ybr1VTBWZGOV3Z/zPX+ws3mSTyBatT4+50Y3i7UjGh2sAV
 +NHlvvf0IX4A6PWV0QbvTG31UWUTag0LVLTZnyp0m3GVdav8Gtafo2ZQYYC806/N42s1
 nBU3UThjEP7Kvp5I2iFm09l9da7f7/sFCfTCY7kMTQn1IU6zAWPFM2LFw3pRUfrhRtmV
 Yit/RSrwAg1JVpdo1uv5nOAFeS5qXQ/HFsAvpj+3bfq+6SiMunTb2zSa6AE5Yv9dHHAC
 ubCg==
X-Gm-Message-State: AOJu0YwqV6uKpWK7q/AZcaO03J9xXBPEhxhERFULH9kmrN20mRP/Y27J
 NxCqTWzC8j/Rmc/IRvy106PbFZCo5UMff6/xpCbTBZcShaAEPzaC5Tk9u5GcVMCpAJQJehMkT+s
 6SB4H
X-Gm-Gg: AZuq6aICJqYC33RAQRQraXt2+igC7QG6uAyPx5QtB8nDqXVr6MBCvpNNeLiI5Hy6tKz
 KEzqIUqy9CdpYTkfL0uEfQ/Y8IgLJyZpIU4cGkah6V2w3cwm1SJqAllwoWH7IjzBKocloCF1S/h
 wQ3Wm2mKX7Owe19YVHfEMXYJvKtm0xD1A/CN690U/f9qoycOj0KAJP9VO1D2BdTDhpK5qHDfpVg
 Uu7z8E9SANPTATBSoePxlTg8juz4uwQ0gShH8gRPwVcD7DBy7/EiL/rQV2MJWYAZlhBF2a+JxBT
 4NIVCV9kJXswAi3/O6cfY0f7KaUtXfaejpfUZhHFWzROD9KJEfnPkH4MO8GZbD5Sx2Glk2/gLsm
 4VXzty5IazsZKo2MweNAmAFWX4ynxgZz1W2ISA/Zzz+nC8hkv9XE9wYUUE/F2HsTRUNXzmj23s3
 hziYL68MkHiaaRf2sTR1F7TjYhT09zKyyJt6f6tZJ9VQD4R6AA0Tkz3z+DWYw3xLgcqrmAVbdLi
 +D+CpbhtfB99masSWW6zIhSE3tmQhI=
X-Received: by 2002:a05:600c:34cb:b0:479:1b0f:dfff with SMTP id
 5b1f17b1804b1-483a95bef2amr140499275e9.10.1771866197972; 
 Mon, 23 Feb 2026 09:03:17 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 58/65] hw/arm/virt: Pull "wire CPU interrupts" out of
 create_gic()
Date: Mon, 23 Feb 2026 17:02:05 +0000
Message-ID: <20260223170212.441276-59-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

create_gic() is quite long and mixes GICv2 and GICv3 even though
they're mostly different in their creation.  As a preliminary to
splitting it up, pull out the "wire the CPU interrupts to the GIC PPI
inputs" code out into its own function.  This is a long and
self-contained piece of code that is the main thing that we need to
do basically the same way for GICv2 and GICv3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 127 +++++++++++++++++++++++++++-----------------------
 1 file changed, 69 insertions(+), 58 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3c318680f8..ec6e49099a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -795,13 +795,80 @@ static bool gicv3_nmi_present(VirtMachineState *vms)
            (vms->gic_version != VIRT_GIC_VERSION_2);
 }
 
+static void gic_connect_ppis(VirtMachineState *vms)
+{
+    /*
+     * Wire the outputs from each CPU's generic timer and the GICv3
+     * maintenance interrupt signal to the appropriate GIC PPI inputs,
+     * and the GIC's IRQ/FIQ/VIRQ/VFIQ/NMI/VINMI interrupt outputs to the
+     * CPU's inputs.
+     */
+    MachineState *ms = MACHINE(vms);
+    int i;
+    unsigned int smp_cpus = ms->smp.cpus;
+    SysBusDevice *gicbusdev = SYS_BUS_DEVICE(vms->gic);
+
+    for (i = 0; i < smp_cpus; i++) {
+        DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
+        int intidbase = NUM_IRQS + i * GIC_INTERNAL;
+        /*
+         * Mapping from the output timer irq lines from the CPU to the
+         * GIC PPI inputs we use for the virt board.
+         */
+        const int timer_irq[] = {
+            [GTIMER_PHYS] = ARCH_TIMER_NS_EL1_IRQ,
+            [GTIMER_VIRT] = ARCH_TIMER_VIRT_IRQ,
+            [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
+            [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
+            [GTIMER_HYPVIRT] = ARCH_TIMER_NS_EL2_VIRT_IRQ,
+            [GTIMER_S_EL2_PHYS] = ARCH_TIMER_S_EL2_IRQ,
+            [GTIMER_S_EL2_VIRT] = ARCH_TIMER_S_EL2_VIRT_IRQ,
+        };
+
+        for (unsigned irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
+            qdev_connect_gpio_out(cpudev, irq,
+                                  qdev_get_gpio_in(vms->gic,
+                                                   intidbase + timer_irq[irq]));
+        }
+
+        if (vms->gic_version != VIRT_GIC_VERSION_2) {
+            qemu_irq irq = qdev_get_gpio_in(vms->gic,
+                                            intidbase + ARCH_GIC_MAINT_IRQ);
+            qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
+                                        0, irq);
+        } else if (vms->virt) {
+            qemu_irq irq = qdev_get_gpio_in(vms->gic,
+                                            intidbase + ARCH_GIC_MAINT_IRQ);
+            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
+        }
+
+        qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
+                                    qdev_get_gpio_in(vms->gic, intidbase
+                                                     + VIRTUAL_PMU_IRQ));
+
+        sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
+        sysbus_connect_irq(gicbusdev, i + smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
+        sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
+        sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+
+        if (vms->gic_version != VIRT_GIC_VERSION_2) {
+            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus,
+                               qdev_get_gpio_in(cpudev, ARM_CPU_NMI));
+            sysbus_connect_irq(gicbusdev, i + 5 * smp_cpus,
+                               qdev_get_gpio_in(cpudev, ARM_CPU_VINMI));
+        }
+    }
+}
+
 static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
     /* We create a standalone GIC */
     SysBusDevice *gicbusdev;
     const char *gictype;
-    int i;
     unsigned int smp_cpus = ms->smp.cpus;
     uint32_t nb_redist_regions = 0;
     int revision;
@@ -900,63 +967,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
         }
     }
 
-    /* Wire the outputs from each CPU's generic timer and the GICv3
-     * maintenance interrupt signal to the appropriate GIC PPI inputs,
-     * and the GIC's IRQ/FIQ/VIRQ/VFIQ/NMI/VINMI interrupt outputs to the
-     * CPU's inputs.
-     */
-    for (i = 0; i < smp_cpus; i++) {
-        DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
-        int intidbase = NUM_IRQS + i * GIC_INTERNAL;
-        /* Mapping from the output timer irq lines from the CPU to the
-         * GIC PPI inputs we use for the virt board.
-         */
-        const int timer_irq[] = {
-            [GTIMER_PHYS] = ARCH_TIMER_NS_EL1_IRQ,
-            [GTIMER_VIRT] = ARCH_TIMER_VIRT_IRQ,
-            [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
-            [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
-            [GTIMER_HYPVIRT] = ARCH_TIMER_NS_EL2_VIRT_IRQ,
-            [GTIMER_S_EL2_PHYS] = ARCH_TIMER_S_EL2_IRQ,
-            [GTIMER_S_EL2_VIRT] = ARCH_TIMER_S_EL2_VIRT_IRQ,
-        };
-
-        for (unsigned irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
-            qdev_connect_gpio_out(cpudev, irq,
-                                  qdev_get_gpio_in(vms->gic,
-                                                   intidbase + timer_irq[irq]));
-        }
-
-        if (vms->gic_version != VIRT_GIC_VERSION_2) {
-            qemu_irq irq = qdev_get_gpio_in(vms->gic,
-                                            intidbase + ARCH_GIC_MAINT_IRQ);
-            qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
-                                        0, irq);
-        } else if (vms->virt) {
-            qemu_irq irq = qdev_get_gpio_in(vms->gic,
-                                            intidbase + ARCH_GIC_MAINT_IRQ);
-            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
-        }
-
-        qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
-                                    qdev_get_gpio_in(vms->gic, intidbase
-                                                     + VIRTUAL_PMU_IRQ));
-
-        sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
-        sysbus_connect_irq(gicbusdev, i + smp_cpus,
-                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
-        sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
-                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
-        sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
-                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
-
-        if (vms->gic_version != VIRT_GIC_VERSION_2) {
-            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus,
-                               qdev_get_gpio_in(cpudev, ARM_CPU_NMI));
-            sysbus_connect_irq(gicbusdev, i + 5 * smp_cpus,
-                               qdev_get_gpio_in(cpudev, ARM_CPU_VINMI));
-        }
-    }
+    gic_connect_ppis(vms);
 
     fdt_add_gic_node(vms);
 }
-- 
2.43.0


