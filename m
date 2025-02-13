Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp539577njc;
        Thu, 13 Feb 2025 04:23:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUzHB74IMqeIzgdtY0Ym8ZL5Fo1J6WUR670hBj192YJsiHy3iB02orm9GD6v4T7r5xQPRjUja4kLAp/yQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEN55fbXWF4evFQVMsnbNpgwoYYGRndKenLXujvMBsIaQmEewNH5IpchHgDl+IagrJbpX4f
X-Received: by 2002:a05:6214:2aa2:b0:6e0:ad33:36c with SMTP id 6a1803df08f44-6e46ed77a8fmr115051306d6.2.1739449419761;
        Thu, 13 Feb 2025 04:23:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739449419; cv=none;
        d=google.com; s=arc-20240605;
        b=Y3Ks0s3fgNIdC5Jpgwu8jr5W7zhu/NU9mU+ifGfvC+p3vFC9T7MYihmkeW4yCrbuxs
         tlW8VUk1t4Uh5dOeX9T6vfuGh4Hy6SPKiarxyUVej7dw6FNsQfpaA9c+ZlxdOzNIEDGR
         Y5yQPVnEIHCDvEWsfRv+lW3hik5oMUL78vA7IhexCHxjdyEzqY/7D6PzyqtMFuGCVJmu
         n/zxxLDHzVM8uo8CAGZK3gPPER9iDQcAneipXmXw5a4YhrderYdmmPap/9wmis1T3xC9
         uFD8wyupjBJjx3ccvPsVS9mWc1TpCovshAsRZrPdnq2Aip6GIUYkYu4IwhZRPwLS225w
         4+RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=r5LQvdlT1sMf3RQG3zaZimZ3xYwH68boESfP4z93+Xs=;
        fh=2ao0VLASSQwsfE4cPJTwO6tHBytSU0zS35t8LPBPhS8=;
        b=YarMsYsPnp054ILthmJss7vORZ+CrNZkcVjIaSFwqbPJYlD9xvgAKDWnPPo6wMTVuw
         r0nzIy8N9k6kyPjw/f7fQMCLrRNADNa4ipwqeIa2ys59WLFdi4p+K4P6XJ5F6HOuk+gV
         JNKsAtd7Gdqbp6fxmypFPASiArkPEK0grF6jHhI28sjP1RqMEf/QEHgBnnLaLCxh1R8V
         qgYAetifHYzBcagxgp/Zc2mO8MzIff2144l0e1t7QIgB9u4xFlGvHzTmk5A4MyO5I5fO
         DMaDkXWwPrcUD6xDbgI0FVhaix9Xr8AJfA9/OEjyhG6bDM/DJs9+Jp/3lBcCLvZ4qcRl
         AuJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MsQvugnh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d741d18si12725456d6.137.2025.02.13.04.23.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 04:23:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MsQvugnh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiYFF-0002Fg-0D; Thu, 13 Feb 2025 07:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYFD-0002E4-OR
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 07:23:03 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYFC-0002aQ-1w
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 07:23:03 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so200427866b.1
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2025 04:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739449380; x=1740054180; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r5LQvdlT1sMf3RQG3zaZimZ3xYwH68boESfP4z93+Xs=;
 b=MsQvugnhOZPJvwbc+gryVwJMynIrz7ScTdSYg+t8M6IRHpQkfMITjSe7vAZbV6uFo8
 u5UpwVnfHfxtbRrC7UeKJIIDvx6Uz8Sxtn/hlIw3IGem/SSYJPs8hrRNmVOEha19dKQZ
 rXpkqljH6A/RBTGMyHPaThicHr+2qNskoglUtp2uzdOzoCv8WBbgaafRak4Rs3lwKv3n
 RCCIgiZZUqtIPiLZAzDLuX4VXg/P2E15BWHP8rl/iSX+vNjEkNYykp/PHmodbnclWtAu
 6hoAGuECw06fLzzT886idewsOXcbZ6XMuPz5VwoyK/T/7JFk7+j6GjCGnv1HwV3fqWMa
 20sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739449380; x=1740054180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r5LQvdlT1sMf3RQG3zaZimZ3xYwH68boESfP4z93+Xs=;
 b=Tnip2SWI3IMnlt5TaBIoQ0mGr8DuMbQHKuSZx/UdkTpqMlJHaFCTsYLpdbeS2gtXF8
 X+4lkOa3O6lstZ684gGf9oq1GvZA37uv4aEtYnX+SrmkJnuxJUqIN3t9vyX6aYsGXc5x
 UKoiI21ZhPkSnkTz3xiExJVgns9PXITuHw6nS2K55rPi+r1PKR2XH8yZ0fd1aG/fKjYR
 3Q7CKSChQtb/fVSLHhLiVmCxmgV1O/eWMTjpK/CG3CM+1yBvs4HUr0OEyl2DghE8aunF
 1cyjBgk43pyfBZyQzNldChcKfK5wIiWCMc+PVICcgMVz3k5g3qf2V4Ypx+yy52gCVmNb
 2QWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6z6IDRobNn8NbP1DOU0uBM1IVtGAWHNAEQ9/ulhVsIoDGxbONrKPpaZGh6FUfO4+nF38twRsSIQ==@nongnu.org
X-Gm-Message-State: AOJu0YwK4siuh5c3PFht2gLFHbIY+SHYGiyojqbuE3SJFMl1ZOGpcP34
 VVc5tNpPTdatcD/wrYk37tkI9jwsntSi9I1eswqQQz/3M77OImTATNHkP/J8jZA=
X-Gm-Gg: ASbGncvlA+xT/b1zj2MwRiSp9Ie6u6N8OA+uw/ae3/FTcjNMXw/rNBVqfmYBLQfnnwh
 XJ6S890IVz+UMo+J3XC98DhgBEyhIGH8tZEjDQrWXvmDDvTy3xXS2MR0e2zskDaRGDKDu6iiwBK
 sgO1BqqZnAPR1+Yl1CFCdb3/qIuvE8kptxT8CGwbpeNsrG6LfOD5e+J3vz+GSzI9dc99NwuMMdn
 QlsM6ZVWGv8ofcBSXQC/ER6Pg7ERGtHQPO+Oywonr7Wt1wkg6+VO3svs/7N8hhxf0kk/LOoO/pM
 78Sh6FvQ8O4vQsBidsJ0aVqsVP7F3KFiT2lb47xOjjgUYgWGg2ymo7NfeGog
X-Received: by 2002:a17:907:7dab:b0:ab7:cc43:c51e with SMTP id
 a640c23a62f3a-aba4eba808amr304929766b.13.1739449380395; 
 Thu, 13 Feb 2025 04:23:00 -0800 (PST)
Received: from localhost.localdomain (6.170.88.92.rev.sfr.net. [92.88.170.6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532832dcsm121008166b.85.2025.02.13.04.22.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Feb 2025 04:22:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v8 6/6] hw/ssi/xilinx_spi: Make device endianness configurable
Date: Thu, 13 Feb 2025 13:22:17 +0100
Message-ID: <20250213122217.62654-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250213122217.62654-1-philmd@linaro.org>
References: <20250213122217.62654-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
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
X-TUID: juw2fDEoKdKZ

Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair of
DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.

Add the "endianness" property to select the device endianness.
This property is unspecified by default, and machines need to
make it explicit.

Set the proper endianness on the single machine using the
device.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_ml605_mmu.c |  1 +
 hw/ssi/xilinx_spi.c                 | 32 +++++++++++++++++++++--------
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 984287fdc53..21ad215e442 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -177,6 +177,7 @@ petalogix_ml605_init(MachineState *machine)
         SSIBus *spi;
 
         dev = qdev_new("xlnx.xps-spi");
+        qdev_prop_set_enum(dev, "endianness", endianness);
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

