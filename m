Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp728985njc;
        Wed, 12 Mar 2025 22:47:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXieafZlsaOuJX+PvCAbmvp5iQX2JGG6Hkictxspz1sglz3RkMV1suQLuWPYcJ68n2A/zTMlDb/U6z2LA==@linaro.org
X-Google-Smtp-Source: AGHT+IF4G55sm24WlIBDVmsaN3lyfctcF4Carb02bQYNq0gMOSrNYA8S/CZwtDvOPEpbUqoWO5Z0
X-Received: by 2002:a05:620a:2786:b0:7c5:5f38:ba4b with SMTP id af79cd13be357-7c55f38bb93mr1602963885a.10.1741844823879;
        Wed, 12 Mar 2025 22:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741844823; cv=none;
        d=google.com; s=arc-20240605;
        b=KP+0rQfJS7wImceN6YGSoBnDNaA44D6P0GxV4/m8Of5W0TUqjkWQVPMv7bvXZJEOoL
         ZRqOMQk97cvTPUl9/ejCgDxtin3WFsVvGmYvy9zsOaoEpu2nCJEKLo4WKXfidE9VTFgK
         XeJds1ZbIIq7BowfI7o2bRBt853bWHYRD/D8PbumSmUzoMEqrOagN7Csb1mCvW54vny+
         XT3azpw114ZRMTdiBQP8pbaH+c7fOrBpIJaHKG2gcKJ1zVWjk0NCXkpIla87A+axLQFA
         s/Gw3nyj2MhpmpFoZO1B6CrmmRS0Tw54qIu+WrMT7wNQMugQ65I1g5APIhXpDC339fdp
         77oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=UxHEZSfNdcYewBLnAJy5RuSY4mHlv1M7RSG4hAGwhwE=;
        fh=NwMdySSevMv+4zB5gT5UiU9uLqpwDS+7odbjbNLg6yI=;
        b=hDfwF8UzEOhiKFOn3Lk5VOu3asKnGQ3GFpxJsJKfi1D5nJXyo9fRW6sr5zglvANGRx
         mbglUrnD0FWnwZEUGl71Q6a0ww+4+YOuEqgfqDYFQSL7fXF4qF4RIL9RqRKg/4R5Fs+i
         ZWbfRP47M2keHounQ4YOFNQWtXWS3crlUPYbpkRsNIDzTR4i0Gst10JNjKCwNDJTJno2
         hjj5UCpVvFOECo/gUbBAl1j0cvaGiJzNOdI4EJrcZu5KraJPS7R3MKDuUiHZUxsa3Mf0
         oYKXNbdKPxuvVREnD0gb1B7DgR7oaxjp1SvA/zr9LDNDC0AZqzqaZzOzERAQpmaMYIpx
         ePbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573d1ac7esi99899285a.507.2025.03.12.22.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 22:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsbOZ-0004rc-6d; Thu, 13 Mar 2025 01:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tsbOB-0004nh-5l; Thu, 13 Mar 2025 01:45:54 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tsbO7-0005Ve-1b; Thu, 13 Mar 2025 01:45:49 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Mar
 2025 13:40:21 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Mar 2025 13:40:21 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <yunlin.tang@aspeedtech.com>
Subject: [PATCH 02/13] aspeed: ast27x0: Correct hex notation for device
 addresses
Date: Thu, 13 Mar 2025 13:40:06 +0800
Message-ID: <20250313054020.2583556-3-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313054020.2583556-1-steven_lee@aspeedtech.com>
References: <20250313054020.2583556-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 33751RHgMeda

Corrected the hexadecimal notation for several device addresses in the
aspeed_soc_ast2700_memmap array by changing the uppercase 'X' to
lowercase 'x'.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: I45426e18ea8e68d7ccdf9b60c4ea235c4da33cc3
---
 hw/arm/aspeed_ast27x0.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index a3fe2582f8..b4e4c5e4b6 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -43,7 +43,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_RTC]       =  0x12C0F000,
     [ASPEED_DEV_TIMER1]    =  0x12C10000,
     [ASPEED_DEV_SLI]       =  0x12C17000,
-    [ASPEED_DEV_UART4]     =  0X12C1A000,
+    [ASPEED_DEV_UART4]     =  0x12C1A000,
     [ASPEED_DEV_IOMEM1]    =  0x14000000,
     [ASPEED_DEV_FMC]       =  0x14000000,
     [ASPEED_DEV_SPI0]      =  0x14010000,
@@ -62,19 +62,19 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
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

