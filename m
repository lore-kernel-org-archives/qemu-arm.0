Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp299481wrq;
        Fri, 8 Feb 2019 22:53:25 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYRqYRjZiBROcrHaUQH4bQIC06iQ/3H01GnM6qdoXJnT1nu4b/8YQA+7c8X/i2Miuy0mROW
X-Received: by 2002:a1c:5f8a:: with SMTP id t132mr1807718wmb.40.1549695205784;
        Fri, 08 Feb 2019 22:53:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549695205; cv=none;
        d=google.com; s=arc-20160816;
        b=G6CwVORdhSavqOcAFJTNqaQD8x4BLMmlC4sEAFNEb3uch9Rp2iNl7JPlioUyEdbokc
         aBqF8KlEYZjx4KHFWdkx19dtxJROfv8vfSRfTC7vU8nDvn1G9Cj221+z1mb0tpTMPKQH
         kUewfxYojOKzMnAVcD5VRhNPIF7X467VW7dBo8sqmqHEPRQYkxnQkl+Urg5m4JV5FfcF
         SLFXTIGkaJqh6UrysCbj5UCVcBIXgpitmijrpDfDXaVsjoxlmgZOg35X/mlgvUf3mIC5
         8jKe4n82l3k1UCsd57F0Q1vjKhr4LDl6XI8KpvSipdCTQe3kl4bN3FJfQTQqVJy3AvEY
         PzDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=hYqBIBclwUWWRuL9KiA2aBNiSCUrASAonYsvR95DVuE=;
        b=x2dGvKzaKO9w++7ezmOGqiY6hbTcJL/VYufBRiC+KMgjkxGZ2XbskadZa1E34uOY3Y
         EMVDiPVZPDLc1DOs/XeAnGnOTlV+Q+6Yd71kbUcGLYvVfSdfOMw4hhGoL4nM7MQAIJIT
         zj5aY6k9p7PY7Ut2h/T8Wq5D3z6LJm2JLneH76INcd/7QqKG2kpJvkB5XRWkP+Yfgivn
         iOceEF34KRQ/6HTsaFGfnbz/wCBrgopg65H149Up9mnQb6WHH4hQyez5j2hIkUbc56cN
         pJVZoR//xybitUMiiPTTuYt4AMc1WJJGwlRF+JJE+B0xCRwJ/0nfW+QzBs+sbX9/gd+X
         dGSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 93si2439440wro.425.2019.02.08.22.53.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:53:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMVw-0006Dg-OM
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:53:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJ0-0003aH-8b
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIz-0003X5-60
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60850)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMIy-0003W8-VI; Sat, 09 Feb 2019 01:40:01 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24E5883F42;
	Sat,  9 Feb 2019 06:40:00 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A452762662;
	Sat,  9 Feb 2019 06:39:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:14 +0100
Message-Id: <1549694366-1284-14-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sat, 09 Feb 2019 06:40:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 13/25] hw/arm: Express dependencies of the virt
 machine with Kconfig
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
X-TUID: sm1+W7eLaemH

Dependencies have been determined by looking at hw/arm/virt.c

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 14 +-------------
 hw/arm/Kconfig                  | 19 +++++++++++++++++++
 hw/arm/Makefile.objs            |  3 ++-
 3 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index b2e31b3..9db6808 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -3,6 +3,7 @@
 # TODO: ARM_V7M is currently always required - make this more flexible!
 CONFIG_ARM_V7M=y
 
+CONFIG_ARM_VIRT=y
 CONFIG_EXYNOS4=y
 CONFIG_HIGHBANK=y
 CONFIG_INTEGRATOR=y
@@ -28,8 +29,6 @@ CONFIG_VGA=y
 CONFIG_SSI_M25P80=y
 CONFIG_ALLWINNER_EMAC=y
 CONFIG_IMX_FEC=y
-CONFIG_PLATFORM_BUS=y
-CONFIG_VIRTIO_MMIO=y
 
 CONFIG_NETDUINO2=y
 
@@ -63,12 +62,6 @@ CONFIG_IOTKIT_SYSCTL=y
 CONFIG_IOTKIT_SYSINFO=y
 CONFIG_ARMSSE_CPUID=y
 
-CONFIG_PCI_EXPRESS=y
-CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=y
-CONFIG_VFIO_PLATFORM=y
-CONFIG_VFIO_XGMAC=y
-CONFIG_VFIO_AMD_XGBE=y
-
 CONFIG_ALLWINNER_A10_PIT=y
 CONFIG_ALLWINNER_A10_PIC=y
 CONFIG_ALLWINNER_A10=y
@@ -84,10 +77,5 @@ CONFIG_PCIE_PORT=y
 CONFIG_XIO3130=y
 CONFIG_IOH3420=y
 CONFIG_I82801B11=y
-CONFIG_ACPI=y
-CONFIG_ARM_VIRT=y
-CONFIG_SMBIOS=y
-CONFIG_GPIO_KEY=y
 CONFIG_MSF2=y
-CONFIG_FW_CFG_DMA=y
 CONFIG_PCI_EXPRESS_DESIGNWARE=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index a4fe2c8..3d580fa 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -1,5 +1,23 @@
 config ARM_VIRT
     bool
+    imply PCI_DEVICES
+    imply VFIO_AMD_XGBE
+    imply VFIO_XGMAC
+    select A15MPCORE
+    select ACPI
+    select ARM_SMMUV3
+    select GPIO_KEY
+    select FW_CFG_DMA
+    select PCI_EXPRESS
+    select PCI_EXPRESS_GENERIC_BRIDGE
+    select PFLASH_CFI01
+    select PL011 # UART
+    select PL031 # RTC
+    select PL061 # GPIO
+    select PLATFORM_BUS
+    select SMBIOS
+    select VIRTIO_MMIO
+    select VFIO_PLATFORM
 
 config CHEETAH
     bool
@@ -314,6 +332,7 @@ config A9MPCORE
 
 config A15MPCORE
     bool
+    select ARM_GIC
 
 config ARM11MPCORE
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 053fcb6..f17187f 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -1,4 +1,5 @@
-obj-y += boot.o sysbus-fdt.o
+obj-y += boot.o
+obj-$(CONFIG_PLATFORM_BUS) += sysbus-fdt.o
 obj-$(CONFIG_ARM_VIRT) += virt.o
 obj-$(CONFIG_ACPI) += virt-acpi-build.o
 obj-$(CONFIG_DIGIC) += digic_boards.o
-- 
1.8.3.1

