Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1101220njc;
        Mon, 30 Sep 2024 01:53:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUu0g34mTJ4cQrnrOis1k7MheQd0rjJVdK0/SYum6xMNID+1OEfy3+19IuPCAGVVxrEnw+AAR6PsbfpyQ==@linaro.org
X-Google-Smtp-Source: AGHT+IETg+agp4KE2es5YHQXfa6Eh3a19RMjomX+OgCji4EN30+/oY/bxGY7xa5yhKNjC38wbXrt
X-Received: by 2002:a05:620a:370e:b0:7a9:c31f:e4df with SMTP id af79cd13be357-7ae378245f3mr1948832985a.6.1727686407356;
        Mon, 30 Sep 2024 01:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727686407; cv=none;
        d=google.com; s=arc-20240605;
        b=aFr9oH9wzn7rqSrkSp0bjew0PVWmwhv6GRgLtFpI6VXIRxa75e3EElJu/nLU/TzM45
         Qz8ml2bhPYr9gG9+ooARqDRgd1seUPZu66C4oESlV4bD5Yh7XY62DUQ52Zo9JHjG+LmL
         +kJLkdkHczwYeMei7Yh67apbqXRl/IJYotectNLWBwW5AExWHdfzVL4OPQmY5X8AF/gb
         tEdxct50ssY6kGVpRX0fF+WAVt54J54UuMboe2rBbJz6qTJWq8xRsWEYuXBpUOPOK1LS
         XIxYvC8GmzSKLrTI753TZPw1hVRq2oBFSLNhTmx2jE6tA0qHDXtZCc031PraNp6fDuEI
         LbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=G93ryOSawTmRm05R/Fy26+Z+ZiYCBEmYHb9uZu//ObM=;
        fh=bfdvnURtAD34fQ77QeZnvwdM4/zSvHk1Doa+KIkv0v8=;
        b=eJDqzdPXeq7+83yCLP1IyfLoUjVQ/AJHAD6iIPTQvOnXMDSTDtGaVk+p0n7yr2+6rq
         A5szlLRVcdZ/nzUmPoPnuvCLW+ACvk9kRUSK5RU8ldNsmr0ktceRkY8lVKMFW979KMV3
         /GsvhNM33G0gVLkGYUiHHmkNVauBEUv/6uR7VpE0B4mmL75O0MXHLxiThlHUS86mMbfj
         XYeXdBcE1zpRWQ3vja+QQR3z4wahv98353dK+7iM3hAvz3uAl17NU2UuGaZ7/K7j43Wk
         4vv7xQDdkfY4oQioMr/jxacI0187rApwGrBlU+EYchN28mWWLxVBjAOUELLCKCIKrqst
         9uRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae37871d7dsi800849785a.684.2024.09.30.01.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 01:53:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svC9k-0005E4-RR; Mon, 30 Sep 2024 04:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svC9T-0003pr-9R; Mon, 30 Sep 2024 04:53:08 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svC9R-00025U-Bs; Mon, 30 Sep 2024 04:53:06 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 30 Sep
 2024 16:52:41 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 30 Sep 2024 16:52:41 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v6 6/8] aspeed/soc: Correct GPIO irq 130 for AST2700
Date: Mon, 30 Sep 2024 16:52:37 +0800
Message-ID: <20240930085239.3089901-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240930085239.3089901-1-jamin_lin@aspeedtech.com>
References: <20240930085239.3089901-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: rcaVnku5WyUA

The register set of GPIO have a significant change since AST2700.
Each GPIO pin has their own individual control register and users are able to
set one GPIO pin’s direction, interrupt enable, input mask and so on in the
same one control register.

AST2700 does not have GPIO18_XXX registers for GPIO 1.8v, removes
ASPEED_DEV_GPIO_1_8V. It is enough to only have ASPEED_DEV_GPIO
device in AST2700.

The AST2700 GPIO controller interrupt is connected to GICINT130_INTC at
bit 18. Therefore, correct GPIO irq 130.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 761ee11657..99135edc1e 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -87,8 +87,7 @@ static const int aspeed_soc_ast2700_irqmap[] = {
     [ASPEED_DEV_ADC]       = 130,
     [ASPEED_DEV_XDMA]      = 5,
     [ASPEED_DEV_EMMC]      = 15,
-    [ASPEED_DEV_GPIO]      = 11,
-    [ASPEED_DEV_GPIO_1_8V] = 130,
+    [ASPEED_DEV_GPIO]      = 130,
     [ASPEED_DEV_RTC]       = 13,
     [ASPEED_DEV_TIMER1]    = 16,
     [ASPEED_DEV_TIMER2]    = 17,
@@ -124,7 +123,7 @@ static const int aspeed_soc_ast2700_gic128_intcmap[] = {
 static const int aspeed_soc_ast2700_gic130_intcmap[] = {
     [ASPEED_DEV_I2C]        = 0,
     [ASPEED_DEV_ADC]        = 16,
-    [ASPEED_DEV_GPIO_1_8V]  = 18,
+    [ASPEED_DEV_GPIO]       = 18,
 };
 
 /* GICINT 131 */
-- 
2.34.1

