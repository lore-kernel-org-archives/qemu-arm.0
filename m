Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp561409ejh;
        Wed, 3 Jan 2024 07:54:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpDdZHi7VIbyZ4QssXmRZZ5aDRsBGFgnvsUGZ759GBzB0cBjrqVS2r9GJT+M2NmJEtTYQO
X-Received: by 2002:a05:622a:1014:b0:428:3478:ea7d with SMTP id d20-20020a05622a101400b004283478ea7dmr1861909qte.7.1704297269399;
        Wed, 03 Jan 2024 07:54:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704297269; cv=none;
        d=google.com; s=arc-20160816;
        b=zp190WgFE+n19c4erCgi+8yPlmDt3YZ0A75HHfQtZQDv2eYYTcPLmp4nusnbsvhp5W
         V9LWp/XkEw8l7qlIaFcJYTxzzwViqxbJP87XsyDve3sb6lRnIkxA5WnZjdXGnJVXTHUr
         P3wAQjrkM4hPTzJgXlLxE1CRv7Ytv+qPOmkkoVP55PapvGJ5CEah7zaKKK1yx7KpZ6rp
         A3GrnBO51z501doWGM+0IiYBl/b1cCZspFQR62kQsA2CiGriwECJFLhUSK/bjc3bOF76
         TOVjQE3akJCZx5SrVe1HmOaYtTsGXZxYkNz4rzjzu6A0XZB5RndzfZtoTkLFMu5HLvHm
         JQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ysl0wBdigS6FigyDJpEb6rCnXvTRgK0Cq62hkKC91ac=;
        fh=HXATX5/62pMJVs80a2Hs0Qv0Y5F0Xlxx6Qu533NYerI=;
        b=aYiTIuDx0Jms00z9/6RZsDkDbd8sk6MD3XWIZlasWAZRxdI7zXUKXakh1NkE+fUDUR
         o4+Eio6DuFvoTWBzLfUSpr2qcYRu7x5PtWsbjA0vXUgeCH2PqvSjcdmBvNf9fEJKhfw6
         fMEvnT8ZP6KVnUzkL5wWNdvpl0DP5B95m4+QC/4jeoyVhibMl2xCImpbuhjJIozOYV2V
         xu920pvegh8bji5cGGvzQ03lOlIzW3aimMniSHDySkevYfQAr3V8CeCmEvCk8Xl8X6N0
         bsin9+GvTmiGGvFgsifP8ggoqxqNKlGVL7IjijJ4XwaFvexU4ytczxlj7LeLmBJ/SUFo
         oaXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18-20020a05622a14d200b0042540184032si30368020qtx.336.2024.01.03.07.54.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jan 2024 07:54:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rL3Z7-0004M9-Fk; Wed, 03 Jan 2024 10:53:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rL3Z5-0004Kh-Ul; Wed, 03 Jan 2024 10:53:55 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rL3Z2-00052L-Ko; Wed, 03 Jan 2024 10:53:55 -0500
Received: from buffy.. (buffy [192.168.147.6])
 by zoidberg.rfc1149.net (Postfix) with ESMTP id 42FAE80028;
 Wed,  3 Jan 2024 16:53:44 +0100 (CET)
Authentication-Results: zoidberg.rfc1149.net;
 dmarc=fail (p=none dis=none) header.from=rfc1149.net
Authentication-Results: zoidberg.rfc1149.net;
 spf=fail smtp.mailfrom=rfc1149.net
From: Samuel Tardieu <sam@rfc1149.net>
To: qemu-devel@nongnu.org
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 Anton Kochkov <anton.kochkov@proton.me>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Alexandre Iooss <erdnaxe@crans.org>, Samuel Tardieu <sam@rfc1149.net>
Subject: [PATCH v2 3/3] hw/arm/socs: configure priority bits for existing SOCs
Date: Wed,  3 Jan 2024 16:53:37 +0100
Message-ID: <20240103155337.2026946-4-sam@rfc1149.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240103155337.2026946-1-sam@rfc1149.net>
References: <20240103155337.2026946-1-sam@rfc1149.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 98uHT/0Icbh2

Update the number of priority bits for a number of existing
SoCs according to their technical documentation:

- STM32F100/F205/F405/L4x5: 4 bits
- Stellaris (Sandstorm/Fury): 3 bits

Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
---
 hw/arm/stellaris.c     | 2 ++
 hw/arm/stm32f100_soc.c | 1 +
 hw/arm/stm32f205_soc.c | 1 +
 hw/arm/stm32f405_soc.c | 1 +
 hw/arm/stm32l4x5_soc.c | 1 +
 5 files changed, 6 insertions(+)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index dd90f686bf..38981967f3 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -47,6 +47,7 @@
 #define BP_GAMEPAD   0x04
 
 #define NUM_IRQ_LINES 64
+#define NUM_PRIO_BITS 3
 
 typedef const struct {
     const char *name;
@@ -1067,6 +1068,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
 
     nvic = qdev_new(TYPE_ARMV7M);
     qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
+    qdev_prop_set_uint8(nvic, "num-prio-bits", NUM_PRIO_BITS);
     qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
     qdev_prop_set_bit(nvic, "enable-bitband", true);
     qdev_connect_clock_in(nvic, "cpuclk",
diff --git a/hw/arm/stm32f100_soc.c b/hw/arm/stm32f100_soc.c
index b90d440d7a..808b783515 100644
--- a/hw/arm/stm32f100_soc.c
+++ b/hw/arm/stm32f100_soc.c
@@ -115,6 +115,7 @@ static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
     /* Init ARMv7m */
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 61);
+    qdev_prop_set_uint8(armv7m, "num-prio-bits", 4);
     qdev_prop_set_string(armv7m, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 1a548646f6..a451e21f59 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -127,6 +127,7 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
 
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
+    qdev_prop_set_uint8(armv7m, "num-prio-bits", 4);
     qdev_prop_set_string(armv7m, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index a65bbe298d..2ad5b79a06 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -149,6 +149,7 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
 
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
+    qdev_prop_set_uint8(armv7m, "num-prio-bits", 4);
     qdev_prop_set_string(armv7m, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
diff --git a/hw/arm/stm32l4x5_soc.c b/hw/arm/stm32l4x5_soc.c
index 7513db0d6a..cc70c83d20 100644
--- a/hw/arm/stm32l4x5_soc.c
+++ b/hw/arm/stm32l4x5_soc.c
@@ -105,6 +105,7 @@ static void stm32l4x5_soc_realize(DeviceState *dev_soc, Error **errp)
     object_initialize_child(OBJECT(dev_soc), "armv7m", &s->armv7m, TYPE_ARMV7M);
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
+    qdev_prop_set_uint32(armv7m, "num-prio-bits", 4);
     qdev_prop_set_string(armv7m, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
-- 
2.42.0

