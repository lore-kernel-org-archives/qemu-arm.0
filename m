Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h1sm14528381wmb.7.2021.10.04.06.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 06:47:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 62DEA1FF9B;
	Mon,  4 Oct 2021 14:47:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	f4bug@amsat.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Subject: [PATCH  v1 4/7] hw/arm/bcm2835_peripherals: Map various BCM2711 blocks
Date: Mon,  4 Oct 2021 14:47:38 +0100
Message-Id: <20211004134742.2044280-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004134742.2044280-1-alex.bennee@linaro.org>
References: <20211004134742.2044280-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: G/pjR41HxODg

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The BCM2711 provides more peripherals. Add them as 'unimplemented' so
we can track when/how firmware and kernel access them.

Based on various sources:

* U-boot: https://github.com/raspberrypi/firmware/tree/next/boot

  - arch/arm/dts/bcm283x.dtsi
  - arch/arm/dts/bcm2838.dtsi
  - arch/arm/dts/bcm2838-rpi-4-b.dts

* Arnd Bergmann analysis: https://www.cnx-software.com/2019/06/24/raspberry-pi-4-features-broadcom-bcm2711-processor-up-to-4gb-ram/#comment-563948

* Linux: https://patchwork.kernel.org/patch/11053097/

  - arch/arm/boot/dts/bcm283x.dtsi
  - arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
  - arch/arm/boot/dts/bcm2711.dtsi
  - arch/arm/boot/dts/bcm2711-rpi-4-b.dts

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[AJB: merge fixes, drop dwc2 unimp]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
TODO: At least use proper pl011[2] and pl011[3]
vAJB:
  - fixed merge conflict on re-base
  - rename to BCM2711
  - drop dwc2 unimp (as it is now imp)
---
 include/hw/arm/bcm2835_peripherals.h |  9 ++++++---
 include/hw/arm/raspi_platform.h      | 14 ++++++++++++++
 hw/arm/bcm2835_peripherals.c         | 24 +++++++++++++++++++-----
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index d864879421..8f7f23712a 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -52,6 +52,7 @@ struct BCM2835PeripheralState {
     BCM2835PowerMgtState powermgt;
     BCM2835CprmanState cprman;
     PL011State uart0;
+    UnimplementedDeviceState uartu[6];
     BCM2835AuxState aux;
     BCM2835FBState fb;
     BCM2835DMAState dma;
@@ -63,16 +64,18 @@ struct BCM2835PeripheralState {
     BCM2835SDHostState sdhost;
     BCM2835GpioState gpio;
     Bcm2835ThermalState thermal;
+    DWC2State dwc2;
     UnimplementedDeviceState i2s;
-    UnimplementedDeviceState spi[1];
-    UnimplementedDeviceState i2c[3];
+    UnimplementedDeviceState spi[7];
+    UnimplementedDeviceState i2c[7];
     UnimplementedDeviceState otp;
     UnimplementedDeviceState dbus;
     UnimplementedDeviceState ave0;
     UnimplementedDeviceState v3d;
     UnimplementedDeviceState bscsl;
     UnimplementedDeviceState smi;
-    DWC2State dwc2;
+    UnimplementedDeviceState xhci;
+    UnimplementedDeviceState argon;
     UnimplementedDeviceState sdramc;
 };
 
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index e0e6c8ce94..7b6393542a 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -51,10 +51,22 @@
 #define RNG_OFFSET              0x104000
 #define GPIO_OFFSET             0x200000
 #define UART0_OFFSET            0x201000 /* PL011 */
+#define UART2_OFFSET            0x201400 /* PL011 */
+#define UART3_OFFSET            0x201600 /* PL011 */
+#define UART4_OFFSET            0x201800 /* PL011 */
+#define UART5_OFFSET            0x201a00 /* PL011 */
 #define MMCI0_OFFSET            0x202000 /* Legacy MMC */
 #define I2S_OFFSET              0x203000 /* PCM */
 #define SPI0_OFFSET             0x204000 /* SPI master */
+#define SPI3_OFFSET             0x204600
+#define SPI4_OFFSET             0x204800
+#define SPI5_OFFSET             0x204a00
+#define SPI6_OFFSET             0x204c00
 #define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
+#define BSC3_OFFSET             0x205600
+#define BSC4_OFFSET             0x205800
+#define BSC5_OFFSET             0x205a00
+#define BSC6_OFFSET             0x205c00
 #define PIXV0_OFFSET            0x206000
 #define PIXV1_OFFSET            0x207000
 #define DPI_OFFSET              0x208000
@@ -86,6 +98,8 @@
 #define DBUS_OFFSET             0x900000
 #define AVE0_OFFSET             0x910000
 #define USB_OTG_OFFSET          0x980000 /* DTC_OTG USB controller */
+#define USB_XHCI_OFFSET         0x9c0000 /* generic-xhci controller */
+#define ARGON_OFFSET            0xb00000
 #define V3D_OFFSET              0xc00000
 #define SDRAMC_OFFSET           0xe00000
 #define L2CC_OFFSET             0xe01000 /* Level 2 Cache controller */
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 46852bc8a6..3856c7d267 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -388,15 +388,29 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
     create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
     create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
-    create_unimp(s, &s->spi[0], "bcm2835-spi0", SPI0_OFFSET, 0x20);
+    create_unimp(s, &s->uartu[2], "!pl011[2]", UART2_OFFSET, 0x100);
+    create_unimp(s, &s->uartu[3], "!pl011[3]", UART3_OFFSET, 0x100);
+    create_unimp(s, &s->uartu[4], "!pl011[4]", UART4_OFFSET, 0x100);
+    create_unimp(s, &s->uartu[5], "!pl011[5]", UART5_OFFSET, 0x100);
+    create_unimp(s, &s->spi[0], "bcm2835-spi[0]", SPI0_OFFSET, 0x20);
+    create_unimp(s, &s->spi[3], "bcm2835-spi[3]", SPI3_OFFSET, 0x20);
+    create_unimp(s, &s->spi[4], "bcm2835-spi[4]", SPI4_OFFSET, 0x20);
+    create_unimp(s, &s->spi[5], "bcm2835-spi[5]", SPI5_OFFSET, 0x20);
+    create_unimp(s, &s->spi[6], "bcm2835-spi[6]", SPI6_OFFSET, 0x20);
     create_unimp(s, &s->bscsl, "bcm2835-spis", BSC_SL_OFFSET, 0x100);
-    create_unimp(s, &s->i2c[0], "bcm2835-i2c0", BSC0_OFFSET, 0x20);
-    create_unimp(s, &s->i2c[1], "bcm2835-i2c1", BSC1_OFFSET, 0x20);
-    create_unimp(s, &s->i2c[2], "bcm2835-i2c2", BSC2_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[0], "bcm2835-i2c[0]", BSC0_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[1], "bcm2835-i2c[1]", BSC1_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[2], "bcm2835-i2c[2]", BSC2_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[3], "bcm2835-i2c[3]", BSC3_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[4], "bcm2835-i2c[4]", BSC4_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[5], "bcm2835-i2c[5]", BSC5_OFFSET, 0x20);
+    create_unimp(s, &s->i2c[6], "bcm2835-i2c[6]", BSC6_OFFSET, 0x20);
     create_unimp(s, &s->otp, "bcm2835-otp", OTP_OFFSET, 0x80);
     create_unimp(s, &s->dbus, "bcm2835-dbus", DBUS_OFFSET, 0x8000);
     create_unimp(s, &s->ave0, "bcm2835-ave0", AVE0_OFFSET, 0x8000);
-    create_unimp(s, &s->v3d, "bcm2835-v3d", V3D_OFFSET, 0x1000);
+    create_unimp(s, &s->xhci, "bcm2838-xhci", USB_XHCI_OFFSET, 0x100000);
+    create_unimp(s, &s->argon, "bcm2838-argon", ARGON_OFFSET, 4 * 0x10000);
+    create_unimp(s, &s->v3d, "bcm2835-v3d", V3D_OFFSET, 0x10000);
     create_unimp(s, &s->sdramc, "bcm2835-sdramc", SDRAMC_OFFSET, 0x100);
 }
 
-- 
2.30.2
