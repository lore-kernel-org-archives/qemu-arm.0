Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp296740ejc;
        Thu, 19 Jan 2023 04:36:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXud0WxeKGTdlBP4EEsvnhQnGZfJ8CbNF86T4tqJ1/DZPvF1Dns7/iEXkszZawccGx0XPxWQ
X-Received: by 2002:a05:622a:4315:b0:3a9:8b48:f8f with SMTP id el21-20020a05622a431500b003a98b480f8fmr11644136qtb.67.1674131812887;
        Thu, 19 Jan 2023 04:36:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131812; cv=none;
        d=google.com; s=arc-20160816;
        b=OIj4ls9SjxWpQweP6qus0PDJIZ+TrpAip+ebumZ9y7kfqn9j23gPuWXx9EppyjAyxY
         JGccYV/CUhDE3rVOO0xANyxgsQE5YZmz7ZS5YrtbVoSY5a5agXD7ZUV+ILVpyu3cZv/w
         mIWuRYy5ZSY07TBwCH6EynqEP0XKQ0ps2+7l7j+X7EneexeCEaSfRmowjBEGSROG1Tgr
         6ZBPCz1DhfN/5yjpOD5OKnEKf4Nq0StEePJWiTjzwYq23kQaJxwEVRzyCTWj7/ud2K4F
         m8Qf3BBz+lzAVLt69GH+SGqwhZH61d4bKlmiFPufaWkC6Ttc6GLiYGTXkW3zIzvegRap
         lLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=wI2DRWs/U/PsC7+cVZx9qQK+MpxYP15ChNKRzZ4Jvgw=;
        b=07B5H/DvRLv82w/kODpwmaPtpDr6f7PLiIJJSOa4MLVp4b/MBs74L/Y1twbYxbwc3K
         gssMNf0HK/k+ZuGHb/izrD1NYRDHyy9y7w8C3IWcC7Hx6Uf71GtBh/u37H/lxAZ33GrK
         XPgrVXOGpxUdeNVODE3BLaCUeYlqREAVz0LIkJk3n/kcC/dp0fWKeHyirYH1X39VZT1I
         p0fCEhLXt043zjygPsoX/vIxF0eHML+AAdYw/rxscOPkAluwWSBW0tNw3oCzZKrF5m8j
         lmmelMf8IakCSd6P8Q4e6KZzNZTOiuUlbEELs6MNNHHHfqkx037nTwYPveQLw/HncoAq
         pMDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs21-20020ac86f15000000b003ab9bc68ccesi23542702qtb.695.2023.01.19.04.36.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 04:36:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIU9N-0007aa-BN; Thu, 19 Jan 2023 07:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU92-00079m-Q1; Thu, 19 Jan 2023 07:35:56 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU90-0007ee-Lt; Thu, 19 Jan 2023 07:35:52 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMYH64rbz4xyf;
 Thu, 19 Jan 2023 23:35:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMYF5KC8z4xHV;
 Thu, 19 Jan 2023 23:35:45 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 16/25] hw/watchdog/wdt_aspeed: Rename MMIO region size as
 'iosize'
Date: Thu, 19 Jan 2023 13:34:40 +0100
Message-Id: <20230119123449.531826-17-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: YSiwf2wkjWWR

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
index 37f43b4165..75add765c6 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -467,14 +467,14 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
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
2.39.0

