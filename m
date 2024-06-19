Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1295146ejb;
        Wed, 19 Jun 2024 03:02:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXswmeAWA0g/OXtuAT+4JpqCQTLJWZQW1o0CKcqnPq+JJnQyfqxS6a/nEGMLcHDxaPLgoN9RlkjRrKN9QODMN20+RrdKT/
X-Google-Smtp-Source: AGHT+IHPXM0YWyMY87ek/zu4iO9LfFsqPQvJ39rN3B4oulMJ+azAoSKVStIqe1V3JV8+zH7jMuGq
X-Received: by 2002:ac8:5a04:0:b0:43a:ea03:31b7 with SMTP id d75a77b69052e-444a7a4ab81mr25862401cf.52.1718791331451;
        Wed, 19 Jun 2024 03:02:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718791331; cv=none;
        d=google.com; s=arc-20160816;
        b=Z4gftle3IwobmRLVCa41UCAEEMdQwKxNuqnyvtogOO2GEJdTH5XRVv+nuscgrHR6XX
         R8JTbSlgEHfTTiZ7lyE27ht1e6Kl6qsYxbkofvSl2kLFiE9SLEvMPgWCas7uS4LnL8I2
         UQxB3+/HKoxBfluDYrHIuFheu9PJz1ECrsri3h4hRrQ2DaDHd1Sf2a9Z3/l675xGoC77
         b4aLzDhnq86OLsFBw9BL14CnGyEmYrwCl5KWUVOTfiwxeYVgsaeFn9Pwce66KCn1f04o
         FyMevgpTb8QiG7/pYy8AwXj951wHqyVG7YYumqj6M/kb3EiD4vjdyb/xwSNy7vjr0DYs
         T0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=C4MGIvuegYe3Tn8Ww5jVQwRyZIhbAfB1of2EOY82n3w=;
        fh=gjtid6HoGhvOYz7QfFN+itIzuUd5CxqvZTNm6mC+lyg=;
        b=uSMyD2/7U01Wi/RIskZZpfFDx5mO0htf9oejr9Pl5jCrOfv66IRzyS9gePZl1WAZE/
         e3lPWmuDoA9XKHc42gArPrwDuVckFeONxNpoflCy4Qhf4gvzPM000B5yxGsV4R7cfSYc
         GvuiUgFNpiSpkfn48mxq5H18DoL923JQEJGNKGqfLsRIGL1W7Zpbc1FHgnCfLbrNKqDt
         +qZbRP8eQF219g/lldd/qC/7zEpN0vjbI2LZjoQSNQ3HBBJPVKNHIKQdT4YRwrE34IGS
         r+P2d9fmwAM0lqQejsbeXLoXI+xJwOuw8wlBjWJm5JpxFywBeapenUhVLS1hhCer6XC6
         1sqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4449caeb077si38904121cf.139.2024.06.19.03.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 03:02:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sJs7s-0004Y6-Dn; Wed, 19 Jun 2024 06:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sJs7r-0004Xf-9t; Wed, 19 Jun 2024 06:01:11 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sJs7p-0002s9-81; Wed, 19 Jun 2024 06:01:11 -0400
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 19 Jun
 2024 18:01:02 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 Jun
 2024 18:01:02 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 19 Jun 2024 18:01:02 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 0/2] hw/net:ftgmac100: support AST2700 
Date: Wed, 19 Jun 2024 18:01:00 +0800
Message-ID: <20240619100102.3137941-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: uDiPrVlJiPW5

change from v1:
- ftgmac100
 - fix coding style
 - support 64 bits dma dram address for AST2700

Jamin Lin (2):
  hw/net:ftgmac100: fix coding style
  hw/net:ftgmac100: support 64 bits dma dram address for AST2700

 hw/net/ftgmac100.c         | 83 ++++++++++++++++++++++++++------------
 include/hw/net/ftgmac100.h |  9 ++---
 2 files changed, 61 insertions(+), 31 deletions(-)

-- 
2.34.1

