Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7201080wrx;
        Thu, 7 Mar 2019 06:23:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqzYSLyhxfD4l/K1dYI4MzBGhuzqypZuaQy4drp9rg4j1N6vYlvxHJt+SuvjVXn1vFvvIWOe
X-Received: by 2002:a25:2406:: with SMTP id k6mr11637488ybk.281.1551968614696;
        Thu, 07 Mar 2019 06:23:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551968614; cv=none;
        d=google.com; s=arc-20160816;
        b=pcW6EaLEIUZmgLR3gb4tFZ4fUT5I81qXYE+qvpza48zA3BpIubjCuDQd/icoiOI/OE
         M/3JR2Kekn6XEfbycjc+lj87CigaOsbGzlP+RwtBAs6LGaPUTd/SHA9MHMyX9WvsITdz
         LSPURtLMNclaqw/ZrTY4nHDGw78eD+TnTRJBr3jzMMPTO+gNtZRraqxxKoTxbIA55i1b
         yd0Jk6jsoOWDvhIj0Ym+JKNe0XV+HhFC9tnGeFupddqAUdzafye/VC8UIv+L+ykvFf2r
         Fq/63F7DefPkdOT2KMkRnjqaN+3PsR2eXlhPA/uRjpmkWP+18EC1uzDOpRSrFuXoVx+e
         XxWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7R6Arip2e/WmVgmYcVTCbZykwaEOZ0ibyj3LwI0mo2Y=;
        b=smCRkqRMmJl2L61F/a9fLBgnF08NoDWjn/2Qje34Wz5jfZi5fLbzZ8bhns9kMoC+GI
         dQE2jZyk7wEOLEqwIVCpU7dzAUeBeL3Ej+Nhk9+r0MFj/w8QfyqX6uFk/PRfCwG8H27D
         z5Kn8N6QTtqcYM6Aq6g6p1ph6bH66IfHlDfWEIPTE1PjHyu7x6QmgaAyr5uYTiRUhiSc
         v5ot2x/eyTeZpgLRoIaKzRUkwjf6G+1AN2tNasyUBG9AvD/uIKI0kIV8A1qYTz7BRw7L
         TQoC0GLySLhUFvCiHlnUni9O/ZDe44oXZxAvvx9U79NPtrXOfRnPdpQ94eXZwY2zgknc
         1w+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si2814696ywh.140.2019.03.07.06.23.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:23:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1tvq-0007v1-4J
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:23:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tsn-0005JP-IS
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:20:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tsh-0000G2-F2
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:20:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49144)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tsh-0000F9-4C; Thu, 07 Mar 2019 09:20:19 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52A8528207;
	Thu,  7 Mar 2019 14:20:18 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D9515C1B5;
	Thu,  7 Mar 2019 14:20:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:34 +0100
Message-Id: <1551968334-18982-10-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 07 Mar 2019 14:20:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 09/29] hw/arm: Express dependencies of the
 OMAP machines with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ATUWZNoNvBC2

Add Kconfig dependencies for the OMAP machines (cheetah, n800, n810,
sx1 and sx1-v1).
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 17 ++++-------------
 hw/arm/Kconfig                  | 26 ++++++++++++++++++++++++++
 hw/arm/Makefile.objs            |  3 ++-
 3 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index a058bcb..2c07f5c 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -10,16 +10,16 @@ CONFIG_HIGHBANK=3Dy
 CONFIG_INTEGRATOR=3Dy
 CONFIG_FSL_IMX31=3Dy
 CONFIG_MUSICPAL=3Dy
+CONFIG_MUSCA=3Dy
+CONFIG_CHEETAH=3Dy
+CONFIG_SX1=3Dy
+CONFIG_NSERIES=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
 CONFIG_ECC=3Dy
 CONFIG_SERIAL=3Dy
 CONFIG_MAX7310=3Dy
-CONFIG_TWL92230=3Dy
-CONFIG_TSC2005=3Dy
-CONFIG_LM832X=3Dy
-CONFIG_TMP105=3Dy
 CONFIG_TMP421=3Dy
 CONFIG_PCA9552=3Dy
 CONFIG_STELLARIS=3Dy
@@ -37,9 +37,7 @@ CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
 CONFIG_FTGMAC100=3Dy
 CONFIG_DS1338=3Dy
-CONFIG_PFLASH_CFI01=3Dy
 CONFIG_MICRODRIVE=3Dy
-CONFIG_USB_MUSB=3Dy
 CONFIG_PLATFORM_BUS=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
=20
@@ -59,15 +57,8 @@ CONFIG_ZYNQ_DEVCFG=3Dy
=20
 CONFIG_ARM11SCU=3Dy
 CONFIG_DIGIC=3Dy
-CONFIG_OMAP=3Dy
-CONFIG_TSC210X=3Dy
-CONFIG_BLIZZARD=3Dy
-CONFIG_ONENAND=3Dy
-CONFIG_TUSB6010=3Dy
 CONFIG_MAINSTONE=3Dy
 CONFIG_MPS2=3Dy
-CONFIG_MUSCA=3Dy
-CONFIG_NSERIES=3Dy
 CONFIG_RASPI=3Dy
 CONFIG_REALVIEW=3Dy
 CONFIG_ZAURUS=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 08c213d..cfb3ab1 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -2,6 +2,11 @@ config ARM_VIRT
     bool
     imply VFIO_PLATFORM
=20
+config CHEETAH
+    bool
+    select OMAP
+    select TSC210X
+
 config DIGIC
     bool
     select PTIMER
@@ -62,9 +67,26 @@ config NETDUINO2
=20
 config NSERIES
     bool
+    select OMAP
+    select TMP105   # tempature sensor
+    select BLIZZARD # LCD/TV controller
+    select ONENAND
+    select TSC210X  # touchscreen/sensors/audio
+    select TSC2005  # touchscreen/sensors/keypad
+    select LM832X   # GPIO keyboard chip
+    select TWL92230 # energy-management
+    select TUSB6010
=20
 config OMAP
     bool
+    select FRAMEBUFFER
+    select I2C
+    select ECC
+    select NAND
+    select PFLASH_CFI01
+    select PCI
+    select SD
+    select SERIAL
=20
 config PXA2XX
     bool
@@ -78,6 +100,10 @@ config STELLARIS
 config STRONGARM
     bool
=20
+config SX1
+    bool
+    select OMAP
+
 config VERSATILE
     bool
=20
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index fa57c7c..8302b8d 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -9,7 +9,8 @@ obj-$(CONFIG_MAINSTONE) +=3D mainstone.o
 obj-$(CONFIG_MUSICPAL) +=3D musicpal.o
 obj-$(CONFIG_NETDUINO2) +=3D netduino2.o
 obj-$(CONFIG_NSERIES) +=3D nseries.o
-obj-$(CONFIG_OMAP) +=3D omap_sx1.o palm.o
+obj-$(CONFIG_SX1) +=3D omap_sx1.o
+obj-$(CONFIG_CHEETAH) +=3D palm.o
 obj-$(CONFIG_PXA2XX) +=3D gumstix.o spitz.o tosa.o z2.o
 obj-$(CONFIG_REALVIEW) +=3D realview.o
 obj-$(CONFIG_STELLARIS) +=3D stellaris.o
--=20
1.8.3.1

