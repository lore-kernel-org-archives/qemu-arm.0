Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp292034wrq;
        Fri, 8 Feb 2019 22:40:18 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbQWf8uiu3IyYhfi5zygUFgVuCGZ+1FrtfE2+hkmHU3vp0vW0wZmx+5irWRXI5dGgzvOIXv
X-Received: by 2002:a1c:2804:: with SMTP id o4mr1782869wmo.150.1549694418426;
        Fri, 08 Feb 2019 22:40:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549694418; cv=none;
        d=google.com; s=arc-20160816;
        b=amNJtgbMXLnb/SC1UExYrciafL5t/djydntZhOgpf4fjGO7bFfCAbywTXM/nFFoppE
         nKfEZOBu4ZPO4BAl/hJ9bK49t+yNih9IJVMLk8EOVS6l4mjWG/EY2+AYXzfReua0IVzk
         0tAa6bBeQZPnqBftNkaIf1nOxGvwVgdCN1BlZt3RmOISclOKb47PbS4Ud6IbdKUTaFGO
         1Jmw/GcfTvEFRdXXg4n+YKYU3aZVUB1NhdbHTO+b7r5DEjA/hOIbD3EUc0i/ta3Hwdja
         wyqrdtTmvlk+gX7CoZIYe4hdguzlMVzyFupetkgwKdDo8Wg/EWxIRDIN+A7Gbh9v1K7e
         G2zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=XtbzCvZw5jUzRJ2rkLPxMEPCbfCut317u6A++snQMN8=;
        b=vrwxU5ZmTqcv/f04pbeinrI4YKpHCu9fuy/E+RcirNE1Mo7qoDjFpef4PVo81WkPVB
         90thZHnJKRMdIOQVgheZ6iDVSI3QnvVKohalPX/Mwaopa3j46gZVztea8Sp0JDcJGTvA
         i/+Hrri2vbJEhh2i66Mxyc6pZSfPaNrlMIY3c7Gjsd1S8VhhSTB1yab/HEEmjVZ6aydY
         vDivRgwdSpvsqKoZppNvcXsWsf7GMEKo2HnXc0B+i6XWnJwBXzl/qTC7vsIVQbaNnAf8
         4XSLgOK/KBRnJbOETz7fPDI6HZj9him5bayGvHl8KMpKF61B801FMpHj6B0izwfhMC/9
         f7Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si3268867wme.142.2019.02.08.22.40.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:40:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41401 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMJF-0003a9-En
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:40:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIv-0003W2-9o
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:39:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIs-0003OS-UG
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:39:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50426)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMIs-0003M1-HL; Sat, 09 Feb 2019 01:39:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CCF147F6B2;
	Sat,  9 Feb 2019 06:39:52 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5C6F5B6A4;
	Sat,  9 Feb 2019 06:39:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:10 +0100
Message-Id: <1549694366-1284-10-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sat, 09 Feb 2019 06:39:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 09/25] hw/arm: Express dependencies of the PXA2xx
 machines with Kconfig
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
Cc: qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KhjeaiATDgfP

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

