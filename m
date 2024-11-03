Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1611644njc;
        Sun, 3 Nov 2024 07:25:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWAD9OJ8QqzcqUz8UfCPoVHg6EoquVUFWsVyDiMEJlSpo9Pe+cUxJkILmWbWqsDqUAfebM0OnUKquKyhw==@linaro.org
X-Google-Smtp-Source: AGHT+IGfmSRrl4+byfLfqc7tyyR5uS6NBkh7jHL17QuN05Mo+eeXvbthYoxjktIA8uEZy6uuMwCB
X-Received: by 2002:a05:6808:19aa:b0:3e6:5ee:f197 with SMTP id 5614622812f47-3e758c17e81mr7908423b6e.14.1730647531236;
        Sun, 03 Nov 2024 07:25:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730647531; cv=none;
        d=google.com; s=arc-20240605;
        b=fd3FFIz8i9F5zqlO7ZLDvebcBpv5gZXM2ipqHKhl8VaKNh7ET5eN9GfP4ew1TxdnQ6
         ZFcAHBCiCAPDN525+K4tZAQ/Ip8IOR68+/MOYHyQVSAXw8Em5rAQB/7PVROUK1HHIDvT
         H2qD/xJeID9iEfeGt4YwYbJVbt+QB/XrRWTtILTxWyZbM55pKBMvh+TQ3qbgGxUmQgOL
         HP5+Yn5g/i51so0bxITsEQe6UvczMDE6PoVYxeVM1FrHPRtxjQ7YKx643pGjxrlH+6V4
         +c4RhYZBKZjSW0SuPwk++f9I1bha3+iVedCBTBo1qPZIZgZ0Ly5nJ91MnKic6s7SrJTn
         B0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=87qKo/Iv8mWSCoxaZqQ3oxO3wdneZQsycnj/oK/pcnM=;
        fh=aZ+ktIGDgW/6qknyYMJe32UNdHDchsP+Kk6AMToiipc=;
        b=lqnWJU33BP5yNrFUNY2kcUNdCBCryUo3MoQZZKXl0MDmVC2HZ50lI5TDjNDbxgqccH
         ZnYJcXhtQCFcwjakKsEPDrWByv1eWFWLjz109dkUZ+Rll9+ZXq0JGgiiZapfgTDhsduS
         9l3F9iPTT4ktVpse53uFIkMA39Wx4Bror5QN2M8CLJhNDOk2wD/FqcJrbax56S+yK+p2
         rURCTwTv3JxuAxcBqSQPrhgcl8xU60hEgVdRkOcBQPIrAQTUyz0XxqELDCaP9s5V0g4B
         F83I0oWargNVJvM6QdxnO3la8Op6dsx9WhF30IMiV3wpJcP+AVqrHcP+4TmOq6R7wQ8Y
         lhHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5614622812f47-3e6611e27a8si3834078b6e.94.2024.11.03.07.25.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Nov 2024 07:25:31 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XhJFT081Fz6L77H;
	Sun,  3 Nov 2024 23:20:29 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id A23C1140B67;
	Sun,  3 Nov 2024 23:25:26 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.9) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 3 Nov 2024 16:25:09 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
	<richard.henderson@linaro.org>, <peter.maydell@linaro.org>
CC: <salil.mehta@huawei.com>, <jonathan.cameron@huawei.com>,
	<alex.bennee@linaro.org>, <imammedo@redhat.com>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <maz@kernel.org>, <will@kernel.org>,
	<oliver.upton@linux.dev>, <jean-philippe@linaro.org>,
	<lpieralisi@kernel.org>, <david@redhat.com>, <philmd@linaro.org>,
	<andrew.jones@linux.dev>, <eric.auger@redhat.com>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH] arm/virt: Extract common code to wire GICC<->vCPU IRQs for reuse
Date: Sun, 3 Nov 2024 15:24:55 +0000
Message-ID: <20241103152455.202462-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.9]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: YyaIi3R1GYJA

Extract common GIC and CPU interrupt wiring code to improve code
readability and modularity, supporting reuse in future patch sets. This
refactor is benign and introduces *no* functional changes.

Note: This patch has been isolated from a larger patch set to facilitate
early merging and reduce the complexity of the original set, as it
operates independently. All original tags and author contributions are
retained.

[!] Please note, this is a purely cosmetic change. No functional change.

Reported-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
[4/05/2024: Issue with total number of PPI available during create GIC]
Suggested-by: Miguel Luis <miguel.luis@oracle.com>
[5/05/2024: Fix the total number of PPIs available as per ARM BSA to avoid overflow]
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 108 ++++++++++++++++++++++++++++----------------------
 1 file changed, 60 insertions(+), 48 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a0d3bef875..d6892b0266 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -761,6 +761,65 @@ static bool gicv3_nmi_present(VirtMachineState *vms)
            (vms->gic_version != VIRT_GIC_VERSION_2);
 }
 
+/*
+ * Mapping from the output timer irq lines from the CPU to the GIC PPI inputs
+ * we use for the virt board.
+ */
+const int timer_irq[] = {
+    [GTIMER_PHYS] = ARCH_TIMER_NS_EL1_IRQ,
+    [GTIMER_VIRT] = ARCH_TIMER_VIRT_IRQ,
+    [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
+    [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
+    [GTIMER_HYPVIRT] = ARCH_TIMER_NS_EL2_VIRT_IRQ,
+};
+
+static void wire_gic_cpu_irqs(VirtMachineState *vms, CPUState *cs)
+{
+    SysBusDevice *gicbusdev = SYS_BUS_DEVICE(vms->gic);
+    unsigned int smp_cpus = MACHINE(vms)->smp.cpus;
+    DeviceState *cpudev = DEVICE(cs);
+    int i = CPU(cs)->cpu_index;
+    int intidbase, irqn;
+
+    intidbase = NUM_IRQS + i * GIC_INTERNAL;
+
+    for (irqn = 0; irqn < ARRAY_SIZE(timer_irq); irqn++) {
+        qdev_connect_gpio_out(cpudev, irqn,
+                              qdev_get_gpio_in(vms->gic,
+                                               intidbase + timer_irq[irqn]));
+    }
+
+
+    if (vms->gic_version != VIRT_GIC_VERSION_2) {
+        qemu_irq irq = qdev_get_gpio_in(vms->gic,
+                                        intidbase + ARCH_GIC_MAINT_IRQ);
+        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
+                                    0, irq);
+    } else if (vms->virt) {
+        qemu_irq irq = qdev_get_gpio_in(vms->gic,
+                                        intidbase + ARCH_GIC_MAINT_IRQ);
+        sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
+    }
+
+    qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
+                                qdev_get_gpio_in(vms->gic, intidbase
+                                                  + VIRTUAL_PMU_IRQ));
+
+    sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
+    sysbus_connect_irq(gicbusdev, i + smp_cpus,
+                       qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
+    sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
+                       qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
+    sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
+                       qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+    if (vms->gic_version != VIRT_GIC_VERSION_2) {
+        sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_NMI));
+        sysbus_connect_irq(gicbusdev, i + 5 * smp_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VINMI));
+    }
+}
+
 static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
@@ -862,54 +921,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
      * CPU's inputs.
      */
     for (i = 0; i < smp_cpus; i++) {
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
+        wire_gic_cpu_irqs(vms, qemu_get_cpu(i));
     }
 
     fdt_add_gic_node(vms);
-- 
2.34.1
