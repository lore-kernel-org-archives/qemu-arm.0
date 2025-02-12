Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp964101njb;
        Wed, 12 Feb 2025 04:39:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVVi6QxYkSVKio+cTWxe7XftKqCMmKdM1SRiLB3GJgV4Sf7Wdy26aFX2p3JlQ3D49RhCvfcMHR44rCSsA==@linaro.org
X-Google-Smtp-Source: AGHT+IFHC0/5IrrF9lxgiyjn9EIRQrRHeDb76ESt3XoT+3jTS9QREjYVV4YddSItKcuIT/9LZm5i
X-Received: by 2002:a05:620a:8904:b0:7c0:60b3:74e8 with SMTP id af79cd13be357-7c06fc6987bmr414342385a.24.1739363967520;
        Wed, 12 Feb 2025 04:39:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739363967; cv=none;
        d=google.com; s=arc-20240605;
        b=M9YOjUpBt8xOkUM6QTGnt5Ou8uhmTJpbx7v+yS5SQYNbvOBrs4cGLpkwTIbig5LMdR
         FwsfaZ5OOG29DlzzGs5qZptCYOCSQ8OB043lnvtYMc7AP69fEjZromp2nE13tFK/9XWb
         8XolDSuV9zIbv2pvMmiAbRcdPB07XmSp/0Vh8Xer6eq5wJPsElEt29UUCMhJccUzYI39
         LmXyx3y9LwZ4XYy/+jz31kh+F5lmGqsV3Ok9ifg6Vo1oG2k9eY2EogrhITw3K7qAjC9i
         nV0iduU9spI7RmDav1ptCmBb2y3yf1WaH4MNvP7Xi0itv8nRkhzlKMNARp+vVN9qX7MD
         9W3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=y0Jylw0uyNdhLEP5WPnDbQTvuZQEAz9gJDHH7wlCJhk=;
        fh=HlENWry5pBMj1xy+XPJJKz1+KJ8prrg3FvBcv7/VjNo=;
        b=gR/hH5r78s9EnrWZzv2Svz30ByALUvoH8eZhBeIgwplhz1443eQuY48kkXJqUbQh7a
         aAhewsbBeCwtdYSzXxBmm4PcHFN+PBEWYor6sbDLE2puNjbfnFP4rZ2WCqJGLR0K+9XI
         zhFWyzVpxKzt1jy/SOVnmXy8zf8WyzK8yCP72K1XybsBFiKd3W735FvB2KQozAKVXXBo
         Q6xpJ2S+kCH2jyUFldfoZ8vUoC8yRs3wbDVuymB0BAfwJxQXL6pzM1YEvjHLUv/TXa7l
         Zzt4kuOZzb2CxQJlrKml1VYH9OJon8gulwrv1QRNEJhPyBYoReLuy7dYylCmef9fkLAK
         +xmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EzwZOshH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041e94ba2si1399007585a.211.2025.02.12.04.39.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 04:39:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EzwZOshH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tiC0K-00049p-2W; Wed, 12 Feb 2025 07:38:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBzk-0003b5-C6
 for qemu-devel@nongnu.org; Wed, 12 Feb 2025 07:37:37 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBzc-0000VT-DP
 for qemu-devel@nongnu.org; Wed, 12 Feb 2025 07:37:34 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38f1e8efe82so501912f8f.0
 for <qemu-devel@nongnu.org>; Wed, 12 Feb 2025 04:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739363846; x=1739968646; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y0Jylw0uyNdhLEP5WPnDbQTvuZQEAz9gJDHH7wlCJhk=;
 b=EzwZOshHJrK3He2qWz3WQ2jWrW+Y6mXfQ+FJQB+mVxSo/S1cxkC7yPyFrZtEcFu4oZ
 AMHOx+03eOUNOE7zPSWBGq3EcOJE+gCTRW4kdXjTs9dleoD3QaHz7cl/cl2/xMJ5Xz3B
 nitsIRQwXy12pSnAY0di9D4JLPmIrI0opnACk2Ba8vIhn1WEJA6HYTtEtbRVOr49f7fQ
 Mxu4yWdLpqxOlAshm3M9DlEhdnEgV6wNq9x0GVV1QNgPclX6wDlFYtlx4BAGQkKd4Bbx
 NZID3EkfyM4Yb+kTShMLIm3qIBtziX1oy056tCPmRg0yUen8lSAFj1x57lQyey1U2b17
 xSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739363846; x=1739968646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y0Jylw0uyNdhLEP5WPnDbQTvuZQEAz9gJDHH7wlCJhk=;
 b=OblS4mMgJOYyAhGq9BO8HLgk58DTFvA5LGY03TK5w6YaNoOo8CzZFerysuhhzwJlYc
 77CipH2u5ca1RsxOZvctLo7j3iNCneBZ4gJg9+j1W4Ln+FW7h0wzxG7ZnKh2o5+kRLHk
 SpuiPJoCjdBhYsuAqhA+NSxY9e1/S2k9gpjYaIFLKsod9K/Ww+efZY4FWJLJwA8EemLi
 G9JiCqkBlZu6oT+vmpUddF7p6+91u/qaVc5IuRu8gA+tTWXjQUIJqmVlQNfBzby+Mpp4
 sDBAnMIk/UwHBAjVwxqqlZmNhiU1aKCZPBnGYLWV2HQYsQI4Edgz6eOtt30IRtkMYkPI
 kLxw==
X-Gm-Message-State: AOJu0YwSpJsKvqbKbZsKImfJdCpGAws7sfR9qxi09jcEjsYPTuJVGv2D
 PvGSL0Wdi0sgj12FjNvkUAeZ9TfKR4+FDmo4ghpbgv+/ea6ikhZu5kxI7H4stxPwtfW5rZ9hVoQ
 KApw=
X-Gm-Gg: ASbGncuMQ8sizu9lmYI9ov61wdSy/nxdvGYEh6RVAPcZy6m200Y7apxJFNSnkKEh9/T
 +sWUv+ksXJAK0Pu1M8D1K8vXoAkReIm0KY1VUSx9wQeFPCvKoIhXZuwNW3++BxlBdSaHjle8RPm
 XJJRqwDhlpeQbzIwTPhnJfKruHtp+seS1LCqq8EdgZJ9jQQkm0hX32hZB1WWKFUboMYwZSSFF+q
 KDXhMyRexh+wDdOEjHUC9x+mZ6zzx5tnvBegRS9xkzA+0444sNa9uPaosXCqH6m5liJe6yv6fKQ
 NuVYFtLyXBcQQOuu+AWMyXf9RchR4kSZGn5dhlKa0N6SL1s72pkT+CiYTGUpnNuGEA==
X-Received: by 2002:a5d:4b4c:0:b0:38d:dd43:8be5 with SMTP id
 ffacd0b85a97d-38dea265c8cmr2058738f8f.15.1739363846146; 
 Wed, 12 Feb 2025 04:37:26 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbde0fd0dsm17238125f8f.75.2025.02.12.04.37.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 04:37:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 05/10] hw/char/xilinx_uartlite: Make device endianness
 configurable
Date: Wed, 12 Feb 2025 13:36:54 +0100
Message-ID: <20250212123659.52764-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212123659.52764-1-philmd@linaro.org>
References: <20250212123659.52764-1-philmd@linaro.org>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PYx9itnbsTuR

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
index 56955e0d74a..4037c937eeb 100644
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
+    [0].endianness = DEVICE_LITTLE_ENDIAN,
+    [1].endianness = DEVICE_BIG_ENDIAN,
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
+                          &uart_ops[s->model_endianness == ENDIAN_MODE_BIG],
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

