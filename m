Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp539534njc;
        Thu, 13 Feb 2025 04:23:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsoahiPO+VTYKMrfMxaYdufgd1Zc9GN+MHLTngwFO/fTVioC10gfRTnFyP6ZPC8sXDLfbv8mfCO1BMng==@linaro.org
X-Google-Smtp-Source: AGHT+IFVF6qprk72hGbv75lkEtUJa/NQUKd32dVBVmZpbhLfK5iyC0mSh0rhb3uRYwb3+nYunneC
X-Received: by 2002:a05:622a:5588:b0:467:6d36:4c94 with SMTP id d75a77b69052e-471c00f5d26mr41482781cf.2.1739449413860;
        Thu, 13 Feb 2025 04:23:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739449413; cv=none;
        d=google.com; s=arc-20240605;
        b=Ktdw3G4nWvlKJYTZH/SDi8FXrBL2R+9y1vqFqjw6V07lQnwiFr+P3wTByQcOClyYsc
         m3xbhNCIlnxA1qYkIMqLzrfRt39iIGSvRJvrdXAZy/u6AFnkW6UH2oKfZvn4SP/G21EN
         gKD+srd4xAoOW6HUUz/EYtntOtTVHeynRUJKFxgFMEDlaVTV58hDkG1AMp5DhWxkWzjp
         NWxcVnpZVs42m331MlHVXEcHDjojUZ2lF6N6HTnY6/L+4RKr/OVX7ECHByshxHA3f8iT
         9QntI6jmQHAghvBeS8Z0H0qS6/aFYj9QditZfqkUayJD8eyIZgkq1BC0GEh0rfrgIzQ8
         tEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=beBXQzm8Odt1Uvf1Ve10OQizHRpq30qh6q1sWSZQAuE=;
        fh=kE3gZWvE0nPsYETSGY2btn5wPQcccjJazgYXWOIL9ZY=;
        b=R5Ymd/vwiRDzU/nIKT3G6nrC4H92W8NU4NpL4mfomN/yf8c3QRglKaz/c5fKzWyKSs
         3WK0ne1txs59HfQ/V0LTjpVMWIBPFG+7J/sEmCPaYGq+OgaIlwgj8r7a4VI/0LdF2rS7
         4N1FPJf4q1qGMQLrWSWZwfsX2x1m3cKQ3l4x8U3sHDvhrBCk7xxt9VR+DqQKW66SBf8P
         fAlk+5bqIHDDjA33/K0+tkKQN7h93/o6yV1CEwKa1l/Iatk4x0c+34+CUmgQN9Ng04cJ
         fom8KDN5W+tdDumw9ZfgflP4g+GfpGZZQ0PJVSaj3Hlh8HCeaVG2CrBsHqvONHo7TDn8
         hfbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ufmcSU/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471c2b7eeeesi12307441cf.638.2025.02.13.04.23.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 04:23:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ufmcSU/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiYF3-00029a-NV; Thu, 13 Feb 2025 07:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYF2-00028k-DL
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 07:22:52 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYEy-0002Xy-QU
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 07:22:52 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5de6069ceb5so3409424a12.1
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2025 04:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739449367; x=1740054167; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=beBXQzm8Odt1Uvf1Ve10OQizHRpq30qh6q1sWSZQAuE=;
 b=ufmcSU/Rmk+KYqCAPHEiAdBc+dtGS+8yGroT/ZNKtYOEOc96GJlXuBVOK0Og6aVJz6
 YypEmVIaXVet5lIBNEp05MbVsXJXQ3rWxRYauAXXDg3iR9xcsKcoTyDOj+hByQZBni1e
 RWkMnstgaszBkD+M33zE9wnsS07UvynrhyH5q9Pg/NAdlagKABQY5JTzhP4mqngyKic6
 iPOVDF/eWG9Cg0LPp3ZaVWAybRr/BdjvdYpy6UAPh1id6BcVA8Ho+EaH09pwZwdvowRM
 t7pRi2ecIapYGSsZJ23MEba5I+VaqeGe6bz4ltMydHQLehpE33wwiPsCnz2S7nUa6xC5
 /qYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739449367; x=1740054167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=beBXQzm8Odt1Uvf1Ve10OQizHRpq30qh6q1sWSZQAuE=;
 b=neIMiLnZmovdUlco/VBSDWIq6efETebw6S59KYvHdLjl5AggrvA2wtseuHOhXt959R
 CCC4hHwohSCNZpBjg0oTM1OowcAYYMwg5KtaGkU+GMtjiiN25Jsw+LhLfYc0ljnGp7FW
 CFR62XbpRViW+W+oZdcpYxe0IuRmisWuNIzfSBZhGBN/SDSH6/kBHYgjBSKuQO3fnICe
 9vG6F5UtkU2pHuab2r6mPOGS7tzDaqushX/h73co7FmsZsRTROrKZL+1NInVDqQDkYvr
 S+agqx4T+Dp3szDA+raeFac61t5ZlLQ7kiLt86KocW8T1wDj2umCxfIh1/usnA3xjmyv
 1ndA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbGLDZ/lYeFOnEyG8FFUOkzITK/eVvdPKzgAyXXoK7+qVOibeHtAlgtn3srJhibiarbBO4dWkIKA==@nongnu.org
X-Gm-Message-State: AOJu0YyM8bLKxxkTSsUqiYVuScz2VhCZVqqjVNcUbZXvQQSTroYQkuEw
 rFLHk9FpX2uQY2k3PGFPq3xZgYNwGV39vnGrUv4m/EpIftSxpr8piExRkZWTB9i2EzDCfSJNFWb
 3BPQ=
X-Gm-Gg: ASbGncuK6A/wEu8qgLjSR3uHz8I+a8f9hsaYpK8BR6RNwzQ6pBnsv0RZI2pVm1fP9Iq
 mN3+u5JlycgeaRTpAbu7b0Z1MdeOwFR/CygcQdfks+coHxjRO8uohdvFSouXsDbAZx/+qASRQLE
 /DD2veQDRxKH6YNJ8QJ92SCGaAAH/qxPsFn4zO4R8RETipsZRVwx39WU+pewo2z2oN2hUT5u1tQ
 01nvBeUbj5oRVbRQ3sBs6QZFlEEKkRhLUbFDLQysNhr6c9ADzLhliqBM+6xZrYG6zSAWVRQUSBC
 Nqe8qbf4J0thjo/Z3gbx2GxbWsCpBfPt9jTugLyq/nRMd6Q2kMDum4K1F6Hi
X-Received: by 2002:a05:6402:1d50:b0:5db:68bd:ab78 with SMTP id
 4fb4d7f45d1cf-5decba815dcmr2753720a12.10.1739449366641; 
 Thu, 13 Feb 2025 04:22:46 -0800 (PST)
Received: from localhost.localdomain (6.170.88.92.rev.sfr.net. [92.88.170.6])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1b4e8dsm1087391a12.14.2025.02.13.04.22.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Feb 2025 04:22:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v8 4/6] hw/timer/xilinx_timer: Make device endianness
 configurable
Date: Thu, 13 Feb 2025 13:22:15 +0100
Message-ID: <20250213122217.62654-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250213122217.62654-1-philmd@linaro.org>
References: <20250213122217.62654-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: ukecFzplP53C

Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair of
DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.

Add the "endianness" property to select the device endianness.
This property is unspecified by default, and machines need to
make it explicit.

Set the proper endianness for each machine using the device.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_ml605_mmu.c      |  1 +
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
 hw/ppc/virtex_ml507.c                    |  1 +
 hw/riscv/microblaze-v-generic.c          |  2 ++
 hw/timer/xilinx_timer.c                  | 43 +++++++++++++++++-------
 5 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index a876aeb0bba..984287fdc53 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -129,6 +129,7 @@ petalogix_ml605_init(MachineState *machine)
 
     /* 2 timers at irq 2 @ 100 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
+    qdev_prop_set_enum(dev, "endianness", endianness);
     qdev_prop_set_uint32(dev, "one-timer-only", 0);
     qdev_prop_set_uint32(dev, "clock-frequency", 100 * 1000000);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index d419dc49a25..caaea222a8c 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -116,6 +116,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
 
     /* 2 timers at irq 2 @ 62 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
+    qdev_prop_set_enum(dev, "endianness", endianness);
     qdev_prop_set_uint32(dev, "one-timer-only", 0);
     qdev_prop_set_uint32(dev, "clock-frequency", 62 * 1000000);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index df8f9644829..a01354d991d 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -231,6 +231,7 @@ static void virtex_init(MachineState *machine)
 
     /* 2 timers at irq 2 @ 62 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
+    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_BIG);
     qdev_prop_set_uint32(dev, "one-timer-only", 0);
     qdev_prop_set_uint32(dev, "clock-frequency", 62 * 1000000);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/riscv/microblaze-v-generic.c b/hw/riscv/microblaze-v-generic.c
index a21fdfbe6db..3c79f5733b2 100644
--- a/hw/riscv/microblaze-v-generic.c
+++ b/hw/riscv/microblaze-v-generic.c
@@ -104,6 +104,7 @@ static void mb_v_generic_init(MachineState *machine)
 
     /* 2 timers at irq 0 @ 100 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
+    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);
     qdev_prop_set_uint32(dev, "one-timer-only", 0);
     qdev_prop_set_uint32(dev, "clock-frequency", 100000000);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
@@ -112,6 +113,7 @@ static void mb_v_generic_init(MachineState *machine)
 
     /* 2 timers at irq 3 @ 100 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
+    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);
     qdev_prop_set_uint32(dev, "one-timer-only", 0);
     qdev_prop_set_uint32(dev, "clock-frequency", 100000000);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index 6595cf5f517..4620528f985 100644
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
@@ -23,10 +26,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/ptimer.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qom/object.h"
@@ -69,6 +74,7 @@ struct XpsTimerState
 {
     SysBusDevice parent_obj;
 
+    EndianMode model_endianness;
     MemoryRegion mmio;
     qemu_irq irq;
     uint8_t one_timer_only;
@@ -189,18 +195,21 @@ timer_write(void *opaque, hwaddr addr,
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
+    [0].endianness = DEVICE_LITTLE_ENDIAN,
+    [1].endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void timer_hit(void *opaque)
@@ -220,6 +229,12 @@ static void xilinx_timer_realize(DeviceState *dev, Error **errp)
     XpsTimerState *t = XILINX_TIMER(dev);
     unsigned int i;
 
+    if (t->model_endianness == ENDIAN_MODE_UNSPECIFIED) {
+        error_setg(errp, TYPE_XILINX_TIMER " property 'endianness'"
+                         " must be set to 'big' or 'little'");
+        return;
+    }
+
     /* Init all the ptimers.  */
     t->timers = g_malloc0(sizeof t->timers[0] * num_timers(t));
     for (i = 0; i < num_timers(t); i++) {
@@ -233,8 +248,9 @@ static void xilinx_timer_realize(DeviceState *dev, Error **errp)
         ptimer_transaction_commit(xt->ptimer);
     }
 
-    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t, "xlnx.xps-timer",
-                          R_MAX * 4 * num_timers(t));
+    memory_region_init_io(&t->mmio, OBJECT(t),
+                          &timer_ops[t->model_endianness == ENDIAN_MODE_BIG],
+                          t, "xlnx.xps-timer", R_MAX * 4 * num_timers(t));
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &t->mmio);
 }
 
@@ -247,6 +263,7 @@ static void xilinx_timer_init(Object *obj)
 }
 
 static const Property xilinx_timer_properties[] = {
+    DEFINE_PROP_ENDIAN_NODEFAULT("endianness", XpsTimerState, model_endianness),
     DEFINE_PROP_UINT32("clock-frequency", XpsTimerState, freq_hz, 62 * 1000000),
     DEFINE_PROP_UINT8("one-timer-only", XpsTimerState, one_timer_only, 0),
 };
-- 
2.47.1

