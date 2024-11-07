Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3910532njc;
        Wed, 6 Nov 2024 17:24:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWT6OtEkN4/9arD4PTgTwhA/LQ7Wx41R+e/jqabq/3GaIVY48MYaBSIFFt6CDSBQp0vGXBORvDnHhCRiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGhg9YPwPbbycruoAABevslCVad8PEDTjh+iICB9dhFSXisJ/Z+h0aLCPzNy3DHPg302IZy
X-Received: by 2002:a05:620a:28c3:b0:7b1:48ff:6b56 with SMTP id af79cd13be357-7b32bc80888mr8605885a.43.1730942641255;
        Wed, 06 Nov 2024 17:24:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730942641; cv=none;
        d=google.com; s=arc-20240605;
        b=Iu1m+OAw09PzcAue/oZ8slzc/NUrEJ+SvhewatKqxEdXjFCTU913AJB58OJdBY7zRk
         EYRcoei94FjyExvmBhLm/V2vlmWnFbuUibK2VvixYRM6bsynx0A8pnUPnhIXzv7+jmHl
         ifPqK0xYRazu8MTGmfIV4ziQ7EZzChJlrjdEv36XveQ1MpApuPnCW82Z4vg73+7cMe4Q
         P8wz/geVJnzhIUqvWgUEpIN2HysyXg/xVwhmdTCcsBjDdZ6dQRrbTSzaaVC1vWavxgW9
         53EV0vhdyMQMwBu+kjJ78GWwHXicAmVO2sBXmAjKP3dPkTxoeXimltk1X5Ybx21RvRtw
         GJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vxVvEHAlcUJ/WXDJ+TYNZZ5nqed3WsROD6+NvXJeuxE=;
        fh=M7SFo2JfT/aWmTbmG8UBD7V2bNzX6yaoQIWJN7brCxU=;
        b=f0H7wpHSfEJnsF4ZRIn0nAXwWd9fAJBIvEPuV87kwM9u8+7av2PdS4DSdKYVetFNUg
         MVKhZqpa4XwFEnUOwo7wyHUzEUBV3LDeS6oHbMfgLi6bFyecA2ZwygbpTm+HfFijjeNK
         bh2yvUhEH4BrPxF/XzHXxsMRyK7mOHcv6HYAoh4lg23nE81EX2IVnA9Uvo91EA2XQeCF
         iFLiMMn6gTGqheyXFJswIodJp6nsyYVk/JZMfpPm25hKSmwVLdfm0ql0rhuO13a1yigJ
         IE2B59N7g+MxUh/H366M6xsJ1eM7js2zr5O20Uzyol2Bz0W7mq9TUSpxbB0Z9zt94R5i
         12GQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jyHT7Uca;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ace4af0si39205285a.370.2024.11.06.17.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2024 17:24:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jyHT7Uca;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8rEs-000510-Fc; Wed, 06 Nov 2024 20:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rEp-0004w0-Mf
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:23:08 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rEn-00037c-Hk
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:23:07 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4315eeb2601so4957695e9.2
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2024 17:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730942584; x=1731547384; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vxVvEHAlcUJ/WXDJ+TYNZZ5nqed3WsROD6+NvXJeuxE=;
 b=jyHT7UcadNY8qW2oQIDXJPVhlWuE6GymdZ4dogdSYrJbCniu3lwL8YPdJ9z5pksi/D
 UvQDI9SJOkTHfVkKg87AwukuBuQtx5fZSchA1pomdimuu5+nPkHloSrxq7e38JbKuNAL
 EIj/qu5YaKwZVzjEqpYCPuph3a09hRCjc8N0ZaYUj8DmeQbpwcNh/JvLuLNJoPoHhrCv
 CwraB7pV2BffCRVRbE0hltgXR1kN/FkiikZUSlXLegH/zCt925sYJZVVZBEH7UsI89q1
 K2D6ja5hHzXrC/HwMx9Es10KAmvVZUPrjN6VuvNKIhShAg7U0wD8z86srV1abiw7X9t/
 2CDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730942584; x=1731547384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vxVvEHAlcUJ/WXDJ+TYNZZ5nqed3WsROD6+NvXJeuxE=;
 b=S7s+8JsotvIOi1XiQx1zAM2unSmiBAvsuRd+G/5Clo3U1pvL/0/ozdO8h0+HDdRGTU
 0NZrrjGnttJV+OQ3HgqdNz3wNG7M3o2PyJsNUBrEfrHvvTaTVjhuejup9AsVUsyy/uMQ
 KQci1grd/X7G8QvpKtGITBGgxxnFosanmX81L9xlXjjImOX4UKgyjqPTjfvfazWpcoPb
 rfCsgK10n4/F90DYI7UclLHNqIT32UXjKvoHpgogPfTU1bRFwNbdwLPrD0iH/P+UGbMI
 w+5y9f6PTxXBuNzwfa8KWBTFARn98qNEwUpcxcwoXnQrEW83WgksOL7xjic7grIgkw57
 NtXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5AD2qzAPX3vM/qfv03w6g6YMpw4Prxw67K1mC0SKprE5N4ypOaNTFaubZjHOUNWEKiWVU/b7+yw==@nongnu.org
X-Gm-Message-State: AOJu0YxLpOtCdfyHznPGuBBuA1RSZ0RY31s3ltae5cZurFNXh/L7AmJR
 z3W3weI8unMvSjwKGDya0Enb8UjR/jUH+0Cjpaa5Los0pJRP4pFkNFyhokwf1Tk=
X-Received: by 2002:a5d:47a7:0:b0:37d:53d1:84f2 with SMTP id
 ffacd0b85a97d-381c7a465cdmr23323925f8f.11.1730942583986; 
 Wed, 06 Nov 2024 17:23:03 -0800 (PST)
Received: from localhost.localdomain ([89.101.241.141])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda066fdsm229541f8f.104.2024.11.06.17.23.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 17:23:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, devel@lists.libvirt.org,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 06/16] hw/timer/xilinx_timer: Make device endianness
 configurable
Date: Thu,  7 Nov 2024 01:22:12 +0000
Message-ID: <20241107012223.94337-7-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107012223.94337-1-philmd@linaro.org>
References: <20241107012223.94337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: mxJgdV6qLyi6

Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
Add the "little-endian" property to select the device
endianness, defaulting to little endian.
Set the proper endianness for each machine using the device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_ml605_mmu.c      |  1 +
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
 hw/ppc/virtex_ml507.c                    |  1 +
 hw/timer/xilinx_timer.c                  | 46 +++++++++++++++++-------
 4 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 64e8cadbee..f4ec983fee 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -127,6 +127,7 @@ petalogix_ml605_init(MachineState *machine)
 
     /* 2 timers at irq 2 @ 100 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
+    qdev_prop_set_bit(dev, "little-endian", true);
     qdev_prop_set_uint32(dev, "one-timer-only", 0);
     qdev_prop_set_uint32(dev, "clock-frequency", 100 * 1000000);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index f2e2dc2fd7..c0136d84c3 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -114,6 +114,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
 
     /* 2 timers at irq 2 @ 62 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
+    qdev_prop_set_bit(dev, "little-endian", !TARGET_BIG_ENDIAN);
     qdev_prop_set_uint32(dev, "one-timer-only", 0);
     qdev_prop_set_uint32(dev, "clock-frequency", 62 * 1000000);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index f378e5c4a9..ea0b3a56fe 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -230,6 +230,7 @@ static void virtex_init(MachineState *machine)
 
     /* 2 timers at irq 2 @ 62 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
+    qdev_prop_set_bit(dev, "little-endian", false);
     qdev_prop_set_uint32(dev, "one-timer-only", 0);
     qdev_prop_set_uint32(dev, "clock-frequency", 62 * 1000000);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index c117bff225..d356807d7c 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -3,6 +3,9 @@
  *
  * Copyright (c) 2009 Edgar E. Iglesias.
  *
+ * DS573: https://docs.amd.com/v/u/en-US/xps_timer
+ * LogiCORE IP XPS Timer/Counter (v1.02a)
+ *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
  * in the Software without restriction, including without limitation the rights
@@ -69,6 +72,7 @@ struct XpsTimerState
 {
     SysBusDevice parent_obj;
 
+    bool little_endian_model;
     MemoryRegion mmio;
     qemu_irq irq;
     uint8_t one_timer_only;
@@ -189,17 +193,31 @@ timer_write(void *opaque, hwaddr addr,
     timer_update_irq(t);
 }
 
-static const MemoryRegionOps timer_ops = {
-    .read = timer_read,
-    .write = timer_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .impl = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-    .valid = {
-        .min_access_size = 1,
-        .max_access_size = 4
+static const MemoryRegionOps timer_ops[2] = {
+    {
+        .read = timer_read,
+        .write = timer_write,
+        .endianness = DEVICE_LITTLE_ENDIAN,
+        .impl = {
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
+        .valid = {
+            .min_access_size = 1,
+            .max_access_size = 4,
+        },
+    }, {
+        .read = timer_read,
+        .write = timer_write,
+        .endianness = DEVICE_BIG_ENDIAN,
+        .impl = {
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
+        .valid = {
+            .min_access_size = 1,
+            .max_access_size = 4,
+        },
     }
 };
 
@@ -233,8 +251,9 @@ static void xilinx_timer_realize(DeviceState *dev, Error **errp)
         ptimer_transaction_commit(xt->ptimer);
     }
 
-    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t, "xlnx.xps-timer",
-                          R_MAX * 4 * num_timers(t));
+    memory_region_init_io(&t->mmio, OBJECT(t),
+                          &timer_ops[t->little_endian_model], t,
+                          "xlnx.xps-timer", R_MAX * 4 * num_timers(t));
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &t->mmio);
 }
 
@@ -247,6 +266,7 @@ static void xilinx_timer_init(Object *obj)
 }
 
 static Property xilinx_timer_properties[] = {
+    DEFINE_PROP_BOOL("little-endian", XpsTimerState, little_endian_model, true),
     DEFINE_PROP_UINT32("clock-frequency", XpsTimerState, freq_hz, 62 * 1000000),
     DEFINE_PROP_UINT8("one-timer-only", XpsTimerState, one_timer_only, 0),
     DEFINE_PROP_END_OF_LIST(),
-- 
2.45.2

