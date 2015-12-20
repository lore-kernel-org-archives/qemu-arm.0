Received: by 10.182.158.201 with SMTP id ww9csp2039879obb;
        Sat, 19 Dec 2015 21:46:58 -0800 (PST)
X-Received: by 10.140.32.194 with SMTP id h60mr16342772qgh.79.1450590418861;
        Sat, 19 Dec 2015 21:46:58 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i83si24252774qhc.5.2015.12.19.21.46.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 21:46:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAWpe-0003CT-Kc
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 00:46:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAWmx-000787-ES
	for qemu-devel@nongnu.org; Sun, 20 Dec 2015 00:44:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAWmt-0000ci-E5
	for qemu-devel@nongnu.org; Sun, 20 Dec 2015 00:44:11 -0500
Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232]:32815)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAWmt-0000ce-6X; Sun, 20 Dec 2015 00:44:07 -0500
Received: by mail-pa0-x232.google.com with SMTP id cy9so125767pac.0;
	Sat, 19 Dec 2015 21:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=SroGH2xmSBNfOytMNl7jkiyleb7QcY3fJoY6Hc8+iLs=;
	b=LiyUXLPPZcH6uEWsk3W5SylElGiX++h4GR+8+y1iyrqApqblwf9FEHbMbPp1EDpo94
	GoDk8M1JP/3yHjX3WAi1dvF0BHTLvCCHC8Vvam7CT2TdBMRFpc6bff6beuz4QsfamL+1
	Z8+DLz4ECScp1PhnKar4IhbkU9Aj7SR1REifwdpAcNnx/Z7xqrpVxv0OJlPycOFtFkzF
	0uLrcliYWYOaDkovBB9Nci1pqfI/FpYR1DdfReVeaj2mHRu9PwFS5LL9Gfi/x04Gbtnq
	ogLWi0wKW0R8dK7sctSkjZMizBgdKseNioOQPVA9yZVxezYjCEVlEe0ZA8tOrM6zlJ29
	bLaQ==
X-Received: by 10.66.150.228 with SMTP id ul4mr17734436pab.15.1450590246696;
	Sat, 19 Dec 2015 21:44:06 -0800 (PST)
Received: from localhost.localdomain
	(c211-31-14-155.rochd5.qld.optusnet.com.au. [211.31.14.155])
	by smtp.gmail.com with ESMTPSA id c27sm894550pfd.50.2015.12.19.21.44.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 21:44:05 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 19 Dec 2015 21:43:35 -0800
Message-Id: <410a2ae2aa807d7b35c3025a018732b14518056b.1450570397.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450570397.git.crosthwaite.peter@gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1450570397.git.crosthwaite.peter@gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::232
Cc: peter.maydell@linaro.org, crosthwaite.peter@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, alistair.francis@xilinx.com
Subject: [Qemu-devel] [PATCH v6 3/6] ssi: Move ssi.h into a separate
	directory
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uBZjdzDi7t3x

From: Alistair Francis <alistair.francis@xilinx.com>

Move the ssi.h include file into the ssi directory.

While touching the code also fix the typdef lines as
checkpatch complains.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 hw/arm/pxa2xx.c                     |  2 +-
 hw/arm/spitz.c                      |  2 +-
 hw/arm/stellaris.c                  |  2 +-
 hw/arm/strongarm.c                  |  2 +-
 hw/arm/tosa.c                       |  2 +-
 hw/arm/xilinx_zynq.c                |  2 +-
 hw/arm/z2.c                         |  2 +-
 hw/block/m25p80.c                   |  2 +-
 hw/display/ads7846.c                |  2 +-
 hw/display/ssd0323.c                |  2 +-
 hw/microblaze/petalogix_ml605_mmu.c |  2 +-
 hw/misc/max111x.c                   |  2 +-
 hw/sd/ssi-sd.c                      |  2 +-
 hw/ssi/pl022.c                      |  2 +-
 hw/ssi/ssi.c                        |  2 +-
 hw/ssi/xilinx_spi.c                 |  2 +-
 hw/ssi/xilinx_spips.c               |  2 +-
 include/hw/{ => ssi}/ssi.h          | 10 ++++++----
 18 files changed, 23 insertions(+), 21 deletions(-)
 rename include/hw/{ => ssi}/ssi.h (96%)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 79d22d9..54bf152 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -12,7 +12,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/char/serial.h"
 #include "hw/i2c/i2c.h"
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 #include "sysemu/char.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 8d3cc0b..ee8f889 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -16,7 +16,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/pcmcia.h"
 #include "hw/i2c/i2c.h"
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 #include "hw/block/flash.h"
 #include "qemu/timer.h"
 #include "hw/devices.h"
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 0114e0a..4e5cfd1 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -8,7 +8,7 @@
  */
 
 #include "hw/sysbus.h"
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 #include "hw/arm/arm.h"
 #include "hw/devices.h"
 #include "qemu/timer.h"
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 9624ecb..4d2ba02 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -34,7 +34,7 @@
 #include "hw/arm/arm.h"
 #include "sysemu/char.h"
 #include "sysemu/sysemu.h"
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 
 //#define DEBUG
 
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 02814d7..68ad01e 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -19,7 +19,7 @@
 #include "hw/pcmcia.h"
 #include "hw/boards.h"
 #include "hw/i2c/i2c.h"
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 #include "sysemu/block-backend.h"
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 1c1a445..11a349b 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -25,7 +25,7 @@
 #include "sysemu/block-backend.h"
 #include "hw/loader.h"
 #include "hw/misc/zynq-xadc.h"
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 #include "qemu/error-report.h"
 
 #define NUM_SPI_FLASHES 4
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index b44eb76..c82fe2c 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -16,7 +16,7 @@
 #include "hw/arm/arm.h"
 #include "hw/devices.h"
 #include "hw/i2c/i2c.h"
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 #include "hw/boards.h"
 #include "sysemu/sysemu.h"
 #include "hw/block/flash.h"
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 7b9f97c..addd907 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -24,7 +24,7 @@
 #include "hw/hw.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 
 #ifndef M25P80_ERR_DEBUG
 #define M25P80_ERR_DEBUG 0
diff --git a/hw/display/ads7846.c b/hw/display/ads7846.c
index 3f35369..cb82317 100644
--- a/hw/display/ads7846.c
+++ b/hw/display/ads7846.c
@@ -10,7 +10,7 @@
  * GNU GPL, version 2 or (at your option) any later version.
  */
 
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 #include "ui/console.h"
 
 typedef struct {
diff --git a/hw/display/ssd0323.c b/hw/display/ssd0323.c
index 9727007..7545da8 100644
--- a/hw/display/ssd0323.c
+++ b/hw/display/ssd0323.c
@@ -10,7 +10,7 @@
 /* The controller can support a variety of different displays, but we only
    implement one.  Most of the commends relating to brightness and geometry
    setup are ignored. */
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 #include "ui/console.h"
 
 //#define DEBUG_SSD0323 1
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 462060f..5366cec 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -35,7 +35,7 @@
 #include "sysemu/block-backend.h"
 #include "hw/char/serial.h"
 #include "exec/address-spaces.h"
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 
 #include "boot.h"
 
diff --git a/hw/misc/max111x.c b/hw/misc/max111x.c
index bef3651..d619d61 100644
--- a/hw/misc/max111x.c
+++ b/hw/misc/max111x.c
@@ -10,7 +10,7 @@
  * GNU GPL, version 2 or (at your option) any later version.
  */
 
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 
 typedef struct {
     SSISlave parent_obj;
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index c49ff62..eeb96b9 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -12,7 +12,7 @@
 
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 #include "hw/sd/sd.h"
 
 //#define DEBUG_SSI_SD 1
diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
index 61d568f..0bbf633 100644
--- a/hw/ssi/pl022.c
+++ b/hw/ssi/pl022.c
@@ -8,7 +8,7 @@
  */
 
 #include "hw/sysbus.h"
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 
 //#define DEBUG_PL022 1
 
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index 2aab79b..a0f57c0 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -12,7 +12,7 @@
  * GNU GPL, version 2 or (at your option) any later version.
  */
 
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 
 struct SSIBus {
     BusState parent_obj;
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index 620573c..94bb2a7 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -29,7 +29,7 @@
 #include "qemu/log.h"
 #include "qemu/fifo8.h"
 
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 
 #ifdef XILINX_SPI_ERR_DEBUG
 #define DB_PRINT(...) do { \
diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 0910f54..e9471ff 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -27,7 +27,7 @@
 #include "hw/ptimer.h"
 #include "qemu/log.h"
 #include "qemu/fifo8.h"
-#include "hw/ssi.h"
+#include "hw/ssi/ssi.h"
 #include "qemu/bitops.h"
 
 #ifndef XILINX_SPIPS_ERR_DEBUG
diff --git a/include/hw/ssi.h b/include/hw/ssi/ssi.h
similarity index 96%
rename from include/hw/ssi.h
rename to include/hw/ssi/ssi.h
index df0f838..4a0a539 100644
--- a/include/hw/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -14,6 +14,8 @@
 #include "hw/qdev.h"
 
 typedef struct SSISlave SSISlave;
+typedef struct SSISlaveClass SSISlaveClass;
+typedef enum SSICSMode SSICSMode;
 
 #define TYPE_SSI_SLAVE "ssi-slave"
 #define SSI_SLAVE(obj) \
@@ -25,14 +27,14 @@ typedef struct SSISlave SSISlave;
 
 #define SSI_GPIO_CS "ssi-gpio-cs"
 
-typedef enum {
+enum SSICSMode {
     SSI_CS_NONE = 0,
     SSI_CS_LOW,
     SSI_CS_HIGH,
-} SSICSMode;
+};
 
 /* Slave devices.  */
-typedef struct SSISlaveClass {
+struct SSISlaveClass {
     DeviceClass parent_class;
 
     int (*init)(SSISlave *dev);
@@ -55,7 +57,7 @@ typedef struct SSISlaveClass {
      * always be called for the device for every txrx access to the parent bus
      */
     uint32_t (*transfer_raw)(SSISlave *dev, uint32_t val);
-} SSISlaveClass;
+};
 
 struct SSISlave {
     DeviceState parent_obj;
-- 
1.9.1

