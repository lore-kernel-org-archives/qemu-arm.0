Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp33069njb;
        Wed, 4 Dec 2024 00:05:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXwVeu1NITtVyNOT2uKdW1QyPKmfsShVFu2MLlMdStT4BpAr8x1Lsvx93Pz+wbRdzIHfx5LJk4jCyNJKA==@linaro.org
X-Google-Smtp-Source: AGHT+IEa1Y7C62CxLfbspEMRAIYWV8nXtIHt3WvgTS5SMpRXUJdASJ+0a+SH2wAT65lnmXNjuiW2
X-Received: by 2002:a05:6214:518e:b0:6d8:b3a7:759e with SMTP id 6a1803df08f44-6d8b7476d9bmr79553296d6.46.1733299555856;
        Wed, 04 Dec 2024 00:05:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733299555; cv=none;
        d=google.com; s=arc-20240605;
        b=aMx7Zwkq8/7Wu7mHPtlk1kvSVugiFc8FOTD60mI/8fXDE0AdUWw94gCezikXWWKB8F
         K25MZ5idwyMknaHBdvucUca2axt8t0O6aTaiTa9REckdeKyjxioOv5RuxknDad0v1Cdl
         /PzWd9FVyIUx0I8iqhYd/CYqfZUldeKcYdpxe6WytYUfJ3Y22WtNamhkK9Dxb52vCxp+
         8pz2q+do773N2cnnAFb8YfJYt8pJKwPDDuA5W0NBbuk99cn6Up56nnkyZ0VqUsCBzHp9
         M40bn2PCUOQO+iY+aOZ13cBLVW7vv5DOTYB5GKaAqRpc3vS7GnhF5arbC22xMabuE9zs
         6+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=tPzxkIRETB5WWN7u2F7fZ2Jf5zEMmaPXP72k0zz7xOM=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=OetMi8dW+OdMbZXCnqxf7pSFFEmxfErcp6EnTZeJEcfHaoutyDgiPzrxW6kdcWhvSN
         NpG9umq38k1qnYpZTu3hCUzYFfuXdz0p4J4ktOEJEowZexsErUkcz1McYtwcPeELDjQs
         39yOp73brrNoHTbWw9PQvmnZzUW4CFp9dKURjF9QKe7rqH0Lhg3p+9zbAxVjW8gUQVuu
         YnqcHfnUFYtmp1avJZs0z7qBmwMh2yNbZb8yo5fC53mwg9gbbbV9NAcTPeVtuFk2LJJ4
         X4S05CtXpufrR+mzrkZwmxZM9f0yRmn9kI+9PZE9riF29zhZSKt8/ZhogTouhmBavUiA
         IyLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d88662929fsi154425956d6.429.2024.12.04.00.05.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 00:05:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIkOF-0004CL-AS; Wed, 04 Dec 2024 03:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIkO8-0004Bp-7w; Wed, 04 Dec 2024 03:05:36 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIkO6-00082v-RC; Wed, 04 Dec 2024 03:05:35 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 4 Dec
 2024 16:05:24 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 4 Dec 2024 16:05:24 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 1/7] hw/sd/aspeed_sdhci: Fix coding style
Date: Wed, 4 Dec 2024 16:05:17 +0800
Message-ID: <20241204080523.4025780-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204080523.4025780-1-jamin_lin@aspeedtech.com>
References: <20241204080523.4025780-1-jamin_lin@aspeedtech.com>
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
X-TUID: u4XLrZPmg8fG

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

