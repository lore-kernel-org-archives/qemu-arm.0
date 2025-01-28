Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3006515njk;
        Tue, 28 Jan 2025 02:47:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXHYxAlagaaj/vs+ZXIAhhnta8D9xnSSf8mm2yasg/1JKGEttc5CkLC9qHjmnOArXPoItWcxUmRtsAA4Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHnSbgP8LZOEtCL3luc0pwUOgxtwkdoBI6O2nnp9WqodV2VLMMoXIQVYYFvZfcq92+aR6bj
X-Received: by 2002:a05:620a:2986:b0:7ac:a0a5:9bf4 with SMTP id af79cd13be357-7be63246a69mr7810323285a.40.1738061260217;
        Tue, 28 Jan 2025 02:47:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738061260; cv=none;
        d=google.com; s=arc-20240605;
        b=ZEeG3vFkq7DtqQzih8+b9frkgJUwEeBqIRegw+taEOzoTu9uCXBv4nOlC68vkj7vaA
         IosQd9y2C6yWmAYfmzj1VGjCtT+qunIUakoLHPWsHGy8bNZSbtPCQiiVQCOrsLiQDq3F
         c7/tyaHW5UV2Xgp17CtrPqDs/35Zd0HyP+EeQefz22VHNpEmoo/rrf1N+rIhzEeYi584
         NTsyZ8fgBK0i1OggkXi88BcYBT+XweKnpQDBWZ2quZ2hN8zs4bpf/IeircTC/cegCD6B
         EWubqGBXBbzqlPwYohjc+f/ErQ1AeEYtMVVz6HRAxRibGGjGDbSDKmAtZ6/d8FDF50xt
         HcDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kVKf2PwS8I38xe+s6q6G1j7KxzUeSwKx/0XZ7RVEtQ4=;
        fh=CYh/mWquWlHugSrEke29gAeQoJ/Y5/SjisZhwB2mA+A=;
        b=AZCjXL/ecbnWUYm3XpI7Jd6o4H8pZ2vKxVL1bvVTZHMddtm6KIqTkpxKQAi1BBJmrM
         OcSDHAKA17MghDvKD/3s5TmIS7wLgV3DST2+DU9GveSm9wpkOrong+x26fq/GvAtd8NQ
         Uy+4IHEZAhLIGRc/19FhCXfSu6HEtJNaGKyGLh74AzFO7F7WiF0F41RAzpUib2B4wXKY
         8vvlgaCHe4LO5TCvl0dD5rMf0R8FoM0XnRehOKYfqv9kN7ASHVS9/P+2o4M8e/dQaCnh
         fEUrTsIq+39XTIjBXTCbZxEc1X1rltUsRPSCSTh7arqnsnhyH3qwIqSdjRfnctU8GqmD
         dOZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nob02JZd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af125f4si1215540485a.575.2025.01.28.02.47.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 02:47:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nob02JZd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcj6q-0001SN-03; Tue, 28 Jan 2025 05:46:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcj62-00018P-4p
 for qemu-devel@nongnu.org; Tue, 28 Jan 2025 05:45:30 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcj5y-0003WZ-Vi
 for qemu-devel@nongnu.org; Tue, 28 Jan 2025 05:45:29 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43618283dedso57778355e9.3
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2025 02:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738061125; x=1738665925; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVKf2PwS8I38xe+s6q6G1j7KxzUeSwKx/0XZ7RVEtQ4=;
 b=nob02JZdE4dkqFMj/PwL5Ut1kCqXGMSZmVj9wVeFYkUyr6HsIth3iWovEq10Rm7YrJ
 dAG/xmrcTJNc2m3FCNQz2s1CQDSOyURpsnQ/lRdN2X5IBY7R3GPMDNSfzJ8gNaJkEbKD
 HAgpFG7pBBEKh44500gFTUE6k8hx6sC9FoApJNOeu18uFy3dhZD5tjYhj9Jt7MDHo3c4
 UNS+CWmtFo6KLD1jCYm0h1J2bjk7jTHGg+rrYM0py8/3VF4pR8ZKtwaIqzpnWT8/ms9C
 G4EBfRPi+U+A4U3idfJmHKhPhnuJZOh1oNku/XzAHRWSkDPoWPsRcOkLtPxlKZWp/e3r
 jHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738061125; x=1738665925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kVKf2PwS8I38xe+s6q6G1j7KxzUeSwKx/0XZ7RVEtQ4=;
 b=pEks02IkmCwi/atkLlr5sBexZJwarSSyG3IIEvpZCmEOUYz+eMBo/QxFtq3PVVxBpM
 Lq4G++DHOHaSqrk9iZQ0po3R7U7t+qhuiWPyKqs0zKPZPopJ3gG065gXChyRTV8hGqcX
 rHeZ2pxiHuSHhJWSOsRdP52UB174q2sQ3iLjEu7ZWF+ik9w5g65YJG53wclMmoCBsRyH
 GK8pUGiw+TCopkefHtOKG686544kMTY6gM+wRDUv9N7yFwXcbgXbDoD2BhrGfn2D5FRU
 k2PbaXd1ZSYINAaAmZKQwKzm49KBg8SHSHLkXkjpPQ/UNQ/NecFrUbQUjErdC2Ut5bD5
 tNDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2jAxcPJIHdv/EYG8+MpXlyDF8NfyAKWuFlyD1FWEawsMZN3EcC4MJIz91iMbeXU7XJnjWmeW11ei2@nongnu.org
X-Gm-Message-State: AOJu0Yz0n55ZKP5IAo3+F8g/K56bhWT085bIajnr08xRDTxkgziVB+ot
 tCtkizUHOtT2IJgFXGBRLt8GKG/BBohfDCj9xwEmcynrvZnp9An1jXZs+AR0L4w=
X-Gm-Gg: ASbGncvO8DtrfnDKPhpQ6XlnTOL/RnM6mS2sp7UbDglRxBvMkfGWUsEo7g56JaLo4Po
 RLdwqLxz1kpxALdw4vWThipmsJXQadyj41qK5Lmcp+X1JyxkE2Jz+PiSK2xNmm8IueYK+rwYLZt
 W+XrrYrh76W92oEGqMKPopOwvnu6aQVRhjAvEdA36uH2yXTalOGZWRb14VwAB/mcaW03xYOdK6w
 Kd1xLJcHc3mgRS0XWrmEepIW4Nj9qSMMlONZVKQsb+oAil3yq+t7sdCvq9qeh9R8ar5iDodpLrG
 u8zQJh2fDiGNlSd4roFj
X-Received: by 2002:a05:6000:144e:b0:38a:88bc:d57d with SMTP id
 ffacd0b85a97d-38bf56562e1mr36755509f8f.2.1738061124937; 
 Tue, 28 Jan 2025 02:45:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c418esm13920133f8f.95.2025.01.28.02.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 02:45:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 03/11] hw/sd/omap_mmc: Convert output qemu_irqs to gpio and
 sysbus IRQ APIs
Date: Tue, 28 Jan 2025 10:45:11 +0000
Message-Id: <20250128104519.3981448-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128104519.3981448-1-peter.maydell@linaro.org>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BYwcX1Vo0V9+

The omap_mmc device has three outbound qemu_irq lines:
 * one actual interrupt line
 * two which connect to the DMA controller and are signalled for
   TX and RX DMA

Convert these to a sysbus IRQ and two named GPIO outputs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/sd/omap_mmc.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index dd45abc075e..d497e31a6c5 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -31,7 +31,8 @@ typedef struct OMAPMMCState {
     SysBusDevice parent_obj;
 
     qemu_irq irq;
-    qemu_irq *dma;
+    qemu_irq dma_tx_gpio;
+    qemu_irq dma_rx_gpio;
     qemu_irq coverswitch;
     MemoryRegion iomem;
     omap_clk clk;
@@ -87,22 +88,22 @@ static void omap_mmc_fifolevel_update(OMAPMMCState *host)
     if (host->fifo_len > host->af_level && host->ddir) {
         if (host->rx_dma) {
             host->status &= 0xfbff;
-            qemu_irq_raise(host->dma[1]);
+            qemu_irq_raise(host->dma_rx_gpio);
         } else
             host->status |= 0x0400;
     } else {
         host->status &= 0xfbff;
-        qemu_irq_lower(host->dma[1]);
+        qemu_irq_lower(host->dma_rx_gpio);
     }
 
     if (host->fifo_len < host->ae_level && !host->ddir) {
         if (host->tx_dma) {
             host->status &= 0xf7ff;
-            qemu_irq_raise(host->dma[0]);
+            qemu_irq_raise(host->dma_tx_gpio);
         } else
             host->status |= 0x0800;
     } else {
-        qemu_irq_lower(host->dma[0]);
+        qemu_irq_lower(host->dma_tx_gpio);
         host->status &= 0xf7ff;
     }
 }
@@ -601,12 +602,13 @@ DeviceState *omap_mmc_init(hwaddr base,
     s = OMAP_MMC(dev);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
 
-    s->irq = irq;
-    s->dma = dma;
     s->clk = clk;
 
     memory_region_add_subregion(sysmem, base,
                                 sysbus_mmio_get_region(SYS_BUS_DEVICE(s), 0));
+    qdev_connect_gpio_out_named(dev, "dma-tx", 0, dma[0]);
+    qdev_connect_gpio_out_named(dev, "dma-rx", 0, dma[1]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq);
 
     /* Instantiate the storage */
     s->card = sd_init(blk, false);
@@ -633,6 +635,10 @@ static void omap_mmc_initfn(Object *obj)
 
     memory_region_init_io(&s->iomem, obj, &omap_mmc_ops, s, "omap.mmc", 0x800);
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
+    qdev_init_gpio_out_named(DEVICE(obj), &s->dma_tx_gpio, "dma-tx", 1);
+    qdev_init_gpio_out_named(DEVICE(obj), &s->dma_rx_gpio, "dma-rx", 1);
 }
 
 static void omap_mmc_realize(DeviceState *dev, Error **errp)
-- 
2.34.1

