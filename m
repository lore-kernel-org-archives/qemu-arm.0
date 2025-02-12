Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp1089662njb;
        Wed, 12 Feb 2025 07:45:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVSDzyWN61FxL3MDWWet4/TfiZRqF3ZQpxBG+2zaHqIkOto2GyF4Jh7/KhJuJI1TAvrbhUf/qB35jdvzw==@linaro.org
X-Google-Smtp-Source: AGHT+IHsCz0twXBGQ9YVB18laFcSXAcCVnz0tNZPDnZpkKhs5LaLdGd2J5biDeN0HxQ/2uNngy5m
X-Received: by 2002:a05:6122:6599:b0:520:5f0a:b5a5 with SMTP id 71dfb90a1353d-52067c5f140mr3679986e0c.6.1739375108917;
        Wed, 12 Feb 2025 07:45:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739375108; cv=none;
        d=google.com; s=arc-20240605;
        b=khz89QhL1u60OaiFQuxem5PfMQq0VZAgq2NdBlGogHCdpqo3a9U8v5fZSH8hIx1Dy/
         H+uRyYPOXAnp+gU6kFuoFLG11pjI4dQyY5K3XV9ZYNOsyDIJnMYQ9R5A8ddeHvtlx9au
         qpbravaR6PR0XAvrP4R9+/nuKFmY0BuyO92rst/y0hcYXtn2nYxwY7HouOkbxe8vMRPZ
         zaEs+iY1rGeutwpZYI3OkasR0Kvb8GUfdSISw+w+8NCZ+5OKO2kTV7gbuVDAxHnTfaNz
         g/AGURXK753PtiM73SjaxSjY8EhEqV6SXBAzwDNTc5apoAp2mAMAJ20Zl1QPh1mG16Um
         l+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZKFgzzj/z0innOIGEpKf0ZON0tQHn0YVUlggdFE5dm8=;
        fh=dv5c4XLilVTflxpB9rxHdDDn2ynLGMwv/alC/r0SlZA=;
        b=dGD9g+0efcnQzcAvUZE+G8uR5q+PUhsvWGgZSjZbOwzvCPfNejdA3R6lSUWIr3fnWo
         eOHtFYgAZX0NZpbnIZMf5kBFTn38TE7asfrsYELb0ycnpvUrjG/n8uTFJf6tkBkgfkcP
         Z4Zuv7ZG3h2mOC8fbQVGI/4lCDzKwhdu4oHvxtZ9EqxQ1GwSW2fBwantVz2vXfx8qxXt
         BWW/k6xfSRw6r9UcsF/B3k+bP4hGtH43e0jPbhmX+3aBLPbqq8b8nQSn4oVDoNZLEOLh
         7lNIlyD2nOzXk7wr5eV4X5wh9AovWT/XL7yN5PTelI8FOyJBlvvnSWvdQRJ/hRLBVITs
         w5+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=slQiwaCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-868d7e26731si436412241.64.2025.02.12.07.45.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 07:45:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=slQiwaCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiEuK-0004fA-Ib; Wed, 12 Feb 2025 10:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiEuD-0004W4-MT
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 10:44:08 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiEuB-0006wM-UR
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 10:44:05 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38de17a5fc9so2049162f8f.3
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 07:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739375040; x=1739979840; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZKFgzzj/z0innOIGEpKf0ZON0tQHn0YVUlggdFE5dm8=;
 b=slQiwaCWvUdLyJOvJFYQuqL8XKe1FwEDtmCRehtMgUhqVnOJC9dqvNA/J2jsO+q0dF
 uDq1E2u/UfV+lrAg+AElPf27kbc0S+SnXThrLIL2HxI+9t4GdAvOTtvGSmCVRZRP99Dd
 atHw4UuKAMl+kAp89d0XB1bLeFDrFpIYlx3LaVgnxVhxQGI8T4rQ5TTGiHiUZO6NJihZ
 NL99KhCoeqwcgbC8yKwWen5KFOYLiimVlzw/3yT3BylDLghkNyB4QXRmTuOknzaD9HMK
 Q9rhs8a0cVafFRkmkGBogS1grIWCYjuj9bBom6a0sZqalsskdb9SFgJBdDGLKsvaLSYH
 WTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739375040; x=1739979840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZKFgzzj/z0innOIGEpKf0ZON0tQHn0YVUlggdFE5dm8=;
 b=m0myKxD4F6tNXYRVX5pSHFsvcFAjFw7BJY0VxuiIV5z17182VzBaO50a8aE3ahHfzG
 3+gBAIK2oYEPX21/nblNHEitjG4RxQHME1/W4ay3C+Q8LyACHmkWKJW2Kfd4Z27WrQv1
 8LLC5cZnKTd0t2f2D87oaCwLcamIP31mWH3UMIeIkBVOTAxR+2PLm+umPjmk+hkBPwXs
 wrQyiPV9Rg96/8dwdtRCwmpOehdSdYNhWQ9tPBHN1TJWZPvqjaNbKlyOUHEnuajiaH8V
 a9uHE/sySj9sgulwp5Ln+1f76LFgp2v5g0mSgcTOkuNAEGyJcpzVJOYjWoD7yiFBVJWu
 CNYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz8o+4XfCFbGtxRVelWb0Rypv1Xt3GhoUtF6rUGwgHUWa8keNYjW3ZIU8Mb1rhBZ62U6LNObLWAA==@nongnu.org
X-Gm-Message-State: AOJu0YxLs05LsEtekutaVOQG3wGR9imzm9j5vZFb597fK06X5+4m4UvS
 pxBO0FDZHIE6YlOS7GDTN5Q4C5ldxcXfp5zMImxph9ovzcq59DMavAbc6CcKOmI=
X-Gm-Gg: ASbGnct9r+aAWGmh8sTY1x3elcAkVe+Sfge3OYS1dqZBBkdaGWg/qUYLcFdKh04vpA1
 K+gM73TXfQqX/b714TJgDTcWbXbzO6xsS++xdN0W2mY3Tb5x5zwuCIZiu4SetbpycLa8IWvpR50
 COylBzQfC9EMfKz67YB6uLk5KGZdYssjHwQHqEflRkMO/flNr3/VO6iidPiIDhAJNaXvysfNpeN
 vXPKQmu52QnGBFGaSCm/XTmsEEaHr+QAy37z5cb2URPnOTXJF06HrR6o/YAumNWqXnY1HjDLuSd
 vL1odfHyStJuCRRsMKZO7/Cg/tvl1FozNYPR7FCFHg2o7oC/4t2j3Wk/F3dYVRIrWNCRefI=
X-Received: by 2002:a05:6000:d83:b0:38d:a879:4778 with SMTP id
 ffacd0b85a97d-38dea286d93mr3133322f8f.33.1739375040517; 
 Wed, 12 Feb 2025 07:44:00 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04cd53sm23549755e9.6.2025.02.12.07.43.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 07:43:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 5/8] hw/arm/xilinx_zynq: Specify explicitly the GIC has 64
 external IRQs
Date: Wed, 12 Feb 2025 16:43:30 +0100
Message-ID: <20250212154333.28644-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212154333.28644-1-philmd@linaro.org>
References: <20250212154333.28644-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: 0c4fmSBnMtI1

Looking at the Zynq 7000 SoC Technical Reference Manual (UG585 v1.14)
on Appendix A: Register Details, the mpcore Interrupt Controller Type
Register (ICDICTR) has the IT_Lines_Number field read-only with value
0x2, described as:

  IT_Lines_Number

          b00010 = the distributor provides 96 interrupts,
                   64 external interrupt lines.

Add a GIC_EXT_IRQS definition (with a comment) to make the number of
GIC external IRQs explicit.

Except explicitly setting a property value to its same implicit
value, there is no logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/xilinx_zynq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 18051458945..3d7c4f04974 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -57,6 +57,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(ZynqMachineState, ZYNQ_MACHINE)
 #define MPCORE_PERIPHBASE 0xF8F00000
 #define ZYNQ_BOARD_MIDR 0x413FC090
 
+#define GIC_EXT_IRQS 64 /* Zynq 7000 SoC */
+
 static const int dma_irqs[8] = {
     46, 47, 48, 49, 72, 73, 74, 75
 };
@@ -205,7 +207,7 @@ static void zynq_init(MachineState *machine)
     MemoryRegion *ocm_ram = g_new(MemoryRegion, 1);
     DeviceState *dev, *slcr;
     SysBusDevice *busdev;
-    qemu_irq pic[64];
+    qemu_irq pic[GIC_EXT_IRQS];
     int n;
     unsigned int smp_cpus = machine->smp.cpus;
 
@@ -261,6 +263,7 @@ static void zynq_init(MachineState *machine)
 
     dev = qdev_new(TYPE_A9MPCORE_PRIV);
     qdev_prop_set_uint32(dev, "num-cpu", smp_cpus);
+    qdev_prop_set_uint32(dev, "num-irq", GIC_EXT_IRQS + GIC_INTERNAL);
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, MPCORE_PERIPHBASE);
@@ -275,7 +278,7 @@ static void zynq_init(MachineState *machine)
                            qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
     }
 
-    for (n = 0; n < 64; n++) {
+    for (n = 0; n < GIC_EXT_IRQS; n++) {
         pic[n] = qdev_get_gpio_in(dev, n);
     }
 
@@ -458,7 +461,7 @@ static void zynq_machine_class_init(ObjectClass *oc, void *data)
     };
     MachineClass *mc = MACHINE_CLASS(oc);
     ObjectProperty *prop;
-    mc->desc = "Xilinx Zynq Platform Baseboard for Cortex-A9";
+    mc->desc = "Xilinx Zynq 7000 Platform Baseboard for Cortex-A9";
     mc->init = zynq_init;
     mc->max_cpus = ZYNQ_MAX_CPUS;
     mc->no_sdcard = 1;
-- 
2.47.1

