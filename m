Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2238188lfp;
        Mon, 20 Sep 2021 09:35:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdmO2CFty8UpTFCUQLk86+cDDg1YoQ+ERI/uHfKFAAlyBNUTeW+AP/6YvngkCNipB1GExI
X-Received: by 2002:ac8:5941:: with SMTP id 1mr23309487qtz.1.1632155732735;
        Mon, 20 Sep 2021 09:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632155732; cv=none;
        d=google.com; s=arc-20160816;
        b=yJVUwM6TvJ+KgV4rIo4op0tSkNEt5/nsA+xdXZZk2N9ovedMLn71UfqVSOnhYhwXCV
         T8ky/4oMVRVBMACZJCIADpi8ort3BCywFogM4e3klwE07QS8zepREFpXKCsOoUfGKJpw
         l4uQvxoyHl8wrFLflaQKCfaJPyAEpSglSD4NxJj2Y4JPhMxP5WRmO4xDvuiex/tb2NfI
         O6G9kdl5WvJ3wnqC6v4b21o5/OApqbBEDNXO1HSAVodsY42k2eQqYxClOufFIlEDKJQ4
         HsqKCDW/EinUWP5/HBhG4dPchm7m5ms5noFOK5ue2KETibqBYCHQx7tzO3eMOmp1LzG5
         Hqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=QRdoe+WmR1TGCHwVi6CIBpoVaC1+GPF9GekiUt51Svo=;
        b=Jhbk4OKoA7AZKUEhMWAkIQ79GJ7a+bXINq+uSp1N9BtQAMiiS8RhQI9lvAYojoII/U
         EHcUen+hTcWQ9xJZkCTuLQqtJkJzwstWkzzfRh9ulLmqzmEHCXjZmIrMrISwWs92azTv
         bS9J04FMKOSyD0Oh+G+UN28FGRi8//szvRo5ruUUv+6VGC77LAd8spNr7bBopsmj5cOf
         i1QnXscDnR7FBgDypU8DyVqnigI6UD3DO3dm0FdN66Odtgp1aOWEFlGJIUcJ49wctIcK
         PvhMTPjcwcmwru0G1eyqZs/L/SQUdLl4skW0fIYItqLCyBwwQhSI7wjZlFyLYaflt478
         HUSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si9131976qkj.42.2021.09.20.09.35.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 09:35:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSMGS-0000lK-6K
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 12:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4p-0005xV-7h
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 12:23:31 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:47795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4e-0004EV-VG
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 12:23:31 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.52])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 3DE5C205EA;
 Mon, 20 Sep 2021 16:23:16 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 18:23:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0059e716f3c-7193-431f-bf92-978e885daf3c,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 12/12] aspeed/i2c: QOMify AspeedI2CBus
Date: Mon, 20 Sep 2021 18:23:09 +0200
Message-ID: <20210920162309.1091711-13-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920162309.1091711-1-clg@kaod.org>
References: <20210920162309.1091711-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6ee967a0-98cf-462d-9ebd-efaaf79427ed
X-Ovh-Tracer-Id: 13075075618866301734
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +CX/+MyxA3N/

Introduce an AspeedI2CBus SysBusDevice model and attach the associated
memory region and IRQ to the newly instantiated objects.

Before this change, the I2C bus IRQs were all attached to the
SysBusDevice model of the I2C controller. Adapt the AST2600 SoC
realize routine to take into account this change.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/aspeed_i2c.h |   8 ++-
 hw/arm/aspeed_ast2600.c     |   7 +--
 hw/i2c/aspeed_i2c.c         | 101 +++++++++++++++++++++++++++++-------
 3 files changed, 91 insertions(+), 25 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 565f83306624..4b9be09274c7 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -36,7 +36,11 @@ OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
 
 struct AspeedI2CState;
 
-typedef struct AspeedI2CBus {
+#define TYPE_ASPEED_I2C_BUS "aspeed.i2c.bus"
+OBJECT_DECLARE_SIMPLE_TYPE(AspeedI2CBus, ASPEED_I2C_BUS)
+struct AspeedI2CBus {
+    SysBusDevice parent_obj;
+
     struct AspeedI2CState *controller;
 
     MemoryRegion mr;
@@ -54,7 +58,7 @@ typedef struct AspeedI2CBus {
     uint32_t pool_ctrl;
     uint32_t dma_addr;
     uint32_t dma_len;
-} AspeedI2CBus;
+};
 
 struct AspeedI2CState {
     SysBusDevice parent_obj;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index c69f27dff62a..a70e4c48a73c 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -337,11 +337,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
         qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
                                         sc->irqmap[ASPEED_DEV_I2C] + i);
-        /*
-         * The AST2600 SoC has one IRQ per I2C bus. Skip the common
-         * IRQ (AST2400 and AST2500) and connect all bussses.
-         */
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), i + 1, irq);
+        /* The AST2600 I2C controller has one IRQ per bus. */
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
     }
 
     /* FMC, The number of CS is set at the board level */
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 8d276d9ed391..03a4f5a91010 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -740,20 +740,20 @@ static const VMStateDescription aspeed_i2c_vmstate = {
 
 static void aspeed_i2c_reset(DeviceState *dev)
 {
-    int i;
     AspeedI2CState *s = ASPEED_I2C(dev);
-    AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
 
     s->intr_status = 0;
+}
+
+static void aspeed_i2c_instance_init(Object *obj)
+{
+    AspeedI2CState *s = ASPEED_I2C(obj);
+    AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
+    int i;
 
     for (i = 0; i < aic->num_busses; i++) {
-        s->busses[i].intr_ctrl = 0;
-        s->busses[i].intr_status = 0;
-        s->busses[i].cmd = 0;
-        s->busses[i].buf = 0;
-        s->busses[i].dma_addr = 0;
-        s->busses[i].dma_len = 0;
-        i2c_end_transfer(s->busses[i].bus);
+        object_initialize_child(obj, "bus[*]", &s->busses[i],
+                                TYPE_ASPEED_I2C_BUS);
     }
 }
 
@@ -791,17 +791,21 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
 
     for (i = 0; i < aic->num_busses; i++) {
-        char name[32];
+        Object *bus = OBJECT(&s->busses[i]);
         int offset = i < aic->gap ? 1 : 5;
 
-        sysbus_init_irq(sbd, &s->busses[i].irq);
-        snprintf(name, sizeof(name), "aspeed.i2c.%d", i);
-        s->busses[i].controller = s;
-        s->busses[i].id = i;
-        s->busses[i].bus = i2c_init_bus(dev, name);
-        memory_region_init_io(&s->busses[i].mr, OBJECT(dev),
-                              &aspeed_i2c_bus_ops, &s->busses[i], name,
-                              aic->reg_size);
+        if (!object_property_set_link(bus, "controller", OBJECT(s), errp)) {
+            return;
+        }
+
+        if (!object_property_set_uint(bus, "bus-id", i, errp)) {
+            return;
+        }
+
+        if (!sysbus_realize(SYS_BUS_DEVICE(bus), errp)) {
+            return;
+        }
+
         memory_region_add_subregion(&s->iomem, aic->reg_size * (i + offset),
                                     &s->busses[i].mr);
     }
@@ -841,12 +845,72 @@ static void aspeed_i2c_class_init(ObjectClass *klass, void *data)
 static const TypeInfo aspeed_i2c_info = {
     .name          = TYPE_ASPEED_I2C,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = aspeed_i2c_instance_init,
     .instance_size = sizeof(AspeedI2CState),
     .class_init    = aspeed_i2c_class_init,
     .class_size = sizeof(AspeedI2CClass),
     .abstract   = true,
 };
 
+static void aspeed_i2c_bus_reset(DeviceState *dev)
+{
+    AspeedI2CBus *s = ASPEED_I2C_BUS(dev);
+
+    s->intr_ctrl = 0;
+    s->intr_status = 0;
+    s->cmd = 0;
+    s->buf = 0;
+    s->dma_addr = 0;
+    s->dma_len = 0;
+    i2c_end_transfer(s->bus);
+}
+
+static void aspeed_i2c_bus_realize(DeviceState *dev, Error **errp)
+{
+    AspeedI2CBus *s = ASPEED_I2C_BUS(dev);
+    AspeedI2CClass *aic;
+    g_autofree char *name = g_strdup_printf(TYPE_ASPEED_I2C_BUS ".%d", s->id);
+
+    if (!s->controller) {
+        error_setg(errp, TYPE_ASPEED_I2C_BUS ": 'controller' link not set");
+        return;
+    }
+
+    aic = ASPEED_I2C_GET_CLASS(s->controller);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+
+    s->bus = i2c_init_bus(dev, name);
+
+    memory_region_init_io(&s->mr, OBJECT(s), &aspeed_i2c_bus_ops,
+                          s, name, aic->reg_size);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mr);
+}
+
+static Property aspeed_i2c_bus_properties[] = {
+    DEFINE_PROP_UINT8("bus-id", AspeedI2CBus, id, 0),
+    DEFINE_PROP_LINK("controller", AspeedI2CBus, controller, TYPE_ASPEED_I2C,
+                     AspeedI2CState *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void aspeed_i2c_bus_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "Aspeed I2C Bus";
+    dc->realize = aspeed_i2c_bus_realize;
+    dc->reset = aspeed_i2c_bus_reset;
+    device_class_set_props(dc, aspeed_i2c_bus_properties);
+}
+
+static const TypeInfo aspeed_i2c_bus_info = {
+    .name           = TYPE_ASPEED_I2C_BUS,
+    .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(AspeedI2CBus),
+    .class_init     = aspeed_i2c_bus_class_init,
+};
+
 static qemu_irq aspeed_2400_i2c_bus_get_irq(AspeedI2CBus *bus)
 {
     return bus->controller->irq;
@@ -951,6 +1015,7 @@ static const TypeInfo aspeed_2600_i2c_info = {
 
 static void aspeed_i2c_register_types(void)
 {
+    type_register_static(&aspeed_i2c_bus_info);
     type_register_static(&aspeed_i2c_info);
     type_register_static(&aspeed_2400_i2c_info);
     type_register_static(&aspeed_2500_i2c_info);
-- 
2.31.1

