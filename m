Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp1089158njb;
        Wed, 12 Feb 2025 07:44:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUdhCoSfxid2GbnHCDzZDBiVUA25kSoQpiDhZk8jGXoGytGaurJvuGT9PPvGP9+wT9PYs+mpKkwss3WEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF9CMebWaAN/XX/LiAxj4kweDb+KSe03l/fzJ238Ymsyai7Gwb1PaY9TLuof3bt8JTFvDzs
X-Received: by 2002:a05:6122:17a2:b0:520:56ee:78e2 with SMTP id 71dfb90a1353d-520690257e4mr2254981e0c.5.1739375056041;
        Wed, 12 Feb 2025 07:44:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739375056; cv=none;
        d=google.com; s=arc-20240605;
        b=lEFi8xrCSRA5e5WHTu09ogaagi8hOGkWZu06GwSnPJojAm/7UNbMu37QOZhv1DpONW
         llQQF+nA4aExsB/lCqKjFMc4gOYRPnIJN7o3UMZ7hWtUicOL2+S6ajgnqrhgQoL4nWoM
         tg2kl3xVYIxMUpO/0Oj8Jcb32479hsfWiCjwkO/cIGzJ9GorofB/OSu60cEU3Ww2dwxX
         Wkrt1oq+Lfoh6bpDbANS3yAnob83E4vJ/IZfHwma38dZWPvoNMFV17/ImDR5WhBZOVlt
         9lm5KgVH8Yr717P5ZFn0dn47IdHRbZtxG9fXxp+2VIBOaUKzp3Lkr3AQA+482s7WsVFQ
         VILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UKvpyBheJZs4xo26Id8y6y+sGte9Qefez9+pLdOdy9I=;
        fh=1l8v0Wx1tQB+kL8RjAI+AgvdReW1ZPAFzy9HE28xutI=;
        b=LcPzqXfIuNSH60kgSqoP/OBBbXLWlFwUM7Fkj0zJmzaMEOJyiQaxpax24DNHVSk5zs
         hhud9wAJuToDnfcK6hk1fKygVkdYryhXxYKF4zNvY74a+UYzDpA4MJCx04Gbyy6yFlui
         Yxac6ZnUbhRmH2WNaMFN06KtlpIbHPjYXZDC6K8+CdlXTfrz7gfplxA1XCSQQgTuwfs0
         ulZkvNJhdWtB7tvH1aFF5T7lneKO+yhVdznajIiohKjSRfrmhx1FygVV0q5zKHOlrnY0
         ak9MRIVnLfKdIBM90oQ3g0PXuM3O5yVxj0X4a1IT+t1butaWLNODfLwqQWcvRXPoguL9
         dyaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ialgzR/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51fcdda8535si1661950e0c.201.2025.02.12.07.44.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 07:44:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ialgzR/Z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiEuD-0004Sx-9p; Wed, 12 Feb 2025 10:44:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiEu1-0004Re-Pm
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 10:43:53 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiEu0-0006u8-2y
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 10:43:53 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4395817a7f2so7663085e9.1
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 07:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739375030; x=1739979830; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UKvpyBheJZs4xo26Id8y6y+sGte9Qefez9+pLdOdy9I=;
 b=ialgzR/Zcd6TcnLT0ox+tvRECh+rmymBU541eZ628aUPhx+0db8oOrsB684bLuvmtG
 kMbNuPgJ0Qhlca2ldcjL97+P+NcoRU1GwTPSckbi0UzexADUAPtxJvo0qbT4AxoPQisg
 rzvv+KJP3AafKYHca1LqtiYATlDyiBoUKAhai/z4tHua1ZV5bMf4/APF4ZM5A43uhPTU
 9LeG4zc+kpR3SGD6ObsunyWkJznWun38iXUpnQe8Zsh4g9D9SBQqhw+fXXqOiyaXJaq/
 9DsGXGxxC4ImHSKtEbMuT5DIVnQHAmXTsbUgX9pcbjNJ4/Tz//1CXVeYcUOOjff9smWg
 yR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739375030; x=1739979830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UKvpyBheJZs4xo26Id8y6y+sGte9Qefez9+pLdOdy9I=;
 b=IxPXxG+1WiAbuLZsL0r65t6v0p/CEH8VsRVqdMOjIpfgsw/eMZf33Q3SmfRAGIqiCV
 cMHeauB88hkwJg7VwtaGVad3BE1JLKsf87D7Vpy5bsw90vah9vs+8E3oND6yURmXgljQ
 re9cYB5y26Y1hjEuPzm20+U/sadKceAM9cW7+sEPEYm3yiCr68Yj1cajih/OJlzRX390
 1RypJpq4qqCibRZdlJj6iJ57/H5b95Q2LcX0L/bWd+dBcdYNoVtAjaFlM8zYb/tE8zWt
 XQiggAvhZAeWJnWkcdpZOcpZwtiycxlya/7KX+XsLS16ji4qh+wt/DIqKzIe1kfABYWb
 rUuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTaHnIJeVXor8k7sDuQjA2Zvt0FGg7XOE340mQfO0XRwFH23Z6s7RjJ1Ujw+OxSZ3JONKr9dY4Yw==@nongnu.org
X-Gm-Message-State: AOJu0Yyox6gANqZlYBLcdgr3ZM8BQcZx8jKQLTauzYoXRpzi9NxmBodF
 tLJOJWCM37Bkl3AP9vHXPHVvRkKsnEDr+0KoupKRfKKHQhLyXb3jEmFzdAOOpEY=
X-Gm-Gg: ASbGncuhsQVbsZTWuHeSU4sz/l750GaIj5hrGfQCAMDI7wgD1Xr/+ocDubB3rDCgnkf
 QjBKtK4p4swx3Yq4fqf+qubHJv3xf1Q7kKde8MIXKt90s6KyIuoUpS9cfkJvDRoTBrAK2Nf+iLY
 rj6zbuZrJERoqubl7h4ckdIhOCYvCD71qq3DkZTc/jj0QwHdYzYCzvT3vUXcN+PtviPGT8jIfnG
 ve/Q1AUHAHwfhYEvwjg0g00j3TWfAEMZh64z36dZ1e3rg3ttq0gAxT5RG+kr+NZ1ZXiLrHxScTu
 o9bmzXR9A0raOBME3vrN+BVPTw0JPkIGFD7MeSNFZdhxDAu/jCVshUTcV79jy9oUoHi01/M=
X-Received: by 2002:a05:6000:4014:b0:38d:e092:3ced with SMTP id
 ffacd0b85a97d-38dea251738mr2972459f8f.7.1739375030528; 
 Wed, 12 Feb 2025 07:43:50 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd9c48173sm10137892f8f.37.2025.02.12.07.43.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 07:43:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/8] hw/arm/realview: Specify explicitly the GIC has 64
 external IRQs
Date: Wed, 12 Feb 2025 16:43:28 +0100
Message-ID: <20250212154333.28644-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212154333.28644-1-philmd@linaro.org>
References: <20250212154333.28644-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: AOFVJnlG+N3F

When not specified, Cortex-A9MP configures its GIC with 64 external
IRQs (see commit a32134aad89 "arm:make the number of GIC interrupts
configurable"). Add the GIC_EXT_IRQS definition (with a comment)
to make that explicit.

Except explicitly setting a property value to its same implicit
value, there is no logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/realview.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 9900a98f3b8..e50f687227c 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -35,6 +35,8 @@
 #define SMP_BOOT_ADDR 0xe0000000
 #define SMP_BOOTREG_ADDR 0x10000030
 
+#define GIC_EXT_IRQS 64 /* Realview PBX-A9 development board */
+
 /* Board init.  */
 
 static struct arm_boot_info realview_binfo = {
@@ -185,7 +187,12 @@ static void realview_init(MachineState *machine,
     sysbus_mmio_map(SYS_BUS_DEVICE(sysctl), 0, 0x10000000);
 
     if (is_mpcore) {
-        dev = qdev_new(is_pb ? TYPE_A9MPCORE_PRIV : "realview_mpcore");
+        if (is_pb) {
+            dev = qdev_new(TYPE_A9MPCORE_PRIV);
+            qdev_prop_set_uint32(dev, "num-irq", GIC_EXT_IRQS + GIC_INTERNAL);
+        } else {
+            dev = qdev_new("realview_mpcore");
+        }
         qdev_prop_set_uint32(dev, "num-cpu", smp_cpus);
         busdev = SYS_BUS_DEVICE(dev);
         sysbus_realize_and_unref(busdev, &error_fatal);
@@ -201,7 +208,7 @@ static void realview_init(MachineState *machine,
         /* For now just create the nIRQ GIC, and ignore the others.  */
         dev = sysbus_create_simple(TYPE_REALVIEW_GIC, gic_addr, cpu_irq[0]);
     }
-    for (n = 0; n < 64; n++) {
+    for (n = 0; n < GIC_EXT_IRQS; n++) {
         pic[n] = qdev_get_gpio_in(dev, n);
     }
 
-- 
2.47.1

