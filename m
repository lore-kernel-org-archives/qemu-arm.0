Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp399664ejb;
        Wed, 14 Feb 2024 23:21:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUHRgyz3tNHsK/PnPHlC6raHUQVAtCFcmTFaqeub/MAxOp1xamRdQgzLB8WVRF50TFXrnAtQlPd/J0sknZ8j99Z1qPKjNqP
X-Google-Smtp-Source: AGHT+IG8zF8nJ60EEafy9kMWVV8pIK0Rj6+y+WY8rHGAIF4qw+lLjgiXy3x8SW3oYUokcx5Rq98J
X-Received: by 2002:a05:6214:4407:b0:68c:8874:59e9 with SMTP id oj7-20020a056214440700b0068c887459e9mr991098qvb.43.1707981694788;
        Wed, 14 Feb 2024 23:21:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707981694; cv=none;
        d=google.com; s=arc-20160816;
        b=gYbmIPQSDbnhIYKRI24gY/pdLuUxFrpxDzOwzE5Rl7nxz2W0Zw4YUAyrga72u4AWFF
         qeMpRVonhWWmq2xXaSoV0d0W88yLw38CWmgFg8W+VLC+eVd48GOZDgpLi7XhP/1U80OI
         RGkm0WVRa0H1vB7GG6Ekw1VRJzyTF6h9hZjqepYw9P+wtshuFbJquv48zsd5Al+Fcp9b
         GzxtJCXhz3kee2xA3hp8jtmE9ZliBvWDkqC2MxnN6zeZZz4Yg+5gzBRNF2aBpJSKnY/D
         OrlwzCKrqfJjOYNKYsEuwt0pv/EFQQ75Ed0w3kQUiwwH5bcNxuNF32aV8k7vGKHb5Q9W
         kGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=t922iIJRagU2vtOxd4ULdiM32t+BdrRFloOXC4JlIpI=;
        fh=jkt7ehUcUSTQBo264eWmsavDvXA1+0nMupSr24pggQ4=;
        b=ny9wNYOHlpeKWxEVQfQDkYqJLwDi5f9VMBvRdRL8jg9QCIM8YrqfphrLbv3a21ikg9
         pmwgPlR2aU1Tgwpehj88iSBOov1g9Ru97aKyq8X6EBmziuiCvov/90PYLXtKAPkPcBnO
         0CKqPLQydQdGwIEf3GowQBPaptmIYvF1RJ6pkMDb1jw1NhKagHFfxwzySCHZzwQWNfCG
         rMuZ9obTg1cVNP7w9FyLmF3/zAe+zv7XfePPFjBHW4rcqcWFsN3bP1Yt68ab2gBzdi84
         +bJqwSuP3ms/XfwOIzQX9FruatAN64znR7eePLoGYHfwUexiXYhFJg6cJdRQQEzj+Dgl
         nkEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a0562141c0c00b0068caf6856eesi861836qvc.205.2024.02.14.23.21.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Feb 2024 23:21:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raW2t-0001b2-Ig; Thu, 15 Feb 2024 02:20:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1raW2r-0001aZ-Ky; Thu, 15 Feb 2024 02:20:33 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1raW2p-0006RV-F4; Thu, 15 Feb 2024 02:20:33 -0500
Received: from TWMBX02.aspeed.com (192.168.0.25) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Feb
 2024 15:20:27 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Feb 2024 15:20:27 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v3 0/2] UART0 device name and fix hardcode boot address 0
Date: Thu, 15 Feb 2024 15:20:24 +0800
Message-ID: <20240215072026.2331941-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX02.aspeed.com
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
X-TUID: Usaeh5MJYJVk

v1:
1. support uart controller both 0 and 1 base
2. fix hardcode boot address 0

v2:
1. introduce a new UART0 device name
2. remove ASPEED_SOC_SPI_BOOT_ADDR marco

v3:
1. add uart helper functions to get the index, start and last.
2. add more description in commit log

Jamin Lin (2):
  aspeed: introduce a new UART0 device name
  aspeed: fix hardcode boot address 0

 hw/arm/aspeed.c             | 17 +++++++++++------
 hw/arm/aspeed_ast10x0.c     |  1 +
 hw/arm/aspeed_ast2400.c     |  6 ++++--
 hw/arm/aspeed_ast2600.c     |  3 ++-
 hw/arm/aspeed_soc_common.c  | 10 ++++++----
 include/hw/arm/aspeed_soc.h | 19 +++++++++++++++++--
 6 files changed, 41 insertions(+), 15 deletions(-)

-- 
2.25.1

