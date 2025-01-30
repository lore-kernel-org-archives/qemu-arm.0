Received: by 2002:a17:504:3e04:b0:1be9:327d:8ee3 with SMTP id i4csp220278njl;
        Thu, 30 Jan 2025 03:27:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWXGCriFCIrAOIDqcQsfCMlK5noPt4c8YrZhv442luNzuy17c+9O0iasYUR5SsahYUDGZOndPPFsMEKfA==@linaro.org
X-Google-Smtp-Source: AGHT+IE9quUyLVtWbPOX/CJua4UjK5Rui/atx8tWij0oEFFO9pf0Y88KWwsUSFjAFag8FuPJ6l+u
X-Received: by 2002:a05:620a:2710:b0:7b6:ebc6:181a with SMTP id af79cd13be357-7bffcd9997amr1112649685a.41.1738236436087;
        Thu, 30 Jan 2025 03:27:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738236436; cv=none;
        d=google.com; s=arc-20240605;
        b=DeqUdHJFy+EDWpSJiLRuLBoQpj5iBZfRy2FQYnOaL6haXxKN83TOmyByuEXjrFEM53
         7TqJvnJ3mRTfetxfWBIP5Bej8ME6/PcsoMfzOBGEcLvog7Tm6DbxkrywF9paUIg1ENVW
         AZzmpAZq90naIqvlwDRBM+Et4cO/5Gm5YG9t7EMuG5WoVKGt6W5SaA2qOkN087CEPIkr
         5NJ76B6F4gLFI2u5EYTZ4yAWmAF5RpAn5bOTIznGeGiwgMGCJCgRlFle1ZGcywIJ3crK
         Mlv6DkCxOJkYeDvvqHUCMaxyzcJSEardF2JxdWabCY1oQO+Ih/pZUv1x1XxzmVlXSK1c
         vuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BMrvsV6YgWPBIsyDxMy+6e6ZqNU6ujpKBkumGUjGbfo=;
        fh=wXYnM2Xe6CLi/jjNhqKsBwYc7XquNHKu73845APGzhA=;
        b=eIfWbZIihOlFOUFCjUY9VfwxINPMgRWEGe7RYcoIFlI2OgsKWeDQqRfxxbb9/lwd/6
         8N6wu4SifUK3fUD/ys0WYuf29XKxVYgIPgl+OhDpp3S7Nb6aFVZC2MjTboh5XRcTBvWi
         4OHP6G+w/KhQ/wPmwmwp7X7zML5nmFVZKhRzqm56nMaljYJEc26TPXmHyfLfbzyDSk54
         WUZImtmQDgmiek3nuiDjPEx9u/vsWvamNU1xn26vQX7ZPkjiHx/rOOhWP3lF2+u6jNPg
         SdCZ8hF826al5U2SRMEEzOspBhpJLu0RUwJoLPlfdTRnVu+qoHYjAdooLc5tm/BUVHGI
         0/gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C8F58iJ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c00a8d63b4si145392085a.143.2025.01.30.03.27.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 03:27:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C8F58iJ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdSgw-0001VW-8g; Thu, 30 Jan 2025 06:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdSgt-0001To-4z
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 06:26:36 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdSgr-0001iM-AB
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 06:26:34 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3863703258fso1120739f8f.1
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 03:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738236392; x=1738841192; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BMrvsV6YgWPBIsyDxMy+6e6ZqNU6ujpKBkumGUjGbfo=;
 b=C8F58iJ+JLVHoKWVOHLKC7S8SNSNX1urb7E8GJhX60tHJDWwl4vq4vB3CebNlsHQnx
 M+EEsS/A+LnAm3hoThbkXgT5A2DT+iC2/nUtqz04/LnnewvVKbE7iDcasllwjRmgapwg
 2Htlea/K5lDNg7BLrRbsyv9xvSPM6HvacV/LyirP8zhf4hVrwpbVxwelc5gH+Cl155Wi
 XcRpZXmGdJ6YOZc5Jz741uh3DLBkwkCX/k2oOBeMIWVVX7fcNR/TODUZpl6JOfKHk1YX
 OVPf+/Qu478V/xKxz/rL+wWIQDzePqr5Bkt6nLE/Q41YysccZ68L/1pQIVycSiiLVqps
 6RbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738236392; x=1738841192;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMrvsV6YgWPBIsyDxMy+6e6ZqNU6ujpKBkumGUjGbfo=;
 b=kFfBlVV2detIAdWgK5WkylxiUmPi0Nj5LbG+1AeUwFt5/fR+nxMoiJh98WmZeaNbow
 WS3zIVL+CmrwRd/AlWC6B2oGRuGyrsRM8qoKzP3gV5hiVPb9+S3sd45fVM95CIsC/7QQ
 zKya1Bodl9t62dLhNIYH9pEUONA+WtqOdlz1EQ3QkH6fg6np1xJ2YtS+ulOjZEb4fb4j
 HGhuQET2ESkJ1FX4WLEwoO7GHMWbxde+FD68mzUNoKirJT5qGUP9YO9+VA5kjRrol/3A
 wJukQRLx8juWaowHlxfYSPBL0h848kPt9+KRDYMvI2Bk2tYUVyWG7ZUXxN152uyhSz7u
 KEpA==
X-Gm-Message-State: AOJu0Yx/7V8xzLoVV15Mtjdd35fRM7olLKSNG7BZOdf9D523MEilbsFS
 C4+RXgtEpTY0Ku1q2b7zEizJDi4806p2BonG5q4hhTqDAwHU4QPxuiIqwWi202g=
X-Gm-Gg: ASbGncvBLm9NT31PUFdfCeL1eibT3SRamNCt5mkstOHP2l68MubQSbuY916+qmRE0lN
 X8p9R/Os3/bdKWENpJWUu5trOnKfPMSl6xvpnEverje1apt0jLtbCnMrJc5tCqDcFRWLHNphq4V
 Rr1oGibBIHP9TIS07B6qRJKgK8ObFMIbjNn5DSDdY6dh3hxOFmXAiz4bRqkT0czz6gF1ftSpieF
 xTf11wobacfpFkKf30359z5Ww4/fPEz4V/gBFuYSsHNV+Sg1wFDOb8ecHA3v3mVq4B/mR5eccan
 kJZ9PNBmax8c72VLR1v5EKE/B50VwDIQoM5weCSt+Bf2C4EFFeRz6PmYm+YAeWDe0w==
X-Received: by 2002:a5d:4311:0:b0:38b:ee01:ae2 with SMTP id
 ffacd0b85a97d-38c5a96bbcemr1691798f8f.10.1738236391831; 
 Thu, 30 Jan 2025 03:26:31 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23d443esm20516545e9.1.2025.01.30.03.26.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Jan 2025 03:26:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 3/6] hw/arm/fsl-imx6ul: Add local 'mpcore/gic' variables
Date: Thu, 30 Jan 2025 12:26:12 +0100
Message-ID: <20250130112615.3219-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250130112615.3219-1-philmd@linaro.org>
References: <20250130112615.3219-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: fr5hFmEG2yuc

The A7MPCore forward the IRQs from its internal GIC.
To make the code clearer, add the 'mpcore' and 'gic'
variables. Rename 'd' variable as 'cpu'.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx6ul.c | 64 +++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 37 deletions(-)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 79e4847953a..34c4aa15cd0 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -157,10 +157,12 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     FslIMX6ULState *s = FSL_IMX6UL(dev);
+    DeviceState *mpcore = DEVICE(&s->a7mpcore);
     int i;
     char name[NAME_SIZE];
-    SysBusDevice *sbd;
-    DeviceState *d;
+    DeviceState *gic;
+    SysBusDevice *gicsbd;
+    DeviceState *cpu;
 
     if (ms->smp.cpus > 1) {
         error_setg(errp, "%s: Only a single CPU is supported (%d requested)",
@@ -173,19 +175,19 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
     /*
      * A7MPCORE
      */
-    object_property_set_int(OBJECT(&s->a7mpcore), "num-cpu", 1, &error_abort);
-    object_property_set_int(OBJECT(&s->a7mpcore), "num-irq",
+    object_property_set_int(OBJECT(mpcore), "num-cpu", 1, &error_abort);
+    object_property_set_int(OBJECT(mpcore), "num-irq",
                             FSL_IMX6UL_MAX_IRQ + GIC_INTERNAL, &error_abort);
-    sysbus_realize(SYS_BUS_DEVICE(&s->a7mpcore), &error_abort);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, FSL_IMX6UL_A7MPCORE_ADDR);
+    sysbus_realize(SYS_BUS_DEVICE(mpcore), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(mpcore), 0, FSL_IMX6UL_A7MPCORE_ADDR);
 
-    sbd = SYS_BUS_DEVICE(&s->a7mpcore);
-    d = DEVICE(&s->cpu);
-
-    sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(d, ARM_CPU_IRQ));
-    sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(d, ARM_CPU_FIQ));
-    sysbus_connect_irq(sbd, 2, qdev_get_gpio_in(d, ARM_CPU_VIRQ));
-    sysbus_connect_irq(sbd, 3, qdev_get_gpio_in(d, ARM_CPU_VFIQ));
+    gic = mpcore;
+    gicsbd = SYS_BUS_DEVICE(gic);
+    cpu = DEVICE(&s->cpu);
+    sysbus_connect_irq(gicsbd, 0, qdev_get_gpio_in(cpu, ARM_CPU_IRQ));
+    sysbus_connect_irq(gicsbd, 1, qdev_get_gpio_in(cpu, ARM_CPU_FIQ));
+    sysbus_connect_irq(gicsbd, 2, qdev_get_gpio_in(cpu, ARM_CPU_VIRQ));
+    sysbus_connect_irq(gicsbd, 3, qdev_get_gpio_in(cpu, ARM_CPU_VFIQ));
 
     /*
      * A7MPCORE DAP
@@ -244,8 +246,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                         FSL_IMX6UL_GPTn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_GPTn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_GPTn_IRQ[i]));
     }
 
     /*
@@ -269,8 +270,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                         FSL_IMX6UL_EPITn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->epit[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_EPITn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_EPITn_IRQ[i]));
     }
 
     /*
@@ -307,12 +307,10 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                         FSL_IMX6UL_GPIOn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_GPIOn_LOW_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_GPIOn_LOW_IRQ[i]));
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 1,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_GPIOn_HIGH_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_GPIOn_HIGH_IRQ[i]));
     }
 
     /*
@@ -366,8 +364,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                         FSL_IMX6UL_SPIn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_SPIn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_SPIn_IRQ[i]));
     }
 
     /*
@@ -392,8 +389,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c[i]), 0, FSL_IMX6UL_I2Cn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_I2Cn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_I2Cn_IRQ[i]));
     }
 
     /*
@@ -430,8 +426,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                         FSL_IMX6UL_UARTn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_UARTn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_UARTn_IRQ[i]));
     }
 
     /*
@@ -480,12 +475,10 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                         FSL_IMX6UL_ENETn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->eth[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_ENETn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_ENETn_IRQ[i]));
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->eth[i]), 1,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_ENETn_TIMER_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_ENETn_TIMER_IRQ[i]));
     }
 
     /*
@@ -521,8 +514,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0,
                         FSL_IMX6UL_USB02_USBn_ADDR[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_USBn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_USBn_IRQ[i]));
     }
 
     /*
@@ -547,8 +539,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                         FSL_IMX6UL_USDHCn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->usdhc[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_USDHCn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_USDHCn_IRQ[i]));
     }
 
     /*
@@ -580,8 +571,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
                         FSL_IMX6UL_WDOGn_ADDR[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_WDOGn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_WDOGn_IRQ[i]));
     }
 
     /*
-- 
2.47.1

