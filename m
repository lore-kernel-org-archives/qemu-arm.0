Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4911491wrq;
        Tue, 19 Jun 2018 02:32:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLscshSZDS0oWK4FFQCZWAs73KALJD1G5L17h6tZSrf+MPZEpuJVsQfmIi8Z9TWGwSzIAZg
X-Received: by 2002:a0c:ad69:: with SMTP id v38-v6mr13372176qvc.120.1529400720067;
        Tue, 19 Jun 2018 02:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529400720; cv=none;
        d=google.com; s=arc-20160816;
        b=Bkag9Lndko4WDIdbnUeJyuhJIRxICDzVbcJ9iBBhlBDO5gT7+Ya9tdKEAjYMTyvQ27
         c5UfbB6xsUD4f9iwkysLuJFigYhPLHlPEYiw4lgoiHFvq1SliesGtbtO67T+VXQDFsf7
         Mu45sj3FvyhYsut2EBaGMf78Mz+4otq2Py0u4+x32sBgpfgCDHpW+MMfr39dPU/N5aq2
         LfXfdAC6whtfxlszpaa80J2gVp/FxHwG8rgHSBhq0OBs5zrz2qocGCZCU3b5KjOKhP8t
         6NMziacXzv0f1tcSY2sZe9TXiyuJDxUpiRZmujtwfEbDHJz8SX/JLhnVVr/IwjXA5Ad9
         bwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=Alv6STC9ppICupHvwc5sMgvab4y8bsO8ackV0Hm69gY=;
        b=Ro4JrWKlLlO759eZFs42diIYCXuMb9srzwSsqTA3EQxyjPnR1ktBH4i8Voy/EsvZ9u
         mmEzeZhaN+KcQP7tewV2YgtEKO5uO0mgyVkqNQqkLg7V0Rml3vdAzx8vQwjb2mBxbjJs
         wF6KktZlWriOIuVPFV8pId1Zi/O/1Y6TcFkAlBWOJ3sxP17tOx7sV650f7yYvUjkQT7E
         xGWgeoWfhwVjywwADhmBHny8CqPt//RPxbQw16fYOBoWKL7sIlPuJIWWgpw2InHpmGlq
         d/fOCc4M73/RvnXlMHSxQNnDHIiHAGMAIa6TnhtujuaQu7XHWmVZKDIv6HwzT1OrGClC
         cIsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=juAasmk0;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="B1xePB/2";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="B1xePB/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q35-v6si4242680qtg.299.2018.06.19.02.31.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jun 2018 02:32:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=juAasmk0;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="B1xePB/2";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="B1xePB/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVCzX-0005SE-Hf
	for alex.bennee@linaro.org; Tue, 19 Jun 2018 05:31:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fVCzG-0005Pn-7P
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 05:31:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fVCzB-0006Gh-W2
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 05:31:42 -0400
Received: from greensocs.com ([193.104.36.180]:42328)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fVCzB-0006GQ-KD; Tue, 19 Jun 2018 05:31:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 630E144B867;
	Tue, 19 Jun 2018 11:31:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529400692;
	bh=Fj29wdF5CmRksCE7VDx3rA6qm05ef4ZgJnRqWkAFRI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=juAasmk0XJ6bbn9nFHOMtm+OPpSQLeme8mAKAoD9TBmbXGyelrZ9fhzrOVRg53Xgh
	5uVjlvgNC338o9rtcHW/OD4n1UrRYJdnyw2f/LoIbMckbbb6CFqfvKJZMn0UfrNApF
	G5ZImBnmEFKB95y0KA1ZLTHFqgzWPQWpCN22EpoU=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=B1xePB/2;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=B1xePB/2
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FuKXCwsxiKNO; Tue, 19 Jun 2018 11:31:31 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id D8D16400FEF; Tue, 19 Jun 2018 11:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529400689;
	bh=Fj29wdF5CmRksCE7VDx3rA6qm05ef4ZgJnRqWkAFRI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B1xePB/2PpF9qY4uF5AG8n7CyU93CDRAlhoTw7W9XiXqQ5rPtsAfEIFM2gGla1P5T
	GJE2SZnb1UIKdsc3PfcMnHivpjOQ/ceV6Ko9+tHXDa0uNjTz3un2ax5v4hvg2u2JC+
	RHUjwk1VG1RrS4BtojOdnhj5qv/WByPttev6i4RM=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 83DB544B864;
	Tue, 19 Jun 2018 11:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529400689;
	bh=Fj29wdF5CmRksCE7VDx3rA6qm05ef4ZgJnRqWkAFRI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=B1xePB/2PpF9qY4uF5AG8n7CyU93CDRAlhoTw7W9XiXqQ5rPtsAfEIFM2gGla1P5T
	GJE2SZnb1UIKdsc3PfcMnHivpjOQ/ceV6Ko9+tHXDa0uNjTz3un2ax5v4hvg2u2JC+
	RHUjwk1VG1RrS4BtojOdnhj5qv/WByPttev6i4RM=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Tue, 19 Jun 2018 11:31:24 +0200
Message-Id: <20180619093124.24011-8-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180619093124.24011-1-luc.michel@greensocs.com>
References: <20180619093124.24011-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 7/7] xlnx-zynqmp: Improve GIC wiring and MMIO
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
X-TUID: GwC++yEbDIlF

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
2.17.1

