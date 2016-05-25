Received: by 10.25.30.65 with SMTP id e62csp1240572lfe;
        Wed, 25 May 2016 04:08:15 -0700 (PDT)
X-Received: by 10.140.238.66 with SMTP id j63mr2825139qhc.48.1464174495449;
        Wed, 25 May 2016 04:08:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o131si7323755qho.15.2016.05.25.04.08.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 04:08:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5Wfe-0008Aw-Nb
	for alex.bennee@linaro.org; Wed, 25 May 2016 07:08:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b5WQm-00039F-Az
	for qemu-devel@nongnu.org; Wed, 25 May 2016 06:52:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b5WQj-00010y-35
	for qemu-devel@nongnu.org; Wed, 25 May 2016 06:52:52 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:34959)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1b5WQi-00010q-PD; Wed, 25 May 2016 06:52:49 -0400
Received: by mail-wm0-x244.google.com with SMTP id f75so14169648wmf.2;
	Wed, 25 May 2016 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4R4PV2SIQFhroBxLvuog6y+NXsbHS7jruVtrEyyw3Co=;
	b=Qu8cX42ZNDvLMZf1TbJL//SHtul7ydvNApCpCW/9TnAoUz8igrvsEwStnSOFxSaWsl
	Lspwmi6hu6KivnVEhyohTnPHDJf3HSNrNR7DlAynHKQzuNRr4XsnT/2f0Utfd9slSJf2
	trV+ueZEvlQ98/uPoPaoCQGruy+66fjeZaCPgKPa7o2uPBvl52dFLFLv5JV5uEwjuq9K
	1io0Z7/c9KiuGfxU4NrtYs/DN8xK6ygnXuvlUW+kx5y6aDVR/0PcDs555wurIYLwmlua
	aOquoOf4jwrZasdeUBLENNsZxLnvpB3NqPIQrvLDjvo3gjYdjRoMsMvVfXILfWnftcb+
	GLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4R4PV2SIQFhroBxLvuog6y+NXsbHS7jruVtrEyyw3Co=;
	b=HwJvCJ/A1y6zeA6z4eUuxlMwWbx2NFynUfLbfEMdSKWwm35h/keQb491uCowmFaU0D
	yB0QR89On3PhSxrLOt4NXJhnNN03z9RDPSXNTUBbUn/iQlKp1Xslc6p03SmU2azTC2Mn
	Z7kftlqZamaekyzRriFXRudCVtMS+wtw4jBp0oTxKS7pkQ3HOoZoS7c9pkgYfYAgtTCg
	hi4Ysg1FoNHY12WPMDmt+rY8Bfw8kOHZVqaVd3EnglhcDBAVxcYge9hUBKQc3WnfQQhv
	1bJFThsVxg1bcTu8ZJFZARURrGBwtiLbolOeBcFQYDOkGQIEH1apmMpaCrkaiVyBdfc6
	JElg==
X-Gm-Message-State: ALyK8tJDJDx14LPqePICdmVXuxOY+xG9Wiboh67GKjNjA9XXQZVARSt+OpJ3UCdIF21WGA==
X-Received: by 10.28.93.135 with SMTP id r129mr2658253wmb.86.1464173568032;
	Wed, 25 May 2016 03:52:48 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	x124sm8564275wmg.24.2016.05.25.03.52.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 May 2016 03:52:46 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 May 2016 12:52:34 +0200
Message-Id: <1464173555-12800-4-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464173555-12800-1-git-send-email-edgar.iglesias@gmail.com>
References: <1464173555-12800-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: [Qemu-devel] [PATCH v2 3/4] xlnx-zynqmp: Delay realization of GIC
 until post CPU realization
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	crosthwaite.peter@gmail.com, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rTwfn7atWtj9

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Delay the realization of the GIC until after CPUs are
realized. This is needed for KVM as the in-kernel GIC
model will fail if it is realized with no available CPUs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c | 56 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 3a8af6a..db5b82b 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -224,33 +224,9 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     qdev_prop_set_uint32(DEVICE(&s->gic), "num-irq", GIC_NUM_SPI_INTR + 32);
     qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
     qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", XLNX_ZYNQMP_NUM_APU_CPUS);
-    object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    assert(ARRAY_SIZE(xlnx_zynqmp_gic_regions) == XLNX_ZYNQMP_GIC_REGIONS);
-    for (i = 0; i < XLNX_ZYNQMP_GIC_REGIONS; i++) {
-        SysBusDevice *gic = SYS_BUS_DEVICE(&s->gic);
-        const XlnxZynqMPGICRegion *r = &xlnx_zynqmp_gic_regions[i];
-        MemoryRegion *mr = sysbus_mmio_get_region(gic, r->region_index);
-        uint32_t addr = r->address;
-        int j;
-
-        sysbus_mmio_map(gic, r->region_index, addr);
-
-        for (j = 0; j < XLNX_ZYNQMP_GIC_ALIASES; j++) {
-            MemoryRegion *alias = &s->gic_mr[i][j];
-
-            addr += XLNX_ZYNQMP_GIC_REGION_SIZE;
-            memory_region_init_alias(alias, OBJECT(s), "zynqmp-gic-alias", mr,
-                                     0, XLNX_ZYNQMP_GIC_REGION_SIZE);
-            memory_region_add_subregion(system_memory, addr, alias);
-        }
-    }
 
+    /* Realize APUs before realizing the GIC. KVM requires this.  */
     for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
-        qemu_irq irq;
         char *name;
 
         object_property_set_int(OBJECT(&s->apu_cpu[i]), QEMU_PSCI_CONDUIT_SMC,
@@ -276,6 +252,36 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
             error_propagate(errp, err);
             return;
         }
+    }
+
+    object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    assert(ARRAY_SIZE(xlnx_zynqmp_gic_regions) == XLNX_ZYNQMP_GIC_REGIONS);
+    for (i = 0; i < XLNX_ZYNQMP_GIC_REGIONS; i++) {
+        SysBusDevice *gic = SYS_BUS_DEVICE(&s->gic);
+        const XlnxZynqMPGICRegion *r = &xlnx_zynqmp_gic_regions[i];
+        MemoryRegion *mr = sysbus_mmio_get_region(gic, r->region_index);
+        uint32_t addr = r->address;
+        int j;
+
+        sysbus_mmio_map(gic, r->region_index, addr);
+
+        for (j = 0; j < XLNX_ZYNQMP_GIC_ALIASES; j++) {
+            MemoryRegion *alias = &s->gic_mr[i][j];
+
+            addr += XLNX_ZYNQMP_GIC_REGION_SIZE;
+            memory_region_init_alias(alias, OBJECT(s), "zynqmp-gic-alias", mr,
+                                     0, XLNX_ZYNQMP_GIC_REGION_SIZE);
+            memory_region_add_subregion(system_memory, addr, alias);
+        }
+    }
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
+        qemu_irq irq;
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gic), i,
                            qdev_get_gpio_in(DEVICE(&s->apu_cpu[i]),
-- 
2.5.0

