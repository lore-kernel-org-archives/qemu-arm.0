Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1872924wru;
        Thu, 9 Aug 2018 06:02:44 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwIQ6P+q3axcuKTLG53IdOfnxyyh4JmMS0SOIYuinUYm7JdmF6K6VqhX0s60t4CXQ+yaxF4
X-Received: by 2002:a81:ac58:: with SMTP id z24-v6mr974775ywj.108.1533819764269;
        Thu, 09 Aug 2018 06:02:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533819764; cv=none;
        d=google.com; s=arc-20160816;
        b=D8C7pioxG1fcn8p7UKta6KWh4LM78236HI3S01ASwHXVwnMjSktcrNvagitdoyI2t4
         zC0VVJS33GjiH9g+LpOyzjRTaoEv+K+M8Zsn9aFXM4JfZfZKC2HiVaIeP0N27XAk+sYl
         /QpBExY7f+LQISFkJZNLuR3x1oeg7my1kmllEId6o5j2ik8WvDtG5Kd8jXUToEvF95Mk
         2POWlEOuodiFVd1QT8O2SPqoWBGCgXb9Zc7dUvVvZMslyyChIG1sq8sdR4dtD7PKEG/V
         LdtmtrTPYCHQlWZ2P9fH52Nm10BPLUp+qYiGk4+v5w+72IV3Y7mqzDWB4dhpInudlvcM
         +Z/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=UTgAwKsRzaWzVJiEbqM2Wr0I3FBYVwIq6h31cPjpn/4=;
        b=x6MCQqBHKUTfduvISA0sxXBC/elf/TLWkyncg2aQGcMFcPnN0N52fn7BmFSkIbosXb
         ShU5hPpsoSeBkOJ82RokwnRt31G8bfJKPTW+MGpgxUIkCihZHf1n2ilh0AozXopqsv8H
         cBUNnuK5Kej3uJ07jDFegF9BLwo4VR4NUUnsAyQ1vhqsaeYXYYMZfxwoKyNKu1BN45Uj
         usZh+IAVJwFqfHAk3iZwDQimuyIUrHSoIs7IKBeZJ8fuOr3hMfNQfdwMjSowsr4zFHkp
         /JidZbctoZZsHZB3dPsQ98chgZAcQ7e0AeiJ0qS+h92l/szgDj/i0O8zJHdvBtHi3ymZ
         UQSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c127-v6si1879322ywb.526.2018.08.09.06.02.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 06:02:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50699 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnkaR-0006SZ-M5
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 09:02:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZL-0005vM-Gg
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZF-0003Hl-Oo
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:35 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44214)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fnkZF-0003Gd-GA; Thu, 09 Aug 2018 09:01:29 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fnkZA-0003HQ-Lh; Thu, 09 Aug 2018 14:01:24 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  9 Aug 2018 14:01:05 +0100
Message-Id: <20180809130115.28951-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180809130115.28951-1-peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 06/16] hw/misc/iotkit: Wire up the system control
 element
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xV9+89w0Funr

Wire up the system control element's register banks.

This is the last of the previously completely unimplemented
components in the IoTKit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/iotkit.h |  4 +++-
 hw/arm/iotkit.c         | 19 +++++++++++--------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
index 0f5c5101708..1ffa31d521b 100644
--- a/include/hw/arm/iotkit.h
+++ b/include/hw/arm/iotkit.h
@@ -58,7 +58,7 @@
 #include "hw/timer/cmsdk-apb-timer.h"
 #include "hw/timer/cmsdk-apb-dualtimer.h"
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
-#include "hw/misc/unimp.h"
+#include "hw/misc/iotkit-sysctl.h"
 #include "hw/or-irq.h"
 #include "hw/core/split-irq.h"
 
@@ -97,6 +97,8 @@ typedef struct IoTKit {
     CMSDKAPBWatchdog nswatchdog;
     CMSDKAPBWatchdog swatchdog;
 
+    IoTKitSysCtl sysctl;
+
     MemoryRegion container;
     MemoryRegion alias1;
     MemoryRegion alias2;
diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
index cb0ec456f39..5d59ed5489f 100644
--- a/hw/arm/iotkit.c
+++ b/hw/arm/iotkit.c
@@ -16,7 +16,6 @@
 #include "hw/sysbus.h"
 #include "hw/registerfields.h"
 #include "hw/arm/iotkit.h"
-#include "hw/misc/unimp.h"
 #include "hw/arm/arm.h"
 
 /* Clock frequency in HZ of the 32KHz "slow clock" */
@@ -151,6 +150,8 @@ static void iotkit_init(Object *obj)
                           sizeof(s->nswatchdog), TYPE_CMSDK_APB_WATCHDOG);
     sysbus_init_child_obj(obj, "swatchdog", &s->swatchdog,
                           sizeof(s->swatchdog), TYPE_CMSDK_APB_WATCHDOG);
+    sysbus_init_child_obj(obj, "iotkit-sysctl", &s->sysctl, sizeof(s->sysctl),
+                          TYPE_IOTKIT_SYSCTL);
     object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate,
                             sizeof(s->nmi_orgate), TYPE_OR_IRQ,
                             &error_abort, NULL);
@@ -516,13 +517,15 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
                           qdev_get_gpio_in_named(dev_apb_ppc1,
                                                  "cfg_sec_resp", 0));
 
-    /* Using create_unimplemented_device() maps the stub into the
-     * system address space rather than into our container, but the
-     * overall effect to the guest is the same.
-     */
-    create_unimplemented_device("SYSINFO", 0x40020000, 0x1000);
-
-    create_unimplemented_device("SYSCONTROL", 0x50021000, 0x1000);
+    object_property_set_bool(OBJECT(&s->sysctl), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    /* System information registers */
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctl), 0, 0x40020000);
+    /* System control registers */
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctl), 1, 0x50021000);
 
     /* This OR gate wires together outputs from the secure watchdogs to NMI */
     object_property_set_int(OBJECT(&s->nmi_orgate), 2, "num-lines", &err);
-- 
2.17.1

