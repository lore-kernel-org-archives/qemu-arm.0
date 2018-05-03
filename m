Received: by 10.28.4.212 with SMTP id 203csp1517856wme;
        Wed, 2 May 2018 22:54:55 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqerT1MlTwwtKwGwVurcEf8JK/+9xlePznK7QLWveS+UhmZUzGdUV3E5hH84uL26Tz4SRHP
X-Received: by 2002:ac8:23d1:: with SMTP id r17-v6mr356096qtr.369.1525326895340;
        Wed, 02 May 2018 22:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525326895; cv=none;
        d=google.com; s=arc-20160816;
        b=Yc6/DiIJrxEaOCBxu8jJbuOqQ6FuO8Y/sEElHM0lz2pwnVZVxJfMivUgO4SAut5F2s
         qKjXkB7vTFvRrV+C0Ex+CiJREz9W1Sbk8sJiZ2rIEyLBCX9T/KPWKTgBvGvQ3sIh6Zlr
         z0uJP/Cxn03lLZU8zG9Nc3HVqNlHpk/xxb7ZTPovNoFUh/42t2K2/FJvhE8SOCZeswe3
         cq3iTiPnNzBp94uDQgy92jgWwJAZCG7SChNan8fS9h0vdCR1cb0UoIIXKELc0GUi6Yjx
         bLlW37ezh8m/E7nBhfpKR1mWvNar6e+aW8UMdsSwIxZx2XLT+MRNIVOBBv2UXYRTVt3/
         T/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=qOf+XSM4uA6WpH7LxMjx7L3O2B+5Y2s5Py2c4Lfnk8E=;
        b=rzOKaPgIZeoTZRw/zYAEk3GIT94ZWA4d1PFuGxEcJCpYDi2Gwsxmf9HMveE1FaDVh9
         SbOXxYAWu3eCH7F4zUURq2Lp2ZKVv+rSmZX8SIiTLLOonuEGshV9C0raFPpyFuDXUfr7
         gfhdjmTwn0qaQxCc9nShba8PcAjFvGf9WbXGJGXpZzHc0sE1t1y4WOkG8H+wlWVtmI2b
         2oiaAi75sZalVVAhbzLKeIhuufWqytokCKDHHKzKKPODGseVCld/eRrgTSBky4ZHUPZf
         z+NTHd6PJYQiwBWzgKZrVHztx45NVOkN9qXnbDtyCdeCNWWwiuo/GYWR6HgnTculXjE0
         bv7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r8si280298qkr.151.2018.05.02.22.54.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 May 2018 22:54:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fE7Cg-0000gs-NS
	for alex.bennee@linaro.org; Thu, 03 May 2018 01:54:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fE7BR-0008K4-AJ
	for qemu-arm@nongnu.org; Thu, 03 May 2018 01:53:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fE7BO-0006Wa-6z
	for qemu-arm@nongnu.org; Thu, 03 May 2018 01:53:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56494 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fE7BO-0006WH-1L; Thu, 03 May 2018 01:53:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8064C401DEB5;
	Thu,  3 May 2018 05:53:33 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-74.ams2.redhat.com [10.36.116.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1133363536;
	Thu,  3 May 2018 05:53:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  3 May 2018 07:53:31 +0200
Message-Id: <1525326811-3233-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 03 May 2018 05:53:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 03 May 2018 05:53:33 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH] hw/arm: Don't fail qtest due to missing SD card
 in -nodefaults mode
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
Cc: qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kmPPvgQystyc

When running omap1/2 or pxa2xx based ARM machines with -nodefaults,
they bail out immediately complaining about a "missing SecureDigital
device". That's not how the "default" devices in vl.c are meant to
work - it should be possible for a board to also start up without
default devices. So let's turn the error message and exit() into
a warning instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/omap1.c  |  8 ++++----
 hw/arm/omap2.c  |  8 ++++----
 hw/arm/pxa2xx.c | 15 +++++++--------
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 24673ab..e54c1f8 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -30,6 +30,7 @@
 #include "hw/arm/soc_dma.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
+#include "sysemu/qtest.h"
 #include "qemu/range.h"
 #include "hw/sysbus.h"
 #include "qemu/cutils.h"
@@ -3987,12 +3988,11 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryRegion *system_memory,
                                 omap_findclk(s, "dpll3"));
 
     dinfo = drive_get(IF_SD, 0, 0);
-    if (!dinfo) {
-        error_report("missing SecureDigital device");
-        exit(1);
+    if (!dinfo && !qtest_enabled()) {
+        warn_report("missing SecureDigital device");
     }
     s->mmc = omap_mmc_init(0xfffb7800, system_memory,
-                           blk_by_legacy_dinfo(dinfo),
+                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                            qdev_get_gpio_in(s->ih[1], OMAP_INT_OQN),
                            &s->drq[OMAP_DMA_MMC_TX],
                     omap_findclk(s, "mmc_ck"));
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 8066353..b8d0910 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -25,6 +25,7 @@
 #include "cpu.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
+#include "sysemu/qtest.h"
 #include "hw/boards.h"
 #include "hw/hw.h"
 #include "hw/arm/arm.h"
@@ -2486,12 +2487,11 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRegion *sysmem,
                              s->drq[OMAP24XX_DMA_GPMC]);
 
     dinfo = drive_get(IF_SD, 0, 0);
-    if (!dinfo) {
-        error_report("missing SecureDigital device");
-        exit(1);
+    if (!dinfo && !qtest_enabled()) {
+        warn_report("missing SecureDigital device");
     }
     s->mmc = omap2_mmc_init(omap_l4tao(s->l4, 9),
-                    blk_by_legacy_dinfo(dinfo),
+                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                     qdev_get_gpio_in(s->ih[0], OMAP_INT_24XX_MMC_IRQ),
                     &s->drq[OMAP24XX_DMA_MMC1_TX],
                     omap_findclk(s, "mmc_fclk"), omap_findclk(s, "mmc_iclk"));
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 928a043..a2803fd 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -21,6 +21,7 @@
 #include "chardev/char-fe.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
+#include "sysemu/qtest.h"
 #include "qemu/cutils.h"
 
 static struct {
@@ -2095,12 +2096,11 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
     s->gpio = pxa2xx_gpio_init(0x40e00000, s->cpu, s->pic, 121);
 
     dinfo = drive_get(IF_SD, 0, 0);
-    if (!dinfo) {
-        error_report("missing SecureDigital device");
-        exit(1);
+    if (!dinfo && !qtest_enabled()) {
+        warn_report("missing SecureDigital device");
     }
     s->mmc = pxa2xx_mmci_init(address_space, 0x41100000,
-                    blk_by_legacy_dinfo(dinfo),
+                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                     qdev_get_gpio_in(s->pic, PXA2XX_PIC_MMC),
                     qdev_get_gpio_in(s->dma, PXA2XX_RX_RQ_MMCI),
                     qdev_get_gpio_in(s->dma, PXA2XX_TX_RQ_MMCI));
@@ -2220,12 +2220,11 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size)
     s->gpio = pxa2xx_gpio_init(0x40e00000, s->cpu, s->pic, 85);
 
     dinfo = drive_get(IF_SD, 0, 0);
-    if (!dinfo) {
-        error_report("missing SecureDigital device");
-        exit(1);
+    if (!dinfo && !qtest_enabled()) {
+        warn_report("missing SecureDigital device");
     }
     s->mmc = pxa2xx_mmci_init(address_space, 0x41100000,
-                    blk_by_legacy_dinfo(dinfo),
+                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                     qdev_get_gpio_in(s->pic, PXA2XX_PIC_MMC),
                     qdev_get_gpio_in(s->dma, PXA2XX_RX_RQ_MMCI),
                     qdev_get_gpio_in(s->dma, PXA2XX_TX_RQ_MMCI));
-- 
1.8.3.1

