Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp297320ejc;
        Thu, 19 Jan 2023 04:37:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvUCHDXLEqK3VdMQpC6aySu2oCJofilpgzb1J2gn/TpaZAi+6JlDKL5LIjzX8+y79pn17xW
X-Received: by 2002:a67:c21c:0:b0:3d0:b4e7:c2d2 with SMTP id i28-20020a67c21c000000b003d0b4e7c2d2mr7205576vsj.18.1674131867095;
        Thu, 19 Jan 2023 04:37:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131867; cv=none;
        d=google.com; s=arc-20160816;
        b=xDsIc1cxbqv7ii6XM4QpuSRaYkYFHE+zKhpFN47UJ3r0jdya9Nb6/ezQCSxdJtzhwa
         FViTCcI4cqyzb9i21rRxEoM8XssTJkfiO9b60v6oUQ4koLGRBxf6sGUVKxpf2uPbxOc4
         WrVJfA91tuLr3AktC+K0RJlCYcFy1Tf6vz3MLws/htjc66qNlnT37uUfB8jXXGcRncu5
         clz2DvINv2iitMJsnxQDCfXhhp3uNxYmgMnp2NfMck9YCFxd4SYp41NEro83yeM4FmT/
         MDo5hdoZ8RHJXT2hY9XB8LqGby4U3pHnvRT+8q6aAD8+zNUNJOnFkmaStJosH70lzSZ9
         vanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=cI07N6o5NRzwn6YWUExPbNDBD3Q6LVtt/lB33ruqB24=;
        b=MBQoFys7kkVDAqvCQ/EmzegQVv3TCKL0/PjVhYTgZd/N5ClgTSWDGsdzMC7lVkl0wq
         zrrgOgQDbLoWrYo+M2i+bDS4fuoDpDjLXKB4qcqXyAklcAVcSArwwFOYFWXKEk8dmjwP
         mskdr+Cpv9L1yeRxcJYeb9FgdNUgWDXkcOe2aVFmCmU5Z4RKwhXTJSvm1k89DEE1iTPW
         cxoPkvSL9mMlIS3tDkFlQ/B5hordzPni4eLLf0J53vz4rOu9mJvouhz+Nvzn3YQTEUcS
         xPoZH75SmS7kpdB/R/MNLZGistkWpN2erUMv1pZmRHlXmHKWA/USfilWRpW599iXyOcL
         Uzrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020a05620a454e00b00704cf5d76f7si25264172qkp.511.2023.01.19.04.37.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 04:37:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIU9M-0007ZZ-7L; Thu, 19 Jan 2023 07:36:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU9E-0007Ir-1n; Thu, 19 Jan 2023 07:36:05 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU9B-0007eu-L9; Thu, 19 Jan 2023 07:36:03 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMYX4n1sz4xZj;
 Thu, 19 Jan 2023 23:36:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMYV4HC5z4xyZ;
 Thu, 19 Jan 2023 23:35:58 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 21/25] hw/arm/aspeed_ast10x0: Map I3C peripheral
Date: Thu, 19 Jan 2023 13:34:45 +0100
Message-Id: <20230119123449.531826-22-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XzJKxAKcDQr7

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Since I don't have access to the datasheet, the relevant
values were found in:
https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi

Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast10x0.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index b970a5ea58..1a06269cb1 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -53,6 +53,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_WDT]       = 0x7E785000,
     [ASPEED_DEV_LPC]       = 0x7E789000,
     [ASPEED_DEV_PECI]      = 0x7E78B000,
+    [ASPEED_DEV_I3C]       = 0x7E7A0000,
     [ASPEED_DEV_I2C]       = 0x7E7B0000,
 };
 
@@ -88,6 +89,7 @@ static const int aspeed_soc_ast1030_irqmap[] = {
     [ASPEED_DEV_ADC]       = 46,
     [ASPEED_DEV_SPI1]      = 65,
     [ASPEED_DEV_SPI2]      = 66,
+    [ASPEED_DEV_I3C]       = 102, /* 102 -> 105 */
     [ASPEED_DEV_I2C]       = 110, /* 110 ~ 123 */
     [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
     [ASPEED_DEV_UDC]       = 9,
@@ -129,6 +131,8 @@ static void aspeed_soc_ast1030_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
     object_initialize_child(obj, "i2c", &s->i2c, typename);
 
+    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
+
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
 
@@ -239,6 +243,18 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
     }
 
+    /* I3C */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
+    for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
+        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
+                                        sc->irqmap[ASPEED_DEV_I3C] + i);
+        /* The AST1030 I3C controller has one IRQ per bus. */
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
+    }
+
     /* PECI */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->peci), errp)) {
         return;
-- 
2.39.0

