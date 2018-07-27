Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp509432wru;
        Fri, 27 Jul 2018 02:58:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe43lIcE4IRDFlihmg8kP9Tl3Qz7VX5NGDv8ZRfKNLAUV4uIJ/lEDIJANNhvnuass7PlP5N
X-Received: by 2002:a0c:e9ce:: with SMTP id q14-v6mr4992690qvo.106.1532685529827;
        Fri, 27 Jul 2018 02:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685529; cv=none;
        d=google.com; s=arc-20160816;
        b=v27LWKFCZm0H6tsCx6pym35S5PNz5aE1+0s+31/Q9osjaMmuXKlPWE1cDr73vbT0jx
         Qa5NzeLl3D+UyZv4e1vmDshWGZms4+p2Zd2XVtyJHIk0D6cbNnqQCuIzw8swWEIy5dRW
         1rWlafJ/rxteVNKp6/qdbwIbsl/ZjwL0BF4fe8Nwn1o5Vw2Jm0URZw7kss3MeN2Eu339
         AW0+JGoEqaQxoepujjKmZjNeVb04ePIty0tzmGyqDppmouTilc0aXaC3UrXg+/kAJXa1
         J17LoK0UInwMejZQVav+Zg6gd3DnUJffKxhAsM1+x/4Vtac9lx4oVKXCdORvQRrSgnSJ
         FyOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=K0MDp735OJWKJ5FpDfI6an5LOEnE7ZmQ0mQDog4Tf+Y=;
        b=HFDAXkmW61gNfrBktO8/VTC8RU0Qgs9sX/+ZiHBas/oU+3tWmIK12/FTFz8Xi1+BRh
         joZAldhppsl+lMyd2lo2nvbbGr9E53zjz3KwBBJ+G7aytfIbocwZBLjAV3c+w0lnJYHS
         E1AG2QhhS7d3bnRTcpmXsU5/I1k702RRYJBLLOWPbtTb5m6Ib9VZnEuvkgrbUNLv5zm0
         +TH30Ljzi39vjLg5Em6ifl+KCeoYQjmUgZqw2Qnh1dBQOKnlPy1cZLvlgVteitF4wbCT
         OmOPWuaOLCyiSH5I4AmEQR2HJz6K87Xvc1nrDMeHiJig6pQd0PJ6VnV/A7fqtHtIDgra
         PDKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=T1uoHYom;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=6UXUneoJ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=6UXUneoJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l3-v6si3468870qkc.32.2018.07.27.02.58.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=T1uoHYom;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=6UXUneoJ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=6UXUneoJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40055 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizWL-00075M-7V
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:58:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSf-0003e0-Pc
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006C9-NR
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:01 -0400
Received: from greensocs.com ([193.104.36.180]:47517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSZ-00068l-Cs; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 5A956443557;
	Fri, 27 Jul 2018 11:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685293;
	bh=O6QDoy0sN0FD36p5qvRQ8d/ZzOPZvnpLjxX+1yuYjJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T1uoHYomK7n3X2heAVMY+91hUXKSeK2Q1ROxPEtK8iY1TdPDC07d9YoBYEiVkXZn1
	c6T0BLQBI3nsRJnuT3qQtWsKSgx+31GMPVQi/0zfdy5EZDHcDCvJLj/K1vcNq5s530
	KaCW+Z1Dx8Vg5AP4L2QQ0AoGwMByoHFwFeMpg6VY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=6UXUneoJ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=6UXUneoJ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a9VFysUyp8CO; Fri, 27 Jul 2018 11:54:52 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 9D82B44B82A; Fri, 27 Jul 2018 11:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685290;
	bh=O6QDoy0sN0FD36p5qvRQ8d/ZzOPZvnpLjxX+1yuYjJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=6UXUneoJpv2JnlBIcN3fV24YaDq+zPUQTRQb7fUiH/anQ2WQuAYxWk5UxHzYGxjwy
	QO4s4p/txEbsWHVJWRfyDlLC5D4HtIhxgl9YTfHug0/RMA+xHCK3TPm5uDkrX0dGaY
	Rnosa1fUL4x8sggIbFl01HP8XmXi3clwhSk0P+/w=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 4A471400DC8;
	Fri, 27 Jul 2018 11:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685290;
	bh=O6QDoy0sN0FD36p5qvRQ8d/ZzOPZvnpLjxX+1yuYjJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=6UXUneoJpv2JnlBIcN3fV24YaDq+zPUQTRQb7fUiH/anQ2WQuAYxWk5UxHzYGxjwy
	QO4s4p/txEbsWHVJWRfyDlLC5D4HtIhxgl9YTfHug0/RMA+xHCK3TPm5uDkrX0dGaY
	Rnosa1fUL4x8sggIbFl01HP8XmXi3clwhSk0P+/w=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:20 +0200
Message-Id: <20180727095421.386-20-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 19/20] xlnx-zynqmp: Improve GIC wiring and
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
X-TUID: vl0Y2QD1f/RF

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
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c         | 92 ++++++++++++++++++++++++++++++++----
 include/hw/arm/xlnx-zynqmp.h |  4 +-
 2 files changed, 86 insertions(+), 10 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 8de4868eb9..c195040350 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -27,16 +27,21 @@
 
 #define GIC_NUM_SPI_INTR 160
 
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
 #define SATA_NUM_PORTS      2
 
@@ -109,15 +114,58 @@ static const int adma_ch_intr[XLNX_ZYNQMP_NUM_ADMA_CH] = {
 };
 
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
 {
     return GIC_NUM_SPI_INTR + cpu_nr * GIC_INTERNAL + ppi_index;
@@ -279,10 +327,13 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     }
 
     qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", GIC_NUM_SPI_INTR + 32);
     qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
     qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", num_apus);
+    qdev_prop_set_bit(DEVICE(&s->gic), "has-security-extensions", s->secure);
+    qdev_prop_set_bit(DEVICE(&s->gic),
+                      "has-virtualization-extensions", s->virt);
 
     /* Realize APUs before realizing the GIC. KVM requires this.  */
     for (i = 0; i < num_apus; i++) {
         char *name;
 
@@ -323,38 +374,63 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     assert(ARRAY_SIZE(xlnx_zynqmp_gic_regions) == XLNX_ZYNQMP_GIC_REGIONS);
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
 
     for (i = 0; i < num_apus; i++) {
         qemu_irq irq;
 
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
         info_report("The 'has_rpu' property is no longer required, to use the "
                     "RPUs just use -smp 6.");
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 82b6ec2486..98f925ab84 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -51,20 +51,20 @@
 
 #define XLNX_ZYNQMP_NUM_OCM_BANKS 4
 #define XLNX_ZYNQMP_OCM_RAM_0_ADDRESS 0xFFFC0000
 #define XLNX_ZYNQMP_OCM_RAM_SIZE 0x10000
 
-#define XLNX_ZYNQMP_GIC_REGIONS 2
+#define XLNX_ZYNQMP_GIC_REGIONS 6
 
 /* ZynqMP maps the ARM GIC regions (GICC, GICD ...) at consecutive 64k offsets
  * and under-decodes the 64k region. This mirrors the 4k regions to every 4k
  * aligned address in the 64k region. To implement each GIC region needs a
  * number of memory region aliases.
  */
 
 #define XLNX_ZYNQMP_GIC_REGION_SIZE 0x1000
-#define XLNX_ZYNQMP_GIC_ALIASES     (0x10000 / XLNX_ZYNQMP_GIC_REGION_SIZE - 1)
+#define XLNX_ZYNQMP_GIC_ALIASES     (0x10000 / XLNX_ZYNQMP_GIC_REGION_SIZE)
 
 #define XLNX_ZYNQMP_MAX_LOW_RAM_SIZE    0x80000000ull
 
 #define XLNX_ZYNQMP_MAX_HIGH_RAM_SIZE   0x800000000ull
 #define XLNX_ZYNQMP_HIGH_RAM_START      0x800000000ull
-- 
2.18.0

