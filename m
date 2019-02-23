Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7790122wrx;
        Sat, 23 Feb 2019 00:03:59 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia9VpAV6ceHYxLpHgpSohSixZpv4BheqLXaqO1jOepqzyXLmdCpujBI4xRVHDbpoTXkM8B/
X-Received: by 2002:a0d:d5cd:: with SMTP id x196mr6394602ywd.303.1550909038953;
        Sat, 23 Feb 2019 00:03:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550909038; cv=none;
        d=google.com; s=arc-20160816;
        b=Np/bwOKzGUe+0cS3uWHWegebrTyjtG+FCgEpe6rGhFUECAYOdvHwJUpnNPMJRd3BzB
         CnHvIBBXHIF8QTth0c5Js7VLl3u68S/LTZLfb2o1QS35zHxEbvOJO+odI49LWIyI0Ww/
         +4U7a48UvFBXHuLC7NJhWvTh8O01U4bBY44qN+6EOpjOE9gNDnkqmXFhKDjlepuUlhzt
         QLRiP2fPCP4x3JIhZzk361+1MZFCtUDXz2Oe+S2GB/QVKwdVaVHCBLLYOn5sYTBD9YZH
         t0ULmNrjrAPWSmQ9hY2w+7LHTVIag0DEf1HGvEE9uYFTdD+0w+RO0V0cuWdI8Ytld9md
         n8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=jInFJvPBOPCSsQVYw8jF6UB76LYXWTy6dJ9MwErFHvI=;
        b=UU8KNbItMoOksxkNZFoi4qEQdhWniP2sXuq7ZXvPZnXxTjaKgA8WEhZnqYopboZzrR
         7ocr8ohX7G6zA+Oh9MPAVyYFMow3b1I88T2NsU4NQVHHBGP0h/2AyXRB/g/rJaxe0ok6
         MJHC0hx1y13X9xJHYeeHjutvrsv1GVTIp+HqjXPN/AEKionOh45/8Au1LfJDVfcLwMiP
         M7I7P4G1LdanjERZB/mqddUFn+6UANrq4DcBdIMTksIito3aiVsco8AVf+Tf9iYOEkLE
         LfePW+qpTtDujkMD9I2jByTc/SLAC8JNUjdLLg2mlORpx2JkVGXKO7jGe39cl0OsoEve
         bMBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n184si2016084ybc.172.2019.02.23.00.03.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Feb 2019 00:03:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSHu-0006qL-BM
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 03:03:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4U-0004j2-HN
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4S-0002Ct-VL
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS4Q-00020l-U5; Sat, 23 Feb 2019 02:50:04 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04B4A3688E;
	Sat, 23 Feb 2019 07:49:52 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F3A45D9CA;
	Sat, 23 Feb 2019 07:49:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:04 +0100
Message-Id: <1550908162-22644-13-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Sat, 23 Feb 2019 07:49:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 12/30] hw/arm: Express dependencies of
 realview, versatile and vexpress with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rYEWCEMXeV3q

This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 21 +++---------------
 hw/arm/Kconfig                  | 47 +++++++++++++++++++++++++++++++++++=
++++++
 hw/arm/Makefile.objs            |  3 ++-
 hw/display/Kconfig              |  1 +
 hw/i2c/Kconfig                  |  2 +-
 5 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 4ca7b63..d6858c3 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -3,8 +3,6 @@
 # TODO: ARM_V7M is currently always required - make this more flexible!
 CONFIG_ARM_V7M=3Dy
=20
-CONFIG_PCI_DEVICES=3Dy
-
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
 CONFIG_INTEGRATOR=3Dy
@@ -15,6 +13,9 @@ CONFIG_CHEETAH=3Dy
 CONFIG_SX1=3Dy
 CONFIG_NSERIES=3Dy
 CONFIG_STELLARIS=3Dy
+CONFIG_REALVIEW=3Dy
+CONFIG_VERSATILE=3Dy
+CONFIG_VEXPRESS=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -23,8 +24,6 @@ CONFIG_SERIAL=3Dy
 CONFIG_MAX7310=3Dy
 CONFIG_TMP421=3Dy
 CONFIG_PCA9552=3Dy
-CONFIG_DDC=3Dy
-CONFIG_SII9022=3Dy
 CONFIG_ADS7846=3Dy
 CONFIG_MAX111X=3Dy
 CONFIG_SSI_M25P80=3Dy
@@ -36,13 +35,8 @@ CONFIG_MICRODRIVE=3Dy
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
@@ -50,12 +44,10 @@ CONFIG_FRAMEBUFFER=3Dy
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
@@ -83,10 +75,6 @@ CONFIG_IOTKIT_SYSCTL=3Dy
 CONFIG_IOTKIT_SYSINFO=3Dy
 CONFIG_ARMSSE_CPUID=3Dy
=20
-CONFIG_VERSATILE=3Dy
-CONFIG_VERSATILE_PCI=3Dy
-CONFIG_VERSATILE_I2C=3Dy
-
 CONFIG_PCI_EXPRESS=3Dy
 CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=3Dy
 CONFIG_VFIO_PLATFORM=3Dy
@@ -120,6 +108,3 @@ CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
-
-# for realview and versatilepb
-CONFIG_LSI_SCSI_PCI=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index db48b9b..62ab487 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -95,6 +95,29 @@ config PXA2XX
=20
 config REALVIEW
     bool
+    imply PCI_DEVICES
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
@@ -118,6 +141,29 @@ config SX1
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
@@ -197,6 +243,7 @@ config A15MPCORE
=20
 config ARM11MPCORE
     bool
+    select ARM11SCU
=20
 config ARMSSE
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 8302b8d..bd0b45a 100644
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
index 34c8c12..a5f3fc0 100644
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
index ef1caa6..0004893 100644
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
1.8.3.1

