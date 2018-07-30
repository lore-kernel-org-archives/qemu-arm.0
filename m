Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3971794wru;
        Mon, 30 Jul 2018 09:35:01 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdKij1LrKLxCLczJr7B260pa+Y8Hfle164E3SQlyoWiOgBJZS+NA6uUpVbHVxxq1QMC0qaM
X-Received: by 2002:a37:7c41:: with SMTP id x62-v6mr15971263qkc.52.1532968501658;
        Mon, 30 Jul 2018 09:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532968501; cv=none;
        d=google.com; s=arc-20160816;
        b=IpyChGKWQDRPTzWtdHhJ784oPpVR/T9i9rvta+fGGeCQmUBDrEhdxNpXlHG3Swu6yp
         oHyWENORFrRQ9bbnWV3nJE1+C68+9qfnvhm4Qk5aItCB8xGC8AcBpLIEqjA07yqx4s1n
         uTGSZqeYeta9cu6fkbwk61dLILpB+zVsIFV9rcAajK9bpqT9weE1RQ4YETBmJyeP7FXa
         Nppjsa0A0oW3Bc/O+37T1moqtCQtEeN56VF/PCiooYoSW9TIFowd1j8n1SFmMSO5sHLb
         zpVJj9wwYzh/DdQrLVnBvAKiYMzG0zpcg9yCWVJQqVmBkkAChqboA2DU/5iok4MD0mHq
         LaBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=R124qvSJXFJCRjTD5LSBGFkNuEAGPWirwITEpfsU+S8=;
        b=QM5Q80Tkzgqg0/oXuPVkRmEE25tpsF2NpSYzfl1A2oRvpduep+PZ0XU+gG5xZysvkY
         A7MZ3Sc6dpYWRwYfEIWwLPnkMcAEcsjJCt3P4IodiHckUc7xFxv23/77hax+pvt5EpVS
         bFXWKC5yM1c6+Yhw2pt+0xsk49rKjLC//TY9rV72ewpdWH+kNd/goIyknPOBgW+RRXjQ
         i8TAEnvkrd8XJOW+Yabo5zzh98+G51vkevcrX9R/UB7mIyfpjsw451rbHJNZiI8R3+au
         f9YhlrA3vEQmxL+q0kDtrm8gh+Z6nexXZbMlYk1jG5FA03hZIcLwJtwAoN6IjMtwBwcF
         OY1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2-v6si925660qvi.288.2018.07.30.09.35.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 09:35:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkB8O-0000of-V1
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 12:35:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fkAyp-0001KZ-2x
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 12:25:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fkAyo-0001Ck-32
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 12:25:07 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43834)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fkAyl-0001Ab-07; Mon, 30 Jul 2018 12:25:03 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fkAyk-0004Lf-0m; Mon, 30 Jul 2018 17:25:02 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 30 Jul 2018 17:24:57 +0100
Message-Id: <20180730162458.23186-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180730162458.23186-1-peter.maydell@linaro.org>
References: <20180730162458.23186-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 4/5] hw/arm/iotkit: Wire up the dualtimer
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zaNqsolSJDXI

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
2.17.1

