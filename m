Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp344154njc;
        Wed, 12 Feb 2025 19:36:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUtl+D/op9jd/Hs3QL0JgMrU2YTRbEiB6dlo/CvCxKbhPzntaIMb+37Ca0/0lwFYXGcjay7zROzkk/ifQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFyDxQwJOVdqzI+ZgIAx9U4GU1Llfd0OzKHIWYOpZuDZ2pQA9xpVeVQwM1bFMwvei12SfV8
X-Received: by 2002:a05:6214:212c:b0:6d8:99cf:d2eb with SMTP id 6a1803df08f44-6e46ed8a41cmr98453476d6.21.1739417788556;
        Wed, 12 Feb 2025 19:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739417788; cv=none;
        d=google.com; s=arc-20240605;
        b=QwXpPkoiMc2SL9IY1KEWBWWtcqZHk6jzEjRCXfHWj2wBjI1piLtAnq+DwO25Qo28w8
         RQcQpV8XemGV2C62XgmS8mQTd6Mz+KpxKR0k34CsQFhpiFGU5zS8XbD3cYyG6oJWN0xv
         Jz7uTnNkrubvLn7Xk/IEgxx3OidZQHFZijhwlPuhHGK6aigd78dG2747Q3OgmqeMCJRd
         mAsGG1nVOMBKT8JQR/V5J+lRt+Xjhu3SwCTNk9vf6B17K1KKo9MBF0mrWynXSEUaWcv8
         Z/fCp/RxarGF1W7BcjsVNu4enphPA256HesHnC1ERQOvgCGIa0XCFlnWa4g31hAm1BdC
         yNIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=+FT/UZ2iqTeX3l45heH1KnFhl9VvF4mCN8Aw20Xtho4=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=lE2Sau1fKqWoPoBE5gyMlZhfGqGG9Dc38x1yutIR78REdz4c1I0+bEnxIpylFaaUsV
         nqBvFdsitaTNeRrmQ/W5EJOvBxJPTmb50NBJfgWVAswqFHhD8Rj/m78X6BibQaF4yuf7
         zXDe8oEItx/CtLufFKfkU1l7RPV2fswHTbptbiwKy+koQqDswgP+XqACnOlP6lc6eI2u
         UQLYFbIUoZpnmmQkGKLpzzhtuTIGSib2bBLfDCH6j+ssT0BsvVKx/mXUs8bleXG6jG/8
         sMR0topO8k/Vah7bhwXLbw7cVFiAWuFYkzn1PRwJ1TeGGXAvZq8u96DJz5YOi/TgQzMs
         HPaQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9cc822si5874526d6.445.2025.02.12.19.36.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 19:36:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiQ1S-0007Gg-Vt; Wed, 12 Feb 2025 22:36:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ12-00079D-HY; Wed, 12 Feb 2025 22:35:52 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tiQ10-0000hG-CP; Wed, 12 Feb 2025 22:35:52 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Feb
 2025 11:35:33 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Feb 2025 11:35:33 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v3 04/28] hw/arm/aspeed: Rename IRQ table and machine name for
 AST2700 A0
Date: Thu, 13 Feb 2025 11:35:07 +0800
Message-ID: <20250213033531.3367697-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
References: <20250213033531.3367697-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: Z891UNXxs6qg

Currently, AST2700 SoC only supports A0. To support AST2700 A1, rename its IRQ
table and machine name.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed.c         | 8 ++++----
 hw/arm/aspeed_ast27x0.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d9418e2b9f..6ddfdbdeba 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1654,12 +1654,12 @@ static void ast2700_evb_i2c_init(AspeedMachineState *bmc)
                             TYPE_TMP105, 0x4d);
 }
 
-static void aspeed_machine_ast2700_evb_class_init(ObjectClass *oc, void *data)
+static void aspeed_machine_ast2700a0_evb_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
 
-    mc->desc = "Aspeed AST2700 EVB (Cortex-A35)";
+    mc->desc = "Aspeed AST2700 A0 EVB (Cortex-A35)";
     amc->soc_name  = "ast2700-a0";
     amc->hw_strap1 = AST2700_EVB_HW_STRAP1;
     amc->hw_strap2 = AST2700_EVB_HW_STRAP2;
@@ -1795,9 +1795,9 @@ static const TypeInfo aspeed_machine_types[] = {
         .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
 #ifdef TARGET_AARCH64
     }, {
-        .name          = MACHINE_TYPE_NAME("ast2700-evb"),
+        .name          = MACHINE_TYPE_NAME("ast2700a0-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
-        .class_init    = aspeed_machine_ast2700_evb_class_init,
+        .class_init    = aspeed_machine_ast2700a0_evb_class_init,
 #endif
     }, {
         .name          = TYPE_ASPEED_MACHINE,
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 2d0c99f159..6e3375f5d3 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -72,7 +72,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
 #define AST2700_MAX_IRQ 256
 
 /* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
-static const int aspeed_soc_ast2700_irqmap[] = {
+static const int aspeed_soc_ast2700a0_irqmap[] = {
     [ASPEED_DEV_UART0]     = 132,
     [ASPEED_DEV_UART1]     = 132,
     [ASPEED_DEV_UART2]     = 132,
@@ -740,7 +740,7 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("ast2700.io", 0x0, 0x4000000);
 }
 
-static void aspeed_soc_ast2700_class_init(ObjectClass *oc, void *data)
+static void aspeed_soc_ast2700a0_class_init(ObjectClass *oc, void *data)
 {
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-a35"),
@@ -763,7 +763,7 @@ static void aspeed_soc_ast2700_class_init(ObjectClass *oc, void *data)
     sc->uarts_num    = 13;
     sc->num_cpus     = 4;
     sc->uarts_base   = ASPEED_DEV_UART0;
-    sc->irqmap       = aspeed_soc_ast2700_irqmap;
+    sc->irqmap       = aspeed_soc_ast2700a0_irqmap;
     sc->memmap       = aspeed_soc_ast2700_memmap;
     sc->get_irq      = aspeed_soc_ast2700_get_irq;
 }
@@ -778,7 +778,7 @@ static const TypeInfo aspeed_soc_ast27x0_types[] = {
         .name           = "ast2700-a0",
         .parent         = TYPE_ASPEED27X0_SOC,
         .instance_init  = aspeed_soc_ast2700_init,
-        .class_init     = aspeed_soc_ast2700_class_init,
+        .class_init     = aspeed_soc_ast2700a0_class_init,
     },
 };
 
-- 
2.34.1

