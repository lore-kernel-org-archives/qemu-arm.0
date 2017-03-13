Received: by 10.25.77.4 with SMTP id a4csp1275194lfb;
        Mon, 13 Mar 2017 11:05:49 -0700 (PDT)
X-Received: by 10.200.55.65 with SMTP id p1mr34547992qtb.202.1489428349898;
        Mon, 13 Mar 2017 11:05:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z46si1009191qtg.20.2017.03.13.11.05.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Mar 2017 11:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cnULr-0003wP-5q
	for alex.bennee@linaro.org; Mon, 13 Mar 2017 14:05:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cnULY-0003k9-Cd
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:05:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cnULX-0001Li-DS
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:05:28 -0400
Received: from mail.kernel.org ([198.145.29.136]:50726)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cnULX-0001L1-3m; Mon, 13 Mar 2017 14:05:27 -0400
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 488F9203F1;
	Mon, 13 Mar 2017 18:05:25 +0000 (UTC)
Received: from localhost.localdomain (bzq-79-180-56-222.red.bezeqint.net
	[79.180.56.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1794E203ED;
	Mon, 13 Mar 2017 18:05:21 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon, 13 Mar 2017 20:04:29 +0200
Message-Id: <20170313180432.7067-3-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170313180432.7067-1-krzk@kernel.org>
References: <20170313180432.7067-1-krzk@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-arm] [PATCH v2 2/5] hw/intc/exynos4210_gic: Use more
 meaningful name for local variable
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e/Ey77vJHeq4

There are to SysBusDevice variables in exynos4210_gic_realize()
function: one for the device itself and second for arm_gic device.  Add
a prefix "gic" to the second one so it will be easier to understand the
code.

While at it, put local uninitialized 'i' variable at the end, next to
other uninitialized ones.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/exynos4210_gic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index 222cfd6c6387..9a2254f0b13c 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -297,21 +297,21 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
     Exynos4210GicState *s = EXYNOS4210_GIC(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     Object *obj = OBJECT(dev);
-    uint32_t i;
     const char cpu_prefix[] = "exynos4210-gic-alias_cpu";
     const char dist_prefix[] = "exynos4210-gic-alias_dist";
     char cpu_alias_name[sizeof(cpu_prefix) + 3];
     char dist_alias_name[sizeof(cpu_prefix) + 3];
-    SysBusDevice *busdev;
+    SysBusDevice *gicbusdev;
+    uint32_t i;
 
     s->gic = qdev_create(NULL, "arm_gic");
     qdev_prop_set_uint32(s->gic, "num-cpu", s->num_cpu);
     qdev_prop_set_uint32(s->gic, "num-irq", EXYNOS4210_GIC_NIRQ);
     qdev_init_nofail(s->gic);
-    busdev = SYS_BUS_DEVICE(s->gic);
+    gicbusdev = SYS_BUS_DEVICE(s->gic);
 
     /* Pass through outbound IRQ lines from the GIC */
-    sysbus_pass_irq(sbd, busdev);
+    sysbus_pass_irq(sbd, gicbusdev);
 
     /* Pass through inbound GPIO lines to the GIC */
     qdev_init_gpio_in(dev, exynos4210_gic_set_irq,
@@ -322,7 +322,7 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
         sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
         memory_region_init_alias(&s->cpu_alias[i], obj,
                                  cpu_alias_name,
-                                 sysbus_mmio_get_region(busdev, 1),
+                                 sysbus_mmio_get_region(gicbusdev, 1),
                                  0,
                                  EXYNOS4210_GIC_CPU_REGION_SIZE);
         memory_region_add_subregion(&s->cpu_container,
@@ -332,7 +332,7 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
         sprintf(dist_alias_name, "%s%x", dist_prefix, i);
         memory_region_init_alias(&s->dist_alias[i], obj,
                                  dist_alias_name,
-                                 sysbus_mmio_get_region(busdev, 0),
+                                 sysbus_mmio_get_region(gicbusdev, 0),
                                  0,
                                  EXYNOS4210_GIC_DIST_REGION_SIZE);
         memory_region_add_subregion(&s->dist_container,
-- 
2.9.3

