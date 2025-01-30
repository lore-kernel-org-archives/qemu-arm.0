Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp183894njb;
        Thu, 30 Jan 2025 10:26:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsnDam3CKapdF22/ZfCc5BD9ZmCq0u8xOoiPEEBNmIrIW2TLS4h70Ym7Dm7t1UPs82naHX88ldUf5OeA==@linaro.org
X-Google-Smtp-Source: AGHT+IHxK5GPXW7xiniiP9W4v2nfC8V13x+IA3LnemiPyq/pVc/DSBWqXtZ283iEp3Ux4KSHM+17
X-Received: by 2002:a05:620a:1901:b0:7b6:cfab:987b with SMTP id af79cd13be357-7bffcce86ecmr1111660785a.14.1738261609491;
        Thu, 30 Jan 2025 10:26:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261609; cv=none;
        d=google.com; s=arc-20240605;
        b=Z3SLM0c2WivNK4zvMVd4awSZ2/TuLD7UlYpWJMD3ggv0xrWghLhfMNwhDVLD405WIb
         FhLCh7mRLklYfj2l3hE2u2YY7CYvxWB1iyHMwwYpkg5XGonXPeGyOkO25QhW2PkAwn+7
         Z1/hWtc+PF6eaOfW+eD2O4zKPPkvKwpig0KcUCuPcZXYZcp82HawVl3umfDI4bQWWmRp
         TTi++H6nPL6j9odl0+GNBANWSAyCL2SUW3wZJmpCp7QPAqIzaPNiNNZ8fmNOfZ/7jEu3
         VIhduiRYqrjei2CnyJS8PuUTQRuQQ5AzlbW1ittuA8CvAS+Bfp0CkGxgf7hnZlPgJe8h
         lR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vZk0oTGxDURxLqCpPV0Zd69bGvF/XaBnOTd5i1RlcsU=;
        fh=kY6n+bL5zEvHYlCtsECzqKLcWKIwsypSB0pE4XgGOGk=;
        b=AO7UZxwIlVpM48WvQzDTGm2tU6N36/D93fUI7KSM4YgLDSyw35w6ssuiSnUh7rVW4j
         so8cm6okcNmr3FLMMSzE+EwFTvOWuEgKgNDDambsTF9SJ4UhCjkTjE6XuEEZnc3r+lHS
         hQwGYdpDRYgIQy45jFszLkhehKGw5qnba4f4F/NpuYvb0LeN37P9iYWAJplGnvjGF/6l
         msVMs/M3U4dTpNxHk2o1OgQLyJrk/ysl7WUCZijPTu4ad0heDYXPf9lXUbrHLA9dF+f9
         T48v+nyBd2rLhExka4c3CNAMRflOqhfFIxAq5tiFmwHTSYBGcANDPcuG4aHWTWf+M65o
         eI6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D2ttSnEm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a9038c9si206273985a.247.2025.01.30.10.26.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 10:26:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D2ttSnEm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdZEw-0001TP-7T; Thu, 30 Jan 2025 13:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdZEW-0001J2-MC
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 13:25:46 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdZEU-00017R-CK
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 13:25:43 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38a88ba968aso1026587f8f.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 10:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738261541; x=1738866341; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZk0oTGxDURxLqCpPV0Zd69bGvF/XaBnOTd5i1RlcsU=;
 b=D2ttSnEmww329jc93cCX7Loc3QveFlpRjHa49/XByX5SKh5Aa8ydJXM9anAxKPNEdT
 hKOz+JVXlkddkGpV2OwUx7a/iiUnt6KT4jgOfsIGxQeitAbqVCtSYgng4m8EH7GaqdkF
 odTzSA8Sy5bfebp7VjlL3WIm2kT4cpsk7YtGpKRoFu1UPRK4pHkmPRrnBAhgeOfL+blg
 uynTuvjQLx+wxHFmskadigoEfcgxKAoF9VOebAD+fUpHk2cLK7TKv9FKJD3dYxplCJvt
 tsqEBL0OjQIsP0PlsKOR/4A9uRUTR8Ul5T1vLawhxSjBoJTXj+dhOzTQyEclpfHwA+xE
 PP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738261541; x=1738866341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZk0oTGxDURxLqCpPV0Zd69bGvF/XaBnOTd5i1RlcsU=;
 b=LrHaCnP76QXZy/hhuE9ZGQAMXKiCO0Vv2+38YTp1DYyRqKqLuORu11lcoUAKwoEyZT
 L532dlpeysy078Zmk06rUMKHlVWq2jzleoz8a7unJK3IwWSb5hJ7Tpq5iwViMsWOiQtv
 TMw8HzWps+ctY1Vw4StO9lF2jJ1A203NeSnChsOwj3m/YH+zPblxDgz9mvQ0hEFFU7mj
 aXbS3ufSqGBfoHafvCbnl9MwrlFyO9sw3pSYRWPhLBqQ92pUCloljYn05cJOZf6BF0XP
 zTeNpNiGV4Cel394cYFq+uLQZ5R3bxB8NKVHvUVsYqtDk+ZAVHefvwd+VD//WwLDN7YW
 g0Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ4nHKi/pKXwSyKKNuIbWALOlqpr9w5iOUHoaHsuzRvfjuEAZ60SbOv8VE5IEdcc9dR2Hlgzt/Qw==@nongnu.org
X-Gm-Message-State: AOJu0YyyI911JhVqqpw+Rcd0T6CsOopQsd8u3SA9ni0atlWCgtGoaogW
 T5JLohIwVySi6vx/uVbaNt9Pkaz+9sztRsJHq6U8i5VodMU4SN1936vF+wGG9is=
X-Gm-Gg: ASbGncvH3tpFFbLSgMrs/YSBSP9Al8abfdSBx47vLZCHWp8clFYY7NMDiS86tD5YUtw
 c/4N7nQ0uEFlsowdt5KHt6yFYBaJarXjaJ3gPFXt0UHKi+glcgDim/nvM0JrcT5mYgGZS25KD9A
 xzAJJepWdViLhn1bzWJ0Eb+T9hCVZo7PvhdTxYCRQUvZ2SN4muTGZF0hdVkMrm2sYgJbrtjFkgZ
 nqZYSZxRLE42vyuaenC8ALJEAJ+kVOOJtmv8ycHkotzgtdgKRafMO55MFtg9u+RX4ZRo5cesOpb
 0Vc5d0/xcmtdcev+8xEcStjC/HzwIoDnc/fUYHhql8l0zqzdfJ4+mpZFffBP6J48rg==
X-Received: by 2002:a5d:4f90:0:b0:385:ee3f:5cbf with SMTP id
 ffacd0b85a97d-38c519526edmr6505846f8f.20.1738261540837; 
 Thu, 30 Jan 2025 10:25:40 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b5780sm2721855f8f.67.2025.01.30.10.25.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 10:25:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/8] hw/arm/exynos4210: Explicit number of GIC external IRQs
Date: Thu, 30 Jan 2025 19:24:35 +0100
Message-ID: <20250130182441.40480-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130182441.40480-1-philmd@linaro.org>
References: <20250130182441.40480-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: 6bSG7sg832ZV

When not specified, Cortex-A9MP configures its GIC with 64 external
IRQs (see commit a32134aad89 "arm:make the number of GIC interrupts
configurable"). Add the GIC_EXT_IRQS definition (with a comment)
to make that explicit.

Except explicitly setting a property value to its same implicit
value, there is no logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/exynos4210.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 99b05a175d6..75d6e4d1ab9 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -103,6 +103,14 @@
 #define EXYNOS4210_PL330_BASE1_ADDR         0x12690000
 #define EXYNOS4210_PL330_BASE2_ADDR         0x12850000
 
+/*
+ * The Cortex-A9MP may have anything from 0 to 224 external interrupt
+ * IRQ lines (with another 32 internal). We default to 64+32, which
+ * is the number provided by the Cortex-A9MP test chip in the
+ * Realview PBX-A9 and Versatile Express A9 development boards.
+ */
+#define GIC_EXT_IRQS 64
+
 enum ExtGicId {
     EXT_GIC_ID_MDMA_LCD0 = 66,
     EXT_GIC_ID_PDMA0,
@@ -588,6 +596,8 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
 
     /* Private memory region and Internal GIC */
     qdev_prop_set_uint32(DEVICE(&s->a9mpcore), "num-cpu", EXYNOS4210_NCPUS);
+    qdev_prop_set_uint32(DEVICE(&s->a9mpcore), "num-irq",
+                         GIC_EXT_IRQS + GIC_INTERNAL);
     busdev = SYS_BUS_DEVICE(&s->a9mpcore);
     sysbus_realize(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_SMP_PRIVATE_BASE_ADDR);
-- 
2.47.1

