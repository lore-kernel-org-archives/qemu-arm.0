Received: by 10.25.0.23 with SMTP id 23csp24941lfa;
        Fri, 2 Jun 2017 09:40:49 -0700 (PDT)
X-Received: by 10.200.52.221 with SMTP id x29mr9964276qtb.70.1496421649591;
        Fri, 02 Jun 2017 09:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496421649; cv=none;
        d=google.com; s=arc-20160816;
        b=Hv5ES2A/Dk3qgu8HoeMIpsNwf7LYZPvywzGQQgtmnBw1TKWKCVpS2hHSIh8ed+qQW8
         +itqGkmLsodgncQvMSkuV8v0+XoiB2yBSnq0pRqVdGUgPXhz8s3bjxx66mCf2asSYQXY
         t7FzHEDjwjaYwgaMJ0rf97KgyZQwlV0EDyAUAabE1+gygk2DFJqET96FrBIU27fOB6K6
         4vP8zeLgSPBQgakpULZXHDqgqriTLZA9oWFS9Wq6uMI/UtcAkbCvHIuRveqAA54lsVJq
         8OBO3WE05ejbV0h3bYdlJIOTFGNlVLiNHdOjDp2Z2r5QUAFyh1m26+C+6IzrSLRa9lbS
         ggBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=no/TJ6PXq+ScTITN2HIvPeAFgu9A0tJ2VdNYHrys52M=;
        b=k03c6NhrNYnFewdWU2VBpIDOLLd2fcPR5E2pU441RJBQAYV1FbvModtgxBEoRIk3Ph
         X9byoH157JlL3sSpIOzeFpasZkMqqqhpo65BLS+lgQE4DK0LETz4apech9GrLGuqevQw
         odg2l8XLWnt6DkyVnBWT0jv12NFf53yftXYbU48Lm6bgA6N8ZdA9N7Gq6Dp7E3pDQ//n
         kMNPQ5zTqxKB8PjdDDcjf/QR55s+njDApa/X74Nqz3KJHaljhcyQZNuk3PSAAq8fDP2m
         HzLq/KRQLpCtvHOg2a+sXzzLeWP/kmHCzuVOJPn0fW+rjM3uII7NsEahEswcuocgG418
         AhWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x186si23754887qke.166.2017.06.02.09.40.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 09:40:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGpd0-0004v9-P6
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 12:40:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZ1-00014r-SR
	for qemu-devel@nongnu.org; Fri, 02 Jun 2017 12:36:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpZ0-0007aN-QC
	for qemu-devel@nongnu.org; Fri, 02 Jun 2017 12:36:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:53846)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dGpYv-0007UB-6S; Fri, 02 Jun 2017 12:36:33 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4FD5422CC1;
	Fri,  2 Jun 2017 16:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FD5422CC1
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  2 Jun 2017 18:36:10 +0200
Message-Id: <20170602163618.6369-1-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170602162857.6065-1-krzk@kernel.org>
References: <20170602162857.6065-1-krzk@kernel.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-devel] [PATCH v4 1/9] hw/intc/exynos4210_gic: Use more
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v7mHcmIFPxvr

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
index 2a55817b7660..62acede72f62 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -286,21 +286,21 @@ static void exynos4210_gic_init(Object *obj)
     DeviceState *dev = DEVICE(obj);
     Exynos4210GicState *s = EXYNOS4210_GIC(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
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
@@ -316,7 +316,7 @@ static void exynos4210_gic_init(Object *obj)
         sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
         memory_region_init_alias(&s->cpu_alias[i], obj,
                                  cpu_alias_name,
-                                 sysbus_mmio_get_region(busdev, 1),
+                                 sysbus_mmio_get_region(gicbusdev, 1),
                                  0,
                                  EXYNOS4210_GIC_CPU_REGION_SIZE);
         memory_region_add_subregion(&s->cpu_container,
@@ -326,7 +326,7 @@ static void exynos4210_gic_init(Object *obj)
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

