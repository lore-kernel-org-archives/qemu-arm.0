Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1389702njm;
        Thu, 6 Mar 2025 02:48:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVi5gF5wwBq5E0uhxQ5xO3COB5Bf5AM+S+71aNDPkhbVIcGfuqPlPGN3Rnh8TkvP3TS8D3ISLW+BzRXHg==@linaro.org
X-Google-Smtp-Source: AGHT+IFHfskVzEvH9qSEJxQ8hE0rkE9ZcbtMEE0II3fns4VvZkUCEif9XwMXcmzVdtFpQlfjOuhl
X-Received: by 2002:ac8:7d0c:0:b0:472:957:dfa8 with SMTP id d75a77b69052e-4750b4492b8mr88410841cf.18.1741258088135;
        Thu, 06 Mar 2025 02:48:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741258088; cv=none;
        d=google.com; s=arc-20240605;
        b=hAB+/5ZPoqG+HHyAqdNMXUi/Fz6txBtssv+lJiCCOaxj4JUvsLn7EZZiiUuFUInk0y
         brzh/VXqdU743rgQupAolW0XZnOBriSByqkKF2oohGwERYY+TITVZIruHIXU2mEr8KW+
         0ARbUPRtdIh6aDuqAHqqV97dRsVTFotHBi65pTBxV6sn3EG3CEm1PUfXKgcNB+ZnCAMg
         hR0G89G5koUMf8mldUt8qNjXgKBugonIwnWpicryetO6XlDkNyPxTy1zOY4gydskdib8
         humDyJjZ5gKzqEp8JG5tMGpKi750/CszHqsuv7Mp4bVVkviNLnClx0PHtQiQHUKJlMpF
         wLhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=G/FqBOCVIF9ma6GicFqYM/SLMCPfzuwOf0Jmg2AGYWE=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=WYPXo+c6PS2x5xkyZ2U4GL/CYnTr/WrCVdJegGLvd6NqLa8MG3ThyG6lnwUPqT34hl
         BBWTyNnKBEtN5F13klYMiDxAkglK4wC+hGlhGqtWHpsYLI5A8A/+7nzf6GsA4Y0rEXpd
         SsVZ8UOmDeThAPvQi8UEpvWAe33wBTCnzh0dkJ20CoeKbCD8tM7MimLiiyIcUXoGO9PV
         xmnSFhG7fBUNmYqdY/h/GcoH4vMb9Bij81xtzUFu4+kgRwfTXA4JJ+yyW/i14TMAHCKU
         Y0y1aqY7wJTKjFgp6m0/2iOJT4v8IuY1sl0okAICHQuvgmMvga+MlVV5CpPq3rF0jWPb
         z50Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751dafa066si9112771cf.280.2025.03.06.02.48.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 02:48:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tq8dM-0004vJ-C6; Thu, 06 Mar 2025 05:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8dK-0004tw-4o; Thu, 06 Mar 2025 05:39:18 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8dI-0000St-Ec; Thu, 06 Mar 2025 05:39:17 -0500
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
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v5 09/29] hw/arm/aspeed_ast27x0: Sort the IRQ table by IRQ
 number
Date: Thu, 6 Mar 2025 18:38:17 +0800
Message-ID: <20250306103846.429221-10-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: 7nvg4Lsd2sol

To improve readability, sort the IRQ table by IRQ number.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 50 ++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index de79724446..abd1f6b741 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -74,27 +74,13 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
 
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
@@ -103,19 +89,33 @@ static const int aspeed_soc_ast2700a0_irqmap[] = {
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
2.43.0

