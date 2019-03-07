Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7207192wrx;
        Thu, 7 Mar 2019 06:29:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqx9dAlc03mCyPu8l6mptZYkOTylRk7TNDl8QcAXBBiaPeItZm4P6HHCKBYaRkIEqpm6+BGe
X-Received: by 2002:a25:9988:: with SMTP id p8mr11435243ybo.127.1551968973611;
        Thu, 07 Mar 2019 06:29:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551968973; cv=none;
        d=google.com; s=arc-20160816;
        b=douyjh0gTpnUUQMYPzbCqizC7Oj3atMhvgnDHm8Sy5ANfXPototbPoh7vauIffeQjW
         WuDdSMBM3deyhAR56dVP1WH1Zk7D/me8ABJP6X80Cn7zVkxMLhBfcPCuGOMZkRoozS0Q
         ht3e2P0WdimLUfLxChrAC/uOO7miznrUBGjq33i7VarpwKInu8LMTnITDGoDYiTyiZuI
         qL4FjUUzhE2iiisD+giORbTm+oC2mTd0VL69jT8Bd49Ti5mV6PzU5QSp4f9eVC/+5KY0
         lSGmLWmebm9TyI5RWdYmTYV8Hm9tIGcrkefEJjKBn379kDfYUmlHSMyp7pcvpIamhWqt
         9wNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Sy/K33lBUHJW9F1YXZnX6a7C+yM4phJz6SPKK0rt22Q=;
        b=iA6s2ngLMgPiKqM5Q3NB/0iA3ve1vGaDdmhoFNLdtTzYZeAirUiP57O3/Oz086rNtf
         CHUnIDzhIKcgcugb0a+qibFHgsaQe4zPVcHJIdLufb694McNGRYccoXpr03+vD36QIiE
         QSfQhroHCnY7M5LxOKrR/lG+rxHJyp2u6Cdp49hz9gaqwXbTe5QHyqKVKXK1lrQkn6Uq
         rxEr8mUN6E3LEEr8GcKwldEZVFdxsh07McVAzODi6x4eZh27oaTW7rUeGiK7zEZrcoNA
         jv6rsZEkNvs/SQroXXjtbSlNA6GvT6EspqVr/XM3xcuxhBvDOXhfA94+iivkYcFj83Ut
         ElGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i65si2865049ywb.93.2019.03.07.06.29.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:29:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1u1d-0005DK-2Q
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:29:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tte-00066X-OK
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:21:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tte-0001IF-0h
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:21:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55296)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1ttd-0001Hl-QW; Thu, 07 Mar 2019 09:21:17 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77AF7307D90E;
	Thu,  7 Mar 2019 14:21:16 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8FDB5C1B5;
	Thu,  7 Mar 2019 14:21:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:41 +0100
Message-Id: <1551968334-18982-17-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 07 Mar 2019 14:21:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 16/29] hw/arm: Express dependencies of the
 virt machine with Kconfig
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
X-TUID: JcH40tWeOAoi

Dependencies have been determined by looking at hw/arm/virt.c

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 11 +----------
 hw/arm/Kconfig                  | 18 ++++++++++++++++++
 hw/arm/Makefile.objs            |  3 ++-
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 81c8156..79996a3 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -3,6 +3,7 @@
 # TODO: ARM_V7M is currently always required - make this more flexible!
 CONFIG_ARM_V7M=y
 
+CONFIG_ARM_VIRT=y
 CONFIG_EXYNOS4=y
 CONFIG_HIGHBANK=y
 CONFIG_INTEGRATOR=y
@@ -29,8 +30,6 @@ CONFIG_VGA=y
 CONFIG_SSI_M25P80=y
 CONFIG_ALLWINNER_EMAC=y
 CONFIG_IMX_FEC=y
-CONFIG_PLATFORM_BUS=y
-CONFIG_VIRTIO_MMIO=y
 
 CONFIG_NETDUINO2=y
 
@@ -65,9 +64,6 @@ CONFIG_IOTKIT_SYSINFO=y
 CONFIG_ARMSSE_CPUID=y
 CONFIG_ARMSSE_MHU=y
 
-CONFIG_PCI_EXPRESS=y
-CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=y
-
 CONFIG_ALLWINNER_A10_PIT=y
 CONFIG_ALLWINNER_A10_PIC=y
 CONFIG_ALLWINNER_A10=y
@@ -83,10 +79,5 @@ CONFIG_PCIE_PORT=y
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
index e162049..76cf754 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -1,6 +1,23 @@
 config ARM_VIRT
     bool
+    imply PCI_DEVICES
+    imply VFIO_AMD_XGBE
     imply VFIO_PLATFORM
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
 
 config CHEETAH
     bool
@@ -306,6 +323,7 @@ config A9MPCORE
 
 config A15MPCORE
     bool
+    select ARM_GIC
 
 config ARM11MPCORE
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 729e711..4f591ca 100644
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

