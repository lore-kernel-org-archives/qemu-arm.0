Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1427256njb;
        Thu, 6 Feb 2025 01:55:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcXDzRGu4lZjBkUWObZsowIqE83JgmhovR3uk81rf1U5BurnR6XMW2/h5pXWwRpCgjWWD2BsvTpU52AA==@linaro.org
X-Google-Smtp-Source: AGHT+IHOCxGL4V+8suSOyL4Itu/WZ+gTlQfYKQYkFqu5xsqD2CLvJTauqIdGZlr2+mFwGrcpmyFu
X-Received: by 2002:ac8:5a42:0:b0:46c:7646:4a3a with SMTP id d75a77b69052e-4702817335amr66763091cf.7.1738835726729;
        Thu, 06 Feb 2025 01:55:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738835726; cv=none;
        d=google.com; s=arc-20240605;
        b=MCXN48lWDRk3rdjygKkEguf3FqA7PFZjcZ/We7Y2qRvCrWak+26aGAPOCswu4fTrWy
         KwOmxQ7O3LA8VRThmE4iAeKSnR4k1KNDI4iVrO6pWr+ucFTM09AUp+Q/gGZa6edE2fxT
         gUAXe0neYOS0TW4+PVK4H0G+HBVo1bA8Sd9P+55BF015rpPyOb9BTX1BZf/Qx6jFaFSN
         u6Rxd581xRjfZwhhavc3j856HPHop2sqw8nRnKWAnANxxbCsnusbWfBw4GsvAEidOeC2
         96rW2w3+31i4jb4E4HGdbK20+rGqobHywomqTnvxbtP6WwUbjr+JehBLe36D469ILsvH
         7iiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Pka+QRJ14npBxUonDtx7ZDnhpy/datBNRRnR1KbWBPA=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=B69pIw1wU19jybDeQvdEjXWo+mmN4E+RlyxCLkOiG1gxZbt5MI/VCN2IJaF98v45Bq
         X25p90g0VASWDwIqLM5WoJ8Cg7PVNbNly0bcjU/oxFs4xE1x3EG6Iip6moUfnIt+EkK4
         rGg/07YxjJG26w6fo/Gf+ugPXTG+CdhgCzxAOu7iJQ7TtRWKCxitAZOUyrRpKeB2TEq4
         bOVLPl+jyftbDLb7QtxybABLsWsARszmmiyjrnc5Hava5hF+Hh7frXW3Lx02ve7Z9Ct3
         w7N3BMZAWvlqA1T2A8jfjihMeGzGFOFfan85htnllSdMt1hzf6tCGO16SGwkyGPJHMWn
         GWbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b74d50si7488181cf.262.2025.02.06.01.55.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 01:55:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfyZX-00023L-VI; Thu, 06 Feb 2025 04:53:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tfyZR-000201-PT; Thu, 06 Feb 2025 04:53:18 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tfyZQ-00051a-Bf; Thu, 06 Feb 2025 04:53:17 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Feb
 2025 17:52:54 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Feb 2025 17:52:54 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 5/6] hw/arm/aspeed_ast27x0: Sort the IRQ table by IRQ number
Date: Thu, 6 Feb 2025 17:52:51 +0800
Message-ID: <20250206095253.928308-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250206095253.928308-1-jamin_lin@aspeedtech.com>
References: <20250206095253.928308-1-jamin_lin@aspeedtech.com>
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
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
X-TUID: ZVxbVoXvlz5E

To improve readability, sort the IRQ table by IRQ number.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 50 ++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 39567fcab9..6a8487fee6 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -73,27 +73,13 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
 
 /* Shared Peripheral Interrupt values below are offset by -32 from datasheet */
 static const int aspeed_soc_ast2700a0_irqmap[] = {
-    [ASPEED_DEV_UART0]     = 132,
-    [ASPEED_DEV_UART1]     = 132,
-    [ASPEED_DEV_UART2]     = 132,
-    [ASPEED_DEV_UART3]     = 132,
-    [ASPEED_DEV_UART4]     = 8,
-    [ASPEED_DEV_UART5]     = 132,
-    [ASPEED_DEV_UART6]     = 132,
-    [ASPEED_DEV_UART7]     = 132,
-    [ASPEED_DEV_UART8]     = 132,
-    [ASPEED_DEV_UART9]     = 132,
-    [ASPEED_DEV_UART10]    = 132,
-    [ASPEED_DEV_UART11]    = 132,
-    [ASPEED_DEV_UART12]    = 132,
-    [ASPEED_DEV_FMC]       = 131,
     [ASPEED_DEV_SDMC]      = 0,
-    [ASPEED_DEV_SCU]       = 12,
-    [ASPEED_DEV_ADC]       = 130,
+    [ASPEED_DEV_HACE]      = 4,
     [ASPEED_DEV_XDMA]      = 5,
-    [ASPEED_DEV_EMMC]      = 15,
-    [ASPEED_DEV_GPIO]      = 130,
+    [ASPEED_DEV_UART4]     = 8,
+    [ASPEED_DEV_SCU]       = 12,
     [ASPEED_DEV_RTC]       = 13,
+    [ASPEED_DEV_EMMC]      = 15,
     [ASPEED_DEV_TIMER1]    = 16,
     [ASPEED_DEV_TIMER2]    = 17,
     [ASPEED_DEV_TIMER3]    = 18,
@@ -102,19 +88,33 @@ static const int aspeed_soc_ast2700a0_irqmap[] = {
     [ASPEED_DEV_TIMER6]    = 21,
     [ASPEED_DEV_TIMER7]    = 22,
     [ASPEED_DEV_TIMER8]    = 23,
-    [ASPEED_DEV_WDT]       = 131,
-    [ASPEED_DEV_PWM]       = 131,
+    [ASPEED_DEV_DP]        = 28,
     [ASPEED_DEV_LPC]       = 128,
     [ASPEED_DEV_IBT]       = 128,
+    [ASPEED_DEV_KCS]       = 128,
+    [ASPEED_DEV_ADC]       = 130,
+    [ASPEED_DEV_GPIO]      = 130,
     [ASPEED_DEV_I2C]       = 130,
-    [ASPEED_DEV_PECI]      = 133,
+    [ASPEED_DEV_FMC]       = 131,
+    [ASPEED_DEV_WDT]       = 131,
+    [ASPEED_DEV_PWM]       = 131,
+    [ASPEED_DEV_I3C]       = 131,
+    [ASPEED_DEV_UART0]     = 132,
+    [ASPEED_DEV_UART1]     = 132,
+    [ASPEED_DEV_UART2]     = 132,
+    [ASPEED_DEV_UART3]     = 132,
+    [ASPEED_DEV_UART5]     = 132,
+    [ASPEED_DEV_UART6]     = 132,
+    [ASPEED_DEV_UART7]     = 132,
+    [ASPEED_DEV_UART8]     = 132,
+    [ASPEED_DEV_UART9]     = 132,
+    [ASPEED_DEV_UART10]    = 132,
+    [ASPEED_DEV_UART11]    = 132,
+    [ASPEED_DEV_UART12]    = 132,
     [ASPEED_DEV_ETH1]      = 132,
     [ASPEED_DEV_ETH2]      = 132,
     [ASPEED_DEV_ETH3]      = 132,
-    [ASPEED_DEV_HACE]      = 4,
-    [ASPEED_DEV_KCS]       = 128,
-    [ASPEED_DEV_DP]        = 28,
-    [ASPEED_DEV_I3C]       = 131,
+    [ASPEED_DEV_PECI]      = 133,
     [ASPEED_DEV_SDHCI]     = 133,
 };
 
-- 
2.34.1

