Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3385349njk;
        Mon, 2 Dec 2024 18:16:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVzbBdd4vX4IX2KcvtIszmQ/h4BEc/aqmmZvLbj68ryN9jaCmuoLCSdpBj3C6B7yfki32rwPpJlLRf13g==@linaro.org
X-Google-Smtp-Source: AGHT+IGjda+DvN1lDlfdBNeCOAmqN6nSkt3o9lJdiYOV/jQpCCA7urmu75k0SduGmhxEoejp+gsN
X-Received: by 2002:a05:622a:19a9:b0:461:253e:cb8b with SMTP id d75a77b69052e-4670c39aa6emr8074711cf.35.1733192176378;
        Mon, 02 Dec 2024 18:16:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733192176; cv=none;
        d=google.com; s=arc-20240605;
        b=J7umEsMxcA893c86gg9RtFOzbx2LFLOEvKTWh1nbmrnRmziRfl0liqZzj3+03vyDcm
         Cihgp39hK4Qu++NuQzVRRAOOu7ZqYncPiZQ1LmttGvwNrZ/CO3w85plur34PvcFywLg5
         v8bk4wJfG4HF60Dv0NjxmrxpwToQZ2FWwm/EmuuFHy7MBH39IwNQscl+mBCfEAM1UVai
         qL9nnsPrtUtjYmhFx/mEf0xS2gKWPDh9lrc5GTJC5trbp50ibQ7uTalSzrJpdOw6sXJp
         5dCtYHLNdDGCPMX8kvXWh5rKxoPHpl/3JN1HN0FhTYlIPOIgMwou3ywvVTbwhLNDcKdF
         wwAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=tPzxkIRETB5WWN7u2F7fZ2Jf5zEMmaPXP72k0zz7xOM=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=YZKjwGkTz8igzTIIwmPc8Hpg6KblZNjmkY4GkaRZs4U2W8tRfjI8EIg1iIW8rO6Ev9
         vDaPwN7XB2aRY/y+W0GfuZ1T6qSjVh0cijsC7tXRptxDF6EXj3jUoq1AiEAn7hKxGVKF
         y2Y9Y/V6U1y9v6dszPSZoJgr82TLlT6hRuGluiY9pMW7jB7XkriUYENhqMSKPT9zNc1t
         09Dy9cWTc7250qI9ZC2BhmCPMkHNgW3Ialcuqne6RztiIjCfDgd0ybnjwxnOcRaOVc72
         /RWSIUS0uSltT9O7/haDiSHvMYkNKoB5C6/IVEQ2DyzCKNjavlz3+Izgml1iw0SC50XF
         PyqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849b1cfasi1492666585a.213.2024.12.02.18.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 18:16:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIIRd-0005RJ-Mk; Mon, 02 Dec 2024 21:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIIRV-0005QB-NI; Mon, 02 Dec 2024 21:15:15 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIIRT-0003dt-Ov; Mon, 02 Dec 2024 21:15:13 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Dec
 2024 10:15:00 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Dec 2024 10:15:00 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 1/6] hw/sd/aspeed_sdhci: Fix coding style
Date: Tue, 3 Dec 2024 10:14:55 +0800
Message-ID: <20241203021500.3986213-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241203021500.3986213-1-jamin_lin@aspeedtech.com>
References: <20241203021500.3986213-1-jamin_lin@aspeedtech.com>
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
X-TUID: ZzHEiKd4QpvZ

Fix coding style issues from checkpatch.pl.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/sd/aspeed_sdhci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index 98d5460905..acd6538261 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -87,10 +87,12 @@ static void aspeed_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
         sdhci->regs[TO_REG(addr)] = (uint32_t)val & ~ASPEED_SDHCI_INFO_RESET;
         break;
     case ASPEED_SDHCI_SDIO_140:
-        sdhci->slots[0].capareg = deposit64(sdhci->slots[0].capareg, 0, 32, val);
+        sdhci->slots[0].capareg = deposit64(sdhci->slots[0].capareg,
+                                            0, 32, val);
         break;
     case ASPEED_SDHCI_SDIO_144:
-        sdhci->slots[0].capareg = deposit64(sdhci->slots[0].capareg, 32, 32, val);
+        sdhci->slots[0].capareg = deposit64(sdhci->slots[0].capareg,
+                                            32, 32, val);
         break;
     case ASPEED_SDHCI_SDIO_148:
         sdhci->slots[0].maxcurr = deposit64(sdhci->slots[0].maxcurr,
-- 
2.34.1

