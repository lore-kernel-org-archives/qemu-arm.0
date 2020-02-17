Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4785032lfp;
        Sun, 16 Feb 2020 23:43:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqxjBsiwiYVPT0gpfL/Fy8jVu8JEdTdYdjKxF1FTB8GVj/VixaYbCNZiZaMCaQ2BbISAejcX
X-Received: by 2002:ac8:1aa6:: with SMTP id x35mr11535766qtj.32.1581925417891;
        Sun, 16 Feb 2020 23:43:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581925417; cv=none;
        d=google.com; s=arc-20160816;
        b=o1P38kSVR47dVj4URmEdRy9PJD7hPrsVmoxFecmQrUKilMEWIaNT3Uism9WX8LEj9y
         NTJSo0+Mw4QcvHtnIU5HkOoKfskADeNQrO2XZPfQrTl0P4hQv7uI4fBsApA6NyM+Tklh
         kObpkgObHe0MFE3uZjSMBsBT3wNxud7GBtgHXf5sTGt+W5vmToJhCAESQbyEMwruvQ33
         veWMQ3Nczq74k0E8z3lZXBuNjOrcVfQaR5HTxZHd32337aPUTstA0F+jRIGOrUXPxZcv
         TSNmt4bMBAU2EJGGSYFqIhteUPBZabGtmHj/cvVt6WlJYTGF84VACIlYBcUTy0aES6Tt
         S9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=+NF4rh0sjjfszB95hpN8yy4tuNFek+b9RhfUcz+QtpM=;
        b=bvDRwATK6DH/CWW1lPKtWfAmSN/NfD4cHPqzgqDxvlLTokO9pF0cu1cfpij3Q/zUOH
         XStwa2/O0V/Y7+GaZ37vagZYBXiAAoKM+0EyD/K5F6Wz0B/HDcu/7qUKxokaOL/mIpvo
         Vu4tSQ3slKPNQGTMU2v0/189sdlItXcRdoBpem79a5rEFj5+b6LDI0nRZs1T92vPLzrS
         ideOmXfANnWsteOmm0q48z8el6q8dOQo4Jvey4Xkfdv6+LuclIrSHrgQSMSzAmE94JH2
         XktfwGP7Bg/tyAaIzf7ZoNPB5wSNyB4Le2bCTWMEpVXgu1f2dBI1oISNVkBNSB6DCifJ
         qjSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q184si7075847qke.300.2020.02.16.23.43.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 23:43:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3b45-00063L-9B
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 02:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39340)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xuyandong2@huawei.com>) id 1j3b2w-0004IP-Lv
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 02:42:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <xuyandong2@huawei.com>) id 1j3b2u-0000Us-Fl
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 02:42:26 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:36468 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <xuyandong2@huawei.com>)
 id 1j3b2q-0000JC-FD; Mon, 17 Feb 2020 02:42:21 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 01E78AE914653679CE4E;
 Mon, 17 Feb 2020 15:42:14 +0800 (CST)
Received: from localhost (10.175.124.177) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Mon, 17 Feb 2020
 15:42:07 +0800
From: Xu Yandong <xuyandong2@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH RFC 07/16] hw/arm/virt: split virt extension related codes
 from create_gic
Date: Mon, 17 Feb 2020 02:51:19 -0500
Message-ID: <1581925888-103620-8-git-send-email-xuyandong2@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581925888-103620-1-git-send-email-xuyandong2@huawei.com>
References: <1581925888-103620-1-git-send-email-xuyandong2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.177]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: zhang.zhanghailiang@huawei.com, slp@redhat.com,
 Xu Yandong <xuyandong2@huawei.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zg5T7k33sqqQ

EL2 extension is not always needed.

Signed-off-by: Xu Yandong <xuyandong2@huawei.com>
---
 hw/arm/virt.c | 116 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 77 insertions(+), 39 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 32c3977e32..afaf143888 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -426,6 +426,45 @@ static void fdt_add_v2m_gic_node(VirtMachineState *vms)
     g_free(nodename);
 }
 
+static void fdt_gic_set_virt_extension(VirtMachineState *vms)
+{
+    char *nodename;
+    ArmMachineState *ams = ARM_MACHINE(vms);
+
+    nodename = g_strdup_printf("/intc@%" PRIx64,
+                               ams->memmap[VIRT_GIC_DIST].base);
+
+
+    if (vms->gic_version == 3) {
+        if (vms->virt) {
+            qemu_fdt_setprop_cells(ams->fdt, nodename, "interrupts",
+                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GIC_MAINT_IRQ,
+                                   GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+        }
+    } else {
+        if (!vms->virt) {
+            qemu_fdt_setprop_sized_cells(ams->fdt, nodename, "reg",
+                                         2, ams->memmap[VIRT_GIC_DIST].base,
+                                         2, ams->memmap[VIRT_GIC_DIST].size,
+                                         2, ams->memmap[VIRT_GIC_CPU].base,
+                                         2, ams->memmap[VIRT_GIC_CPU].size);
+        } else {
+            qemu_fdt_setprop_sized_cells(ams->fdt, nodename, "reg",
+                                         2, ams->memmap[VIRT_GIC_DIST].base,
+                                         2, ams->memmap[VIRT_GIC_DIST].size,
+                                         2, ams->memmap[VIRT_GIC_CPU].base,
+                                         2, ams->memmap[VIRT_GIC_CPU].size,
+                                         2, ams->memmap[VIRT_GIC_HYP].base,
+                                         2, ams->memmap[VIRT_GIC_HYP].size,
+                                         2, ams->memmap[VIRT_GIC_VCPU].base,
+                                         2, ams->memmap[VIRT_GIC_VCPU].size);
+            qemu_fdt_setprop_cells(ams->fdt, nodename, "interrupts",
+                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GIC_MAINT_IRQ,
+                                   GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+        }
+    }
+}
+
 static void fdt_add_gic_node(VirtMachineState *vms)
 {
     char *nodename;
@@ -466,36 +505,10 @@ static void fdt_add_gic_node(VirtMachineState *vms)
                                  2, ams->memmap[VIRT_HIGH_GIC_REDIST2].base,
                                  2, ams->memmap[VIRT_HIGH_GIC_REDIST2].size);
         }
-
-        if (vms->virt) {
-            qemu_fdt_setprop_cells(ams->fdt, nodename, "interrupts",
-                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GIC_MAINT_IRQ,
-                                   GIC_FDT_IRQ_FLAGS_LEVEL_HI);
-        }
     } else {
         /* 'cortex-a15-gic' means 'GIC v2' */
         qemu_fdt_setprop_string(ams->fdt, nodename, "compatible",
                                 "arm,cortex-a15-gic");
-        if (!vms->virt) {
-            qemu_fdt_setprop_sized_cells(ams->fdt, nodename, "reg",
-                                         2, ams->memmap[VIRT_GIC_DIST].base,
-                                         2, ams->memmap[VIRT_GIC_DIST].size,
-                                         2, ams->memmap[VIRT_GIC_CPU].base,
-                                         2, ams->memmap[VIRT_GIC_CPU].size);
-        } else {
-            qemu_fdt_setprop_sized_cells(ams->fdt, nodename, "reg",
-                                         2, ams->memmap[VIRT_GIC_DIST].base,
-                                         2, ams->memmap[VIRT_GIC_DIST].size,
-                                         2, ams->memmap[VIRT_GIC_CPU].base,
-                                         2, ams->memmap[VIRT_GIC_CPU].size,
-                                         2, ams->memmap[VIRT_GIC_HYP].base,
-                                         2, ams->memmap[VIRT_GIC_HYP].size,
-                                         2, ams->memmap[VIRT_GIC_VCPU].base,
-                                         2, ams->memmap[VIRT_GIC_VCPU].size);
-            qemu_fdt_setprop_cells(ams->fdt, nodename, "interrupts",
-                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GIC_MAINT_IRQ,
-                                   GIC_FDT_IRQ_FLAGS_LEVEL_HI);
-        }
     }
 
     qemu_fdt_setprop_cell(ams->fdt, nodename, "phandle", vms->gic_phandle);
@@ -614,6 +627,40 @@ static void gic_set_msi_interrupt(VirtMachineState *vms)
     }
 }
 
+static void qdev_gic_set_virt_bit(VirtMachineState *vms)
+{
+    if (vms->gic_version != 3 && !kvm_irqchip_in_kernel()) {
+        qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
+                          vms->virt);
+    }
+}
+
+static void set_gic_virt_sysbus(VirtMachineState *vms)
+{
+    MachineState *ms = MACHINE(vms);
+    ArmMachineState *ams = ARM_MACHINE(vms);
+    SysBusDevice *gicbusdev;
+    int type = vms->gic_version, i;
+    unsigned int smp_cpus = ms->smp.cpus;
+
+    if (!vms->virt) {
+        return;
+    }
+
+    gicbusdev = SYS_BUS_DEVICE(vms->gic);
+    if (type != 3) {
+        sysbus_mmio_map(gicbusdev, 2, ams->memmap[VIRT_GIC_HYP].base);
+        sysbus_mmio_map(gicbusdev, 3, ams->memmap[VIRT_GIC_VCPU].base);
+    }
+
+    for (i = 0; i < smp_cpus; i++) {
+        int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
+        qemu_irq irq = qdev_get_gpio_in(vms->gic,
+                                        ppibase + ARCH_GIC_MAINT_IRQ);
+        sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
+    }
+}
+
 static void create_gic(VirtMachineState *vms)
 {
     MachineState *ms = MACHINE(vms);
@@ -656,12 +703,8 @@ static void create_gic(VirtMachineState *vms)
             qdev_prop_set_uint32(vms->gic, "redist-region-count[1]",
                 MIN(smp_cpus - redist0_count, redist1_capacity));
         }
-    } else {
-        if (!kvm_irqchip_in_kernel()) {
-            qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
-                              vms->virt);
-        }
     }
+    qdev_gic_set_virt_bit(vms);
     qdev_init_nofail(vms->gic);
     gicbusdev = SYS_BUS_DEVICE(vms->gic);
     sysbus_mmio_map(gicbusdev, 0, ams->memmap[VIRT_GIC_DIST].base);
@@ -673,10 +716,6 @@ static void create_gic(VirtMachineState *vms)
         }
     } else {
         sysbus_mmio_map(gicbusdev, 1, ams->memmap[VIRT_GIC_CPU].base);
-        if (vms->virt) {
-            sysbus_mmio_map(gicbusdev, 2, ams->memmap[VIRT_GIC_HYP].base);
-            sysbus_mmio_map(gicbusdev, 3, ams->memmap[VIRT_GIC_VCPU].base);
-        }
     }
 
     /* Wire the outputs from each CPU's generic timer and the GICv3
@@ -708,10 +747,6 @@ static void create_gic(VirtMachineState *vms)
                                             ppibase + ARCH_GIC_MAINT_IRQ);
             qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
                                         0, irq);
-        } else if (vms->virt) {
-            qemu_irq irq = qdev_get_gpio_in(vms->gic,
-                                            ppibase + ARCH_GIC_MAINT_IRQ);
-            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
         }
 
         qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
@@ -727,7 +762,10 @@ static void create_gic(VirtMachineState *vms)
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
     }
 
+    set_gic_virt_sysbus(vms);
     fdt_add_gic_node(vms);
+    fdt_gic_set_virt_extension(vms);
+
     gic_set_msi_interrupt(vms);
 }
 
-- 
2.18.1

