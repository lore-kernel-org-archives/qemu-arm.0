Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp736369lfg;
        Thu, 11 Mar 2021 15:50:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxm1/axWWtyqUVQI7wE7FnJaHHhkDl2TMjoWP65W+A4XfgjCpfCTob7couVigNMheVar7mZ
X-Received: by 2002:a9d:354:: with SMTP id 78mr1145229otv.123.1615506647982;
        Thu, 11 Mar 2021 15:50:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615506647; cv=none;
        d=google.com; s=arc-20160816;
        b=yIxC5mfEeuUB2bdBXTUjzPuyxM6Csr+UuTFIxzHY/5wqQnk5D2C+1GTvkkmxyKAaqi
         FQFVm/riUUdrwEun4PmI0gS3gZLSvKx/YiZGQwld0QUzcP+knx8ZTVG4+wQ1DFWd65I6
         ZccS3+ifa7cnrMD6HJS5p5xqfGgrXmMUbG9sNJXy/pk3aYp0qee+q28e28whUiUGWUBy
         RDqkJZEAA7m/7l/WKyJ9mO3h9uQMwALvu++kSu7zVLki9pPH3PqLjlTN0yjT7Qf2vXHN
         eWXVQtBiSswBLxIXXizH3ZwJrvS6SLsUYZTMo6zEaWZxW9fDav5UloR7BBRExkbF15AV
         wVcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zFgBNfN+EXZP+WSaoe1F1U579Ovmtt8f8ednlmO7Lns=;
        b=pjCfR68SJN94EeMMNzgJm74EOpEWcKFuMS7qCxb9ryoxeUc+Q2K5wW2Aod7+eFm5FH
         19uSl8pSnUiIUzrG4h0lULixDnwPcDsqGlO4zSrVYoskvltRweFb2iGywucgMWwc0RXO
         ll/2FLBqMyuUXuvK+KtoQBKILdPEbmOfNK2i9CuokN08uIZMFA1LsvGQ9h35Nafba06A
         EaLVVzdXGmaDMq3BMutNsbEp7za6SscyujkHRMfL3yfsx0MsaaJl1fXTZ7KJaW/eczHW
         qlseD8uCUrSx70FvuxTZHgFTWx3beUxaTPa8uIcSrE1Z81cDjXksYm/iBmqUjUanQEr7
         PWzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pZadpKgE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6si146840oic.272.2021.03.11.15.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 15:50:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pZadpKgE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKV4p-0007fG-4K
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 18:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKV20-0007Zq-0r; Thu, 11 Mar 2021 18:47:52 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lKV1y-0004wD-7u; Thu, 11 Mar 2021 18:47:51 -0500
Received: by mail-pj1-x102a.google.com with SMTP id ha17so3498346pjb.2;
 Thu, 11 Mar 2021 15:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zFgBNfN+EXZP+WSaoe1F1U579Ovmtt8f8ednlmO7Lns=;
 b=pZadpKgE+ZBNoDgZZUiFNHQ49/+XnQa2WWns5BTWEb7OvEXiUy8WpAjpvMzmXc0T1e
 kd3gteKIHYIqqK3ie8YmF1VdxMDWb/fWzzw251DeNorTz0bDq2ziAg7MVe2FcB/kb0st
 Jg85XaFDOIZjH6/W7R25IPko+o4E9/hdxVGEh1g2AV6w19YoyjzAGX1NYazi/zuehFSF
 xqLUfULb/aOpWj3CqJYMm6ctJduzYXCZgsc6G0gn56Ubiljzcwjnbw8kY7V2p/7lP5o+
 kItnDhtcYzRo8msN+O1551xM+rEoYmRBkXSTv4fN5nVhxwmKwtAD9u/LMvELHK9RwXLP
 q6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zFgBNfN+EXZP+WSaoe1F1U579Ovmtt8f8ednlmO7Lns=;
 b=MoVF2pVww2nFOltJEW+B3tRwtuNCFtdjiBiteYYBGRWauXPkfymbKSZY6tetEajB+F
 h1lHaPVkZYrosGsuuQI0TRjiVTvhKSfJe+f1VK9SYVq5eCC6gYUjcLE48TIxampD5ueY
 KPUzq8CP9wF8QLlZa/Cw0UoFkDfQEiP+B3IIvfsbKrdgT6cjlr2dprpQJs1Td/6VJQJj
 OIXU0+QV3+9guKKgZP2JXfX4QTSZVrjPMcqjhcpPg+EzAlDmODXrURi2SlBAsxQGIkfN
 M933GBVVHqD6iSwPHRqh/Yc2hHWD6jTAKWDGykKszxCHGBASRO5TGXowKZKuJnTZg1i9
 rMsA==
X-Gm-Message-State: AOAM532Lymyk0Dh1mi6Vn9kftx3XbAAkaVLrEd8aQFIrv48gLaTLL3RE
 fy4EkPB3IcviD+URZ9C5cOY=
X-Received: by 2002:a17:902:9a45:b029:e6:1444:5287 with SMTP id
 x5-20020a1709029a45b02900e614445287mr10667599plv.54.1615506468670; 
 Thu, 11 Mar 2021 15:47:48 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id a204sm3357005pfd.106.2021.03.11.15.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:47:47 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 2/3] aspeed: Integrate HACE
Date: Fri, 12 Mar 2021 10:17:25 +1030
Message-Id: <20210311234726.437676-3-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311234726.437676-1-joel@jms.id.au>
References: <20210311234726.437676-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ld8a/0PpUzI0

Add the hash and crypto engine model to the aspeed socs.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 docs/system/arm/aspeed.rst  |  2 +-
 include/hw/arm/aspeed_soc.h |  3 +++
 hw/arm/aspeed_ast2600.c     | 14 ++++++++++++++
 hw/arm/aspeed_soc.c         | 15 +++++++++++++++
 4 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 690bada7842b..ec30cad88a58 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -48,6 +48,7 @@ Supported devices
  * UART
  * Ethernet controllers
  * Front LEDs (PCA9552 on I2C bus)
+ * Hash/Crypto Engine (HACE) - SHA support only, no scatter-gather
 
 
 Missing devices
@@ -59,7 +60,6 @@ Missing devices
  * LPC Bus Controller
  * Slave GPIO Controller
  * Super I/O Controller
- * Hash/Crypto Engine
  * PCI-Express 1 Controller
  * Graphic Display Controller
  * PECI Controller
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 11cfe6e3585b..a8c9a22e5882 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -21,6 +21,7 @@
 #include "hw/rtc/aspeed_rtc.h"
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/ssi/aspeed_smc.h"
+#include "hw/misc/aspeed_hace.h"
 #include "hw/watchdog/wdt_aspeed.h"
 #include "hw/net/ftgmac100.h"
 #include "target/arm/cpu.h"
@@ -49,6 +50,7 @@ struct AspeedSoCState {
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
     AspeedSCUState scu;
+    AspeedHACEState hace;
     AspeedXDMAState xdma;
     AspeedSMCState fmc;
     AspeedSMCState spi[ASPEED_SPIS_NUM];
@@ -130,6 +132,7 @@ enum {
     ASPEED_DEV_SDRAM,
     ASPEED_DEV_XDMA,
     ASPEED_DEV_EMMC,
+    ASPEED_DEV_HACE,
 };
 
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bf31ca351feb..7aba3effd7bc 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -42,6 +42,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_ETH2]      = 0x1E680000,
     [ASPEED_DEV_ETH4]      = 0x1E690000,
     [ASPEED_DEV_VIC]       = 0x1E6C0000,
+    [ASPEED_DEV_HACE]      = 0x1E6D0000,
     [ASPEED_DEV_SDMC]      = 0x1E6E0000,
     [ASPEED_DEV_SCU]       = 0x1E6E2000,
     [ASPEED_DEV_XDMA]      = 0x1E6E7000,
@@ -102,6 +103,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_I2C]       = 110,   /* 110 -> 125 */
     [ASPEED_DEV_ETH1]      = 2,
     [ASPEED_DEV_ETH2]      = 3,
+    [ASPEED_DEV_HACE]      = 4,
     [ASPEED_DEV_ETH3]      = 32,
     [ASPEED_DEV_ETH4]      = 33,
 
@@ -211,6 +213,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
 
     object_initialize_child(obj, "emmc-controller.sdhci", &s->emmc.slots[0],
                             TYPE_SYSBUS_SDHCI);
+
+    object_initialize_child(obj, "hace", &s->hace, TYPE_ASPEED_HACE);
 }
 
 /*
@@ -469,6 +473,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->emmc), 0, sc->memmap[ASPEED_DEV_EMMC]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_EMMC));
+
+    /* HACE */
+    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 }
 
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 7eefd54ac07a..ce9b8f8c5d6f 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -34,6 +34,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
     [ASPEED_DEV_VIC]    = 0x1E6C0000,
     [ASPEED_DEV_SDMC]   = 0x1E6E0000,
     [ASPEED_DEV_SCU]    = 0x1E6E2000,
+    [ASPEED_DEV_HACE]   = 0x1E6E3000,
     [ASPEED_DEV_XDMA]   = 0x1E6E7000,
     [ASPEED_DEV_VIDEO]  = 0x1E700000,
     [ASPEED_DEV_ADC]    = 0x1E6E9000,
@@ -65,6 +66,7 @@ static const hwaddr aspeed_soc_ast2500_memmap[] = {
     [ASPEED_DEV_VIC]    = 0x1E6C0000,
     [ASPEED_DEV_SDMC]   = 0x1E6E0000,
     [ASPEED_DEV_SCU]    = 0x1E6E2000,
+    [ASPEED_DEV_HACE]   = 0x1E6E3000,
     [ASPEED_DEV_XDMA]   = 0x1E6E7000,
     [ASPEED_DEV_ADC]    = 0x1E6E9000,
     [ASPEED_DEV_VIDEO]  = 0x1E700000,
@@ -118,6 +120,7 @@ static const int aspeed_soc_ast2400_irqmap[] = {
     [ASPEED_DEV_ETH2]   = 3,
     [ASPEED_DEV_XDMA]   = 6,
     [ASPEED_DEV_SDHCI]  = 26,
+    [ASPEED_DEV_HACE]   = 4,
 };
 
 #define aspeed_soc_ast2500_irqmap aspeed_soc_ast2400_irqmap
@@ -211,6 +214,8 @@ static void aspeed_soc_init(Object *obj)
         object_initialize_child(obj, "sdhci[*]", &s->sdhci.slots[i],
                                 TYPE_SYSBUS_SDHCI);
     }
+
+    object_initialize_child(obj, "hace", &s->hace, TYPE_ASPEED_HACE);
 }
 
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -393,6 +398,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
                     sc->memmap[ASPEED_DEV_SDHCI]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
+
+    /* HACE */
+    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(s->dram_mr),
+                             &error_abort);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 }
 static Property aspeed_soc_properties[] = {
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
-- 
2.30.1

