Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp5008742njc;
        Fri, 8 Nov 2024 07:45:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX0xCejoDq3NVT2J50nUx1tjndDP1Y9nglI9oCsbyryK43oCbu+WqnIRIvzCUsgVFd7Hn5nw7OipIhG4w==@linaro.org
X-Google-Smtp-Source: AGHT+IHu++b2WFDC+DjZus7Xi1FE+i+ek+G3PQ0xP8DUqkFbGLyLdmafRZm7X514m1dXhsHoDoH6
X-Received: by 2002:a05:620a:3f85:b0:7a9:a3f7:ef30 with SMTP id af79cd13be357-7b331f20fb1mr461711285a.45.1731080718840;
        Fri, 08 Nov 2024 07:45:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731080718; cv=none;
        d=google.com; s=arc-20240605;
        b=CtdWqwUGukCY62W58r2swvk5r9kF+yHNrMjfkwaawMeVipT8WOTMjiPCCNgy9fTC1X
         FfMTly8fw9xdS0LazOm3sQ5jlqAya9uz7D5xOGPkA7wke2LAUUDNnsh4hbDxePb5JhXc
         zIrQBI1sLZdJapMG2t7gaVFl+6ErVkPCr96KYJcaMccc85GC2NUm4wz4lL6Fykbup9/B
         xGWDKW2m82ee7A7hH77kxsGMJTvQR6OJdNf0jyVqxu9uxcFsJ6Gztalmgw6yn/QTDV45
         xQS78Yi4zIxK+vj/G8n8G2JKp0QB2Ft0xNw8fEAXwi+c3EXxF5hAFZYkkEZZ/c5Alg/r
         GJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VTS56iSsTBU0rbweaIFAqMPbX9U8Q5qblgHU5lae1Ms=;
        fh=TZmD5N6GN+A27ke8IFTjAucD2smXdYjTUySh/+QFnWE=;
        b=bstaXLCEkW5ptibb6nCCs2H1YIXBzgbNhtt33yxFZ6DzPwWqPwq4F1XL9CINaqotU9
         9NbKpdF9viHHsMaQCKp+zwQwU8sWsdkvonsoNa1Ob/2UaaHJQMuPZCiz5HZJoCU4+6e+
         lIqeWphsfNrcSxge2Gia9zXCUC/OmWDM5Gix1HJjXfMlLCSfPHjv/3xVYGEDdktBIjTC
         V4H0hx7pjoAEu9GosMdbHFWJfSdX0OKus0LV49YxmR1J3behmK8tIrG49TtN0JGlOtX8
         rCM1w58W/4UFI2q0tgLCvKKnZYosFJx8j3j0pSjZPVulny55BKs8FBf8fXaH9RPT8RPK
         f/Xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mKgdf1yB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ace4ae2si439901785a.369.2024.11.08.07.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 07:45:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mKgdf1yB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9R9S-0003de-DR; Fri, 08 Nov 2024 10:43:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9R9N-0003OE-S5
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:43:56 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9R9L-0005VT-Qi
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:43:53 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-37d8901cb98so2046646f8f.0
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 07:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731080629; x=1731685429; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTS56iSsTBU0rbweaIFAqMPbX9U8Q5qblgHU5lae1Ms=;
 b=mKgdf1yBY/ZAaVDuHpvdp8I9ZO4dH2QOHYsdLwlUBqQnqj1haFnIIdZoJsRoa+JjGA
 PTOwIEWWp0+3odLAjDAzMb3mY0gfy2A8l4fa8ZvVYfKAowYAA+EXsRDOvjbgucz5v/nx
 xFtcpFUpwbpKYGW0gF6X6ejkr3zIn18vOdA7OP5ZZ8sYgfVWPrHKHMoDjQjLuXU7fnpj
 WS7WrKKpr6RYmEUyaqhMTZvN9RHM1W2fKCba+Nv4XqOdM6xWh+gUHBewGPAFt55q+m5g
 Ou71BmLqwqwPSlAbpFzFYAuCrdQKF1gZPcvIBe+VXCS7UBDGM/RGxCDnXDkVa/G45fFS
 dOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731080629; x=1731685429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VTS56iSsTBU0rbweaIFAqMPbX9U8Q5qblgHU5lae1Ms=;
 b=kkkaT4v9zKnOCkrfc36cwGIka0n4RtDvRnZSPa1hOHEgCFxxgAUOjIsasD34onQhls
 Ps01hsBXvNPEAOQDGXw2A8KRpYTQyswBSQHVZXM1I08MiC4TrT25VSUeE43YX3YaYlrm
 2nDTnXiH4bBjmkZF2B+WpsAoID8G2QbhvN7IplIjnOuoHo4v5j0l2woi026Uu7lgNejh
 LkKN+QXOD4yeEm8DbK4nSLmp6yMR82QGjN3oitKtQz5Fy+FMkTRory4/jzw6VLHOWCXP
 nmwspBhanwudwmI/EdhTlko9eUI9Ib2/sWJPleKSTjuTA4N0oMBJx6hoOsxqVHy9V228
 Kq4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu0wOmvYiqyr3pRrzT2iQ9GQh8ONx6s8EV8XMhKCeXk9vgwPjTNni48sKZw0MBHRspNaxdEwB1Ug==@nongnu.org
X-Gm-Message-State: AOJu0Yzhj+/2lC1mdhOSMM0hazec5gJgpVVxQLdlKD0IXykzk3fSY1dF
 QzU5NxOK5knAGfUy24ccItAS2GIHtEOsQOnaBUKSLiv/4q98rT6ROT7xHx7vy4U=
X-Received: by 2002:a5d:59a7:0:b0:37d:2d6f:3284 with SMTP id
 ffacd0b85a97d-381f1a6ca9bmr2972049f8f.9.1731080629309; 
 Fri, 08 Nov 2024 07:43:49 -0800 (PST)
Received: from localhost.localdomain ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed970d10sm5176298f8f.20.2024.11.08.07.43.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Nov 2024 07:43:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 06/17] hw/timer/xilinx_timer: Make device endianness
 configurable
Date: Fri,  8 Nov 2024 15:43:06 +0000
Message-ID: <20241108154317.12129-7-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108154317.12129-1-philmd@linaro.org>
References: <20241108154317.12129-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: BYWNDAk2ltz4

Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
Add the "little-endian" property to select the device
endianness, defaulting to little endian.
Set the proper endianness for each machine using the device.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_ml605_mmu.c      |  1 +
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
 hw/ppc/virtex_ml507.c                    |  1 +
 hw/timer/xilinx_timer.c                  | 35 +++++++++++++++---------
 4 files changed, 25 insertions(+), 13 deletions(-)

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
index f02d343e29..10d9713150 100644
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
index c117bff225..5bfb7e3929 100644
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
@@ -189,18 +193,21 @@ timer_write(void *opaque, hwaddr addr,
     timer_update_irq(t);
 }
 
-static const MemoryRegionOps timer_ops = {
-    .read = timer_read,
-    .write = timer_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .impl = {
-        .min_access_size = 4,
-        .max_access_size = 4,
+static const MemoryRegionOps timer_ops[2] = {
+    [0 ... 1] = {
+        .read = timer_read,
+        .write = timer_write,
+        .impl = {
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
+        .valid = {
+            .min_access_size = 1,
+            .max_access_size = 4,
+        },
     },
-    .valid = {
-        .min_access_size = 1,
-        .max_access_size = 4
-    }
+    [0].endianness = DEVICE_BIG_ENDIAN,
+    [1].endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void timer_hit(void *opaque)
@@ -233,8 +240,9 @@ static void xilinx_timer_realize(DeviceState *dev, Error **errp)
         ptimer_transaction_commit(xt->ptimer);
     }
 
-    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t, "xlnx.xps-timer",
-                          R_MAX * 4 * num_timers(t));
+    memory_region_init_io(&t->mmio, OBJECT(t),
+                          &timer_ops[t->little_endian_model], t,
+                          "xlnx.xps-timer", R_MAX * 4 * num_timers(t));
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &t->mmio);
 }
 
@@ -247,6 +255,7 @@ static void xilinx_timer_init(Object *obj)
 }
 
 static Property xilinx_timer_properties[] = {
+    DEFINE_PROP_BOOL("little-endian", XpsTimerState, little_endian_model, true),
     DEFINE_PROP_UINT32("clock-frequency", XpsTimerState, freq_hz, 62 * 1000000),
     DEFINE_PROP_UINT8("one-timer-only", XpsTimerState, one_timer_only, 0),
     DEFINE_PROP_END_OF_LIST(),
-- 
2.45.2

