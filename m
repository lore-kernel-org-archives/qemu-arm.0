Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp485647lfy;
        Fri, 21 Aug 2020 10:29:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIn8UC+yK5T6RLeVXr0/Tu+GCjjnQ4RScnZVAZmipItkAiVM1llWH9RnhHvaaCbWRiiGiS
X-Received: by 2002:a25:ab34:: with SMTP id u49mr4796867ybi.516.1598030999282;
        Fri, 21 Aug 2020 10:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598030999; cv=none;
        d=google.com; s=arc-20160816;
        b=UCroPl0I2rDbexKotXjOMJVQBAhqo3gBpuylaR9TU7kaBax0PcvxsBAqV0rv5O4mxx
         gXiJx35l8MLFtsexPJ8C9oB98i95N1nUr/JbXRKGxkhh67AiDsOqpxT33gaBDWoxItds
         RVFIznP+7e2WW5SiccIZi8cd0mUu+3QuKwz+K984LZU7D7BTNhC6bFPFRYSdLBAj4Ymf
         HWf+IbY7s2/AvoVLHYjjCGlGvRpZ2hikfPLNivS7YsiqX8SeKch+u7bUH6LApO+BVLih
         B4U4Sk/8Sr+AZF02l4cyIm5EvBrwUisPAST3bGvi/eoOyfknlLxSeoPrXBnajE0WRrz3
         q3Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2+ejMCV40ttJWX503UL/cUbXCRo7C8BOcBLGhpyL8vw=;
        b=Dnr6VwvC2mbh1lgbqpSCxpdAvM/u7ND0cphySXdrNZ2eJn2AQkGzsIuoug2j1jZOgE
         KFL2o0v30FGu/3KNtlivd4V53Pf9GOvZWqIdqrzwDyz2nwWLa/PjmZ5vDAjTjcgQlar9
         zNLD81OwFuFmWVGLTRpVGhOkPnNdFjptD/NTUTsZCgxupMg7iBAy/WXQZsPJ46vY8p7x
         f7k089cA6Arda0G5H64OmLO7kWDedZuxXzuxyiCoZmmcwn/25eMrtN7/gGvl3CLb0NLI
         H15iCTHedXHxf6g0xUG01lKCMGljYJxnwdrXNS2eKc8GEE/WYfRb2ekz5Dn3SREE11d0
         KD1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nLfuPzOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 195si2679111ybe.452.2020.08.21.10.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Aug 2020 10:29:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nLfuPzOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:39960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9ArW-0001Lw-Cp
	for alex.bennee@linaro.org; Fri, 21 Aug 2020 13:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Aqz-0000xL-8i; Fri, 21 Aug 2020 13:29:25 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Aqw-00018v-V6; Fri, 21 Aug 2020 13:29:24 -0400
Received: by mail-wm1-x344.google.com with SMTP id o21so2580076wmc.0;
 Fri, 21 Aug 2020 10:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2+ejMCV40ttJWX503UL/cUbXCRo7C8BOcBLGhpyL8vw=;
 b=nLfuPzOVTS6MAnqX5dE/nlZUfw+0gk4QiabS3aL3+XIVtbPiTXsA1+scnZg8e/A1Fm
 xAyHkZ8q0MPqSA10D/KEU5Fb7WyNIVMN2Panw7mHuyyx7MRTreLXT5xLELPr7eWyLZ5M
 KLMME7JQuv0agJrQJoup8N5y4bxYxRcZ7aczJ/ek6RXe+Ph6dsxIL5W/5UFS/gMJRq4e
 Rxw6HaVwI/OnWQAq/U2SJ8QemdNXt1miwm8TEJbFitNVTdnCaH1S/VAedBtt2A6QDMvl
 SVx7RRxNAu7LqSQfoJ4LlyUCUMehYrFY0Oi0oaiT8cqbogaxioI1cc6HB9OgCQ4c5iy2
 WHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2+ejMCV40ttJWX503UL/cUbXCRo7C8BOcBLGhpyL8vw=;
 b=klpxa/Ygdn6zvV62Jl3YXlEBPHk7aqThAk9sU+bljdi8LWNFbKx6GBe3DHTmYmPVdY
 BXLCc/TUBbO46+UK8iQddpv+/rQ/8ba26hcersMVFoCjLmUdRjOk4tL73jwB8QQ79dQH
 2z/npXZkLbY/eCm4LlT2u1mw7eHVUaSoZktsAdOSlCSG1t5P95s0sTrqvxS+U40upBmS
 ikBYw6OtUQUrB+0amqnvLNGtDZZg74Zq8d7g87LnXwMunbsOInkG4OqAtBx+KL02Y9Zs
 HK6zdD6EpSvBZ3iLlXp1nBAFbbmetq/if+LAcvuyLISt85fPWWoDg/nj84hZnDEr+RxY
 +KUg==
X-Gm-Message-State: AOAM533llraQ75q7YrCrcaEMkEtvwXwrRZ2LaqKqhYTizHWJVpYPai6/
 ZTNQLjnUrLUvZG28uLLhyUpjhZzzNWQ=
X-Received: by 2002:a1c:6243:: with SMTP id w64mr4077941wmb.3.1598030960506;
 Fri, 21 Aug 2020 10:29:20 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 32sm5315471wrn.86.2020.08.21.10.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 10:29:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/23] hw/sd/pxa2xx_mmci: Do not create SD card within the SD
 host controller
Date: Fri, 21 Aug 2020 19:28:54 +0200
Message-Id: <20200821172916.1260954-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821172916.1260954-1-f4bug@amsat.org>
References: <20200821172916.1260954-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UuB0ku6tuuDs

SD/MMC host controllers provide a SD Bus to plug SD cards,
but don't come with SD card plugged in :)

The machine/board object is where the SD cards are created.
Since the PXA2xx is not qdevified, for now create the cards
in pxa270_init() which is the SoC model.
In the future we will move this to the board model.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20200705213350.24725-2-f4bug@amsat.org>
---
 include/hw/arm/pxa.h |  3 +--
 hw/arm/pxa2xx.c      | 39 +++++++++++++++++++++++++++++----------
 hw/sd/pxa2xx_mmci.c  | 11 ++---------
 3 files changed, 32 insertions(+), 21 deletions(-)

diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index 8843e5f9107..d99b6192daf 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -89,8 +89,7 @@ void pxa2xx_lcd_vsync_notifier(PXA2xxLCDState *s, qemu_irq handler);
 typedef struct PXA2xxMMCIState PXA2xxMMCIState;
 PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
                 hwaddr base,
-                BlockBackend *blk, qemu_irq irq,
-                qemu_irq rx_dma, qemu_irq tx_dma);
+                qemu_irq irq, qemu_irq rx_dma, qemu_irq tx_dma);
 void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
                 qemu_irq coverswitch);
 
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 6203c4cfe0b..20fa201dd57 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -22,6 +22,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/ssi/ssi.h"
+#include "hw/sd/sd.h"
 #include "chardev/char-fe.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/qtest.h"
@@ -2136,15 +2137,24 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
 
     s->gpio = pxa2xx_gpio_init(0x40e00000, s->cpu, s->pic, 121);
 
-    dinfo = drive_get(IF_SD, 0, 0);
-    if (!dinfo && !qtest_enabled()) {
-        warn_report("missing SecureDigital device");
-    }
     s->mmc = pxa2xx_mmci_init(address_space, 0x41100000,
-                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                     qdev_get_gpio_in(s->pic, PXA2XX_PIC_MMC),
                     qdev_get_gpio_in(s->dma, PXA2XX_RX_RQ_MMCI),
                     qdev_get_gpio_in(s->dma, PXA2XX_TX_RQ_MMCI));
+    dinfo = drive_get(IF_SD, 0, 0);
+    if (dinfo) {
+        DeviceState *carddev;
+
+        /* Create and plug in the sd card */
+        carddev = qdev_new(TYPE_SD_CARD);
+        qdev_prop_set_drive_err(carddev, "drive",
+                                blk_by_legacy_dinfo(dinfo), &error_fatal);
+        qdev_realize_and_unref(carddev, qdev_get_child_bus(DEVICE(s->mmc),
+                                                           "sd-bus"),
+                               &error_fatal);
+    } else if (!qtest_enabled()) {
+        warn_report("missing SecureDigital device");
+    }
 
     for (i = 0; pxa270_serial[i].io_base; i++) {
         if (serial_hd(i)) {
@@ -2260,15 +2270,24 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size)
 
     s->gpio = pxa2xx_gpio_init(0x40e00000, s->cpu, s->pic, 85);
 
-    dinfo = drive_get(IF_SD, 0, 0);
-    if (!dinfo && !qtest_enabled()) {
-        warn_report("missing SecureDigital device");
-    }
     s->mmc = pxa2xx_mmci_init(address_space, 0x41100000,
-                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                     qdev_get_gpio_in(s->pic, PXA2XX_PIC_MMC),
                     qdev_get_gpio_in(s->dma, PXA2XX_RX_RQ_MMCI),
                     qdev_get_gpio_in(s->dma, PXA2XX_TX_RQ_MMCI));
+    dinfo = drive_get(IF_SD, 0, 0);
+    if (dinfo) {
+        DeviceState *carddev;
+
+        /* Create and plug in the sd card */
+        carddev = qdev_new(TYPE_SD_CARD);
+        qdev_prop_set_drive_err(carddev, "drive",
+                                blk_by_legacy_dinfo(dinfo), &error_fatal);
+        qdev_realize_and_unref(carddev, qdev_get_child_bus(DEVICE(s->mmc),
+                                                           "sd-bus"),
+                               &error_fatal);
+    } else if (!qtest_enabled()) {
+        warn_report("missing SecureDigital device");
+    }
 
     for (i = 0; pxa255_serial[i].io_base; i++) {
         if (serial_hd(i)) {
diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 68bed24480e..9482b9212dd 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -476,10 +476,9 @@ static const MemoryRegionOps pxa2xx_mmci_ops = {
 
 PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
                 hwaddr base,
-                BlockBackend *blk, qemu_irq irq,
-                qemu_irq rx_dma, qemu_irq tx_dma)
+                qemu_irq irq, qemu_irq rx_dma, qemu_irq tx_dma)
 {
-    DeviceState *dev, *carddev;
+    DeviceState *dev;
     SysBusDevice *sbd;
     PXA2xxMMCIState *s;
 
@@ -492,12 +491,6 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
     qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
     sysbus_realize_and_unref(sbd, &error_fatal);
 
-    /* Create and plug in the sd card */
-    carddev = qdev_new(TYPE_SD_CARD);
-    qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
-    qdev_realize_and_unref(carddev, qdev_get_child_bus(dev, "sd-bus"),
-                           &error_fatal);
-
     return s;
 }
 
-- 
2.26.2

