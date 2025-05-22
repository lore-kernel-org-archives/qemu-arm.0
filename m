Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1583799njc;
        Wed, 21 May 2025 19:34:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4mDSBErFa9E3IrW44p2SW9wft6/M9YmBMOIdaTpWdOwraYpB2RTOax0Z4S0cit+H4bkT/DJpWamkxBg==@linaro.org
X-Google-Smtp-Source: AGHT+IHVTZsddMh+hBZDSfxhDRz1mdzL/3796qqhNEdoOgk7oK9Og9jAjrXOS3hfle62XfnDVKOF
X-Received: by 2002:a05:620a:372b:b0:7c5:a2f8:e6e4 with SMTP id af79cd13be357-7cd47f46587mr3051009585a.29.1747881258348;
        Wed, 21 May 2025 19:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747881258; cv=none;
        d=google.com; s=arc-20240605;
        b=Aam/WMbj8mnhQ3qq+5almmLWdGpN4jQWvL6PqkM1ZvmYglpw9JQ+GCtZZFSCpiF25m
         m7MZq0HBQe8+QYJW/9CuLrCki6c+lk7mUWod6eDhIeTDZ66NF6jmG5WDNDvNIlo85ci2
         c59S0zelJGQJC438lvdVMRH4cW2zvn2nhP3PYTPP3mcu9sZ9b/2thXItmeTOTvAmDsI7
         mZTmSGT1OI9+rKNkg9M+SfgGjBmBFn9fvBdG5SWoRhw00WRdT44IOQ9xAY2Oj4l09Mt5
         h98wIVjpN5x2xLJQs0Nh6XhbxG/bQcbV6L5BIhwgHUTHg0DztfCPC0f0U1xSUw5bzT7F
         twcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=JPn/Da6Yt1v2f3NSp2pRU7PCUxWln2xc85BIsJkeba0=;
        fh=no4a9QA/0zeIocEYrBrieE6XYIGB9KPekpO3W6wNjNE=;
        b=h/kEXtl0Myo7f7i8zI8+fOrky+KMyF0YpjB4gTn1hcINTWMpc+BxeoJNX9dLCR0xTi
         WR1iuKsZK6CDmShg6rD8SS2ReBrV806hKIMGvZXY36j/lrOOiLr6XAy+w3Zt48rNpvLD
         5a8OWZ9/amWsnXWwuTaNoOMyHQrcri1SJG+ycJdF9XHDO+HBtH2ZR6WBlsp5sTBnesvT
         8nrtHIfJWlAZ3QpeFTyHLb41U4jsRmUaN6fJh0BhReTzcgDb5HYxxjsLnkjoiWinScY3
         L1XKLFc3Ww79g24H10crIsu88kxPgotUalc1p8cIAejuuywTlosPeN8StGvJo/FBmCbz
         P7aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae57c0fesi143474691cf.432.2025.05.21.19.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 May 2025 19:34:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uHvkc-0003MR-Dn; Wed, 21 May 2025 22:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uHvkJ-0003JB-1n; Wed, 21 May 2025 22:33:23 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uHvkH-00010W-8S; Wed, 21 May 2025 22:33:22 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 22 May
 2025 10:33:05 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 22 May 2025 10:33:05 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2 2/3] hw/intc/aspeed Fix coding style
Date: Thu, 22 May 2025 10:33:03 +0800
Message-ID: <20250522023305.2486536-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522023305.2486536-1-jamin_lin@aspeedtech.com>
References: <20250522023305.2486536-1-jamin_lin@aspeedtech.com>
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
X-TUID: VVnSWPbrqj7O

Fix coding style issues from checkpatch.pl.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/intc/aspeed_intc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 19f88853d8..5cd786dee6 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -1001,7 +1001,8 @@ static AspeedINTCIRQ aspeed_2700ssp_intcio_irqs[ASPEED_INTC_MAX_INPINS] = {
     {5, 5, 1, R_SSPINT165_EN, R_SSPINT165_STATUS},
 };
 
-static void aspeed_2700ssp_intcio_class_init(ObjectClass *klass, const void *data)
+static void aspeed_2700ssp_intcio_class_init(ObjectClass *klass,
+                                             const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedINTCClass *aic = ASPEED_INTC_CLASS(klass);
@@ -1069,7 +1070,8 @@ static AspeedINTCIRQ aspeed_2700tsp_intcio_irqs[ASPEED_INTC_MAX_INPINS] = {
     {5, 5, 1, R_TSPINT165_EN, R_TSPINT165_STATUS},
 };
 
-static void aspeed_2700tsp_intcio_class_init(ObjectClass *klass, const void *data)
+static void aspeed_2700tsp_intcio_class_init(ObjectClass *klass,
+                                             const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedINTCClass *aic = ASPEED_INTC_CLASS(klass);
-- 
2.43.0

