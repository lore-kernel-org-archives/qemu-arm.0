Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp2473873njc;
        Fri, 23 May 2025 04:37:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXapZ6mfzY2jMHmHhNGtYNIP+vgOlFMDQmcSWcL7g2UmgbsoQbLzzhxFwr3XWf4GpYeaZk5goTicUN5pA==@linaro.org
X-Google-Smtp-Source: AGHT+IGBVssXOyBvD1Z1tL5lKb6lD3cdcqbX3FTMDUjh+n6et7DoOugO0aPj0fF2z2PYCD1SqYzW
X-Received: by 2002:a05:6102:dd1:b0:4df:8f09:7d94 with SMTP id ada2fe7eead31-4e049d151f2mr24519857137.1.1748000251999;
        Fri, 23 May 2025 04:37:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748000251; cv=none;
        d=google.com; s=arc-20240605;
        b=F6oBt2Eu9SFQC15ez7F4734p4Y8kSeT8VwXnxj+AfLUzclSb/Hh+zKsEw/l7ku9J31
         Zx9nFWXy1ciUWcEJIYWvetg0FhJrXnIkLXXAvWhoQThfJ/1VA3tIPAIDeX/3wZMt8tOp
         80OsDGAABeeOxT18fAx6j3gthG1wjoY1A/Epsd7tKRyvgSCHrUBsb/+2vg/Y0MrF5W7I
         vdEOixTSSzOTRwIWgTFFC0vUMVXBqjchPx72W97jxJyQUd8d5ZQxv2+7GpoqWhEy7+ol
         qNw0JXAaIgHDJcCYlZhJWEfd42SPjYH6QRz/2ihe33m+ZYv6nwFKBVD7PuzRLCqFILcz
         3OqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=j+eCcHA9xTU4Qf4P1J0lPfbnso/LoNe5t0aeGmrjeQA=;
        fh=FFcxFM2uhrTJo/SzPfgszERozwUY6POsDsITUB8pqI8=;
        b=epeRmJKWJPBcvncTo6k4WrAnEph01uqaH/9vE3FJsdQY1W62Ux6GV1hEfg/klRNyS9
         Bk2vussjSr8Kyik2cZcX/CFjWjIy+SkzE8j1vfaA+fizWpDsvjUmHOjDHF3P2s/VnWKn
         bxOV1eyCt4kLgyhDlgPTM5ScP2r4eKWPjf/e0m+P5HGJgcCfCGbE3H01KcyeRKMRwdi4
         cMh0Qs6FkzirnaY1fKgaGZ+8m+cindlTbeebPs1MA1FIc1dbfr8LFqXjypQbkFDbbs+F
         ASeuEkfuvQyHiiM6Hk8p5o/lSshIr0+aEkUNVYjSQqG0DA2hf9Xu8HDa5Q0mRnyQEmMh
         y+mQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@maquefel.me header.s=mail header.b=JTBI42po;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4dfa68f48absi6603969137.691.2025.05.23.04.37.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 May 2025 04:37:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@maquefel.me header.s=mail header.b=JTBI42po;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uIQi0-00084a-Mz; Fri, 23 May 2025 07:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1uIQhw-00083Z-QY; Fri, 23 May 2025 07:37:02 -0400
Received: from forward500d.mail.yandex.net ([178.154.239.208])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1uIQht-0003g4-KZ; Fri, 23 May 2025 07:37:00 -0400
Received: from mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c42:4946:0:640:90b4:0])
 by forward500d.mail.yandex.net (Yandex) with ESMTPS id D529B61300;
 Fri, 23 May 2025 14:36:50 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id kaOXlq9LjuQ0-uLh3G4gj; 
 Fri, 23 May 2025 14:36:50 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1748000210; bh=j+eCcHA9xTU4Qf4P1J0lPfbnso/LoNe5t0aeGmrjeQA=;
 h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=JTBI42porXpgkNqVzUDms7ehNGOXKnXEpB9WMrZiMv4fSJUS2UGVHzwZHKFva2/3M
 wQB21FElkQTvdWBpQ5bUeNn1ksOJgHE2vNhKVqqXbfb8zg/dQkdM0hHlglu3ozP0VZ
 4aQXmeZiqRd9qd51vaTxNuRdj5GRQqgvrJfiXyfI=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.klg.yp-c.yandex.net;
 dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Ilya Chichkov <i.chichkov@yadro.com>,
 Nikita Shubin <n.shubin@yadro.com>
Subject: [PATCH v2 2/3] hw/arm/stm32f100: Add DMA support for stm32f100
Date: Fri, 23 May 2025 14:36:46 +0300
Message-ID: <20250523113647.4388-3-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250523113647.4388-1-nikita.shubin@maquefel.me>
References: <20250523113647.4388-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.208;
 envelope-from=nikita.shubin@maquefel.me; helo=forward500d.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: ujWDS6HC8T6c

From: Nikita Shubin <n.shubin@yadro.com>

Add STM32 DMA support for stm32f100 SoC.

Signals from periphery to DMA are not connected, as no STM32 periphery
currently supports DMA.

Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
---
 hw/arm/Kconfig                 |  1 +
 hw/arm/stm32f100_soc.c         | 51 ++++++++++++++++++++++++++++++++++
 include/hw/arm/stm32f100_soc.h |  3 ++
 3 files changed, 55 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index a55b44d7bd..4b476cfc3b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -374,6 +374,7 @@ config STM32F100_SOC
     select ARM_V7M
     select STM32F2XX_USART
     select STM32F2XX_SPI
+    select STM32_DMA
 
 config STM32F205_SOC
     bool
diff --git a/hw/arm/stm32f100_soc.c b/hw/arm/stm32f100_soc.c
index 53b5636452..dc864ef403 100644
--- a/hw/arm/stm32f100_soc.c
+++ b/hw/arm/stm32f100_soc.c
@@ -39,9 +39,29 @@
 static const uint32_t usart_addr[STM_NUM_USARTS] = { 0x40013800, 0x40004400,
     0x40004800 };
 static const uint32_t spi_addr[STM_NUM_SPIS] = { 0x40013000, 0x40003800 };
+static const uint32_t dma_addr[STM_NUM_DMA] = { 0x40020000, 0x40020400 };
 
 static const int usart_irq[STM_NUM_USARTS] = {37, 38, 39};
 static const int spi_irq[STM_NUM_SPIS] = {35, 36};
+static const uint8_t dma1_irq[] = {
+    11, /* DMA1 channel0 global interrupt */
+    12, /* DMA1 channel1 global interrupt */
+    13, /* DMA1 channel2 global interrupt */
+    14, /* DMA1 channel3 global interrupt */
+    15, /* DMA1 channel4 global interrupt */
+    16, /* DMA1 channel5 global interrupt */
+    17, /* DMA1 channel6 global interrupt */
+};
+
+static const uint8_t dma2_irq[] = {
+    56, /* DMA2 channel0 global interrupt */
+    57, /* DMA2 channel1 global interrupt */
+    58, /* DMA2 channel2 global interrupt */
+    59, /* DMA2 channel3 global interrupt */
+    59, /* DMA2 channel4/5 global interrupt */
+};
+
+static const uint8_t dma_chan_num[STM_NUM_DMA] = { 7, 6 };
 
 static void stm32f100_soc_initfn(Object *obj)
 {
@@ -59,6 +79,10 @@ static void stm32f100_soc_initfn(Object *obj)
         object_initialize_child(obj, "spi[*]", &s->spi[i], TYPE_STM32F2XX_SPI);
     }
 
+    for (i = 0; i < STM_NUM_DMA; i++) {
+        object_initialize_child(obj, "dma[*]", &s->dma[i], TYPE_STM32_DMA);
+    }
+
     s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
     s->refclk = qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0);
 }
@@ -126,6 +150,33 @@ static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
         return;
     }
 
+    /* DMA 1 */
+    dev = DEVICE(&(s->dma[0]));
+    qdev_prop_set_uint8(dev, "nchans", dma_chan_num[0]);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->dma[0]), errp)) {
+        return;
+    }
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, dma_addr[0]);
+    for (i = 0; i < ARRAY_SIZE(dma1_irq); i++) {
+        sysbus_connect_irq(busdev, i, qdev_get_gpio_in(armv7m, dma1_irq[i]));
+    }
+
+    /* DMA 2 */
+    dev = DEVICE(&(s->dma[1]));
+    qdev_prop_set_uint8(dev, "nchans", dma_chan_num[1]);
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->dma[1]), errp)) {
+        return;
+    }
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, dma_addr[1]);
+    for (i = 0; i < ARRAY_SIZE(dma2_irq); i++) {
+        sysbus_connect_irq(busdev, i, qdev_get_gpio_in(armv7m, dma2_irq[i]));
+    }
+
+    /* DMA channel 4 and 5 have shared irq */
+    sysbus_connect_irq(busdev, i, qdev_get_gpio_in(armv7m, dma2_irq[i - 1]));
+
     /* Attach UART (uses USART registers) and USART controllers */
     for (i = 0; i < STM_NUM_USARTS; i++) {
         dev = DEVICE(&(s->usart[i]));
diff --git a/include/hw/arm/stm32f100_soc.h b/include/hw/arm/stm32f100_soc.h
index a74d7b369c..0ee02e157c 100644
--- a/include/hw/arm/stm32f100_soc.h
+++ b/include/hw/arm/stm32f100_soc.h
@@ -26,6 +26,7 @@
 #define HW_ARM_STM32F100_SOC_H
 
 #include "hw/char/stm32f2xx_usart.h"
+#include "hw/dma/stm32_dma.h"
 #include "hw/ssi/stm32f2xx_spi.h"
 #include "hw/arm/armv7m.h"
 #include "qom/object.h"
@@ -36,6 +37,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(STM32F100State, STM32F100_SOC)
 
 #define STM_NUM_USARTS 3
 #define STM_NUM_SPIS 2
+#define STM_NUM_DMA 2
 
 #define FLASH_BASE_ADDRESS 0x08000000
 #define FLASH_SIZE (128 * 1024)
@@ -49,6 +51,7 @@ struct STM32F100State {
 
     STM32F2XXUsartState usart[STM_NUM_USARTS];
     STM32F2XXSPIState spi[STM_NUM_SPIS];
+    STM32DmaState dma[STM_NUM_DMA];
 
     MemoryRegion sram;
     MemoryRegion flash;
-- 
2.48.1

