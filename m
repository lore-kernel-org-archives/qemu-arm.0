Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp358350njc;
        Wed, 7 Aug 2024 19:51:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLoM/a/ty9gsazhJE5pDn/JwyftkVVztGfuNzJEFdw1xdI08khIrL3Y3HudpFmx2xEE3NoNEUlBS62P2orVfcGt/hg7RQf
X-Google-Smtp-Source: AGHT+IElQXjCsaln0t1M4LW5+efzF+dlg85JfPjEOVAtXYto53eWga4XIaC7oYR6w3FDSIpirPz7
X-Received: by 2002:a05:6214:2f0d:b0:6b7:b4b1:85b9 with SMTP id 6a1803df08f44-6bd6bcb0986mr5766936d6.3.1723085502429;
        Wed, 07 Aug 2024 19:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723085502; cv=none;
        d=google.com; s=arc-20160816;
        b=tZH2JdSWxVIMeIXOUhXUJOLATdTSqkoEPgG0smULcuTzWP8civLqteKlqQdn7irkYQ
         L5o4qdP4/8Qc0QCBIMNMPewu1hoDisZROf4tqovKxXGB/CDPLe+XKTVlXpP2Y1A4gJls
         qafwnFDzoDo3fpK7RHVqK7KNL+vfrDt4KdpLV6Z7yvmAqg6yGFWONWtdcpm4jY9fWnVy
         bUHVf6AQ2BTtaBGHIz2pGdPwMl5+ud3QzI7w0EgrZj3j68Y3kNRikj2OVwbE2fvPQq5Q
         1P3D5akb5TbabF5hyGpMkjpz0N7UPrtyqRAZktiNWXVc0G2MJgM6LuRdUyzQx7t/frnd
         fRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=2k7ap+Bsd/V/VzbALjK2K3hlYLwCXXcvtQ4u7v484JE=;
        fh=FCtYWwOtEgMeIuI7wG7f687kK1NW14MjWu/nT+chD9o=;
        b=DsySZAi/W6NMTtNcsdrh63rC7YaBw+BOxv2u1BE8rRbmzF2QZ5fkjNGB3bvwziRq9g
         4ZpYW/4qPDGAQxhw93HzXkYaiMT7qA0jgI2dUR9087gA8UeoLDRWJsDKnRE4/DvNarZE
         aI9fwW4d6bLPE/rTB472Z5DKevOmUJUXdJbGcpP8nVIbtXOCh9jJasBULRMIkq6FtIX8
         pfSt5/GD3/LEnICq7VAvOnQAY/3jU1boY/bVMi33jJwNx8P4mJq+FTTApNlh24ri2oYt
         ZzJZQ7D2SE6UlAjjVAYo90rs2p2qRNc2m4KjLuxg+TSUz8duGNPbGklZMVdLNB3H06Bg
         Y6Gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb92e5d6si33154506d6.565.2024.08.07.19.51.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 19:51:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbtDt-0008Bo-Ty; Wed, 07 Aug 2024 22:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDr-00083A-U6; Wed, 07 Aug 2024 22:49:51 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDq-0008AE-DJ; Wed, 07 Aug 2024 22:49:51 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 8 Aug
 2024 10:49:18 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 8 Aug 2024 10:49:18 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 09/11] aspeed/soc: support I2C for AST2700
Date: Thu, 8 Aug 2024 10:49:14 +0800
Message-ID: <20240808024916.1262715-10-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
References: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
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
X-TUID: mowZi9S1ZcGr

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

