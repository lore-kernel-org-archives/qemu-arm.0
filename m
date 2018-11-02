Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1460043wro;
        Thu, 1 Nov 2018 17:13:51 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dguaI/Q/CiQxMXK4J664XE05dvcHGSHrrSXWmVZHhP8mTl4R4bUV2Shvy5uacTppAtQcvb
X-Received: by 2002:a37:2f87:: with SMTP id v129-v6mr8726278qkh.342.1541117631595;
        Thu, 01 Nov 2018 17:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541117631; cv=none;
        d=google.com; s=arc-20160816;
        b=Bw/1Hj2yGEvKiGIDHb4LVzp85M3p+65rJm84xsuHzSYfuNUTSDyg6T37hsXOIGnyqA
         tvt3UuAOoiQAFor6/vUQD7SuAmutdfLEXmXJ1FYxz/sOCB975IopVCiVcLturPj0M/Qj
         pSoJrYSiHDnftwQQyREbQL/AfU9FjIF0q3+90b34bmr5dvNRDKfafqFfJ2xI07f3iKZA
         sMFMl24zADH+bTOrEoIV7kejU2fnAk6rjo1kNHrI9X/AvIgHqOUGxBFnegcYYEghjllt
         epY4l40jw50wW9ikigd12Z9QUhfwmJ3jz6C13tfp4NqrqZshoW2sz6rsnve05LWrOqWV
         k0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=jptOgypxnHPUyadZ/A+zoqijFj8p+it2NGZN8FWvCJ4=;
        b=RRC5Ep/Nx3P/DWC/v+0KIlUGernGMkJfaLv817J0TKxiCWaSpCB+36eRgUbf2pWGPL
         c8MHRedAiTDYYUdLB5SpSkXMFYp2JbHeWhojmRoLLJeSliJSbQtsW/CijLdti3L4hzUh
         PNMikpia88LHz1vMKxxIJ0JUQoykWJCjzcYludDxFX5M4TWMrfB1vqcwiAYAJxIk2jyC
         vKb2BgXU16yybpxdKIFM7L4GrSL6N9oLMqzCNr6XLOCrCHUg4KMXKmhLz6TZJYAgQees
         9UpyypPLbIWWXP+/IJYi1k+BgxtBiGoznaw2s7zea5BeWAHudDpI9DfpM+QOfmpgdcOs
         cTyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vDjFzCfj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v11si3176395qvj.128.2018.11.01.17.13.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 17:13:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vDjFzCfj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIN5z-0001Fa-2Y
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 20:13:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5e-0000zi-5C
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 20:13:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5d-00057X-CU
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 20:13:30 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37078)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5a-00052l-GG; Thu, 01 Nov 2018 20:13:27 -0400
Received: by mail-wr1-x444.google.com with SMTP id z3-v6so239857wru.4;
	Thu, 01 Nov 2018 17:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jptOgypxnHPUyadZ/A+zoqijFj8p+it2NGZN8FWvCJ4=;
	b=vDjFzCfj/smhj1vJikv+ffPZks6tlOXFtK15iK/9+sxjQSy0UALlFZaDjKP7QiVGZK
	9prOU84NmTG3hO1z0NgzqZ4etHU/n4VJNLQJLS8j33ataFLv2HCJAHOAAd3SxusFbAw3
	ytTsPaiGQwqDbq9qxsOxaBnp5aPxAbGXoP4RqvmFtvuNCQpWa325MHIt+B3qc7MGxuKm
	UMCQagwg9aFBSwS/Trrc3dLzdWcsq5kPzaN7tzGVUmkEQ72zDDWumVRtdl5G8Relvp0g
	oglZq7kPyJW/JG3D9MzRcORM41AR1ID8vLj1LTDGgeBnp658bvqyEsv5pf3cmDjVHF6v
	6WvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jptOgypxnHPUyadZ/A+zoqijFj8p+it2NGZN8FWvCJ4=;
	b=qyiVdRev+liGpHoGVUA6tvIzgP4WSU6rde+xV+XbSSzrzyjnm1t9d9aRkLt6BGzELN
	tcWzgJejrLU4kEJ0KsCwk6+nt0XehIj2Li3MCXyEjsdkbjwLatBqnft7TrXqJxIc5TeC
	XeU94T6UUQ6ok6nC25P659b94ArFU0Y8lrmN3yqNgFV061lNI2cUVHfo8yUvUx2djjmP
	EFVvGNqWnf3fC+ErOEGj5y+yATCMmQk5Be3ePTUH1cMK8n6C8avEYbF8g18HYN3c6NZU
	pUHn0yxPd562oDssOz5JeqJHlTR/nbovs6UXN96Vju3V75wFfi+/Sfo+dmVGq1jukBtz
	jZ6w==
X-Gm-Message-State: AGRZ1gK7OGx6Tgt8d7NLZ/lHcZPA5Kz65nxCRI9tfDYF8Ub2mmnQWhwm
	6ObkuhF6nhGz7jDFi4W+qlY=
X-Received: by 2002:adf:ea82:: with SMTP id
	s2-v6mr1463579wrm.180.1541117604692; 
	Thu, 01 Nov 2018 17:13:24 -0700 (PDT)
Received: from x1.redhat.com ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	z6-v6sm10539894wrs.19.2018.11.01.17.13.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 17:13:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Date: Fri,  2 Nov 2018 01:13:00 +0100
Message-Id: <20181102001303.32640-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181102001303.32640-1-f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH for 3.2 v2 4/7] hw/arm/bcm2835: Rename some
 definitions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VAcyJqvDvuU2

The UART1 is part of the AUX peripheral,
the PCM_CLOCK (yet unimplemented) is part of the CPRMAN.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c    | 2 +-
 include/hw/arm/raspi_platform.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 6be7660e8c..6d742ffe37 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -187,7 +187,7 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    memory_region_add_subregion(&s->peri_mr, UART1_OFFSET,
+    memory_region_add_subregion(&s->peri_mr, AUX_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->aux), 0));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->aux), 0,
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index 6467e88ae6..105876dc0b 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -36,7 +36,7 @@
                                                       * Doorbells & Mailboxes */
 #define PM_OFFSET               0x100000 /* Power Management, Reset controller
                                           * and Watchdog registers */
-#define PCM_CLOCK_OFFSET        0x101098
+#define CPRMAN_OFFSET           0x101000
 #define RNG_OFFSET              0x104000
 #define GPIO_OFFSET             0x200000
 #define UART0_OFFSET            0x201000
@@ -44,7 +44,7 @@
 #define I2S_OFFSET              0x203000
 #define SPI0_OFFSET             0x204000
 #define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
-#define UART1_OFFSET            0x215000
+#define AUX_OFFSET              0x215000 /* AUX: UART1/SPI1/SPI2 */
 #define EMMC_OFFSET             0x300000
 #define SMI_OFFSET              0x600000
 #define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
-- 
2.17.2

