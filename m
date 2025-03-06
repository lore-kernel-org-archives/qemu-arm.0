Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1389114njm;
        Thu, 6 Mar 2025 02:46:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU0Isdh735f+T1yubLpR4DryGyFuMvE06dVsCcbT3jYusj3KGONzAovfL/lpvhKXJGtysRsRosNZihscA==@linaro.org
X-Google-Smtp-Source: AGHT+IG3suGRksKtHxeu9VCIYMOHxAZ0RV4l3YpDdhr5f4P4SnRHlcyuUIM4DUPZipAsu6H7ViKX
X-Received: by 2002:a05:620a:2605:b0:7c0:7eb4:6635 with SMTP id af79cd13be357-7c3d8e48678mr953739685a.20.1741257989372;
        Thu, 06 Mar 2025 02:46:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741257989; cv=none;
        d=google.com; s=arc-20240605;
        b=YFYpiYWN6iEYI7+xPq77VpHTOWnyoZnmOciTP8jLWDpwE/uBQ2rSfEJfJXg+HgMEH2
         wcYThRqLqc8J5GUrWrodkpZ+qLUI+9Me/JfdHSR7pcLOzarMscFw84O8Q03WzW9H+ynh
         RBeNk0W+Z+0p0kfYryMlz1LTxfHRAnyYAsQcoWZPt/VYjyq3+LASngixmxsVgIXHy8V1
         ECqoDf/dS+zW2p1bUgQFlv/OgNQX5earREm1qG4PgBAi76e/I+drzPlNEJlTQhIsViAG
         iiW5FxdkeoRAudZ9WOiluEtZE/0+FEIKH5YNJBvFk7vvHrP2AFKPBm7NK/E1jLl60l9g
         FQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=WSHG7zokL3vAiO06X0GOhlm+/DZGsYZyBRlQG87ecDo=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=gJXg57CLXG43CGZgCaMvcpk6+IN/ZIAKTePk1OzmgXfYoA3mbGuRtnjShKzFoaubXJ
         4MxEpWfEoE7hP8O844Hf0clhObPlRI6zwpCCKwqfEHiiU3UPJKN1bp9ksYQHe0kNmWJw
         VgUDGbhojRA8NM0OpSue7Thv9qsqZi014L21AQGYw46koWBfBGmRQShiz+wWhdzmmu4G
         UwBl8EHwiITVeJZR+hIb+y9co/mWRuWT4pMc/o7sf330Rkk8Ft088YhJ33icSaaP4KhA
         cXUs4bQVhigbXRl0Khrgn4UZVTytXLi/GBG7Pl9ztNVpk5g9O5Es/b2Ab7jIlglUGmlu
         4DFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e5511c8asi97339385a.367.2025.03.06.02.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 02:46:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tq8dK-0004ty-A4; Thu, 06 Mar 2025 05:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8dI-0004tC-2W; Thu, 06 Mar 2025 05:39:16 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8dG-0000TZ-CA; Thu, 06 Mar 2025 05:39:15 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Mar
 2025 18:38:49 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Mar 2025 18:38:49 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v5 08/29] hw/arm/aspeed: Rename IRQ table and machine name for
 AST2700 A0
Date: Thu, 6 Mar 2025 18:38:16 +0800
Message-ID: <20250306103846.429221-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KMTP5jv8LhoC

Currently, AST2700 SoC only supports A0. To support AST2700 A1, rename its IRQ
table and machine name.

To follow the machine deprecation rule, the initial machine "ast2700-evb" is
aliased to "ast2700a0-evb." In the future, we will alias "ast2700-evb" to new
SoCs, such as "ast2700a1-evb."

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed.c         | 9 +++++----
 hw/arm/aspeed_ast27x0.c | 8 ++++----
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c6c18596d6..18f7c450da 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1673,12 +1673,13 @@ static void ast2700_evb_i2c_init(AspeedMachineState *bmc)
                             TYPE_TMP105, 0x4d);
 }
 
-static void aspeed_machine_ast2700_evb_class_init(ObjectClass *oc, void *data)
+static void aspeed_machine_ast2700a0_evb_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
 
-    mc->desc = "Aspeed AST2700 EVB (Cortex-A35)";
+    mc->alias = "ast2700-evb";
+    mc->desc = "Aspeed AST2700 A0 EVB (Cortex-A35)";
     amc->soc_name  = "ast2700-a0";
     amc->hw_strap1 = AST2700_EVB_HW_STRAP1;
     amc->hw_strap2 = AST2700_EVB_HW_STRAP2;
@@ -1817,9 +1818,9 @@ static const TypeInfo aspeed_machine_types[] = {
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
index 10e1358166..de79724446 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -73,7 +73,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
 #define AST2700_MAX_IRQ 256
 
 /* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
-static const int aspeed_soc_ast2700_irqmap[] = {
+static const int aspeed_soc_ast2700a0_irqmap[] = {
     [ASPEED_DEV_UART0]     = 132,
     [ASPEED_DEV_UART1]     = 132,
     [ASPEED_DEV_UART2]     = 132,
@@ -762,7 +762,7 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("ast2700.io", 0x0, 0x4000000);
 }
 
-static void aspeed_soc_ast2700_class_init(ObjectClass *oc, void *data)
+static void aspeed_soc_ast2700a0_class_init(ObjectClass *oc, void *data)
 {
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-a35"),
@@ -785,7 +785,7 @@ static void aspeed_soc_ast2700_class_init(ObjectClass *oc, void *data)
     sc->uarts_num    = 13;
     sc->num_cpus     = 4;
     sc->uarts_base   = ASPEED_DEV_UART0;
-    sc->irqmap       = aspeed_soc_ast2700_irqmap;
+    sc->irqmap       = aspeed_soc_ast2700a0_irqmap;
     sc->memmap       = aspeed_soc_ast2700_memmap;
     sc->get_irq      = aspeed_soc_ast2700_get_irq;
 }
@@ -800,7 +800,7 @@ static const TypeInfo aspeed_soc_ast27x0_types[] = {
         .name           = "ast2700-a0",
         .parent         = TYPE_ASPEED27X0_SOC,
         .instance_init  = aspeed_soc_ast2700_init,
-        .class_init     = aspeed_soc_ast2700_class_init,
+        .class_init     = aspeed_soc_ast2700a0_class_init,
     },
 };
 
-- 
2.43.0

