Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp925684njb;
        Wed, 12 Feb 2025 03:27:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXLMGIffIbz0HSeAIA4TshAswThIl7XNOLlkZ8Oubdenwj/qzQjDmrNf5bHxj7GKNyUAFq0XZ6K8NyzIA==@linaro.org
X-Google-Smtp-Source: AGHT+IHkJc0DChYHmWBaaladGSu4emPLNKxj+m30NK/OSokwaYRAuLM6QafhdDfDs2x8YFT26uvu
X-Received: by 2002:a05:622a:11c4:b0:471:9480:1415 with SMTP id d75a77b69052e-471afdfb991mr45297741cf.6.1739359634081;
        Wed, 12 Feb 2025 03:27:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739359634; cv=none;
        d=google.com; s=arc-20240605;
        b=UjwxTcFUNQbz0UhRrA9xkr2jY8FRx58h5P+TP9RLKJU49aI/oGCtv3SRIW59PlVd5a
         40Hd18bp7YQjYEgTI6H4w9p7EfIzzKtPoTt+wxzLwdVbrq2dv9hLHYTNiUcXL7/1/yDU
         FJsDGPq1zhTnlmtOIOcUBb4BY5t+qM42e6/NE3zySmqlmwWFTKkwKPswtk3DzyM+D7c8
         Q0dXQLDsWpVQFwYARN9YH4fi27lsGa4dfY/+j41DpAnfenz6JOFijUleUVLsu02cxVU4
         qc6RVF3/ht28ij6cQVs8Vg4+VEpNK8OOCE9YGybXoXvaD1WdBw/eFDngGeRzGQ1z+5D1
         Yw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qque2XZ1dU81iGdYR24fO3GVnw9hhnz4b3BIk7lxH2E=;
        fh=CRb660l7fIo9/s6GXwmO40y7rRzFXGbNi7mdwNTdLS4=;
        b=Z9N9CSs+sb+sULVCbh1C2xY9LA2HWk4g5a/D91zyuxVeMYTSJi0MVrm/j+UJgKQUSI
         bd9mYK5AO0/XbHbqyOjIvfCih2Q3IPKh+QTpwu1sx5iHAdt3xCwO59uyojA+goPgwEJh
         DznZQAGdjJIxEx5O2cs+ID0cyY1Z/eYzA3xZ7fdPJG4XNj9XCOBxrjwk9gzFbe62a3gb
         2wjI6PqIilDMN7wSauaDoQxRToVZn9o+AKh352BII652T+0V9Rp9hKpPiackWh3J63Sy
         lSCVZ49+Hdh6boifF8iyWcmTlOLKklcjG/BlbmIRToQS1Gy5UUV4fvsjoK+BFtT9vvrH
         EedQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQ2EoxxR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47179cb0556si89814341cf.514.2025.02.12.03.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 03:27:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQ2EoxxR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiArD-00068R-RL; Wed, 12 Feb 2025 06:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArD-00067n-2K
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:24:43 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArB-0004YN-Bl
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:24:42 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4395dddb07dso2478975e9.2
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 03:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739359480; x=1739964280; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qque2XZ1dU81iGdYR24fO3GVnw9hhnz4b3BIk7lxH2E=;
 b=yQ2EoxxRFl1NA60u4SQfy/rFNhk0EmKdr8fU9RceuC6mUBJD5eAKLG2KaIF5RHpotI
 /7NmB9FqIQa2TierTWrp4bJ4giBOz7Y+DZGxYJtZzzSoj/XxezFS1561czHlFKluiqtY
 mBPoEUNfh3I8nPdtKV/nvNXxy+zedYlDfaGsoaJ71ftqHXLA/WcPXlwz+pHNx5Mf7yh2
 w7qj11ES5xex49rUPn85YOaf4G4IqOdJ/DJNIyqiYrVb2ImUPBsxvJm5FLvrnVxExx9V
 9vPq0yEzbJ/bRZwerfNXYSeXpU9ZFgJJ7yg9jCN3wlhi6t5pzkBYBnYPniMRYnCLsbqT
 dmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739359480; x=1739964280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qque2XZ1dU81iGdYR24fO3GVnw9hhnz4b3BIk7lxH2E=;
 b=GD5+ONXYJK+c7Izgx4iz3pUxhVx4ZWP0Ux9086+vdmmT3UCLv7iDdU60hUWZf8+qvc
 rGKFbQCJ39vgEqvunYITPSLBsk+gmbtbn0+Ua02jT7PI64XXgz1tSCJCqxiftKy81nGi
 bqI4wljw0iCfpuOpdhlEKadzSXDdI5P/GLMnQpY9ZyytOdsLApQV+G3HREp038aZG335
 kXAZesEfGzHRYr+dtqtbQlNPOLvncUkIajSC2UwnS0evbvBdisTAmP3LDXJY5jq7ky5C
 1r7mp5SDPQRfEulfXaOI2JPpCzXJsk5UucGysJeeE2Tj8qoUCLy7F8R3nRlPPzF8zEAJ
 hYAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR+5Rpap149bKfmk9S7daIq9RZiFxPWHkQNr3bC9svT3jkLbidAzX3t5cuZo9ur7amGPLqkz63kg==@nongnu.org
X-Gm-Message-State: AOJu0YzXMYAMq56dK5mdnkfrQMRZRjBlRE1igx/hiEiDct9zRpjpI9ck
 t8ox39GvXBTb/h1Veu7pvcniHZw/NaQH5sMcQLPyeSQgLAB4veDTe5qd3yujK/0=
X-Gm-Gg: ASbGncvRxLSjjIjI5dwHpx9T0Qg5UOSBwFyaQNAou+McJiEzoieYGwo37vzVLd9uFAI
 Y69nj4S9gULldLprZpcn05D2UPV4O5CJ2RykEoix5Oke3qXZm7DQkHf6J4AG1Bs7iU+GyeoOVHH
 TCrZzVu60TYqUGH8+0f4BFmxUrEq0rSKqbA/WoaA8vXGa9Mxa10i/itp4/ZpYJIiaI6kIQ7bwVK
 3eQy9YTUG+rSw2ph259mjwqtaEkcRVPsGf+YR5uAx0BPd+o1Tr/VLhREjz6LchxCEBHO1uiPJU1
 cz9D801vif5Y6QbNAmE0DAh09I4LyfxiQ0k6dYL6PFTV4rDGVxbJZj0vJadUg7WlGA==
X-Received: by 2002:a05:600c:3ba8:b0:439:4832:325f with SMTP id
 5b1f17b1804b1-43958160560mr23189195e9.1.1739359479876; 
 Wed, 12 Feb 2025 03:24:39 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd1af07sm17390101f8f.15.2025.02.12.03.24.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:24:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 05/11] hw/char/xilinx_uartlite: Make device endianness
 configurable
Date: Wed, 12 Feb 2025 12:24:07 +0100
Message-ID: <20250212112413.37553-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212112413.37553-1-philmd@linaro.org>
References: <20250212112413.37553-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: I4RFojrkf0TW

Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
Add the "little-endian" property to select the device
endianness, defaulting to little endian.
Set the proper endianness on the single machine using the
device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/xilinx_uartlite.c                | 34 ++++++++++++++++--------
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  1 +
 hw/riscv/microblaze-v-generic.c          |  1 +
 3 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index 56955e0d74a..907fb33c6c0 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qapi/error.h"
 #include "hw/char/xilinx_uartlite.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
@@ -57,6 +58,7 @@
 struct XilinxUARTLite {
     SysBusDevice parent_obj;
 
+    EndianMode model_endianness;
     MemoryRegion mmio;
     CharBackend chr;
     qemu_irq irq;
@@ -166,17 +168,21 @@ uart_write(void *opaque, hwaddr addr,
     uart_update_irq(s);
 }
 
-static const MemoryRegionOps uart_ops = {
-    .read = uart_read,
-    .write = uart_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
-        .min_access_size = 1,
-        .max_access_size = 4
-    }
+static const MemoryRegionOps uart_ops[2] = {
+    [0 ... 1] = {
+        .read = uart_read,
+        .write = uart_write,
+        .valid = {
+            .min_access_size = 1,
+            .max_access_size = 4,
+        },
+    },
+    [ENDIAN_MODE_BIG].endianness = DEVICE_BIG_ENDIAN,
+    [ENDIAN_MODE_LITTLE].endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const Property xilinx_uartlite_properties[] = {
+    DEFINE_PROP_ENDIAN_NODEFAULT("endianness", XilinxUARTLite, model_endianness),
     DEFINE_PROP_CHR("chardev", XilinxUARTLite, chr),
 };
 
@@ -214,6 +220,15 @@ static void xilinx_uartlite_realize(DeviceState *dev, Error **errp)
 {
     XilinxUARTLite *s = XILINX_UARTLITE(dev);
 
+    if (s->model_endianness == ENDIAN_MODE_UNSPECIFIED) {
+        error_setg(errp, TYPE_XILINX_UARTLITE " property 'endianness'"
+                         " must be set to 'big' or 'little'");
+        return;
+    }
+
+    memory_region_init_io(&s->mmio, OBJECT(dev),
+                          &uart_ops[s->model_endianness],
+                          s, "xlnx.xps-uartlite", R_MAX * 4);
     qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx,
                              uart_event, NULL, s, NULL, true);
 }
@@ -223,9 +238,6 @@ static void xilinx_uartlite_init(Object *obj)
     XilinxUARTLite *s = XILINX_UARTLITE(obj);
 
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
-
-    memory_region_init_io(&s->mmio, obj, &uart_ops, s,
-                          "xlnx.xps-uartlite", R_MAX * 4);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 }
 
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index caaea222a8c..bdba2006b72 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -109,6 +109,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
     }
 
     dev = qdev_new(TYPE_XILINX_UARTLITE);
+    qdev_prop_set_enum(dev, "endianness", endianness);
     qdev_prop_set_chr(dev, "chardev", serial_hd(0));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, UARTLITE_BASEADDR);
diff --git a/hw/riscv/microblaze-v-generic.c b/hw/riscv/microblaze-v-generic.c
index 3c79f5733b2..d8e67906d26 100644
--- a/hw/riscv/microblaze-v-generic.c
+++ b/hw/riscv/microblaze-v-generic.c
@@ -92,6 +92,7 @@ static void mb_v_generic_init(MachineState *machine)
 
     /* Uartlite */
     dev = qdev_new(TYPE_XILINX_UARTLITE);
+    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);
     qdev_prop_set_chr(dev, "chardev", serial_hd(0));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, UARTLITE_BASEADDR);
-- 
2.47.1

