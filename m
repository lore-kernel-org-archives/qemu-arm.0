Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1260448njk;
        Wed, 17 Jul 2024 23:50:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfNcOyh1ckpIDFE9hHzOguySU/j6+AqrrXUYVWzoY5nQW4nRM97n7IfxdoUmpLGGnphUytKr7bH1QCyXZptzzudcUAA5/E
X-Google-Smtp-Source: AGHT+IH4jDJj7kHjvjeshGAJUkGDN0+nS43BoX6okdcethFwGVq9OxmjKr3Ae0fgVoxgxyxGKPyZ
X-Received: by 2002:a05:620a:1a18:b0:79e:fb85:5260 with SMTP id af79cd13be357-7a18751863amr338644585a.73.1721285455692;
        Wed, 17 Jul 2024 23:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721285455; cv=none;
        d=google.com; s=arc-20160816;
        b=Vk4lpljTusoIqZA9F68T8yWf5DkPsWjPIthLaZLG10DO7qtkrwRqCRQDDAvhhqmQNk
         kSGKLwmbmITLItL1bDv+ew4yDpELhZl7mEuVQwVpMUhc82y09m2HTwsu8XFqmhypsVDa
         aauJkfV5TbK+uyvT+mWBDXJ6kAPEcYg0wOmTgC7mohYm5ycAPNIHurRDq0/Ok9YEWoEE
         mJkZblwgxvy9w+j2I0VC4nYp0IatNiuoFmVf1PJuXPgFXCEdcLbNhf9MpVHQQyFldqwJ
         cbNVWPRfjz5QdDjKLcosgWQ6Z2HxZkD6wn/NhbxSk4vTjHIJBLefQ2oNgLzBRUH7ioCT
         tqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Fn27Okcfa+2nqZsUvxMQA7sfPh4A42Y8CLhemfiOMF8=;
        fh=Ph+R0NNHAlT66tvNC78JUFsmAbXddKrwk994XbgsRkc=;
        b=S46Wbr9Oh3F23bqv3OWPs+f7aekWc/PGBrQ+GsD0Z3Sp+kVuTp2vOetKY9kkAZPks0
         NYAe4FtyF2gY869PNjb5M56xtzeQBKSEOazBxY3g0ECYlWVxFHKR3kVRC5EpgYctCl4r
         DJINeSWIc3Up+qwrPQ980hRe0kizanO6/NlcLjVG9RKGRQ1sA2ev15poi2Di5uUYuUWZ
         PR1wXa42jp3PxNBN9rj2YyeQlRMrMDbT88QlaRy3lC138vhGg2nDKnIF8gaKMB5OsPL1
         V0bFqRWfizV8Gs/rtRi65IeThDSxEf3CoZdXLfCLQKN3xNQasWfeNlnM01f/65+e2IMn
         SJJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c499d6si1186168785a.304.2024.07.17.23.50.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 23:50:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUKyA-0005Hh-Ni; Thu, 18 Jul 2024 02:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKy9-0005Cr-KI; Thu, 18 Jul 2024 02:50:25 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKy8-0004L5-3a; Thu, 18 Jul 2024 02:50:25 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 18 Jul
 2024 14:50:15 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 18 Jul 2024 14:50:15 +0800
To: Alistair Francis <alistair@alistair23.me>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@kaod.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:STM32F205" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 03/15] hw/i2c/aspeed: support to set the different memory
 size
Date: Thu, 18 Jul 2024 14:49:13 +0800
Message-ID: <20240718064925.1846074-4-jamin_lin@aspeedtech.com>
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
X-TUID: NUBbEqfPNGiM

According to the datasheet of ASPEED SOCs,
an I2C controller owns 8KB of register space for AST2700,
owns 4KB of register space for AST2600, AST2500 and AST2400,
and owns 64KB of register space for AST1030.

It set the memory region size 4KB by default and it does not compatible
register space for AST2700.

Introduce a new class attribute to set the I2C controller memory size
for different ASPEED SOCs.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/i2c/aspeed_i2c.c         | 6 +++++-
 include/hw/i2c/aspeed_i2c.h | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index b43afd250d..7d5a53c4c0 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -1014,7 +1014,7 @@ static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_irq(sbd, &s->irq);
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_i2c_ctrl_ops, s,
-                          "aspeed.i2c", 0x1000);
+                          "aspeed.i2c", aic->mem_size);
     sysbus_init_mmio(sbd, &s->iomem);
 
     for (i = 0; i < aic->num_busses; i++) {
@@ -1286,6 +1286,7 @@ static void aspeed_2400_i2c_class_init(ObjectClass *klass, void *data)
     aic->pool_size = 0x800;
     aic->pool_base = 0x800;
     aic->bus_pool_base = aspeed_2400_i2c_bus_pool_base;
+    aic->mem_size = 0x1000;
 }
 
 static const TypeInfo aspeed_2400_i2c_info = {
@@ -1320,6 +1321,7 @@ static void aspeed_2500_i2c_class_init(ObjectClass *klass, void *data)
     aic->bus_pool_base = aspeed_2500_i2c_bus_pool_base;
     aic->check_sram = true;
     aic->has_dma = true;
+    aic->mem_size = 0x1000;
 }
 
 static const TypeInfo aspeed_2500_i2c_info = {
@@ -1353,6 +1355,7 @@ static void aspeed_2600_i2c_class_init(ObjectClass *klass, void *data)
     aic->pool_base = 0xC00;
     aic->bus_pool_base = aspeed_2600_i2c_bus_pool_base;
     aic->has_dma = true;
+    aic->mem_size = 0x1000;
 }
 
 static const TypeInfo aspeed_2600_i2c_info = {
@@ -1376,6 +1379,7 @@ static void aspeed_1030_i2c_class_init(ObjectClass *klass, void *data)
     aic->pool_base = 0xC00;
     aic->bus_pool_base = aspeed_2600_i2c_bus_pool_base;
     aic->has_dma = true;
+    aic->mem_size = 0x10000;
 }
 
 static const TypeInfo aspeed_1030_i2c_info = {
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index a064479e59..065b636d29 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -283,7 +283,7 @@ struct AspeedI2CClass {
     uint8_t *(*bus_pool_base)(AspeedI2CBus *);
     bool check_sram;
     bool has_dma;
-
+    uint64_t mem_size;
 };
 
 static inline bool aspeed_i2c_is_new_mode(AspeedI2CState *s)
-- 
2.34.1

