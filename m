Received: by 10.25.21.96 with SMTP id l93csp1665408lfi;
        Tue, 28 Jun 2016 07:24:37 -0700 (PDT)
X-Received: by 10.200.54.110 with SMTP id n43mr2218706qtb.47.1467123877624;
        Tue, 28 Jun 2016 07:24:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d187si22753412qkf.69.2016.06.28.07.24.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 07:24:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37074 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHtwK-00014b-Uc
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 10:24:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHtwA-0000sF-1P
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 10:24:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHtw4-00063h-2R
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 10:24:25 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58016)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHtw3-00063I-RR; Tue, 28 Jun 2016 10:24:19 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHtWj-00063C-8z; Tue, 28 Jun 2016 14:58:09 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 28 Jun 2016 14:58:06 +0100
Message-Id: <1467122287-24974-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467122287-24974-1-git-send-email-peter.maydell@linaro.org>
References: <1467122287-24974-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.7 2/3] imx: Use memory_region_init_rom()
 for ROMs
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Jean-Christophe DUBOIS <jcd@tribudubois.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3ZMHxvcfvTE3

The imx boards were all incorrectly creating ROMs using
memory_region_init_rom_device() with a NULL ops pointer. This
will cause QEMU to abort if the guest tries to write to the
ROM. Switch to the new memory_region_init_rom() instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/fsl-imx25.c | 8 ++++----
 hw/arm/fsl-imx31.c | 9 ++++-----
 hw/arm/fsl-imx6.c  | 8 ++++----
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 1cd749a..1a53e51 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -249,16 +249,16 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
     }
 
     /* initialize 2 x 16 KB ROM */
-    memory_region_init_rom_device(&s->rom[0], NULL, NULL, NULL,
-                                  "imx25.rom0", FSL_IMX25_ROM0_SIZE, &err);
+    memory_region_init_rom(&s->rom[0], NULL,
+                           "imx25.rom0", FSL_IMX25_ROM0_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX25_ROM0_ADDR,
                                 &s->rom[0]);
-    memory_region_init_rom_device(&s->rom[1], NULL, NULL, NULL,
-                                  "imx25.rom1", FSL_IMX25_ROM1_SIZE, &err);
+    memory_region_init_rom(&s->rom[1], NULL,
+                           "imx25.rom1", FSL_IMX25_ROM1_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
         return;
diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 31a3a87..b283b71 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -219,9 +219,8 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
     }
 
     /* On a real system, the first 16k is a `secure boot rom' */
-    memory_region_init_rom_device(&s->secure_rom, NULL, NULL, NULL,
-                                  "imx31.secure_rom",
-                                  FSL_IMX31_SECURE_ROM_SIZE, &err);
+    memory_region_init_rom(&s->secure_rom, NULL, "imx31.secure_rom",
+                           FSL_IMX31_SECURE_ROM_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
         return;
@@ -230,8 +229,8 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
                                 &s->secure_rom);
 
     /* There is also a 16k ROM */
-    memory_region_init_rom_device(&s->rom, NULL, NULL, NULL, "imx31.rom",
-                                  FSL_IMX31_ROM_SIZE, &err);
+    memory_region_init_rom(&s->rom, NULL, "imx31.rom",
+                           FSL_IMX31_ROM_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
         return;
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 0c00e7a..ed392a9 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -399,8 +399,8 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                                         FSL_IMX6_ENET_MAC_1588_IRQ));
 
     /* ROM memory */
-    memory_region_init_rom_device(&s->rom, NULL, NULL, NULL, "imx6.rom",
-                                  FSL_IMX6_ROM_SIZE, &err);
+    memory_region_init_rom(&s->rom, NULL, "imx6.rom",
+                           FSL_IMX6_ROM_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
         return;
@@ -409,8 +409,8 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                                 &s->rom);
 
     /* CAAM memory */
-    memory_region_init_rom_device(&s->caam, NULL, NULL, NULL, "imx6.caam",
-                                  FSL_IMX6_CAAM_MEM_SIZE, &err);
+    memory_region_init_rom(&s->caam, NULL, "imx6.caam",
+                           FSL_IMX6_CAAM_MEM_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
         return;
-- 
1.9.1

