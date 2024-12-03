Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3385412njk;
        Mon, 2 Dec 2024 18:16:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU+folVqCxi7mPCl2SS8c+Dfbr5ESnjVDn8xlyDUxz30D2yywFGS7ocYL8RkOj31wZTv7fiX9xwNLxaUg==@linaro.org
X-Google-Smtp-Source: AGHT+IEMDRP6FrZOLzd4hbhO20UcwGhUzvIYcscaYzHBby23OqyIRGyNUfdwWwHnO0qmXskrF7l2
X-Received: by 2002:a05:622a:109:b0:461:6613:18ac with SMTP id d75a77b69052e-466c1be41e0mr384761521cf.17.1733192183710;
        Mon, 02 Dec 2024 18:16:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733192183; cv=none;
        d=google.com; s=arc-20240605;
        b=TVWyE/xP4gkng/X6AIA176SYvwwHKb5P3PBkuqR/FOwqYgEd9oP0BmXTGwXGEkdybY
         x5vzokTBdEjPWc2uAad0SPE+LwLYt8PcxnzqaiVq05IdFErdezVqPsv1ebeCvgMjLZJG
         uik7XFns2ZJfGJ3ba0XwwZ++7TVUQ4ohHTa6Afgu9oMFzPgBnW1/wV8K3MxNa4zkuY6h
         IHcYrJgF0lE/PjNhIihlzz/Mk7SpFMVmSKyHnBQ2OVqS+PTUF5POL3FgNzE1e8KjzEum
         VQJ7wT2c3E++B8WE6/HFXua16SSjjOj/u5ELIgHOkXTwaNi28XrxmAxPHcleBAlOJ29d
         XAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=fq0udaaNig78WnF74na53W+WRaKfssJbw5vofUrs/l0=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=BlmbGDpjx88+PDZPvKD38SkbM5kDkN8yvclKYGuVrQt3+5PEy7aCo3bHGklZ2GM6bx
         kAib3AEzWwfqqCk8OOs0FPZ6xNHulQbX2FmXEzG41ijnHZ5gyQ2jBdqG+fnUzKx1bBZ1
         np9V+p1+uHgyitI5IUhXkUnAHwwTbt41XZWooVPehHDHcCGvANP65WKAIpFwxRS1uEyc
         cF5BWfOqNel8qKYouMgGRDO5u79EMOxce+ALqbdJX/hru8PkPzEB8TcD1qut2ya+t7Zq
         hdLaMATRr4BXxIGir9FkMm+GzZRhiSGC3X8cEEdj1NCRfQ/HnytHGxsTjP7JRYKzpAyK
         Cpog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4351452si125657961cf.626.2024.12.02.18.16.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 18:16:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIIRj-0005T5-Ld; Mon, 02 Dec 2024 21:15:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIIRc-0005R6-1o; Mon, 02 Dec 2024 21:15:20 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIIRa-0003dt-Fs; Mon, 02 Dec 2024 21:15:19 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Dec
 2024 10:15:01 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Dec 2024 10:15:01 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 3/6] hw:sdhci: Introduce a new "capareg" class member to
 set the different Capability Registers.
Date: Tue, 3 Dec 2024 10:14:57 +0800
Message-ID: <20241203021500.3986213-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241203021500.3986213-1-jamin_lin@aspeedtech.com>
References: <20241203021500.3986213-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aNPc/9Kr4DfB

Currently, it set the hardcode value of capability registers to all ASPEED SOCs
However, the value of capability registers should be different for all ASPEED
SOCs. For example: the bit 28 of the Capability Register 1 should be 1 for
64-bits System Bus support for AST2700.

Introduce a new "capareg" class member whose data type is uint_64 to set the
different Capability Registers to all ASPEED SOCs.

The value of Capability Register is "0x0000000001e80080" for AST2400 and
AST2500. The value of Capability Register is "0x0000000701f80080" for AST2600.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast2400.c      |  3 +-
 hw/arm/aspeed_ast2600.c      |  7 ++--
 hw/sd/aspeed_sdhci.c         | 72 +++++++++++++++++++++++++++++++-----
 include/hw/sd/aspeed_sdhci.h | 12 +++++-
 4 files changed, 78 insertions(+), 16 deletions(-)

diff --git a/hw/arm/aspeed_ast2400.c b/hw/arm/aspeed_ast2400.c
index ecc81ecc79..3c1b419945 100644
--- a/hw/arm/aspeed_ast2400.c
+++ b/hw/arm/aspeed_ast2400.c
@@ -224,7 +224,8 @@ static void aspeed_ast2400_soc_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
     object_initialize_child(obj, "gpio", &s->gpio, typename);
 
-    object_initialize_child(obj, "sdc", &s->sdhci, TYPE_ASPEED_SDHCI);
+    snprintf(typename, sizeof(typename), "aspeed.sdhci-%s", socname);
+    object_initialize_child(obj, "sdc", &s->sdhci, typename);
 
     object_property_set_int(OBJECT(&s->sdhci), "num-slots", 2, &error_abort);
 
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index c40d3d8443..b5703bd064 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -236,8 +236,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s-1_8v", socname);
     object_initialize_child(obj, "gpio_1_8v", &s->gpio_1_8v, typename);
 
-    object_initialize_child(obj, "sd-controller", &s->sdhci,
-                            TYPE_ASPEED_SDHCI);
+    snprintf(typename, sizeof(typename), "aspeed.sdhci-%s", socname);
+    object_initialize_child(obj, "sd-controller", &s->sdhci, typename);
 
     object_property_set_int(OBJECT(&s->sdhci), "num-slots", 2, &error_abort);
 
@@ -247,8 +247,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
                                 &s->sdhci.slots[i], TYPE_SYSBUS_SDHCI);
     }
 
-    object_initialize_child(obj, "emmc-controller", &s->emmc,
-                            TYPE_ASPEED_SDHCI);
+    object_initialize_child(obj, "emmc-controller", &s->emmc, typename);
 
     object_property_set_int(OBJECT(&s->emmc), "num-slots", 1, &error_abort);
 
diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index acd6538261..93f5571021 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -148,6 +148,7 @@ static void aspeed_sdhci_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     AspeedSDHCIState *sdhci = ASPEED_SDHCI(dev);
+    AspeedSDHCIClass *asc = ASPEED_SDHCI_GET_CLASS(sdhci);
 
     /* Create input irqs for the slots */
     qdev_init_gpio_in_named_with_opaque(DEVICE(sbd), aspeed_sdhci_set_irq,
@@ -167,7 +168,7 @@ static void aspeed_sdhci_realize(DeviceState *dev, Error **errp)
         }
 
         if (!object_property_set_uint(sdhci_slot, "capareg",
-                                      ASPEED_SDHCI_CAPABILITIES, errp)) {
+                                      asc->capareg, errp)) {
             return;
         }
 
@@ -218,13 +219,66 @@ static void aspeed_sdhci_class_init(ObjectClass *classp, void *data)
     device_class_set_props(dc, aspeed_sdhci_properties);
 }
 
-static const TypeInfo aspeed_sdhci_types[] = {
-    {
-        .name           = TYPE_ASPEED_SDHCI,
-        .parent         = TYPE_SYS_BUS_DEVICE,
-        .instance_size  = sizeof(AspeedSDHCIState),
-        .class_init     = aspeed_sdhci_class_init,
-    },
+static const TypeInfo aspeed_sdhci_info = {
+    .name           = TYPE_ASPEED_SDHCI,
+    .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(AspeedSDHCIState),
+    .class_init     = aspeed_sdhci_class_init,
+    .class_size = sizeof(AspeedSDHCIClass),
+    .abstract = true,
+};
+
+static void aspeed_2400_sdhci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSDHCIClass *asc = ASPEED_SDHCI_CLASS(klass);
+
+    dc->desc = "ASPEED 2400 SDHCI Controller";
+    asc->capareg = 0x0000000001e80080;
+}
+
+static const TypeInfo aspeed_2400_sdhci_info = {
+    .name = TYPE_ASPEED_2400_SDHCI,
+    .parent = TYPE_ASPEED_SDHCI,
+    .class_init = aspeed_2400_sdhci_class_init,
+};
+
+static void aspeed_2500_sdhci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSDHCIClass *asc = ASPEED_SDHCI_CLASS(klass);
+
+    dc->desc = "ASPEED 2500 SDHCI Controller";
+    asc->capareg = 0x0000000001e80080;
+}
+
+static const TypeInfo aspeed_2500_sdhci_info = {
+    .name = TYPE_ASPEED_2500_SDHCI,
+    .parent = TYPE_ASPEED_SDHCI,
+    .class_init = aspeed_2500_sdhci_class_init,
 };
 
-DEFINE_TYPES(aspeed_sdhci_types)
+static void aspeed_2600_sdhci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSDHCIClass *asc = ASPEED_SDHCI_CLASS(klass);
+
+    dc->desc = "ASPEED 2600 SDHCI Controller";
+    asc->capareg = 0x0000000701f80080;
+}
+
+static const TypeInfo aspeed_2600_sdhci_info = {
+    .name = TYPE_ASPEED_2600_SDHCI,
+    .parent = TYPE_ASPEED_SDHCI,
+    .class_init = aspeed_2600_sdhci_class_init,
+};
+
+static void aspeed_sdhci_register_types(void)
+{
+    type_register_static(&aspeed_sdhci_info);
+    type_register_static(&aspeed_2400_sdhci_info);
+    type_register_static(&aspeed_2500_sdhci_info);
+    type_register_static(&aspeed_2600_sdhci_info);
+}
+
+type_init(aspeed_sdhci_register_types);
diff --git a/include/hw/sd/aspeed_sdhci.h b/include/hw/sd/aspeed_sdhci.h
index 057bc5f3d1..8083797e25 100644
--- a/include/hw/sd/aspeed_sdhci.h
+++ b/include/hw/sd/aspeed_sdhci.h
@@ -13,9 +13,11 @@
 #include "qom/object.h"
 
 #define TYPE_ASPEED_SDHCI "aspeed.sdhci"
-OBJECT_DECLARE_SIMPLE_TYPE(AspeedSDHCIState, ASPEED_SDHCI)
+#define TYPE_ASPEED_2400_SDHCI TYPE_ASPEED_SDHCI "-ast2400"
+#define TYPE_ASPEED_2500_SDHCI TYPE_ASPEED_SDHCI "-ast2500"
+#define TYPE_ASPEED_2600_SDHCI TYPE_ASPEED_SDHCI "-ast2600"
+OBJECT_DECLARE_TYPE(AspeedSDHCIState, AspeedSDHCIClass, ASPEED_SDHCI)
 
-#define ASPEED_SDHCI_CAPABILITIES 0x01E80080
 #define ASPEED_SDHCI_NUM_SLOTS    2
 #define ASPEED_SDHCI_NUM_REGS     (ASPEED_SDHCI_REG_SIZE / sizeof(uint32_t))
 #define ASPEED_SDHCI_REG_SIZE     0x100
@@ -32,4 +34,10 @@ struct AspeedSDHCIState {
     uint32_t regs[ASPEED_SDHCI_NUM_REGS];
 };
 
+struct AspeedSDHCIClass {
+    SysBusDeviceClass parent_class;
+
+    uint64_t capareg;
+};
+
 #endif /* ASPEED_SDHCI_H */
-- 
2.34.1

