Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4414706wrh;
        Tue, 30 Apr 2019 00:34:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxtIvcT7p1PcB1dDHBG3cKb2qxI9n+qNf31BzGoFlNR1WBDcQeO905Nw2i3LKNe+Qkxrpnd
X-Received: by 2002:a1c:b782:: with SMTP id h124mr2156317wmf.5.1556609694187;
        Tue, 30 Apr 2019 00:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556609694; cv=none;
        d=google.com; s=arc-20160816;
        b=a/hofOQkPe0z2k9VpNhbQQTOMLCbaGUMrnJ7bsgUjqtBlrvtvY4zDH/K58x5Hto2pO
         Bnj12jT/uUdlTMLhalqqwAiETQrxGe+1eisO08iNnEnJWqKdCnyT5Z3ANLAXZFjfo/ie
         B4XB3tkwgqnIO3Ary21HMnl4zzJhCZPJ/lJb0rA9DTPZf04GP2k+HDAcWr9X359JY5WQ
         tGKS4KuPrv04/mPHFBJtMisdDszquoDR8wp/pTUQbKdRqE0EyzsVWL71rycxZtA0iOXH
         JN1FFmCPUc/qHMyG8/jpkZIC/qDz4lo8Crj+N/yvAVgydWUE6y7WtWr0bHfLp0Mdli3Q
         2Psw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=/CknWrOT2ZgcqCL06IVNamnFFd4+0MWt0t70rcu0/IY=;
        b=qI4KKJSl45rlnnqjYnlWIszcpUSZjZZOSeFPJuyCuh/fmbKmEeKMTwr2N6QlZ55scY
         WOMMTA9Kcrd6upcL2W6RyXP7N//rTyGI+ijfRqaaFt84doRpzCryjMgCMR+5YW5WeksN
         9+HXiOboIueK+6m/0M+DFW5j4TIMD5yxjix03Ldi04SOhzzNMry9KZ4xqs2Xqu0dYIXG
         wWQEHj87/UjvK/MQDbBP970n+yCpUZea/YrU+is05LAlnrdZp3MVaSTP/+TXH0rtIlSL
         pJTwhsil8gkKCWzYHvH06UVaWBG1j4jHQfpR1LerclN5R5GLx/wvjezZlpnA7beuDMe+
         OarQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5si994224wmf.64.2019.04.30.00.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40644 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLNHx-0006FE-4q
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:34:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN15-00085h-Pm
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:17:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN14-0005AA-Qx
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:17:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57964)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLN14-00059p-JF; Tue, 30 Apr 2019 03:17:26 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BCCFC02490D;
	Tue, 30 Apr 2019 07:17:25 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F9D7100200A;
	Tue, 30 Apr 2019 07:17:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:13:52 +0200
Message-Id: <20190430071405.16714-18-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 30 Apr 2019 07:17:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 17/30] hw/arm: Express dependencies of the
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Cedric Le Goater <clg@kaod.org>,
	John Snow <jsnow@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrew Jeffery <andrew@aj.id.au>, Peter Chubb <peter.chubb@nicta.com.au>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eHzadsJfZSIc

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

