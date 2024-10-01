Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp208279njl;
        Tue, 1 Oct 2024 07:12:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9XapYSGVOGF2vUHXARGDUaRlKh2pDbl3xvP5LoN5sWTGMKqDUkS98LFiYKE1T3CV0AlDv9K2Lxc52VQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFBVtsWwVYgO89pLXZUZ7Q821pir9RKdeCccQY7UUVKVnPrdti9xzLwH8Vzkc6N+UFiQLgw
X-Received: by 2002:a05:6214:4497:b0:6cb:2186:275d with SMTP id 6a1803df08f44-6cb3b5f7ef9mr288768266d6.26.1727791923468;
        Tue, 01 Oct 2024 07:12:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727791923; cv=none;
        d=google.com; s=arc-20240605;
        b=Z0THR19+H/jpbxpeaoecMDmb4kvhF8yfZZM/9MZ5fYuyBqTogxnl/06GbZa4WGKlw+
         Di8N+L3UUb0zXfMnulFxe7rjqfFT32DrOrsw3bE2dMJt1hM8EZZE/Os5Au6g0v0TTl4+
         BcdQwK56VfhHmwQaUxmSvipqbZUn4IBvkjDvvx8p4PcAkaGjxJP8yhHS8hSuP5re13ED
         eJxjP+bKXcFX/Arre4BI6+PD8z/3BRLBgDzlmvh+hvsszH1WZcsgeW3WlOM3phSPleEY
         9buxKLdfXQHJ+PVti9zKHuBO5f45bZqxYGeuDafAgHLDzhtRCETqaGCixde6Y6oQpbQu
         ygaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=/ryophMaWWeKUSMPW5zurB7AM1ZTE/k189K7WV+/ohM=;
        fh=RdJersRTvVIU6GkG8yrSEUovA6vfgZWQMb4aw2HkXSs=;
        b=XPPl8xFTglrDDOf1okcTumQeQu8uloMq4AJlmilB31qGihANq/YAyrTb1+EFfc2Uly
         xUKRCNMqh0q/VnEkWevrepkg3y6dkpXhvp75UjRihs+ISR5XuGfVPxKS4BwrqHEeD7Ne
         uyuHoot90nI8LAMYmMtWK+TlBfIuCVIlQ8mIIjx5Q4xOGjmv51RfaMW4jCmoKoMaNm7T
         KYVuBiumBbpP8bMVod8Ocw5rOfI7QScoCX4k3Vqc2piaVIZsXoLHuIdttnbcD5Chgar3
         Y5/nnj1FqxPCM4RsZSGboGT3TKm3+BzeWCo6qtnDC9caHQDK3azQ2niEup0etprjY+FY
         g62Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b687c1asi116924996d6.326.2024.10.01.07.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 07:12:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svdbX-0007PS-VH; Tue, 01 Oct 2024 10:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svdbV-0007Jx-TR; Tue, 01 Oct 2024 10:11:53 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1svdbR-0002zy-U4; Tue, 01 Oct 2024 10:11:53 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 1 Oct
 2024 10:43:35 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 1 Oct 2024 10:43:35 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v7 2/8] hw/gpio/aspeed: Support to set the different memory
 size
Date: Tue, 1 Oct 2024 10:43:28 +0800
Message-ID: <20241001024334.834807-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241001024334.834807-1-jamin_lin@aspeedtech.com>
References: <20241001024334.834807-1-jamin_lin@aspeedtech.com>
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
X-TUID: Omys5/JSJ93n

According to the datasheet of ASPEED SOCs, a GPIO controller owns 4KB of
register space for AST2700, AST2500, AST2400 and AST1030; owns 2KB of
register space for AST2600 1.8v and owns 2KB of register space for
AST2600 3.3v.

It set the memory region size 2KB by default and it does not compatible
register space for AST2700.

Introduce a new class attribute to set the GPIO controller memory size
for different ASPEED SOCs.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/gpio/aspeed_gpio.c         | 7 ++++++-
 include/hw/gpio/aspeed_gpio.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 00fb72a509..564459ad4f 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -1047,7 +1047,7 @@ static void aspeed_gpio_realize(DeviceState *dev, Error **errp)
     }
 
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_gpio_ops, s,
-            TYPE_ASPEED_GPIO, 0x800);
+                          TYPE_ASPEED_GPIO, agc->mem_size);
 
     sysbus_init_mmio(sbd, &s->iomem);
 }
@@ -1130,6 +1130,7 @@ static void aspeed_gpio_ast2400_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_sets = 7;
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
+    agc->mem_size = 0x1000;
 }
 
 static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
@@ -1141,6 +1142,7 @@ static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_sets = 8;
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
+    agc->mem_size = 0x1000;
 }
 
 static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
@@ -1152,6 +1154,7 @@ static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_sets = 7;
     agc->reg_table = aspeed_3_3v_gpios;
     agc->reg_table_count = GPIO_3_3V_REG_ARRAY_SIZE;
+    agc->mem_size = 0x800;
 }
 
 static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
@@ -1163,6 +1166,7 @@ static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_sets = 2;
     agc->reg_table = aspeed_1_8v_gpios;
     agc->reg_table_count = GPIO_1_8V_REG_ARRAY_SIZE;
+    agc->mem_size = 0x800;
 }
 
 static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
@@ -1174,6 +1178,7 @@ static void aspeed_gpio_1030_class_init(ObjectClass *klass, void *data)
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

