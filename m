Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1524673njb;
        Thu, 6 Feb 2025 05:13:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUA6WIpuOXFCC3laiaI26LKgf2k0X3YbeKa29Txqqr9FmUkr/J9qndlAQkdwqDOZgl0sC3M0wOWnMcB8w==@linaro.org
X-Google-Smtp-Source: AGHT+IF84vofnzpGXrgV/hN9ddoR9hKoyG7/HnFjey1TUHciwqoLAaJT2mI8Q0rPjTs3H5txZiIt
X-Received: by 2002:ac8:7f4c:0:b0:467:5734:d08b with SMTP id d75a77b69052e-470281d278emr110602291cf.31.1738847597131;
        Thu, 06 Feb 2025 05:13:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738847597; cv=none;
        d=google.com; s=arc-20240605;
        b=inkuJ812ocEoRmOXRnsstvxGstbMCDKVCyk1ZeEMxeWJL50ni1wyaSDyV1iOfcNGFQ
         0VSd75luXFszUkd2hr4BMHlSa8GinSN1k2BYt+1O9alrNpelirYK/Pt+zqHFGkCw4oCf
         ZOq9lbppNqLTleC0TQqt9NtYfS1tIpI2mdmvYVEMoW4zpr/vdqmdvAb1GVPcEl5AZblO
         2tTkX0QHFmSyMbheshXHwLUoPMD/qz6v4W9xDdxwKh6MJrV05qp6Qe/hgcWt7vl7c8+o
         jDtAS4qZEUr+aQqGVOEuVoshq+boDtqqatdearK/ZKB7H34UJWYfiMSvd020zUkguijO
         4GUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=X20R65gi2tCckItv1V/R89183LZ1ZNOLWFw83d9B9RI=;
        fh=7NsVx5R+L140HvZ0es4udPXCD2KdHoHcZm3kdyNBbE4=;
        b=I9c/Z6SJ53QxF+rrIhJwKg/Rra7GmYfMz6MKpPfsmqAY7UsUQAWeGeIY57TfKA+/0F
         5H+En5qIsSHwgUnJSyg5Y8nMr5TzMwQoWApew6OxOROa4j/9lNkNRmPFpoyESIzYtlOA
         8c1SMePj5u4g2AaRMPQwXivIWCaaW845trZ6iYBTcgqirDZB8nr0PQFebPrkHggrWZwB
         xEe4ANm0oSJ1u6Ee6qZLorykV8jeIMZFl0h7+5zjI3CNGdFG35+1T1zhx6DQEKMV2Bny
         0BgVJLPIqoKjX6l4gBfmgHkYDbVL2gc6a5mPBbd60JQSHN2MPU/YseVHLemCp8gKIVvA
         jijg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZswQIY0X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153b6f851si10925521cf.240.2025.02.06.05.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 05:13:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZswQIY0X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg1fD-00054q-4M; Thu, 06 Feb 2025 08:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1fB-00054Z-Gs
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:11:25 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1f8-000854-7P
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:11:24 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso5831245e9.3
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 05:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738847480; x=1739452280; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X20R65gi2tCckItv1V/R89183LZ1ZNOLWFw83d9B9RI=;
 b=ZswQIY0Xica2E3W2WGNaXzqh+KYYVESzI4FPNjMdT7C7k/xwIr24qFS5FK/Fvyhjuy
 gF/RoCczIthkE+KGKtf5bJcwj1byLnoaEbelSjoO8zsdSrgG0zJ73yguYrHTzXkkfFdn
 ttQSNvCQlgZqFXLnhqPYKfFN5JyVuxzMJaZ5UFCuYQT+mk/jIoYD4FNivyxkoa6C9qIC
 PVm1E4fuCaAo+4epL9XStP7vqz+ebYjktz94/KDkhgpE4wFNfes3L69AadQVIiYkWvte
 YfdADTlJHHDfgdmAnq3U2B9kh/rQXNJm8k9EwNOLW/5+m2I0jRvfHvwKkdM/+D2U700F
 QN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738847480; x=1739452280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X20R65gi2tCckItv1V/R89183LZ1ZNOLWFw83d9B9RI=;
 b=G4xeov+kJLVjB5a/5IrKnfUnDOkZAsC/9dsYsb3R0gRGioPTiWxoua3wg6AlUnMp5O
 m7mV4UUC4hO5ROdsCCPV49aL7FT8reS+D7kFhcqW3fpV0+y4GEl5VtM4N5Plp/8+uAOC
 FdEOgt7dr5nEHi573fUuom35UVu4QWMtADEpmNkBstetJh9g0MmWsoRHzahBw3wA9aU5
 M5AAlrTOpJh6f4xHZGIzUKP840t5WWdkPdLjd9iONTNiOTqgl+jkokFlAFaMHyo/2aHr
 a1/4q3A5eC8eA8AsIQXFtDBRbwY41p0Shlte2I4YcL31ic+D+eqAV0I7RYPPL+2Uv0WW
 7r/w==
X-Gm-Message-State: AOJu0Yw63KZy36+hEPkyV7ZHuiswHAb1xrsGdGqEuOevPyEFoFJIw6rG
 whGmWYA3XOOelP1SQfv2kaWt3S5JQRl02dT/fNoGbnhrP0VfBpwhcUBJJdFw2ZGaIJcG/+k19Xb
 gtbM=
X-Gm-Gg: ASbGncuFrOYj9R+g3tQKkYiCPzCcIUA8gXTAjiJUJyHQOinqhmAPmoAJaJGkTwbcQlu
 zZ+zWCZLtPGsN8kqJsn1OnbUyizCIcSInMCyYOyMLm2ykz+UE6noiglAC9+LLhnub40qYtQJN0v
 Bp9PrIhcOnPmtnOpQkFfIJ3qUd+r7wvnVrKd1UstQ5ElndaBRMMtWFibydQIuceVbM5iPG9T5R+
 cl6RXfUsKGwVlLaEbBRRZXInr3oLWuEZA1Q4AOVKqgq9yo+0GJ117sOagH18DwpNrpdBq26Sne0
 Qv/fP2PotEqRcGl9FyM63DVsIIwtNcRnila3ImNhHscqWGcG70sXpsiSY65qQZRlaQ==
X-Received: by 2002:a5d:47a9:0:b0:38d:bcf1:1011 with SMTP id
 ffacd0b85a97d-38dbcf11476mr1847306f8f.29.1738847479735; 
 Thu, 06 Feb 2025 05:11:19 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbde1e034sm1672874f8f.89.2025.02.06.05.11.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 06 Feb 2025 05:11:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 05/16] hw/ssi/xilinx_spi: Make device endianness
 configurable
Date: Thu,  6 Feb 2025 14:10:41 +0100
Message-ID: <20250206131052.30207-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206131052.30207-1-philmd@linaro.org>
References: <20250206131052.30207-1-philmd@linaro.org>
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
X-TUID: KXmn5z/232Zj

Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
Add the "little-endian" property to select the device
endianness, defaulting to little endian.
Set the proper endianness on the single machine using the
device.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_ml605_mmu.c |  1 +
 hw/ssi/xilinx_spi.c                 | 24 +++++++++++++++---------
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index bbda70aa93b..a795c6385b4 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -175,6 +175,7 @@ petalogix_ml605_init(MachineState *machine)
         SSIBus *spi;
 
         dev = qdev_new("xlnx.xps-spi");
+        qdev_prop_set_bit(dev, "little-endian", true);
         qdev_prop_set_uint8(dev, "num-ss-bits", NUM_SPI_FLASHES);
         busdev = SYS_BUS_DEVICE(dev);
         sysbus_realize_and_unref(busdev, &error_fatal);
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index fd1ff12eb1d..299004ff36d 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -83,6 +83,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XilinxSPI, XILINX_SPI)
 struct XilinxSPI {
     SysBusDevice parent_obj;
 
+    bool little_endian_model;
     MemoryRegion mmio;
 
     qemu_irq irq;
@@ -313,14 +314,17 @@ done:
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
+    [0].endianness = DEVICE_BIG_ENDIAN,
+    [1].endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void xilinx_spi_realize(DeviceState *dev, Error **errp)
@@ -339,7 +343,8 @@ static void xilinx_spi_realize(DeviceState *dev, Error **errp)
         sysbus_init_irq(sbd, &s->cs_lines[i]);
     }
 
-    memory_region_init_io(&s->mmio, OBJECT(s), &spi_ops, s,
+    memory_region_init_io(&s->mmio, OBJECT(s),
+                          &spi_ops[s->little_endian_model], s,
                           "xilinx-spi", R_MAX * 4);
     sysbus_init_mmio(sbd, &s->mmio);
 
@@ -362,6 +367,7 @@ static const VMStateDescription vmstate_xilinx_spi = {
 };
 
 static const Property xilinx_spi_properties[] = {
+    DEFINE_PROP_BOOL("little-endian", XilinxSPI, little_endian_model, true),
     DEFINE_PROP_UINT8("num-ss-bits", XilinxSPI, num_cs, 1),
 };
 
-- 
2.47.1

