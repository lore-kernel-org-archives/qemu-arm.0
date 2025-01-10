Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp256498njn;
        Fri, 10 Jan 2025 08:03:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXQNjWLAlYT+5Kk+frNNLX3/lhs7iHqCYcUWtXXaSaryrnuWgcT3YdQV3PViScRwIAC+S34Rdbn6nSc8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHgwLynDyyKXNHMkObV/q7ZLuw/wcT87Dvh9rRy1uH7jKuDaH93mNi51N//wVihk5CQgxY5
X-Received: by 2002:a05:651c:1548:b0:302:1c90:58e5 with SMTP id 38308e7fff4ca-305f4450612mr37202081fa.0.1736525038555;
        Fri, 10 Jan 2025 08:03:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736525038; cv=none;
        d=google.com; s=arc-20240605;
        b=GolhyDCTkwKn1XaVYYPOwTCtPX5FAJkvH99Aiwi9eewgHTIJvTuK5G0M35AC5hJ0BQ
         6s9COkbVj9WpzTEy0R+Ep8WCCmKU6K6AxJ0eeqlI2tkjdroVsCTyKHJeJBln6oFUwckn
         IuIwQrsR0RCYziMzeK2j1mH+UC4aiJdWVtn7mysR4TlP8SM8/jZ8pwt77Epz4szMYZti
         jmDQ1TKkDW0OO0qgKH9nqzGxsR89S8ON3tHuXwArURuEGX0CCGZ7QCsZ9iJV4CQh9Fjl
         cqJjqNMKTb3h1HqGWq7Ah3Kc7CzdT5uAm5cUGQSJ3ezHybqxbI8Bzu/xag27yZg+9bJh
         QtNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=11iHBCaGxzy1H3GllyQ3szfgtatw8IIZSrsd+4vXp4U=;
        fh=KJhRTawJU/OtgkNGALEI7OP5spTtvg0SVi/Idu9zk2A=;
        b=lgfyhDNPcQsz3ecCGWmPJ/K2QaIVOcjSIab+MLHqvLqE7M2yV9QbkDbJVVePqx69Xc
         CjBoVKGzTyNGoVtH7arSyTJyGbJMRxRyz/7YFqTrk4crRxTerIJiDm35cjbvlMYM+OP9
         Ic3rp8qtR1tjOy2K+YaH9oJIKUsxKAD4s55qmsFwni4TWBxfAZvKWVgqNBs7pIx/iciF
         wpoSNaPnJD2vHE2OEZVs3nhmGT1Qe6J+FPauLWZGazWZ1OhcXCa/giGwpUaEbyFTowGJ
         bPiVL+HrWCf+r3iBcbdRKLkCTqCzGSCA4pNjItTT6fPCUYqo/RRwGMx4bQBA6/wR9MPk
         NnQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NkvdhhWM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 38308e7fff4ca-305ff286a65si12919271fa.356.2025.01.10.08.03.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2025 08:03:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NkvdhhWM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tWHTk-0007Z8-4y; Fri, 10 Jan 2025 11:03:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHT7-0007Jv-2v
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:49 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHT1-0004Go-PA
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:39 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385f07cd1a4so1687332f8f.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2025 08:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736524954; x=1737129754; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=11iHBCaGxzy1H3GllyQ3szfgtatw8IIZSrsd+4vXp4U=;
 b=NkvdhhWM97FlZ0SiKA3u++Pj6W6O/NWm0zAysZfRm+6NGAhHlvbZDeokZ2tC0P1vp9
 x8umtUCV9vyM5GuHyNeiVxibQ3VkLs3nqba1nlzudTeZnzSLmARocCHBwEUliTTrhiLl
 u5jbkOZz6q14VZUnld0J5rdZdK2oE9/ZtD8b85pPraFsgiEh2L59ysSGPOXbUHvCqKl1
 IRI6zk4JUW8BVLxIY8OzdReZCffma2RfX1ywHXniA9a1nC5ZrpxU0PEl7GozRIRYtcCl
 cGDtRdK2Lceu03kR7tlgoRmptJfq8feKF0m5KG+cLXTMiAzOtqdKUsH321pLgi400DXj
 I07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736524954; x=1737129754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=11iHBCaGxzy1H3GllyQ3szfgtatw8IIZSrsd+4vXp4U=;
 b=LIjaGBGH84ULDcSwtPxIHI6hmpwsmJCubIsWgfuV1VBuPjPgwbvwpurLRrel/L7ZDn
 Z1oGcrfYEggOjRRsRXAsnF7GTH6m7CipA7xgyyEv0oNpl+zGhxSoUoh7AbWPj108V6+D
 rcy1yaijdD2QviU98NGsy4+5eBkKGvX7NW4W6o3UJzA4uT7RXzQSpcmKfpJZTe2EWrKw
 nh4CkbkeIkKXhV+UzBogLZPnhUQIf2MqHBOOuMYfdqSAouJhOg9ldzUufL/o/f0UqJvN
 Q/wjxxhMU+Y7dxJIPuU2rLRauF0OnXDEvAQHKxck90gEJ2iykhi8IjFfXEFw5FL9LZHy
 8lYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Ds+vwT5gTXewCH1WoDlld65bYKioGmboOeHHJLCuV3Iadby41CoXT5zOUppYdI9ruu7Lo2KHQg==@nongnu.org
X-Gm-Message-State: AOJu0YzhdHmI/Ysrs6DvmeH2SQNYrO5XsTLY8iE7mrUQM3qCT9wLunmZ
 yflDVaI1RsO0ADApNvcS+aNRv6ocP+zl7Bym7doY2UMIIlUwupTjnkR7nph7/7k=
X-Gm-Gg: ASbGncu2cSDkdwZBQLLZ97/qv8HtR49pRnqpewtshJWCHQS0cCSZ2PI8JWgxBIr5nHN
 o4x3QurNHYPBLyEhUk+nvjWiRxupDvoeHnt/YEZAfx6j23dSvMQ+zc/z9q609W438fIBH+IiLp5
 OGrN97KSKAvq04cX2TKuosGTcRsyRCXZILwyYtY3kbAbGWFHNMVWfEZ9lbCUPwBfeKNUgPdsjPL
 gxUhXvTrYo4CNNZhUh2mm5Tun00hKYUIx87C0Q4OypvOkIU8yulEx7KSiC9VfERIe8SMSaYW787
 lGb9TJ8Tc1noc8mAeNRI8TKENE1mqdw=
X-Received: by 2002:a05:6000:1847:b0:386:3825:2c3b with SMTP id
 ffacd0b85a97d-38a87304672mr9420072f8f.18.1736524953527; 
 Fri, 10 Jan 2025 08:02:33 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c1967sm4765917f8f.86.2025.01.10.08.02.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jan 2025 08:02:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/9] hw/arm/stellaris: Map both I2C controllers
Date: Fri, 10 Jan 2025 17:02:01 +0100
Message-ID: <20250110160204.74997-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110160204.74997-1-philmd@linaro.org>
References: <20250110160204.74997-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 09Xvhgzxz5pa

There are 2 I2C controllers, map them both, removing
the unimplemented one. Keep the OLED controller on the
first I2C bus.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 64e6797553a..655bf85e89e 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1021,6 +1021,8 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
       { 0x40004000, 0x40005000, 0x40006000, 0x40007000,
         0x40024000, 0x40025000, 0x40026000};
     static const int gpio_irq[NUM_GPIO] = {0, 1, 2, 3, 4, 30, 31};
+    static const uint32_t i2c_addr[NUM_I2C] = {0x40020000, 0x40021000};
+    static const int i2c_irq[NUM_I2C] = {8, 37};
 
     /* Memory map of SoC devices, from
      * Stellaris LM3S6965 Microcontroller Data Sheet (rev I)
@@ -1062,7 +1064,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     qemu_irq adc;
     int sram_size;
     int flash_size;
-    I2CBus *i2c;
+    DeviceState *i2c_dev[NUM_I2C];
     DeviceState *dev;
     DeviceState *ssys_dev;
     int i;
@@ -1195,14 +1197,18 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
         }
     }
 
-    if (DEV_CAP(2, I2C(0))) {
-        dev = sysbus_create_simple(TYPE_STELLARIS_I2C, 0x40020000,
-                                   qdev_get_gpio_in(nvic, 8));
-        i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
-        if (board->peripherals & BP_OLED_I2C) {
-            i2c_slave_create_simple(i2c, "ssd0303", 0x3d);
+    for (i = 0; i < NUM_I2C; i++) {
+        if (DEV_CAP(2, I2C(i))) {
+            i2c_dev[i] = sysbus_create_simple(TYPE_STELLARIS_I2C, i2c_addr[i],
+                                              qdev_get_gpio_in(nvic,
+                                                               i2c_irq[i]));
         }
     }
+    if (board->peripherals & BP_OLED_I2C) {
+        I2CBus *bus = (I2CBus *)qdev_get_child_bus(i2c_dev[0], "i2c");
+
+        i2c_slave_create_simple(bus, "ssd0303", 0x3d);
+    }
 
     for (i = 0; i < NUM_UART; i++) {
         if (DEV_CAP(2, UART(i))) {
@@ -1381,7 +1387,6 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     /* Add dummy regions for the devices we don't implement yet,
      * so guest accesses don't cause unlogged crashes.
      */
-    create_unimplemented_device("i2c-2", 0x40021000, 0x1000);
     create_unimplemented_device("PWM", 0x40028000, 0x1000);
     create_unimplemented_device("QEI-0", 0x4002c000, 0x1000);
     create_unimplemented_device("QEI-1", 0x4002d000, 0x1000);
-- 
2.47.1

