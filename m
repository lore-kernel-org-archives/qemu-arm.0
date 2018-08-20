Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp734372wrd;
        Mon, 20 Aug 2018 07:12:15 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwqmC4c4YcW+8fD5EolVXA2jG3KugYe7pK3Cs6nj0DxsJymg+OX/NGoTjYoZIcDLPTO6sTY
X-Received: by 2002:ac8:679a:: with SMTP id b26-v6mr46188481qtp.347.1534774335899;
        Mon, 20 Aug 2018 07:12:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534774335; cv=none;
        d=google.com; s=arc-20160816;
        b=OSpkOkD2eYfLRCJiqXzOO5F1Q0CyjBrIsododjfLCCkSCeJBkiPQLpfbLOWR0zjhDn
         N6bFdfszj6lLCgtfgT+ZboJlYtBBLC844L7cDg3BpOrFctAxXWU01JddcHO2YsQqB65n
         b0PtInby69pZSMGxyeOYIk8hLGECy3yVIbhJYOQ1LnGlwBcyZhT3B4w3P36yJ9OMZL9l
         3GGHgIBOmknzhspW/q9Wr1+zWjjLG/SYzL1+Ejl/q51Dhe445S+nQ0n56GWsz2i6YdZJ
         HZE2XYJViW3CxnHOnyeUBwYuq5jHtXiaWomHuU8vfAYO5VKumNWRUoPnSF9VbakTVKcM
         +RQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=7WxL6zotpN+1cLxBOAuCVwwk106XH52LhZ0G2DZ8yss=;
        b=r+e7/wCtkxEAJLA+Dbg9jCISS2tjYd7oANcbLhuuRD5cdZyFItEOvE9zx4sPIbzCf7
         3J7IU722VulkRr8YFFdlm2Vq54RKg7naSmOsz9hSYu699g8w6Z3CH2s8jZPawYXWmG2Y
         XINQ87KIuIoTtq70uZ4YYKhFTaQtZFqYH++nS0dG2q+kc2OLPue4l1hyHsYZ1oLQ4IAO
         hMScDXOfqQ+D4n1T2LiiYmx5JJr02EySsgyvuVGVWBnBU1GgehjYuLmcZQqhEco0jcx3
         +qcuaxEQl7bJ4ADCiMWAU4be+a137TINVKa7U8J8+3aWhyH+vBir5ExIK+lWvymB2Uou
         ajzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e200-v6si8942083qka.183.2018.08.20.07.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:12:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frkul-00040J-9x
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:12:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frku6-0003Vx-P5
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frku6-0007Hd-0Y
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:34 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44638)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frku5-0007GM-OI; Mon, 20 Aug 2018 10:11:33 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frku1-0003Pg-LK; Mon, 20 Aug 2018 15:11:29 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:11:04 +0100
Message-Id: <20180820141116.9118-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 10/22] hw/misc/iotkit: Wire up the sysctl and
 sysinfo register blocks
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
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hw6HPJ3i8BEm

Wire up the system control element's register banks
(sysctl and sysinfo).

This is the last of the previously completely unimplemented
components in the IoTKit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/iotkit.h |  6 +++++-
 hw/arm/iotkit.c         | 26 ++++++++++++++++++--------
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
index 0f5c5101708..426dc326a0d 100644
--- a/include/hw/arm/iotkit.h
+++ b/include/hw/arm/iotkit.h
@@ -58,7 +58,8 @@
 #include "hw/timer/cmsdk-apb-timer.h"
 #include "hw/timer/cmsdk-apb-dualtimer.h"
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
-#include "hw/misc/unimp.h"
+#include "hw/misc/iotkit-sysctl.h"
+#include "hw/misc/iotkit-sysinfo.h"
 #include "hw/or-irq.h"
 #include "hw/core/split-irq.h"
 
@@ -97,6 +98,9 @@ typedef struct IoTKit {
     CMSDKAPBWatchdog nswatchdog;
     CMSDKAPBWatchdog swatchdog;
 
+    IoTKitSysCtl sysctl;
+    IoTKitSysCtl sysinfo;
+
     MemoryRegion container;
     MemoryRegion alias1;
     MemoryRegion alias2;
diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
index cb0ec456f39..f8276b5425c 100644
--- a/hw/arm/iotkit.c
+++ b/hw/arm/iotkit.c
@@ -16,7 +16,6 @@
 #include "hw/sysbus.h"
 #include "hw/registerfields.h"
 #include "hw/arm/iotkit.h"
-#include "hw/misc/unimp.h"
 #include "hw/arm/arm.h"
 
 /* Clock frequency in HZ of the 32KHz "slow clock" */
@@ -151,6 +150,10 @@ static void iotkit_init(Object *obj)
                           sizeof(s->nswatchdog), TYPE_CMSDK_APB_WATCHDOG);
     sysbus_init_child_obj(obj, "swatchdog", &s->swatchdog,
                           sizeof(s->swatchdog), TYPE_CMSDK_APB_WATCHDOG);
+    sysbus_init_child_obj(obj, "iotkit-sysctl", &s->sysctl,
+                          sizeof(s->sysctl), TYPE_IOTKIT_SYSCTL);
+    sysbus_init_child_obj(obj, "iotkit-sysinfo", &s->sysinfo,
+                          sizeof(s->sysinfo), TYPE_IOTKIT_SYSINFO);
     object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate,
                             sizeof(s->nmi_orgate), TYPE_OR_IRQ,
                             &error_abort, NULL);
@@ -516,13 +519,20 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
                           qdev_get_gpio_in_named(dev_apb_ppc1,
                                                  "cfg_sec_resp", 0));
 
-    /* Using create_unimplemented_device() maps the stub into the
-     * system address space rather than into our container, but the
-     * overall effect to the guest is the same.
-     */
-    create_unimplemented_device("SYSINFO", 0x40020000, 0x1000);
-
-    create_unimplemented_device("SYSCONTROL", 0x50021000, 0x1000);
+    object_property_set_bool(OBJECT(&s->sysinfo), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    /* System information registers */
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysinfo), 0, 0x40020000);
+    /* System control registers */
+    object_property_set_bool(OBJECT(&s->sysctl), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctl), 0, 0x50021000);
 
     /* This OR gate wires together outputs from the secure watchdogs to NMI */
     object_property_set_int(OBJECT(&s->nmi_orgate), 2, "num-lines", &err);
-- 
2.18.0

