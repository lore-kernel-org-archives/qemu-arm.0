Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp539572njc;
        Thu, 13 Feb 2025 04:23:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWNtOfax7jinTrVM/Z3FYFmO/y+o8vy2FfF9wPXvUX+4B5vfX63LUKBnbbaghd9/OGZ9Rqs0C5rqakJ1A==@linaro.org
X-Google-Smtp-Source: AGHT+IHocOevLIojZ6yQ6UXx/D+YcIkrJdPxrfV5tErerRijv9JFC8REq6MOikp5sU1pt5RUqeQI
X-Received: by 2002:a05:620a:8804:b0:7c0:6ba7:e9fe with SMTP id af79cd13be357-7c06fc8c46cmr1260437485a.27.1739449419257;
        Thu, 13 Feb 2025 04:23:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739449419; cv=none;
        d=google.com; s=arc-20240605;
        b=gmo9gxJXW69rQWSxjt7hW3dapNZfOxYTZlG9mIFYEVXYV2Td7WwmhKt2ILkVTXTiXJ
         MlxQODQWHbD890PKMORz2Mpo9U0xZf6+m5Q4gJb+W6kq5/HNCzZtI2MtYd5987IRd6vb
         Bj0tMqmZzYApzg2u29C5GKTyN1GKgOwMXqjPQaQf4msKDKIHc3thppscTeVePQHtiLXj
         vVB3Cz5PTY5MGtyLwjGyBQS1V2MOE9e8Z9egIcLR+u1nA5lH0e7cH65owpgt76FoapaL
         GXKMOxg80B0jPAOE6WzmXBVDKgvdW48LfZErL/ojy/w6LNwTcYs7Z3Ivou04NiViIeYb
         6ZFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q9MrYcI98DZnIhdDN9JLb40jpmFmxWLeEaWhZtHGUKQ=;
        fh=OxVaRWhCDUUAWPk5yFkHJOCMz8ZasYV1SxQmgrbyBq4=;
        b=W3jfs8G7mUWyjjECvNr2e/yYJcrU/paxqEUOzcNV/wZh1pLaQl/CKY+5y9Qla0VAbS
         x4TXFvzJbvf1v6ckKBNk1wVOgpnmDnrOYCaSmrDkMEjha6xK5U9b3e4Ldy2EaEDuc5zk
         Jo/HKknQcXZj+STqRVF77CeOC4j36kpAS6YiOzQp6dvBQ6D+o3CB6EXL284fZeHCMvXe
         f083YM8x5Zwc7KSfsttiGtkmniOTnyDbd8C5xsGxO7bSrlcdGKcMyttp20mdyuiJACEz
         Mhh0mG3Lp7zw025XuegDDmyf/p0JKBdQGETGCNtVdw6xUXE0i5qhwgvxOW0cFbdF/018
         uN8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TYAyAHp2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c07c8739fasi117535685a.269.2025.02.13.04.23.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 04:23:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TYAyAHp2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiYF8-0002Ag-Fr; Thu, 13 Feb 2025 07:22:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYF7-0002AN-Hd
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 07:22:57 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiYF5-0002ZC-PA
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 07:22:57 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5dec996069aso1351421a12.2
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2025 04:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739449374; x=1740054174; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q9MrYcI98DZnIhdDN9JLb40jpmFmxWLeEaWhZtHGUKQ=;
 b=TYAyAHp2NEkddWbTvCy1WUFVILw7IC3TiC8Rr6jjlv/6G8bR7YQj/W9jdZ942LXVdF
 SOLRZxjWG8glB/afTOomDAg64svXf/jnWRoGxU2xn220oDqr10FrfSBLQSUn5wxZsejw
 YcKTWJaxzNWZ48kT8wp4NDiPXXqWgXaZV/nod0slOok2WBqZEWn/CHtDWAnLLMSu/Y2p
 Clnn6cfJtAXKJGDbeP2+wZx6je7lUq1PS3zd9kwwEwiYAdHA2RfKieo0f7lVfU/klUb0
 9KMYDJJYYmuKtgm+9lnNWuJFSsBG4ut6Xe8/ISXPUo3PFGdsqcblkT44vZ2YbvpOMTQP
 hilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739449374; x=1740054174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q9MrYcI98DZnIhdDN9JLb40jpmFmxWLeEaWhZtHGUKQ=;
 b=RGs1uMacehgVr9hqSqBcXzTHYGQG1hwUyKIljfza8UfFG9Gy3ba7jqoztoIZ3Z7Q8P
 NPRF7l1/ZaAbQOMlw9GM/97sIxs6AsDJX5AE25lBtWoARL0ZnpM+bZfHk1byeqcitjpk
 dEvIUjEkxJEYy3NIMLRjXoy8mksYmtrEJzpsISQed/Qo+YwKXOlUFnCp3OMJ2F0ECuLK
 6iUhY/TwAAbuunBRUp9a+XYGyhPiJDguYTjuZbSH9UGsBwI/rmaGwJ7iTjUF3c2oKRb1
 QKs2BnRg9YarkQCd0VME6IUZ+yFTvSllJRMvngGU8UOwAz2XFATFIC7YtYvcDbNBqSzR
 +Rlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8z4LIzpr+0qexNTOFCLUUbf6xiGcatU4Jm3Tz9g6JBWCustigZl1+mTqvO9BXuXU6gTBnsP29mQ==@nongnu.org
X-Gm-Message-State: AOJu0YweHgHKo3/pETuIpQdiOiDIgGV9EUBopDIB3hIbB28dEKNOgmqP
 /MXE9yzxL9hec8rycYUV+PyJ4lVsOJQrH6aoSL8gtPycP9VNTuzXjOjt1YWpmUI=
X-Gm-Gg: ASbGncsPMJv1BeffFfLi4tlyx9ZZG8iJ31XaAHzKxU7j9wh5IH6CknKFY5px0xdaPdZ
 Y6NTxS4V/59drmYTfdUdB9ybPK6IGQ+XXHrwl09SDkEVoPknvbh5ByiHazJcjOh+bipYPW9JtF0
 1QqkpZbHrl+2yibEAC2t8D7eVXWI/S9/AhiGasdVj2HyosVf5cfKo4ZR64W9TDtG3berbLDgMbc
 GIr9+xP+EbifZX+FI92fiwUhZp5r6UKUEMV86wEu/WmuSTh1ex5yFM91euQ5L3u9LhgOQksbfNj
 q9VJWpWpl0Ogk+FnACDUS6wbes/i2/XQh5GZiKXD5HwGd5+YpFv2EKKM8ls4
X-Received: by 2002:a05:6402:50cc:b0:5d9:fc81:e197 with SMTP id
 4fb4d7f45d1cf-5deadd8e4a1mr6069944a12.8.1739449374292; 
 Thu, 13 Feb 2025 04:22:54 -0800 (PST)
Received: from localhost.localdomain (6.170.88.92.rev.sfr.net. [92.88.170.6])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1c4646sm1104999a12.27.2025.02.13.04.22.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 13 Feb 2025 04:22:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v8 5/6] hw/char/xilinx_uartlite: Make device endianness
 configurable
Date: Thu, 13 Feb 2025 13:22:16 +0100
Message-ID: <20250213122217.62654-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250213122217.62654-1-philmd@linaro.org>
References: <20250213122217.62654-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: GvbaNu87UcLZ

Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair of
DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.

Add the "endianness" property to select the device endianness.
This property is unspecified by default, and machines need to
make it explicit.

Set the proper endianness for each machine using the device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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

