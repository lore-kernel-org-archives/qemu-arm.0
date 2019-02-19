Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3380050wrx;
        Tue, 19 Feb 2019 05:03:14 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbRmFVtHnDfsKEUZTA/QM2fjZ5DM0NZE//a417BGhx0WPy5OalEc8y8IcQS6BtSMTyUkEDb
X-Received: by 2002:a37:f506:: with SMTP id l6mr8820417qkk.110.1550581394803;
        Tue, 19 Feb 2019 05:03:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550581394; cv=none;
        d=google.com; s=arc-20160816;
        b=aJxkxnFnSFZ4orsPLcsYneGl4Iil+jDtSK//oboqplwKox+xrxP8CdAzRy4BFonzro
         0b9UoCiYQOMP1dm2mUNOW3n4UKLRlZnnAe6MQeC/G8LEKfvn0dJUT7KBaBnGKfAqFpLj
         AWV62Mwo0Tae+UhIMQz9kXt1c34BwcP4xdR96aMT0IEmK1YEpooC665SdAdUbht+fkCB
         QPPF7QsrhHE67FrNUmwNb4tkC9yFzx6/hs/qdfiI5J+6rNv35Y3dZbQ5QWDRfjksm5r/
         ih0aiZZvnrq1JKkSOm0qlrZn+Il/oee8ttBVMEW3vO+bfK+x97svY5x0R1fwu5QgxrCr
         5Rdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=z9u5w0T0Lwyuy9HIkprGJsanlIZ38qvna0IXR0Nck2w=;
        b=e5So5rFlInTf0/AdSTH0SYuyC0jNuG4bROvbohz7SdI0qLC4vTcWoVKV8XMP1OfpF3
         Vg7g2fZCSkKHdFYPOUUntgmC0MRu9zK5SaIG4kTrBSaV+3Tw0VAUv/UXbgjymf/ZHJlF
         66vB0dv4jogGJHgWCgISu/ETQoa5ARN3NBpROpkmZdSnlh5q3ba33XDFjhHUfqsxtweN
         RuHLqGDeiwjEVLwjgdtmWcspuHrvSe31K39xp0YKT7b1aw0z+fkfXVithRp5o7dX+VR/
         x3XQNvUUcjaiijbSqwSHcXUHAIPY8fw+N/UVFk6Mapn2yVp/qfprvwyJ72+wMIiRH6vE
         LG0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mSakjBRX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si10891426qtf.204.2019.02.19.05.03.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Feb 2019 05:03:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mSakjBRX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47932 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gw53K-0005IX-7O
	for alex.bennee@linaro.org; Tue, 19 Feb 2019 08:03:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4yW-0001fi-My
	for qemu-devel@nongnu.org; Tue, 19 Feb 2019 07:58:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4yV-0002nh-Lx
	for qemu-devel@nongnu.org; Tue, 19 Feb 2019 07:58:16 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45175)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gw4yV-0002nA-BZ
	for qemu-devel@nongnu.org; Tue, 19 Feb 2019 07:58:15 -0500
Received: by mail-wr1-x444.google.com with SMTP id w17so21812000wrn.12
	for <qemu-devel@nongnu.org>; Tue, 19 Feb 2019 04:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=z9u5w0T0Lwyuy9HIkprGJsanlIZ38qvna0IXR0Nck2w=;
	b=mSakjBRXHRlXXmvnr6vFCvEDHDQr0i2028unf3LImD0wKHCFwL1pVKYRvSd4vvlC+h
	Bkblz/7IFGAdBuc6RmehQJYoDEznKnMB5Q7Ifc8Q8np/gawvkw1zg3IXm7gOJJaK89c2
	qlCuI2i8xzELfpSLFKEPy+WbQctIQh/NyhBF6jnQNjLqUD0WaAbYkacJRmIfavORqHHq
	Ld1uKORUb0oXOTAgNzP2zCiGZleclK7rBM8t08zuhsGz1jVRuTFblydUq2vqxhyrbdyj
	7LtWMw8QKvZ2F0cbcRex/aIf4MexqBr2+TXWzfpXFCU5+YzSRz85djrwC2MHkh12jB4s
	Z4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=z9u5w0T0Lwyuy9HIkprGJsanlIZ38qvna0IXR0Nck2w=;
	b=p3geWA3GJ7xos3zceog6430aBTw0X0WvX1yE4LAvYDoSn6AxTisCkpux2E5kjlL24e
	rXGINo5i6U2y5VGBF6Y2m/azVx4dzcvCjx4CSt/wG8WIEJYjVn0he4fXX8O7Yc+hObVG
	+Ec84JIkfT4AT4Jy+L4g27KVhVyXsP50UgmID01jCalUiDJGVg9j7h9RidkErS0uSKfI
	297YC3aUvzAjGdGP8nWHReIoHuaZR3wgugTk51dnbOX8EPxF6k20VIO/OP3N4sqMHYYN
	eivZwgQhxOqETm/JLkUtVQJlr7z1uqRLTbJFqAoWVR7wNnWYiPNbXhDKwjicfMzaw7jt
	qxeg==
X-Gm-Message-State: AHQUAubkJ43hRh/f/8Ks4GcAMcqvSUJHY7XZiCOG4lpwC47XygA+/uWN
	cUe1+LL0+vJlKfzmMSoVrHrU3Y2CyHiEIQ==
X-Received: by 2002:adf:9123:: with SMTP id j32mr21805495wrj.122.1550581094393;
	Tue, 19 Feb 2019 04:58:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	e75sm5226113wmg.32.2019.02.19.04.58.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 04:58:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 19 Feb 2019 12:58:02 +0000
Message-Id: <20190219125808.25174-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219125808.25174-1-peter.maydell@linaro.org>
References: <20190219125808.25174-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH 2/8] hw/arm/armsse: Wire up the MHUs
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
X-TUID: gw+/Um/FIbY1

Create and connect the MHUs in the SSE-200.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  3 ++-
 hw/arm/armsse.c         | 40 ++++++++++++++++++++++++++++++----------
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 7ef871c7dfe..81e082cccf8 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -95,6 +95,7 @@
 #include "hw/misc/iotkit-sysctl.h"
 #include "hw/misc/iotkit-sysinfo.h"
 #include "hw/misc/armsse-cpuid.h"
+#include "hw/misc/armsse-mhu.h"
 #include "hw/misc/unimp.h"
 #include "hw/or-irq.h"
 #include "hw/core/split-irq.h"
@@ -166,7 +167,7 @@ typedef struct ARMSSE {
     IoTKitSysCtl sysctl;
     IoTKitSysCtl sysinfo;
 
-    UnimplementedDeviceState mhu[2];
+    ARMSSEMHU mhu[2];
     UnimplementedDeviceState ppu[NUM_PPUS];
     UnimplementedDeviceState cachectrl[SSE_MAX_CPUS];
     UnimplementedDeviceState cpusecctrl[SSE_MAX_CPUS];
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 129e7ea7fe0..5768d6fbf8b 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -282,9 +282,9 @@ static void armsse_init(Object *obj)
                           sizeof(s->sysinfo), TYPE_IOTKIT_SYSINFO);
     if (info->has_mhus) {
         sysbus_init_child_obj(obj, "mhu0", &s->mhu[0], sizeof(s->mhu[0]),
-                              TYPE_UNIMPLEMENTED_DEVICE);
+                              TYPE_ARMSSE_MHU);
         sysbus_init_child_obj(obj, "mhu1", &s->mhu[1], sizeof(s->mhu[1]),
-                              TYPE_UNIMPLEMENTED_DEVICE);
+                              TYPE_ARMSSE_MHU);
     }
     if (info->has_ppus) {
         for (i = 0; i < info->num_cpus; i++) {
@@ -766,22 +766,28 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     }
 
     if (info->has_mhus) {
-        for (i = 0; i < ARRAY_SIZE(s->mhu); i++) {
-            char *name;
-            char *port;
+        /*
+         * An SSE-200 with only one CPU should have only one MHU created,
+         * with the region where the second MHU usually is being RAZ/WI.
+         * We don't implement that SSE-200 config; if we want to support
+         * it then this code needs to be enhanced to handle creating the
+         * RAZ/WI region instead of the second MHU.
+         */
+        assert(info->num_cpus > 1);
+
+        for (i = 0; i < ARRAY_SIZE(s->mhu); i++) {
+            char *port;
+            int cpunum;
+            SysBusDevice *mhu_sbd = SYS_BUS_DEVICE(&s->mhu[i]);
 
-            name = g_strdup_printf("MHU%d", i);
-            qdev_prop_set_string(DEVICE(&s->mhu[i]), "name", name);
-            qdev_prop_set_uint64(DEVICE(&s->mhu[i]), "size", 0x1000);
             object_property_set_bool(OBJECT(&s->mhu[i]), true,
                                      "realized", &err);
-            g_free(name);
             if (err) {
                 error_propagate(errp, err);
                 return;
             }
             port = g_strdup_printf("port[%d]", i + 3);
-            mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mhu[i]), 0);
+            mr = sysbus_mmio_get_region(mhu_sbd, 0);
             object_property_set_link(OBJECT(&s->apb_ppc0), OBJECT(mr),
                                      port, &err);
             g_free(port);
@@ -789,6 +795,20 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                 error_propagate(errp, err);
                 return;
             }
+
+            /*
+             * Each MHU has an irq line for each CPU:
+             *  MHU 0 irq line 0 -> CPU 0 IRQ 6
+             *  MHU 0 irq line 1 -> CPU 1 IRQ 6
+             *  MHU 1 irq line 0 -> CPU 0 IRQ 7
+             *  MHU 1 irq line 1 -> CPU 1 IRQ 7
+             */
+            for (cpunum = 0; cpunum < info->num_cpus; cpunum++) {
+                DeviceState *cpudev = DEVICE(&s->armv7m[cpunum]);
+
+                sysbus_connect_irq(mhu_sbd, cpunum,
+                                   qdev_get_gpio_in(cpudev, 6 + i));
+            }
         }
     }
 
-- 
2.20.1

