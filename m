Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1440388wrh;
        Sun, 5 May 2019 07:10:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNHgD+2c10iGYPnyA2v1slJAXLLpGImJEPL2VjA2ldQAR3SdnJxxoSEf74Cqmg1gdfTGdb
X-Received: by 2002:adf:d081:: with SMTP id y1mr8935245wrh.283.1557065430066;
        Sun, 05 May 2019 07:10:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557065430; cv=none;
        d=google.com; s=arc-20160816;
        b=v8uL8Abd73xZCA1HM/uwnG9zeOwVhpui0/ih37oLsII/dyDVmHkPtQfcGMK00Yx+U4
         FbGNvF94La8qwI1S3DEQqBKoVL/ZkGPCKS0i+2PpdWDo9qG0dmJtUMEgkgH8ha116RND
         oM/N5vq+4ekOVzjo/h/cBrmOYj9PCUut2u7Y0WO0TwMJZwwd2ZAaeppuf4MRdupGybaO
         6DRNcoG4uc60fDGMSIi5djdtFh5YrLq8zJUYHFXF602j3b89eSmLd2GJDuMHcQu5VqBQ
         mT8vOIU8PMJUWBPCvnUlbVwXo5k18040VjoZ/cPg+L82RgPnOsiZEQYQ12/4NnEjsyYg
         SSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=/CknWrOT2ZgcqCL06IVNamnFFd4+0MWt0t70rcu0/IY=;
        b=l55ltty4ro/5hXnlwSavdihs6LpmzI/y3FdDmaBd5Az3/lT2nOcvSqhLtCSZVTH9+M
         tuDjLx5pY2076I7ZnVcWRgllGjY8zy9M9FvyJl7kkcan5pEaMA36aonbgJhVnbP6gYC4
         BlR0XPBJZDKoBDu8BsArtUi9I0sT48PvAZaCLog4N7t3R3vkzHOtlhOBTYPzJDVJWzSi
         hVaMdrWjHMiYftyMxsLpe8HK2YCIBiLqDvPP9jjttWqY1cvISm9I9UzW2yS8Arz78BXy
         0rTYbSqtNB72wMF6aIAaBDFN2lr9TL9b/dgZ5PtTm3lIgQsB0f8bscBK9Sq0mNPJwP4l
         g3jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si5766184wrj.22.2019.05.05.07.10.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:10:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHqX-0006aT-3f
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:10:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeC-0004LX-Jy
	for qemu-devel@nongnu.org; Sun, 05 May 2019 09:57:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeB-0004qI-F1
	for qemu-devel@nongnu.org; Sun, 05 May 2019 09:57:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36524)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHe8-0004nr-RG; Sun, 05 May 2019 09:57:41 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 294C7308338E;
	Sun,  5 May 2019 13:57:40 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D46360C18;
	Sun,  5 May 2019 13:57:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:57:01 +0200
Message-Id: <20190505135714.11277-16-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Sun, 05 May 2019 13:57:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 15/28] hw/arm: Express dependencies of the virt
 machine with Kconfig
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IvsnpJxKx6to

Dependencies have been determined by looking at hw/arm/virt.c

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/aarch64-softmmu.mak |  1 -
 default-configs/arm-softmmu.mak     | 11 +----------
 hw/arm/Kconfig                      | 19 +++++++++++++++++++
 hw/arm/Makefile.objs                |  3 ++-
 4 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch6=
4-softmmu.mak
index 4ea9add003..313490fb38 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -9,4 +9,3 @@ CONFIG_DPCD=3Dy
 CONFIG_XLNX_ZYNQMP=3Dy
 CONFIG_XLNX_ZYNQMP_ARM=3Dy
 CONFIG_XLNX_VERSAL=3Dy
-CONFIG_ARM_SMMUV3=3Dy
diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 2580584281..f440a2b1cd 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -6,6 +6,7 @@ CONFIG_ARM_V7M=3Dy
 # CONFIG_PCI_DEVICES=3Dn
 # CONFIG_TEST_DEVICES=3Dn
=20
+CONFIG_ARM_VIRT=3Dy
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
 CONFIG_INTEGRATOR=3Dy
@@ -32,8 +33,6 @@ CONFIG_VGA=3Dy
 CONFIG_SSI_M25P80=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
-CONFIG_PLATFORM_BUS=3Dy
-CONFIG_VIRTIO_MMIO=3Dy
=20
 CONFIG_NETDUINO2=3Dy
=20
@@ -68,9 +67,6 @@ CONFIG_IOTKIT_SYSINFO=3Dy
 CONFIG_ARMSSE_CPUID=3Dy
 CONFIG_ARMSSE_MHU=3Dy
=20
-CONFIG_PCI_EXPRESS=3Dy
-CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=3Dy
-
 CONFIG_ALLWINNER_A10_PIT=3Dy
 CONFIG_ALLWINNER_A10_PIC=3Dy
 CONFIG_ALLWINNER_A10=3Dy
@@ -86,10 +82,5 @@ CONFIG_PCIE_PORT=3Dy
 CONFIG_XIO3130=3Dy
 CONFIG_IOH3420=3Dy
 CONFIG_I82801B11=3Dy
-CONFIG_ACPI=3Dy
-CONFIG_ARM_VIRT=3Dy
-CONFIG_SMBIOS=3Dy
-CONFIG_GPIO_KEY=3Dy
 CONFIG_MSF2=3Dy
-CONFIG_FW_CFG_DMA=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 95ac0b540e..2b63adb667 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -1,6 +1,24 @@
 config ARM_VIRT
     bool
+    imply PCI_DEVICES
+    imply TEST_DEVICES
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
=20
 config CHEETAH
     bool
@@ -299,6 +317,7 @@ config A9MPCORE
=20
 config A15MPCORE
     bool
+    select ARM_GIC
=20
 config ARM11MPCORE
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 729e711b87..4f591ca487 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -1,4 +1,5 @@
-obj-y +=3D boot.o sysbus-fdt.o
+obj-y +=3D boot.o
+obj-$(CONFIG_PLATFORM_BUS) +=3D sysbus-fdt.o
 obj-$(CONFIG_ARM_VIRT) +=3D virt.o
 obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o
 obj-$(CONFIG_DIGIC) +=3D digic_boards.o
--=20
2.21.0

