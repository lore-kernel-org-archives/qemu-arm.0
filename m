Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1355476njf;
        Tue, 3 Sep 2024 01:36:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnYpHWditHH4yZyD7EBmbxhfNmYe8UKE65rf8KQZ3FOUnmL0hLxTN7YadHnqLh0jlA1KHUVgPNvwadKA==@linaro.org
X-Google-Smtp-Source: AGHT+IEpt0GFwQDIA76xNcNnX+FK/FxdtvYTqFjM24/RjCuUNKgycBW5Gp6PZc6C3xEqsW0a9BGP
X-Received: by 2002:a05:620a:4092:b0:7a1:d0b4:9f3b with SMTP id af79cd13be357-7a8932794aemr1259918585a.26.1725352598565;
        Tue, 03 Sep 2024 01:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725352598; cv=none;
        d=google.com; s=arc-20160816;
        b=wQm+5frOLBgd4MBlNftsmAETYvo5E85owqc0ONC2m4/GDgxW0ivKiqUbUgGF7cTZS3
         ht52gTSR5xWSFj3d/ynNvLo+AE4Cye52Lgl6GXV9bF4zisFXicUKUXvp4SMpbpuKnbAO
         3xKnoI8fgIm6XSAupBGX5BCai1bK5GHTOpZPohXc9NIf3pEd1khbYhicv9WkEd8PCzSC
         Im78v1ZLZHGGtsFhaoizAkf3XA6HBzCMf1j6OgVDNyZy229FGZESX8Sc7o34K+81zBFv
         kEBbcAJd3xV9Ad5awn9jbNHYStnbM/twi2H5b7aYIAv2XoeOsBsdTuibhIVEFSveNuy9
         VLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=AzsRodhB8Rm5FJTGBsKFPNBwWk4zPcCD99fQP4EhyIU=;
        fh=FCtYWwOtEgMeIuI7wG7f687kK1NW14MjWu/nT+chD9o=;
        b=eMkntXCrqCrZBoOamPo0zThT2v4lVrMbOFxqbFciiNaG+ZOYYd04aMSY8+LJvZXFl+
         0yUwFqCKC5jaQX5KHoNzMk9y3tlpMWNjo08Z0mWJE9C/GklKgl0YPds6/ZlFhSPwakpR
         16LdJRVHc/E2yDQxrbB0R8VglI6KLsjHXKBnIL912W4LXsTWWJuYW4qyizeLddOsBHSg
         kFX36kVKZEY0oBcKA2ge1bOY7biMaIj/ATZnDrtpC1EA1e2d/IN/1BepY6NAlTfCk0cj
         BuG90j51a2nTlls8izn7n8rV757wp4xAIbfXDSDzuTMgg4HW9JTvsD3JmqiZs/1MwqO5
         AOFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806c46b65si1240796585a.221.2024.09.03.01.36.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 01:36:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slP1E-0004nY-J8; Tue, 03 Sep 2024 04:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1slP17-0004FQ-FK; Tue, 03 Sep 2024 04:36:01 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1slP16-00084x-00; Tue, 03 Sep 2024 04:36:01 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Sep
 2024 16:35:31 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Sep 2024 16:35:30 +0800
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
Subject: [PATCH v3 09/11] aspeed/soc: Support I2C for AST2700
Date: Tue, 3 Sep 2024 16:35:26 +0800
Message-ID: <20240903083528.2182190-10-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903083528.2182190-1-jamin_lin@aspeedtech.com>
References: <20240903083528.2182190-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ZMJHk+vzjZfm

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
 hw/arm/aspeed_ast27x0.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index a5eb78524f..761ee11657 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -61,6 +61,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_GIC_DIST]      =  0x12200000,
     [ASPEED_GIC_REDIST]    =  0x12280000,
     [ASPEED_DEV_ADC]       =  0x14C00000,
+    [ASPEED_DEV_I2C]       =  0x14C0F000,
 };
 
 #define AST2700_MAX_IRQ 288
@@ -369,6 +370,9 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
     object_initialize_child(obj, "adc", &s->adc, typename);
+
+    snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
+    object_initialize_child(obj, "i2c", &s->i2c, typename);
 }
 
 /*
@@ -452,6 +456,7 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     AspeedINTCClass *ic = ASPEED_INTC_GET_CLASS(&a->intc);
     g_autofree char *sram_name = NULL;
+    qemu_irq irq;
 
     /* Default boot region (SPI memory or ROMs) */
     memory_region_init(&s->spi_boot_container, OBJECT(s),
@@ -634,6 +639,25 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
 
+    /* I2C */
+    object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i2c), 0, sc->memmap[ASPEED_DEV_I2C]);
+    for (i = 0; i < ASPEED_I2C_GET_CLASS(&s->i2c)->num_busses; i++) {
+        /*
+         * The AST2700 I2C controller has one source INTC per bus.
+         * I2C buses interrupt are connected to GICINT130_INTC
+         * from bit 0 to bit 15.
+         * I2C bus 0 is connected to GICINT130_INTC at bit 0.
+         * I2C bus 15 is connected to GICINT130_INTC at bit 15.
+         */
+        irq = aspeed_soc_ast2700_get_irq_index(s, ASPEED_DEV_I2C, i);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
+    }
+
     create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
     create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
     create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-- 
2.34.1

