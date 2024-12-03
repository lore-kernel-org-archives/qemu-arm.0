Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3372927njk;
        Mon, 2 Dec 2024 17:53:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVy2aQOAMNoKBU/2c6KukoLXFHtb8QqbJo23qD5wr2gBmbVkp2TBRswdeEomobZaWQ/ViHw141BM663bg==@linaro.org
X-Google-Smtp-Source: AGHT+IGoEIHZ8P+WK+bSadl88YohSJErj4AAcZ8eHcjrnmHfUudKE9SQEBcGuOMV95UXR4yxCzM2
X-Received: by 2002:a05:6214:21e4:b0:6cb:5605:ffb2 with SMTP id 6a1803df08f44-6d8b7353753mr15301036d6.24.1733190819476;
        Mon, 02 Dec 2024 17:53:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733190819; cv=none;
        d=google.com; s=arc-20240605;
        b=OiWDzzXv+/KgQkc1f/Q9ACzKv9UUYYl3b4usIS9bfSMvHDTZpb8pFUBGK7EU1dFGB2
         6UYG3czte6JQPn6+ADa5USCtLeSDJs3sbSDnNecGoSNcHmtgL2qV1tujLIaZmZfm6vJu
         HTkrPZ9F+z1bsdqLPJ6oIos1ZbFhRLuv7GkYpZNix5PHsp9caLwxdtXwy02843ja7LUk
         MMLbfYB15f8Wo1ZdZdIdtFoN+hYQ2cUPVRCuWCyWKDEyx56nzOM4j1g+FfejyHgw9oUP
         5guWLCbaZKKbJJXSdLfm7YZGFKm2+LQRwK2LISP4sqAXcFMtwRCaJU1RMI2/HfRHRfLH
         6L2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Sdj27LjMpSo7UuDMbnBHmV99BByF7NAieVVXloNuVow=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=EN20Q6jyw39qMFc86gcJXfzf0gbPJNTBosM0mTH4AZrxoV229+qu66wPWAt5m6/Oag
         6LzB8F28J9+4a/PyTqX8MpB8xJ59BJGdA30aDGs0802FSVpNjb5xOToZReuZY4ROW5PE
         8RKL9e0n66ZQNIqKrd4ob8ZGDnkpUdQ/qDLqQhnIZSjXhvRk/hQP2VriGgfbjaB2Bq7w
         A9nt0BgkVt76TE5tBUlrxxbavlX028xw6m3a/ypGkFJBiq6kqNvxszFlaPMlFPCa7XDC
         6ALpkJRNoKHThea5y3BqveCq8qGvoOKqIodH8U7iJjLr75Z32aCR0JdF5VkavxTydfhc
         g4mA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d89cd78598si58938406d6.403.2024.12.02.17.53.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 17:53:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tII5i-0007Ln-Sa; Mon, 02 Dec 2024 20:52:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tII5h-0007L0-8K; Mon, 02 Dec 2024 20:52:41 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tII5f-0006Sd-VA; Mon, 02 Dec 2024 20:52:40 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Dec
 2024 09:52:25 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Dec 2024 09:52:25 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 1/5] hw/arm/aspeed: Fix coding style
Date: Tue, 3 Dec 2024 09:52:20 +0800
Message-ID: <20241203015224.3985820-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241203015224.3985820-1-jamin_lin@aspeedtech.com>
References: <20241203015224.3985820-1-jamin_lin@aspeedtech.com>
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
X-TUID: 6UkNoUnHoe35

Fix coding style issues from checkpatch.pl.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast2600.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index be3eb70cdd..c40d3d8443 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -541,7 +541,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gpio), errp)) {
         return;
     }
-    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0, sc->memmap[ASPEED_DEV_GPIO]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->gpio), 0,
+                    sc->memmap[ASPEED_DEV_GPIO]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
 
-- 
2.34.1

