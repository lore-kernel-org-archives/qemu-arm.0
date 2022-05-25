Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp678712lfh;
        Tue, 24 May 2022 22:37:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjj80I5rBHKSzMuD3Z2seQ8gjvgT2Cl6YfImvv5cop1WmCeHgJh+irRFEBIDDPXtLrmMqF
X-Received: by 2002:a37:b547:0:b0:6a3:7bf5:310c with SMTP id e68-20020a37b547000000b006a37bf5310cmr9597574qkf.508.1653457040578;
        Tue, 24 May 2022 22:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653457040; cv=none;
        d=google.com; s=arc-20160816;
        b=Ki45KY6rXBC2S3b7IGUDN2RxdRlXtPIOJVJkIL1Knev5A/N5EODaWanCByz3GGOf36
         H1A0D1tCSPJg8B8IaFm3zGb/rET+R2N2+c4y6PMW7IRPnCnINMmhQqBKFfh8uhBGFZ8O
         KqVzesKFCZubBmfwT+vS1mbLf/6pNKQdeBQId4fDh15xHy90drGShIGoDmXglKWfFdnY
         XLWPwFOFiQeshV5E0MTYgorH+1Lh4gZlGMSdzKOSkkaMm9zMsehEkV/IkL9APnz8iqfD
         193vLp/LM5T/+CPqpWumuosxDogPqmrOll8X3kfADO6e8Fsl86CFkgTCpU9pQtwMpLjd
         dc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from;
        bh=IeKUKFv09jbRgrbvOgbOTofOgMYE2ibuzogx36YIb3w=;
        b=fCu5Zx0HBhUEDsW2zgLPKJK4O6pNfWniXlHI9UPghyT+MfCnAsqyxTq3XEAjGhGsOq
         3jF0q5B37Vf1zMSaW/kgbOj+M+Id6dBs2ua16MO8Yas1+J/8i/yXDbkC/jsKet2OfDSB
         nT+JrzXXZL5aBLvYgEZnux+VQy9HTF1zsPoKyOQB0vXQH5+U72Y5HwNehvez5OT6RIrw
         t5WB+89XvIvnbIVqE11Whg7HYaDixA7nzQQYs1J3o4YuwwHRwnfKfV3/jG647wWgKkVV
         YyQO4BdvAcvOxmd6fw32buC+Mac26zbmue4RxqP9ItaCxHPN8UNQRreOxxZLp+0z/PNt
         WdeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020a05621420ca00b0045650fbc3a0si653667qve.495.2022.05.24.22.37.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 May 2022 22:37:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntjhw-0001jZ-3H
	for alex.bennee@linaro.org; Wed, 25 May 2022 01:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ntjgJ-0000kT-2M; Wed, 25 May 2022 01:35:39 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:6510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ntjgH-0003tZ-0Q; Wed, 25 May 2022 01:35:38 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 24P5KihA022847;
 Wed, 25 May 2022 13:20:44 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.123) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 25 May
 2022 13:34:48 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <steven_lee@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <jamin_lin@aspeedtech.com>
Subject: [PATCH v2 4/4] hw/gpio: replace HWADDR_PRIx with PRIx64
Date: Wed, 25 May 2022 13:34:44 +0800
Message-ID: <20220525053444.27228-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220525053444.27228-1-jamin_lin@aspeedtech.com>
References: <20220525053444.27228-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.123]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 24P5KihA022847
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VISjQu0jOkHw

1. replace HWADDR_PRIx with PRIx64
2. fix indent issue

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/gpio/aspeed_gpio.c         | 8 ++++----
 include/hw/gpio/aspeed_gpio.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index c834bf19f5..a62a673857 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -561,7 +561,7 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
     reg = &agc->reg_table[idx];
     if (reg->set_idx >= agc->nr_gpio_sets) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
-                      HWADDR_PRIx"\n", __func__, offset);
+                      PRIx64"\n", __func__, offset);
         return 0;
     }
 
@@ -611,7 +611,7 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
-                      HWADDR_PRIx"\n", __func__, offset);
+                      PRIx64"\n", __func__, offset);
         return 0;
     }
 
@@ -787,7 +787,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
     reg = &agc->reg_table[idx];
     if (reg->set_idx >= agc->nr_gpio_sets) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: no setter for offset 0x%"
-                      HWADDR_PRIx"\n", __func__, offset);
+                      PRIx64"\n", __func__, offset);
         return;
     }
 
@@ -872,7 +872,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: no setter for offset 0x%"
-                      HWADDR_PRIx"\n", __func__, offset);
+                      PRIx64"\n", __func__, offset);
         return;
     }
     aspeed_gpio_update(s, set, set->data_value);
diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index 41b36524d0..904eecf62c 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -67,7 +67,7 @@ enum GPIORegIndexType {
 typedef struct AspeedGPIOReg {
     uint16_t set_idx;
     enum GPIORegType type;
- } AspeedGPIOReg;
+} AspeedGPIOReg;
 
 struct AspeedGPIOClass {
     SysBusDevice parent_obj;
-- 
2.17.1

