Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1662397wrp;
        Wed, 13 Feb 2019 00:57:26 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZGIracXGr81/YBpXFyQ9Ftf49K/Vz1jOPEA27rnyc6rq5ByBTLzyWSOnl66e3Bz/6QthIT
X-Received: by 2002:a81:a60e:: with SMTP id d14mr2139442ywh.7.1550048246279;
        Wed, 13 Feb 2019 00:57:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048246; cv=none;
        d=google.com; s=arc-20160816;
        b=mUu3BJQjoeZBvcR8MsIKzSPpZCqLdxF564LGqEcousIbU7qL/RFna+828/sXbSKqH0
         rgE9qqVwt/Zf21AHbQxsPe2JQTzEse5diXLQVkNmONF3MC/UGBirhhy+69ts07dhrBet
         U6wwVRwoeLPUErasS9aTxL2sFb6RBC14qPVHq2QlY+9wkOE01Wyw6W1Wynm4mRoxooxC
         7fsKAbNgKCjCUKGzQg18T2DrtoQ1Tr4buD0bS169Zf7euf89cAe0BPpPkoDiF0y54sgV
         Mx0IPcyC+BSlHMD/tYQZUAPv1xFzwQkqfaRhtNp6IKnTTgqm1OJkOWU+jBYp/2QHTZKK
         RCRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=hYqBIBclwUWWRuL9KiA2aBNiSCUrASAonYsvR95DVuE=;
        b=ikw/Il6TnpUXtX/aKrL2zh4VSh5kF4fVa3RFLuXuQGKDCE1hIHKZhLDC7iyLKXoM+F
         aQXJPLB9METUGUJHpfgwO1Zu30+SsS9h+soOWnqKjsRkOfrQArZ7QbcvNZtEzclCGIn0
         ktVp2/Wmqz3Kga96ufHyWabzF4YMr2CeH314Zt3ofKgeLvcdXYYqzRPWMFzNKMmCIOsX
         TNsQMJ0Z2JubhUzGizgm1Sv23uvvHBMrTnR03z+irC1ka6gDIGxVVSdxmeoi/RV0E2xP
         VLWiQX4GTtmcMY42I+VtTYDjNrBXhLWH+zMCD4cID4JeKhJ2bK0nugj887wC0OAlegvH
         vrNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w62si2876332ywf.1.2019.02.13.00.57.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 00:57:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53235 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqM9-00077y-Lc
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 03:57:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG0-00021O-SO
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:51:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq4w-0005yx-Hp
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:39:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57654)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq4t-0005hA-8h; Wed, 13 Feb 2019 03:39:37 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3AEF81F19;
	Wed, 13 Feb 2019 08:39:15 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A843A101E841;
	Wed, 13 Feb 2019 08:39:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:06 +0100
Message-Id: <1550047098-1210-14-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 13 Feb 2019 08:39:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 13/25] hw/arm: Express dependencies of the
 virt machine with Kconfig
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
X-TUID: jZ/yUOpbPRUt

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

