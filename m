Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5559436lfc;
        Mon, 15 Feb 2021 04:03:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJza9A9o8gVWjXO8js1gRXGfxkWRntzVR+W5Dc+cq9I4iKkuyuD0MwCk2wTV1k7UQpzl8GVi
X-Received: by 2002:a05:6902:102a:: with SMTP id x10mr22857656ybt.70.1613390617448;
        Mon, 15 Feb 2021 04:03:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613390617; cv=none;
        d=google.com; s=arc-20160816;
        b=iJVpqiWAXb7YM1JLJZ4dTggWjSAytK5H+39qgrIBIxaQjkBgTrZsT2OMQMYhKYTI7F
         8lrCfnotDAZwDK50AsSUf5SN8VH9Cc6/OsecyuTgkgS5iPYHfo6WDs5ycfN/hah/mZSn
         1EoUc9dyxrUmqhIBoftLH7GAsUXvA/jJ2dHI8bNs2CjWAUJdYZt+DrmtmaGqvamGPHT1
         kS+nYCbwI82lf9wzPU/5UpQLJGpQwAm83Yi0ynYY7KLXTnVOgh3twwHq0DXyVU3FvXFG
         SiyH4Eg3zkB9NNmyy1Ho0yjWpJcvh8aocxmw3QpxE+ad3Ck5TgbMEqRvQQhTsmRjq9Pm
         TemA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+NbEIvKPXeseDuihlw5UuA+TE/Yh6pzRecBSPQLOGzA=;
        b=C8ANWYCWSVfsjOee9AZHVW0Nce5Icv78DvEc/v89X11mcSxb662m7PMBo4RT3OvMpH
         X+QAG1JS2mAsSbhzsWhy8otWMjsWn3kSxZ3+1x8MTRP4r1pWCl+KLgherIyb0CZk8len
         6A2WsUSwFjTFivyOPEj7wHAttkU9xsUNuBZTvrjNncEjI5cLBHzpj4fPWJ5NqNRoekjp
         3Gz6rzhQNs8/eDwPNTh5unDBBp3qAcUuMKP8qHPCSnzNLmqWTtQyBG/k4zCcGWibcU98
         UvFzFQ/twTesNXYtNzSpT0t6eLcE5lNyRWdp/u0yoMUvt1iWqwEkMfvdRuv3aWOaPafF
         xDxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JcB953aX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f126si16362043ybf.78.2021.02.15.04.03.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 04:03:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JcB953aX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBcbI-0005iN-QZ
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 07:03:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQf-0007z6-JM
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:37 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQd-000442-M0
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:37 -0500
Received: by mail-wr1-x434.google.com with SMTP id n8so8477491wrm.10
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 03:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+NbEIvKPXeseDuihlw5UuA+TE/Yh6pzRecBSPQLOGzA=;
 b=JcB953aXQ+kOZN6UN3HgPCvje9PxaJ4R82K4joukXBdiWrh7rvgf8d/fxkjLtTpsAU
 tzR2cBoV8fNtl+OM7px6ziJtYMNaKmVgCtNLa1phNiyeCsdZ3H8m9/oFTg4x+INhpQm5
 UYfwDYiu6l8+pDXX/k2q/nZakEBKGNZGAEyq/4lQR8A5CcHly1teNc1gVElDTyfcvcrH
 cKO3K2+ge6QIrK72pxNVcqk5/A2bq+qGw1gIGYRxMrDtv9j0C8BHpqWgmzaIhZ5ieGpz
 sz5gLTLS9GuEZNGQ1HigVhoU442a38VIBQuDD63jMnp/A7IlQ7DYmbsB/vrZboyieO1Q
 I1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+NbEIvKPXeseDuihlw5UuA+TE/Yh6pzRecBSPQLOGzA=;
 b=YcSvQB0vKiOK8daHkHhn1/cWONFjH+lvHVFLnmWeucGpbn00Wx/4V47Up5yivo7V+O
 4AFOH1IuvWYnGwbyYCf0OsQxJRen1FXiZA3GipmrEJbx1Zq5qQkKWGmgM86W3t4GPikJ
 /Rm76LxOXXokYuiIPJLSFAdh9XyIyVIJU6xMDsM3XadPlcVX7rBfs89VL11gcTmQQmvx
 n/XKxQpdBqbW/GYfF0YM7xqzpSEyqkr33p5b0vWwZY5uJB6FnvNMQrIbpaJkPZX4Ttl0
 SkqxFSVUfn0RtOzts5AZeMKjCRJziihh/Y6LPXo5gh0srbtG6qXoJ1fSmjy/ulyMRxC+
 w4pQ==
X-Gm-Message-State: AOAM53172jtzQ4PGP16UaYf+yILeeUWuCqu2ZFxBcRfE/8W2E2GWcnWo
 pa5Z5JEadgYro4lBvzQuQXalEVx0FApRwQ==
X-Received: by 2002:adf:b749:: with SMTP id n9mr18299390wre.267.1613389954486; 
 Mon, 15 Feb 2021 03:52:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 13/24] hw/arm/mps2-tz: Move device IRQ info to data
 structures
Date: Mon, 15 Feb 2021 11:51:27 +0000
Message-Id: <20210215115138.20465-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qN4U2AreBa5x

Move the specification of the IRQ information for the uart, ethernet,
dma and spi devices to the data structures.  (The other devices
handled by the PPCPortInfo structures don't have any interrupt lines
we need to wire up.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 52 +++++++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 085746ac3e6..014ba775783 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -208,12 +208,10 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
                                const char *name, hwaddr size,
                                const int *irqs)
 {
+    /* The irq[] array is tx, rx, combined, in that order */
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
     CMSDKAPBUART *uart = opaque;
     int i = uart - &mms->uart[0];
-    int rxirqno = i * 2 + 32;
-    int txirqno = i * 2 + 33;
-    int combirqno = i + 42;
     SysBusDevice *s;
     DeviceState *orgate_dev = DEVICE(&mms->uart_irq_orgate);
 
@@ -222,11 +220,11 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
     qdev_prop_set_uint32(DEVICE(uart), "pclk-frq", mmc->sysclk_frq);
     sysbus_realize(SYS_BUS_DEVICE(uart), &error_fatal);
     s = SYS_BUS_DEVICE(uart);
-    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, txirqno));
-    sysbus_connect_irq(s, 1, get_sse_irq_in(mms, rxirqno));
+    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[0]));
+    sysbus_connect_irq(s, 1, get_sse_irq_in(mms, irqs[1]));
     sysbus_connect_irq(s, 2, qdev_get_gpio_in(orgate_dev, i * 2));
     sysbus_connect_irq(s, 3, qdev_get_gpio_in(orgate_dev, i * 2 + 1));
-    sysbus_connect_irq(s, 4, get_sse_irq_in(mms, combirqno));
+    sysbus_connect_irq(s, 4, get_sse_irq_in(mms, irqs[2]));
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(uart), 0);
 }
 
@@ -283,7 +281,7 @@ static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
 
     s = SYS_BUS_DEVICE(mms->lan9118);
     sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, 48));
+    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[0]));
     return sysbus_mmio_get_region(s, 0);
 }
 
@@ -329,6 +327,7 @@ static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
                               const char *name, hwaddr size,
                               const int *irqs)
 {
+    /* The irq[] array is DMACINTR, DMACINTERR, DMACINTTC, in that order */
     PL080State *dma = opaque;
     int i = dma - &mms->dma[0];
     SysBusDevice *s;
@@ -373,9 +372,9 @@ static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
 
     s = SYS_BUS_DEVICE(dma);
     /* Wire up DMACINTR, DMACINTERR, DMACINTTC */
-    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, 58 + i * 3));
-    sysbus_connect_irq(s, 1, get_sse_irq_in(mms, 56 + i * 3));
-    sysbus_connect_irq(s, 2, get_sse_irq_in(mms, 57 + i * 3));
+    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[0]));
+    sysbus_connect_irq(s, 1, get_sse_irq_in(mms, irqs[1]));
+    sysbus_connect_irq(s, 2, get_sse_irq_in(mms, irqs[2]));
 
     g_free(mscname);
     return sysbus_mmio_get_region(s, 0);
@@ -394,13 +393,12 @@ static MemoryRegion *make_spi(MPS2TZMachineState *mms, void *opaque,
      * lines are set via the "MISC" register in the MPS2 FPGAIO device.
      */
     PL022State *spi = opaque;
-    int i = spi - &mms->spi[0];
     SysBusDevice *s;
 
     object_initialize_child(OBJECT(mms), name, spi, TYPE_PL022);
     sysbus_realize(SYS_BUS_DEVICE(spi), &error_fatal);
     s = SYS_BUS_DEVICE(spi);
-    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, 51 + i));
+    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[0]));
     return sysbus_mmio_get_region(s, 0);
 }
 
@@ -551,16 +549,16 @@ static void mps2tz_common_init(MachineState *machine)
         }, {
             .name = "apb_ppcexp1",
             .ports = {
-                { "spi0", make_spi, &mms->spi[0], 0x40205000, 0x1000 },
-                { "spi1", make_spi, &mms->spi[1], 0x40206000, 0x1000 },
-                { "spi2", make_spi, &mms->spi[2], 0x40209000, 0x1000 },
-                { "spi3", make_spi, &mms->spi[3], 0x4020a000, 0x1000 },
-                { "spi4", make_spi, &mms->spi[4], 0x4020b000, 0x1000 },
-                { "uart0", make_uart, &mms->uart[0], 0x40200000, 0x1000 },
-                { "uart1", make_uart, &mms->uart[1], 0x40201000, 0x1000 },
-                { "uart2", make_uart, &mms->uart[2], 0x40202000, 0x1000 },
-                { "uart3", make_uart, &mms->uart[3], 0x40203000, 0x1000 },
-                { "uart4", make_uart, &mms->uart[4], 0x40204000, 0x1000 },
+                { "spi0", make_spi, &mms->spi[0], 0x40205000, 0x1000, { 51 } },
+                { "spi1", make_spi, &mms->spi[1], 0x40206000, 0x1000, { 52 } },
+                { "spi2", make_spi, &mms->spi[2], 0x40209000, 0x1000, { 53 } },
+                { "spi3", make_spi, &mms->spi[3], 0x4020a000, 0x1000, { 54 } },
+                { "spi4", make_spi, &mms->spi[4], 0x4020b000, 0x1000, { 55 } },
+                { "uart0", make_uart, &mms->uart[0], 0x40200000, 0x1000, { 32, 33, 42 } },
+                { "uart1", make_uart, &mms->uart[1], 0x40201000, 0x1000, { 34, 35, 43 } },
+                { "uart2", make_uart, &mms->uart[2], 0x40202000, 0x1000, { 36, 37, 44 } },
+                { "uart3", make_uart, &mms->uart[3], 0x40203000, 0x1000, { 38, 39, 45 } },
+                { "uart4", make_uart, &mms->uart[4], 0x40204000, 0x1000, { 40, 41, 46 } },
                 { "i2c0", make_i2c, &mms->i2c[0], 0x40207000, 0x1000 },
                 { "i2c1", make_i2c, &mms->i2c[1], 0x40208000, 0x1000 },
                 { "i2c2", make_i2c, &mms->i2c[2], 0x4020c000, 0x1000 },
@@ -582,15 +580,15 @@ static void mps2tz_common_init(MachineState *machine)
                 { "gpio1", make_unimp_dev, &mms->gpio[1], 0x40101000, 0x1000 },
                 { "gpio2", make_unimp_dev, &mms->gpio[2], 0x40102000, 0x1000 },
                 { "gpio3", make_unimp_dev, &mms->gpio[3], 0x40103000, 0x1000 },
-                { "eth", make_eth_dev, NULL, 0x42000000, 0x100000 },
+                { "eth", make_eth_dev, NULL, 0x42000000, 0x100000, { 48 } },
             },
         }, {
             .name = "ahb_ppcexp1",
             .ports = {
-                { "dma0", make_dma, &mms->dma[0], 0x40110000, 0x1000 },
-                { "dma1", make_dma, &mms->dma[1], 0x40111000, 0x1000 },
-                { "dma2", make_dma, &mms->dma[2], 0x40112000, 0x1000 },
-                { "dma3", make_dma, &mms->dma[3], 0x40113000, 0x1000 },
+                { "dma0", make_dma, &mms->dma[0], 0x40110000, 0x1000, { 58, 56, 57 } },
+                { "dma1", make_dma, &mms->dma[1], 0x40111000, 0x1000, { 61, 59, 60 } },
+                { "dma2", make_dma, &mms->dma[2], 0x40112000, 0x1000, { 64, 62, 63 } },
+                { "dma3", make_dma, &mms->dma[3], 0x40113000, 0x1000, { 67, 65, 66 } },
             },
         },
     };
-- 
2.20.1

