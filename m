Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp2115577njb;
        Mon, 23 Sep 2024 02:44:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVo2rd36dwTKZTWwNquW93n/bKynrWBS1fdxB8Lirc0SQSyBXE5Uyb9DyQoInkjhUPZ90PiZVAQCKAWNQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGDGfyuf9XSxs0PFAg1t/bY0t2e21lYw1q6lNvmllbA8tVPUpIMoXpZLCJd5/2itSoLPhhk
X-Received: by 2002:a05:620a:454c:b0:7a9:c0b8:9337 with SMTP id af79cd13be357-7acb80ccd55mr2037496585a.37.1727084648194;
        Mon, 23 Sep 2024 02:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727084648; cv=none;
        d=google.com; s=arc-20240605;
        b=O+iITUeVijcXy7tfhTc9TzZQWJQYC7sT+E1IQxhqBk5srt/v3iF/4NMVG708PxZcgd
         jlcuBNuwHm/fe4xBdLdX0ECBArbkQYm8XFHhlFN3QJMv8Bs54TGVpuR4CvyPSf8HVvoT
         +vQy+qdBHw1falgpzdqyAzbHbRMHgV8wL0sSpXt5Ry+s7r0JjvB9y1K4+6Fc3ib0RVds
         /6ApkN2+0VwaXwfjwpSHVXbCXHSPBRt79xxb2phO128iRBH4oOhSjdNiEovEmYntXYBx
         LG0Sv1/w1gIbo73HWKGIK165NzXQaNOtZyNCBXt+RU7R0Kf5tYHh5moyt2+e+Wid6iOC
         hDWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=g8PIR/AtnxX2N2aOHQMjqhhm1Vb2m+e0nVvAQp4i2Zk=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=ei/hBko9rg2J3st2WgOksb6dWxeH+qMep3J7P6DmTuu3JdO9aRvpxjRW6opo9ds4+f
         ++fNLKcNYjMoOgzKwzR20eNDcptpfjJ7Uucs4CHZOhObmD75QgPOp5DXZywxFb6D95c4
         raYWTjNZzGN/0e/cHxzs4lmQ1Sn7C0Rwuu8FQUnPlT5m1DQNivtMM7P4B+3aCL3eD074
         gP7C7akO0P6SfaoEfQiuHhpwRoIbiiu8Mc/WPsBK3y0hVxBunKIgQv8EwrWsiEmWFUTl
         h3p0LfOuSap1zh2cYXi+PiJA5P2Nv3IXlSe5DUMeRtNR3k3co0ZTrYK/EG7anyrmkY9Q
         2gyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7acb08f5edesi1011030485a.619.2024.09.23.02.44.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2024 02:44:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ssfaV-0000pf-HQ; Mon, 23 Sep 2024 05:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ssfaS-0000bP-8x; Mon, 23 Sep 2024 05:42:32 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ssfaQ-0008C9-Rh; Mon, 23 Sep 2024 05:42:32 -0400
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
Subject: [PATCH 3/5] hw/gpio/aspeed: Support different memory region ops
Date: Mon, 23 Sep 2024 17:42:03 +0800
Message-ID: <20240923094206.1455783-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240923094206.1455783-1-jamin_lin@aspeedtech.com>
References: <20240923094206.1455783-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: qgyPGotKJHmn

It set "aspeed_gpio_ops" struct which containing
read and write callbacks to be used when I/O is performed
on the GPIO region.

Besides, in the previous design of ASPEED SOCs,
one register is used for setting one function for 32 GPIO pins.
ex: GPIO000 is used for setting data value for GPIO A, B, C and D in AST2600.
ex: GPIO004 is used for setting direction for GPIO A, B, C and D in AST2600.

However, the register set have a significant change in AST2700.
Each GPIO pin has their own control register. In other words, users are able to
set one GPIO pin’s direction, interrupt enable, input mask and so on
in one register. The aspeed_gpio_read/aspeed_gpio_write callback functions
are not compatible AST2700.

Introduce a new "const MemoryRegionOps *" attribute in AspeedGPIOClass and
use it in aspeed_gpio_realize function.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/gpio/aspeed_gpio.c         | 7 ++++++-
 include/hw/gpio/aspeed_gpio.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 94a5f3ee03..f23ffae34d 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -1047,7 +1047,7 @@ static void aspeed_gpio_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_gpio_ops, s,
+    memory_region_init_io(&s->iomem, OBJECT(s), agc->reg_ops, s,
             TYPE_ASPEED_GPIO, agc->mem_size);
 
     sysbus_init_mmio(sbd, &s->iomem);
@@ -1132,6 +1132,7 @@ static void aspeed_gpio_ast2400_class_init(ObjectClass *klass, void *data)
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
     agc->mem_size = 0x1000;
+    agc->reg_ops = &aspeed_gpio_ops;
 }
 
 static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
@@ -1144,6 +1145,7 @@ static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
     agc->mem_size = 0x1000;
+    agc->reg_ops = &aspeed_gpio_ops;
 }
 
 static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
@@ -1156,6 +1158,7 @@ static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
     agc->mem_size = 0x800;
+    agc->reg_ops = &aspeed_gpio_ops;
 }
 
 static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
@@ -1168,6 +1171,7 @@ static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
     agc->reg_table = aspeed_1_8v_gpios;
     agc->reg_table_count = GPIO_1_8V_REG_ARRAY_SIZE;
     agc->mem_size = 0x800;
+    agc->reg_ops = &aspeed_gpio_ops;
 }
 
 static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
@@ -1180,6 +1184,7 @@ static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
     agc->mem_size = 0x1000;
+    agc->reg_ops = &aspeed_gpio_ops;
 }
 
 static const TypeInfo aspeed_gpio_info = {
diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index 8cd2ff5496..e1e6c54333 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -77,6 +77,7 @@ struct AspeedGPIOClass {
     const AspeedGPIOReg *reg_table;
     unsigned reg_table_count;
     uint64_t mem_size;
+    const MemoryRegionOps *reg_ops;
 };
 
 struct AspeedGPIOState {
-- 
2.34.1

