Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1672944wrp;
        Wed, 13 Feb 2019 01:08:56 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaHAG6PckxgnzqOo+O1S6q1x7GYM7oPW1FYjhkhLa6/s28BpoSdbZE836/coN0kYnoM+fOc
X-Received: by 2002:a81:9bd3:: with SMTP id s202mr3764975ywg.76.1550048936178;
        Wed, 13 Feb 2019 01:08:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048936; cv=none;
        d=google.com; s=arc-20160816;
        b=MPy2wFPu51SyKGdwicqM6GhgebS5Pjx4Y1q+gtDRZ7e1Z4klifvKJZubwEo17kA5mV
         Unmdx/mUeagxc98xSilRnvER4Xyxn3UKUhxnOZ2TNl6/PC90v3DQ8ERdhvwlsFrjhKoi
         8u/jlb4wrLaEW76BltJLRAzjwGhsUQ8Dc6bFFxO/xiZkK6IlpNSXgU6GqtTRRN9FAnAN
         gMO7lUITjAy9cYogR6+N9YTuuV1G0fSocXaht7DwZkp7qYQY3hvQbyT7XnbBgdI/UKor
         grqiMNFBxL7oWJQaqbREb3cbqXumkARUt3PV/pziSmBDc6UsjKsgb5tzjR+k+ypOPWec
         ZrHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=XtbzCvZw5jUzRJ2rkLPxMEPCbfCut317u6A++snQMN8=;
        b=JiJhQcIyszHt1rfpHOuxcslZkdFyFm8MQdDqrXT46nz3l6I/znZ5EjpgP0iTDfKZ9H
         MpLEntD/9YwVm/oTXBIliPvVgAeG2L715CXOFGt7L0xPBAh6An7oa/s8lXL5K9MyvSrm
         Mn+v3xTU8F9q7InHu7V2RRmn1Q2FsUpz64kY6MM+IHUoIHpbEAFrDKTV86UMPKI0ygzM
         HDGoiHwH4pr2M59vchDEqCbLHysyDlDbktVZSVEWA5lUGlV32RIFEfw9a+e1jSbuXbjo
         PcySXC0Yd8+smjxI0gDO5opvnb++MmbYnU8yJAuerUf3XdxbDHS0ETPuYXRz4ax3Z2qb
         5e9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b129si9398392ybc.225.2019.02.13.01.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 01:08:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53413 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqXH-00085g-GO
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 04:08:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG4-00025E-9R
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:51:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq4M-0005a3-HC
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:39:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45148)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq4L-0005YM-9q; Wed, 13 Feb 2019 03:39:01 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 804E12D80F;
	Wed, 13 Feb 2019 08:39:00 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8959101E841;
	Wed, 13 Feb 2019 08:38:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:02 +0100
Message-Id: <1550047098-1210-10-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 13 Feb 2019 08:39:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 09/25] hw/arm: Express dependencies of the
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JkdNX2KwDmNj

Add Kconfig dependencies for the PXA2xx machines (akita, borzoi,
connex and verdex gumstix, tosa, mainstone, spitz, terrier and z2).
This patch is based on earlier work by =C3=81kos Kov=C3=A1cs (i.e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 17 +++++----------
 hw/arm/Kconfig                  | 46 +++++++++++++++++++++++++++++++++++=
++++++
 hw/arm/Makefile.objs            |  5 ++++-
 3 files changed, 55 insertions(+), 13 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 2bac13b..1db76f6 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -15,22 +15,20 @@ CONFIG_STELLARIS=3Dy
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
@@ -38,16 +36,13 @@ CONFIG_NETDUINO2=3Dy
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
@@ -80,8 +75,6 @@ CONFIG_VFIO_PLATFORM=3Dy
 CONFIG_VFIO_XGMAC=3Dy
 CONFIG_VFIO_AMD_XGBE=3Dy
=20
-CONFIG_SDHCI=3Dy
-
 CONFIG_ALLWINNER_A10_PIT=3Dy
 CONFIG_ALLWINNER_A10_PIC=3Dy
 CONFIG_ALLWINNER_A10=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b76fd7c..95f2713 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -89,6 +89,50 @@ config OMAP
=20
 config PXA2XX
     bool
+    select FRAMEBUFFER
+    select I2C
+    select PCI
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
+config MAINSTONE
+    bool
+    select PXA2XX
+    select PFLASH_CFI01
+    select SMC91C111
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
@@ -227,6 +271,8 @@ config MSF2
=20
 config ZAURUS
     bool
+    select NAND
+    select ECC
=20
 config A9MPCORE
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 420641e..93e1160 100644
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
1.8.3.1

