Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp82429wrm;
        Thu, 17 Oct 2019 15:58:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzLVRLhMW0BDBqreZamVvK+U8RXnqAabGGqKo59VqwCrbFdE8vT435GDVryLaQ3Y1NTQqp/
X-Received: by 2002:aed:3641:: with SMTP id e59mr6761203qtb.115.1571353121729;
        Thu, 17 Oct 2019 15:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571353121; cv=none;
        d=google.com; s=arc-20160816;
        b=RZvI0V60BNOZc6KJILnBqeDHEQTFbfTsH7u/mVLNt7h8STQ7fOt0Jrz/+7swXbUfxF
         w5ZAnqYmw9xN9G7OS16D0eVy136ESqndFyDmH3x4uug4B45UASPh8EiOGExAT98Yy6nf
         /QQiJDPsB6uMEvXvAzCl2v5mn/wCrBLxfoJpgyc9ecErnt8KJiwvwZtYk3/yGAGnWWw+
         Zq3oSbWvkm6nVFQJKAiTNKiOLrd5jWH1wtEhb5qJ5el2YpKoPF/Y7IJ8HfKcZ5tfBrlV
         oYmNm0iBk+U5LrsNl5rrxv/sjF9x+lzQ2uLi7yID/c70BRLNi3V9+0o9k3fHSpb0s6LD
         /7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tcth+JDU+ZzQi6ASbN2YExjNxmTw0uOL6sqXDgsMrm4=;
        b=OuHupq8WqC81mYFYYh+nbWQbYJfF6XjF0TqIQZp095p458T6zM9lr87D7vox8Ip0yH
         UIxn1qV+ZMhFMd2EFyx/RxkiSjX0qASZWKnq8P27txdgTaCQhqLwqEM1czqjPnFbvMKn
         SbcrsZm9CCagvNE8WxXlkRZUOg+HFH32G30c2WoE72Wmf6sSavA0SkDiicaxgRf1o+/v
         5VRhfuuwi/9HYU1TCz3cTGEr/FeCqh8sxpAQRdl7LAAzhxW5pCx/sUUrZfarq0Xiv7iU
         LfyHW/epyQMBNgWW/JUEbtW6lcbHjTmKtbt4TOrpg5iOOa6PfqmuC4TMNb2Y3MZntL8f
         Fbrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dnrccJ+a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13si3403704qkj.165.2019.10.17.15.58.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 15:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dnrccJ+a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLEjA-0000qJ-Kr
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 18:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLEit-0000is-Te
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 18:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLEis-0002RO-OE
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 18:58:23 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45239)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLEiq-0002Pi-7w; Thu, 17 Oct 2019 18:58:20 -0400
Received: by mail-wr1-x444.google.com with SMTP id r5so4105607wrm.12;
 Thu, 17 Oct 2019 15:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tcth+JDU+ZzQi6ASbN2YExjNxmTw0uOL6sqXDgsMrm4=;
 b=dnrccJ+atmGReobUNWXCkrr2NHQh4LOYZ8yz7ISqYGtpB1SwMrNT23tMMHfbbi7xmi
 DXHULJjMsqF1tM6JTe65WwYVtNY319qLIegsRGTTyqiT7X8t4hwA3HZnnirkdijh8BZe
 L2CtVkx2qiTnc5Ad5eAu5Zgc47nWXzdWSjC4dGxhOkTzam2U6Z3x5hVILu365wr/USxa
 eExlnFzcWEU9zWYs9QUtFANzs6ek7FPlYezevriK/jZrTBG7IG7aRoCy0wEhQZZsZ2Yf
 4wtu6sRuMf3YN2gNsm6KXIOoiDP126AOG1OGR//Bke06rbfOBeZhs6u232ydZpt37kh6
 Al5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tcth+JDU+ZzQi6ASbN2YExjNxmTw0uOL6sqXDgsMrm4=;
 b=hAQ5bXdNn1SPN2GwPdFbvYqTQMSHJDw5FSkPHJ11qysTmGnZ2nQDE5Ehtdp/q9zktd
 uwXWiTazD3D3PLTHH0XphTZavVdObZCc7aMWXUx44Bg7U3jgutgmd9a4fWN20JjhyUEe
 6FB/fnEFw1/Qnik7vUzd8asoQoD5M4bzNosnMYFsOn1l377vZvarNhUxcboDnawBpyeb
 u0ndbWiM0gmfGVZqCrtxQDYJb01AQln34ZiF0PSbGCotcWL1WJkPHiAd/+9Xj3TDgtOn
 QCCAUGciMABsrTH/cNjb+3JVbEncEkrC7Ey1oYYbCx+p61h0WGzWvkghq15PWizSPKZV
 hrAA==
X-Gm-Message-State: APjAAAW6z5UWnd9Z+Pi7G9e8UqWTqqbmOHXRdDoCEKtlqwgGG/DVm7Qg
 kctcqMDdpXVO6v40ggFlgI7G9vUv
X-Received: by 2002:adf:c98b:: with SMTP id f11mr5309958wrh.274.1571353098869; 
 Thu, 17 Oct 2019 15:58:18 -0700 (PDT)
Received: from localhost.localdomain (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id m18sm3993873wrg.97.2019.10.17.15.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 15:58:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/10] hw/arm/bcm2836: Make the SoC code modular
Date: Fri, 18 Oct 2019 00:57:55 +0200
Message-Id: <20191017225800.6946-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191017225800.6946-1-f4bug@amsat.org>
References: <20191017225800.6946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Pekka Enberg <penberg@iki.fi>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 Pete Batard <pete@akeo.ie>, Cleber Rosa <crosa@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Clement Deschamps <clement.deschamps@antfield.fr>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ndvOAOh0i9jz

This file creates the BCM2836/BCM2837 blocks.
The biggest differences with the BCM2838 we are going to add, are
the base addresses of the interrupt controller and the peripherals.
Add these addresses in the BCM283XInfo structure to make this
block more modular. Remove the MCORE_OFFSET offset as it is
not useful and rather confusing.

Reviewed-by: Esteban Bosse <estebanbosse@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2836.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 723aef6bf5..019e67b906 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -16,15 +16,11 @@
 #include "hw/arm/raspi_platform.h"
 #include "hw/sysbus.h"
 
-/* Peripheral base address seen by the CPU */
-#define BCM2836_PERI_BASE       0x3F000000
-
-/* "QA7" (Pi2) interrupt controller and mailboxes etc. */
-#define BCM2836_CONTROL_BASE    0x40000000
-
 struct BCM283XInfo {
     const char *name;
     const char *cpu_type;
+    hwaddr peri_base; /* Peripheral base address seen by the CPU */
+    hwaddr ctrl_base; /* Interrupt controller and mailboxes etc. */
     int clusterid;
 };
 
@@ -32,12 +28,16 @@ static const BCM283XInfo bcm283x_socs[] = {
     {
         .name = TYPE_BCM2836,
         .cpu_type = ARM_CPU_TYPE_NAME("cortex-a7"),
+        .peri_base = 0x3f000000,
+        .ctrl_base = 0x40000000,
         .clusterid = 0xf,
     },
 #ifdef TARGET_AARCH64
     {
         .name = TYPE_BCM2837,
         .cpu_type = ARM_CPU_TYPE_NAME("cortex-a53"),
+        .peri_base = 0x3f000000,
+        .ctrl_base = 0x40000000,
         .clusterid = 0x0,
     },
 #endif
@@ -104,7 +104,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
     }
 
     sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->peripherals), 0,
-                            BCM2836_PERI_BASE, 1);
+                            info->peri_base, 1);
 
     /* bcm2836 interrupt controller (and mailboxes, etc.) */
     object_property_set_bool(OBJECT(&s->control), true, "realized", &err);
@@ -113,7 +113,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->control), 0, BCM2836_CONTROL_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->control), 0, info->ctrl_base);
 
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
         qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-irq", 0));
@@ -126,7 +126,7 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
 
         /* set periphbase/CBAR value for CPU-local registers */
         object_property_set_int(OBJECT(&s->cpus[n]),
-                                BCM2836_PERI_BASE + MSYNC_OFFSET,
+                                info->peri_base,
                                 "reset-cbar", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.21.0

