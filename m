Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2563051lfc;
        Sat, 5 Sep 2020 14:24:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4dgzQzOcT8QpPfa4xJx5jcJLVNlj6q+uhNOJaHLP2oLQR1kUEOVBXa66+mT4J3JYqL4Wo
X-Received: by 2002:a25:bc82:: with SMTP id e2mr17561710ybk.435.1599341071799;
        Sat, 05 Sep 2020 14:24:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599341071; cv=none;
        d=google.com; s=arc-20160816;
        b=LiA4+o9FMlfa8lfeCvW0qe0da8m4hNX8AZnHA7NeWf/gDEUW/A10aaC6aK7OKiPeLw
         dVZOTUimju2scinEi4vOTY8XhrhL7q74eQikDbXJnHjgWrMu5yiXHK0ot2SBOPhGk8pM
         rv9AZ9JyOqXUswfHmjRHzSfe7iZN9HA+AI+mzX6DbI1FJ1ijenHmIoI/ibwDhhHvmHsH
         D55sqgYm5o323YJsnGLN9O0vASropWGp4j/E/bIZY8NziN01sjt3qbJrEoM2t3rM712w
         8F5Oc5OXNPkngu8drBEEPbV5P+Yf4fdU5gBczKRnMxMD/Fvmt5cKIXRZZsOsgZBu1PFc
         LEXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=BdDznY8S0BQXDdPB7zGIQilI2U7UILqzIY71jz2SzvM=;
        b=xCpQ2ta2kA2a/rPI+b7YclyxaY5RInB3qQYMImcuY7OI2bmVOOi2LSRsf3H2JZUQ8j
         LGnJ9MOY15jvVbxZzMKua5tWEZ+K3XuKfhKhXR6/XylD6pEc3FHgZWutmoWibKa2ueYo
         5DFykb2f8d3Mtj3mUZzhjp8I7J/q6DQpaLaJrgY4sqcf8hi1M22IAlH+fKSL95bwcKj+
         BeDXe447tyzDQfiwxzHwYl79ZiuYwi2McCjGe5a41SUut7YGuSrNH/FrYQrPEGkbQ1ir
         wpBpqOYCjMrEMipcYvrj1wSRUY+q3HDXztGWXII4vLPddJtTajnbixbAzsEUkcgqUhzC
         /jHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LstX07pa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l184si11403599ybb.360.2020.09.05.14.24.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Sep 2020 14:24:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LstX07pa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEffj-0001wl-6V
	for alex.bennee@linaro.org; Sat, 05 Sep 2020 17:24:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kEffb-0001vr-AJ; Sat, 05 Sep 2020 17:24:23 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:34986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kEffZ-0007po-Iy; Sat, 05 Sep 2020 17:24:22 -0400
Received: by mail-wm1-x343.google.com with SMTP id o21so9842031wmc.0;
 Sat, 05 Sep 2020 14:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BdDznY8S0BQXDdPB7zGIQilI2U7UILqzIY71jz2SzvM=;
 b=LstX07paRhFsI70d4HZwovde+TW4Lqgmpk7v7nRJTck5Supygg0OmNz7eXjIelHYI+
 L2UXNT4j1hN7RdJQ7Bav5Msuw2TkqTLWC5Id24uwdLoGa+x0yro8XRNgJ+OpHwpLOT2u
 C+eaGG0N9yLMzJMDCC1IdudFgn3VVpvBrcMUmzFIUyPoeOAzIJK95rghHBbtRAxnMi4c
 GMz11D0dzPlRj1L0hSpjOCa2dQ1ZGBtT2r47HCabv+OJxq89ZYkeBhGZAnsO20Lu3LI7
 02EuK5c0zobVb3CPdocxm6IzUvfJL/1uykY4TzBuexEyUp73PXCixNNlA7T6j8UD4aTM
 TFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=BdDznY8S0BQXDdPB7zGIQilI2U7UILqzIY71jz2SzvM=;
 b=I9DIAZyWryOMTYvW+glq/Mgmykv4eZ8h6JpVHM/8TemHoyTeZsb1hB/E6Q6ePyL0xf
 rTF+aKtuV7L/qXnt8nnKp0USx+gIqjAZVFIoNRXW5hmZkoD1tVFuei66bCG3mZ19XZDd
 hcmo2CBSZbzObwoMWZEPs3dQLRHDGcHMRH0CQPuQlF0OJkhMtMwmCEMFzoz/+jrZbw9P
 Em6BKDt2YKuRVW3GJRUWIyDN+Y2hFH9Tt7y/qMvyHyEtDH7Y5K1+6TxamtGYujOkdg4Y
 M37XqRIYg0npB/eUdoB4oTh560DTo7un0smyNz9FU51jYTe/L6kbk7t3sd0lTGHfF5Cl
 FNWw==
X-Gm-Message-State: AOAM533KDmDRuQu2BVjN6U/m/fjT2LeNRPfKCPA8Jkx6YvUYuXld/NTd
 FgPglT6Aqftoz9/gj0B27S1xsMg1o+4=
X-Received: by 2002:a05:600c:2053:: with SMTP id
 p19mr13412672wmg.50.1599341058390; 
 Sat, 05 Sep 2020 14:24:18 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id q186sm20629903wma.45.2020.09.05.14.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 14:24:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/aspeed: Map the UART5 device unconditionally
Date: Sat,  5 Sep 2020 23:24:15 +0200
Message-Id: <20200905212415.760452-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e5xoNFvQNVbH

The UART5 is present on the machine regardless there is a
character device connected to it. Map it unconditionally.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed_ast2600.c | 8 +++-----
 hw/arm/aspeed_soc.c     | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 9d95e421435..1450bde7cf2 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -325,11 +325,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
 
     /* UART - attach an 8250 to the IO space as our UART5 */
-    if (serial_hd(0)) {
-        qemu_irq uart5 = aspeed_soc_get_irq(s, ASPEED_DEV_UART5);
-        serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
-                       uart5, 38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
-    }
+    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
+                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5),
+                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 35be126db6f..7eefd54ac07 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -283,11 +283,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* UART - attach an 8250 to the IO space as our UART5 */
-    if (serial_hd(0)) {
-        qemu_irq uart5 = aspeed_soc_get_irq(s, ASPEED_DEV_UART5);
-        serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
-                       uart5, 38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
-    }
+    serial_mm_init(get_system_memory(), sc->memmap[ASPEED_DEV_UART5], 2,
+                   aspeed_soc_get_irq(s, ASPEED_DEV_UART5), 38400,
+                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
-- 
2.26.2

