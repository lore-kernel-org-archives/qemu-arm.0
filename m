Received: by 10.103.124.15 with SMTP id x15csp1047550vsc;
        Sun, 21 May 2017 08:30:30 -0700 (PDT)
X-Received: by 10.200.39.51 with SMTP id g48mr3191792qtg.163.1495380630326;
        Sun, 21 May 2017 08:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495380630; cv=none;
        d=google.com; s=arc-20160816;
        b=pf0xPqcAr5zdue8xSiTI286qqc8nxkW39Mf4IDa3ZYxDNiVBwCDS0Cl3s8lp7NlK4P
         hgt2NzcrW06F5nLtI+uphru8Yx1kjEFrMQjqNzNy66JRTPv9HPEVXsiFqVqvm462HimQ
         AR80bnM+2pkk5Nl3iES0OL54zEPCFgRQnGjG1oyYRWmZjk9NAOkSWC7P8gclAVyPgHli
         uKrxl7WdOQW17njzwxocOoYf00IanUGC6GV06sRwJhgUh5yoKFlZ9imCm3AIuRfPP3hv
         k9Dd8k9nd7mavWSDFdH9jL7yLLQh2zXpty6Ee6l1ZXM8h1J3NnBuJAc9aDQ3P8IZbX0l
         DBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=bLa5AXjPuh/YgVeOY+pkAy4gO34o5uvSbzOpSzRe+Hg=;
        b=XatDeec9vdSs0WlcSoAEZI17l1TFqwcSmbyahvbKhNwMPq3hdjU37cQ4HEzznlNJWD
         FsEukpimQdyvlmvpqQ3GhNlU9Ovj8C7Kbt6dILES8le0kLwoRu4kl1BYu1nar8kUCkLv
         77k0TXMlqIiz8tilLsbTrbt5iCfWeA0lJIntQlYNng59+dy5Dx/jQJvX3ImcBX8FeZWY
         MoexNzTtnzZqSqTLWtC+TvF3NISwNMEDdNKk4OdWLuCCddobuSR/nNf2haC/59ojuwaG
         tNRI1w5RZRQcjY9KElGE4W1SoC6XRRSELd2QNmoqYZO+qtY1g+tGzhSF9HGa0g2ySPmR
         XGZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s44si15440432qtb.69.2017.05.21.08.30.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 May 2017 08:30:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCSoP-0002Wm-Oi
	for alex.bennee@linaro.org; Sun, 21 May 2017 11:30:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSo0-0002FA-QF
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSnz-00078T-FR
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:49556)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dCSnz-00077X-8u; Sun, 21 May 2017 11:30:03 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 27626239B6;
	Sun, 21 May 2017 15:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27626239B6
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun, 21 May 2017 17:29:40 +0200
Message-Id: <20170521152949.15338-3-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170521152949.15338-1-krzk@kernel.org>
References: <20170521152949.15338-1-krzk@kernel.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v3 02/11] hw/intc/exynos4210_gic: Use more
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 644XICgPGntP

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

