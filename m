Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp184184njb;
        Thu, 30 Jan 2025 10:27:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUZ0X2731zmM8SNoRzypw+R2Vmhlj/ODTSNkGCvxNW3X7MRglfG2kR86rIVjxHRkT52Q4Oto1yPm9NIeA==@linaro.org
X-Google-Smtp-Source: AGHT+IH9hqd3bDHoVKok6BFr3krbIUpsKAFgTque/fhQr55iIRjJZp/lNj6opIkCmIwk6XNv1ztv
X-Received: by 2002:a05:620a:27cf:b0:7af:ce28:a10c with SMTP id af79cd13be357-7bffcccaed6mr1226996585a.12.1738261644284;
        Thu, 30 Jan 2025 10:27:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261644; cv=none;
        d=google.com; s=arc-20240605;
        b=dCfnAf9WC/MkqNaZMUK55YHAQpzquYwlaKb5eVfOSscrdg54OFV3hI5U/JdYSsst7v
         85U6ddi3jD1busLEDURtEu8KigMCT06Hq5CyFWuWUjQfUwiQVInK/xViKXEbYMPMn3DE
         Nl+Jnk1Nfap7bNTVHm+irEWxSrLvDIFySHZMHcxL4iwsdSz7PyMVVkBeB2QBZDAIDH79
         N40f4MVqKgEb1m/GF5T83dzgD7UgGQ2Vy6yQPXzbZ8baCgreCBUELElhuOGQGvFRiNeC
         QERQpdrC+Mc9l73bzFG+RXY20+5hfrHnJhPV3n+MMkDMyoWg9TvwPokxYnUdioP67GUQ
         rWKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=94QBa4qt+xo//a/TAZxbNnQCwPiwQSuLzPc2Zl2fPdo=;
        fh=E3GIAuDOB9D3POf6Uscs5SsSnN6Lv4MTZsLQnddhFqU=;
        b=h9iUrX9cUbtamSe7oa+WzIAnjPejvWofPoKYX2Q9SKNWZKiblUnKtaSHmDUOJZnNzK
         6ZH3Vt6llJDkmdsBXRUIvYiA/jTAdHq9sqZsIZJWeSDt4qLHLIw+8WQr+gYlmwItFgKV
         vl5bkSu6GGyN8uuh9tIFm5IwO1wHjf6S8CUylkO+eDq9RKaBlPfQP49rk+8/pM7qtXSz
         jishNb9rNTq41II6jV//Q0DLBtE0DCuSBfbl1anRYefaF1lOPnWYy2aAFnQTEpe/PeTB
         ChQjul3luLNVRT/RH/iLSLWYYjj3XkhYnGSF/8KPWKQ8NayuID+tWXaxNbQAPdMPNM2R
         ZulA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XBtH51ix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a8c0ee6si214510785a.118.2025.01.30.10.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 10:27:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XBtH51ix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdZFW-0002e0-Sh; Thu, 30 Jan 2025 13:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdZFD-000220-VR
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 13:26:32 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdZF9-0001FS-7G
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 13:26:27 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436a03197b2so8256785e9.2
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 10:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738261579; x=1738866379; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=94QBa4qt+xo//a/TAZxbNnQCwPiwQSuLzPc2Zl2fPdo=;
 b=XBtH51ix7t/gO2fFedpKQso+LwDR+J++z2cSPHGW7/WLsIrhYLaUWIRwbFi8fHq0Pa
 xN4pJDASngTubW5LmReEu+KBqmvZbzoKLjqspRzh7vbQRU3eN1R2hD9qoGamchL8bPwU
 lnspeU/OA48qhTIrbyxLH2UWlBsQ2aUfNDXNUzqhrfdzNEoDN82JJkpscQlSbgMQ+8Jc
 EoWdWNrDlLmRb8ahEcsbNi6I3E2Fm7GiCOloPaMqzgoFwKdgA5FBHjMl3/QwOHwsw2mS
 tSB+TTLQTA6jW4jwAKsoCwQA1YDuyw8F61bLtz+lrFpPW9Bfjj1czr3VP7pTjXV6Ijeg
 4JoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738261579; x=1738866379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=94QBa4qt+xo//a/TAZxbNnQCwPiwQSuLzPc2Zl2fPdo=;
 b=k40jGyuQosJaORPzpRvR8f16cQ0DELoiTck5MHaWorn+p829NNBkhxJo2SXWfPjJXY
 gOYcdobthx5tvLGMHpwu0iYgsO9feboC2fE6ISHNnFYuv0eeEUYs3y/0PIMiZubeCS8L
 bNWs0PiqfBbcR0TVu6W95DNWR5DhiXGExk4TNO6gQN5XElAuCtH7E2gApg+dcz5OdUoO
 RCbM4qAWOxHRtn2gEeiQ3SmzGEL27m0nkv1OkQ7e1HwJHRH2i5lwQ2Lm/fGc+c2twcxm
 vtOmFXVDCMhHh1GpJoUOcyKQSHiignyUNrryM9ZbnUlx0bM4yjApE73WCzmwL0XZX+Ju
 k0pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhJefxYF/Ao63A0lYbvRfi9606K2crhd9JCHUl9jeepexbhmixruQlPOioGSBkOzxLejPCKKjKmw==@nongnu.org
X-Gm-Message-State: AOJu0YxH1AzVJOncQM0IimUXzOkSBQW/zW5HqlL9r5MeWvHgkEkyUQdE
 icCGQ/37jRFFH9ctTtEiMFh0/rgoJ4RUbfz5nwb5bB13u8Pg5RBgK0JJZm5Vs28=
X-Gm-Gg: ASbGnct04JMh/C6ah4tpJbq98A1CkXiubDjYFqf7g//sByXx6Gjdfce3V7GzBSvFNrq
 lkJX7e4PjDJ23gOLTd09SUr7DTz4aB/tSaODbo/9bIUrhrr+3PQ4HH1D0YRgYkCdYJYwkPa+Yev
 nLr4qtuD2Lyeg6L1YuLKnMNiquF1CufGA36Hbbrt18wcA7FoSrcRGBGaI84QXGFPe0XkqCTl1Hp
 iVXvBV0RxEn+SfJANbAqrz6TaGzlqT3rEycgvACHaX4/0Cf0eG2p+NgRP+t7n8C4xKgH6g6VbLD
 hyn/VhH0ksbx7Xmuk2rztRrHmlzF/CIC1HR8Fm97m39aExXLOYCRis2LQD1jOLOFZA==
X-Received: by 2002:a05:600c:4e45:b0:436:6160:5b81 with SMTP id
 5b1f17b1804b1-438dc3c7c5cmr81958365e9.14.1738261579203; 
 Thu, 30 Jan 2025 10:26:19 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc2ede0sm67053955e9.21.2025.01.30.10.26.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 10:26:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/8] hw/arm/xilinx_zynq: Explicit number of GIC external IRQs
Date: Thu, 30 Jan 2025 19:24:38 +0100
Message-ID: <20250130182441.40480-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130182441.40480-1-philmd@linaro.org>
References: <20250130182441.40480-1-philmd@linaro.org>
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
X-TUID: Pn5TdzD1I/0k

When not specified, Cortex-A9MP configures its GIC with 64 external
IRQs (see commit a32134aad89 "arm:make the number of GIC interrupts
configurable"). Add the GIC_EXT_IRQS definition (with a comment)
to make that explicit.

Except explicitly setting a property value to its same implicit
value, there is no logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/xilinx_zynq.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 18051458945..dbb003e906a 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -57,6 +57,14 @@ OBJECT_DECLARE_SIMPLE_TYPE(ZynqMachineState, ZYNQ_MACHINE)
 #define MPCORE_PERIPHBASE 0xF8F00000
 #define ZYNQ_BOARD_MIDR 0x413FC090
 
+/*
+ * The Cortex-A9MP may have anything from 0 to 224 external interrupt
+ * IRQ lines (with another 32 internal). We default to 64+32, which
+ * is the number provided by the Cortex-A9MP test chip in the
+ * Realview PBX-A9 and Versatile Express A9 development boards.
+ */
+#define GIC_EXT_IRQS 64
+
 static const int dma_irqs[8] = {
     46, 47, 48, 49, 72, 73, 74, 75
 };
@@ -205,7 +213,7 @@ static void zynq_init(MachineState *machine)
     MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
     DeviceState *dev, *slcr;
     SysBusDevice *busdev;
-    qemu_irq pic[64];
+    qemu_irq pic[GIC_EXT_IRQS];
     int n;
     unsigned int smp_cpus = machine->smp.cpus;
 
@@ -261,6 +269,7 @@ static void zynq_init(MachineState *machine)
 
     dev = qdev_new(TYPE_A9MPCORE_PRIV);
     qdev_prop_set_uint32(dev, "num-cpu", smp_cpus);
+    qdev_prop_set_uint32(dev, "num-irq", GIC_EXT_IRQS + GIC_INTERNAL);
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, MPCORE_PERIPHBASE);
@@ -275,7 +284,7 @@ static void zynq_init(MachineState *machine)
                            qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
     }
 
-    for (n = 0; n < 64; n++) {
+    for (n = 0; n < GIC_EXT_IRQS; n++) {
         pic[n] = qdev_get_gpio_in(dev, n);
     }
 
-- 
2.47.1

