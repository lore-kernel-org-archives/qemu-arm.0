Received: by 10.25.208.137 with SMTP id h131csp3300104lfg;
        Thu, 19 May 2016 15:59:02 -0700 (PDT)
X-Received: by 10.140.106.228 with SMTP id e91mr16528036qgf.75.1463698741935;
        Thu, 19 May 2016 15:59:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v188si15030456qhe.47.2016.05.19.15.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 May 2016 15:59:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52447 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b3WuD-000438-Dc
	for alex.bennee@linaro.org; Thu, 19 May 2016 18:59:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b3Wpz-0008VA-0H
	for qemu-arm@nongnu.org; Thu, 19 May 2016 18:54:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b3Wpr-0007HN-Va
	for qemu-arm@nongnu.org; Thu, 19 May 2016 18:54:37 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:36596)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1b3Wpn-0007GD-SJ; Thu, 19 May 2016 18:54:28 -0400
Received: by mail-wm0-x242.google.com with SMTP id w143so24718068wmw.3;
	Thu, 19 May 2016 15:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eguJGXoW2JNWNoeUK84+yRlcn5YhLOeAn6BAZbSkcLY=;
	b=QCGqPBJLKgkcxER37u9HTQZlCWjRGLOGCUdmsHYZVSq/szfdrwTQou3HmLgV8n6iSi
	yrn50eWLOjhoEygU/OfHGVzb5LuJocSTyD2DejfXhYOpTivpw0Ek8+7EZ0bzhnelN9Q3
	awkenJN4E5LzaneAtNOHuhpE6TLNB/QQQ5OitFWh+3iD1xMTHOBKI1l7OVHuX65NLN6u
	GNG+PBnXhGMqpEw1OGhoUH/vEzdJwtjEjlSNhrbvd4VUDfjrmFIgeGObeCAJ3xAcIPXC
	yTbCHnzOEt5zQLFDQlXRGza6zgG3EqA7t6RekxwWo0S3aELX+ktjFC0S+XVCMGcY5Iwn
	Fm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eguJGXoW2JNWNoeUK84+yRlcn5YhLOeAn6BAZbSkcLY=;
	b=KTTJolCwMrXTBrTlDiZggXl7npqiPHRVLnZnVosSoThBubl2XFpoiyKVEr+9U/EkXP
	VOv5qXsEeSoCNViO4cA58PaTdPzW67DTZn6xJNHY+vwF8GHkn6rp51ERo/fTLuMwhrsA
	5LsJs1WWO8dfOUzl2en9TnHipEmXjED2094QzrT/skG4UpEflJChs32IUPsW5h2ku6PN
	1DE3LtBe6cpJA9SpG7RBsUQtwbSKqq7Umj0Mwx/2XEU9XEGVCXONCYb/pRGM0TtVlSBe
	ZFRcwCccEyMql/3Ag4FsJdaahmOV45vmnozrf1DuGegDC5IJk11/LqnZDWmL+eUCPAHA
	k/1Q==
X-Gm-Message-State: AOPr4FXq/VMHwCptCjvhjIPy5k8IhA6tVFtJxKtwpFIGHTyZeVX8T24pVhCsPWYgNI/fLw==
X-Received: by 10.28.157.143 with SMTP id g137mr208150wme.29.1463698467180;
	Thu, 19 May 2016 15:54:27 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	e8sm16698584wjm.23.2016.05.19.15.54.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 May 2016 15:54:26 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 20 May 2016 00:54:18 +0200
Message-Id: <1463698459-31312-5-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
References: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-arm] [PATCH v1 4/5] xlnx-zynqmp: Delay realization of GIC
 until post CPU realization
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tyoZRHSuUTRY

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Delay the realization of the GIC until after CPUs are
realized. This is needed for KVM as the in-kernel GIC
model will fail if it is realized with no available CPUs.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c | 56 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index c180206..0648028 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -258,33 +258,9 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
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
@@ -310,6 +286,36 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
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

