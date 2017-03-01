Received: by 10.25.0.147 with SMTP id 141csp1984646lfa;
        Wed, 1 Mar 2017 10:27:46 -0800 (PST)
X-Received: by 10.200.49.162 with SMTP id h31mr12814390qte.50.1488392865893;
        Wed, 01 Mar 2017 10:27:45 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si4853348qkt.312.2017.03.01.10.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Mar 2017 10:27:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cj8yV-0004zp-42
	for alex.bennee@linaro.org; Wed, 01 Mar 2017 13:27:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cj8xY-0004lE-JX
	for qemu-devel@nongnu.org; Wed, 01 Mar 2017 13:26:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cj8xX-0006uu-O6
	for qemu-devel@nongnu.org; Wed, 01 Mar 2017 13:26:44 -0500
Received: from mail.kernel.org ([198.145.29.136]:41330)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cj8xU-0006se-Oa; Wed, 01 Mar 2017 13:26:40 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id D71AC20383;
	Wed,  1 Mar 2017 18:26:38 +0000 (UTC)
Received: from localhost.localdomain (bzq-109-67-52-244.red.bezeqint.net
	[109.67.52.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A6D212037F;
	Wed,  1 Mar 2017 18:26:35 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  1 Mar 2017 20:26:15 +0200
Message-Id: <20170301182618.22395-3-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170301182618.22395-1-krzk@kernel.org>
References: <20170301182618.22395-1-krzk@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: [Qemu-devel] [PATCH 2/5] hw/intc/exynos4210_gic: Use more
 meaningful name for local variable
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V3tC+8KLqLG3

There are to SysBusDevice variables in exynos4210_gic_realize()
function: one for the device itself and second for arm_gic device.  Add
a prefix "gic" to the second one so it will be easier to understand the
code.

While at it, put local uninitialized 'i' variable at the end, next to
other uninitialized ones.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 hw/intc/exynos4210_gic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index 5986e54d39c9..4f7a8b6ca709 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -296,21 +296,21 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
 {
     Exynos4210GicState *s = EXYNOS4210_GIC(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
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
@@ -321,7 +321,7 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
         sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
         memory_region_init_alias(&s->cpu_alias[i], OBJECT(s),
                                  cpu_alias_name,
-                                 sysbus_mmio_get_region(busdev, 1),
+                                 sysbus_mmio_get_region(gicbusdev, 1),
                                  0,
                                  EXYNOS4210_GIC_CPU_REGION_SIZE);
         memory_region_add_subregion(&s->cpu_container,
@@ -331,7 +331,7 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
         sprintf(dist_alias_name, "%s%x", dist_prefix, i);
         memory_region_init_alias(&s->dist_alias[i], OBJECT(s),
                                  dist_alias_name,
-                                 sysbus_mmio_get_region(busdev, 0),
+                                 sysbus_mmio_get_region(gicbusdev, 0),
                                  0,
                                  EXYNOS4210_GIC_DIST_REGION_SIZE);
         memory_region_add_subregion(&s->dist_container,
-- 
2.9.3

