Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp654390wrq;
        Sat, 14 Jul 2018 10:24:01 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdjv8v74ebeR0xVE+WP3GM9lyZnMs/ZdHrDouZGIjkKGkaXNxhczCIjgXMQjTE1lK4xCe8Y
X-Received: by 2002:a0c:b4a9:: with SMTP id c41-v6mr11816427qve.57.1531589041554;
        Sat, 14 Jul 2018 10:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531589041; cv=none;
        d=google.com; s=arc-20160816;
        b=tkfrKGf90ixeenqM0KSts00zhejTT42SLqYRAW+7fY+Ot6sx6T/GAtIXbMj15kun9M
         eNjCrOCJeAZTp88BWwcryOJrG/gg3+9PgRSVVSsF5VEV/yNHux2cG2LsTliELIPK/eAb
         TkBwWOCsyey/fnsn6Dm/DOr2mYVWEyq75NBaXzm2rGNZH1SnC7ydADy3KLwNioF9ddPK
         jBjRSF9Vl+uxJTz7VDHXMCCWoqWZ2UfU6FjIyKX5FV76qWkbwPyrSOMnFSwS3Q7YPRi/
         c/QR9Qm2LZUyW526Iser8/jT+oyr35w+refFDT/4PH7eUIbjM/pBVchPGWmusjAfY8OX
         BrNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=d6xjiI9cmaxOH/QX/R5kUEWi7r9QsFjsRjQxexqBjGg=;
        b=eZXapoQd5nTWJe8ToHuy0YtZ+DsrRAa5eb5lNnFP66KJDeWF58ZGMlrHeIso1iejRB
         MghtzU3XJRJrbvcTP9+xGF7L0BLOQ0Usqcbq+yD/yrn+L3NdNSteRq8M3HQ70mb8SHDU
         mzrfwwLddZc7keTxirdRqiE2JKZZJkAhkZVfjq5J0v/r0ffXRltTYnpVYMW9WrPYHJ8P
         9LDCkQzAkwyvueogSjNs4P2oeuWBrQCASxM+D93RK1X0CSbz0s8M1lRP2FM7qmDFDOJO
         ANdYCW6XsExi1LGdAROH/pPHDAx5b768eUUz+E44fRFjx3rLKzIOA03iNfwF9yYf/IQB
         9fbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="kJ/o+k3b";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=4kyzAkgV;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=4kyzAkgV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q123-v6si7950332qkd.355.2018.07.14.10.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:24:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="kJ/o+k3b";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=4kyzAkgV;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=4kyzAkgV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOH3-00038Z-2a
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:24:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9u-0005nM-Ca
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9r-0004c4-7f
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:38 -0400
Received: from greensocs.com ([193.104.36.180]:57404)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9q-0004b3-Kx; Sat, 14 Jul 2018 13:16:35 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 1A65AC7AFE;
	Sat, 14 Jul 2018 19:16:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588594;
	bh=Q5Z4T9FiiCDb1ZSxXIEFBRZhAjd3zLVEqvA3U7XETW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kJ/o+k3bMI0sgR8PjX+JdIiNGAHi9ZyI84MSrAK2E79X/jes65W6qjFbOCFAlMkdm
	v+pDEgYBKg8f7fP6b/dk/c+VEMFpk5x8OGudjR8OSON/8cwJ2CgFBOynqvWs/46PbR
	HHOKf25Vz1VpnnFPfogZ3Vv6vQMNWjPhPtW9yLJM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=4kyzAkgV;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=4kyzAkgV
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cmr6Fo_VkXP9; Sat, 14 Jul 2018 19:16:33 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id F00ACC7AF0; Sat, 14 Jul 2018 19:16:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588592;
	bh=Q5Z4T9FiiCDb1ZSxXIEFBRZhAjd3zLVEqvA3U7XETW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=4kyzAkgVni3KTjcdYwRP+A5KhN8f9l7WQErYsHw/JYzzOpyXFBHTLKsgqYE8XGQcJ
	+TICvVKe7WhY0vFKPHBA4feUyXtQpIkCROGyi37poM8TEnNH5jRWj6pUB4kTirABeb
	+1s53wv9IsrcvGfvm83RwxyIcqywaHRMcrRyFOHE=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 29768C7ADD;
	Sat, 14 Jul 2018 19:16:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588592;
	bh=Q5Z4T9FiiCDb1ZSxXIEFBRZhAjd3zLVEqvA3U7XETW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=4kyzAkgVni3KTjcdYwRP+A5KhN8f9l7WQErYsHw/JYzzOpyXFBHTLKsgqYE8XGQcJ
	+TICvVKe7WhY0vFKPHBA4feUyXtQpIkCROGyi37poM8TEnNH5jRWj6pUB4kTirABeb
	+1s53wv9IsrcvGfvm83RwxyIcqywaHRMcrRyFOHE=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:16:00 +0200
Message-Id: <20180714171601.5734-20-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 19/20] xlnx-zynqmp: Improve GIC wiring and
 MMIO mapping
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9d1e4zwrYRWX

This commit improve the way the GIC is realized and connected in the
ZynqMP SoC. The security extensions are enabled only if requested in the
machine state. The same goes for the virtualization extensions.

All the GIC to APU CPU(s) IRQ lines are now connected, including FIQ,
vIRQ and vFIQ. The missing CPU to GIC timers IRQ connections are also
added (HYP and SEC timers).

The GIC maintenance IRQs are back-wired to the correct GIC PPIs.

Finally, the MMIO mappings are reworked to take into account the ZynqMP
specifics. The GIC (v)CPU interface is aliased 16 times:
  * for the first 0x1000 bytes from 0xf9010000 to 0xf901f000
  * for the second 0x1000 bytes from 0xf9020000 to 0xf902f000
Mappings of the virtual interface and virtual CPU interface are mapped
only when virtualization extensions are requested. The
XlnxZynqMPGICRegion struct has been enhanced to be able to catch all
this information.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/arm/xlnx-zynqmp.c         | 92 ++++++++++++++++++++++++++++++++----
 include/hw/arm/xlnx-zynqmp.h |  4 +-
 2 files changed, 86 insertions(+), 10 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 29df35fb75..42c29b8d06 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -29,12 +29,17 @@
 
 #define ARM_PHYS_TIMER_PPI  30
 #define ARM_VIRT_TIMER_PPI  27
+#define ARM_HYP_TIMER_PPI   26
+#define ARM_SEC_TIMER_PPI   29
+#define GIC_MAINTENANCE_PPI 25
 
 #define GEM_REVISION        0x40070106
 
 #define GIC_BASE_ADDR       0xf9000000
 #define GIC_DIST_ADDR       0xf9010000
 #define GIC_CPU_ADDR        0xf9020000
+#define GIC_VIFACE_ADDR     0xf9040000
+#define GIC_VCPU_ADDR       0xf9060000
 
 #define SATA_INTR           133
 #define SATA_ADDR           0xFD0C0000
@@ -111,11 +116,54 @@ static const int adma_ch_intr[XLNX_ZYNQMP_NUM_ADMA_CH] = {
 typedef struct XlnxZynqMPGICRegion {
     int region_index;
     uint32_t address;
+    uint32_t offset;
+    bool virt;
 } XlnxZynqMPGICRegion;
 
 static const XlnxZynqMPGICRegion xlnx_zynqmp_gic_regions[] = {
-    { .region_index = 0, .address = GIC_DIST_ADDR, },
-    { .region_index = 1, .address = GIC_CPU_ADDR,  },
+    /* Distributor */
+    {
+        .region_index = 0,
+        .address = GIC_DIST_ADDR,
+        .offset = 0,
+        .virt = false
+    },
+
+    /* CPU interface */
+    {
+        .region_index = 1,
+        .address = GIC_CPU_ADDR,
+        .offset = 0,
+        .virt = false
+    },
+    {
+        .region_index = 1,
+        .address = GIC_CPU_ADDR + 0x10000,
+        .offset = 0x1000,
+        .virt = false
+    },
+
+    /* Virtual interface */
+    {
+        .region_index = 2,
+        .address = GIC_VIFACE_ADDR,
+        .offset = 0,
+        .virt = true
+    },
+
+    /* Virtual CPU interface */
+    {
+        .region_index = 3,
+        .address = GIC_VCPU_ADDR,
+        .offset = 0,
+        .virt = true
+    },
+    {
+        .region_index = 3,
+        .address = GIC_VCPU_ADDR + 0x10000,
+        .offset = 0x1000,
+        .virt = true
+    },
 };
 
 static inline int arm_gic_ppi_index(int cpu_nr, int ppi_index)
@@ -286,6 +334,9 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", GIC_NUM_SPI_INTR + 32);
     qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
     qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", num_apus);
+    qdev_prop_set_bit(DEVICE(&s->gic), "has-security-extensions", s->secure);
+    qdev_prop_set_bit(DEVICE(&s->gic),
+                      "has-virtualization-extensions", s->virt);
 
     /* Realize APUs before realizing the GIC. KVM requires this.  */
     for (i = 0; i < num_apus; i++) {
@@ -330,19 +381,23 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < XLNX_ZYNQMP_GIC_REGIONS; i++) {
         SysBusDevice *gic = SYS_BUS_DEVICE(&s->gic);
         const XlnxZynqMPGICRegion *r = &xlnx_zynqmp_gic_regions[i];
-        MemoryRegion *mr = sysbus_mmio_get_region(gic, r->region_index);
+        MemoryRegion *mr;
         uint32_t addr = r->address;
         int j;
 
-        sysbus_mmio_map(gic, r->region_index, addr);
+        if (r->virt && !s->virt) {
+            continue;
+        }
 
+        mr = sysbus_mmio_get_region(gic, r->region_index);
         for (j = 0; j < XLNX_ZYNQMP_GIC_ALIASES; j++) {
             MemoryRegion *alias = &s->gic_mr[i][j];
 
-            addr += XLNX_ZYNQMP_GIC_REGION_SIZE;
             memory_region_init_alias(alias, OBJECT(s), "zynqmp-gic-alias", mr,
-                                     0, XLNX_ZYNQMP_GIC_REGION_SIZE);
+                                     r->offset, XLNX_ZYNQMP_GIC_REGION_SIZE);
             memory_region_add_subregion(system_memory, addr, alias);
+
+            addr += XLNX_ZYNQMP_GIC_REGION_SIZE;
         }
     }
 
@@ -352,12 +407,33 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i,
                            qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
                                             ARM_CPU_IRQ));
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + num_apus,
+                           qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
+                                            ARM_CPU_FIQ));
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + num_apus * 2,
+                           qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
+                                            ARM_CPU_VIRQ));
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + num_apus * 3,
+                           qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
+                                            ARM_CPU_VFIQ));
         irq = qdev_get_gpio_in(DEVICE(&s->gic),
                                arm_gic_ppi_index(i, ARM_PHYS_TIMER_PPI));
-        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), 0, irq);
+        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), GTIMER_PHYS, irq);
         irq = qdev_get_gpio_in(DEVICE(&s->gic),
                                arm_gic_ppi_index(i, ARM_VIRT_TIMER_PPI));
-        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), 1, irq);
+        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), GTIMER_VIRT, irq);
+        irq = qdev_get_gpio_in(DEVICE(&s->gic),
+                               arm_gic_ppi_index(i, ARM_HYP_TIMER_PPI));
+        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), GTIMER_HYP, irq);
+        irq = qdev_get_gpio_in(DEVICE(&s->gic),
+                               arm_gic_ppi_index(i, ARM_SEC_TIMER_PPI));
+        qdev_connect_gpio_out(DEVICE(&s->apu_cpu[i]), GTIMER_SEC, irq);
+
+        if (s->virt) {
+            irq = qdev_get_gpio_in(DEVICE(&s->gic),
+                                   arm_gic_ppi_index(i, GIC_MAINTENANCE_PPI));
+            sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i + num_apus * 4, irq);
+        }
     }
 
     if (s->has_rpu) {
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 82b6ec2486..98f925ab84 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -53,7 +53,7 @@
 #define XLNX_ZYNQMP_OCM_RAM_0_ADDRESS 0xFFFC0000
 #define XLNX_ZYNQMP_OCM_RAM_SIZE 0x10000
 
-#define XLNX_ZYNQMP_GIC_REGIONS 2
+#define XLNX_ZYNQMP_GIC_REGIONS 6
 
 /* ZynqMP maps the ARM GIC regions (GICC, GICD ...) at consecutive 64k offsets
  * and under-decodes the 64k region. This mirrors the 4k regions to every 4k
@@ -62,7 +62,7 @@
  */
 
 #define XLNX_ZYNQMP_GIC_REGION_SIZE 0x1000
-#define XLNX_ZYNQMP_GIC_ALIASES     (0x10000 / XLNX_ZYNQMP_GIC_REGION_SIZE - 1)
+#define XLNX_ZYNQMP_GIC_ALIASES     (0x10000 / XLNX_ZYNQMP_GIC_REGION_SIZE)
 
 #define XLNX_ZYNQMP_MAX_LOW_RAM_SIZE    0x80000000ull
 
-- 
2.18.0

