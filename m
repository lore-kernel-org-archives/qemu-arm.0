Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1432142wrh;
        Sun, 5 May 2019 07:02:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyj7xw88Z+Z9ECsrxYy9MRqxtYQVtP5Z412wzvOxq4aAZBK8L32bDxuTF7F0Jotrw2R4vY2
X-Received: by 2002:adf:e690:: with SMTP id r16mr11818160wrm.193.1557064934585;
        Sun, 05 May 2019 07:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557064934; cv=none;
        d=google.com; s=arc-20160816;
        b=SzGdrvMKnF0UlpnpRh0g/nYt7GpjBQhVEy72LywGsa+OQC3Waqtf1bNVGwjj/WjlBx
         FDmM7N0XFN/Fk9d+B97Kgqy5rFOLJSyrF0AewUcDQRUxKn8+xlo9mU1V1V0BFAy14SUB
         mrxzXdNAC/V5UMAn1vSp51UqlskyHYO0Wt4RUWUn6avDqFw7+1HGROStReJJhWWBukV7
         Di1Gy+X15X8jQmW1mfSUOj9M8H1/iqosgZOOOAnr1hAmmUaZ0uKZh7BI2HHI4TpTeBNN
         RSnUDWl+YPlnETcd1/q5YoSARzcmfy3uwBP9G9IIpXCPkXKaH8n/k5o5e98ubKRN9Tiy
         7kfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=JFcqAhdY5W2JHiRVcyDd5NsKEvUuRnP2FymZHe7GWSM=;
        b=cHeiivyhkyynQsLXlaCV4Y651wZVEVVJq3SC1Tf/RMt9NF8740/HHJbJ4MlgqTifn0
         jncdZ4OCub+vHupMT6H3ofgH9gjwQW7dO4lRJZliVd3PbpQuPIEPbys5vpFeS5ImzHoS
         xVSCbCLwf0+gu5mZ00Z8JMe0vgSyd3ezRXWhg6hHZHAiXYdD9UEtTFoSPxDgGtyRqVS1
         fOyGW7xGI92qSL2n9vsBCm4eyCgzixNrr0PQHsL2FilMEaHxF4zhXq4YefoUj8WhYySV
         Gv+b+paGfhPAjHuG0qLF94zcoJ9fYY4ZiKplPzzEzood2kuGKJQI9G7WMmIDZIY4CYZ5
         lQCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14si6049344wre.118.2019.05.05.07.02.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:02:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHiX-0008Oc-Gs
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:02:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHe3-0004EQ-Au
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHe2-0004iI-43
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53732)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHe1-0004hU-SV; Sun, 05 May 2019 09:57:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32F2C308792B;
	Sun,  5 May 2019 13:57:33 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25AC860C18;
	Sun,  5 May 2019 13:57:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:56:56 +0200
Message-Id: <20190505135714.11277-11-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Sun, 05 May 2019 13:57:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 10/28] hw/arm: Express dependencies of realview,
 versatile and vexpress with Kconfig
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zGTaI3LTMCKf

This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 24 ++++-------------
 hw/arm/Kconfig                  | 48 +++++++++++++++++++++++++++++++++
 hw/arm/Makefile.objs            |  3 ++-
 hw/display/Kconfig              |  1 +
 hw/i2c/Kconfig                  |  2 +-
 5 files changed, 57 insertions(+), 21 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 3f82d635e4..df7d9421e0 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -3,9 +3,8 @@
 # TODO: ARM_V7M is currently always required - make this more flexible!
 CONFIG_ARM_V7M=3Dy
=20
-CONFIG_PCI=3Dy
-CONFIG_PCI_DEVICES=3Dy
-CONFIG_PCI_TESTDEV=3Dy
+# CONFIG_PCI_DEVICES=3Dn
+# CONFIG_TEST_DEVICES=3Dn
=20
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
@@ -17,6 +16,9 @@ CONFIG_CHEETAH=3Dy
 CONFIG_SX1=3Dy
 CONFIG_NSERIES=3Dy
 CONFIG_STELLARIS=3Dy
+CONFIG_REALVIEW=3Dy
+CONFIG_VERSATILE=3Dy
+CONFIG_VEXPRESS=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -25,8 +27,6 @@ CONFIG_SERIAL=3Dy
 CONFIG_MAX7310=3Dy
 CONFIG_TMP421=3Dy
 CONFIG_PCA9552=3Dy
-CONFIG_DDC=3Dy
-CONFIG_SII9022=3Dy
 CONFIG_ADS7846=3Dy
 CONFIG_MAX111X=3Dy
 CONFIG_SSI_M25P80=3Dy
@@ -38,13 +38,8 @@ CONFIG_MICRODRIVE=3Dy
 CONFIG_PLATFORM_BUS=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
=20
-CONFIG_ARM11MPCORE=3Dy
-
 CONFIG_NETDUINO2=3Dy
=20
-CONFIG_PL041=3Dy
-CONFIG_PL080=3Dy
-CONFIG_PL190=3Dy
 CONFIG_PL330=3Dy
 CONFIG_CADENCE=3Dy
 CONFIG_PXA2XX=3Dy
@@ -52,12 +47,10 @@ CONFIG_FRAMEBUFFER=3Dy
 CONFIG_XILINX_SPIPS=3Dy
 CONFIG_ZYNQ_DEVCFG=3Dy
=20
-CONFIG_ARM11SCU=3Dy
 CONFIG_DIGIC=3Dy
 CONFIG_MAINSTONE=3Dy
 CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
-CONFIG_REALVIEW=3Dy
 CONFIG_ZAURUS=3Dy
 CONFIG_ZYNQ=3Dy
 CONFIG_STM32F2XX_TIMER=3Dy
@@ -86,10 +79,6 @@ CONFIG_IOTKIT_SYSINFO=3Dy
 CONFIG_ARMSSE_CPUID=3Dy
 CONFIG_ARMSSE_MHU=3Dy
=20
-CONFIG_VERSATILE=3Dy
-CONFIG_VERSATILE_PCI=3Dy
-CONFIG_VERSATILE_I2C=3Dy
-
 CONFIG_PCI_EXPRESS=3Dy
 CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=3Dy
=20
@@ -120,6 +109,3 @@ CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
-
-# for realview and versatilepb
-CONFIG_LSI_SCSI_PCI=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e5a8ae5ef9..f0e112e778 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -88,6 +88,30 @@ config PXA2XX
=20
 config REALVIEW
     bool
+    imply PCI_DEVICES
+    imply PCI_TESTDEV
+    select SMC91C111
+    select LAN9118
+    select A9MPCORE
+    select A15MPCORE
+    select ARM11MPCORE
+    select ARM_TIMER
+    select VERSATILE_PCI
+    select WM8750 # audio codec
+    select LSI_SCSI_PCI
+    select PCI
+    select PL011  # UART
+    select PL031  # RTC
+    select PL041  # audio codec
+    select PL050  # keyboard/mouse
+    select PL061  # GPIO
+    select PL080  # DMA controller
+    select PL110
+    select PL181  # display
+    select PL310  # cache controller
+    select VERSATILE_I2C
+    select DS1338 # I2C RTC+NVRAM
+    select USB_OHCI
=20
 config STELLARIS
     bool
@@ -112,6 +136,29 @@ config SX1
=20
 config VERSATILE
     bool
+    select ARM_TIMER # sp804
+    select PFLASH_CFI01
+    select LSI_SCSI_PCI
+    select PL050  # keyboard/mouse
+    select PL080  # DMA controller
+    select PL190  # Vector PIC
+    select REALVIEW
+    select USB_OHCI
+
+config VEXPRESS
+    bool
+    select A9MPCORE
+    select A15MPCORE
+    select ARM_MPTIMER
+    select ARM_TIMER # sp804
+    select LAN9118
+    select PFLASH_CFI01
+    select PL011 # UART
+    select PL041 # audio codec
+    select PL181  # display
+    select REALVIEW
+    select SII9022
+    select VIRTIO_MMIO
=20
 config ZYNQ
     bool
@@ -184,6 +231,7 @@ config A15MPCORE
=20
 config ARM11MPCORE
     bool
+    select ARM11SCU
=20
 config ARMSSE
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 8302b8df1d..bd0b45a799 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -15,7 +15,8 @@ obj-$(CONFIG_PXA2XX) +=3D gumstix.o spitz.o tosa.o z2.o
 obj-$(CONFIG_REALVIEW) +=3D realview.o
 obj-$(CONFIG_STELLARIS) +=3D stellaris.o
 obj-$(CONFIG_STRONGARM) +=3D collie.o
-obj-$(CONFIG_VERSATILE) +=3D vexpress.o versatilepb.o
+obj-$(CONFIG_VERSATILE) +=3D versatilepb.o
+obj-$(CONFIG_VEXPRESS) +=3D vexpress.o
 obj-$(CONFIG_ZYNQ) +=3D xilinx_zynq.o
=20
 obj-$(CONFIG_ARM_V7M) +=3D armv7m.o
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index a11815c9af..0577e68c8e 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -26,6 +26,7 @@ config PL110
 config SII9022
     bool
     depends on I2C
+    select DDC
=20
 config SSD0303
     bool
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 820b24de5b..aee961541c 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -12,7 +12,7 @@ config DDC
=20
 config VERSATILE_I2C
     bool
-    select I2C
+    select BITBANG_I2C
=20
 config ACPI_SMBUS
     bool
--=20
2.21.0

