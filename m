Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC8CD3B7EA
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Dec 2025 00:03:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vSlB6-0007Jk-9I; Mon, 08 Dec 2025 19:02:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <372Y3aQYKCOokgNUZlSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--yubinz.bounces.google.com>)
 id 1vSlAx-0007BP-8S
 for qemu-arm@nongnu.org; Mon, 08 Dec 2025 19:01:56 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <372Y3aQYKCOokgNUZlSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--yubinz.bounces.google.com>)
 id 1vSlAv-0007Sg-2d
 for qemu-arm@nongnu.org; Mon, 08 Dec 2025 19:01:54 -0500
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-b9b9e8b0812so7695501a12.0
 for <qemu-arm@nongnu.org>; Mon, 08 Dec 2025 16:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1765238511; x=1765843311; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=WoZGW+0RXYZOQ7WbT8EW77f8UIHwQ46N9HiEFUyuaKg=;
 b=okv7zSq7dYF/uLxN7Gimzjfda3xL/WSSvdF6bJuCeLA8P9Jpd5t5H85SviE6kSgRV3
 Mp7Aoca7LaGsgHvmaoG9zIPe6qk168CZMGwgRX0kn73fQ4wVuLje+VAd7QmBhUeYNzHq
 C/uGM3qCoHAFk2tCrwYh9EO4RORMXq6ejVWWymaXL72ehv/vJWJ+TM+EU0AGF1Zfacg+
 uQb74N3vaaI6pQ8geciwvXnxVQO1V9oxjxbsjVmKkWlokSHIX+CMhuqtm8Ywtzxz/w/I
 mioYBDKv4NuBaBrwlzN6GThFn0gGkvf2sRxIkXewDsLeuPCrO3ihCdCcOPRuK52R/Hzh
 MQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765238511; x=1765843311;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WoZGW+0RXYZOQ7WbT8EW77f8UIHwQ46N9HiEFUyuaKg=;
 b=XoWfeI3d8w7Uqvdz6Qn2rLPmAPmWRwyeDYCjqKxlJDoWhb6WcaBtPOa3gefqD9WpSU
 2r5NxWXhis7iS1IerHZZK+dfueG+r4Z3qJAs+QVRj2IQUlTBMHFTcat3IWAkjTUgPdoh
 6EHBYHsUAiNYp4lELYa6eb7eJYVDOEvRTPFM1tSf5M4ShhzhkwXGiW0ES3qEUE+ZmLZ4
 KpkxeN5hfVlYsP31KZlCN24/ihGkDuQEMbS5Ui8kQpvA7XeSRX9jGOMrpjVnlHS7KLgb
 fSaEBf/9cPfa2qnkRIIOD+viN63l7tFfc4zkjRBtzHUmO8ATNooEd0VaiWs81Oa89NIz
 mU/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ3f8nfyHVSBJ55lCL+/qT+IfHSuqmAA6c2+BGOWUqftOW2La0QyrGoHZ5Q3Xr07UASC8oyCL7PA==@nongnu.org
X-Gm-Message-State: AOJu0Yz3xatz1eWqQWLy+262ZaASj7R2Qts/VmK3GZBY1A87cRpvA0Oc
 q1MTSifkLlja7aUjlj+VAbxdWFwo2IkE1vepA6+xB7I0oC9Fka3tGoNJ5Nd912NFQuKFkHlmg3h
 ImpHy9A==
X-Google-Smtp-Source: AGHT+IHp+L9AjjhHFhDta3VCFyRgIV5tizIbbgvDwbdEBPhqpRxvFPF1NVvFY3puDtyagemJ9FCKZnocMLo=
X-Received: from dycng11.prod.google.com ([2002:a05:7300:ce0b:b0:2ab:8ef5:df8])
 (user=yubinz job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:db12:b0:2a4:61d1:f433
 with SMTP id 5a478bee46e88-2abc71544e7mr3776456eec.16.1765238511220; Mon, 08
 Dec 2025 16:01:51 -0800 (PST)
Date: Tue, 09 Dec 2025 00:01:36 +0000
In-Reply-To: <20251209-aspeed-sgpio-v2-0-976e5f5790c2@google.com>
Mime-Version: 1.0
References: <20251209-aspeed-sgpio-v2-0-976e5f5790c2@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20251209-aspeed-sgpio-v2-4-976e5f5790c2@google.com>
Subject: [PATCH v2 4/6] hw/arm/aspeed_soc: Update Aspeed SoC to support two
 SGPIO controllers
From: Yubin Zou <yubinz@google.com>
To: qemu-devel@nongnu.org
Cc: "=?utf-8?q?C=C3=A9dric_Le_Goater?=" <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>, 
 Nabih Estefan <nabihestefan@google.com>, qemu-arm@nongnu.org, 
 Yubin Zou <yubinz@google.com>
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=372Y3aQYKCOokgNUZlSaaSXQ.OaYcQYg-MdYZaZSZg.adS@flex--yubinz.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This commit updates the Aspeed SoC model to support two SGPIO
controllers, reflecting the hardware capabilities of the AST2700

The memory map and interrupt map are updated to include entries for
two SGPIO controllers (SGPIOM0 and SGPIOM1). This change is a
prerequisite for the full implementation of the SGPIO device model.

Signed-off-by: Yubin Zou <yubinz@google.com>
---
 hw/arm/aspeed_ast10x0.c     |  6 +++---
 hw/arm/aspeed_ast27x0.c     | 10 ++++++++++
 include/hw/arm/aspeed_soc.h |  8 ++++++--
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 7f49c13391be0b923e317409a0fccfa741f5e658..c141cc080422579ca6b6965369d84dfbe416247b 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -36,7 +36,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_ESPI]      = 0x7E6EE000,
     [ASPEED_DEV_SBC]       = 0x7E6F2000,
     [ASPEED_DEV_GPIO]      = 0x7E780000,
-    [ASPEED_DEV_SGPIOM]    = 0x7E780500,
+    [ASPEED_DEV_SGPIOM0]   = 0x7E780500,
     [ASPEED_DEV_TIMER1]    = 0x7E782000,
     [ASPEED_DEV_UART1]     = 0x7E783000,
     [ASPEED_DEV_UART2]     = 0x7E78D000,
@@ -94,7 +94,7 @@ static const int aspeed_soc_ast1030_irqmap[] = {
     [ASPEED_DEV_I2C]       = 110, /* 110 ~ 123 */
     [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
     [ASPEED_DEV_UDC]       = 9,
-    [ASPEED_DEV_SGPIOM]    = 51,
+    [ASPEED_DEV_SGPIOM0]   = 51,
     [ASPEED_DEV_JTAG0]     = 27,
     [ASPEED_DEV_JTAG1]     = 53,
 };
@@ -427,7 +427,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
                                   sc->memmap[ASPEED_DEV_UDC], 0x1000);
     aspeed_mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->sgpiom),
                                   "aspeed.sgpiom",
-                                  sc->memmap[ASPEED_DEV_SGPIOM], 0x100);
+                                  sc->memmap[ASPEED_DEV_SGPIOM0], 0x100);
 
     aspeed_mmio_map_unimplemented(s->memory, SYS_BUS_DEVICE(&s->jtag[0]),
                                   "aspeed.jtag",
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index c484bcd4e22fb49faf9c16992ae2cdfd6cd82da4..e5f04bd16e80696e41005d9062a6df6d060b8088 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -69,6 +69,8 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_ADC]       =  0x14C00000,
     [ASPEED_DEV_SCUIO]     =  0x14C02000,
     [ASPEED_DEV_GPIO]      =  0x14C0B000,
+    [ASPEED_DEV_SGPIOM0]   =  0x14C0C000,
+    [ASPEED_DEV_SGPIOM1]   =  0x14C0D000,
     [ASPEED_DEV_I2C]       =  0x14C0F000,
     [ASPEED_DEV_INTCIO]    =  0x14C18000,
     [ASPEED_DEV_PCIE_PHY2] =  0x14C1C000,
@@ -122,6 +124,8 @@ static const int aspeed_soc_ast2700a0_irqmap[] = {
     [ASPEED_DEV_KCS]       = 128,
     [ASPEED_DEV_ADC]       = 130,
     [ASPEED_DEV_GPIO]      = 130,
+    [ASPEED_DEV_SGPIOM0]   = 130,
+    [ASPEED_DEV_SGPIOM1]   = 130,
     [ASPEED_DEV_I2C]       = 130,
     [ASPEED_DEV_FMC]       = 131,
     [ASPEED_DEV_WDT]       = 131,
@@ -173,6 +177,8 @@ static const int aspeed_soc_ast2700a1_irqmap[] = {
     [ASPEED_DEV_I2C]       = 194,
     [ASPEED_DEV_ADC]       = 194,
     [ASPEED_DEV_GPIO]      = 194,
+    [ASPEED_DEV_SGPIOM0]   = 194,
+    [ASPEED_DEV_SGPIOM1]   = 194,
     [ASPEED_DEV_FMC]       = 195,
     [ASPEED_DEV_WDT]       = 195,
     [ASPEED_DEV_PWM]       = 195,
@@ -214,6 +220,8 @@ static const int ast2700_gic130_gic194_intcmap[] = {
     [ASPEED_DEV_I2C]        = 0,
     [ASPEED_DEV_ADC]        = 16,
     [ASPEED_DEV_GPIO]       = 18,
+    [ASPEED_DEV_SGPIOM0]    = 21,
+    [ASPEED_DEV_SGPIOM1]    = 24,
 };
 
 /* GICINT 131 */
@@ -1061,6 +1069,7 @@ static void aspeed_soc_ast2700a0_class_init(ObjectClass *oc, const void *data)
     sc->sram_size    = 0x20000;
     sc->pcie_num     = 0;
     sc->spis_num     = 3;
+    sc->sgpio_num    = 2;
     sc->ehcis_num    = 2;
     sc->wdts_num     = 8;
     sc->macs_num     = 1;
@@ -1089,6 +1098,7 @@ static void aspeed_soc_ast2700a1_class_init(ObjectClass *oc, const void *data)
     sc->sram_size    = 0x20000;
     sc->pcie_num     = 3;
     sc->spis_num     = 3;
+    sc->sgpio_num    = 2;
     sc->ehcis_num    = 4;
     sc->wdts_num     = 8;
     sc->macs_num     = 3;
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 4b8e599f1a53bfb2e4d3196d5495cd316f799354..18ff961a38508c5df83b46e187f732d736443f20 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -32,6 +32,7 @@
 #include "hw/net/ftgmac100.h"
 #include "target/arm/cpu.h"
 #include "hw/gpio/aspeed_gpio.h"
+#include "hw/gpio/aspeed_sgpio.h"
 #include "hw/sd/aspeed_sdhci.h"
 #include "hw/usb/hcd-ehci.h"
 #include "qom/object.h"
@@ -46,6 +47,7 @@
 #define VBOOTROM_FILE_NAME  "ast27x0_bootrom.bin"
 
 #define ASPEED_SPIS_NUM  3
+#define ASPEED_SGPIO_NUM 2
 #define ASPEED_EHCIS_NUM 4
 #define ASPEED_WDTS_NUM  8
 #define ASPEED_CPUS_NUM  4
@@ -89,6 +91,7 @@ struct AspeedSoCState {
     AspeedMiiState mii[ASPEED_MACS_NUM];
     AspeedGPIOState gpio;
     AspeedGPIOState gpio_1_8v;
+    AspeedSGPIOState sgpiom[ASPEED_SGPIO_NUM];
     AspeedSDHCIState sdhci;
     AspeedSDHCIState emmc;
     AspeedLPCState lpc;
@@ -106,7 +109,6 @@ struct AspeedSoCState {
     UnimplementedDeviceState pwm;
     UnimplementedDeviceState espi;
     UnimplementedDeviceState udc;
-    UnimplementedDeviceState sgpiom;
     UnimplementedDeviceState ltpi;
     UnimplementedDeviceState jtag[ASPEED_JTAG_NUM];
     AspeedAPB2OPBState fsi[2];
@@ -166,6 +168,7 @@ struct AspeedSoCClass {
     uint64_t secsram_size;
     int pcie_num;
     int spis_num;
+    int sgpio_num;
     int ehcis_num;
     int wdts_num;
     int macs_num;
@@ -221,6 +224,8 @@ enum {
     ASPEED_DEV_SDHCI,
     ASPEED_DEV_GPIO,
     ASPEED_DEV_GPIO_1_8V,
+    ASPEED_DEV_SGPIOM0,
+    ASPEED_DEV_SGPIOM1,
     ASPEED_DEV_RTC,
     ASPEED_DEV_TIMER1,
     ASPEED_DEV_TIMER2,
@@ -263,7 +268,6 @@ enum {
     ASPEED_DEV_I3C,
     ASPEED_DEV_ESPI,
     ASPEED_DEV_UDC,
-    ASPEED_DEV_SGPIOM,
     ASPEED_DEV_JTAG0,
     ASPEED_DEV_JTAG1,
     ASPEED_DEV_FSI1,

-- 
2.52.0.223.gf5cc29aaa4-goog


