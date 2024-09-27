Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp167387njc;
        Fri, 27 Sep 2024 00:32:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUImtd114BaucwHqmJpdKpu+K2kUVKYsX8C//8rN2MN77krIjN3J3jsOL1gC/fwAbaHyGpbO5R4+fl7w==@linaro.org
X-Google-Smtp-Source: AGHT+IFBF1xDf0VAaGFdmusjkXhnLt628Ry9GTCJL0Cl5fSCm5IFHKdjmhkw4YeJ1d5GykZSm1jx
X-Received: by 2002:a05:6102:5125:b0:49e:928f:7976 with SMTP id ada2fe7eead31-4a2d7f36b40mr2000943137.12.1727422365699;
        Fri, 27 Sep 2024 00:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727422365; cv=none;
        d=google.com; s=arc-20240605;
        b=FjmgHphswJu3BgMw/vJ7LwNBresZ/kbwxgwxIZTv5Rvs5D+xR5hAcWn+1J50igFDiC
         sSriCXpZiP+ExqdVnc9CV1Q1J9bxvKLfY8sMxWeyyXLAcVJoawtsc8y+hL9M5EyUlPWf
         cldUtUVOj3XMVKupE0VCa7+iFIn5VfQdg7reYDTpvrudpswfZfIza0C6z98eV1TWiXPO
         VF1mh3g1UbL13lZoWQQOTj9CEFiPcqvlMwNxK5bvuFW+od4E7I+jVcy0ZSvipqLZ7fsY
         REqGtUodqIdz+qIwbGEdb4rNdXIGLRHCqMv9M+Vt+UiAmfZ6xDywnJ5V+Qg6FKQEysu1
         h7uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=GIPtcYwCPnbfIaFC6dF8Nsv+oIgqHO9WoiCeF1prGiM=;
        fh=bfdvnURtAD34fQ77QeZnvwdM4/zSvHk1Doa+KIkv0v8=;
        b=b3K/JuBOGonXmUKOlldQmZk4TgwFMSSvdZV28yrkHKm4rEeNKW6X098ktEIbx+OPUP
         jyWfH6HpXdEAUJDlGIHvZQL9GX9ajSnfRA2UTWKj/b2NV37TBdYujnvd0O48n/hB2+Rv
         kTSgEEWZMNyiNmD/fUFeQBgg30mWEYlYlSEbBE0S8asHUKPLekKVPcDm9GjAwJCsRzzo
         M8Ix/AGpz5mytlRDPeMOJi3b2vrad4R2XJYwWFhYtp6p63JrH9ZpY2vFir/C4rEBnjDX
         2Tku8QuV8g00kAxMWQBWxxb/xRt+Yh17YfZRDYWJd9F/Dgz0reRKgRlmTQccBmobPXX+
         +igg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b672a60si16910836d6.279.2024.09.27.00.32.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2024 00:32:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1su5Se-0002FF-0p; Fri, 27 Sep 2024 03:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1su5Sc-00028o-Cl; Fri, 27 Sep 2024 03:32:18 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1su5Sa-0004DY-Qo; Fri, 27 Sep 2024 03:32:18 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 27 Sep
 2024 15:31:46 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 27 Sep 2024 15:31:46 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v4 6/7] aspeed/soc: Support GPIO for AST2700 and correct irq
 130
Date: Fri, 27 Sep 2024 15:31:43 +0800
Message-ID: <20240927073144.2303522-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927073144.2303522-1-jamin_lin@aspeedtech.com>
References: <20240927073144.2303522-1-jamin_lin@aspeedtech.com>
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
X-TUID: nOUKu2JpC9Ex

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

