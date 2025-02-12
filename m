Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp924921njb;
        Wed, 12 Feb 2025 03:25:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUje/EjXnwbmO1Eb8Yg6T63K4ammBDznNMH8Wt7hyIzoPwuJsthsQCuE2LGWX9gFEW5wnLSdxFC6D4LxA==@linaro.org
X-Google-Smtp-Source: AGHT+IFZSelk5MV0+5Z4LcSuTGxb91tTAQw/OOCHJITiPkHnmZaJjo49yHZF9KjWj/JZwrVFyqn7
X-Received: by 2002:a05:6214:d6e:b0:6d8:8b9d:1502 with SMTP id 6a1803df08f44-6e46edaba55mr45155846d6.30.1739359537648;
        Wed, 12 Feb 2025 03:25:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739359537; cv=none;
        d=google.com; s=arc-20240605;
        b=hPCX2s/nV+KKrrUxOiiyqbnCgPymkWpeupHK6sBhCKSemzZBiDtmpC0dZLMSyEgMnI
         Hv2KsIQbdQRg57Ok4X4PsEoMvAkmyuoLaa9kP6FJJWRrDgq1dC1cBSEp08bWEXxo+jzL
         Z20hvjUWnaLbU5yz91GACD/55fGXdQvqYjnm4cz5MgdkOFrPtKLcRXSVgHJYVTtELk5p
         aB9Y6GvJJCjHTfaoItHekjKqw+/340sE0LVsBZo9zv8WIkbvxPJlZXNqB86xZmBKXBcE
         /rqMOFTkZig7pUxP7jbX5XPp1cca5ViGSn6X4sqPfNVOjnIM1e12zYpm+UzGmif8WYto
         pg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Cb6beBAMJuXhOI+0o0YuqXYdtcAOxLgJDcrytdbtXYs=;
        fh=GpB0e53pbT4TPJ4zxtAWZ3nLYAl4L0nyJr+90IObl4s=;
        b=Wp+xMkAukmRd03KbRRlQEEezgriTUswCguHkDwHtiT4wb/w3VcXL8EgwTIYyrPdr2c
         xQtBAWeBeK+M/U8eZLf849UwEicWhyewKLJPs+LWbPTlodNL/q0EMQqiox6byPVyV6fq
         kVpi17sUIuLVEnOwvxGGdLfqIvhnMKDefLE20qI7VwzeFGzEHUBY9CdA29XV/J7f1vDd
         2zmAVuC/JsNbj1Molm2Lo2954YlzKFlIImk2IzV7fxhPjGSmmqplC7yF+9H2PZc4v9JT
         Hpm3IyE9SXqQKDtJuFt2q/YN2OspRCuenrcTiMy4mPqQEN231C9vIaUqCtQVOCKUvbnK
         z6hA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TklTZK8v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47193f7bec2si59584461cf.92.2025.02.12.03.25.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 03:25:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TklTZK8v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiArL-0006D7-2C; Wed, 12 Feb 2025 06:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArJ-0006Ai-94
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:24:49 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiArG-0004a1-Ki
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:24:49 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43948021a45so29324365e9.1
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 03:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739359485; x=1739964285; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cb6beBAMJuXhOI+0o0YuqXYdtcAOxLgJDcrytdbtXYs=;
 b=TklTZK8vhUmWnLdos3ZkzKC4VO4FAfykxNk3gIxlvplkPLZTn4GyKmwkZ2Ma++/SST
 doBEznRUOF+ENGWWk88Q8uYiEWmaciSFh0x6oHAWaZSymcDiD7tIXR66XP39x00hkafJ
 eu7m01NsE/DrJetwQHIXBO+K31Jbev61hrebt+A/uoANSsfhxGHKUcUcyjjKQMZitjtS
 QoaOuTScfpoIQ+1dJ/yQNpNt18BjwxjwV3ODu1MnDwCS3Cqb9AdRMOz2yOWe13LqW1kp
 o6pFbhkGV4PrjOG9CZtmgQ51cq+QdK0jxoTwkwNoBEfHjg8YD8B8HI7HKtDHHqVIkhvI
 5QRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739359485; x=1739964285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cb6beBAMJuXhOI+0o0YuqXYdtcAOxLgJDcrytdbtXYs=;
 b=C4YneNkK4rMFAKXCeNYk2YzZznOAcFrno9SPtdC6LU4anf9Qn4+fsAPZwalRbxJttq
 oNC6mF/EOsMkBJDjdBt9JqejjjyoL1MBubnmxiKIH8AXAFBak1v/uJGBqhcx1Icjs0mC
 dlNDtolfjv/5K1ALxqfqZqsu79y3bDM8abeIFCkBKzRNmvtJyZjI39d6AzInACtyzUum
 uVICisom6oMCS+DWfs/zEwN1ruVbczH6HEnLenWvqBgKg7KAHwXudtxh1jgFNaqX5JbC
 t7BCVKT1oHjJmDkJ67wGX51aRo7+7Qc7TtCFUuCcdtDnpOaLpNprsCZGg69zGXUA3mt+
 q4IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpTPv4oMSqreXK5RfuvCep6aXRMy9ZRb6/9lZys3gxK8m2LiZilh+7pxH7378MGlA4oySwPfLqOA==@nongnu.org
X-Gm-Message-State: AOJu0Yx5Rno4VL+3m8j4d912ReApqWdf6Vl+H1QNxuYoy1usbaTjp5wS
 bKNTAlNml6/PLm0sVpgQ70tlv3TEurn3+lxdzxDnDgkbDWFynqzqQf+7gKnWCx0=
X-Gm-Gg: ASbGncvNMum+fHJBUPS5bX/sR42HeOHXqq0mqgaYA77RmreHBPNLmdEIjKfXw+2iSn/
 M3en6KdXrVMLQF9JUELyd/h1qB66HCpOT2yLWlRTlObLU1SkrwPQgC+8XMSixsEOmLP4tzKSoF1
 vyb5OHus4BPxPnrrK6dGQpKnWZgGv/lGsuYVW/vPjmJeTa8VLT1SV0NnBQyFJHyjr05VV4DKB5y
 mw3kMmn7G3JxF1pBLA1cow87Bd36nXGDUKNkxzzDqKtPf5QI2l96vvCRAEvm55sc5seNSdhsik7
 5C1BAjnxGk1GhkD6sGBelv1OaUhA3oSXSyvQAW1Dk6jMDMKr7Nf/ejiXMd+/Wsg7nw==
X-Received: by 2002:a05:600c:3544:b0:439:57bb:2aa with SMTP id
 5b1f17b1804b1-43958166727mr34680465e9.11.1739359484669; 
 Wed, 12 Feb 2025 03:24:44 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38e54f521f3sm1200655f8f.83.2025.02.12.03.24.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 03:24:44 -0800 (PST)
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
Subject: [PATCH v6 06/11] hw/ssi/xilinx_spi: Make device endianness
 configurable
Date: Wed, 12 Feb 2025 12:24:08 +0100
Message-ID: <20250212112413.37553-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212112413.37553-1-philmd@linaro.org>
References: <20250212112413.37553-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: SvccdfLjN9mz

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
index fd1ff12eb1d..0cedfb526a0 100644
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
+    [ENDIAN_MODE_BIG].endianness = DEVICE_BIG_ENDIAN,
+    [ENDIAN_MODE_LITTLE].endianness = DEVICE_LITTLE_ENDIAN,
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
+                          &spi_ops[s->model_endianness], s,
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

