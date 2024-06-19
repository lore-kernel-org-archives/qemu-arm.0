Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp846625dlb;
        Wed, 19 Jun 2024 02:36:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUvoPIQy1Nql6PR4eNx7Hyg1rmtScwmz/KK6hoOe3Gm+cNDwiMkc0QtiTGvnUJ1k4lHU/paghLyt6DMHcKEQg0fwf9bu82M
X-Google-Smtp-Source: AGHT+IHkyDCmMuNsAlacpxZqocFUSxzzLDdjJ10h4iVeUL+m+ZtstzOumbZUipkr4yGH2BR6ES3J
X-Received: by 2002:a05:6214:176a:b0:6b2:a2bb:df2d with SMTP id 6a1803df08f44-6b501eb3812mr20994036d6.48.1718789775864;
        Wed, 19 Jun 2024 02:36:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718789775; cv=none;
        d=google.com; s=arc-20160816;
        b=0QzVzHpC4igDZDdgR/9g2EWfJ/vIlbKsa8HIHNtyirQuFMrcW+jiOAJYzTu0K/b78u
         95twAPkHybVXdmzgT7jHt11vK6Xsmrpr54Yy1WAFsNaQbEVGJZacN/qIUxX6JXp+k+Lm
         QfioSL2Ay40UZDYOtu4MDM3+m7FVx+z1dhk4CGYbTS0/S59vhoQVwjKY0zDYSa8rVqnR
         MT/V7VkRILL6QCII1BszgH4KMkWQq9rTwpo60rQRRDHcE+cAzVW1bt2P5ioFWO5oikK+
         xySX/SPgkKRTwcbDjMmyJspUe+AHaNFCwn9gFcgWt8Okty5SrLCCCS8qAQu2jNG8X0Cd
         Bzew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=TCG+zQnedb+BZn4xfGHvTCqNh7WeuNdghYvFdpt44Ro=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=OzqHbAhJV7ftcL2DBXMRvpbIFLQOwPjAv0qAIshtVbnZyvkf2zqct9ltwAUAH4GNnI
         L1+yI3MMoN/JATSdvGU2BxmkIsekhH8Rq+3hKIHAuwqOelHLXNlH1rxLsohiLoLicWV9
         lrGJ+VifdmXjCMf/VKjDTwhm7fiGZKNFxQD5mP3ca6if5kVK4eDuLbS5gHnjuXtB72tn
         zNOzI73OEpWPBrRoJAZaBfcbg8IQItn4udpEKOxKa1ocON8CFL9tlqtSrf80k9YPgUsd
         HQuj1FMPJF+kcle+7merIGRB27AR+YenyGbfMbJ5GTlRSRxSxCJNdufD6C6YpNf4UsmC
         UbHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5afd856si140885076d6.253.2024.06.19.02.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 02:36:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJriv-0000cN-3u; Wed, 19 Jun 2024 05:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sJris-0000bu-TC; Wed, 19 Jun 2024 05:35:23 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sJrir-0006py-Dd; Wed, 19 Jun 2024 05:35:22 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 19 Jun
 2024 17:35:09 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 19 Jun 2024 17:35:09 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 2/2] aspeed/sdmc: fix coverity issue
Date: Wed, 19 Jun 2024 17:35:08 +0800
Message-ID: <20240619093508.2528537-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240619093508.2528537-1-jamin_lin@aspeedtech.com>
References: <20240619093508.2528537-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: gSY+Do26VICR

Fix coverity defect: Control flow issues (DEADCODE)

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_sdmc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 93e2e29ead..94eed9264d 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -589,7 +589,6 @@ static void aspeed_2700_sdmc_write(AspeedSDMCState *s, uint32_t reg,
     case R_INT_STATUS:
     case R_INT_CLEAR:
     case R_INT_MASK:
-    case R_MAIN_STATUS:
     case R_ERR_STATUS:
     case R_ECC_FAIL_STATUS:
     case R_ECC_FAIL_ADDR:
-- 
2.34.1

