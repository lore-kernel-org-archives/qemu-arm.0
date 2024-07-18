Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1260764njk;
        Wed, 17 Jul 2024 23:51:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqi7YOriZ2Oo9okMQox7e4xd9FQ5UGZ/Iz0FfPkred5oMs4FVWKj0yMd95nboaYAK6fOwaSjOmSy5KcYjd4BvFo+7JTb/n
X-Google-Smtp-Source: AGHT+IH3tkrSyCvwRNq7a+szXdH1JM/E4r4OPArPlxEnXod1cO7O9IR61Nibf9q8XUwxfXkvItkE
X-Received: by 2002:a05:622a:199d:b0:447:e3ad:699d with SMTP id d75a77b69052e-44f8616bd78mr38019051cf.10.1721285513766;
        Wed, 17 Jul 2024 23:51:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721285513; cv=none;
        d=google.com; s=arc-20160816;
        b=Dj7nBbJOd9/5ub7d88DPGmRPMbhq1O7F2n2YFcgpoLgXiitKbyZAsxg5bGmOF94sXf
         5LKgYc9wjikjiibPTgQlxvnyP8LTtBuiwirwl1T414hUHQn2Otw4IwGhP6JaC8S85Wui
         EspnVqIIq1MYxDvmUT8QtgfjQtcWTqc3qDy4LYd8Ud8326yImMXbKKFM7IscVfLeJUR9
         /0c4/1+IzchP+L/4LqwKBvJiZaAc1RHR5IF7boQdeDRGMPuKe0fLgCHs6+GZ3xtiImbY
         sAWZTEj9JyS2JESp3JWGEP8AsIfxvUd89lnDn5lEPtOeZQGBeWMlLCBF/5v+BOkx5juD
         ZIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=2k7ap+Bsd/V/VzbALjK2K3hlYLwCXXcvtQ4u7v484JE=;
        fh=cqT0Sm0iQHqDiDEsJ3ixFD44Q88e2AVQBWE8a4yA5Ck=;
        b=0svcq5fZN6LKafO/GoxGrYzx1iqnjIgsTytvprN204D5NDk8JGqRxVUFK9PLrxe0Z7
         jg0GtyRkOFPe8hL0CF5Xplgs/tOJG45EFzVqlSjjoqRTWJ/1YMWHM47vXVZywq8FBu6v
         5wGScTR3p2pFdOinzB8mh1XpcbhNtoiBqBCU6W09Us4lTCosXVShADbbqcmjmgW+U9wL
         z42LpqJfyQKIDnf9mUZfUJi9v1ddTnOOBAfFg9EwJ5D9xmW0cbpGqIli2ZgTgJbMi59I
         CWe/xH9Ssaq2KlzohOgO6CjCwRarjWCilE+DDqwFPqSpZIHHA43sQ0XQsLsupUumqbsn
         AGwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b79e16fsi113295301cf.215.2024.07.17.23.51.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 23:51:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUKyz-0000QV-7Z; Thu, 18 Jul 2024 02:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKyj-0007He-R1; Thu, 18 Jul 2024 02:51:03 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKyh-0004VA-Kq; Thu, 18 Jul 2024 02:51:00 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 18 Jul
 2024 14:50:18 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 18 Jul 2024 14:50:18 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 13/15] aspeed/soc: support I2C for AST2700
Date: Thu, 18 Jul 2024 14:49:23 +0800
Message-ID: <20240718064925.1846074-14-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: JoUKR6W8Pc7H

Add I2C model for AST2700 I2C support.
The I2C controller registers base address is start at
0x14C0_F000 and its address space is 0x2000.

The AST2700 I2C controller has one source INTC per bus.
I2C buses interrupt are connected to GICINT130_INTC
from bit 0 to bit 15.
I2C bus 0 is connected to GICINT130_INTC at bit 0.
I2C bus 15 is connected to GICINT130_INTC at bit 15.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 0bbd66110b..e84141c13b 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -61,6 +61,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_GIC_DIST]      =  0x12200000,
     [ASPEED_GIC_REDIST]    =  0x12280000,
     [ASPEED_DEV_ADC]       =  0x14C00000,
+    [ASPEED_DEV_I2C]       =  0x14C0F000,
 };
 
 #define AST2700_MAX_IRQ 288
@@ -374,6 +375,9 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
     object_initialize_child(obj, "adc", &s->adc, typename);
+
+    snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
+    object_initialize_child(obj, "i2c", &s->i2c, typename);
 }
 
 /*
@@ -457,6 +461,8 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     AspeedINTCClass *ic = ASPEED_INTC_GET_CLASS(&a->intc);
     g_autofree char *sram_name = NULL;
+    qemu_irq irq;
+    struct gic_intc_orgate_info orgate_info;
 
     /* Default boot region (SPI memory or ROMs) */
     memory_region_init(&s->spi_boot_container, OBJECT(s),
@@ -639,6 +645,27 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
 
+    /* I2C */
+    object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
+    aspeed_soc_ast2700_get_intc_orgate(s, ASPEED_DEV_I2C, &orgate_info);
+    for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
+        /*
+         * The AST2700 I2C controller has one source INTC per bus.
+         * I2C buses interrupt are connected to GICINT130_INTC
+         * from bit 0 to bit 15.
+         * I2C bus 0 is connected to GICINT130_INTC at bit 0.
+         * I2C bus 15 is connected to GICINT130_INTC at bit 15.
+         */
+        irq = qdev_get_gpio_in(DEVICE(&a->intc.orgates[orgate_info.index]),
+                               orgate_info.int_num + i);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
+    }
+
     create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
     create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
     create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-- 
2.34.1

