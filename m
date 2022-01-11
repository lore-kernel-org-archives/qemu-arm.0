Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1484646lfj;
        Tue, 11 Jan 2022 00:49:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDXF0wIhPxQpe6xWxCK1R/JWZQCKNA/grQvKFxGHzQpJYcQkdh1WU2DPuEAKSJD8bn6E5E
X-Received: by 2002:a25:f409:: with SMTP id q9mr328213ybd.727.1641890953431;
        Tue, 11 Jan 2022 00:49:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641890953; cv=none;
        d=google.com; s=arc-20160816;
        b=ZINYmFto0hNap2OM6JLiVjloysH6jPqYeMOvtOqXQOmvafftQgB8uVhYO2m3ox6nzs
         OxRlZRBIO3ieKGqCVjPsbnLiQtO0VyquIsykm5IqZPf68NXFj81CuA3miRHSkOUKvsbJ
         iD7oYeo9WIQrG9OhRIv/tUho4pOnAl6JCpV4el8dcMxegQIEcxwSlQRE1JnFbpqLMojf
         ogTEFXMngZpOvJKX9sscZuY2bqQxS56r4SAsiWJX240SxmkYCGd615q8SW/9Nt+HBofP
         yy7ZH7XQHG8P11Kb7ZAsru0LfEzFBhIh4iw4fFB6bUMQHrCPyRG8pziw2uum6zQ0Jn7k
         KFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=i8pjxD8EOhQJ9vzaUU0TLgqTuGI5kpX++vzs0o+5DPE=;
        b=jFPP021nDorBMjkwI2ZCfAhNFnHK3zMouh4mFxzkd1qhPOASTiiXLqQsTtVpXKJCc4
         DOkW400Px8CXRXjuMAC+FSwCgsWB+TG8eFtfWRL5iiQuU2mHhM0zwoo0ONWg4WoI8XPr
         JS0/pIdv3mnae3tB/XGXKTBR33fAMELn7dnKDXKUl2R9HTIH9lsLJv4FdARizmny3aSu
         8fi8hSloZ3m0zWcHGr67vGOoamizuDSWenXZtMdE+hygmC5lflnftUU53CrZUSMtaVzA
         CFr9tbPAYXgrCLDdfj3QNotBzbZpYm2YQPjfZ8U+FQ5CVLE1JWwUxNH19TpN+HUYmdUI
         mbjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h83si6983193ybg.585.2022.01.11.00.49.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jan 2022 00:49:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n7Cq8-00049h-PB
	for alex.bennee@linaro.org; Tue, 11 Jan 2022 03:49:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1n7Cnr-0001l6-CX; Tue, 11 Jan 2022 03:46:51 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:25756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1n7Cnp-0005FW-Ey; Tue, 11 Jan 2022 03:46:51 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 20B8dHGf066977;
 Tue, 11 Jan 2022 16:39:17 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 11 Jan
 2022 16:45:50 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/2] This patch includes i3c instance in ast2600 soc.
Date: Tue, 11 Jan 2022 16:45:46 +0800
Message-ID: <20220111084546.4145785-3-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111084546.4145785-1-troy_lee@aspeedtech.com>
References: <20220111084546.4145785-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 20B8dHGf066977
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=troy_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 hailin.wu@aspeedtech.com, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9hkZ2QXfv6yp

v3:
- Remove unrelated changes to SPI2 address
- Remove controller irq line

v2: Rebase to mainline QEMU

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 hw/arm/aspeed_ast2600.c     | 16 ++++++++++++++++
 include/hw/arm/aspeed_soc.h |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index e33483fb5d..8f37bdb1d8 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -61,6 +61,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_UART1]     = 0x1E783000,
     [ASPEED_DEV_UART5]     = 0x1E784000,
     [ASPEED_DEV_VUART]     = 0x1E787000,
+    [ASPEED_DEV_I3C]       = 0x1E7A0000,
     [ASPEED_DEV_SDRAM]     = 0x80000000,
 };
 
@@ -108,6 +109,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_ETH4]      = 33,
     [ASPEED_DEV_KCS]       = 138,   /* 138 -> 142 */
     [ASPEED_DEV_DP]        = 62,
+    [ASPEED_DEV_I3C]       = 102,   /* 102 -> 107 */
 };
 
 static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
@@ -223,6 +225,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
 
     snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
     object_initialize_child(obj, "hace", &s->hace, typename);
+
+    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
 }
 
 /*
@@ -523,6 +527,18 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
+
+    /* I3C */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
+    for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
+        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                        sc->irqmap[ASPEED_DEV_I3C] + i);
+        /* The AST2600 I3C controller has one IRQ per bus. */
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
+    }
 }
 
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 18fb7eed46..cae9906684 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -21,6 +21,7 @@
 #include "hw/timer/aspeed_timer.h"
 #include "hw/rtc/aspeed_rtc.h"
 #include "hw/i2c/aspeed_i2c.h"
+#include "hw/misc/aspeed_i3c.h"
 #include "hw/ssi/aspeed_smc.h"
 #include "hw/misc/aspeed_hace.h"
 #include "hw/watchdog/wdt_aspeed.h"
@@ -51,6 +52,7 @@ struct AspeedSoCState {
     AspeedRtcState rtc;
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
+    AspeedI3CState i3c;
     AspeedSCUState scu;
     AspeedHACEState hace;
     AspeedXDMAState xdma;
@@ -141,6 +143,7 @@ enum {
     ASPEED_DEV_HACE,
     ASPEED_DEV_DPMCU,
     ASPEED_DEV_DP,
+    ASPEED_DEV_I3C,
 };
 
 #endif /* ASPEED_SOC_H */
-- 
2.25.1

