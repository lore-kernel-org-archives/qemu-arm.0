Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp964177njb;
        Wed, 12 Feb 2025 04:39:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWgAvV4tpUVKmBIdFsy65Vk5ydCRz5S+SQwHciGk/ZusIRGFQ1Li4haWm/TnrcZuYdz8yaZda1kshK8Xw==@linaro.org
X-Google-Smtp-Source: AGHT+IHxsqH4o2IJ5CvtzRWhmZSosaJD9hzU0mL775+80h2GVRMzsFi5YZ+RY2XdR+5Yx9Tzj+Sb
X-Received: by 2002:a05:620a:3d11:b0:7c0:78ec:1ed1 with SMTP id af79cd13be357-7c078ec228fmr23006985a.27.1739363976665;
        Wed, 12 Feb 2025 04:39:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739363976; cv=none;
        d=google.com; s=arc-20240605;
        b=O16sobFWJSw9QFS4RZYNzuz2BHk9Atd/0sGqc3R9NYxZBSC98fJrP+AksKLaon9zuq
         u2UyA9cUqyzEDoUH9imlrn6/8ikfrujKmHJL6SiJ5N5yG6o0AWqPjjs26ZgDcaHyuMDp
         zT4cskc9LbsKrsOvTWDiMK7br0PZGTAVjqsIv2yoOmjXUU3wGJ2dzlKrGbgzwI6Hs6fS
         eez72IMVOFzFVdtag2kpt6Q4z3HgiCUw+Ftvx2A12aBCuACe+AN2M6bAcksH7pOhsxxm
         gwB2BK29UlQxPy182lsLSHHETUd/lqOi/E6TjxPZUnQdM38gSvufBx58zkeK+QsmD1Zk
         nSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IWUW6vMOmCPzMRvR9U3A14f86L3fegXfbhL6iARH54I=;
        fh=YwyrLAhX5xyl/YffXObIcbdsGU0yzVvQ5RtfIfPkfv8=;
        b=cs5rbpxA6PqenfB9aLQ+gjSiCPiFKOhhtTGGvY+u1xVigXI7uIhB5QEJoAs0pyJGl0
         EjL15/GSNwX8biVwrnIZnhDkmZhewSxKt0M8mG+onkULcazpWFXAudXKQeibSBTRt8Mt
         6fyKxRNPgztHyv2kzTN1nVmipxXxtNYsCBT5eJLzfrr9uiFVYSBLclsTQbAeIHdb809M
         71ofxY1qcmV+0daiVqx/T9Z1h/eUnd8OXXYSCxsX9fEkb9ZnMsgo0mHpk8IHZ5jlJgrq
         VnO4XcCwAzECZB/GSC/KBJ5rGZYUMtt4xyTL/yeNbcIeaHrfs1sPdaNFORn9fG/xq95a
         JwIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gNS3ViJb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041df4999si1334877985a.127.2025.02.12.04.39.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 04:39:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gNS3ViJb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiC0J-00048b-5K; Wed, 12 Feb 2025 07:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBzp-0003ed-TB
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:37:46 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBzj-0000YF-JQ
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:37:40 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4395561ab71so18323965e9.2
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 04:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739363851; x=1739968651; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IWUW6vMOmCPzMRvR9U3A14f86L3fegXfbhL6iARH54I=;
 b=gNS3ViJbvhPyJqtrW3bJa/BpXQLrQ+QKyoUpaUFcZ4/hfOO+a53gNGqu2x9JUKMzBW
 e+OlgMtkxkGyThoLV86FNRjOThpP+DcXkdSlIIM9JyULKqHsbtM1w3NnhXaoO285I+K1
 0ZqJqw5fq+oCHrq1yJtXDTQbEkvFIE/OlfdeOA9AGHCtJka8b8LwR2EoKcze8HyFW+Ho
 kMdizkE0pRg2REWr8iKJzUIzUPT4X2819pBGt8HjEGhBHa1GoTgW0qnCIlBcUSE5JrsG
 phUf9+C+VOap1Jy8Gg1M9gNoszFbg5cGDeyH7Lj8Q9CSRDlXTJAjF2UiywW+TeLTgXNN
 nheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739363851; x=1739968651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWUW6vMOmCPzMRvR9U3A14f86L3fegXfbhL6iARH54I=;
 b=To/3OPpLYdfXrCTfRJwHHvkNUWvzwma/fTdDsctatvw/i1PMlkmWc/U85ossnEa0ui
 5oWXQLF+s4Z+cimqsbepYn3LfLvFOyWBDg/yN1nPNjcnwc3ySWb0kowFC0NnjuHXzvlF
 ik/AAJauSDMhEJ4Bb27K1sV5Wy/rQ2jLnIoMtdjP/A3/2NZ+ASYu7yt+AMdb9ol9voX0
 d2zEzUTCnOuVnb5rf7Cbqz/5Y3vmVGxDSNDslPELEgLrL18yFQCcqMbDgcDy+sMPbj/p
 r+rcayGDXLs+u5am6Y29bIjF7oJX48Gx0PtUOOpfuAXI0asQYfVtpTLQUREJnR+zv+uy
 0sNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU79iMQWLrhcvu0ahooQEqmZLKrCYwcYMdi+jZZ2+rlFKa9+0ganpn6H0E7z7bV0khW9nqSVDjgFA==@nongnu.org
X-Gm-Message-State: AOJu0YwwNpNuh1r3mwmEsQnHO/UcMdLPs4ZOn2EljpOqQPX/5zVyVfzw
 lMZ9D4iTbFN8KvJD0DNEUTiBcekwdC/7RQl/wTfhXANJHZCBjxwW8fgzacK9A8c=
X-Gm-Gg: ASbGnctDPtHGrRnYuyo8Qedh/JX6VqXgB9J4tjOeJf4UNEw+zzaCO2TWJx31g7D/Rwt
 reR9mPkC+hTAugH/14x7ez2+H2dG2NtdFk5RJzZj45kmblVtw+P+mulfTR349uTHk+zwyXaGEE6
 9NADk6bmWqTJWGUgJ50s2tjCwnqdpTClh9gdAnjZvTWJg5A7CJJp+tTGvTw4Z/8JFU6DlwIl89o
 bmZ/fm4s8go2OzpKQJkmc6SuxDjjJpQ8Unf72ndtK3wzB7ZnOdQhBvY8SE+pTmYanNFtYUCwKOu
 43nCbRQG6l+RoKlurRQKg40WYCe3MiD59XV0czoeDjHYFeAwrCLy4cUL9MqPskeWWQ==
X-Received: by 2002:a5d:6d0b:0:b0:38d:cab2:91db with SMTP id
 ffacd0b85a97d-38dea251ff6mr2485464f8f.6.1739363850914; 
 Wed, 12 Feb 2025 04:37:30 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f21ea3246sm444419f8f.81.2025.02.12.04.37.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 04:37:30 -0800 (PST)
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
Subject: [PATCH v7 06/10] hw/ssi/xilinx_spi: Make device endianness
 configurable
Date: Wed, 12 Feb 2025 13:36:55 +0100
Message-ID: <20250212123659.52764-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212123659.52764-1-philmd@linaro.org>
References: <20250212123659.52764-1-philmd@linaro.org>
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
X-TUID: 60I8FYBtlBxn

Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
Add the "little-endian" property to select the device
endianness, defaulting to little endian.
Set the proper endianness on the single machine using the
device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_ml605_mmu.c |  1 +
 hw/ssi/xilinx_spi.c                 | 32 +++++++++++++++++++++--------
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 490640e9428..b34edf13796 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -175,6 +175,7 @@ petalogix_ml605_init(MachineState *machine)
         SSIBus *spi;
 
         dev = qdev_new("xlnx.xps-spi");
+        qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);
         qdev_prop_set_uint8(dev, "num-ss-bits", NUM_SPI_FLASHES);
         busdev = SYS_BUS_DEVICE(dev);
         sysbus_realize_and_unref(busdev, &error_fatal);
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index fd1ff12eb1d..be5baa6b350 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -25,6 +25,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
@@ -32,6 +33,7 @@
 
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
 #include "hw/ssi/ssi.h"
 #include "qom/object.h"
 
@@ -83,6 +85,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XilinxSPI, XILINX_SPI)
 struct XilinxSPI {
     SysBusDevice parent_obj;
 
+    EndianMode model_endianness;
     MemoryRegion mmio;
 
     qemu_irq irq;
@@ -313,14 +316,17 @@ done:
     xlx_spi_update_irq(s);
 }
 
-static const MemoryRegionOps spi_ops = {
-    .read = spi_read,
-    .write = spi_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4
-    }
+static const MemoryRegionOps spi_ops[2] = {
+    [0 ... 1] = {
+        .read = spi_read,
+        .write = spi_write,
+        .valid = {
+            .min_access_size = 4,
+            .max_access_size = 4,
+        },
+    },
+    [0].endianness = DEVICE_LITTLE_ENDIAN,
+    [1].endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void xilinx_spi_realize(DeviceState *dev, Error **errp)
@@ -329,6 +335,12 @@ static void xilinx_spi_realize(DeviceState *dev, Error **errp)
     XilinxSPI *s = XILINX_SPI(dev);
     int i;
 
+    if (s->model_endianness == ENDIAN_MODE_UNSPECIFIED) {
+        error_setg(errp, TYPE_XILINX_SPI " property 'endianness'"
+                         " must be set to 'big' or 'little'");
+        return;
+    }
+
     DB_PRINT("\n");
 
     s->spi = ssi_create_bus(dev, "spi");
@@ -339,7 +351,8 @@ static void xilinx_spi_realize(DeviceState *dev, Error **errp)
         sysbus_init_irq(sbd, &s->cs_lines[i]);
     }
 
-    memory_region_init_io(&s->mmio, OBJECT(s), &spi_ops, s,
+    memory_region_init_io(&s->mmio, OBJECT(s),
+                          &spi_ops[s->model_endianness == ENDIAN_MODE_BIG], s,
                           "xilinx-spi", R_MAX * 4);
     sysbus_init_mmio(sbd, &s->mmio);
 
@@ -362,6 +375,7 @@ static const VMStateDescription vmstate_xilinx_spi = {
 };
 
 static const Property xilinx_spi_properties[] = {
+    DEFINE_PROP_ENDIAN_NODEFAULT("endianness", XilinxSPI, model_endianness),
     DEFINE_PROP_UINT8("num-ss-bits", XilinxSPI, num_cs, 1),
 };
 
-- 
2.47.1

