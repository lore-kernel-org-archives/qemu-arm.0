Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp1217405ejg;
        Fri, 19 Jan 2024 13:52:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFB3VDBd4ac/EIEz/4PfUaEkz0lsEdvcEcro63y90WHnUU5TYDO4k6J7i/TFK9kjdnsUWFt
X-Received: by 2002:a25:8306:0:b0:dbe:9dca:f1ed with SMTP id s6-20020a258306000000b00dbe9dcaf1edmr559229ybk.78.1705701133166;
        Fri, 19 Jan 2024 13:52:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705701133; cv=none;
        d=google.com; s=arc-20160816;
        b=HzJc+WwJu2XsjHKx/BgsOHFT/CE04g2Qk89o++RNWqk2XqbWhufJVRaR6PhJvsB352
         SfM0bcYlsBWtLkv6s8/nLLQY1/nziqQClEIKlbvHH6P867hLVgZFSGBYbZjIYeUVirUh
         hqQq5p40wKf4mZLePVd/4GoMxy12b2lpomkcxK8BW+dCYCx2RybUVyPTUIMzS5cnjgEw
         vAo6t6LrFwi8yOi7ucw1q6rCIDlkHxnlQUecmoSWyPXCyy5jICA7Y118noNxlunkBF1O
         9qV3NL7EDOwAfs9u8rzB4ZF8Us5D9JjIEOyEfPMuHp4MhL9g59ckWnqguX18kQ2Y5qGA
         wsOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kzOrVlFRj/NdOh1lLvn8pDfgdHcR2iZT2G+ZVE6nW3Q=;
        fh=lfuYXVtC1uxUzJXcx1BLjy5YFppJmZ2782Wl5dyoqHg=;
        b=Gf20/8fT4mOSY3CHv6n84rt94Gf+38ofB4YFrQP83caKWvMlBJPq2+7q8nnf9EtmiP
         8ZUfW9NytLR6mP0zgjek9xkGVHaW028OWak7tSLeoj6gtfqduol+jguNIpKWIV1jENLV
         HPdNQe+G2uEeElMCPZDv3/V0sH0mlj7TekJbJErY7tPSxGPY00oSSrvXBCyHZOC0wl86
         57vzIESRX1SWAajSaAXpD2Jajk7GLriq1vs7rqBDNC2xoaSESSvbOBLNT+fkzNYmPg3b
         KjtXKpIkv6kKUVVUhnmp75vI+caxtJ0CiqsdlHc5UaHEN3KQRhYLNAiu1llAIeT9iFRI
         vFZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dT2WYQ4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7-20020a0cf247000000b0068081587ca4si162866qvl.156.2024.01.19.13.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 13:52:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dT2WYQ4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQwln-0003tp-Qc; Fri, 19 Jan 2024 16:51:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQwlh-0003t5-GW
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 16:51:17 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQwlf-0005PZ-2Q
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 16:51:16 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e8d3b29f2so13452635e9.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 13:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705701073; x=1706305873; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzOrVlFRj/NdOh1lLvn8pDfgdHcR2iZT2G+ZVE6nW3Q=;
 b=dT2WYQ4s2BYwr55M6u/f5F5lPUlV32xO8muJ+mNw7WC5RjAUgg+K4RcnlkdEApks4p
 Ngua2LcKY8Q/45JtrvIJgWrAyVYuLcGWsDwuecopZeS61lBX0HStdlh5/A4pP1OloI7w
 23usW+Cc6hjAVmuQ50Gk1x7bea+jndHKy/fJDYEguCjgrZExXh61dZV2Oh+KYIf6I4XS
 kAUWFjOitNJsWliy3X1h4spoVK67JbIgoalUBzyj695XoN0jGa2FAghe/MtJzUTTBDAI
 xyFAuHr7zN9BMBGDXB4NO0SFy5Wco2hK+3MTLB1G4mp0nhF2AkUlBoKsziKwQQoT46rC
 xt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705701073; x=1706305873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kzOrVlFRj/NdOh1lLvn8pDfgdHcR2iZT2G+ZVE6nW3Q=;
 b=DddYN8cVYYamGLXAKuBtLxlwxqH+vmL5ctl8OawSWdy3Dq5ZSfh8+96MnGZfptv5rU
 HIhaSzbaa8Ojh7Wwc6md1WLVz1y7g0Wht5bM6gQkEWc51tfx+8/8h4bW48BQTAmoOIgh
 CnuXzhL0t39g3LbaYA0PX6VTQNebyZ97c+2kjkc8HDN897Acfx5n2VKVf1/flYAUyntc
 y0J50NfeLfw0ZTCY7FRQQC4boaRaCMZGrJEceA+lbzIuC+BlBnfN1MMC+qVRFx8AY9ej
 nyDIP1LqUu6l6yW54/tMje1sL7merhFqL8H8Y1AuIxHtpdFk1zJXIep12ZiDnNMZ7Px6
 062g==
X-Gm-Message-State: AOJu0Ywgx5m5uwj4Rd0j3+VSiPnRqYgZ0zcqt3d8xflxOR4LObh9ABV6
 prCnPXatmItZYQbTwDIyuKMLsgLBcdJwjUZLGpW5suZIsEi61HpHP6W/V6a1uis=
X-Received: by 2002:a05:600c:5013:b0:40e:4bef:f24f with SMTP id
 n19-20020a05600c501300b0040e4beff24fmr159027wmr.120.1705701073278; 
 Fri, 19 Jan 2024 13:51:13 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 g15-20020a5d64ef000000b00336f43fa654sm7470330wri.22.2024.01.19.13.51.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 13:51:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 1/2] hw/arm/allwinner-a10: Unconditionally map the USB Host
 controllers
Date: Fri, 19 Jan 2024 22:51:05 +0100
Message-ID: <20240119215106.45776-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119215106.45776-1-philmd@linaro.org>
References: <20240119215106.45776-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: zrkYoHMpARB3

The USB Controllers are part of the chipset, thus are
always present and mapped in memory.

This is a migration compatibility break for the cubieboard
machine started with the '-usb none' option.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/allwinner-a10.c | 49 +++++++++++++++++-------------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index b0ea3f7f66..0135632996 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -79,15 +79,10 @@ static void aw_a10_init(Object *obj)
 
     object_initialize_child(obj, "i2c0", &s->i2c0, TYPE_AW_I2C);
 
-    if (machine_usb(current_machine)) {
-        int i;
-
-        for (i = 0; i < AW_A10_NUM_USB; i++) {
-            object_initialize_child(obj, "ehci[*]", &s->ehci[i],
-                                    TYPE_PLATFORM_EHCI);
-            object_initialize_child(obj, "ohci[*]", &s->ohci[i],
-                                    TYPE_SYSBUS_OHCI);
-        }
+    for (size_t i = 0; i < AW_A10_NUM_USB; i++) {
+        object_initialize_child(obj, "ehci[*]", &s->ehci[i],
+                                TYPE_PLATFORM_EHCI);
+        object_initialize_child(obj, "ohci[*]", &s->ohci[i], TYPE_SYSBUS_OHCI);
     }
 
     object_initialize_child(obj, "mmc0", &s->mmc0, TYPE_AW_SDHOST_SUN4I);
@@ -165,28 +160,24 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
                    qdev_get_gpio_in(dev, 1),
                    115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
 
-    if (machine_usb(current_machine)) {
-        int i;
+    for (size_t i = 0; i < AW_A10_NUM_USB; i++) {
+        g_autofree char *bus = g_strdup_printf("usb-bus.%zu", i);
 
-        for (i = 0; i < AW_A10_NUM_USB; i++) {
-            g_autofree char *bus = g_strdup_printf("usb-bus.%d", i);
+        object_property_set_bool(OBJECT(&s->ehci[i]), "companion-enable",
+                                 true, &error_fatal);
+        sysbus_realize(SYS_BUS_DEVICE(&s->ehci[i]), &error_fatal);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
+                        AW_A10_EHCI_BASE + i * 0x8000);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
+                           qdev_get_gpio_in(dev, 39 + i));
 
-            object_property_set_bool(OBJECT(&s->ehci[i]), "companion-enable",
-                                     true, &error_fatal);
-            sysbus_realize(SYS_BUS_DEVICE(&s->ehci[i]), &error_fatal);
-            sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
-                            AW_A10_EHCI_BASE + i * 0x8000);
-            sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
-                               qdev_get_gpio_in(dev, 39 + i));
-
-            object_property_set_str(OBJECT(&s->ohci[i]), "masterbus", bus,
-                                    &error_fatal);
-            sysbus_realize(SYS_BUS_DEVICE(&s->ohci[i]), &error_fatal);
-            sysbus_mmio_map(SYS_BUS_DEVICE(&s->ohci[i]), 0,
-                            AW_A10_OHCI_BASE + i * 0x8000);
-            sysbus_connect_irq(SYS_BUS_DEVICE(&s->ohci[i]), 0,
-                               qdev_get_gpio_in(dev, 64 + i));
-        }
+        object_property_set_str(OBJECT(&s->ohci[i]), "masterbus", bus,
+                                &error_fatal);
+        sysbus_realize(SYS_BUS_DEVICE(&s->ohci[i]), &error_fatal);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ohci[i]), 0,
+                        AW_A10_OHCI_BASE + i * 0x8000);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->ohci[i]), 0,
+                           qdev_get_gpio_in(dev, 64 + i));
     }
 
     /* SD/MMC */
-- 
2.41.0

