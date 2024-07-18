Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1260716njk;
        Wed, 17 Jul 2024 23:51:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7Hl6+U9EfU0LHKBOPUHMNMRw7eDWMD6dsErXmEOd0h9+ZtJvvZ1XHjNCc4AulIoL6rLx3hWhWUWdy+SFROw3u4hdXL5yw
X-Google-Smtp-Source: AGHT+IH4izvaRsKpNzy9ecfqu0rb88kzdWOO4HlK3PAfuDygFQgzJhTFSXEB3bNyeaXn3DJ9q8PM
X-Received: by 2002:a05:6214:b69:b0:6b5:e6b3:72f9 with SMTP id 6a1803df08f44-6b79c505581mr23873896d6.9.1721285503331;
        Wed, 17 Jul 2024 23:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721285503; cv=none;
        d=google.com; s=arc-20160816;
        b=jU+Bqr9+EAMsufCewBG03fdt2D6Fo7VKuMNJ97Kh4ZksrVpSCQwBBtTCX/iPtwfBjd
         WT0vyupRCpZhZDOwLE1F+8VWchuxWejPqhDj6qbGzXsw4nAf/94qScWOK8+jp+iJwcM0
         Dvu7mBsNN8kS+OiqlRmAUpEk8stc2LXQtYoV/hxN6VP27hK5ZnSxkRDvZBvr11WSBp2b
         C9EJ2aj2OrbnETnggHsiHHY20CG5yC3VmFVsvLoxwIKPsg4ygmDMXUJJf9r+2y7MXLi8
         PAcOZm6oQx/hxvYCFYqNs81ajIgeScxvQUtEAL7lZJBBnV6PRmxHPzXML+Z4pl4izIFn
         eHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=qo7HAjaFc5d53bgskrN5RJI92sinVfJvBh772Irq198=;
        fh=cqT0Sm0iQHqDiDEsJ3ixFD44Q88e2AVQBWE8a4yA5Ck=;
        b=FJ+rhSswMRVqgaBFRSMdREAtgF7uNPGSsLox9FNsC4MLkp2JmcLCoiTP8rz8Vh2/DI
         OsApILaJ/W4jE2+fT8c7Lm85iICwBUP8W/M8GqWA51RXmvP5ZPiSgsU2Qbfr1f1VDjwi
         NFYQuNXY9YF/76Hd7Hb2DoPiiuh8zMdUb3oht7Xfyqah3z2H9T1/+zRJL+LKzTB2jf/A
         vvgkkIEB7RXkpHvXKoTzP230K88G5OpLPJHyf8B8+UF9uR12D8boCzD1eiborMd2dxfX
         6kBerMKRyNLRLlgrQzp9jpi4VzyX93fJ34BHVCxVRl+qGmlxkr86OX4T01/OMe0y76Ip
         fX0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b79c926d15si13293606d6.477.2024.07.17.23.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 23:51:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUKyz-0000VM-SX; Thu, 18 Jul 2024 02:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKym-0007Vb-E6; Thu, 18 Jul 2024 02:51:05 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKyk-0004VA-NN; Thu, 18 Jul 2024 02:51:04 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 18 Jul
 2024 14:50:18 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 18 Jul 2024 14:50:18 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 14/15] aspeed: fix coding style
Date: Thu, 18 Jul 2024 14:49:24 +0800
Message-ID: <20240718064925.1846074-15-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-TUID: c8zUxywhueZH

Fix coding style issues from checkpatch.pl

Test command:
./scripts/checkpatch.pl --no-tree -f hw/arm/aspeed.c

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 53a4f665d0..f8766ea462 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -265,7 +265,8 @@ static void write_boot_rom(BlockBackend *blk, hwaddr addr, size_t rom_size,
     g_autofree void *storage = NULL;
     int64_t size;
 
-    /* The block backend size should have already been 'validated' by
+    /*
+     * The block backend size should have already been 'validated' by
      * the creation of the m25p80 object.
      */
     size = blk_getlength(blk);
@@ -463,8 +464,10 @@ static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
     DeviceState *dev;
     uint8_t *eeprom_buf = g_malloc0(32 * 1024);
 
-    /* The palmetto platform expects a ds3231 RTC but a ds1338 is
-     * enough to provide basic RTC features. Alarms will be missing */
+    /*
+     * The palmetto platform expects a ds3231 RTC but a ds1338 is
+     * enough to provide basic RTC features. Alarms will be missing
+     */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 0), "ds1338", 0x68);
 
     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 0), 0x50,
@@ -555,8 +558,10 @@ static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = bmc->soc;
 
-    /* The romulus board expects Epson RX8900 I2C RTC but a ds1338 is
-     * good enough */
+    /*
+     * The romulus board expects Epson RX8900 I2C RTC but a ds1338 is
+     * good enough
+     */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
 }
 
@@ -664,8 +669,10 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), TYPE_TMP105,
                      0x4a);
 
-    /* The witherspoon board expects Epson RX8900 I2C RTC but a ds1338 is
-     * good enough */
+    /*
+     * The witherspoon board expects Epson RX8900 I2C RTC but a ds1338 is
+     * good enough
+     */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
 
     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 11), 0x51,
-- 
2.34.1

