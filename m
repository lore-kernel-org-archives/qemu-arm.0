Received: by 2002:a05:7022:6a3:b0:92:a90b:6588 with SMTP id y35csp63264dly;
        Thu, 23 Jan 2025 00:20:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV8L3OGqtxL+drc0D586+i8eJbTBwHzZgxD4LV1lnWevWUPDC/ozOHbBhiy75Osa8zZ50u61eBPEnznBA==@linaro.org
X-Google-Smtp-Source: AGHT+IHRcoxdCsxr02+ycGl3Q9WVjqLwmPYQ4lliuYuc4LO4dtd4Ak4fbXAFFItSBLcHuWgiUEby
X-Received: by 2002:ac8:5703:0:b0:467:5d5d:fabf with SMTP id d75a77b69052e-46e12b6f80emr355128611cf.25.1737620404577;
        Thu, 23 Jan 2025 00:20:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737620404; cv=none;
        d=google.com; s=arc-20240605;
        b=Qf4jL4Tf1OZnej6awc83nYS6cNXxIgZpJDDnr3OSv/3TZFidJ5TrYZ5pFnH8xJjR+M
         bmZ2yCuSJYuBnoQvT+gs+LmETN7fxinoATnysp3e4tBaeenyP4JWaAaxN6aTO7k89WEN
         E4PR/fyobxjtQgn79O++Bs55uQ4BGRfxQuyrz4AMugCkPpsmwNZnmyBDK9P6KMEguD3O
         yzFK4kqMeMvfm3/1zEDVIz/tL/eoLeIdYdcSy81+eSTzsfN6CtR51QTUIUH7DXkFcLN4
         8pixZldNxsmoiDy6L8RdsXjSf/jKM9i+cBYaPatw01uG22PUFzgIOe/basSO9r9mMEdr
         axVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=UrbVVixbIakDJGdvOVy/KZsLk+6I8NRGL04uBJHajdw=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=OC+2IvbitYpYRe+AQe1ARPUScSEdtDS4zUHX6c8ZA1mIrfbkeBwnoBLMtMSixyNvBW
         qiQP4+gyjmyL6R9NRzrDH9vbbXgwUUJOLuhxUmKi85cWTLaDm27Qx3MEGGYOaEZ72zKO
         81iwQGUoYTyPIm9qrYq3TL4tWf03d0k50nxm3nejotLqiVW1y3EQRpiTPn5YNvA0lg83
         6tJWpZuvUTRw/EGdZc/5MrZBY0ZX88Fq6GNwpqc/fPr1Y1ilBlGZ3BfdfD1YrG+J6Az8
         akfQWExWdN8+S6dkFvd/2hZqT8uWBUwE/vGCx94P06KJjO9PjN/llc+IsS/OlaGdddok
         xuaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afcd9df6si174788836d6.233.2025.01.23.00.20.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2025 00:20:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tasQq-0005IS-Dp; Thu, 23 Jan 2025 03:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tasQo-0005Hi-Kb; Thu, 23 Jan 2025 03:19:18 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tasQm-0002Qj-VB; Thu, 23 Jan 2025 03:19:18 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 23 Jan
 2025 16:19:01 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 23 Jan 2025 16:19:01 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 1/2] aspeed/wdt: Fix coding style
Date: Thu, 23 Jan 2025 16:19:00 +0800
Message-ID: <20250123081901.2688471-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250123081901.2688471-1-jamin_lin@aspeedtech.com>
References: <20250123081901.2688471-1-jamin_lin@aspeedtech.com>
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
X-TUID: c4xr5YPtc/Dc

Fix coding style issues from checkpatch.pl.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/watchdog/wdt_aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 81f5c5189a..22e94e7b9c 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -278,7 +278,8 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
 
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_expired, dev);
 
-    /* FIXME: This setting should be derived from the SCU hw strapping
+    /*
+     * FIXME: This setting should be derived from the SCU hw strapping
      * register SCU70
      */
     s->pclk_freq = PCLK_HZ;
-- 
2.34.1

