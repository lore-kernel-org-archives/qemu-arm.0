Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1029443lfh;
        Wed, 25 May 2022 09:16:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDdWiI0Re0hNcpY8nBySC+pPQKKvy2B6CzXfdExcX77QiESPXjtK+MXelQlsnuVEaG2DKT
X-Received: by 2002:a05:620a:40c2:b0:6a3:7a56:b282 with SMTP id g2-20020a05620a40c200b006a37a56b282mr11576732qko.408.1653495399827;
        Wed, 25 May 2022 09:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653495399; cv=none;
        d=google.com; s=arc-20160816;
        b=cgAGVPVO0csAM9mvfntoFZtbDO0+u5h/0bJ9J0sQcmbxL5yU/jAXj7npEVwLlnRY2v
         wAZrF1Y+WS8OA4Afrm/CrNjiwvYe5ESw/frgy67EmflbrsWukJFs9F3O+OHozTshSay3
         LDGi0M0lDRYUzD0BfrP61MDr2hM/RstoazEPW1gye03bzVMg/6Fa4j7ii7QImNAIndD2
         HPPH9oRN/1VsU8rnGouMh6xvZ2l64ka8BykXx7IYl4eBAjekTL66UpKLzA1jHsQ1CgvM
         3JQI6q5ePoMrPuKKJobDdB6JjyjCzWSCBNbQOnsszF0irkOC8NrjQOwEvK4xHmAK2CEC
         /Cwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=3/iguauI6NQE575/fb1n3zkmmqYZusshAO7sI7fpxh4=;
        b=kTuH4kPpMjCrDWCvotExC3fU173KsZJ6Fx8fPzzIFs30BWyKPnxkZjvc24jEzR11vY
         vyFcke1I90P59YAB22U7Un/UgMgVygkO7K4gTfDvQp7SsKGeRM2MEa+XVXfPNjtbu3lz
         AgNJFz7gl7wlrNBbXYTKf/poZmIJZaB2/zUJZZFAkzbj1t7YQ26zTgYvUMRRf3JNAIrH
         OtLx72xMxzcWwKN0j0bnPnVY5aTgfB2zdvewkz8L0KPrmY3LJ1cwLgcQGSkdd5fKgU8I
         tuux4iwDlCB/AN0rmCZwMRNd6+Mly0qrNSAFkBoCNlaFGfWOIKVYj1t0CxX0KENcNdUr
         7x/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm22-20020a05620a199600b0069fe12b4b52si1848581qkb.61.2022.05.25.09.16.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 09:16:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nttgd-00085P-9T
	for alex.bennee@linaro.org; Wed, 25 May 2022 12:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSb-00076e-9O; Wed, 25 May 2022 12:02:10 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:48649
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSX-00049O-Oi; Wed, 25 May 2022 12:02:08 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRc5ZL6z4ySp;
 Thu, 26 May 2022 02:02:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRZ6xMjz4xXj;
 Thu, 26 May 2022 02:02:02 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 09/15] hw: aspeed: Introduce common UART init function
Date: Wed, 25 May 2022 18:01:30 +0200
Message-Id: <20220525160136.556277-10-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525160136.556277-1-clg@kaod.org>
References: <20220525160136.556277-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Lufh=WB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rEsBjSnozITT

From: Peter Delevoryas <pdel@fb.com>

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220516062328.298336-5-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  1 +
 hw/arm/aspeed_ast10x0.c     |  7 ++-----
 hw/arm/aspeed_ast2600.c     |  7 ++-----
 hw/arm/aspeed_soc.c         | 16 ++++++++++++----
 4 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 669bc4985571..02a5a9ffcbd3 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -164,5 +164,6 @@ enum {
 };
 
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
+void aspeed_soc_uart_init(AspeedSoCState *s);
 
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index faafb800f386..938615d55f4a 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -15,7 +15,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/qdev-clock.h"
 #include "hw/misc/unimp.h"
-#include "hw/char/serial.h"
 #include "hw/arm/aspeed_soc.h"
 
 #define ASPEED_SOC_IOMEM_SIZE 0x00200000
@@ -215,10 +214,8 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->armv7m),
                                 sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
 
-    /* UART - attach an 8250 to the IO space as our UART */
-    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
-                   aspeed_soc_get_irq(s, s->uart_default),
-                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    /* UART */
+    aspeed_soc_uart_init(s);
 
     /* Timer */
     object_property_set_link(OBJECT(&s->timerctrl), "scu", OBJECT(&s->scu),
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index a9523074a089..b0a4199b6960 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -11,7 +11,6 @@
 #include "qapi/error.h"
 #include "hw/misc/unimp.h"
 #include "hw/arm/aspeed_soc.h"
-#include "hw/char/serial.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "hw/i2c/aspeed_i2c.h"
@@ -372,10 +371,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
 
-    /* UART - attach an 8250 to the IO space as our UART */
-    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
-                   aspeed_soc_get_irq(s, s->uart_default), 38400,
-                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    /* UART */
+    aspeed_soc_uart_init(s);
 
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 7008cd1af716..912798a9c92f 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -303,10 +303,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
 
-    /* UART - attach an 8250 to the IO space as our UART */
-    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
-                   aspeed_soc_get_irq(s, s->uart_default), 38400,
-                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    /* UART */
+    aspeed_soc_uart_init(s);
 
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
@@ -544,3 +542,13 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
 {
     return ASPEED_SOC_GET_CLASS(s)->get_irq(s, dev);
 }
+
+void aspeed_soc_uart_init(AspeedSoCState *s)
+{
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+
+    /* Attach an 8250 to the IO space as our UART */
+    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
+                   aspeed_soc_get_irq(s, s->uart_default), 38400,
+                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
+}
-- 
2.35.3

