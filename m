Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6393651wrt;
        Mon, 21 Jan 2019 11:10:33 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5hsluSZXGsQepum4LjV97FpgIbookFe35BZb5aTr8+l1JwOBpzumf2xrgc7Nf27sBSdR1y
X-Received: by 2002:a5d:694d:: with SMTP id r13mr43327wrw.323.1548097833034;
        Mon, 21 Jan 2019 11:10:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548097833; cv=none;
        d=google.com; s=arc-20160816;
        b=a1Ug2tzUp73nEWVBCG2cdxOn9NkYefXhwo9hmcR6aT2cv78f4xj0c6esIt+8lB05JA
         QPE9eKNZsTu585pBQ8272NCbxIHBZQQUKGLhh2lJ/VuYo9UeZL/LU1OaASUh63T113vT
         n4Gnfnl7hDYrtt6cx4HhrEwHKX7HBxH8phB9t4CHFu5HbAZshY5q5lXnf4GK6DAuj/Su
         y2DiuDkzFgiDM0AA2reYUyP0F8ROYBcEcCEvHWlqmzpXsGXILm3CwGrsHLdqRFWl5Mcr
         P3Luq4jFK5n7Nw78xWofmqjlCuB2kYKn9naxGfrpges4IsvbqiwXOlwpTTpCKyvLS7jJ
         z/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=6dJlwUKV/mqO+LXLnxltTP2TIDBTQAdk8nXHap2RUUY=;
        b=ydQaCRi1f6N6JKzOqKtARJNlhSJKI6puLVm8z4iDHYGcAakRobcNe+j5+swyazAFn4
         32tppySinNIbjUkmNWuSgePCOWAXDmGp2yvH8MJfc1f/14p9lngnM646BC7/gNwrXHHx
         /DDB+bsAGXwLQZVk2pskNaZ2gqeUOB37NEaHqL2Y6DXylYRPO4BYdkU6jzF0p1e/xfhk
         D23JBVRdoB+Wr+iCQv+EGHXzvxdhCMQHp4vhhoPl0KxDQGZe3Qdp9l0CMuhBp5mFfOLh
         Y9ofLN53JHN74Po03NPmoFzvxpHF6kxH/gqtyiK0KMSLlSj9sJH7A7VAYxzUctGFDjAo
         HSDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SAD5tiJY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si67215065wro.330.2019.01.21.11.10.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:10:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SAD5tiJY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glexr-0001XM-R6
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:10:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevS-0007jF-K3
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 14:08:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gleff-0002tG-9q
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:45 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37154)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefe-0002q6-Tc
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:43 -0500
Received: by mail-wm1-x341.google.com with SMTP id g67so11810974wmd.2
	for <qemu-devel@nongnu.org>; Mon, 21 Jan 2019 10:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6dJlwUKV/mqO+LXLnxltTP2TIDBTQAdk8nXHap2RUUY=;
	b=SAD5tiJYu6GshOFt06OOesXbZzTo7uSnbOUYUPP6hioR7NUflBeSy72YkIuyrwN7oX
	aLQuXcQhe+ZMXQfxHe50YOXIq3qbei+/aVge2SxWMv7fEOg+ZqoeT/h18L2PM4D6aSfa
	nI9sisNjgTfbfI3NdCCJl6IPaOOHRZbEp5pXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6dJlwUKV/mqO+LXLnxltTP2TIDBTQAdk8nXHap2RUUY=;
	b=KgFROWJEnRQ2dnd2gKuy4YGFcvExYTO5mGaECTr+BEoUERe4E7iAFLjTUsHKFNvfR/
	nPgPCs6rejDyZFdiitCfCFBaZuivDjDx0cddjn2DOi8IP5BatRfHBKdVlnI3Kah00UXn
	2yFiqEy5Msbpkckf4ZWIVlqmwCPBSrFhfgwdHGWWXdIyxMXdyPUCN7Sm4BP7wjMXrsFi
	KlWkZODIaIDX1BHmocylMLESYzn/axDbqIYTr7eYTy4m9nsRkU6nNXPn82MX5v7iXva0
	CNOHEBqDG23TqP1eWDUUCYEVeLkHXSxqyYwII9NiOO2/beD2vf1wLONdV+bTyAWz+GXp
	iwYg==
X-Gm-Message-State: AJcUukcJtFRl4lA2MtH9LfujDahA0JrwKKDD2QNpcB6a6aMs3K1VlMnd
	izRo3PiAbDnTK8FxEUmRsMlcbg==
X-Received: by 2002:a1c:4807:: with SMTP id v7mr555289wma.53.1548096697933;
	Mon, 21 Jan 2019 10:51:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:10 +0000
Message-Id: <20190121185118.18550-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH 15/23] hw/arm/armsse: Add unimplemented-device
 stubs for MHUs
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
X-TUID: rKYF1j4tuP/K

The SSE-200 has two Message Handling Units (MHUs), which sit behind
the APB PPC0. Wire up some unimplemented-device stubs for these,
since we don't yet implement a real model of this device.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  3 +++
 hw/arm/armsse.c         | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 999c2e4f7e5..dbfcb280605 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -78,6 +78,7 @@
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
 #include "hw/misc/iotkit-sysctl.h"
 #include "hw/misc/iotkit-sysinfo.h"
+#include "hw/misc/unimp.h"
 #include "hw/or-irq.h"
 #include "hw/core/split-irq.h"
 #include "hw/cpu/cluster.h"
@@ -137,6 +138,8 @@ typedef struct ARMSSE {
     IoTKitSysCtl sysctl;
     IoTKitSysCtl sysinfo;
 
+    UnimplementedDeviceState mhu[2];
+
     /*
      * 'container' holds all devices seen by all CPUs.
      * 'cpu_container[i]' is the view that CPU i has: this has the
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 19cae77e770..1f3dc89c8e8 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -30,6 +30,7 @@ struct ARMSSEInfo {
     int num_cpus;
     uint32_t sys_version;
     SysConfigFormat sys_config_format;
+    bool has_mhus;
 };
 
 static const ARMSSEInfo armsse_variants[] = {
@@ -39,6 +40,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .num_cpus = 1,
         .sys_version = 0x41743,
         .sys_config_format = IoTKitFormat,
+        .has_mhus = false,
     },
 };
 
@@ -257,6 +259,12 @@ static void armsse_init(Object *obj)
                           sizeof(s->sysctl), TYPE_IOTKIT_SYSCTL);
     sysbus_init_child_obj(obj, "armsse-sysinfo", &s->sysinfo,
                           sizeof(s->sysinfo), TYPE_IOTKIT_SYSINFO);
+    if (info->has_mhus) {
+        sysbus_init_child_obj(obj, "mhu0", &s->mhu[0], sizeof(s->mhu[0]),
+                              TYPE_UNIMPLEMENTED_DEVICE);
+        sysbus_init_child_obj(obj, "mhu1", &s->mhu[1], sizeof(s->mhu[1]),
+                              TYPE_UNIMPLEMENTED_DEVICE);
+    }
     object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate,
                             sizeof(s->nmi_orgate), TYPE_OR_IRQ,
                             &error_abort, NULL);
@@ -616,6 +624,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
      *   0x40000000: timer0
      *   0x40001000: timer1
      *   0x40002000: dual timer
+     *   0x40003000: MHU0 (SSE-200 only)
+     *   0x40004000: MHU1 (SSE-200 only)
      * We must configure and realize each downstream device and connect
      * it to the appropriate PPC port; then we can realize the PPC and
      * map its upstream ends to the right place in the container.
@@ -666,6 +676,31 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (info->has_mhus) {
+        for (i = 0; i < ARRAY_SIZE(s->mhu); i++) {
+            char *name = g_strdup_printf("MHU%d", i);
+            char *port = g_strdup_printf("port[%d]", i + 3);
+
+            qdev_prop_set_string(DEVICE(&s->mhu[i]), "name", name);
+            qdev_prop_set_uint64(DEVICE(&s->mhu[i]), "size", 0x1000);
+            object_property_set_bool(OBJECT(&s->mhu[i]), true,
+                                     "realized", &err);
+            if (err) {
+                error_propagate(errp, err);
+                return;
+            }
+            mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mhu[i]), 0);
+            object_property_set_link(OBJECT(&s->apb_ppc0), OBJECT(mr),
+                                     port, &err);
+            if (err) {
+                error_propagate(errp, err);
+                return;
+            }
+            g_free(name);
+            g_free(port);
+        }
+    }
+
     object_property_set_bool(OBJECT(&s->apb_ppc0), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
@@ -681,6 +716,12 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->container, 0x40001000, mr);
     mr = sysbus_mmio_get_region(sbd_apb_ppc0, 2);
     memory_region_add_subregion(&s->container, 0x40002000, mr);
+    if (info->has_mhus) {
+        mr = sysbus_mmio_get_region(sbd_apb_ppc0, 3);
+        memory_region_add_subregion(&s->container, 0x40003000, mr);
+        mr = sysbus_mmio_get_region(sbd_apb_ppc0, 4);
+        memory_region_add_subregion(&s->container, 0x40004000, mr);
+    }
     for (i = 0; i < IOTS_APB_PPC0_NUM_PORTS; i++) {
         qdev_connect_gpio_out_named(dev_secctl, "apb_ppc0_nonsec", i,
                                     qdev_get_gpio_in_named(dev_apb_ppc0,
-- 
2.20.1

