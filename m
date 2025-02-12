Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp1089930njb;
        Wed, 12 Feb 2025 07:45:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUTNKrvaRqssct8EAW32zx1CpcCvlLgnxo/TKdHNThBbbq2rqdr8vX8EU5E4Ddnqi2CjNwYNvJEmmjtwQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH7d4uTZq8ZX0maWjTbLgth9Fzy3cJWpeCGM0UKv8ggD9XCnkjmj4C78ymnViMdqqd+2aaq
X-Received: by 2002:a67:e28b:0:b0:4bb:e511:159a with SMTP id ada2fe7eead31-4bbf22e2f9cmr3031422137.19.1739375131693;
        Wed, 12 Feb 2025 07:45:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739375131; cv=none;
        d=google.com; s=arc-20240605;
        b=J5kCu/KhGH9b667FztWGxmw1pixh9YOrsJQxyC0V0z5kFwIRycRGhfRcW+wt5TE/rh
         6loB5w2kIBt9W4asH3tMSk1/Kh/HZz7IWcJeXFdLpQKUOPFftOecCm4QnsGIvPrFutaD
         1qMilZAPrgARBXAFeoxJdl/5apBuGOuNCiCoHGfXTxJ7Qv3zv/1am7kJJDTkuLULFwQD
         EZ4N14PQeLtziXrN/pL+UUAVa+8/0AXDz9ZE5MNjsPq1qS79U3C5wtOwdOQIuR3w/QdH
         U/4im7KxtVuE27N2bc+j116SAlFSPjg9dSCG34qGjnZvpMk4gKVRjY0J487pWMXbw+IX
         SEsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mEULPqwUPtpzNSB0Z5/nLsqbWtVDcoNpITYqgf9zX7Q=;
        fh=pvw18sjsQZ12LlQwaEeMSU3965hEDPN2htE9s56chd0=;
        b=ViorVNFAkc+zNPtYHRh5+04rxGqAbP1L0rOTrJFqrWaZSYwfeNdKAItW+/w62u71hC
         KFU7nayJsmAxNJ5gLw75G1KGRFe+aAdhWNAvEhGghcBWmGdsitqo1GORZEzWYAY52uw1
         xnR0mxvwFiB4wGpEtyRrmH4ZEiAaZHEODBpnARN2/ks+/ynEuNd8wS/mK8JYE1J8HIKx
         kxxMwbdvO+GpJHvN3hx6ZbZvR04IXvATMfe/GfarJo5/HeJElAZAONegw167Zp8Nu4nz
         Q/8tuSF/IwQrpRGQs5jBALPXsNYzkZN8fj7K8a5P8d4iMkk5CBnoLLnZxRZKTMCDpR/k
         ueUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P7k3ZPyI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4bbd70afe5esi1348290137.18.2025.02.12.07.45.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 07:45:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P7k3ZPyI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiEuG-0004Xp-Ka; Wed, 12 Feb 2025 10:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiEu7-0004SG-E1
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 10:43:59 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiEu5-0006vP-Jb
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 10:43:59 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4395f66a639so1931245e9.0
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 07:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739375035; x=1739979835; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mEULPqwUPtpzNSB0Z5/nLsqbWtVDcoNpITYqgf9zX7Q=;
 b=P7k3ZPyIkKFkLH4dwjWmK9/nwXvJJls5IXb1+24zeRE/ltvtUZO1JvtfS2XaXiqAPq
 k9CNs1GLJFtfsUEkEZHekY6cdM1eJydveHSUNlIoNCZUZlRw+832wOZW1aBU1GQI0Fds
 d3TKNUjd6oYDwFjXZmyk2sa9XA7yDjifbPyQ9hrJmL+URH1c/4NpE//fJPuf8Gn+Sb4P
 knHf+x+BzynCchaI3B9uIWC3CeLlxR95+6vz0sg1xhVqnNjXAZmE1BNB0QwKPZpsLzFN
 RbiW1W74J54LeBOyZ7sV4TNU3H11KWtkVWbGIUsZ/gSs8/gZBBWiy/MPU7CSsWwJ60ti
 JSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739375035; x=1739979835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mEULPqwUPtpzNSB0Z5/nLsqbWtVDcoNpITYqgf9zX7Q=;
 b=X3c+2cpbh7hyukOuCYIR+SsSgQd5/LDKupONHotQgqUO/s3z7ysWlg1Ftxo36O9EPx
 NfMKM5FWlCXEyGalAZBL1VW+Yb2Eu28TwCmtU2r1Ix8u8ytlQp4TzJd8rm8pVI2Suilz
 rPAx5nlNtnOPY/xp+HzDaRUJyhdyeAtm6/BzRlscbWHGg2DbVJP7NBTan6fBwDUk0NIN
 3tHL8fQrts8lS98CCVLIlBwkfahzR6nCCco/b7uWGv2uSImzpzv+5BpmzTvmswg9CnHc
 TxNZwk+yoKe4bOHgHob4uCF9Ap4B/8M6gURb+T1YEPYSc5cKpwt506+ZFda1tU1JX0tQ
 tm1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUinjY/HQ+UU8V7nBfPxR9ve0mqXJ7QVebn2KKEhRVp/oI6kR8prNEoPGQk0rMSmlcox4a2dxzAAg==@nongnu.org
X-Gm-Message-State: AOJu0Yz59vIiE/KjGiaSNibaSFHUGGArCfmEZuNchOcb7SMBGePK4zhp
 DxSOLGqxsXy8XguUd2V6fpy+5OWG2CVDDsD3rbzUlb4FcLBtVecSEwjZkvxNbrM=
X-Gm-Gg: ASbGncsz480CFzUEvCrn7QUtlq+7gjsTL4rA/KpR/GOK/3wZ+7qN5BZxHViwLUdURrg
 tjRYJOkGQePMezKKHHA8Bg9J0NLvTlljYtZ86jK59htOKR8eo5bfXm8r6ZH1ut2Qw9UnpByIrsI
 aEKtk/Hj3tHkxtyrOvW07se194cuNvMMXPkvscWs2OH7ZnKadZaP8vEiiHRpFNpY181fU19jfxm
 TknCvywolk0sNsiuz+A1O2zkWvR5jyolIbhOmLoe1W2ia75sECerVtW7HpTZbq1Khb8arTU0XvS
 oTbLEXKP7xjCClBin52I+FkBQ7ljc30xHWZOfC1PVwt1tBCf2JrfygaGPJNxR5/aNuv4wEI=
X-Received: by 2002:a05:600c:34cf:b0:431:3bf9:3ebb with SMTP id
 5b1f17b1804b1-439581b2618mr36292205e9.24.1739375035466; 
 Wed, 12 Feb 2025 07:43:55 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38deb4f7bacsm2120986f8f.58.2025.02.12.07.43.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 07:43:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 4/8] hw/arm/xilinx_zynq: Replace IRQ_OFFSET -> GIC_INTERNAL
Date: Wed, 12 Feb 2025 16:43:29 +0100
Message-ID: <20250212154333.28644-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212154333.28644-1-philmd@linaro.org>
References: <20250212154333.28644-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: 6595ZCWo8Ern

We already have a definition to distinct GIC internal
IRQs versus external ones, use it. No logical changes.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xilinx_zynq.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 8477b828745..18051458945 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -54,8 +54,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(ZynqMachineState, ZYNQ_MACHINE)
 #define FLASH_SIZE (64 * 1024 * 1024)
 #define FLASH_SECTOR_SIZE (128 * 1024)
 
-#define IRQ_OFFSET 32 /* pic interrupts start from index 32 */
-
 #define MPCORE_PERIPHBASE 0xF8F00000
 #define ZYNQ_BOARD_MIDR 0x413FC090
 
@@ -281,12 +279,12 @@ static void zynq_init(MachineState *machine)
         pic[n] = qdev_get_gpio_in(dev, n);
     }
 
-    n = zynq_init_spi_flashes(0xE0006000, pic[58 - IRQ_OFFSET], false, 0);
-    n = zynq_init_spi_flashes(0xE0007000, pic[81 - IRQ_OFFSET], false, n);
-    n = zynq_init_spi_flashes(0xE000D000, pic[51 - IRQ_OFFSET], true, n);
+    n = zynq_init_spi_flashes(0xE0006000, pic[58 - GIC_INTERNAL], false, 0);
+    n = zynq_init_spi_flashes(0xE0007000, pic[81 - GIC_INTERNAL], false, n);
+    n = zynq_init_spi_flashes(0xE000D000, pic[51 - GIC_INTERNAL], true, n);
 
-    sysbus_create_simple(TYPE_CHIPIDEA, 0xE0002000, pic[53 - IRQ_OFFSET]);
-    sysbus_create_simple(TYPE_CHIPIDEA, 0xE0003000, pic[76 - IRQ_OFFSET]);
+    sysbus_create_simple(TYPE_CHIPIDEA, 0xE0002000, pic[53 - GIC_INTERNAL]);
+    sysbus_create_simple(TYPE_CHIPIDEA, 0xE0003000, pic[76 - GIC_INTERNAL]);
 
     dev = qdev_new(TYPE_CADENCE_UART);
     busdev = SYS_BUS_DEVICE(dev);
@@ -295,7 +293,7 @@ static void zynq_init(MachineState *machine)
                           qdev_get_clock_out(slcr, "uart0_ref_clk"));
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, 0xE0000000);
-    sysbus_connect_irq(busdev, 0, pic[59 - IRQ_OFFSET]);
+    sysbus_connect_irq(busdev, 0, pic[59 - GIC_INTERNAL]);
     dev = qdev_new(TYPE_CADENCE_UART);
     busdev = SYS_BUS_DEVICE(dev);
     qdev_prop_set_chr(dev, "chardev", serial_hd(1));
@@ -303,15 +301,15 @@ static void zynq_init(MachineState *machine)
                           qdev_get_clock_out(slcr, "uart1_ref_clk"));
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, 0xE0001000);
-    sysbus_connect_irq(busdev, 0, pic[82 - IRQ_OFFSET]);
+    sysbus_connect_irq(busdev, 0, pic[82 - GIC_INTERNAL]);
 
     sysbus_create_varargs("cadence_ttc", 0xF8001000,
-            pic[42-IRQ_OFFSET], pic[43-IRQ_OFFSET], pic[44-IRQ_OFFSET], NULL);
+            pic[42-GIC_INTERNAL], pic[43-GIC_INTERNAL], pic[44-GIC_INTERNAL], NULL);
     sysbus_create_varargs("cadence_ttc", 0xF8002000,
-            pic[69-IRQ_OFFSET], pic[70-IRQ_OFFSET], pic[71-IRQ_OFFSET], NULL);
+            pic[69-GIC_INTERNAL], pic[70-GIC_INTERNAL], pic[71-GIC_INTERNAL], NULL);
 
-    gem_init(0xE000B000, pic[54 - IRQ_OFFSET]);
-    gem_init(0xE000C000, pic[77 - IRQ_OFFSET]);
+    gem_init(0xE000B000, pic[54 - GIC_INTERNAL]);
+    gem_init(0xE000C000, pic[77 - GIC_INTERNAL]);
 
     for (n = 0; n < 2; n++) {
         int hci_irq = n ? 79 : 56;
@@ -330,7 +328,7 @@ static void zynq_init(MachineState *machine)
         qdev_prop_set_uint64(dev, "capareg", ZYNQ_SDHCI_CAPABILITIES);
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
         sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, hci_addr);
-        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[hci_irq - IRQ_OFFSET]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[hci_irq - GIC_INTERNAL]);
 
         di = drive_get(IF_SD, 0, n);
         blk = di ? blk_by_legacy_dinfo(di) : NULL;
@@ -343,7 +341,7 @@ static void zynq_init(MachineState *machine)
     dev = qdev_new(TYPE_ZYNQ_XADC);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xF8007100);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[39-IRQ_OFFSET]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[39-GIC_INTERNAL]);
 
     dev = qdev_new("pl330");
     object_property_set_link(OBJECT(dev), "memory",
@@ -363,15 +361,15 @@ static void zynq_init(MachineState *machine)
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, 0xF8003000);
-    sysbus_connect_irq(busdev, 0, pic[45-IRQ_OFFSET]); /* abort irq line */
+    sysbus_connect_irq(busdev, 0, pic[45-GIC_INTERNAL]); /* abort irq line */
     for (n = 0; n < ARRAY_SIZE(dma_irqs); ++n) { /* event irqs */
-        sysbus_connect_irq(busdev, n + 1, pic[dma_irqs[n] - IRQ_OFFSET]);
+        sysbus_connect_irq(busdev, n + 1, pic[dma_irqs[n] - GIC_INTERNAL]);
     }
 
     dev = qdev_new("xlnx.ps7-dev-cfg");
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
-    sysbus_connect_irq(busdev, 0, pic[40 - IRQ_OFFSET]);
+    sysbus_connect_irq(busdev, 0, pic[40 - GIC_INTERNAL]);
     sysbus_mmio_map(busdev, 0, 0xF8007000);
 
     /*
-- 
2.47.1

