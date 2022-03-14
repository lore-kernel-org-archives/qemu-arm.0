Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2167962lfo;
        Mon, 14 Mar 2022 07:12:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjxpphJvM67o7JIhttvkfFO9Fm956ZR5AXVHix3RGkDrhs11MW/eyUmzlVOjg44oXiViHT
X-Received: by 2002:a25:1906:0:b0:61d:9576:754e with SMTP id 6-20020a251906000000b0061d9576754emr17793496ybz.426.1647267154152;
        Mon, 14 Mar 2022 07:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647267154; cv=none;
        d=google.com; s=arc-20160816;
        b=fhZXfMZP8QUK5MxCkU3TFOTI9pf/tkfYYDZoHslknfUbedGbm1Imvgh2sbyFwrSejN
         NzSTFID3HJBjtXNokEzz/bNsTnCOy7gVgyYj93nt0RXhrLAE4mTQKfR5ejuXE5hO83Rk
         OxBr1pSw9xl+CEs2zwXjgbv9ZKdUC2OiX5pHKQq4dd3bweHoQdVyFcXPcv6zI69oJG7D
         CZwwxy6EkMOl1pI0/VjWjBvZtHdg0XC0KBFmz8WBl/Tuo/gq4Fixg8tONOFDhKasZGdl
         mH+h+06Of8TY3BX/H8yry7icii4J4LzxdY/WX8naywLYHn/9fs/Q5KAAElbm0D640HKn
         j2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=IBLpRwPyFyvj1pAi3RbjEABIyOS7jW1+jY+DforXloc=;
        b=vkniYEkM3GCTiGMlq0/PlGr0VOhdCGSaMqlrc5ew2sUQIo4rKn/f87Zpjj2Ob1VBMH
         fGlTQQ6MV73oc+w0nolnNZFbz0lBa9Lww2buNiZeRrA4CIfRdc1Z2ACJe1jcn2GKNKBd
         Nw+SAioBEkqWpVvAJD3R1vpZbfcBkmUgExNcJPe0TThOoPaqfvWbO+ZxSd/2kmmlXkfp
         uRgA/vOqytbMXxZhOw0Z1p8Ihz4fI1m9btqo6YEUVUUrQwtoc4Ca9zYTBinntTkd7B5v
         8vS/TwEwkXKqcsU/vuwlC2OEPrHh97alq+R0YxiGhFBkTKDeYkCDyjMydlDcvVpeG4x4
         2N6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u142-20020a817994000000b002e563444cc8si1625533ywc.137.2022.03.14.07.12.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Mar 2022 07:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nTlR3-0001dx-IC
	for alex.bennee@linaro.org; Mon, 14 Mar 2022 10:12:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nThQY-0002CN-5G; Mon, 14 Mar 2022 05:55:46 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:11217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1nThQU-0003d2-UL; Mon, 14 Mar 2022 05:55:45 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22E9indo039519;
 Mon, 14 Mar 2022 17:44:49 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.100) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 14 Mar
 2022 17:54:51 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v1 0/1] hw: aspeed_scu: Add AST2600 hpll calculation function
Date: Mon, 14 Mar 2022 17:54:48 +0800
Message-ID: <20220314095449.22089-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.100]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22E9indo039519
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=steven_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Mar 2022 10:10:28 -0400
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AtF2peC4SpRp

AST2600's HPLL register offset and bit definition are different from AST2500.
The patch series adds a hpll calculation function for ast2600 and modify apb frequency
calculation function based on SCU200 register description and note in ast2600v11.pdf.

Please help to review.

Thanks,
Steven

Steven Lee (1):
  hw: aspeed_scu: Add AST2600 hpll calculation function

 hw/misc/aspeed_scu.c         | 43 ++++++++++++++++++++++++++++++++----
 include/hw/misc/aspeed_scu.h | 17 ++++++++++++++
 2 files changed, 56 insertions(+), 4 deletions(-)

-- 
2.17.1

