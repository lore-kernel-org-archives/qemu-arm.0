Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2718691wrm;
        Sat, 19 Oct 2019 16:50:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwb1fEBqwCD2buHevEmnhONleT09HBvV/0lb0PGn4ZG1gHoIT3FyhKFOWr1YgkTvFZGvZ3x
X-Received: by 2002:ac8:1670:: with SMTP id x45mr18146075qtk.258.1571529036111;
        Sat, 19 Oct 2019 16:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571529036; cv=none;
        d=google.com; s=arc-20160816;
        b=m72OKNLsLHbC3kSEX4QMAqWSfAxA0nTTTb5NrYXw7wNvNj2qqm3i4sV5DqPGGHQt7X
         zQIM3pg6+cdqPq48MUQBA3zjVboumc24NC5tPk/kKu5axm+NyzvMrTlXl+d1aKfruaag
         lh5Y2KymlEPZcS3WuyCfTErYKLQZdfUttyG7VLVzPpbpyxA0NIEobs+oTmMtXvsCWL++
         kqqy/9BTwRco6hcK6nVAQb87nN+QqqzIQmhYc2toWyYx6XHOHqj52GiEVMQ0+5cSRnf7
         xy2puvKOpFrmgjZoOa62a4jcIQgQynJZ5OhkiWmii/rwcM95WcTy0ps8mt6uz+TZt8s+
         dW4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wn44savEe+flJq53w0kELlQpNWIaC5iY2joSfr7hWdU=;
        b=VTLnDRWNnS60nfENuzBnDIwYILSJpzAgXzzfGzLLitstemUiRnfE0AuljZALwF7vB2
         uJnoayqyC3OK+PcSdFG8g1dBOR6ArP/4hTDEPL2jCVB1yotZlK0sdFZ52gPmrJXgzcaT
         QFJUiHJ1VO3a+FtoYtD5HW+pz0KgL5J6Mzl4LQ/v3l7zIZSYzfuklVG1g0f8KPhJtIrH
         qmdyC/3R0FfT6GEoNUpmtKUG/opnLJJMxucbiEH8zkFr+8OtiafEe8MMEwNoiuL4S3k4
         uWIut52KnhFhx4P61rtY7a7SM56SjayzWqIWgLFw1szjz2NRprKUlCyOIBGMjAYmi22C
         8Qow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vq0ehNod;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t139si10048475qke.16.2019.10.19.16.50.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Oct 2019 16:50:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Vq0ehNod;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLyUV-00041D-1z
	for alex.bennee@linaro.org; Sat, 19 Oct 2019 19:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34478)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRT-0008WL-6h
 for qemu-arm@nongnu.org; Sat, 19 Oct 2019 19:47:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRS-0005WA-0L
 for qemu-arm@nongnu.org; Sat, 19 Oct 2019 19:47:27 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43269)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRP-0005UP-A5; Sat, 19 Oct 2019 19:47:23 -0400
Received: by mail-wr1-x442.google.com with SMTP id c2so4631759wrr.10;
 Sat, 19 Oct 2019 16:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wn44savEe+flJq53w0kELlQpNWIaC5iY2joSfr7hWdU=;
 b=Vq0ehNodVoXsgEM/spizDirdXvdkrXdrYCzSjFnr4uOcFaeoi4UsQklaiYWw/kUKgl
 oaHBg6WmbbN80oKW/i2a/K6vZbRQ5C6PQ5sgiHeJwdwyY8JyrBorcLqrTw0Cj1dnhnGS
 0s7sQVPsLxdjUWHJkNWe3W56ENSPFYi9VwhGWstWAeYxQuk7GEyonHBCWyZ/24okr/z0
 sTUKDzk7QJzh6/jBthvTiz3YoIiqppS3bAAIb/migbxvEYGpKYG/LSLMMs8r513KiWwN
 zMYcZfoqn5Prt3PhSIrreim/UcdnQmA1PtMT3Q8tuC+u+4Lr4esNa9QgiR56wwzBHvzl
 /CRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wn44savEe+flJq53w0kELlQpNWIaC5iY2joSfr7hWdU=;
 b=rnrkdn3hXdZ5oxq47iWpyHLOpci4FsE9A9tH707QoqmpvOwlv63GNf3GH9s5cB9LBk
 XwtWAhL1yGqnv8f+UflWVa6pwx71nC2ju80bP4Gah+jhFNsh9mb1UB7cciJVE+4a4lLd
 +0rkJrR56NAE2ioQjWOGiK/7jXafgueArNNByVLzQyYUuKtCSGp3gRhhRb1+RBzPIcLS
 pfE6j7e6seqiicTVGLWKS6ebgpUXejRVuIzIJ7tZGPmqyJXodYlRagG7P3kwY7SQarlK
 2Rnk6BGfoCwmB//pHd0xKGvcJ6spTy5WQvI6W0bzZpAlHHDhdL9jDG8SD6nd2iqrgaPI
 K9bg==
X-Gm-Message-State: APjAAAVS/sN6/khPK3NOgQtfhqN2Lu4yZiUCJFBdGaCjCUswkf3p5BGH
 ZYTn4Ga7MO9ZyQ2e4YmukzTe46Gm
X-Received: by 2002:adf:e488:: with SMTP id i8mr13368169wrm.302.1571528842174; 
 Sat, 19 Oct 2019 16:47:22 -0700 (PDT)
Received: from x1w.redhat.com (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id u1sm10433763wrp.56.2019.10.19.16.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 16:47:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/16] hw/arm/bcm2835_peripherals: Use the thermal sensor
 block
Date: Sun, 20 Oct 2019 01:47:01 +0200
Message-Id: <20191019234715.25750-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019234715.25750-1-f4bug@amsat.org>
References: <20191019234715.25750-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Matthias Brugger <mbrugger@suse.com>, Rob Herring <robh@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Pete Batard <pete@akeo.ie>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CgGMKKwL1sgS

Map the thermal sensor in the BCM2835 block.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c         | 13 +++++++++++++
 include/hw/arm/bcm2835_peripherals.h |  2 ++
 include/hw/arm/raspi_platform.h      |  1 +
 3 files changed, 16 insertions(+)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index fdcf616c56..70bf927a02 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -111,6 +111,10 @@ static void bcm2835_peripherals_init(Object *obj)
     object_property_add_const_link(OBJECT(&s->dma), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr), &error_abort);
 
+    /* Thermal */
+    sysbus_init_child_obj(obj, "thermal", &s->thermal, sizeof(s->thermal),
+                          TYPE_BCM2835_THERMAL);
+
     /* GPIO */
     sysbus_init_child_obj(obj, "gpio", &s->gpio, sizeof(s->gpio),
                           TYPE_BCM2835_GPIO);
@@ -321,6 +325,15 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
                                                   INTERRUPT_DMA0 + n));
     }
 
+    /* THERMAL */
+    object_property_set_bool(OBJECT(&s->thermal), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(&s->peri_mr, THERMAL_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->thermal), 0));
+
     /* GPIO */
     object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
     if (err) {
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index 62a4c7b559..be7ad9b499 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -20,6 +20,7 @@
 #include "hw/misc/bcm2835_property.h"
 #include "hw/misc/bcm2835_rng.h"
 #include "hw/misc/bcm2835_mbox.h"
+#include "hw/misc/bcm2835_thermal.h"
 #include "hw/sd/sdhci.h"
 #include "hw/sd/bcm2835_sdhost.h"
 #include "hw/gpio/bcm2835_gpio.h"
@@ -53,6 +54,7 @@ typedef struct BCM2835PeripheralState {
     SDHCIState sdhci;
     BCM2835SDHostState sdhost;
     BCM2835GpioState gpio;
+    Bcm2835ThermalState thermal;
     UnimplementedDeviceState i2s;
     UnimplementedDeviceState spi[1];
     UnimplementedDeviceState i2c[3];
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index cdcbca943f..61b04a1bd4 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -48,6 +48,7 @@
 #define SPI0_OFFSET             0x204000
 #define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
 #define OTP_OFFSET              0x20f000
+#define THERMAL_OFFSET          0x212000
 #define BSC_SL_OFFSET           0x214000 /* SPI slave */
 #define AUX_OFFSET              0x215000 /* AUX: UART1/SPI1/SPI2 */
 #define EMMC1_OFFSET            0x300000
-- 
2.21.0

