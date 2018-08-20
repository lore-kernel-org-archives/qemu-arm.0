Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp740452wrd;
        Mon, 20 Aug 2018 07:18:04 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyTBhwn8+ALt2abRVVvoAr4XVNn6nl1HKQbFG7WM8IBjZL2fxmD58gBt2uMqaVLNjQz77Hp
X-Received: by 2002:a37:208:: with SMTP id 8-v6mr41442225qkc.144.1534774684703;
        Mon, 20 Aug 2018 07:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534774684; cv=none;
        d=google.com; s=arc-20160816;
        b=Nj+WCBYDR2NJHQt3e3ZAf6xRU15Ityrw+4cyI0vqabTTew+6m8fx9EXe6GQ6oMC553
         Iyyx/JOnL4VDRa8gdOJ04GvDWImQVsOm0DaYJebrTQgrt0DsQLitMvJqukFUY+WbPFMO
         ZhCAIDAQfd32MPo5jxxpoXVHqpI8KqBkjBDfGvWieCslvIY0xC6JbfrGH1gJ2tlXOfAp
         wT64YiiydeRovU0+nU+h6j251zyUDH8uYPm7gliiLgF7x/Tw6GitHfEQUOOqSfrAjww8
         H97+UhiAbR64MQYCKO2sb6UrPKtgUHkgr5M/2BbqGR/HflcxIKheKJ76EOa0FYwifl0a
         1xJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=iGOfcjxJuo93Yto9vuoQMvzzqlRkE7o1/7BcNv0JalQ=;
        b=L95yrBpcQnQTnwX8kolgEJd68WDtw6uWrU+NKdzT6S5unoGXN9dtrRYxYLKpB6wmF7
         3NZA06zOwWknxh6WwNUx4LJeH+XXj6XTNUc76TRiDht2ECprHZ50e3RAAkI7n1XCOaHt
         dK0GLgQHaHG8JfXDPKL89GoEEYDvU47SJoUufTJpMkgpH5P2I+reDISzOj8wLpaoKpHZ
         5mLis3a3gyiTzwmJcmCaI6yiZ5kiQCkK8oi1/iQEZ1DlGQg5p1owFippV4aXif1KwT4N
         wWW/PFQDjWFj4etCulGK04RxS2+u5VHnZ4asipaQ6EeXc5+QEnRf9W+u9pOUTynqPNvj
         1g+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y3-v6si9103345qva.244.2018.08.20.07.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:18:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frl0O-0000fU-38
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:18:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frktz-0003O0-KU
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkty-0007Bp-Po
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:27 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44614)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frkty-0007AT-GW; Mon, 20 Aug 2018 10:11:26 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frktv-0003MC-Ec; Mon, 20 Aug 2018 15:11:23 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:10:58 +0100
Message-Id: <20180820141116.9118-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 04/22] hw/arm/iotkit: Wire up the dualtimer
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
X-TUID: Qe77uDJpTUoV

Now we have a model of the CMSDK dual timer, we can wire it
up in the IoTKit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/iotkit.h | 3 ++-
 hw/arm/iotkit.c         | 8 +++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
index 2cddde55dd1..3e6d806e352 100644
--- a/include/hw/arm/iotkit.h
+++ b/include/hw/arm/iotkit.h
@@ -56,6 +56,7 @@
 #include "hw/misc/tz-ppc.h"
 #include "hw/misc/tz-mpc.h"
 #include "hw/timer/cmsdk-apb-timer.h"
+#include "hw/timer/cmsdk-apb-dualtimer.h"
 #include "hw/misc/unimp.h"
 #include "hw/or-irq.h"
 #include "hw/core/split-irq.h"
@@ -87,7 +88,7 @@ typedef struct IoTKit {
     SplitIRQ mpc_irq_splitter[IOTS_NUM_EXP_MPC + IOTS_NUM_MPC];
     qemu_or_irq mpc_irq_orgate;
 
-    UnimplementedDeviceState dualtimer;
+    CMSDKAPBDualTimer dualtimer;
     UnimplementedDeviceState s32ktimer;
 
     MemoryRegion container;
diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
index 8cadc8b1608..130d013909e 100644
--- a/hw/arm/iotkit.c
+++ b/hw/arm/iotkit.c
@@ -139,7 +139,7 @@ static void iotkit_init(Object *obj)
     sysbus_init_child_obj(obj, "timer1", &s->timer1, sizeof(s->timer1),
                           TYPE_CMSDK_APB_TIMER);
     sysbus_init_child_obj(obj, "dualtimer", &s->dualtimer, sizeof(s->dualtimer),
-                          TYPE_UNIMPLEMENTED_DEVICE);
+                          TYPE_CMSDK_APB_DUALTIMER);
     object_initialize_child(obj, "ppc-irq-orgate", &s->ppc_irq_orgate,
                             sizeof(s->ppc_irq_orgate), TYPE_OR_IRQ,
                             &error_abort, NULL);
@@ -390,13 +390,15 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    qdev_prop_set_string(DEVICE(&s->dualtimer), "name", "Dual timer");
-    qdev_prop_set_uint64(DEVICE(&s->dualtimer), "size", 0x1000);
+
+    qdev_prop_set_uint32(DEVICE(&s->dualtimer), "pclk-frq", s->mainclk_frq);
     object_property_set_bool(OBJECT(&s->dualtimer), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->dualtimer), 0,
+                       qdev_get_gpio_in(DEVICE(&s->armv7m), 5));
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dualtimer), 0);
     object_property_set_link(OBJECT(&s->apb_ppc0), OBJECT(mr), "port[2]", &err);
     if (err) {
-- 
2.18.0

