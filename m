Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9090894lfc;
        Fri, 19 Feb 2021 07:06:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPgPkYDKUvUoIhdS9cRLdddX/bQxjlQqonJVurzsB4IFSOnLC6arIXR7EjtH8eDvRf8yc6
X-Received: by 2002:a25:1e89:: with SMTP id e131mr14753460ybe.459.1613747184306;
        Fri, 19 Feb 2021 07:06:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613747184; cv=none;
        d=google.com; s=arc-20160816;
        b=HTIpKAqbd1KfEgav7WcyqbhlSVs1pTfelLh0nEcJvPlkTNG9Z6doKWteTCXgXd/Fnu
         8MowcbHnZlqUhA57CqareAQ6Td8TX1eIIdoGMTEDIzpq5unddfK1pX7ln8xOYjyjY4de
         pyc3uF5H3K0rn+zZtkSbGf2O2kg+Fc4Dj6Qso8qbz5tT1LGkxB7mPFvCHyOucivwOgcQ
         kDx84VBpQNHSl1g910TuiBz3G8l0UcVHIimkoBZ8rsBanLdks0eJpKBD4cUbCg22GDSy
         uuOkYiqYssTZ+5Ln988+IscSsD9FaPHuTQgUifYVLr2LffqskuDQ67ZWEkAr5MKFi08g
         wGtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=f+OLBFi/yKY6WGo+QIfxChYXGrVkJ8IkV/uSAJg9oV0=;
        b=sq+yt60P4hTmrR5/Jn8jtKWsipjKaLzAivwYydPNidmP3qD+5Wwq+E4ownoH7sBp7V
         1jEQqQ8R9aVjwX6QGBgpnaRY+md6R0AtuM29ADsEJOFyJw58H/uejDLNcZ3erN+7c9mS
         86IADtkXHNAGw02lsC3vwSWeKu0LuzVoxlFb8MG52GsDUaKZe/PkCjCrdxfMUqnPQTsM
         yKPAIkZaOEsCYzmdVrn90RTgYWN1k9uJwDBYvkLGIz2cv6Dlx0//cjGjlxACgf6v1NTB
         rWwdxZ9JWbjQSMg/BGaQymc80RbQjsK6t0uobHN1zKMC3zsMnnnArLIVO3bCpGU4LNf3
         z0mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Egjf6rn6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e82si9407144yba.177.2021.02.19.07.06.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 07:06:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Egjf6rn6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7MN-0000hm-8K
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 10:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73e-0002Ul-Jo
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:03 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73G-0003Xt-V7
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:02 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l12so8904816wry.2
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 06:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=f+OLBFi/yKY6WGo+QIfxChYXGrVkJ8IkV/uSAJg9oV0=;
 b=Egjf6rn6YZZnIhWCBOANcxSwCnIp5/iwDkWtP1Mo4P04N3rpVpYpUBxPnaoUmXap8D
 5zT8YDVwL6HoVjegWeMjG3NmZT1s3DYBKsWzcvnnhLXU0yOg+3x4KGXvGM3bkoR3F98e
 liX49+a9FvoQg/7Ot5zLxQk7MR2aQGFi2cdQBYOCtR01BuPnrWqPBI8blN/2JCQAc50Q
 XkLFAvlOLVLW+rupJnsqcvLtGYZogMgoukzmC4VlDitoLtzjnQo9AWdXAanW4HKyaAwW
 5NlyHUkuAcdH9TpE32OhXDj6Z4GIqKCNFyz8N+M7O8Y0XFvZJkNH+TbdNVd4UUVRgohq
 g7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f+OLBFi/yKY6WGo+QIfxChYXGrVkJ8IkV/uSAJg9oV0=;
 b=aAO1IApoHKD5oMd7AHrlWLlwT8fu/Du2sta4wk5BF3MR8EaZqwxiBBV4b01J4zNIA3
 mGXnaYiNJDtkV87JC0sha58+O/4BVeyvd6c9X7QX+E/YyFrsSKt3+9+TyNUuoFm6SZtm
 leDJm1Y2vD2MSNKBt84C8+XWdX/+AUpM8rKJTEIZFWX1wndpHEYZOiz2NGRz7QTahRs7
 L/8lUFEyXAjwJkLiVtOvw16jPRDHv2UwzeOW64OPW66/G8NuvNDYLFkbjdrg7E0R8QCl
 p+z20kAHGlQj/AK/PpuCWtjNN1BtBybmBgpOceqNHEob3wATKJoXcEvCB4mf0VWf3HBk
 DJVQ==
X-Gm-Message-State: AOAM532ulqaSUk4QXpKufuQyj3LduxffSV4saZQzrM4ChFx2m1BArpPm
 AqUiE+arMaYnzhUsuAkeJqTEfJgz110ljw==
X-Received: by 2002:a05:6000:1546:: with SMTP id
 6mr9485506wry.398.1613745997670; 
 Fri, 19 Feb 2021 06:46:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 23/44] hw/arm/armsse: Add framework for data-driven device
 placement
Date: Fri, 19 Feb 2021 14:45:56 +0000
Message-Id: <20210219144617.4782-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nOP3Up9Jg997

The SSE-300 is mostly the same as the SSE-200, but it has moved some
of the devices in the memory map and uses different device types in
some cases.  To accommodate this, add a framework where the placement
and wiring of some devices can be specified in a data table.

This commit adds the framework for this data-driven device placement,
and makes the CMSDK APB timer devices use it.  Subsequent commits
will convert the other devices which differ between SSE-200 and
SSE-300.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |   3 +-
 hw/arm/armsse.c         | 147 +++++++++++++++++++++++++++++++++-------
 2 files changed, 125 insertions(+), 25 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index e34263fed8b..c1f4df295a4 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -158,8 +158,7 @@ struct ARMSSE {
     IoTKitSecCtl secctl;
     TZPPC apb_ppc[NUM_INTERNAL_PPCS];
     TZMPC mpc[IOTS_NUM_MPC];
-    CMSDKAPBTimer timer0;
-    CMSDKAPBTimer timer1;
+    CMSDKAPBTimer timer[2];
     CMSDKAPBTimer s32ktimer;
     qemu_or_irq ppc_irq_orgate;
     SplitIRQ sec_resp_splitter;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 5ae6ce344ee..22dd437a4ba 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -24,6 +24,27 @@
 #include "hw/irq.h"
 #include "hw/qdev-clock.h"
 
+/*
+ * The SSE-300 puts some devices in different places to the
+ * SSE-200 (and original IoTKit). We use an array of these structs
+ * to define how each variant lays out these devices. (Parts of the
+ * SoC that are the same for all variants aren't handled via these
+ * data structures.)
+ */
+
+#define NO_IRQ -1
+#define NO_PPC -1
+
+typedef struct ARMSSEDeviceInfo {
+    const char *name; /* name to use for the QOM object; NULL terminates list */
+    const char *type; /* QOM type name */
+    unsigned int index; /* Which of the N devices of this type is this ? */
+    hwaddr addr;
+    int ppc; /* Index of APB PPC this device is wired up to, or NO_PPC */
+    int ppc_port; /* Port number of this device on the PPC */
+    int irq; /* NO_IRQ, or 0..NUM_SSE_IRQS-1 */
+} ARMSSEDeviceInfo;
+
 struct ARMSSEInfo {
     const char *name;
     uint32_t sse_version;
@@ -38,6 +59,7 @@ struct ARMSSEInfo {
     bool has_cpusecctrl;
     bool has_cpuid;
     Property *props;
+    const ARMSSEDeviceInfo *devinfo;
 };
 
 static Property iotkit_properties[] = {
@@ -64,6 +86,30 @@ static Property armsse_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+static const ARMSSEDeviceInfo sse200_devices[] = {
+    {
+        .name = "timer0",
+        .type = TYPE_CMSDK_APB_TIMER,
+        .index = 0,
+        .addr = 0x40000000,
+        .ppc = 0,
+        .ppc_port = 0,
+        .irq = 3,
+    },
+    {
+        .name = "timer1",
+        .type = TYPE_CMSDK_APB_TIMER,
+        .index = 1,
+        .addr = 0x40001000,
+        .ppc = 0,
+        .ppc_port = 1,
+        .irq = 4,
+    },
+    {
+        .name = NULL,
+    }
+};
+
 static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_IOTKIT,
@@ -79,6 +125,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cpusecctrl = false,
         .has_cpuid = false,
         .props = iotkit_properties,
+        .devinfo = sse200_devices,
     },
     {
         .name = TYPE_SSE200,
@@ -94,6 +141,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cpusecctrl = true,
         .has_cpuid = true,
         .props = armsse_properties,
+        .devinfo = sse200_devices,
     },
 };
 
@@ -250,6 +298,7 @@ static void armsse_init(Object *obj)
     ARMSSE *s = ARM_SSE(obj);
     ARMSSEClass *asc = ARM_SSE_GET_CLASS(obj);
     const ARMSSEInfo *info = asc->info;
+    const ARMSSEDeviceInfo *devinfo;
     int i;
 
     assert(info->sram_banks <= MAX_SRAM_BANKS);
@@ -290,6 +339,18 @@ static void armsse_init(Object *obj)
         }
     }
 
+    for (devinfo = info->devinfo; devinfo->name; devinfo++) {
+        assert(devinfo->ppc == NO_PPC || devinfo->ppc < ARRAY_SIZE(s->apb_ppc));
+        if (!strcmp(devinfo->type, TYPE_CMSDK_APB_TIMER)) {
+            assert(devinfo->index < ARRAY_SIZE(s->timer));
+            object_initialize_child(obj, devinfo->name,
+                                    &s->timer[devinfo->index],
+                                    TYPE_CMSDK_APB_TIMER);
+        } else {
+            g_assert_not_reached();
+        }
+    }
+
     object_initialize_child(obj, "secctl", &s->secctl, TYPE_IOTKIT_SECCTL);
 
     for (i = 0; i < ARRAY_SIZE(s->apb_ppc); i++) {
@@ -312,8 +373,6 @@ static void armsse_init(Object *obj)
         object_initialize_child(obj, name, splitter, TYPE_SPLIT_IRQ);
         g_free(name);
     }
-    object_initialize_child(obj, "timer0", &s->timer0, TYPE_CMSDK_APB_TIMER);
-    object_initialize_child(obj, "timer1", &s->timer1, TYPE_CMSDK_APB_TIMER);
     object_initialize_child(obj, "s32ktimer", &s->s32ktimer,
                             TYPE_CMSDK_APB_TIMER);
     object_initialize_child(obj, "dualtimer", &s->dualtimer,
@@ -453,6 +512,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     ARMSSE *s = ARM_SSE(dev);
     ARMSSEClass *asc = ARM_SSE_GET_CLASS(dev);
     const ARMSSEInfo *info = asc->info;
+    const ARMSSEDeviceInfo *devinfo;
     int i;
     MemoryRegion *mr;
     Error *err = NULL;
@@ -736,25 +796,53 @@ static void armsse_realize(DeviceState *dev, Error **errp)
      * it to the appropriate PPC port; then we can realize the PPC and
      * map its upstream ends to the right place in the container.
      */
-    qdev_connect_clock_in(DEVICE(&s->timer0), "pclk", s->mainclk);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer0), errp)) {
-        return;
-    }
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer0), 0,
-                       armsse_get_common_irq_in(s, 3));
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->timer0), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc[0]), "port[0]", OBJECT(mr),
-                             &error_abort);
+    for (devinfo = info->devinfo; devinfo->name; devinfo++) {
+        SysBusDevice *sbd;
+        qemu_irq irq;
 
-    qdev_connect_clock_in(DEVICE(&s->timer1), "pclk", s->mainclk);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer1), errp)) {
-        return;
+        if (!strcmp(devinfo->type, TYPE_CMSDK_APB_TIMER)) {
+            sbd = SYS_BUS_DEVICE(&s->timer[devinfo->index]);
+
+            qdev_connect_clock_in(DEVICE(sbd), "pclk", s->mainclk);
+            if (!sysbus_realize(sbd, errp)) {
+                return;
+            }
+            mr = sysbus_mmio_get_region(sbd, 0);
+        } else {
+            g_assert_not_reached();
+        }
+
+        switch (devinfo->irq) {
+        case NO_IRQ:
+            irq = NULL;
+            break;
+        case 0 ... NUM_SSE_IRQS - 1:
+            irq = armsse_get_common_irq_in(s, devinfo->irq);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        if (irq) {
+            sysbus_connect_irq(sbd, 0, irq);
+        }
+
+        /*
+         * Devices connected to a PPC are connected to the port here;
+         * we will map the upstream end of that port to the right address
+         * in the container later after the PPC has been realized.
+         * Devices not connected to a PPC can be mapped immediately.
+         */
+        if (devinfo->ppc != NO_PPC) {
+            TZPPC *ppc = &s->apb_ppc[devinfo->ppc];
+            g_autofree char *portname = g_strdup_printf("port[%d]",
+                                                        devinfo->ppc_port);
+            object_property_set_link(OBJECT(ppc), portname, OBJECT(mr),
+                                     &error_abort);
+        } else {
+            memory_region_add_subregion(&s->container, devinfo->addr, mr);
+        }
     }
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer1), 0,
-                       armsse_get_common_irq_in(s, 4));
-    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->timer1), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc[0]), "port[1]", OBJECT(mr),
-                             &error_abort);
 
     qdev_connect_clock_in(DEVICE(&s->dualtimer), "TIMCLK", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->dualtimer), errp)) {
@@ -813,10 +901,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sbd_apb_ppc0 = SYS_BUS_DEVICE(&s->apb_ppc[0]);
     dev_apb_ppc0 = DEVICE(&s->apb_ppc[0]);
 
-    mr = sysbus_mmio_get_region(sbd_apb_ppc0, 0);
-    memory_region_add_subregion(&s->container, 0x40000000, mr);
-    mr = sysbus_mmio_get_region(sbd_apb_ppc0, 1);
-    memory_region_add_subregion(&s->container, 0x40001000, mr);
     mr = sysbus_mmio_get_region(sbd_apb_ppc0, 2);
     memory_region_add_subregion(&s->container, 0x40002000, mr);
     if (info->has_mhus) {
@@ -947,6 +1031,23 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                           qdev_get_gpio_in_named(dev_apb_ppc1,
                                                  "cfg_sec_resp", 0));
 
+    /*
+     * Now both PPCs are realized we can map the upstream ends of
+     * ports which correspond to entries in the devinfo array.
+     * The ports which are connected to non-devinfo devices have
+     * already been mapped.
+     */
+    for (devinfo = info->devinfo; devinfo->name; devinfo++) {
+        SysBusDevice *ppc_sbd;
+
+        if (devinfo->ppc == NO_PPC) {
+            continue;
+        }
+        ppc_sbd = SYS_BUS_DEVICE(&s->apb_ppc[devinfo->ppc]);
+        mr = sysbus_mmio_get_region(ppc_sbd, devinfo->ppc_port);
+        memory_region_add_subregion(&s->container, devinfo->addr, mr);
+    }
+
     if (!object_property_set_int(OBJECT(&s->sysinfo), "SYS_VERSION",
                                  info->sys_version, errp)) {
         return;
-- 
2.20.1

