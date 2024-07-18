Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1260568njk;
        Wed, 17 Jul 2024 23:51:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSkS5v12nRDG75EmMirJLvXivt5reNiR6iwd69Y5Ig8eMm5l0bBNkjZS4VCE6mmxluVniinVWkbYLgyZdMw5B6OM3zbG3E
X-Google-Smtp-Source: AGHT+IG5kMaq77usCJcTHXPJV02yw0WCM+ud4/M78g5/8Ie/ph73uRfGe3bljbkQUXREq6stqYHV
X-Received: by 2002:a05:6214:c82:b0:6b5:4249:7c0 with SMTP id 6a1803df08f44-6b78c9f93camr51590156d6.5.1721285476423;
        Wed, 17 Jul 2024 23:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721285476; cv=none;
        d=google.com; s=arc-20160816;
        b=ET5QCkOI206JLzsElyfXt4HUCYOjtbpcLhH/rpvIBKMXHQRoW/d4kb5TgClOjVlgc5
         OFDzoxkypJ9Jra4xB4zHAx95xQUarPknb5dKDlCmiA4Ig2CdBEGroWcNmoBUPk7u2qKt
         N7R4jWvXyeHOZGEwQftNGv3OMWr1ZzHnwiFpg+1q4mKc8tDB5SI4Z1frO9RNepQ6wYkw
         +J0D/t5lwOjzemfH+mLr9TiqMLgVANyUBHSRdmN+81dWs/kos0ydCdPbl2kOFpvb1alL
         IR8g4dB2F5YF5aubevRWNhI0EdzD/hFxlZGmAg+h02eYn5VfsE2sdiTXkCr14SI7Lc7I
         Ry7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=jMC8v2qNtoziQ2RSvlUwx1s5M6b9jzem69I5KtxFT5U=;
        fh=cqT0Sm0iQHqDiDEsJ3ixFD44Q88e2AVQBWE8a4yA5Ck=;
        b=09FwIH7AribB1Q7y04MLy/DHISRN9Tnndr5cuhZ77TrO0HwAQbDXxyLcVpOM23rw9p
         ZxnXAM7k7s/XciC3Z6PZoWglhDEVfDRr3PGARCJlQZl2zQa3uvfVW+NT2AqmTt8Cq4g1
         3epb88s7MjbQOCC28k2UQ6BJaKlUZnTfCwadYNOqMLqk1CZzmU3vXs7K4pZXN9piIJ5K
         EyICIzqc4mQ9NQzJ98L1WgYSWjz1xRh7jcMX6Mde795L6gj91zSawushW/jfZIIMBLa8
         ypO8wcItcF+8Hd6Vmo/5ltbtIZaC6esge12y127gBmqWQTtpvsZCohtAFDih3S7R3H5v
         kKhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b79c7b6e42si13782306d6.279.2024.07.17.23.51.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 23:51:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUKyD-0005Uh-IG; Thu, 18 Jul 2024 02:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKyB-0005NI-UQ; Thu, 18 Jul 2024 02:50:27 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKyA-0004L5-Cm; Thu, 18 Jul 2024 02:50:27 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 18 Jul
 2024 14:50:16 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 18 Jul 2024 14:50:16 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 04/15] hw/i2c/aspeed: support discontinuous register memory
 region of I2C bus
Date: Thu, 18 Jul 2024 14:49:14 +0800
Message-ID: <20240718064925.1846074-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Rwnp2z9+d7Hj

It only support continuous register memory region for all I2C bus.
However, the register address of all I2c bus are discontinuous
for AST2700.

Ex: the register address of I2C bus for ast2700 as following.
0x100 - 0x17F: Device 0
0x200 - 0x27F: Device 1
0x300 - 0x37F: Device 2
0x400 - 0x47F: Device 3
0x500 - 0x57F: Device 4
0x600 - 0x67F: Device 5
0x700 - 0x77F: Device 6
0x800 - 0x87F: Device 7
0x900 - 0x97F: Device 8
0xA00 - 0xA7F: Device 9
0xB00 - 0xB7F: Device 10
0xC00 - 0xC7F: Device 11
0xD00 - 0xD7F: Device 12
0xE00 - 0xE7F: Device 13
0xF00 – 0xF7F: Device 14
0x1000 – 0x107F: Device 15

Introduce a new class attribute to make user set each I2C bus gap size.
Update formula to create all I2C bus register memory regions.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/i2c/aspeed_i2c.c         | 3 ++-
 include/hw/i2c/aspeed_i2c.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 7d5a53c4c0..462ad78a13 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -1011,6 +1011,7 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     AspeedI2CState *s = ASPEED_I2C(dev);
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
+    uint32_t reg_offset = aic->reg_size + aic->reg_gap_size;
 
     sysbus_init_irq(sbd, &s->irq);
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_i2c_ctrl_ops, s,
@@ -1033,7 +1034,7 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        memory_region_add_subregion(&s->iomem, aic->reg_size * (i + offset),
+        memory_region_add_subregion(&s->iomem, reg_offset * (i + offset),
                                     &s->busses[i].mr);
     }
 
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 065b636d29..422ee0e298 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -275,6 +275,7 @@ struct AspeedI2CClass {
 
     uint8_t num_busses;
     uint8_t reg_size;
+    uint32_t reg_gap_size;
     uint8_t gap;
     qemu_irq (*bus_get_irq)(AspeedI2CBus *);
 
-- 
2.34.1

