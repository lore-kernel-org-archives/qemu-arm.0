Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp190883njc;
        Fri, 27 Sep 2024 01:35:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5gU03RgWXuyInusBwWZLHguAyAsnVh58BiS3kLKRciXpReZLyvVvP/aL5LzpNSYNA945z80GboINamQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFNYIrP+D2wwXZUOO//RF9WVukiftcYvt9BiCBzKbDJJ7eRnEgvcCHUC1dPREHgEa5XwBCp
X-Received: by 2002:a05:622a:1a8d:b0:458:4d54:2c35 with SMTP id d75a77b69052e-45c9f290bd0mr35511351cf.46.1727426158347;
        Fri, 27 Sep 2024 01:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727426158; cv=none;
        d=google.com; s=arc-20240605;
        b=IItJ1LmRyQw1RVRN7jsk2JRzAOPsxx/Sin1f6s0BsYStfgdnRGbPMeNhv5XQBpUp2a
         GE0l8SrlbQvy3d+ODJ8e5i/V71r144P4AyeYYXTHXP+zPfm8XolT9Dyd04mgKA1V00XZ
         HtFIUUm1zcWG1VfwuONYKKGD24qo7muPSxRJvbcXm2YtFNXFMcjM61NcFLU8ru50SYWU
         l7Cc3uHihcQ/xnurz0J/ijlpV5k+H4TniPzEBjrR7ymKUr8Qs63aMmM1rd9NF7FYfNGe
         YRIe87pe/8aFJVwTP9tcvIhT8lFQLYUSJ6HNUS8gdd64xszLLwZ233Yb/MvgEA6O9KCO
         5lIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=GIPtcYwCPnbfIaFC6dF8Nsv+oIgqHO9WoiCeF1prGiM=;
        fh=bfdvnURtAD34fQ77QeZnvwdM4/zSvHk1Doa+KIkv0v8=;
        b=lRDquw1lgZD95kwz2N3Cws8WFcy1JXOiwExnXt6s2n0FFCLwMSkfPriE0YvN/XrSXz
         baAsj1yD4bhpTAToo+oUgjOAyNv5l3Qo5eArJZmKxz73fL6yoBmDR9mf6gAst7gbgUbz
         sZb0ZpO7Wxo1o7oPB0+9IZOn46loAgvfTqWt18dSA0/s/ykM11y4lhlRFASjrBYqlGLc
         NFXkTU1y7FsDN8P8/tYGJDOzgvhNYqdYPcfTA062bj5iZrgIwWBZ5lb812jyfKA5GTX4
         kSbRae+oYVL7vSZZXATTrLuF5gV6JOFy9RW+0JJyJAHg7eoxlKjbzoJ9r/TnlG5OOlvH
         zI8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f32865fsi15986901cf.264.2024.09.27.01.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2024 01:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1su6Qv-0007ag-AM; Fri, 27 Sep 2024 04:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1su6Qf-00078y-6t; Fri, 27 Sep 2024 04:34:26 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1su6Qd-0003ff-SP; Fri, 27 Sep 2024 04:34:20 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 27 Sep
 2024 16:33:53 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 27 Sep 2024 16:33:53 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v5 6/7] aspeed/soc: Support GPIO for AST2700 and correct irq
 130
Date: Fri, 27 Sep 2024 16:33:50 +0800
Message-ID: <20240927083351.2637798-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927083351.2637798-1-jamin_lin@aspeedtech.com>
References: <20240927083351.2637798-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: 83p8XnAMbSjR

The register set of GPIO have a significant change since AST2700.
Each GPIO pin has their own individual control register and users are able to
set one GPIO pin’s direction, interrupt enable, input mask and so on in the
same one control register.

AST2700 does not have GPIO18_XXX registers for GPIO 1.8v, removes
ASPEED_DEV_GPIO_1_8V. It is enough to only have ASPEED_DEV_GPIO
device in AST2700.

Add GPIO model for AST2700 GPIO support. The GPIO controller registers base
address is start at 0x14C0_B000 and its address space is 0x1000.

The AST2700 GPIO controller interrupt is connected to GICINT130_INTC at
bit 18. Therefore, correct GPIO irq 130.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 761ee11657..dca660eb6b 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -62,6 +62,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_GIC_REDIST]    =  0x12280000,
     [ASPEED_DEV_ADC]       =  0x14C00000,
     [ASPEED_DEV_I2C]       =  0x14C0F000,
+    [ASPEED_DEV_GPIO]      =  0x14C0B000,
 };
 
 #define AST2700_MAX_IRQ 288
@@ -87,8 +88,7 @@ static const int aspeed_soc_ast2700_irqmap[] = {
     [ASPEED_DEV_ADC]       = 130,
     [ASPEED_DEV_XDMA]      = 5,
     [ASPEED_DEV_EMMC]      = 15,
-    [ASPEED_DEV_GPIO]      = 11,
-    [ASPEED_DEV_GPIO_1_8V] = 130,
+    [ASPEED_DEV_GPIO]      = 130,
     [ASPEED_DEV_RTC]       = 13,
     [ASPEED_DEV_TIMER1]    = 16,
     [ASPEED_DEV_TIMER2]    = 17,
@@ -124,7 +124,7 @@ static const int aspeed_soc_ast2700_gic128_intcmap[] = {
 static const int aspeed_soc_ast2700_gic130_intcmap[] = {
     [ASPEED_DEV_I2C]        = 0,
     [ASPEED_DEV_ADC]        = 16,
-    [ASPEED_DEV_GPIO_1_8V]  = 18,
+    [ASPEED_DEV_GPIO]       = 18,
 };
 
 /* GICINT 131 */
@@ -373,6 +373,9 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
     object_initialize_child(obj, "i2c", &s->i2c, typename);
+
+    snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
+    object_initialize_child(obj, "gpio", &s->gpio, typename);
 }
 
 /*
@@ -658,6 +661,15 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
     }
 
+    /* GPIO */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0,
+                    sc->memmap[ASPEED_DEV_GPIO]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
+
     create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
     create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
     create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-- 
2.34.1

