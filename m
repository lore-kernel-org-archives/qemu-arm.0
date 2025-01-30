Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp184306njb;
        Thu, 30 Jan 2025 10:27:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXbycvarXnVWUVoa9GKqcg1pxLColwnsLrgRfXSH7ZISlpNvgDoRlfcLanP+L2G0oDewIjV9DvTbk3NmQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHUOJ6HtPGW4hsw+W0SpXNDVoPdJarqN2xSjxItSfHHwgBL0nFaIpzyOpxsMTQnWcvC7bYV
X-Received: by 2002:ac8:5d13:0:b0:46c:72b7:2f12 with SMTP id d75a77b69052e-46fd0bc85a0mr130682421cf.48.1738261659693;
        Thu, 30 Jan 2025 10:27:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261659; cv=none;
        d=google.com; s=arc-20240605;
        b=XZuCxnE8pj7QU1K4v24RL9LIcg8hu1p2Irowp+SnhY+fvy5f3rnmibRQusqUZaYOsi
         p8vHdFGGtcz/BYm40Nc9jlMLLgliRSHvmjscc7IrRTPtM3NRWtZuiONm0bmVpHKsRWDi
         B2Prt+EwKCgOIWYmh96rar0DM55VFM3qqGf0x3JDBCEv1dOWruDSGtIxUr7RqKiIatNX
         JG07FCy9BmfyG+jEWwsNCpeMW2l7IQvc/I/vZ/t6MTfqCTfTukTx7YSa7uSNlTAILzen
         L3k5F/JbCvybbGoRuE6sxkuwkWAn7rxAsgh3sN/whtLsTvNkmgL9v5drjZ6QaWmenn96
         DJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=riA4zmJH/fUcpHKgfppzYaaXrF+oAl0RGRsil+s6hSg=;
        fh=IYZQSLL68rM4sp4uVZclfBnr29ftsYSMlLInvT05RoI=;
        b=lOCYJ/q434f6xNoCAdIrUPQeP6VCflkqXt9SJQQkSk29060rkLasZtHNSM3eOcrKO4
         tWHT8/OPjoUkq6zDksSsQNKeI6aV+kIDZw7qtYguWWzYZP/J7Dks7m4m58Jh+E60q7jx
         c5TQGqRr9b8KlQ12EL2zHDwnTRZgkCLzAKyiHc91aefZkMhMLtU9cywBCEUK+whAuAmw
         MlwqO3V+2Tr5m+754v/zYE6RAH5qN4kBaIynNW9Bt4xkS7p0U/46iVaaQpn1W07yLtHm
         3cQqdFiezH8Q9LqgOamjj4WjKdJHFHRGb9zxWhZwYWotM9OV78Z5Kr6znEb22SwNLox5
         BxQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R0WXohcB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1b9af6si20667991cf.222.2025.01.30.10.27.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 10:27:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R0WXohcB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdZFb-000374-3J; Thu, 30 Jan 2025 13:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdZFX-0002pR-QS
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 13:26:48 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdZFV-0001L8-Dy
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 13:26:47 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-38be3bfb045so1625626f8f.0
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 10:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738261603; x=1738866403; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=riA4zmJH/fUcpHKgfppzYaaXrF+oAl0RGRsil+s6hSg=;
 b=R0WXohcBKGEHuRnfVw1FuPbzgBfcMlkkKvP/qOe54Lj99Xl7JoygCzU9kuKMMC3LPL
 p01E2/S7alwfEfkQyfq2huxSRFUoe8sP5UZRlaO4TnzF/8zptEu7vgLIhXVyLtEOYqlf
 J3zgcuFs6tlXr9oSpCvDiPFMV0BNNepVWg71hux4vlXDR08SR4vw0X/TwrziJxyNy2Pn
 xSc32Ig94j7aLUgnKY/y9VJDp4PCwa5A6/FfQwRVyjIODKKry/mKMwRWL+/RJLSpvysn
 MCG1cgvOTg+SQOU4Evg0sI8hQoj6/NBVAZ5FLf3+8ks9jdmswvK1kscP9Em5U1HZIDTV
 95cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738261603; x=1738866403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=riA4zmJH/fUcpHKgfppzYaaXrF+oAl0RGRsil+s6hSg=;
 b=qhrzLumU1Rm4r8Cgd+5D8oiSuUwnXsk1DS9bJ1Tv2LJp9JNb1zu2AcvwMATkuslo8q
 N0ztEDciFvsR0Z02Lvc8V7Anu72rwKBXw22vYYdUQHHm7yBQae1oPokXaAKefKFfrXzr
 mIJXn2K2Kf8/FUvTaWcdtRASDCk1ZhXL7gLRnRS7/tyrhAyaOaLvu6W/OgMiUMv1EDNh
 i7moVWoHHxBo9D0RIgrXJOPm7cYECBvl2q9IVYuUlAD1pykDXHJpQC1UEJzOaJG0DF1m
 hobZjKQeqGA7vquPKfij0OC12UG37rZifuSRTHeTFZeBhd/Lto5msknyUk9m8IGHDmE0
 mHgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFgsDrFwJirebxp81uCCYEWICclTxL9+hN+zpbaQc+LifMr0yx5+FztKfXh0Ub3QKQ5vXMtNrgqQ==@nongnu.org
X-Gm-Message-State: AOJu0YwYEoCO8Zg9Kf3VE9400MdrSuHp9dci2Hdt7t7t+Nmb0u86L/3K
 0rHPiS30yiNq5toUwXeyFYgxlZjNxLz7Psf6/fDPHinGhFIeFmgR67pcUXFjMQI=
X-Gm-Gg: ASbGncvtI8EUMAOVUqukwgEaji8WkDnDA+IYpw9V1PK9v4uHOuTQr9XBXSvI/4IATfp
 F2uGgIEAGzQvp5pYjM4RHeKQ0aXEdvvIjo6J8JCQopH8wslCO+8sDKla7dJBuWv/pD+6JiYe1Ex
 8Wz0qmlX/0VG/d8QkJi9RuCpoeMg3JU9xHm1SreruYhGyVWR4DByuazuoYBBoT32RXnv7SwIfZ4
 SJTuNvj2i13BIh9S8F+2Ccqmuh4zVeVnpkHw8wsahFtGEuoSZqKrjP6wvjtgWxtGizhqGUh19cn
 ha9cS/XS+/7xmUlW7JJ0f/251KlvXBlIss5fSgGiMXc709wdwyrRDIH0XDFMb44O1Q==
X-Received: by 2002:a05:6000:1a8f:b0:386:3afc:14a7 with SMTP id
 ffacd0b85a97d-38c60f1654emr420718f8f.7.1738261602664; 
 Thu, 30 Jan 2025 10:26:42 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc26d05sm66624965e9.12.2025.01.30.10.26.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 10:26:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/8] hw/arm/vexpress: Explicit number of GIC external IRQs
Date: Thu, 30 Jan 2025 19:24:39 +0100
Message-ID: <20250130182441.40480-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130182441.40480-1-philmd@linaro.org>
References: <20250130182441.40480-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: 1rTVPexc7Tca

When not specified, Cortex-A9MP configures its GIC with 64 external
IRQs, (see commit a32134aad89 "arm:make the number of GIC interrupts
configurable"), and Cortex-15MP to 128 (see commit  528622421eb
"hw/cpu/a15mpcore: Correct default value for num-irq").
The Versatile Express board however expects a fixed set of 64
interrupts (see the fixed IRQ length when this board was added in
commit 2055283bcc8 ("hw/vexpress: Add model of ARM Versatile Express
board"). Add the GIC_EXT_IRQS definition (with a comment) to make
that explicit.

Except explicitly setting a property value to its same implicit
value, there is no logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/vexpress.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 42c67034061..8e801aa79cb 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -51,6 +51,14 @@
 #define VEXPRESS_FLASH_SIZE (64 * 1024 * 1024)
 #define VEXPRESS_FLASH_SECT_SIZE (256 * 1024)
 
+/*
+ * The Cortex-A9MP/A15MP may have anything from 0 to 224 external interrupt
+ * IRQ lines (with another 32 internal). We default to 64+32, which
+ * is the number provided by the Cortex-A9MP test chip in the
+ * Realview PBX-A9 and Versatile Express A9 development boards.
+ */
+#define GIC_EXT_IRQS 64
+
 /* Number of virtio transports to create (0..8; limited by
  * number of available IRQ lines).
  */
@@ -241,6 +249,7 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
      */
     dev = qdev_new(privdev);
     qdev_prop_set_uint32(dev, "num-cpu", smp_cpus);
+    qdev_prop_set_uint32(dev, "num-irq", GIC_EXT_IRQS + GIC_INTERNAL);
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, periphbase);
@@ -251,7 +260,7 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
      * external interrupts starting from 32 (because there
      * are internal interrupts 0..31).
      */
-    for (n = 0; n < 64; n++) {
+    for (n = 0; n < GIC_EXT_IRQS; n++) {
         pic[n] = qdev_get_gpio_in(dev, n);
     }
 
@@ -543,7 +552,7 @@ static void vexpress_common_init(MachineState *machine)
     VexpressMachineClass *vmc = VEXPRESS_MACHINE_GET_CLASS(machine);
     VEDBoardInfo *daughterboard = vmc->daughterboard;
     DeviceState *dev, *sysctl, *pl041;
-    qemu_irq pic[64];
+    qemu_irq pic[GIC_EXT_IRQS];
     uint32_t sys_id;
     DriveInfo *dinfo;
     PFlashCFI01 *pflash0;
-- 
2.47.1

