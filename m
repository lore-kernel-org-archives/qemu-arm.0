Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp319001lfm;
        Tue, 16 Jun 2020 22:56:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZye4vpvGNxu99OKnDsl5e6F8WP6lT/oZBE/sluYOZTup3v9aG8+9oyF5ISLwLTN2L6HNS
X-Received: by 2002:a25:d3d0:: with SMTP id e199mr9891109ybf.27.1592373418227;
        Tue, 16 Jun 2020 22:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592373418; cv=none;
        d=google.com; s=arc-20160816;
        b=0pK/Xle9citjOIIDim+LuG1P3b36q7u8JRb5BBXnbpmoWKRrH85n6l9XHudLG5HxOg
         P4hvS7WHMaQ97lwTTr3eqHgLoC92xZDtWe3TU/IWWreFOQmubSsfu7JtEXYZIwzLgzW6
         2HJIMc4G15xtWXdkf2BopYO3b4kgMo9BhecAZWHqeXW2SZGPBbhn8+VxAElbeT3k/KNI
         WFc+3ZiwRDT2MKuC//4sMcygzBW65UGf4J6VILEsWxczIamZRzGsP4Sssyc83AOwo/tz
         5o7ZT4C8TU0KysgY2MyhUNktxaY3gx9g3c2Y5P0a6UVPT77A6K15e12jmgSXdBs3R2gM
         ytQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jSEeTcKy/ADpk72o56Tu0O5sgQThR0gpRTB3AEGbkUA=;
        b=vlhb0x8VB2PWDYu1d+pD7IOD3yi5+n7gq3C0SM2uv4jAJrEc/tg+wG9esrBSUpfEdz
         hSltkoqysB7NvdKxJpvoGWjouDym1nWzxUi88G0+CbuXmEPoIbH3sylsJ2G9CbAjeNPP
         eYUCDEhA+xSeT+5Yl5aiASO8mbBsDaBAW/wFfcM0GYA2pNhx/RWmC25y1HVddJ0jz1vr
         Xef5uNSfPv3sKNDBj8arwL6iY3DxdzfbDX/2oWwb9sp/dPS4mHglck8eEPGIAPk6woZr
         TOXMa1RkQe60Bw2RlLrHpgsCGcvDor8t6avssIWOCF0h7zsukpVjyUMXlvO6xTYrSEwk
         esTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aOJMd5EI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l188si19939092ybc.385.2020.06.16.22.56.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 22:56:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aOJMd5EI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlR4D-00035x-Hv
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 01:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlQzn-0002rA-K3; Wed, 17 Jun 2020 01:52:23 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlQzl-0004TQ-UO; Wed, 17 Jun 2020 01:52:23 -0400
Received: by mail-wr1-x441.google.com with SMTP id x14so940294wrp.2;
 Tue, 16 Jun 2020 22:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jSEeTcKy/ADpk72o56Tu0O5sgQThR0gpRTB3AEGbkUA=;
 b=aOJMd5EInz701+l4IHZsHwBP1JJv4oDGrS5kOw3TBvpkWGXYl8TNIXffjvRbHstpXT
 9v0Pj2fpZLQ5dKWvFvxlm+bxPkK/cGPpUiddcZ6J/UtB3GQ/NnBTpjSgKh5Crh665NPE
 RZ2b5Nfe0oH+M0H1vhsQdMICQKVqjbQ/1KrMKuMLDelhduv79QA50ec2vM2ZnkQXON8M
 dIhqVo77IskBLm3xbzX6PcYijFvM94EnHQB9NY+G6c1HsxjcJMi2TAedV/mByKL0BzuN
 aCC480Nbjdr1MUhu4/A73OkPNv0FVpKV+Dwqa/lHumn59o1llHIuGtQJKfhKFbE2fNcG
 F1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jSEeTcKy/ADpk72o56Tu0O5sgQThR0gpRTB3AEGbkUA=;
 b=kd//IproVgO03+KySWV3EomVUhD0oPjbvuUWtdmjh7OqwkHMYxsu0v0m4ZQgNdg50l
 TSzTKotBA2nvSEqpfGeQDjtBBqRGbKRP8qfP7+I7FG4sGcb8CKrrh8MmA/ljMpSXRN2X
 QpSZ8ropF1AdT3eV2j6kE5BE5GyCRWBWAG/z0QalTRlBEgMgHPbHmLAPJjmxwbt08YNz
 c/dJBrSqH9lvGtVExE10MOSBMhiznXTWI9bgm6Xz8USBuS8VL23IkhmFfdfh6RHb2jNI
 xVsJk7iSeGbvRWHAevzVMnR0VavThY2OV3L5pPITK7QqR+joq+njYJ8brcbC5UF04CQT
 Tgew==
X-Gm-Message-State: AOAM533BRAwrVeZwsm9ArenK09t7EQrlCCRJfhcWC/LAF/Xur+Pdvc1d
 WvzqqsJ+VlATobNQyIsOtsPZDUTy
X-Received: by 2002:a05:6000:1289:: with SMTP id
 f9mr6727409wrx.5.1592373140099; 
 Tue, 16 Jun 2020 22:52:20 -0700 (PDT)
Received: from localhost.localdomain (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id d28sm3000809wrc.50.2020.06.16.22.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 22:52:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/14] hw/arm/mps2: Add SPI devices
Date: Wed, 17 Jun 2020 07:52:02 +0200
Message-Id: <20200617055205.3576-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200617055205.3576-1-f4bug@amsat.org>
References: <20200617055205.3576-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Esteban Bosse <estebanbosse@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5KANaKfiHxo5

From 'Application Note AN385', chapter 3.9, SPI:

  The SMM implements five PL022 SPI modules.

Two pairs of modules share the same OR-gated IRQ.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index e106123225..daa26f68d7 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -39,6 +39,7 @@
 #include "hw/timer/cmsdk-apb-dualtimer.h"
 #include "hw/misc/mps2-scc.h"
 #include "hw/misc/mps2-fpgaio.h"
+#include "hw/ssi/pl022.h"
 #include "hw/net/lan9118.h"
 #include "net/net.h"
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
@@ -341,6 +342,29 @@ static void mps2_common_init(MachineState *machine)
     qdev_prop_set_uint32(DEVICE(&mms->fpgaio), "prescale-clk", 25000000);
     sysbus_realize(SYS_BUS_DEVICE(&mms->fpgaio), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(&mms->fpgaio), 0, 0x40028000);
+    sysbus_create_simple(TYPE_PL022, 0x40025000,        /* External ADC */
+                         qdev_get_gpio_in(armv7m, 22));
+    for (i = 0; i < 2; i++) {
+        static const int spi_irqno[] = {11, 24};
+        static const hwaddr spibase[] = {0x40020000,    /* APB */
+                                         0x40021000,    /* LCD */
+                                         0x40026000,    /* Shield0 */
+                                         0x40027000};   /* Shield1 */
+        DeviceState *orgate_dev;
+        Object *orgate;
+        int j;
+
+        orgate = object_new(TYPE_OR_IRQ);
+        object_property_set_int(orgate, 2, "num-lines", &error_fatal);
+        orgate_dev = DEVICE(orgate);
+        qdev_realize(orgate_dev, NULL, &error_fatal);
+        qdev_connect_gpio_out(orgate_dev, 0,
+                              qdev_get_gpio_in(armv7m, spi_irqno[i]));
+        for (j = 0; j < 2; j++) {
+            sysbus_create_simple(TYPE_PL022, spibase[2 * i + j],
+                                 qdev_get_gpio_in(orgate_dev, j));
+        }
+    }
 
     /* In hardware this is a LAN9220; the LAN9118 is software compatible
      * except that it doesn't support the checksum-offload feature.
-- 
2.21.3

