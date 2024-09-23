Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp2115272njb;
        Mon, 23 Sep 2024 02:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGSC6LhXrCvmdMs7IzTNVZlBSCthvCpwmX0sMVX9glSW7/Y3PvAeyY/8r3m067lYya9GGlA88r9waLIg==@linaro.org
X-Google-Smtp-Source: AGHT+IGDbNKBhEB/tKd+7AxIowamxeIpRvnyY2TyZp8PHlZn9uWfPZeItQ7U90kuwxwy8E7LJMiq
X-Received: by 2002:a05:6214:4286:b0:6c5:7ed0:194a with SMTP id 6a1803df08f44-6c7bd4cfd1cmr180564636d6.2.1727084588211;
        Mon, 23 Sep 2024 02:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727084588; cv=none;
        d=google.com; s=arc-20240605;
        b=NWav9caBSq4rCSlM7sPfqNdXaIpFn1H+rupWyIG5hKBfoIDBd3Dl7w0+FLIrkAAGU4
         mHeMFSCRR4Ef/IW9zzruRvE6M9ULF1i9EzdJZP8CeF0gbAPnIFpAu4YeLfZCjv+dBkeV
         qVexVzEir86rsLcXTH001ZUYFnHl1ItIdk/qBHipqpgU+pgQy+CE/sYgQnncJNMnMxzI
         0BPFTI5Rr6UjKGD3Goun7lDFJA0s09ifiVQ74GoPnnUigD8Ih/jicYY4JOO8qP60o1Pu
         BnYaB0nZmxhYfYSLYCt7aABoM5Eo//mNRMlgxJvnVcqmwPWpFB82q1g8EVk1YqMcwmJ8
         8Riw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=PQoljFqy27Tlq7V8RRoqXCwduISkCwkLa9gJLMIsI+U=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=impEXJVqG1I3HySNvjAX19hAaGRVXgPzPzorWuGtKa9xmXw5GH0SCi2mDptVNbsWBm
         V0QkOi4RtR412tWtLE7cixaRTWuNGIbthJ1CYhcswcw7BoWJmQS45/EV+JNiQa5f1Peu
         Ze/A74Wwq1BTdQUOFkYUJ7crLYFhDItp7bNAPULcUlwCFivziZZ8BP2AHsHLvPJbQb/r
         /soGvoK9ouC7sIqy+Hl8DRIFOTiOXoCMrNvrt2KnhUo3TopQB3rdUiG+UrgzRa/VScYY
         ygQHVBLdfdwYeQEghY6uiC9uF7KQZUy7ergmnVgheIhALmezXqBrGIwKyEWR3qIPCOVR
         8Rsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e563ca1si102190356d6.287.2024.09.23.02.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2024 02:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ssfaT-0000dV-Pk; Mon, 23 Sep 2024 05:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ssfaP-0000Rw-Sn; Mon, 23 Sep 2024 05:42:30 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ssfaN-0008C9-R3; Mon, 23 Sep 2024 05:42:29 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 23 Sep
 2024 17:42:06 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 23 Sep 2024 17:42:06 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH 2/5] hw/gpio/aspeed: Support to set the different memory size
Date: Mon, 23 Sep 2024 17:42:02 +0800
Message-ID: <20240923094206.1455783-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923094206.1455783-1-jamin_lin@aspeedtech.com>
References: <20240923094206.1455783-1-jamin_lin@aspeedtech.com>
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
X-TUID: JK4vcO2rVne9

According to the datasheet of ASPEED SOCs,
a GPIO controller owns 4KB of register space for AST2700,
AST2500, AST2400 and AST1030; owns 2KB of register space
for AST2600 1.8v and owns 2KB of register space for AST2600 3.3v.

It set the memory region size 2KB by default and it does not compatible
register space for AST2700.

Introduce a new class attribute to set the GPIO controller memory size
for different ASPEED SOCs.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/gpio/aspeed_gpio.c         | 7 ++++++-
 include/hw/gpio/aspeed_gpio.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 901b576144..94a5f3ee03 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -1048,7 +1048,7 @@ static void aspeed_gpio_realize(DeviceState *dev, Error **errp)
     }
 
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_gpio_ops, s,
-            TYPE_ASPEED_GPIO, 0x800);
+            TYPE_ASPEED_GPIO, agc->mem_size);
 
     sysbus_init_mmio(sbd, &s->iomem);
 }
@@ -1131,6 +1131,7 @@ static void aspeed_gpio_ast2400_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_sets = 7;
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
+    agc->mem_size = 0x1000;
 }
 
 static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
@@ -1142,6 +1143,7 @@ static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_sets = 8;
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
+    agc->mem_size = 0x1000;
 }
 
 static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
@@ -1153,6 +1155,7 @@ static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_sets = 7;
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
+    agc->mem_size = 0x800;
 }
 
 static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
@@ -1164,6 +1167,7 @@ static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_sets = 2;
     agc->reg_table = aspeed_1_8v_gpios;
     agc->reg_table_count = GPIO_1_8V_REG_ARRAY_SIZE;
+    agc->mem_size = 0x800;
 }
 
 static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
@@ -1175,6 +1179,7 @@ static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_sets = 6;
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
+    agc->mem_size = 0x1000;
 }
 
 static const TypeInfo aspeed_gpio_info = {
diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index 39febda9ea..8cd2ff5496 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -76,6 +76,7 @@ struct AspeedGPIOClass {
     uint32_t nr_gpio_sets;
     const AspeedGPIOReg *reg_table;
     unsigned reg_table_count;
+    uint64_t mem_size;
 };
 
 struct AspeedGPIOState {
-- 
2.34.1

