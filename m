Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp748820njj;
        Fri, 2 May 2025 03:36:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEFYC4c4g4mLc8AKU4ccwJ7zsgAknG5OPCOvXftz8dR6HiwGNDMkRmMobtb0IaKBkN0b1JhzBAzusKjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFK0aBxRJQGAS1tUlcrFym1UZvtL9o35IG7CVE9QwJbxtyUAAnDQHXpG1we5bMQD8YLPY3U
X-Received: by 2002:a05:600c:3d05:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-441bbec39f9mr22753845e9.15.1746182197799;
        Fri, 02 May 2025 03:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746182197; cv=none;
        d=google.com; s=arc-20240605;
        b=SQ9KfLpazu6r/6UJ7qlbqP9aEFe6XlcJcKJXta43FbxizFjzSk9k9ERTNhC/gqPSni
         rVyWG1Bx0989dLS2McZqWm0LI+kgp5qLn/ZXIXoHLLmQZKFpS7Ctr+Gzpe1zS7rdfECp
         JizB1bA9U+dlADrJfxIBHgsCYUdQfQx9xs1892INM4td0/f8KuYzNXs4Y7X/szLKECfm
         yR2OVwXpOYImFI1y4v9pZxwWnxUjVksFy4IeJ+/x2WXc7n5xO1Iq64yv/XNpdpYzWFMI
         RB1LhnIEjjY98mtFntHAurc7GjjqVUs7nqqXsxXUtbn1uT5IEt4XpIgAI0zxFnUAXe3f
         L0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=l5jY3V78IY0rth+qtodp73vu1ofpTXlGQHKyWSNxD+w=;
        fh=vQPqsNMqoAlDx9Lray1TJhxW/ME1Lx6izgi/4Tj22z8=;
        b=Xr0bM4mjeirGNGHl9D2Du2GvqsE1I3SnUpHwfDxlkur6X0d0lPlb0gN6cZ+P5av/3z
         L+NRdrJWyGwJ9SuQymgzZSCXNzUxlfyiacxZ98NXLDlG6y7H6BsloVZ/O6c3uJoHmON6
         ZI/wcqY2tYzKjFIusgPoOrVzI53/RIxzaeG/jFIu9YbYZ9z3Pt9VeUqRVRxlaa9ajRHv
         A/vnMwkA3z4GwQQwDAVgBxqGKO2By5Jtoski/7IztySwptPyTlaKMD0cDGXkBuKDYqUz
         mJ9BR5lCgLOEEh8lyC+jabSBNzUcx5+w9Ju6q2HysYc3hKZ5+MY+hoFpsr/8kZRBY5ap
         4W1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-441b2b218d5si45711765e9.110.2025.05.02.03.36.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 03:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAnjy-00086n-Ek; Fri, 02 May 2025 06:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uAnjW-00082Q-ND; Fri, 02 May 2025 06:35:08 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uAnjV-0005yi-A5; Fri, 02 May 2025 06:35:06 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 2 May
 2025 18:34:50 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 2 May 2025 18:34:50 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v4 2/9] aspeed: ast27x0: Correct hex notation for device
 addresses
Date: Fri, 2 May 2025 18:34:38 +0800
Message-ID: <20250502103449.3091642-3-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502103449.3091642-1-steven_lee@aspeedtech.com>
References: <20250502103449.3091642-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LMZuwIL6Myt8

Corrected the hexadecimal notation for several device addresses in the
aspeed_soc_ast2700_memmap array by changing the uppercase 'X' to
lowercase 'x'.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: I45426e18ea8e68d7ccdf9b60c4ea235c4da33cc3
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 21769669df..1974a25766 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -46,7 +46,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_RTC]       =  0x12C0F000,
     [ASPEED_DEV_TIMER1]    =  0x12C10000,
     [ASPEED_DEV_SLI]       =  0x12C17000,
-    [ASPEED_DEV_UART4]     =  0X12C1A000,
+    [ASPEED_DEV_UART4]     =  0x12C1A000,
     [ASPEED_DEV_IOMEM1]    =  0x14000000,
     [ASPEED_DEV_FMC]       =  0x14000000,
     [ASPEED_DEV_SPI0]      =  0x14010000,
@@ -67,19 +67,19 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_I2C]       =  0x14C0F000,
     [ASPEED_DEV_INTCIO]    =  0x14C18000,
     [ASPEED_DEV_SLIIO]     =  0x14C1E000,
-    [ASPEED_DEV_VUART]     =  0X14C30000,
-    [ASPEED_DEV_UART0]     =  0X14C33000,
-    [ASPEED_DEV_UART1]     =  0X14C33100,
-    [ASPEED_DEV_UART2]     =  0X14C33200,
-    [ASPEED_DEV_UART3]     =  0X14C33300,
-    [ASPEED_DEV_UART5]     =  0X14C33400,
-    [ASPEED_DEV_UART6]     =  0X14C33500,
-    [ASPEED_DEV_UART7]     =  0X14C33600,
-    [ASPEED_DEV_UART8]     =  0X14C33700,
-    [ASPEED_DEV_UART9]     =  0X14C33800,
-    [ASPEED_DEV_UART10]    =  0X14C33900,
-    [ASPEED_DEV_UART11]    =  0X14C33A00,
-    [ASPEED_DEV_UART12]    =  0X14C33B00,
+    [ASPEED_DEV_VUART]     =  0x14C30000,
+    [ASPEED_DEV_UART0]     =  0x14C33000,
+    [ASPEED_DEV_UART1]     =  0x14C33100,
+    [ASPEED_DEV_UART2]     =  0x14C33200,
+    [ASPEED_DEV_UART3]     =  0x14C33300,
+    [ASPEED_DEV_UART5]     =  0x14C33400,
+    [ASPEED_DEV_UART6]     =  0x14C33500,
+    [ASPEED_DEV_UART7]     =  0x14C33600,
+    [ASPEED_DEV_UART8]     =  0x14C33700,
+    [ASPEED_DEV_UART9]     =  0x14C33800,
+    [ASPEED_DEV_UART10]    =  0x14C33900,
+    [ASPEED_DEV_UART11]    =  0x14C33A00,
+    [ASPEED_DEV_UART12]    =  0x14C33B00,
     [ASPEED_DEV_WDT]       =  0x14C37000,
     [ASPEED_DEV_SPI_BOOT]  =  0x100000000,
     [ASPEED_DEV_LTPI]      =  0x300000000,
-- 
2.34.1

