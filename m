Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5183284ejb;
        Tue, 7 Feb 2023 02:11:01 -0800 (PST)
X-Google-Smtp-Source: AK7set++tPClWAND5aw+mL0wbi+ZKGaliFIPWW6fxqcK4HRVFRq6k8h+MrLTtcnLYNzNMzAfhNFb
X-Received: by 2002:ac8:574a:0:b0:3b8:8756:6de0 with SMTP id 10-20020ac8574a000000b003b887566de0mr4312741qtx.48.1675764661244;
        Tue, 07 Feb 2023 02:11:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675764661; cv=none;
        d=google.com; s=arc-20160816;
        b=XBRBnVF6qmW8129DbC/1NKgcWVoj4k+8qKHWaQnwnZK85LwyFvkhV4aBiEB3folsuw
         3Sx86bL5zReK+CtwGs0y94WGF1FTNW4YBQGC7yt/LCvr92WoVGif8OxhPZabJW10Oegl
         kBr1JpN6BiU8GXzMGYb1Fkuk7R7F4AEI/h5rusAUFY3JeWthE3kNiDeUiLr6c7PB/LOl
         cQ+XYVEIDOCkIX8/rWsWZldor7Yy0/QwpwwpR3aYbGHeZMFiOrr5F5ZyB9qzd3Lzd57s
         3bAu4SlYixJZv4d7qSK96XzSnDdfT4UZPr8v1ub3lBOENSNY7eNz3OYnTKo137maDc1O
         P2Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=sstWMDZvkl87tPJ7V3mfh0Dne9UuKQ23W5BcFB4Hr+A=;
        b=Kt7OizqffNg2YW/gRP2NusF+RbvvYAmYl7PeZH6XBdHRBTxcX5LSEMT8e9f5JTG/e5
         GqJ8kICDmZMJOveAQF9FoV2oTiFdV2v9qQwaAajkJBfLhHeeyshxW7bAsTtDpA6yvNUf
         rchpPWdIvccetjsu+Q0JVLotbG/sy8qrsfErfoBLUwFDIUeG6W2BozWmflp2k3MZ2HsQ
         38zByhra32SAOZER8SuvzHraXocHAFT+Caj7Kj8Hv6D4qHKfP/keCEhb/3cdTCzHkuIh
         EasEIqnp1Um9QswQ3c9Y+iM7NUVdLJyMzFfhRpWfPOPzNBkQZWGFpjCPczo8teE3mZ+f
         V7sw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13-20020a05622a024d00b003b62eb6b10csi10389564qtx.333.2023.02.07.02.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 02:11:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPKuF-0000oK-EU; Tue, 07 Feb 2023 05:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtw-0000W5-Fs; Tue, 07 Feb 2023 05:08:37 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtu-0002T3-Fy; Tue, 07 Feb 2023 05:08:36 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zNd3hjMz4xwl;
 Tue,  7 Feb 2023 21:08:33 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zNb3Zzfz4xyf;
 Tue,  7 Feb 2023 21:08:31 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 15/25] hw/watchdog/wdt_aspeed: Rename MMIO region size as
 'iosize'
Date: Tue,  7 Feb 2023 11:07:34 +0100
Message-Id: <20230207100744.698694-16-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GjKDAvOQkiRC

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Avoid confusing two different things:
- the WDT I/O region size ('iosize')
- at which offset the SoC map the WDT ('offset')
While it is often the same, we can map smaller region sizes
at larger offsets.

Here we are interested in the I/O region size, so rename as
'iosize'.

Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
[ clg: Introduced temporary wdt_offset variable ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/watchdog/wdt_aspeed.h | 2 +-
 hw/arm/aspeed_ast10x0.c          | 4 ++--
 hw/arm/aspeed_ast2600.c          | 4 ++--
 hw/arm/aspeed_soc.c              | 4 ++--
 hw/watchdog/wdt_aspeed.c         | 8 ++++----
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index dfa5dfa424..db91ee6b51 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -40,7 +40,7 @@ struct AspeedWDTState {
 struct AspeedWDTClass {
     SysBusDeviceClass parent_class;
 
-    uint32_t offset;
+    uint32_t iosize;
     uint32_t ext_pulse_width_mask;
     uint32_t reset_ctrl_reg;
     void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 4d0b9b115f..b483735dc2 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -318,14 +318,14 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     /* Watch dog */
     for (i = 0; i < sc->wdts_num; i++) {
         AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
+        hwaddr wdt_offset = sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize;
 
         object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
                                  &error_abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
             return;
         }
-        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0, wdt_offset);
     }
 
     /* GPIO */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index cd75465c2b..bb2769df04 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -465,14 +465,14 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     /* Watch dog */
     for (i = 0; i < sc->wdts_num; i++) {
         AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
+        hwaddr wdt_offset = sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize;
 
         object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
                                  &error_abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
             return;
         }
-        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0, wdt_offset);
     }
 
     /* RAM */
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index b05b9dd416..e884d6badc 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -386,14 +386,14 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     /* Watch dog */
     for (i = 0; i < sc->wdts_num; i++) {
         AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
+        hwaddr wdt_offset = sc->memmap[ASPEED_DEV_WDT] + i * awc->iosize;
 
         object_property_set_link(OBJECT(&s->wdt[i]), "scu", OBJECT(&s->scu),
                                  &error_abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->wdt[i]), errp)) {
             return;
         }
-        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                        sc->memmap[ASPEED_DEV_WDT] + i * awc->offset);
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->wdt[i]), 0, wdt_offset);
     }
 
     /* RAM  */
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index d753693a2e..958725a1b5 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -309,7 +309,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
     AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
 
     dc->desc = "ASPEED 2400 Watchdog Controller";
-    awc->offset = 0x20;
+    awc->iosize = 0x20;
     awc->ext_pulse_width_mask = 0xff;
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->wdt_reload = aspeed_wdt_reload;
@@ -346,7 +346,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
     AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
 
     dc->desc = "ASPEED 2500 Watchdog Controller";
-    awc->offset = 0x20;
+    awc->iosize = 0x20;
     awc->ext_pulse_width_mask = 0xfffff;
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
@@ -369,7 +369,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
     AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
 
     dc->desc = "ASPEED 2600 Watchdog Controller";
-    awc->offset = 0x40;
+    awc->iosize = 0x40;
     awc->ext_pulse_width_mask = 0xfffff; /* TODO */
     awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
@@ -392,7 +392,7 @@ static void aspeed_1030_wdt_class_init(ObjectClass *klass, void *data)
     AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
 
     dc->desc = "ASPEED 1030 Watchdog Controller";
-    awc->offset = 0x80;
+    awc->iosize = 0x80;
     awc->ext_pulse_width_mask = 0xfffff; /* TODO */
     awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
-- 
2.39.1

