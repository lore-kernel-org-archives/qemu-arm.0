Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp209655njl;
        Tue, 1 Oct 2024 07:13:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhkjWzqVLiG7LZdNm1IgQ5zDDsygdxfN/Vai8RT/TOMg5CuuqrN8jFnAMx/0b2nALTxo4oh1UWzAs4Uw==@linaro.org
X-Google-Smtp-Source: AGHT+IG72TeOWta9BKXT2TZYRcOzKsvDR2ssehAk7+vbXB6DeGy+yigThVLljpO3fR61X0gN6uyc
X-Received: by 2002:a05:6808:3a09:b0:3e2:6d81:1c0a with SMTP id 5614622812f47-3e3939861e5mr10350749b6e.27.1727792027053;
        Tue, 01 Oct 2024 07:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727792027; cv=none;
        d=google.com; s=arc-20240605;
        b=DhieJnIYp35mhZAtOMdTmgMNyvGA0ToeUqlW5MMl8g73z3ovPUh6cI5P8ZZYV/z8ug
         r9eOvmHDwBbJj4edY9dnGRi2uok9ET+fpGQwStbNcyKKp1BKYutZlHDV1MkI5EdruWMe
         +p+dWCnuEKiKlittUeZUDi+MWW4WZ5MRzzUpfNfJEtfRkbL3ih4Bvkn/qoM4aEDsdJo/
         S611vFmud8V3ylXXYUBnmMBjVagbLiQtl1/c0fDpEkZPjG1ctrmH0e0TKj42VsLQqHN+
         eght0l4hL14LmXQSkWArGU4RAzT2btXfWWRA7j8F4nIWXSL21IZl131GKPgkFPJg/psP
         h2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=8WyRANg5BvgWreVGOfqG0vhqUbn/aWYycvZXoUj4rnY=;
        fh=RdJersRTvVIU6GkG8yrSEUovA6vfgZWQMb4aw2HkXSs=;
        b=b7TSHB6TpYFHoUt/s0nC8awUZSw3gw/UydxRTf0lB6Wj8Y364r/gE+4C811eHbwctE
         Aux5bMV+eE5SuRxAJxjUydN1oGfqzv9hWgy2IiB9w9METHIQz3QYIxifDbl0oH6BXk6+
         gSbXXggVqhj/W+Iv4/o6hQjTJS6ha5nqKyCDXqNfE+Na4oh5gNwIx4jvoGgIPg/Dc79C
         8KUNs9ysCW2Z94AdA8D9BXokS/LjWMzgXRd+jGHySm92e0pe/MFi4W6dJjqLNFe59+qK
         1bafbtTn6CImg0ew3rv+Uky1pmilKuxApIpZ0ssAEeFqIThnCW3D+kBCE0omi6sx0IH8
         P/WQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-84eb1fc6e25si1783512241.30.2024.10.01.07.13.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 07:13:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svdcB-0008D7-9v; Tue, 01 Oct 2024 10:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svdc0-0007oj-7X; Tue, 01 Oct 2024 10:12:29 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svdbt-0002zy-TS; Tue, 01 Oct 2024 10:12:21 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 1 Oct
 2024 10:43:36 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 1 Oct 2024 10:43:36 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v7 6/8] aspeed/soc: Correct GPIO irq 130 for AST2700
Date: Tue, 1 Oct 2024 10:43:32 +0800
Message-ID: <20241001024334.834807-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241001024334.834807-1-jamin_lin@aspeedtech.com>
References: <20241001024334.834807-1-jamin_lin@aspeedtech.com>
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
X-TUID: 23jZjAUvM2I1

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
Reviewed-by: Cédric Le Goater <clg@redhat.com>
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

