Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1025762ejo;
        Tue, 12 Dec 2023 08:31:30 -0800 (PST)
X-Received: by 2002:a05:6512:b9a:b0:50c:4ea:64f4 with SMTP id b26-20020a0565120b9a00b0050c04ea64f4mr3759364lfv.70.1702398690653;
        Tue, 12 Dec 2023 08:31:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398690; cv=none;
        d=google.com; s=arc-20160816;
        b=dP8qyzdHCMmf8Q+yLkFM3DWrmgRLl4BqTpaUCrYX9uj55htdKkKf2I/09lQA2SU99d
         abb/xUiCLs6kd82Mn2bzedikfutJKzGMxDQdF0jolw1IwTChI7yM3i0qJhbJtRdeSuYj
         FSvTP2KGLoevPibsy9UWZ7FzbKBdNpt7Fp9Qp1+JcbsYgW9NTlvPPSByYxpdND3HoosH
         sCjSlTHayK8eAsILtyqsIoavzPATCiSzRKv2qADt6aFH4mLPBxT8sW7Re4F5GdSig0Of
         1lnDSvldnojill9ZBS1yv2iQf9V8KzEAGyd7MoTXxviG2gWnwRHzSECvDNpm2nKoqwPL
         LrfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=frs5y0/FgUa/dx+GfVIjngEap4jXXYbHNd4gh7eJ9lc=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=pk4tuahqfPgmoDp0cwYacT8ojHJBd6XwwOHt4XovNwmCkVV26H2AeG6LlzfLKQT3jw
         fIcDZMerqIkTxlv3RFUo0td9SKXWTrFNmFs6p+xg/urcuIlrV6mucY4WLoDA2hqCVMjv
         fghtz4NRdIo+mgoCffpezEl9hfXzDlF+sVfiFR3TOMFkIDLUaGxtfolzji9CDm5h/T36
         DeyL6kjzgXhzkUOl/yJx5VfBGMv/tjkpgDB2fDo1bzjgaLKljkGHPNSiwZASmTXeGEzf
         RgSriLaRdaiP3ylmTTC9KzrRW0Vga7Kye/zXr7v5SINCHllDs/SCQD9rGh2iLr7G3zK5
         xSTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=acCVJ3q0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m21-20020a509995000000b0054cc414c3easor1782796edb.11.2023.12.12.08.31.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:31:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=acCVJ3q0;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398690; x=1703003490; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frs5y0/FgUa/dx+GfVIjngEap4jXXYbHNd4gh7eJ9lc=;
        b=acCVJ3q0jyz8bCjw2brmUZC1QP/QBJqWwc9Hclknd/mlA+EoCWXvYnF/M1Ya0vGfTy
         BshzXk9sKXpqxFMKcgb3SCyXSJTZJsM4zgtfBUSrTD8HhsP0Z2dN4Eh78tkIA6sltKbK
         tF4sI9LBRd0f4/bItsEml8OgOEP6I8/wrcyp78fUPnpOlD8jRUyVAp49p65bPE7GTJXd
         rie+N6KqFucLjmdMqtHP0FZn8Wo1i5sgYUOITkfKl1RnowLRDTbX9BHdPTArwPi+qJjq
         6bu14GXomNSjul+hASxGr+W5Gs84PFZam91BFLS85W9dlkk8jecT7VkvosRiGya5H9ZE
         WrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398690; x=1703003490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frs5y0/FgUa/dx+GfVIjngEap4jXXYbHNd4gh7eJ9lc=;
        b=JdZdT5UsbF9D57VO9TMPsuP/y3NEPe8J5acMDf8OdmiOLZF+bNfWbT7bHkf119+glF
         pW/vEeBDIyGsDgYaeaF4bTgrslzeJuwxA9tWau2D8APp5MpqfY9mRZy730/v+PUtszhk
         JMW6EYJp3D+NT3lE44LvratF30LaYoxUdWcmyo+MHj8L6Ezg2YTtw2cty6T7BlLjZ01D
         eHA9BF9yViKTv0lKTdOjtZpInLDHuBgd5AR2P1FTD319xc7COsmLT8xOtMbWIx7gJo1i
         EPsVypoL+yaUqXjcSG5VVlT5/W6iQKycCiIc5ns7jD4LrsmmMOP5enAasZiBcQr3g1p6
         Of+Q==
X-Gm-Message-State: AOJu0YxiC6kolIjAqh4aIm3q/gHZ2/9H95qf5pbsFd0PpsPT8KpUt9zr
	De2dSaW71EhoePXuYGKDfBbiH/7T
X-Google-Smtp-Source: AGHT+IFaW7rm/fJIo7/0zlKmXMTZRM8PHMRbYoUapRaWiCLB58lwJUPfuBBqhnHVW6sS4YIu6oqpYw==
X-Received: by 2002:a50:8581:0:b0:54d:1264:b28d with SMTP id a1-20020a508581000000b0054d1264b28dmr3996719edh.61.1702398690319;
        Tue, 12 Dec 2023 08:31:30 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id bq18-20020a056402215200b0054db440489fsm4774507edb.60.2023.12.12.08.31.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:31:29 -0800 (PST)
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
Subject: [PATCH 15/33] hw/cpu/arm: Handle 'gic-irq' property once in MPCore parent
Date: Tue, 12 Dec 2023 17:29:15 +0100
Message-ID: <20231212162935.42910-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WgNXLX6qX+bJ

Move the 'num-irq' property to the abstract QOM parent.
Rename it as 'gic-irq', keeping it aliased as 'num-irq'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/cpu/cortex_mpcore.h | 13 +++++++++----
 hw/cpu/a15mpcore.c             | 28 +++++++++++++---------------
 hw/cpu/a9mpcore.c              | 28 +++++++++++++---------------
 hw/cpu/cortex_mpcore.c         |  5 +++++
 4 files changed, 40 insertions(+), 34 deletions(-)

diff --git a/include/hw/cpu/cortex_mpcore.h b/include/hw/cpu/cortex_mpcore.h
index 387552468c..96da713be9 100644
--- a/include/hw/cpu/cortex_mpcore.h
+++ b/include/hw/cpu/cortex_mpcore.h
@@ -32,6 +32,8 @@
  *    the cluster.
  *  + QOM properties "cpu-has-el3", "cpu-has-el2" which set whether the CPUs
  *    have the exception level features present.
+ *  + QOM property "gic-spi-num" sets the number of GIC Shared Peripheral
+ *    Interrupts.
  */
 #define TYPE_CORTEX_MPCORE_PRIV "cortex_mpcore_priv"
 OBJECT_DECLARE_TYPE(CortexMPPrivState, CortexMPPrivClass, CORTEX_MPCORE_PRIV)
@@ -39,6 +41,8 @@ OBJECT_DECLARE_TYPE(CortexMPPrivState, CortexMPPrivClass, CORTEX_MPCORE_PRIV)
 /**
  * CortexMPPrivClass:
  * @container_size - size of the device's MMIO region
+ * @gic_spi_default - default number of GIC SPIs
+ * @gic_spi_max - maximum number of GIC SPIs
  */
 struct CortexMPPrivClass {
     SysBusDeviceClass parent_class;
@@ -46,6 +50,9 @@ struct CortexMPPrivClass {
     DeviceRealize parent_realize;
 
     uint64_t container_size;
+
+    unsigned gic_spi_default;
+    unsigned gic_spi_max;
 };
 
 struct CortexMPPrivState {
@@ -58,6 +65,8 @@ struct CortexMPPrivState {
 
     bool cpu_has_el3;
     bool cpu_has_el2;
+
+    uint32_t gic_spi_num;
 };
 
 #define TYPE_A9MPCORE_PRIV "a9mpcore_priv"
@@ -66,8 +75,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(A9MPPrivState, A9MPCORE_PRIV)
 struct A9MPPrivState {
     CortexMPPrivState parent_obj;
 
-    uint32_t num_irq;
-
     A9SCUState scu;
     GICState gic;
     A9GTimerState gtimer;
@@ -81,8 +88,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(A15MPPrivState, A15MPCORE_PRIV)
 struct A15MPPrivState {
     CortexMPPrivState parent_obj;
 
-    uint32_t num_irq;
-
     GICState gic;
 };
 
diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index a16544fdde..195355b589 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -61,7 +61,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
 
     gicdev = DEVICE(&s->gic);
     qdev_prop_set_uint32(gicdev, "num-cpu", c->num_cores);
-    qdev_prop_set_uint32(gicdev, "num-irq", s->num_irq);
+    qdev_prop_set_uint32(gicdev, "num-irq", c->gic_spi_num);
 
     if (!kvm_irqchip_in_kernel()) {
         /* Make the GIC's TZ support match the CPUs. We assume that
@@ -83,14 +83,14 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     sysbus_pass_irq(sbd, gicsbd);
 
     /* Pass through inbound GPIO lines to the GIC */
-    qdev_init_gpio_in(dev, a15mp_priv_set_irq, s->num_irq - 32);
+    qdev_init_gpio_in(dev, a15mp_priv_set_irq, c->gic_spi_num - 32);
 
     /* Wire the outputs from each CPU's generic timer to the
      * appropriate GIC PPI inputs
      */
     for (i = 0; i < c->num_cores; i++) {
         DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
-        int ppibase = s->num_irq - 32 + i * 32;
+        int ppibase = c->gic_spi_num - 32 + i * 32;
         int irq;
         /* Mapping from the output timer irq lines from the CPU to the
          * GIC PPI inputs used on the A15:
@@ -142,17 +142,6 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static Property a15mp_priv_properties[] = {
-    /* The Cortex-A15MP may have anything from 0 to 224 external interrupt
-     * IRQ lines (with another 32 internal). We default to 128+32, which
-     * is the number provided by the Cortex-A15MP test chip in the
-     * Versatile Express A15 development board.
-     * Other boards may differ and should set this property appropriately.
-     */
-    DEFINE_PROP_UINT32("num-irq", A15MPPrivState, num_irq, 160),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void a15mp_priv_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -160,9 +149,18 @@ static void a15mp_priv_class_init(ObjectClass *klass, void *data)
 
     cc->container_size = 0x8000;
 
+    /*
+     * The Cortex-A15MP may have anything from 0 to 224 external interrupt
+     * IRQ lines (with another 32 internal). We default to 128+32, which
+     * is the number provided by the Cortex-A15MP test chip in the
+     * Versatile Express A15 development board.
+     * Other boards may differ and should set this property appropriately.
+     */
+    cc->gic_spi_default = 160;
+    cc->gic_spi_max = 224;
+
     device_class_set_parent_realize(dc, a15mp_priv_realize,
                                     &cc->parent_realize);
-    device_class_set_props(dc, a15mp_priv_properties);
     /* We currently have no saveable state */
 }
 
diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index 54949314f8..72621bce64 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -78,7 +78,7 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
 
     gicdev = DEVICE(&s->gic);
     qdev_prop_set_uint32(gicdev, "num-cpu", c->num_cores);
-    qdev_prop_set_uint32(gicdev, "num-irq", s->num_irq);
+    qdev_prop_set_uint32(gicdev, "num-irq", c->gic_spi_num);
     qdev_prop_set_uint32(gicdev, "num-priority-bits",
                          A9_GIC_NUM_PRIORITY_BITS);
 
@@ -96,7 +96,7 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     sysbus_pass_irq(sbd, gicbusdev);
 
     /* Pass through inbound GPIO lines to the GIC */
-    qdev_init_gpio_in(dev, a9mp_priv_set_irq, s->num_irq - 32);
+    qdev_init_gpio_in(dev, a9mp_priv_set_irq, c->gic_spi_num - 32);
 
     gtimerdev = DEVICE(&s->gtimer);
     qdev_prop_set_uint32(gtimerdev, "num-cpu", c->num_cores);
@@ -150,7 +150,7 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
      * timer is PPI 29 and the watchdog PPI 30.
      */
     for (unsigned i = 0; i < c->num_cores; i++) {
-        int ppibase = (s->num_irq - 32) + i * 32;
+        int ppibase = (c->gic_spi_num - 32) + i * 32;
         sysbus_connect_irq(gtimerbusdev, i,
                            qdev_get_gpio_in(gicdev, ppibase + 27));
         sysbus_connect_irq(mptimerbusdev, i,
@@ -160,17 +160,6 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     }
 }
 
-static Property a9mp_priv_properties[] = {
-    /* The Cortex-A9MP may have anything from 0 to 224 external interrupt
-     * IRQ lines (with another 32 internal). We default to 64+32, which
-     * is the number provided by the Cortex-A9MP test chip in the
-     * Realview PBX-A9 and Versatile Express A9 development boards.
-     * Other boards may differ and should set this property appropriately.
-     */
-    DEFINE_PROP_UINT32("num-irq", A9MPPrivState, num_irq, 96),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void a9mp_priv_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -178,8 +167,17 @@ static void a9mp_priv_class_init(ObjectClass *klass, void *data)
 
     cc->container_size = 0x2000;
 
+    /*
+     * The Cortex-A9MP may have anything from 0 to 224 external interrupt
+     * IRQ lines (with another 32 internal). We default to 64+32, which
+     * is the number provided by the Cortex-A9MP test chip in the
+     * Realview PBX-A9 and Versatile Express A9 development boards.
+     * Other boards may differ and should set this property appropriately.
+     */
+    cc->gic_spi_default = 96;
+    cc->gic_spi_max = 224;
+
     device_class_set_parent_realize(dc, a9mp_priv_realize, &cc->parent_realize);
-    device_class_set_props(dc, a9mp_priv_properties);
 }
 
 static const TypeInfo a9mp_types[] = {
diff --git a/hw/cpu/cortex_mpcore.c b/hw/cpu/cortex_mpcore.c
index 549b81f708..dee40a7bf2 100644
--- a/hw/cpu/cortex_mpcore.c
+++ b/hw/cpu/cortex_mpcore.c
@@ -21,6 +21,8 @@ static void cortex_mpcore_priv_instance_init(Object *obj)
     memory_region_init(&s->container, obj,
                        "mpcore-priv-container", k->container_size);
     sysbus_init_mmio(sbd, &s->container);
+
+    s->gic_spi_num = k->gic_spi_default;
 }
 
 static Property cortex_mpcore_priv_properties[] = {
@@ -30,6 +32,9 @@ static Property cortex_mpcore_priv_properties[] = {
     DEFINE_PROP_BOOL("cpu-has-el3", CortexMPPrivState, cpu_has_el3, true),
     DEFINE_PROP_BOOL("cpu-has-el2", CortexMPPrivState, cpu_has_el2, false),
 
+    DEFINE_PROP_UINT32("gic-spi-num", CortexMPPrivState, gic_spi_num, 0),
+    DEFINE_PROP_UINT32("num-irq", CortexMPPrivState, gic_spi_num, 0), /* alias */
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0
