Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp733798wrd;
        Mon, 20 Aug 2018 07:11:44 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYKKtREZ/skmXYCoB/TX+KEFvU08iesBE63mfH0wXVVvBn2dzAOMp4qswKCrczwrGjJkhoP
X-Received: by 2002:a37:a6d5:: with SMTP id p204-v6mr5684341qke.126.1534774304228;
        Mon, 20 Aug 2018 07:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534774304; cv=none;
        d=google.com; s=arc-20160816;
        b=p9RSci+BnzN7uQxTxqpzDvY8mnIJZyceWKsu/YjGsLbAaz/EmR3KCwAXlrIjVZv+p1
         60wmGRxp6tsIqFNS8sNwcK6Ak01p+0FBDihAHHjy8Beb1koMLKCyCkY1GYVdvFWL3mEW
         /fZ2IjdoPTaf2UN18n2hHXwPfQTJWsun/QeXYUnUd3lhoSgXtFAONFOxHURUusPFNsCP
         Tnpa6Oi6iBxrhx3bLx9HN3dp0mp5h+JsniY/SQg0/sh8YGFOs/Q623uz7b5GvZ/X8Itd
         fQPDnQmHEF4xdvb4IgdihcloU9HcAIJSgWMurYEHqy5iDMmoSzkWUyTiXk+AAdsir/lk
         Tedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=2/k8d+2EvmRag/Wj2U1gZ7aeTvqxJx+gHKYECtd4jFc=;
        b=aQ62LGx1uDh5tZ+hT7K5cKeP31vxWfotyXUNRxr0QfdRgZgpv1aJXkYcT8/K84b2oK
         VFGxt8sVLZcDoFkDkw28nopndvCjS5U7V+FkES7C4BI9x3ByLuGx0uDgQ/LERlwLgCIZ
         dJH9nDMHZ0lPEUtPiapzeaLHdlY7EdD5Emzr2kZQwFsA/4pxi5W2tlaO3I9XBH1U1wq6
         /NIgB5vsfQwLSM/KJn0p5wJ8ePFlbKmqJzzRAFH8jVcPLt2iInrofl/j5FtB6BdGuP0H
         M+qMql1nJGCUVPXps6scz1AREXtwszDJkLXwlFs6+0o/2TovduhFK90UqoR+TyNNeEfM
         eJQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v16-v6si6277589qvk.273.2018.08.20.07.11.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:11:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frkuF-0003Rx-Kh
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:11:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frku0-0003Op-L2
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frktz-0007Cf-O2
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:28 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44622)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frktz-0007Bt-El; Mon, 20 Aug 2018 10:11:27 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frkty-0003OK-Gc; Mon, 20 Aug 2018 15:11:26 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:11:01 +0100
Message-Id: <20180820141116.9118-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 07/22] hw/arm/iotkit: Wire up the S32KTIMER
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
X-TUID: YsYaLoLWCggw

The IoTKit has a CMSDK timer device that runs on the S32KCLK.
Create this and wire it up.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/iotkit.h | 2 +-
 hw/arm/iotkit.c         | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
index 776d0497087..0f5c5101708 100644
--- a/include/hw/arm/iotkit.h
+++ b/include/hw/arm/iotkit.h
@@ -83,6 +83,7 @@ typedef struct IoTKit {
     TZMPC mpc;
     CMSDKAPBTIMER timer0;
     CMSDKAPBTIMER timer1;
+    CMSDKAPBTIMER s32ktimer;
     qemu_or_irq ppc_irq_orgate;
     SplitIRQ sec_resp_splitter;
     SplitIRQ ppc_irq_splitter[NUM_PPCS];
@@ -91,7 +92,6 @@ typedef struct IoTKit {
     qemu_or_irq nmi_orgate;
 
     CMSDKAPBDualTimer dualtimer;
-    UnimplementedDeviceState s32ktimer;
 
     CMSDKAPBWatchdog s32kwatchdog;
     CMSDKAPBWatchdog nswatchdog;
diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
index 5cedfa03570..cb0ec456f39 100644
--- a/hw/arm/iotkit.c
+++ b/hw/arm/iotkit.c
@@ -141,6 +141,8 @@ static void iotkit_init(Object *obj)
                           TYPE_CMSDK_APB_TIMER);
     sysbus_init_child_obj(obj, "timer1", &s->timer1, sizeof(s->timer1),
                           TYPE_CMSDK_APB_TIMER);
+    sysbus_init_child_obj(obj, "s32ktimer", &s->s32ktimer, sizeof(s->s32ktimer),
+                          TYPE_CMSDK_APB_TIMER);
     sysbus_init_child_obj(obj, "dualtimer", &s->dualtimer, sizeof(s->dualtimer),
                           TYPE_CMSDK_APB_DUALTIMER);
     sysbus_init_child_obj(obj, "s32kwatchdog", &s->s32kwatchdog,
@@ -166,8 +168,6 @@ static void iotkit_init(Object *obj)
                                 TYPE_SPLIT_IRQ, &error_abort, NULL);
         g_free(name);
     }
-    sysbus_init_child_obj(obj, "s32ktimer", &s->s32ktimer, sizeof(s->s32ktimer),
-                          TYPE_UNIMPLEMENTED_DEVICE);
 }
 
 static void iotkit_exp_irq(void *opaque, int n, int level)
@@ -476,13 +476,14 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
     /* Devices behind APB PPC1:
      *   0x4002f000: S32K timer
      */
-    qdev_prop_set_string(DEVICE(&s->s32ktimer), "name", "S32KTIMER");
-    qdev_prop_set_uint64(DEVICE(&s->s32ktimer), "size", 0x1000);
+    qdev_prop_set_uint32(DEVICE(&s->s32ktimer), "pclk-frq", S32KCLK);
     object_property_set_bool(OBJECT(&s->s32ktimer), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->s32ktimer), 0,
+                       qdev_get_gpio_in(DEVICE(&s->armv7m), 2));
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->s32ktimer), 0);
     object_property_set_link(OBJECT(&s->apb_ppc1), OBJECT(mr), "port[0]", &err);
     if (err) {
-- 
2.18.0

