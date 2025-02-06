Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1523504njb;
        Thu, 6 Feb 2025 05:11:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+ZQopFnCm6hKqZrhAUMl/dWf9D9lPb+7d6Kn2WrhYDk6xkCVmCvr8FVeDZIqzwKgDfp/Zj6hzdNop0g==@linaro.org
X-Google-Smtp-Source: AGHT+IFdPazENEycT/VUaOcK6gkhHAdLp0kWSWWve0A4fmegflHqNauqflWTrntJjpj7RlOm3ut9
X-Received: by 2002:ac8:5915:0:b0:467:58a4:ef68 with SMTP id d75a77b69052e-470281c1a85mr76576591cf.24.1738847488946;
        Thu, 06 Feb 2025 05:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738847488; cv=none;
        d=google.com; s=arc-20240605;
        b=jL4rzz0LMK11CNnQmvROzQ/HuVvNZzn1tNIlc9d3giaIM7ady1L7+DJR3dAx2+tlzY
         SL5KiPP2fZ1LQ3paAJZIZrTaN7HgoTdUAVjDi1vqfcUIQk80YAWVwoy5NkknaoVXn/AE
         8oYqD+D5Le1/isuzcaGOwwk9p+c1EiMOtzFFkUvi58rJy2IlKi9sPwrEylocqhnkRxPc
         /iSnMx0EufnbOEIZCZt2AhZCBymLl+UPyTxR83MjNeD9pQKPwbdjvIKqpB2Fg0p8R8MT
         tonm3J+p2tpADXrznacrn+4z5U8nJaOaG6pIhvgBJ1/lGP0qR4IVFXPdhXhgbBSbpaNR
         E14w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4hjV9qje+F9WM+1u7JaIIDgc7g6v/WUaxTXGCOTYvnI=;
        fh=7NsVx5R+L140HvZ0es4udPXCD2KdHoHcZm3kdyNBbE4=;
        b=dIwrkspynsYk6Q5QXBZN8fZbsEQpAmtECaBKN8XbWMbn+SvXg0147m5CzIwwp2wCyl
         D85gw3D2Nq7GD5eqVqj4FO6AgpjNUE7FUJXWVOBEmFW6CTzls1G9EZlIdU0poKmxev+I
         OB9kNlb6FrtjWKDqnkdATNviu2bF1Neke8r+js/MeJQZsMJDM1ulymxtmNi2+PkAWphF
         IpwOjclkVXMR8RfEc72aSG3RyL88sLmWjusnvfBd8Fsy6x3ANQoM+gB4/o0ZZ39F8TvG
         +IPHDzuHeKcxVk1jlAj/cqJSsffLJM19bn7PILyMza8p3RTQV+oMZVed2nhtjGim9feG
         f2EA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vDFtTl9c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4714927b0cbsi10977491cf.131.2025.02.06.05.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 05:11:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vDFtTl9c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg1f3-00051b-Me; Thu, 06 Feb 2025 08:11:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1ez-00050f-3r
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:11:13 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1ex-00082M-8r
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:11:12 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso6243465e9.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 05:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738847469; x=1739452269; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4hjV9qje+F9WM+1u7JaIIDgc7g6v/WUaxTXGCOTYvnI=;
 b=vDFtTl9cLjF3W12hmvrpTXgy6i1fKQSUh5Ac69JywwRisbOPuaGp9A2EL6BiQq1lJL
 3Ciz8mU/14SBo53ZEgSEkBTHs0A8wv4S6x6TE1bA7NiEK+UMXmkQDma2QcAFj9qKYjP+
 YzxoEmgwksulXEws4tfnvz+ZpCjiSiQWX3xWK2SfRRW/eqiKSHHoQntEW1fCydR+cNqi
 BJwS8ErSEd3PVhFC6BmK/4PuGUI/Wy+DVl2ZdpKOA2QZFAHln85/V0+yVSF6u99QtYta
 oZiGbiJXK74UX3IqPd3qXJKKUB5so3OjVphMOozfjCYatHqq3fjFREP/eywabVW3tXQ4
 kuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738847469; x=1739452269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4hjV9qje+F9WM+1u7JaIIDgc7g6v/WUaxTXGCOTYvnI=;
 b=EWvxYbROVmfwoSPj5iNM8bKJoaj3Zd4tz5AWozCRjXyRSChncfbfvmR7Ubbi5n0kBt
 XyouKdqgV1I0dgMFS2NpuUoRLrGP+sj9NXSsPf48UJKrYnQdk6SQ2lEWT6rvDVlDmrc1
 Oq4h6igET84QDhk7QWgFSGu+5eGQ3QgCrqiSVcMFwxyvdDtPOnk2afJjXx4uXM012j6J
 67IoGNKekJZCCP7dLSfs9PIfjHvqGff2uVtuYbrUjtrqaGZeva8YQtm9dsQNLQhnwtT2
 bWGf5JJa4Spoa1kbZpDXzd+0CpF0XFQmmpc33KDH2AnbrgvJNfhUXtSl3Fg7BxjrJ9VN
 Y0LQ==
X-Gm-Message-State: AOJu0YyFdiJM58m4YrsLjUs8M04B9Ea0mId5B+agPXoJ2bICG6eKFH7R
 cf14nNPzct3njAMCwV79e56XpWRI7AOeSbXlOqV8x8UpIr+i6D7/fMCKzqhxm4E=
X-Gm-Gg: ASbGncs+sgwDh5pqADp+g/SPVThRr5dgSwPDLnHVHnSyY9pwG/xvenskPxeNjoi2x05
 7WxlJcYeLciP61QPfD/6eG0JeAdIoTUZYvHg/kpEWNjUNQTrqLFJljRmFFGnwPpE1IIXHSFroBn
 LOT7y7B1QfhxF6O+kGo6dryYZ2w4107HqDhVNZexraWkuHI13CecGjRz53LPP/abI+8hQZWTXvM
 Ie105fjpI2GG+eHn8LjUzABekumvxCc0rrmXh2xiI78184CT91UrdV6Nf4Zg0HCx137rYema7GA
 sK7oQyraoYEckPfiS2MG8xRBeR0Jdl6nmFgMsUUdggLoK7wCNt6mv954Fk+Bc5XaHQ==
X-Received: by 2002:a05:600c:512a:b0:434:f3a1:b214 with SMTP id
 5b1f17b1804b1-4390d56cd58mr50851855e9.28.1738847469434; 
 Thu, 06 Feb 2025 05:11:09 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc5839877sm254030f8f.3.2025.02.06.05.11.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 06 Feb 2025 05:11:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 03/16] hw/timer/xilinx_timer: Make device endianness
 configurable
Date: Thu,  6 Feb 2025 14:10:39 +0100
Message-ID: <20250206131052.30207-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206131052.30207-1-philmd@linaro.org>
References: <20250206131052.30207-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: 83M8fS04uEYw

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
index cf3b9574db3..bbda70aa93b 100644
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
index fbf52ba8f2f..9d4316b4036 100644
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
index 23238119273..f87c221d076 100644
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
index 6595cf5f517..d942ac226e6 100644
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
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
     },
-    .valid = {
-        .min_access_size = 4,
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
 
 static const Property xilinx_timer_properties[] = {
+    DEFINE_PROP_BOOL("little-endian", XpsTimerState, little_endian_model, true),
     DEFINE_PROP_UINT32("clock-frequency", XpsTimerState, freq_hz, 62 * 1000000),
     DEFINE_PROP_UINT8("one-timer-only", XpsTimerState, one_timer_only, 0),
 };
-- 
2.47.1

