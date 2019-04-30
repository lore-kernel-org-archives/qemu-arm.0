Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4407951wrh;
        Tue, 30 Apr 2019 00:25:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFwxi3rCnouy3CJmxxRFdQnx1DoIQSMz6LKROYIfA6NwoMS5w0BG+g1DM5wyTS1Tl+U7d7
X-Received: by 2002:a5d:5542:: with SMTP id g2mr21657130wrw.58.1556609122460;
        Tue, 30 Apr 2019 00:25:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556609122; cv=none;
        d=google.com; s=arc-20160816;
        b=B9s0g6hDi7S82pYVKpAKa6ihIunQtEQ4qLTc6gDS45o7lXKEde3lUiXBkZRidu3tbZ
         PAtQpneO5OejurT9ADSWje0miSh9wNg2ZHrQbPrIsoCrT9Gbljyn9ovd6ry+KehP7aAa
         4GyuYCMd+cUejTV5tcrTguey7Zd55ZVp4zg1qr04P651MWmuNtF7f4zlkw1EskN6qOio
         nZRi7RtSqmANW4sYBGgb7jip6bQ+rlRrDSKAbJZQuGtgLFctEUxCvP/TqO+gjSxs6Kpc
         F3QzRNkvn7Mc3XXERyKk1J4SxQfXh8qwbUjczSnsJA+/Va/uXwJRHScAfwOFhU841Nz5
         M6IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=KvutbIfUuAdMknCXLUZU3Tuiy6V4+LFBeoToLXmP7jE=;
        b=SeMjbRE79yE0t3XubxNI/78B3jE9rgky82w1k4ecsAFt6pUN3qUeh8MzsR+SmoPsc3
         YCclrzg9JVlzXFvmyWtcbdY4LG9IRXTRbplCWt3x78ZlMX/HiROy6C+Z8JKwPVqMo3+m
         2lWV8B1Rpmqg2KBkm+Ggu4LUWZP6L+xbtgevmOno8+sQK/k3eAqAPQwKSJ6QWklbTjKh
         SyrYtO9emkm7t6in8q+IvWhhAgbngCD9IbiFedhuV+jyijybkHukI34PT4Isw52SbstE
         6PPb3/GAUnLVTCHK7h8vtPAlj1Ef8rl8XTcLIDwx+BMEy7BrmjwfLVboghI46qZ5UeoS
         25Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14si1124289wmb.11.2019.04.30.00.25.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:25:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40447 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLN8j-0005gh-EX
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:25:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN0a-0007gk-6Y
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 03:16:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN0Z-0004z5-2n
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 03:16:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38498)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLN0N-0004uB-Cl; Tue, 30 Apr 2019 03:16:43 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 410DC3082B44;
	Tue, 30 Apr 2019 07:16:42 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEB661001E85;
	Tue, 30 Apr 2019 07:16:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:13:48 +0200
Message-Id: <20190430071405.16714-14-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 30 Apr 2019 07:16:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 13/30] hw/arm: Express dependencies of the
 PXA2xx machines with Kconfig
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Cedric Le Goater <clg@kaod.org>,
	John Snow <jsnow@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrew Jeffery <andrew@aj.id.au>, Peter Chubb <peter.chubb@nicta.com.au>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: avZqVjJY3Y7c

Add Kconfig dependencies for the PXA2xx machines (akita, borzoi,
connex and verdex gumstix, tosa, mainstone, spitz, terrier and z2).
This patch is based on earlier work by =C3=81kos Kov=C3=A1cs (i.e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 15 ++++--------
 hw/arm/Kconfig                  | 42 +++++++++++++++++++++++++++++++++
 hw/arm/Makefile.objs            |  5 +++-
 3 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index df7d9421e0..f39a854f2e 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -19,22 +19,20 @@ CONFIG_STELLARIS=3Dy
 CONFIG_REALVIEW=3Dy
 CONFIG_VERSATILE=3Dy
 CONFIG_VEXPRESS=3Dy
+CONFIG_MAINSTONE=3Dy
+CONFIG_GUMSTIX=3Dy
+CONFIG_SPITZ=3Dy
+CONFIG_TOSA=3Dy
+CONFIG_Z2=3Dy
=20
 CONFIG_VGA=3Dy
-CONFIG_NAND=3Dy
-CONFIG_ECC=3Dy
-CONFIG_SERIAL=3Dy
-CONFIG_MAX7310=3Dy
 CONFIG_TMP421=3Dy
 CONFIG_PCA9552=3Dy
-CONFIG_ADS7846=3Dy
-CONFIG_MAX111X=3Dy
 CONFIG_SSI_M25P80=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
 CONFIG_FTGMAC100=3Dy
 CONFIG_DS1338=3Dy
-CONFIG_MICRODRIVE=3Dy
 CONFIG_PLATFORM_BUS=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
=20
@@ -42,16 +40,13 @@ CONFIG_NETDUINO2=3Dy
=20
 CONFIG_PL330=3Dy
 CONFIG_CADENCE=3Dy
-CONFIG_PXA2XX=3Dy
 CONFIG_FRAMEBUFFER=3Dy
 CONFIG_XILINX_SPIPS=3Dy
 CONFIG_ZYNQ_DEVCFG=3Dy
=20
 CONFIG_DIGIC=3Dy
-CONFIG_MAINSTONE=3Dy
 CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
-CONFIG_ZAURUS=3Dy
 CONFIG_ZYNQ=3Dy
 CONFIG_STM32F2XX_TIMER=3Dy
 CONFIG_STM32F2XX_USART=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index f0e112e778..79706ed0ce 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -48,6 +48,9 @@ config INTEGRATOR
=20
 config MAINSTONE
     bool
+    select PXA2XX
+    select PFLASH_CFI01
+    select SMC91C111
=20
 config MUSICPAL
     bool
@@ -85,6 +88,43 @@ config OMAP
=20
 config PXA2XX
     bool
+    select FRAMEBUFFER
+    select I2C
+    select SERIAL
+    select SD
+    select SSI
+    select USB_OHCI
+
+config GUMSTIX
+    bool
+    select PFLASH_CFI01
+    select SMC91C111
+    select PXA2XX
+
+config TOSA
+    bool
+    select ZAURUS  # scoop
+    select MICRODRIVE
+    select PXA2XX
+
+config SPITZ
+    bool
+    select ADS7846 # display
+    select MAX111X # A/D converter
+    select WM8750  # audio codec
+    select MAX7310 # GPIO expander
+    select ZAURUS  # scoop
+    select NAND    # memory
+    select ECC     # Error-correcting for NAND
+    select MICRODRIVE
+    select PXA2XX
+
+config Z2
+    bool
+    select PFLASH_CFI01
+    select WM8750
+    select PL011 # UART
+    select PXA2XX
=20
 config REALVIEW
     bool
@@ -218,6 +258,8 @@ config MSF2
=20
 config ZAURUS
     bool
+    select NAND
+    select ECC
=20
 config A9MPCORE
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index bd0b45a799..00328d1b0b 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -11,7 +11,10 @@ obj-$(CONFIG_NETDUINO2) +=3D netduino2.o
 obj-$(CONFIG_NSERIES) +=3D nseries.o
 obj-$(CONFIG_SX1) +=3D omap_sx1.o
 obj-$(CONFIG_CHEETAH) +=3D palm.o
-obj-$(CONFIG_PXA2XX) +=3D gumstix.o spitz.o tosa.o z2.o
+obj-$(CONFIG_GUMSTIX) +=3D gumstix.o
+obj-$(CONFIG_SPITZ) +=3D spitz.o
+obj-$(CONFIG_TOSA) +=3D tosa.o
+obj-$(CONFIG_Z2) +=3D z2.o
 obj-$(CONFIG_REALVIEW) +=3D realview.o
 obj-$(CONFIG_STELLARIS) +=3D stellaris.o
 obj-$(CONFIG_STRONGARM) +=3D collie.o
--=20
2.21.0

