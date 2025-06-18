Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp3020576njc;
        Wed, 18 Jun 2025 01:00:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXeZbnHkSOoR7JbbGIREzeebofM8beqBxy847brKg3ImxwanQ1kV5Bz0TYRF9f8z/pVrpe4MFVEgBLQw==@linaro.org
X-Google-Smtp-Source: AGHT+IF4NP7nhCyzPZbu/USxN2jkdtpcE4KC+rbvjiXj2JVr12PQZ360TKFluGcraXs8qOYUNvki
X-Received: by 2002:a05:6102:5792:b0:4e6:d9f2:957c with SMTP id ada2fe7eead31-4e7f6213469mr13258079137.23.1750233648178;
        Wed, 18 Jun 2025 01:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750233648; cv=none;
        d=google.com; s=arc-20240605;
        b=cyLIvHAgOlDjxrUo9E8yjUF+o/h/+LZOwPh3VEQf1iuKDm5LeK14eG0DJ5pYZDAuzC
         jsGkzahJzcCPgcjfKzbbTQkX3sr2V2997EwiLqrFdd5RaUL2sYXk01kkBTU73yLtV9np
         SbCLnwOtOdgxa7soStNevthga9I1z9ju3QttCNW8vsiXqBu+t1UmaNiP2B8ZNoykT0y0
         b2KRjsiIRJldcixVro5URVARAd8xWjOmT1ISTpMbogxSdtTvnGwvK5hTp5rqLH7ejU9K
         qolTb40Kd9IBF2BYs7DyNq9m/15H/UtUf2I7CfQOJQrUbZE6+orFJdL1sXTvGoAzEYPj
         WuiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=FrDNm/XdjpLG/VA82aZvLLC2RjrYWcScbVEDXh6qRfY=;
        fh=Gb4TIc8MExyZGNjx5T60USxFFuCM6mshEZ2Ta2WMSD4=;
        b=fT6MQQlZ3e4diD7PrOgd01y07N61RjwKCnWddZ4EN6PYUBpi7RaPCLRYLlXZP5ZS7W
         ven1XJyQudFTYw35KlEAkfuwO4jgAawqpWOxuOHgzZQyc1Gu7bhfjkeUKtpOXrafecmG
         JuGxzPb7nb8ehWdSSjRFCUk2cajhDg16hdM0nVHcwXlPIhurelEW/+j0Gd9D4z/VvUYT
         nWkRwE4AN7VFXHb90wSRVjAM32Y4R55BCSSaLcMhtwKtJyHGzhQi1VQqkobMeA/Yx2vi
         DqGwflSUIUsErdkDzqEAZ/UDQr2CAHHS+TKWq/eis/KgzKietKsvlgkJc/d6re+8tjms
         mxpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-87f16d28e5csi2454692241.151.2025.06.18.01.00.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jun 2025 01:00:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRnik-0001Jc-Gj; Wed, 18 Jun 2025 04:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uRnia-0001I6-EF; Wed, 18 Jun 2025 04:00:27 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uRniU-0006A3-JZ; Wed, 18 Jun 2025 04:00:21 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 18 Jun
 2025 16:00:06 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 18 Jun 2025 16:00:06 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 0/2] Support the Frequency Counter Control register for
 AST2700
Date: Wed, 18 Jun 2025 16:00:03 +0800
Message-ID: <20250618080006.846355-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
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
X-TUID: ztRd/9NjB+xA

v1:
- Skipping dram_init in u-boot for AST2700
- Support the Frequency Counter Control register for AST2700

Jamin Lin (2):
  hw/misc/aspeed_sdmc: Skipping dram_init in u-boot for AST2700
  hw/misc/aspeed_scu: Support the Frequency Counter Control register for
    AST2700

 hw/misc/aspeed_scu.c  | 6 ++++++
 hw/misc/aspeed_sdmc.c | 3 +++
 2 files changed, 9 insertions(+)

-- 
2.43.0

