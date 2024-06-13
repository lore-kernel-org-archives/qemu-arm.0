Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp98695ejr;
        Thu, 13 Jun 2024 16:45:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrjiX2Nh0OvYnEIGuoSsE+t+FHXHt+dl3CWNYE8nT9bBnY7ZiaKZn4AmwgLspYwD/y0+44QRm4CixCiiPWzgiTWg2XRMzP
X-Google-Smtp-Source: AGHT+IHauMC6yXn1/vTw5VqoM26x8leD7x0M+CMFR0vzj6KUBDRwK3yIC2xyzmdQvVqerlZXoJDR
X-Received: by 2002:a17:90b:108:b0:2c3:ccc:ab1 with SMTP id 98e67ed59e1d1-2c4dbd38ef1mr1113698a91.30.1718322309645;
        Thu, 13 Jun 2024 16:45:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322309; cv=none;
        d=google.com; s=arc-20160816;
        b=RtST7R9EaCsF7sflRGqpSCIl62dBOVO/Ccp6hu4b9j7tEminBFJRUeWgRSI6otZM89
         zKjoMjymkLmlNmufXDr/Dgv60Bop2N97ZNdZCFmfJI9tgszDaBASKgu96wAtlnPU6ZYj
         x+dt7Gfx8h/c5UsswOdESKYAryrdIsLNTmi38QR0LtByFVLEIxG1y9r4pUCy1vm8CP+x
         fB87n19Yi18HnTTB+ZdZu/Dn48mjt36NYgnJdXZseFM5Q/nRBNqwseNBAcwtgrnq5Lxy
         Xlh1e+7+lTXL848NTZ9qmJ4GvqIi/5MVzVGA/P0Zy63X66MLHCYnqp0r3XP9jvdpui/J
         r0LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=SbInabbkPSBX7hqUYCwwDc3zz0pFW0nrYA/2c4sm24I=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=Ld5jfSpPyGWw0eLm/aTUFQn33jz9c3XA3lwlaAgISSkYlGPKK/S44L260Zv08JO86z
         GIbJBGP6hXVgQfzmNM7Ts0TxmHYEGZE9clk+h3fhvHIPc/sXWqsw2rwSxO6gJ0bG2X0P
         QtUHM971itLN4980gqsOSRklYd7qYmtdQYqFfFHy3mG5z1BRxOQwrzfc9+dIaSUKG5Th
         60AII5M2jVib0S9VO8WIJCos4fQLkhu4bsXz3S/NEWY3m2e7cvd4vRyH4qLJwSPiyqUK
         vLzpFKplMDtrdKQllTJHW9jE1QacC89EA5XfUcKgSFBKCzdVbF32LtLjov4vLYFLL0Hc
         d1Mg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2c4a76ef138si4583076a91.163.2024.06.13.16.45.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:45:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0fCd6sc2z6K6DJ;
	Fri, 14 Jun 2024 07:45:01 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id CAACD140594;
	Fri, 14 Jun 2024 07:45:04 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:44:42 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 19/29] arm/virt: Changes to (un)wire GICC<->vCPU IRQs during hot-(un)plug
Date: Fri, 14 Jun 2024 00:36:29 +0100
Message-ID: <20240613233639.202896-20-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: NNAswSNi3IKs

Refactors the existing GIC create code to extract common code to wire the
vcpu<->gic interrupts. This function could be used with cold-plug case and also
used when vCPU is hot-plugged. It also introduces a new function to unwire the
vcpu<->gic interrupts for the vCPU hot-unplug cases.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reported-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
[4/05/2024: Issue with total number of PPI available during create GIC]
Suggested-by: Miguel Luis <miguel.luis@oracle.com>
[5/05/2024: Fix the total number of PPIs available as per ARM BSA to avoid overflow]
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c          | 154 ++++++++++++++++++++++++++++-------------
 hw/core/gpio.c         |   2 +-
 include/hw/qdev-core.h |   2 +
 target/arm/cpu-qom.h   |  18 +++--
 4 files changed, 118 insertions(+), 58 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f6b8c21f26..1556c362f7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -747,6 +747,107 @@ static bool gicv3_nmi_present(VirtMachineState *vms)
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
+};
+
+static void unwire_gic_cpu_irqs(VirtMachineState *vms, CPUState *cs)
+{
+    MachineState *ms = MACHINE(vms);
+    unsigned int max_cpus = ms->smp.max_cpus;
+    DeviceState *cpudev = DEVICE(cs);
+    DeviceState *gicdev = vms->gic;
+    int cpu = CPU(cs)->cpu_index;
+    int type = vms->gic_version;
+    int irq, num_gpio_in;
+
+    for (irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
+        qdev_disconnect_gpio_out_named(cpudev, NULL, irq);
+    }
+
+    if (type != VIRT_GIC_VERSION_2) {
+        qdev_disconnect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
+                                       0);
+    } else if (vms->virt) {
+        qdev_disconnect_gpio_out_named(gicdev, SYSBUS_DEVICE_GPIO_IRQ,
+                                       cpu + 4 * max_cpus);
+    }
+
+    /*
+     * RFC: Question: This currently does not takes care of intimating the
+     * devices which might be sitting on system bus. Do we need a
+     * sysbus_disconnect_irq() which also does the job of notification beside
+     * disconnection?
+     */
+    qdev_disconnect_gpio_out_named(cpudev, "pmu-interrupt", 0);
+
+    /* Unwire GIC's IRQ/FIQ/VIRQ/VFIQ/NMI/VINMI interrupt outputs to CPU */
+    num_gpio_in = (vms->gic_version != VIRT_GIC_VERSION_2) ?
+                                                NUM_GPIO_IN : NUM_GICV2_GPIO_IN;
+    for (irq = 0; irq < num_gpio_in; irq++) {
+        qdev_disconnect_gpio_out_named(gicdev, SYSBUS_DEVICE_GPIO_IRQ,
+                                        cpu + irq * max_cpus);
+    }
+}
+
+static void wire_gic_cpu_irqs(VirtMachineState *vms, CPUState *cs)
+{
+    MachineState *ms = MACHINE(vms);
+    unsigned int max_cpus = ms->smp.max_cpus;
+    DeviceState *cpudev = DEVICE(cs);
+    DeviceState *gicdev = vms->gic;
+    int cpu = CPU(cs)->cpu_index;
+    int type = vms->gic_version;
+    SysBusDevice *gicbusdev;
+    int intidbase;
+    int irqn;
+
+    intidbase = NUM_IRQS + cpu * GIC_INTERNAL;
+
+    for (irqn = 0; irqn < ARRAY_SIZE(timer_irq); irqn++) {
+        qdev_connect_gpio_out(cpudev, irqn,
+                              qdev_get_gpio_in(gicdev,
+                                               intidbase + timer_irq[irqn]));
+    }
+
+    gicbusdev = SYS_BUS_DEVICE(gicdev);
+    if (type != VIRT_GIC_VERSION_2) {
+        qemu_irq irq = qdev_get_gpio_in(gicdev,
+                                        intidbase + ARCH_GIC_MAINT_IRQ);
+        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
+                                    0, irq);
+    } else if (vms->virt) {
+        qemu_irq irq = qdev_get_gpio_in(gicdev,
+                                        intidbase + ARCH_GIC_MAINT_IRQ);
+        sysbus_connect_irq(gicbusdev, cpu + 4 * max_cpus, irq);
+    }
+
+    qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
+                                qdev_get_gpio_in(gicdev,
+                                                 intidbase + VIRTUAL_PMU_IRQ));
+
+    sysbus_connect_irq(gicbusdev, cpu, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
+    sysbus_connect_irq(gicbusdev, cpu + max_cpus,
+                       qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
+    sysbus_connect_irq(gicbusdev, cpu + 2 * max_cpus,
+                       qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
+    sysbus_connect_irq(gicbusdev, cpu + 3 * max_cpus,
+                       qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+    if (vms->gic_version != VIRT_GIC_VERSION_2) {
+        sysbus_connect_irq(gicbusdev, cpu + 4 * max_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_NMI));
+        sysbus_connect_irq(gicbusdev, cpu + 5 * max_cpus,
+                           qdev_get_gpio_in(cpudev, ARM_CPU_VINMI));
+    }
+}
+
 static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
@@ -849,54 +950,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
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
-            sysbus_connect_irq(gicbusdev, i + 4 * max_cpus, irq);
-        }
-
-        qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
-                                    qdev_get_gpio_in(vms->gic, intidbase
-                                                     + VIRTUAL_PMU_IRQ));
-
-        sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
-        sysbus_connect_irq(gicbusdev, i + max_cpus,
-                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
-        sysbus_connect_irq(gicbusdev, i + 2 * max_cpus,
-                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
-        sysbus_connect_irq(gicbusdev, i + 3 * max_cpus,
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
@@ -3075,7 +3129,7 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
      */
     if (vms->acpi_dev) {
         /* TODO: update GIC about this hotplug change here */
-        /* TODO: wire the GIC<->CPU irqs */
+        wire_gic_cpu_irqs(vms, cs);
     }
 
     /*
@@ -3159,7 +3213,7 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
 
     /* TODO: update the acpi cpu hotplug state for cpu hot-unplug */
 
-    /* TODO: unwire the gic-cpu irqs here */
+    unwire_gic_cpu_irqs(vms, cs);
     /* TODO: update the GIC about this hot unplug change */
 
     /* TODO: unregister cpu for reset & update F/W info for the next boot */
diff --git a/hw/core/gpio.c b/hw/core/gpio.c
index 80d07a6ec9..abb164d5c0 100644
--- a/hw/core/gpio.c
+++ b/hw/core/gpio.c
@@ -143,7 +143,7 @@ qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n)
 
 /* disconnect a GPIO output, returning the disconnected input (if any) */
 
-static qemu_irq qdev_disconnect_gpio_out_named(DeviceState *dev,
+qemu_irq qdev_disconnect_gpio_out_named(DeviceState *dev,
                                                const char *name, int n)
 {
     char *propname = g_strdup_printf("%s[%d]",
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 5336728a23..742e62e400 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -738,6 +738,8 @@ qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n);
  */
 qemu_irq qdev_intercept_gpio_out(DeviceState *dev, qemu_irq icpt,
                                  const char *name, int n);
+qemu_irq qdev_disconnect_gpio_out_named(DeviceState *dev,
+                                               const char *name, int n);
 
 BusState *qdev_get_child_bus(DeviceState *dev, const char *name);
 
diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index b497667d61..e49fb096de 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -37,13 +37,17 @@ DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
 #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
 
 /* Meanings of the ARMCPU object's seven inbound GPIO lines */
-#define ARM_CPU_IRQ 0
-#define ARM_CPU_FIQ 1
-#define ARM_CPU_VIRQ 2
-#define ARM_CPU_VFIQ 3
-#define ARM_CPU_NMI 4
-#define ARM_CPU_VINMI 5
-#define ARM_CPU_VFNMI 6
+enum {
+    ARM_CPU_IRQ = 0,
+    ARM_CPU_FIQ = 1,
+    ARM_CPU_VIRQ = 2,
+    ARM_CPU_VFIQ = 3,
+    NUM_GICV2_GPIO_IN = (ARM_CPU_VFIQ+1),
+    ARM_CPU_NMI = 4,
+    ARM_CPU_VINMI = 5,
+    /* ARM_CPU_VFNMI = 6, */ /* not used? */
+    NUM_GPIO_IN = (ARM_CPU_VINMI+1),
+};
 
 /* For M profile, some registers are banked secure vs non-secure;
  * these are represented as a 2-element array where the first element
-- 
2.34.1
