Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp308064lfc;
        Tue, 13 Jul 2021 00:03:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNO0bwS9jYYEoNMMHHi+4P07Bk6caPSQueFGgAPhxkEvd7QVBfl3M20uJYCQzFJsGN+7VP
X-Received: by 2002:a1f:a00d:: with SMTP id j13mr3441179vke.18.1626159779920;
        Tue, 13 Jul 2021 00:02:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626159779; cv=none;
        d=google.com; s=arc-20160816;
        b=hg1j+dzWB9IHySSYwXv32SV9aaqAgXQ7GobfSZLtPedkJDxQxX5FqQf+WGpcSxlIka
         hMbTB9GUH+csCR+hIG0FPybl6+x27QHl7PaNjPz869Q/Hr+aTDyhojrDcD2Fh3SRGw8W
         fEx+2cO5XIlkePi4eEDqQ8t4rWB2IpCBD4SOzK6bk/CqwI2Bgrdqc1SKURFiKvYNyE3A
         uWgMsOHrfLsn6x+TXAdLhCsezJ155Q+GyeocnDOkzZMkxLWtSG+JBtgDzjIDLs8lyPiR
         g5fX9k1nwwqtOwNS0MNaGLUe5EmTWcHdrThuqZJF8nIeuPVi6CRrci2lTSRKznVckVmz
         fCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jXr0oYdxuCPhHpRyN6xru8psZhpSihWPYHRi9fijk8M=;
        b=TwDNGEFihevLWJ+C/ey5lWaTeLp6IckttbAwWMi6YjuNLkqtDaHO44wWAjKKjoktks
         ylbLRW9JWh6itTstgxylWVVoG2Yru5XGAe4KL7U/8gB7cN98hpl1r6YwMiStQ7MN7RxH
         jul8qUvcYuEGLDffDPhJIV6/HtvcHgACYvQkNCr8uLGtbNnLpmw1/EvUFK2pHQGMr4gP
         GXBhWnoTaJOEsPjBZOxMYiww/c973YTqNlaEpPYBti1yhPxYxPhj2O25f7w/w27An/kR
         FKGU1vEJgmZYzRkFkraoXpgmQ3HwoGGMkFkp1X8MQBa7GlY+dib4EgUgmgte46E8Xn27
         u6LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jlVJQYOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n25si18902500uab.71.2021.07.13.00.02.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 00:02:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jlVJQYOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3CRV-0001ME-LP
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 03:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1m3CNy-00076t-HI; Tue, 13 Jul 2021 02:59:18 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1m3CNw-000227-BX; Tue, 13 Jul 2021 02:59:18 -0400
Received: by mail-pg1-x529.google.com with SMTP id y17so20754935pgf.12;
 Mon, 12 Jul 2021 23:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jXr0oYdxuCPhHpRyN6xru8psZhpSihWPYHRi9fijk8M=;
 b=jlVJQYOVvbWP7le3mhf/a7ofMoKCi1W+H7AZEnKTCGgyWpf9PuDWlqQ0a6VMOAUmk3
 b/CgX/eUNjZkMIWhJNNms28r6DGtVjUR4AByPf4BfauA4EqdmTcJhhHWzVK/NMpc7uVs
 nEBEWC79oeeicaxnwg7Q1S2m9J5ESeXc2F8lVLdedf8YRosjITDey5WWLvVcq2mR1FX6
 jR8indKOp8qhaxyIU40I9qVzv19pwPHWxm9y4m5Rr9eqa5x9qoVfbJtu7iAiQwj+f4Nz
 NVOXEf5vFDBndrvH5LFHl5Z9nBuyg9syzmg1ZuHptn6R6C4sFd07L7DN+uyI8nZG0Bh8
 QeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jXr0oYdxuCPhHpRyN6xru8psZhpSihWPYHRi9fijk8M=;
 b=PCYoLBBNzhRzcMvEnKNnre3N7twW1jW3k9B/hOQUUbr5VfujwhqZCV4HthPi37eQ5B
 VIyzDNNFjSWAHnVqjzbPG7Rk6yG7+0dpcR81K/xOv7IyH4jNp6QzBrfICY/vRz+v1iVv
 SJI5d9f8BwnQ4n9gw1eVy/ES++BBTvpaN3rDRkhFKT6GYApXpjmCS047eVFcAK8mULnr
 +8F9HR7frQ9NiXC+7A0gQ56FtuZIJ3Qf5vfc6hgNtphqaQzpwMENjk0qrIvon26Qiyl3
 tHKcyTuj9fFBiRnSN41TWCuNdKS+d7LIq2MbJhCZl2Mbhu+2/DJXkVrlc3AuIkU1gV4c
 kF+g==
X-Gm-Message-State: AOAM533VwuhkUd3snbxsEw93P3PKWD8cZju8wBZlMJisj3TkwXjCViKv
 LsssVIXYRzzXB0o08dRsBPU=
X-Received: by 2002:a62:15c5:0:b029:32c:ea9f:a5ed with SMTP id
 188-20020a6215c50000b029032cea9fa5edmr2955428pfv.27.1626159554762; 
 Mon, 12 Jul 2021 23:59:14 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id o184sm20334846pga.18.2021.07.12.23.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 23:59:13 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 3/3] hw: aspeed_gpio: Clarify GPIO controller name
Date: Tue, 13 Jul 2021 16:28:54 +0930
Message-Id: <20210713065854.134634-4-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713065854.134634-1-joel@jms.id.au>
References: <20210713065854.134634-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rashmica Gupta <rashmica.g@gmail.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jsdU/K/SC8xl

There are two GPIO controllers in the ast2600; one is 3.3V and the other
is 1.8V.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/gpio/aspeed_gpio.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index dc721aec5da7..dfa6d6cb40a9 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -164,12 +164,12 @@
 #define GPIO_YZAAAB_DIRECTION      (0x1E4 >> 2)
 #define GPIO_AC_DATA_VALUE         (0x1E8 >> 2)
 #define GPIO_AC_DIRECTION          (0x1EC >> 2)
-#define GPIO_3_6V_MEM_SIZE         0x1F0
-#define GPIO_3_6V_REG_ARRAY_SIZE   (GPIO_3_6V_MEM_SIZE >> 2)
+#define GPIO_3_3V_MEM_SIZE         0x1F0
+#define GPIO_3_3V_REG_ARRAY_SIZE   (GPIO_3_3V_MEM_SIZE >> 2)
 
 /* AST2600 only - 1.8V gpios */
 /*
- * The AST2600 two copies of the GPIO controller: the same 3.6V gpios as the
+ * The AST2600 two copies of the GPIO controller: the same 3.3V gpios as the
  * AST2400 (memory offsets 0x0-0x198) and a second controller with 1.8V gpios
  * (memory offsets 0x800-0x9D4).
  */
@@ -380,7 +380,7 @@ static uint32_t update_value_control_source(GPIOSets *regs, uint32_t old_value,
     return new_value;
 }
 
-static const AspeedGPIOReg aspeed_3_6v_gpios[GPIO_3_6V_REG_ARRAY_SIZE] = {
+static const AspeedGPIOReg aspeed_3_3v_gpios[GPIO_3_3V_REG_ARRAY_SIZE] = {
     /* Set ABCD */
     [GPIO_ABCD_DATA_VALUE] =     { 0, gpio_reg_data_value },
     [GPIO_ABCD_DIRECTION] =      { 0, gpio_reg_direction },
@@ -800,7 +800,7 @@ static const GPIOSetProperties ast2500_set_props[] = {
     [7] = {0x000000ff,  0x000000ff,  {"AC"} },
 };
 
-static GPIOSetProperties ast2600_3_6v_set_props[] = {
+static GPIOSetProperties ast2600_3_3v_set_props[] = {
     [0] = {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
     [1] = {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
     [2] = {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
@@ -927,7 +927,7 @@ static void aspeed_gpio_ast2400_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_pins = 216;
     agc->nr_gpio_sets = 7;
     agc->gap = 196;
-    agc->reg_table = aspeed_3_6v_gpios;
+    agc->reg_table = aspeed_3_3v_gpios;
 }
 
 static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
@@ -938,17 +938,17 @@ static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
     agc->nr_gpio_pins = 228;
     agc->nr_gpio_sets = 8;
     agc->gap = 220;
-    agc->reg_table = aspeed_3_6v_gpios;
+    agc->reg_table = aspeed_3_3v_gpios;
 }
 
-static void aspeed_gpio_ast2600_3_6v_class_init(ObjectClass *klass, void *data)
+static void aspeed_gpio_ast2600_3_3v_class_init(ObjectClass *klass, void *data)
 {
     AspeedGPIOClass *agc = ASPEED_GPIO_CLASS(klass);
 
-    agc->props = ast2600_3_6v_set_props;
+    agc->props = ast2600_3_3v_set_props;
     agc->nr_gpio_pins = 208;
     agc->nr_gpio_sets = 7;
-    agc->reg_table = aspeed_3_6v_gpios;
+    agc->reg_table = aspeed_3_3v_gpios;
 }
 
 static void aspeed_gpio_ast2600_1_8v_class_init(ObjectClass *klass, void *data)
@@ -984,10 +984,10 @@ static const TypeInfo aspeed_gpio_ast2500_info = {
     .instance_init  = aspeed_gpio_init,
 };
 
-static const TypeInfo aspeed_gpio_ast2600_3_6v_info = {
+static const TypeInfo aspeed_gpio_ast2600_3_3v_info = {
     .name           = TYPE_ASPEED_GPIO "-ast2600",
     .parent         = TYPE_ASPEED_GPIO,
-    .class_init     = aspeed_gpio_ast2600_3_6v_class_init,
+    .class_init     = aspeed_gpio_ast2600_3_3v_class_init,
     .instance_init  = aspeed_gpio_init,
 };
 
@@ -1003,7 +1003,7 @@ static void aspeed_gpio_register_types(void)
     type_register_static(&aspeed_gpio_info);
     type_register_static(&aspeed_gpio_ast2400_info);
     type_register_static(&aspeed_gpio_ast2500_info);
-    type_register_static(&aspeed_gpio_ast2600_3_6v_info);
+    type_register_static(&aspeed_gpio_ast2600_3_3v_info);
     type_register_static(&aspeed_gpio_ast2600_1_8v_info);
 }
 
-- 
2.32.0

