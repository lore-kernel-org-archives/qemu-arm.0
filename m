Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1025446ejo;
        Tue, 12 Dec 2023 08:31:09 -0800 (PST)
X-Received: by 2002:a17:907:3447:b0:a19:a19b:4213 with SMTP id ac7-20020a170907344700b00a19a19b4213mr1758915ejc.126.1702398669186;
        Tue, 12 Dec 2023 08:31:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398669; cv=none;
        d=google.com; s=arc-20160816;
        b=Wx/gczq48HItbSQtDemVNN53/+vHgMx2KaJ4O+J4JVM+bjLy+doLL27yJB3URl0c+6
         2r6uMBKqxWXKARNSR+L7ebiC5igSY7saxZ5DA3zuiR/cbjQvStHXX7psj40YqhUiwwh9
         hFt2GeqkNy7VDmdXDgE56VY16HoBurPUnwrcIwEc34zLpaJg3aQNJMgPabtxIkHX1bip
         cgf+9sRplwqslDL8nRdkqJ8SREo0mRI7xRs7Z50kkitEk/IZrPBvjN14lkfzDuY7sFmb
         tJIJ4Z4loi3l+IBMcF6RnnII3Bx1XZTuyO+clUYaMxzeW5YbgFmlVOPHH9nTJhYqx38g
         bpQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LWmxbZCVp50+shFtFsnVZssmWwX/jzP5YKgJ1RtvfXk=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=rKgWTcGeN1wkf3VPnc7K8dtCdXC1tgmxmGenI3TsfDoQQ4fsPP9beSFA/jTOETvGoa
         mQezcO6SiCq/GbMILnu/8g4FEdNuV7VMtBs32uI9BKxmPJ5YxuFLGHXBH6sdXwTHQCsO
         WXHPnbHMhPdIP6tfP9A48wdYGTI4CTVYj/fo+u3X7zKr/bSvTo2korvzAQomwMk0wv22
         WzWEFP7cUNcOgNMgAteDFKKQ1hTSowos9KOyqUcQ17Ox+jk/5OUD+BMaVOfEP7oYE85B
         jDB1P9SpzukcJD/k3icVa6kEZca/TjeLyGLqMGQIDoKv7H9rOFdM3BPY5zD0E4vhH+Oe
         ka8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=REzRqyYx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gx19-20020a1709068a5300b00a1f6c9e8824sor2048566ejc.6.2023.12.12.08.31.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:31:09 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=REzRqyYx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398669; x=1703003469; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWmxbZCVp50+shFtFsnVZssmWwX/jzP5YKgJ1RtvfXk=;
        b=REzRqyYxPKhVyIRbYEN8x0FbhNiJgpU/bFCIWTWY8oq7sgS8pTc2oC8ZeRkoglAosK
         f+T1LoIre5nnNxjfZ2np4RSJxUIK8lnLsu23M++c53sKHtkmBkSBfWkIyA9G9d+Ii4Wl
         Ntq/0rvH6mCw7PiAhTkdqSKQ75nwwbae2a73Yp82jExBqkzg/a83XP+WMcFtGXie1mZV
         ULcMA9h0t1SbTeTxRmA6ptHhZWPiBW7xhVq5hZUyRdMInLjnRtfW9VV7flYk2/mYIhgY
         fnuSDw/zIlyzUGDR7fIUiTUXnVxYcXNwi3qWjKgKN9eQy8LsKfAIYcc1/5qrhIgtGPSH
         0Zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398669; x=1703003469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWmxbZCVp50+shFtFsnVZssmWwX/jzP5YKgJ1RtvfXk=;
        b=hVWR86U+OTGv3OfGHdXcVe3MmrTefSTWzGJ0/ZM/14CugJU9L8PnPmlOTNZQDKFmN8
         +5pr9oANqCxT4IzYq1woNduu9jAIRworJ+K642PInaGaBPoPmSpGN15RBrtHBcEy5joE
         ROnekGnDdxvoi1kWnvoKZkYyC/DEiCbz9qqCkAxTCj4y2T0EMFrkx27pbfZp+lAklszZ
         1FRjlgt9kLdHqVLb9Kk0L4qqDfmS3c3YnwuIo4xW37yqN8M4e/IgyCWQX643sKzFYI0T
         NYNw83vZi2uZQZKRmcfYFGS/n8/+c0Hc5/1exlIsdUWE6DuRVvscAjaFrrgSLc9EFWsJ
         ZYgw==
X-Gm-Message-State: AOJu0YwOA9U3S2xGTcYnQxNP509p68sSCYL7JAZHx4hLYnbY9Axk53WQ
	5r/yVD6eVWANLTM/UcNwAwNzLUjs
X-Google-Smtp-Source: AGHT+IHcinsOjpS5Vq5fWyQilBoTAQPWd9AyFafFPW3PhR7pMbPRYILUi3zkYmPy1C+AxjvsPXDcCw==
X-Received: by 2002:a17:906:11d7:b0:a1f:5dd9:2177 with SMTP id o23-20020a17090611d700b00a1f5dd92177mr1859866eja.149.1702398668681;
        Tue, 12 Dec 2023 08:31:08 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id vq3-20020a170907a4c300b00a1b61096ce6sm6469198ejc.129.2023.12.12.08.31.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:31:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 12/33] hw/cpu/arm: Create MPCore container in QOM parent
Date: Tue, 12 Dec 2023 17:29:12 +0100
Message-ID: <20231212162935.42910-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oNV0c1fRZA9/

Move the memory region container creation to the abstract QOM
parent. Children set the region size via the class 'container_size'
field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/cpu/cortex_mpcore.h | 10 ++++++++--
 hw/cpu/a15mpcore.c             | 17 ++++++++---------
 hw/cpu/a9mpcore.c              | 18 +++++++++---------
 hw/cpu/cortex_mpcore.c         | 14 ++++++++++++++
 4 files changed, 39 insertions(+), 20 deletions(-)

diff --git a/include/hw/cpu/cortex_mpcore.h b/include/hw/cpu/cortex_mpcore.h
index 4084c6003a..1d94c8769d 100644
--- a/include/hw/cpu/cortex_mpcore.h
+++ b/include/hw/cpu/cortex_mpcore.h
@@ -30,14 +30,22 @@
 #define TYPE_CORTEX_MPCORE_PRIV "cortex_mpcore_priv"
 OBJECT_DECLARE_TYPE(CortexMPPrivState, CortexMPPrivClass, CORTEX_MPCORE_PRIV)
 
+/**
+ * CortexMPPrivClass:
+ * @container_size - size of the device's MMIO region
+ */
 struct CortexMPPrivClass {
     SysBusDeviceClass parent_class;
 
     DeviceRealize parent_realize;
+
+    uint64_t container_size;
 };
 
 struct CortexMPPrivState {
     SysBusDevice parent_obj;
+
+    MemoryRegion container;
 };
 
 #define TYPE_A9MPCORE_PRIV "a9mpcore_priv"
@@ -47,7 +55,6 @@ struct A9MPPrivState {
     CortexMPPrivState parent_obj;
 
     uint32_t num_cpu;
-    MemoryRegion container;
     uint32_t num_irq;
 
     A9SCUState scu;
@@ -65,7 +72,6 @@ struct A15MPPrivState {
 
     uint32_t num_cpu;
     uint32_t num_irq;
-    MemoryRegion container;
 
     GICState gic;
 };
diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index 5a57145179..128941eb50 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -36,12 +36,8 @@ static void a15mp_priv_set_irq(void *opaque, int irq, int level)
 
 static void a15mp_priv_initfn(Object *obj)
 {
-    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     A15MPPrivState *s = A15MPCORE_PRIV(obj);
 
-    memory_region_init(&s->container, obj, "a15mp-priv-container", 0x8000);
-    sysbus_init_mmio(sbd, &s->container);
-
     object_initialize_child(obj, "gic", &s->gic, gic_class_name());
     qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 2);
 }
@@ -51,6 +47,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     CortexMPPrivClass *cc = CORTEX_MPCORE_PRIV_GET_CLASS(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     A15MPPrivState *s = A15MPCORE_PRIV(dev);
+    CortexMPPrivState *c = CORTEX_MPCORE_PRIV(dev);
     DeviceState *gicdev;
     SysBusDevice *gicsbd;
     Error *local_err = NULL;
@@ -133,20 +130,20 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
      *  0x5600-0x57ff -- GIC virtual interface control for CPU 3
      *  0x6000-0x7fff -- GIC virtual CPU interface
      */
-    memory_region_add_subregion(&s->container, 0x1000,
+    memory_region_add_subregion(&c->container, 0x1000,
                                 sysbus_mmio_get_region(gicsbd, 0));
-    memory_region_add_subregion(&s->container, 0x2000,
+    memory_region_add_subregion(&c->container, 0x2000,
                                 sysbus_mmio_get_region(gicsbd, 1));
     if (has_el2) {
-        memory_region_add_subregion(&s->container, 0x4000,
+        memory_region_add_subregion(&c->container, 0x4000,
                                     sysbus_mmio_get_region(gicsbd, 2));
-        memory_region_add_subregion(&s->container, 0x6000,
+        memory_region_add_subregion(&c->container, 0x6000,
                                     sysbus_mmio_get_region(gicsbd, 3));
         for (i = 0; i < s->num_cpu; i++) {
             hwaddr base = 0x5000 + i * 0x200;
             MemoryRegion *mr = sysbus_mmio_get_region(gicsbd,
                                                       4 + s->num_cpu + i);
-            memory_region_add_subregion(&s->container, base, mr);
+            memory_region_add_subregion(&c->container, base, mr);
         }
     }
 }
@@ -168,6 +165,8 @@ static void a15mp_priv_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     CortexMPPrivClass *cc = CORTEX_MPCORE_PRIV_CLASS(klass);
 
+    cc->container_size = 0x8000;
+
     device_class_set_parent_realize(dc, a15mp_priv_realize,
                                     &cc->parent_realize);
     device_class_set_props(dc, a15mp_priv_properties);
diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index d59e49126b..08346b0049 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -30,9 +30,6 @@ static void a9mp_priv_initfn(Object *obj)
 {
     A9MPPrivState *s = A9MPCORE_PRIV(obj);
 
-    memory_region_init(&s->container, obj, "a9mp-priv-container", 0x2000);
-    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->container);
-
     object_initialize_child(obj, "scu", &s->scu, TYPE_A9_SCU);
 
     object_initialize_child(obj, "gic", &s->gic, TYPE_ARM_GIC);
@@ -47,6 +44,7 @@ static void a9mp_priv_initfn(Object *obj)
 static void a9mp_priv_realize(DeviceState *dev, Error **errp)
 {
     CortexMPPrivClass *cc = CORTEX_MPCORE_PRIV_GET_CLASS(dev);
+    CortexMPPrivState *c = CORTEX_MPCORE_PRIV(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     A9MPPrivState *s = A9MPCORE_PRIV(dev);
     DeviceState *scudev, *gicdev, *gtimerdev, *mptimerdev, *wdtdev;
@@ -134,21 +132,21 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
      *  0x0700-0x0fff -- nothing
      *  0x1000-0x1fff -- GIC Distributor
      */
-    memory_region_add_subregion(&s->container, 0,
+    memory_region_add_subregion(&c->container, 0,
                                 sysbus_mmio_get_region(scubusdev, 0));
     /* GIC CPU interface */
-    memory_region_add_subregion(&s->container, 0x100,
+    memory_region_add_subregion(&c->container, 0x100,
                                 sysbus_mmio_get_region(gicbusdev, 1));
-    memory_region_add_subregion(&s->container, 0x200,
+    memory_region_add_subregion(&c->container, 0x200,
                                 sysbus_mmio_get_region(gtimerbusdev, 0));
     /* Note that the A9 exposes only the "timer/watchdog for this core"
      * memory region, not the "timer/watchdog for core X" ones 11MPcore has.
      */
-    memory_region_add_subregion(&s->container, 0x600,
+    memory_region_add_subregion(&c->container, 0x600,
                                 sysbus_mmio_get_region(mptimerbusdev, 0));
-    memory_region_add_subregion(&s->container, 0x620,
+    memory_region_add_subregion(&c->container, 0x620,
                                 sysbus_mmio_get_region(wdtbusdev, 0));
-    memory_region_add_subregion(&s->container, 0x1000,
+    memory_region_add_subregion(&c->container, 0x1000,
                                 sysbus_mmio_get_region(gicbusdev, 0));
 
     /* Wire up the interrupt from each watchdog and timer.
@@ -183,6 +181,8 @@ static void a9mp_priv_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     CortexMPPrivClass *cc = CORTEX_MPCORE_PRIV_CLASS(klass);
 
+    cc->container_size = 0x2000;
+
     device_class_set_parent_realize(dc, a9mp_priv_realize, &cc->parent_realize);
     device_class_set_props(dc, a9mp_priv_properties);
 }
diff --git a/hw/cpu/cortex_mpcore.c b/hw/cpu/cortex_mpcore.c
index 7d3796bd69..0c12f99610 100644
--- a/hw/cpu/cortex_mpcore.c
+++ b/hw/cpu/cortex_mpcore.c
@@ -7,13 +7,27 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/cpu/cortex_mpcore.h"
 
+static void cortex_mpcore_priv_instance_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    CortexMPPrivState *s = CORTEX_MPCORE_PRIV(obj);
+    CortexMPPrivClass *k = CORTEX_MPCORE_PRIV_GET_CLASS(obj);
+
+    assert(k->container_size > 0);
+    memory_region_init(&s->container, obj,
+                       "mpcore-priv-container", k->container_size);
+    sysbus_init_mmio(sbd, &s->container);
+}
+
 static const TypeInfo cortex_mpcore_types[] = {
     {
         .name           = TYPE_CORTEX_MPCORE_PRIV,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(CortexMPPrivState),
+        .instance_init  = cortex_mpcore_priv_instance_init,
         .class_size     = sizeof(CortexMPPrivClass),
         .abstract       = true,
     },
-- 
2.41.0
