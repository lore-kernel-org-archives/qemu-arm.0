Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp184445njb;
        Thu, 30 Jan 2025 10:27:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV0GnpARy5BaGdgAVsaL9l5zxuyKmaTK+S1PMZQ2FKMC4U5LpQHj8WOEE2PMf4q4f2qDXsZgHtklzA4yQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFGDh7L6jDPz3tPywQSxAJmZBRJlNEZFUJtlhx9qEUh5V7hkkefC1F4x/V8nU7axwsOZFEp
X-Received: by 2002:a05:620a:254f:b0:7bc:dc89:3703 with SMTP id af79cd13be357-7bffcce8586mr1023051785a.14.1738261673287;
        Thu, 30 Jan 2025 10:27:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261673; cv=none;
        d=google.com; s=arc-20240605;
        b=IQx6W1dqhRyLUuCzUfCpwYnj6Ted3sKugXGgzjzNfl5LL/FOYBU4EKMfpnWMVQx+PO
         or/cUcjXvne/Le+tnpHtM/jiFgNZUy98/zgmF4Ea0DJJ95i6Le9v0d9I1dVid7h/w913
         X0wZKlbKuwHFjExs4Han0s2Bj2IJ/yYOxEg1W5szGqmYgIvUyBncR56Vql0igWHWXinj
         vi6Oq63KNJ9vP7qnnBOtXLEY0K8UXjrHSROa2yb8zaR8hh7KR8Fu/z1P7Z2zTLAt0gE5
         XNhF0JKlibt0AxV3/ngDwCTnM20dQ+bo78/o7fT2SPnCuKijEnI8D1p71mZQUqioiqqn
         juDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ffy+7tyS7lEIAtYpG0ijLba+piKy+IqvYcNHx83E6nQ=;
        fh=tgws5Wgh7IS5WaChPqqgP0SSRZOR9SwHeSEYLQDF9KI=;
        b=bl0wpBAW2xbUerMyoD1UHMGEUK4isGzK27t2FDErYsvngl7/ztsXLiOAfZ+XJApsaj
         WBFftPcecBtXby+Y18LEIIfSgxiYcUk8USizvGPQXFep32bpme5w4UibpFnFAazuudUq
         +4LTLDBCB932ZCs1LpP+cKJkOaddWkSbS7gMBhfYr1Fz/S6WLnjxDB+m5l7gBAs6tz6U
         UnNbEKa1Zi89j6WVIE/qPYKv2Mul2/XiatqvOynPpm3H222tEMi9f6V3XjzwGOkrrqb2
         ub7ltiSzUL+GdkGa/zCndtT+W5mqd2UzB0ENIurCWwP/mInVEpfLajtoFQmfpCZQaXxX
         nJKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FgWrhkx7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a90c125si209883385a.360.2025.01.30.10.27.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 10:27:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FgWrhkx7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdZFT-0002PB-Ar; Thu, 30 Jan 2025 13:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdZEu-0001UT-9B
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 13:26:10 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdZEs-0001Ce-At
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 13:26:07 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so13209935e9.2
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 10:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738261563; x=1738866363; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ffy+7tyS7lEIAtYpG0ijLba+piKy+IqvYcNHx83E6nQ=;
 b=FgWrhkx7zCaMt3ym1sk1qH8atNJ/fE/1O2jr359mCjU70+Vp9vI27BBbBqZ+7FzJIS
 DV247SNN0Wa5hLNFqbEfFgwu/nCRLhMj06ohdaTvjhuorzuGeHvtc9JTUX2HlmxHlOVT
 bkYZrTEtjh4vdUMotGgZNF84FV4/f5MG9BZ69laxCrFQ6cIrFY7cc/Zws53Uf4oXaP/H
 s/jBU7cRnBMVx4NGgb6gNoc8H//0oqLiYq9E5r8ByO43Z2BFAhE3jZD5Dfnz0w04A8J6
 DbxbytXqL18tsHbkpp/GXjxeDmDH3aDbGjjY9oIWSFrXnnhT5Yyk1zyS6t2CfyrJlzht
 IEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738261563; x=1738866363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ffy+7tyS7lEIAtYpG0ijLba+piKy+IqvYcNHx83E6nQ=;
 b=hn/GW0ik9SlNTzd4Lo/WdP3P8mmEPl4+9uD0iNeM+gXDN5r3Ar1p8iJmKomhnrYOnc
 f9unfkfPhttp7/wMCjLvM0pk+wWf7jD9NArlpuy8oWhV35D/poGMqvSDubqh2vB7fs9F
 X/kVqRiY4qNoQKTzGBcLDu1KWR/1cGPX1sDOGuKJ5yPg3Dexfo64no46E/VaUXHGZrXy
 1koySqV1/3D1NO27MPBu3olaabZ4Ip3pv4ZkO1PjC/i2rh2aq+cUYxd+80CyFKzBU0C+
 I337cnvwg2KYwbi5rs/oJ9VbMkj7T4KHJGnAIApreOGt9NzRMyIFNBsHAMwc9JtCFnfq
 QLkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeDF2amuyvLXygnKEZdjC5HSMXZMqGs2qhQEmqutL9CjwvrLzDLvr07BWenJWHg7RSzcK0UbZgQQ==@nongnu.org
X-Gm-Message-State: AOJu0YybCfOxrA635SDaiYWSxZUEQvJlT/nC7w9jLBmCCS5qddvo/WIL
 IucP/ZDfdVgsV5tg2x6RCj30OtVGrXBf/ZproNFnnJxnrmFGfON0tlFjOrerxEE=
X-Gm-Gg: ASbGncviE7yiInjAfkPnYG98s0tPPLrKJvOhEcj6Kn5R8vFs8GOUp6L5adly7l5LM9G
 lV+wgbH0tA3/W3A+h/7IDHqYI7nqwWxKzTyFJKOFLM70SadB9AIWQfohoDQ4OKS6gDVIK8K9V5K
 jXwOsiX4YtTup5T07rchNnf0dywsCiTqGibWB4KcQ4cCrvkEocKM7mSojHo+xG+GkY5kLhUZscK
 iATuUX2d7c35J3SBv61CdjHQ1+NwTKgg7IscUlGBHapTY7Pn8aoGE/0dohGxxbF4by25m8+AO62
 yMuJrtMCwiQQ2/tzw1V0Sm64VjGtJISTxlHOhBeUdxhmOegVDewEoJDLaXjqwU4lZQ==
X-Received: by 2002:a05:600c:444c:b0:434:a734:d279 with SMTP id
 5b1f17b1804b1-438dc3caef4mr93958155e9.16.1738261562727; 
 Thu, 30 Jan 2025 10:26:02 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23e6bf8sm31108925e9.23.2025.01.30.10.26.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 10:26:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/8] hw/arm/xilinx_zynq: Replace IRQ_OFFSET -> GIC_INTERNAL
Date: Thu, 30 Jan 2025 19:24:37 +0100
Message-ID: <20250130182441.40480-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130182441.40480-1-philmd@linaro.org>
References: <20250130182441.40480-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: nB9fmA/t/8eK

We already have a definition to distinct GIC internal
IRQs versus external ones, use it. No logical changes.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

