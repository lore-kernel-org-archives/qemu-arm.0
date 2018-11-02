Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1462966wro;
        Thu, 1 Nov 2018 17:17:30 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cGhUSCbyoVKAeGZO/UC6KFzqY9eiMzVdHONCmm+o3QE06n6fbUblebUaQJYI/4KhBzMI6A
X-Received: by 2002:aed:38c8:: with SMTP id k66-v6mr9165087qte.263.1541117849934;
        Thu, 01 Nov 2018 17:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541117849; cv=none;
        d=google.com; s=arc-20160816;
        b=q9ZKU8mmkS5dlkuNGfvOP7aIOQfEFerX5AKnySpQKgeYG01O3A/qDCBS+Bs7vc1ezP
         CWS0PHnOcwptDHWMkqp6bsjJPERUATdQ+LYvThd/10xVcR8k3yKMcAlUILMfTYqnNeO2
         hiLTkkpfmHpNUnNEKIizT6ubsWdDk4twBqi1pCa70QJH3vWb+TkukEciLyFWB6jeqFwD
         dpQsqH/S2bujEfQnIIXbhJMydiEj4bwjDOA6iX0tJ8HikIqUpb6y+S7dG4rg3mQAIPOd
         NIjjvTDYWwCYMEmtPmIMVs2EySNC+PX8sbeO3wA8vlTPWRtM+aGxEU7ccE6XAOErtvFH
         ++zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=6h5F57hG4l4ss/vh4CZ6wFjB4xYLVvf2pryftJs99V8=;
        b=eiB+ElgMpR6rIFVexzajHfgHEkFdxHPsjzoqdzEqk/iYQnOq+Ih8lmm3O+bjgzha/d
         6jW6jvQWZZ7yiYpki+kp8JX/IvlFJ/YdPWVS5oCd1qmMOoupVrTyBUhzUYGcxBEYlpYx
         TWFM/JCjfgTyVnQLIsJ8czZAjrNoFDi6RrS2kkzcfFMm1aga+98W6TKRRnV8m7ZPVuXk
         BacQfZhX2YXqn5LcxLrovRJ6CLUnDi3WHzjxDG2d+QwrLfYN8ao8suLUH/GXUDvjHe9J
         EZGuyW/OWMbxOnsL8ndC6vshiyenPkiahp8LpMo6Axz8LxUtRyyUSZnaD3HOlDq97GTM
         vIIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oPcBtkC1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a10-v6si858510qkb.196.2018.11.01.17.17.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 17:17:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oPcBtkC1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47680 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIN9V-0003sk-D6
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 20:17:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5d-0000vF-0k
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 20:13:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5b-00055d-MC
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 20:13:28 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5b-00053s-8p; Thu, 01 Nov 2018 20:13:27 -0400
Received: by mail-wr1-x443.google.com with SMTP id y15-v6so217082wru.9;
	Thu, 01 Nov 2018 17:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6h5F57hG4l4ss/vh4CZ6wFjB4xYLVvf2pryftJs99V8=;
	b=oPcBtkC1WalyobDM0RboRX/4XeT9GblwxzDEDFfKKC4lyBGFJza3Ra+yxj+i0mGYF9
	U6q1KyXOoCFNy6aH/xW1CRw0H5oI1VrnMuSCS6ygluo3gU1fD049mJta5aYDcLnuErPN
	WkKnzx7YXlJnGuFtDy+a7AclQ5Y5oWFxLYusi9seJ+HN7o2LkjxASFmpoUB3A3Btr4CL
	Aycj2rRaLCvYgB5asehE4VeNTcxZ1KVGGW8JbmcZUWNDT0XWkkBIk2eH5oTpOk0EPVE8
	02FK2yugFcad92vcWsQykSNKElioVFkNz2o+Hstzz37UWQrjWXfyEsPzawMwCHaf8aMK
	8PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=6h5F57hG4l4ss/vh4CZ6wFjB4xYLVvf2pryftJs99V8=;
	b=Ckjnklf9vnNdXLIJ++Ke9ZcwFm4OaLFQJK9tIok4MynXFPIxGc7u9ycYym/uL/3h3Z
	5NPLU//GyLorRFhyPkQ44TI2sAFd63LaptiNYxjhMoF6QtyCGrVdPf62mdYtcrhIxxsT
	7vtd6xHGAZGcJ80yaM4q2HQSnMXxeCjL242dkyLEC4ZbSy5+LUtuptZRxy1O89sgUbGM
	S78mQXWRhu5dkF+UXPZ3a4510wywpvyXv3KxL4JDthFJU4zLJYUimMbZrS9TrZhfGB52
	F6LkcV4jSg5dn2sEFCVX/Oz8uEF8Us8Dh3n2FbVKTH+owAvLok77bFoa1zitb4G0dKF6
	a9tA==
X-Gm-Message-State: AGRZ1gJzviNgQRev1h3maHHeWGN0SeDoBLw5toBIaykKrHQ8cz8P8TAi
	t4V14V9sal5s/8Kpw5kbEfs=
X-Received: by 2002:adf:c084:: with SMTP id
	d4-v6mr8190551wrf.268.1541117605929; 
	Thu, 01 Nov 2018 17:13:25 -0700 (PDT)
Received: from x1.redhat.com ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	z6-v6sm10539894wrs.19.2018.11.01.17.13.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 17:13:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Date: Fri,  2 Nov 2018 01:13:01 +0100
Message-Id: <20181102001303.32640-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181102001303.32640-1-f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH for 3.2 v2 5/7] hw/arm/bcm2835: Add various
 unimplemented peripherals
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9rISuNqyxnCP

Base addresses and sizes taken from the "BCM2835 ARM Peripherals"
datasheet from February 06 2012:
https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c         | 26 ++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h | 10 ++++++++++
 include/hw/arm/raspi_platform.h      |  2 ++
 3 files changed, 38 insertions(+)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 6d742ffe37..108c058d17 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -21,6 +21,20 @@
 /* Capabilities for SD controller: no DMA, high-speed, default clocks etc. */
 #define BCM2835_SDHC_CAPAREG 0x52134b4
 
+static void create_unimp(BCM2835PeripheralState *ps,
+                         UnimplementedDeviceState *uds,
+                         const char *name, hwaddr ofs, hwaddr size)
+{
+    sysbus_init_child_obj(OBJECT(ps), name, uds,
+                          sizeof(UnimplementedDeviceState),
+                          TYPE_UNIMPLEMENTED_DEVICE);
+    qdev_prop_set_string(DEVICE(uds), "name", name);
+    qdev_prop_set_uint64(DEVICE(uds), "size", size);
+    object_property_set_bool(OBJECT(uds), true, "realized", &error_fatal);
+    memory_region_add_subregion(&ps->peri_mr, ofs,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(uds), 0));
+}
+
 static void bcm2835_peripherals_init(Object *obj)
 {
     BCM2835PeripheralState *s = BCM2835_PERIPHERALS(obj);
@@ -334,6 +348,18 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, err);
         return;
     }
+
+    create_unimp(s, &s->pm, "bcm2835-pm", PM_OFFSET, 0x1000);
+    create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET, 0x1000);
+    create_unimp(s, &s->a2w, "bcm2835-a2w", 0x102000, 0x1000);
+    create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
+    create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
+    create_unimp(s, &s->spi0, "bcm2835-spi0", SPI0_OFFSET, 0x20);
+    create_unimp(s, &s->bscsl, "bcm2835-spis", BSC_SL_OFFSET, 0x100);
+    create_unimp(s, &s->i2c[0], "bcm2835-i2c0", BSC0_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[1], "bcm2835-i2c1", BSC1_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[2], "bcm2835-i2c2", BSC2_OFFSET, 0x20);
+    create_unimp(s, &s->dwc2, "dwc-usb2", USB_OFFSET, 0x100);
 }
 
 static void bcm2835_peripherals_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index f5b193f670..6fb52d20a8 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -23,6 +23,7 @@
 #include "hw/sd/sdhci.h"
 #include "hw/sd/bcm2835_sdhost.h"
 #include "hw/gpio/bcm2835_gpio.h"
+#include "hw/misc/unimp.h"
 
 #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
 #define BCM2835_PERIPHERALS(obj) \
@@ -37,6 +38,9 @@ typedef struct BCM2835PeripheralState {
     MemoryRegion ram_alias[4];
     qemu_irq irq, fiq;
 
+    UnimplementedDeviceState pm;
+    UnimplementedDeviceState cprman;
+    UnimplementedDeviceState a2w;
     SysBusDevice *uart0;
     BCM2835AuxState aux;
     BCM2835FBState fb;
@@ -48,6 +52,12 @@ typedef struct BCM2835PeripheralState {
     SDHCIState sdhci;
     BCM2835SDHostState sdhost;
     BCM2835GpioState gpio;
+    UnimplementedDeviceState i2s;
+    UnimplementedDeviceState spi0;
+    UnimplementedDeviceState i2c[3];
+    UnimplementedDeviceState bscsl;
+    UnimplementedDeviceState smi;
+    UnimplementedDeviceState dwc2;
 } BCM2835PeripheralState;
 
 #endif /* BCM2835_PERIPHERALS_H */
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index 105876dc0b..ec14db236b 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -44,10 +44,12 @@
 #define I2S_OFFSET              0x203000
 #define SPI0_OFFSET             0x204000
 #define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
+#define BSC_SL_OFFSET           0x214000 /* SPI slave */
 #define AUX_OFFSET              0x215000 /* AUX: UART1/SPI1/SPI2 */
 #define EMMC_OFFSET             0x300000
 #define SMI_OFFSET              0x600000
 #define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
+#define BSC2_OFFSET             0x805000 /* BSC2 I2C/TWI */
 #define USB_OFFSET              0x980000 /* DTC_OTG USB controller */
 #define DMA15_OFFSET            0xE05000 /* DMA controller, channel 15 */
 
-- 
2.17.2

