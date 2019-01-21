Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6394509wrt;
        Mon, 21 Jan 2019 11:11:27 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7dlNs1vxehG7famc7Z/Kt5fokedVtzPkXtY2/lqVX6fpQbK6c2h05xSOsIQEXCBrjpCnFX
X-Received: by 2002:adf:9422:: with SMTP id 31mr31130387wrq.106.1548097887286;
        Mon, 21 Jan 2019 11:11:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548097887; cv=none;
        d=google.com; s=arc-20160816;
        b=hJDgjazyPGayTWyUIl6+UggwKqJLjYzMjOGutb8wb+uGad+tqJ2xxHB50kMbl4xASP
         3ikvxgNwa73EBfyLmdtMXk8tusZ1oQ7gSVHvji/smZ/Oxhm0nM7bAkaSNFPRP9uuRU+I
         GjO+RwAs7XWkkQpHxinRTjJdPxurPqD1Z2yiiDczfvk5Qh1q91HLl1LWP0QLnj5AnlXJ
         yykeUGqdB911aGuW9L9SRcFuzlxgpxD8a8gjofSMdfBGi64Yjh5sd0aGOBHFas5rsOhw
         jBcGpCrbCDFprGWGf7rwQb8b27LPShbA7benuTCbR6Vgz6bfevi2HwoI4PRgyTbpBGFL
         aCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=rmaI+kkyf9uJRswykyw1+Rfz8wtF0OuwFSjC/Eb5qSY=;
        b=C027qgMaofgj/PoB0m1D7iPjoS/Wmo/xQsY7VEFswwt8olYbVXIqzq65AAga6XWEng
         Gb80X3gfFgczy2DiL3f6mjEMK8SuXsMMSguxxxalD/VaqLzMSRig8cuPg+5RnHWFbnnt
         I42ffkJLzBr/4LFKrVPUz/jXo2jHnyySDbtBjivMjEYRgwab5CibkCPNPpzAEN4ipbsy
         BeWl1AJoN9OyceJTZjRKw4l7pvqpRl7dfe3q2/LCJssEOmpCXdX3/bV/qmUYOlmVQhD0
         WN07WKnzGHYODEH7GJWgVoMOEbBSSxH8qH36SjtVJY+iX9JABK+hrQ+vd1WHGnh6c+0N
         0NLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NgT4LneB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n65si32892259wmd.195.2019.01.21.11.11.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:11:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NgT4LneB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gleyk-0002sU-8C
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:11:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevU-0008OY-45
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 14:08:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glefd-0002ri-N2
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:42 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46215)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefb-0002eH-9A
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 13:51:40 -0500
Received: by mail-wr1-x442.google.com with SMTP id l9so24545763wrt.13
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 10:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rmaI+kkyf9uJRswykyw1+Rfz8wtF0OuwFSjC/Eb5qSY=;
	b=NgT4LneBBMvw0kDkLDvSpQiBIPRjr8l2M2Cq2zUTQi7FHfUoqM0f5LEX4QOQK0mCtz
	VI4zl206m5KIxK5jbs3zo5fTaf3aR0b5rXW52vw9sm/zQtwD3+uriaJzIAFsfNsa7fWu
	WpqX14k+wA6xc6APHOINQ+YZeMESM5cjSqfjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rmaI+kkyf9uJRswykyw1+Rfz8wtF0OuwFSjC/Eb5qSY=;
	b=na/hshR4FWFkPP52q7Git27Px4j7wAjVAK5nYfRUh/Sg852vHfRDgkM98CV4mGzl9s
	Z+6g9UnwYysxIuioA76DICirMs4HPc3617t5lWRSFiUR8rtPC0RgF2XMBYZD9wSOL0sl
	LxzSXwVngqHtKCKwh0g9ut6dInZ2+7pzhP9WrcybxuKRFzrAVIGjGVhq+40dB6zr7A8e
	rYyZnAYsNaFWmvgUdPFbdyqeu5uohFXP9dwLEdanVYm63u6uKqdYAssOARtFz7J9it9k
	cv4Q5TjBLvkXZsgcPMR9z0MyHSGLCs511l9z74+XEXVJiraW9U76r57biUCvOHjoyICm
	0ESw==
X-Gm-Message-State: AJcUukfTo7OKUyejtZuDp4dESpNEtKXa2MLjeZ3qZCNu0/SPEGD1FUxL
	4Ashiw5Y47sRELbWvjKfKPQ7cbkB/g5piw==
X-Received: by 2002:adf:ea11:: with SMTP id q17mr28257724wrm.328.1548096690792;
	Mon, 21 Jan 2019 10:51:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:04 +0000
Message-Id: <20190121185118.18550-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 09/23] hw/arm/armsse: Make number of SRAM banks
 parameterised
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
X-TUID: d2BeFz8xNss8

The SSE-200 has four banks of SRAM, each with its own
Memory Protection Controller, where the IoTKit has only one.
Make the number of SRAM banks a field in ARMSSEInfo.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  9 +++--
 hw/arm/armsse.c         | 78 ++++++++++++++++++++++++++---------------
 2 files changed, 56 insertions(+), 31 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index ff512054988..99714aa63cd 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -90,6 +90,11 @@
 #define NUM_EXTERNAL_PPCS (IOTS_NUM_AHB_EXP_PPC + IOTS_NUM_APB_EXP_PPC)
 #define NUM_PPCS (NUM_EXTERNAL_PPCS + 2)
 
+#define MAX_SRAM_BANKS 4
+#if MAX_SRAM_BANKS > IOTS_NUM_MPC
+#error Too many SRAM banks
+#endif
+
 typedef struct ARMSSE {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -99,7 +104,7 @@ typedef struct ARMSSE {
     IoTKitSecCtl secctl;
     TZPPC apb_ppc0;
     TZPPC apb_ppc1;
-    TZMPC mpc;
+    TZMPC mpc[IOTS_NUM_MPC];
     CMSDKAPBTIMER timer0;
     CMSDKAPBTIMER timer1;
     CMSDKAPBTIMER s32ktimer;
@@ -123,7 +128,7 @@ typedef struct ARMSSE {
     MemoryRegion alias1;
     MemoryRegion alias2;
     MemoryRegion alias3;
-    MemoryRegion sram0;
+    MemoryRegion sram[MAX_SRAM_BANKS];
 
     qemu_irq *exp_irqs;
     qemu_irq ppc0_irq;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 074c1d3a6cf..b639b54e0db 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -20,11 +20,13 @@
 
 struct ARMSSEInfo {
     const char *name;
+    int sram_banks;
 };
 
 static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_IOTKIT,
+        .sram_banks = 1,
     },
 };
 
@@ -118,8 +120,12 @@ static void armsse_forward_sec_resp_cfg(ARMSSE *s)
 static void armsse_init(Object *obj)
 {
     ARMSSE *s = ARMSSE(obj);
+    ARMSSEClass *asc = ARMSSE_GET_CLASS(obj);
+    const ARMSSEInfo *info = asc->info;
     int i;
 
+    assert(info->sram_banks <= MAX_SRAM_BANKS);
+
     memory_region_init(&s->container, obj, "armsse-container", UINT64_MAX);
 
     sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
@@ -133,12 +139,17 @@ static void armsse_init(Object *obj)
                           TYPE_TZ_PPC);
     sysbus_init_child_obj(obj, "apb-ppc1", &s->apb_ppc1, sizeof(s->apb_ppc1),
                           TYPE_TZ_PPC);
-    sysbus_init_child_obj(obj, "mpc", &s->mpc, sizeof(s->mpc), TYPE_TZ_MPC);
+    for (i = 0; i < info->sram_banks; i++) {
+        char *name = g_strdup_printf("mpc%d", i);
+        sysbus_init_child_obj(obj, name, &s->mpc[i],
+                              sizeof(s->mpc[i]), TYPE_TZ_MPC);
+        g_free(name);
+    }
     object_initialize_child(obj, "mpc-irq-orgate", &s->mpc_irq_orgate,
                             sizeof(s->mpc_irq_orgate), TYPE_OR_IRQ,
                             &error_abort, NULL);
 
-    for (i = 0; i < IOTS_NUM_EXP_MPC + 1; i++) {
+    for (i = 0; i < IOTS_NUM_EXP_MPC + info->sram_banks; i++) {
         char *name = g_strdup_printf("mpc-irq-splitter-%d", i);
         SplitIRQ *splitter = &s->mpc_irq_splitter[i];
 
@@ -199,6 +210,8 @@ static void armsse_mpcexp_status(void *opaque, int n, int level)
 static void armsse_realize(DeviceState *dev, Error **errp)
 {
     ARMSSE *s = ARMSSE(dev);
+    ARMSSEClass *asc = ARMSSE_GET_CLASS(dev);
+    const ARMSSEInfo *info = asc->info;
     int i;
     MemoryRegion *mr;
     Error *err = NULL;
@@ -335,35 +348,41 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     qdev_connect_gpio_out_named(dev_secctl, "sec_resp_cfg", 0,
                                 qdev_get_gpio_in(dev_splitter, 0));
 
-    /* This RAM lives behind the Memory Protection Controller */
-    memory_region_init_ram(&s->sram0, NULL, "armsse.sram0", 0x00008000, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
+    /* Each SRAM bank lives behind its own Memory Protection Controller */
+    for (i = 0; i < info->sram_banks; i++) {
+        char *ramname = g_strdup_printf("armsse.sram%d", i);
+        SysBusDevice *sbd_mpc;
+
+        memory_region_init_ram(&s->sram[i], NULL, ramname, 0x00008000, &err);
+        g_free(ramname);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+        object_property_set_link(OBJECT(&s->mpc[i]), OBJECT(&s->sram[i]),
+                                 "downstream", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+        object_property_set_bool(OBJECT(&s->mpc[i]), true, "realized", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+        /* Map the upstream end of the MPC into the right place... */
+        sbd_mpc = SYS_BUS_DEVICE(&s->mpc[i]);
+        memory_region_add_subregion(&s->container, 0x20000000 + i * 0x8000,
+                                    sysbus_mmio_get_region(sbd_mpc, 1));
+        /* ...and its register interface */
+        memory_region_add_subregion(&s->container, 0x50083000 + i * 0x1000,
+                                    sysbus_mmio_get_region(sbd_mpc, 0));
     }
-    object_property_set_link(OBJECT(&s->mpc), OBJECT(&s->sram0),
-                             "downstream", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    object_property_set_bool(OBJECT(&s->mpc), true, "realized", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    /* Map the upstream end of the MPC into the right place... */
-    memory_region_add_subregion(&s->container, 0x20000000,
-                                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mpc),
-                                                       1));
-    /* ...and its register interface */
-    memory_region_add_subregion(&s->container, 0x50083000,
-                                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mpc),
-                                                       0));
 
     /* We must OR together lines from the MPC splitters to go to the NVIC */
     object_property_set_int(OBJECT(&s->mpc_irq_orgate),
-                            IOTS_NUM_EXP_MPC + 1, "num-lines", &err);
+                            IOTS_NUM_EXP_MPC + info->sram_banks,
+                            "num-lines", &err);
     if (err) {
         error_propagate(errp, err);
         return;
@@ -636,7 +655,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     }
 
     /* Wire up the splitters for the MPC IRQs */
-    for (i = 0; i < IOTS_NUM_EXP_MPC + 1; i++) {
+    for (i = 0; i < IOTS_NUM_EXP_MPC + info->sram_banks; i++) {
         SplitIRQ *splitter = &s->mpc_irq_splitter[i];
         DeviceState *dev_splitter = DEVICE(splitter);
 
@@ -659,7 +678,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                                                          "mpcexp_status", i));
         } else {
             /* Splitter input is from our own MPC */
-            qdev_connect_gpio_out_named(DEVICE(&s->mpc), "irq", 0,
+            qdev_connect_gpio_out_named(DEVICE(&s->mpc[i - IOTS_NUM_EXP_MPC]),
+                                        "irq", 0,
                                         qdev_get_gpio_in(dev_splitter, 0));
             qdev_connect_gpio_out(dev_splitter, 0,
                                   qdev_get_gpio_in_named(dev_secctl,
-- 
2.20.1

