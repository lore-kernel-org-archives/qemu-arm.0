Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2503946njb;
        Mon, 3 Mar 2025 01:56:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWf0ehLWxJuxzGjK8dMikijk0I+zSlg1JCNLnXjwt8+rl4gsSoDpMzx8lUZqsgvUK/Cfn5Yc2n/Y1ovJg==@linaro.org
X-Google-Smtp-Source: AGHT+IFBeJk8KNv8ZwJH5oWZsIcmbyzjcrtXfnOVBexsshxvHXKhM4QmUi6k+xR7OPDhuI2Ujrof
X-Received: by 2002:ad4:5f08:0:b0:6e6:6699:7e58 with SMTP id 6a1803df08f44-6e8a0c88f49mr172385606d6.1.1740995814116;
        Mon, 03 Mar 2025 01:56:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740995814; cv=none;
        d=google.com; s=arc-20240605;
        b=Tpv36nvqqxsuW0M16CdLFQI+GDJcEXbA7x2+VYCEWQU7NJi0tTXXzdIvZZ3g8TNqjb
         GkMuUIQGuhOlm9R7LQsff+KLWoANt/PwZF/Tbb0NbdS5G5dejQ77bhiphEL9Oh9Bjerd
         ePt7U35GZJlWXpXJAkvMzxbOeBXjCW/NvzMdpMufLVmGrFjJ8XU5gR1SyItzhzXr2Kr5
         SrB9JargBpbXZmay0Ljvkj6Qx5Q8lDytjaWDhY0dG8fngaLpPWmSGn41ZJPvoo4BYTLK
         SQLzXafpKnMkUN2O3zM5TBU8J5Q2PLhWtCFrwIAupj5xvUbyfLW4vWNR4DPSfVkbtcrY
         Yl/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=61kKc4NOkZbxtVtpzWkAokQc2kglMaTkoCOVQNUb99c=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=HC2pRaW2l6upbxduEVqqLMKeivjU/+QQtPAZArwFrvWU6zYcZBtC1FzO1UUo4XPNPy
         KVzOIi86mTaZel+VkvaPQDqF6MY9MeVJUPRAvaLZ+aa3G1wRHQwd1LpVqok0RxvZRqGW
         aiLeIm57ZMPEJAcYEgu9KM4FVp2LeNkvAIPqoKUgl3wYu820hUmH5l/NTud8j4rX5Mgf
         hAFc0wWtj6YiqXv4WlsvuScscqrIqDuO8Ghl/wS+W+d4xBKbqnzg3xgP3DwYgf9RMCvH
         c0V+psyHVHXVDnN+aY+F7aA7TMUAJyoZYZuhXRv8Rt7xWnJnD51uQYrNtouyBCzo8Jch
         LnRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976d09a5si85417546d6.349.2025.03.03.01.56.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 01:56:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp2Wy-0008Gn-4V; Mon, 03 Mar 2025 04:56:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2W5-0007s9-K9; Mon, 03 Mar 2025 04:55:17 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2W4-0001s3-2O; Mon, 03 Mar 2025 04:55:17 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 3 Mar
 2025 17:55:00 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 3 Mar 2025 17:55:00 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v4 06/23] hw/arm/aspeed: Rename IRQ table and machine name for
 AST2700 A0
Date: Mon, 3 Mar 2025 17:54:34 +0800
Message-ID: <20250303095457.2337631-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303095457.2337631-1-jamin_lin@aspeedtech.com>
References: <20250303095457.2337631-1-jamin_lin@aspeedtech.com>
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
X-TUID: HyAxKCsszPCq

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
index c6c18596d6..2482f05154 100644
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
+    mc->desc = "Aspeed AST2700 A0 EVB (Cortex-A35)";
+    mc->alias = "ast2700-evb";
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
index 527a5f8245..f1beea7ece 100644
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
2.34.1

