Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp589186wrq;
        Wed, 6 Jun 2018 02:32:21 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIOhYDRm9ReSf8N/CZYhtKkG7evoSiZ2kN5oVcMlYJarmbR7ZHtZEykZBd94phn9hN75B1V
X-Received: by 2002:ac8:44d3:: with SMTP id b19-v6mr1863200qto.167.1528277541633;
        Wed, 06 Jun 2018 02:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528277541; cv=none;
        d=google.com; s=arc-20160816;
        b=fGh9XWSbZvz5tC8OsJ0E0KUA5ffemRKPLzcWdyy8APJnGr1VsCXkijVNKowWYRj1Ln
         puJHPeQuZhEXr0MezhYXZyUSJZohv0BAs7ASTsNmbHA70XHSMWJqq5y4JkShiv+VTfYr
         VP/fiDhMQ3bSghpXLIpnkczyqQYPJ8k4blrL+LnqAAobFsgi8cHlc+J4WXsUe68h2Hwx
         WPM8wdq8w9SwTf7aAWWkM5RCIQNMoc5iSrKAGeaR2kYjwtHTkgVwiF/1gTyoC5z4LW0n
         gu9qqRBr7ruIlppL5Uc9/FLuaso5wmsynnqXX8enX8Evz8ZQ5egHvguRFKhdSxNPJNky
         GGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=L1MtYyTpnvp5Z7BQnxWLwmps0FuqyHIqIvv9Bf9qF3c=;
        b=EgEh5EPbKAg96XQGDyTMC3rbtRZ3kA0ha9i/opGxX0sksMGnaaWlxF/FyqnvINqJDq
         Js61w/gFsjr4ZGmi8tfLQF8Kbsgj0OJj3NiOiVLm8LXzkzenfbIi4RP/rs5EhRn3gkCF
         xv3WcRkLiyiGYp7NzGCyKqYz5q70nmmK2sJzsKAFhArQRsvLLLcQ4TSkwFyUIgkpScKD
         fPxQ9WkAU/6cpvxw9fy/qXgJrHyhDblh45sexhTLtoz1RqOfpdkzwd2OqKY6DXMeBAia
         ySekaX1gY9yHXuV2PneEEH3YLlfSfI0XEvch5ahAQJ9H3IbWU/r29o4+2Bqeel5AhHMq
         K8pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=iF4/piJG;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QyNCd7Bc;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QyNCd7Bc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 22-v6si4327895qkz.388.2018.06.06.02.32.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 02:32:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=iF4/piJG;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QyNCd7Bc;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QyNCd7Bc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQUnl-0001y1-4V
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 05:32:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fQUnG-0001iN-9J
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 05:31:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fQUnD-0003hS-O0
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 05:31:50 -0400
Received: from greensocs.com ([193.104.36.180]:53738)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fQUnD-0003h5-Cc; Wed, 06 Jun 2018 05:31:47 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 5E37844354B;
	Wed,  6 Jun 2018 11:31:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277501;
	bh=UIVXF76L9wDKBMZK9S4f6MQWplDeldy2bXYBROlIlmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iF4/piJGwLhoXzvpAU+17qmjlg9kux5dYKAn+yLYqL+WKMZzQp7SRTvUPD54bxn8E
	e1HWMPrGGjfXU2BAG/dO++VJljWBCVEjwlRkB3Ye2lTK3ze0HSWWKN/l8JZ4EfbZk+
	eS11jjE5zcaW2Uz2pidorT3T8oV5Pb8IGm6poy1c=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=QyNCd7Bc;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=QyNCd7Bc
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id daKf1soTV84N; Wed,  6 Jun 2018 11:31:40 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 39A44443546; Wed,  6 Jun 2018 11:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277499;
	bh=UIVXF76L9wDKBMZK9S4f6MQWplDeldy2bXYBROlIlmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QyNCd7BcnbdHTs4TbQiGxMIAhxqvrFX5OJAoBke5/3WK5SNY+BdP1rrcg6xXjSZ5H
	o8EOTNoU0dHowxLBUqaLLD5ZLapBSI6ZmbRfdg05RSJfBGYJv8Am/YLlPWJ37axspM
	z2mqNLXQm0QHPIleZoQ6p7DR97P1TzuDhs2dgq0M=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id CA9EC44355F;
	Wed,  6 Jun 2018 11:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277499;
	bh=UIVXF76L9wDKBMZK9S4f6MQWplDeldy2bXYBROlIlmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QyNCd7BcnbdHTs4TbQiGxMIAhxqvrFX5OJAoBke5/3WK5SNY+BdP1rrcg6xXjSZ5H
	o8EOTNoU0dHowxLBUqaLLD5ZLapBSI6ZmbRfdg05RSJfBGYJv8Am/YLlPWJ37axspM
	z2mqNLXQm0QHPIleZoQ6p7DR97P1TzuDhs2dgq0M=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Wed,  6 Jun 2018 11:31:01 +0200
Message-Id: <20180606093101.30518-7-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180606093101.30518-1-luc.michel@greensocs.com>
References: <20180606093101.30518-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 6/6] xlnx-zynqmp: Improve GIC wiring and MMIO
 mapping
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
	Jan Kiszka <jan.kiszka@web.de>, Luc MICHEL <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mrbMQYHwGe+G

From: Luc MICHEL <luc.michel@greensocs.com>

This commit improve the way the GIC is realized and connected in the
ZynqMP SoC. The security extensions are enabled only if requested in the
machine state. The same goes for the virtualization extensions.

All the GIC to APU CPU(s) IRQ lines are now connected, including FIQ,
vIRQ and vFIQ. The missing CPU to GIC timers IRQ connections are also
added (HYP and SEC timers).

The GIC maintenance IRQs are back-wired to the correct GIC PPIs.

Finally, the MMIO mappings are reworked to take into account the ZynqMP
specificities. the GIC (v)CPU interface is aliased 16 times:
  * for the firsts 0x1000 bytes from 0xf9010000 to 0xf901f000
  * for the seconds 0x1000 bytes from 0xf9020000 to 0xf902f000
Mappings of the virtual interface and virtual CPU interface are mapped
only when virtualization extensions are requested. The
XlnxZynqMPGICRegion struct has been enhanced to be able to catch all
this information.

Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
---
 hw/arm/xlnx-zynqmp.c         | 92 ++++++++++++++++++++++++++++++++----
 include/hw/arm/xlnx-zynqmp.h |  4 +-
 2 files changed, 86 insertions(+), 10 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 2045b9d71e..4d17c70ec6 100644
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
2.17.0

