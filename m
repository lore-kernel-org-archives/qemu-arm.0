Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp984093ejc;
        Tue, 26 Sep 2023 03:13:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfKZxHoU/IutuOh2c35FlEkZPLtNkTj/ys3NXSU8JrSWmgJSMVWEAV8KCKfFc/L/fFUu4k
X-Received: by 2002:a81:5b0a:0:b0:56c:e70b:b741 with SMTP id p10-20020a815b0a000000b0056ce70bb741mr9823060ywb.20.1695723212631;
        Tue, 26 Sep 2023 03:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695723212; cv=none;
        d=google.com; s=arc-20160816;
        b=E/uSFctYyJRM/UTYfSuSLTbw5eGB6H8gx3mrIWPg2IRODR39PV/WvzsbDlSIJrh8iU
         w1BDyS7xvcIEPlrMzqTJw0LkEhGQ5dN22o4SRA379WNncm7+VLfd08jpCEJtxvXWLPb3
         hrvU4+Q5ZWO2fpUjC5KMq4kx/vKWpin4MIscM3x0V7OyO94AfhPlxU1WfgBJ6AApvurW
         ReNQOsYmPniqw9MF9vO/PI97DgZyhUtj0S6Eybf8CQXi6aDfmwR5IKvH+ypo02Mm6XcO
         mRws1+6u26wZJXTs+fKRMiEopTT6aQeaITHNslr3RjF2oZ6Q4WVVf2wdTtbp46oHmAI1
         YPIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=/mmt9xU7tZkYm2RTRdTLQ8xqeNHoHG8kYPDf4Kq8QMM=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=OVryUIOETNEuKP9R2aUaP2Hw/jF+N0sc+maNgkPlkkSrX6Da+HeAMv3wBEFEctunDA
         fQIuEpg9k0lksUCNmWJQheGPgE2mE3Qe/fpeayHPLkH+M6d4I6w6dvHr3HIYwYv1UnTl
         8pBUUdvFewHIIIWuMmjMOwM1bWHtlClTLhSjc/KVweA2XttHDqC8eRCndiqcd9B8MCYm
         5kR3YZfmFItbvwdpL5m7/DLHazfBmw8hJI2zjuSFS7VIjZ6StvCC/9RHa3bQ/q8tb3fV
         GtuujnNQm4KtDgpW4bS3n8Ca8vM8cTTnWPgW7Fmula6/uTntmQZ/AwoL6UTJHpUJJqux
         QQUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id k33-20020a634b61000000b00578fcbfebdasi12968604pgl.734.2023.09.26.03.13.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:13:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwRx3cVYz6J7dq;
	Tue, 26 Sep 2023 18:08:29 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:13:10 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 26/37] arm/virt: Changes to (un)wire GICC<->vCPU IRQs during hot-(un)plug
Date: Tue, 26 Sep 2023 11:04:25 +0100
Message-ID: <20230926100436.28284-27-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: VqprraRYG9bI

Refactors the existing GIC create code to extract common code to wire the
vcpu<->gic interrupts. This function could be used with cold-plug case and also
used when vCPU is hot-plugged. It also introduces a new function to unwire the
vcpu<->gic interrupts for the vCPU hot-unplug cases.

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c          | 139 ++++++++++++++++++++++++++++-------------
 hw/core/gpio.c         |   2 +-
 include/hw/qdev-core.h |   2 +
 3 files changed, 99 insertions(+), 44 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index dce02136cb..5b829e47b7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -714,6 +714,99 @@ static void create_v2m(VirtMachineState *vms)
     vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
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
+    int irq;
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
+    qdev_disconnect_gpio_out_named(gicdev, SYSBUS_DEVICE_GPIO_IRQ, cpu);
+    qdev_disconnect_gpio_out_named(gicdev,
+                                   SYSBUS_DEVICE_GPIO_IRQ, cpu + max_cpus);
+    qdev_disconnect_gpio_out_named(gicdev, SYSBUS_DEVICE_GPIO_IRQ,
+                                   cpu + 2 * max_cpus);
+    qdev_disconnect_gpio_out_named(gicdev, SYSBUS_DEVICE_GPIO_IRQ,
+                                   cpu + 3 * max_cpus);
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
+    int ppibase;
+    int irq;
+
+    ppibase = NUM_IRQS + cpu * GIC_INTERNAL + GIC_NR_SGIS;
+
+    for (irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
+        qdev_connect_gpio_out(cpudev, irq,
+                              qdev_get_gpio_in(gicdev,
+                                               ppibase + timer_irq[irq]));
+    }
+
+    gicbusdev = SYS_BUS_DEVICE(gicdev);
+    if (type != VIRT_GIC_VERSION_2) {
+        qemu_irq irq = qdev_get_gpio_in(gicdev,
+                                        ppibase + ARCH_GIC_MAINT_IRQ);
+        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
+                                    0, irq);
+    } else if (vms->virt) {
+        qemu_irq irq = qdev_get_gpio_in(gicdev,
+                                        ppibase + ARCH_GIC_MAINT_IRQ);
+        sysbus_connect_irq(gicbusdev, cpu + 4 * max_cpus, irq);
+    }
+
+    qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
+                                qdev_get_gpio_in(gicdev,
+                                                 ppibase + VIRTUAL_PMU_IRQ));
+    sysbus_connect_irq(gicbusdev, cpu, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
+    sysbus_connect_irq(gicbusdev, cpu + max_cpus,
+                       qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
+    sysbus_connect_irq(gicbusdev, cpu + 2 * max_cpus,
+                       qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
+    sysbus_connect_irq(gicbusdev, cpu + 3 * max_cpus,
+                       qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+}
+
 static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
@@ -809,47 +902,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
      * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
      */
     for (i = 0; i < smp_cpus; i++) {
-        DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
-        int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
-        int irq;
-        /* Mapping from the output timer irq lines from the CPU to the
-         * GIC PPI inputs we use for the virt board.
-         */
-        const int timer_irq[] = {
-            [GTIMER_PHYS] = ARCH_TIMER_NS_EL1_IRQ,
-            [GTIMER_VIRT] = ARCH_TIMER_VIRT_IRQ,
-            [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
-            [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
-        };
-
-        for (irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
-            qdev_connect_gpio_out(cpudev, irq,
-                                  qdev_get_gpio_in(vms->gic,
-                                                   ppibase + timer_irq[irq]));
-        }
-
-        if (vms->gic_version != VIRT_GIC_VERSION_2) {
-            qemu_irq irq = qdev_get_gpio_in(vms->gic,
-                                            ppibase + ARCH_GIC_MAINT_IRQ);
-            qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
-                                        0, irq);
-        } else if (vms->virt) {
-            qemu_irq irq = qdev_get_gpio_in(vms->gic,
-                                            ppibase + ARCH_GIC_MAINT_IRQ);
-            sysbus_connect_irq(gicbusdev, i + 4 * max_cpus, irq);
-        }
-
-        qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
-                                    qdev_get_gpio_in(vms->gic, ppibase
-                                                     + VIRTUAL_PMU_IRQ));
-
-        sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
-        sysbus_connect_irq(gicbusdev, i + max_cpus,
-                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
-        sysbus_connect_irq(gicbusdev, i + 2 * max_cpus,
-                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
-        sysbus_connect_irq(gicbusdev, i + 3 * max_cpus,
-                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
+        wire_gic_cpu_irqs(vms, qemu_get_cpu(i));
     }
 
     fdt_add_gic_node(vms);
@@ -3064,7 +3117,7 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
      */
     if (vms->acpi_dev) {
         /* TODO: update GIC about this hotplug change here */
-        /* TODO: wire the GIC<->CPU irqs */
+        wire_gic_cpu_irqs(vms, cs);
     }
 
     /*
@@ -3148,7 +3201,7 @@ static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
 
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
index 884c726a87..992f5419fa 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -739,6 +739,8 @@ qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n);
  */
 qemu_irq qdev_intercept_gpio_out(DeviceState *dev, qemu_irq icpt,
                                  const char *name, int n);
+qemu_irq qdev_disconnect_gpio_out_named(DeviceState *dev,
+                                               const char *name, int n);
 
 BusState *qdev_get_child_bus(DeviceState *dev, const char *name);
 
-- 
2.34.1
