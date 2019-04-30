Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4405402wrh;
        Tue, 30 Apr 2019 00:21:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9g8Fyxs2II0x+ORdJ2MztYMKGs/ErNj6ADW2kp2cwdSMw4JkXBreqwr5BfzLJ0I9l0J7Y
X-Received: by 2002:a1c:f413:: with SMTP id z19mr2070799wma.71.1556608873559;
        Tue, 30 Apr 2019 00:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556608873; cv=none;
        d=google.com; s=arc-20160816;
        b=ay2q6MAr10Fgk38EnJl3G76kRlpHAFaSijTHntMlw58RpY7q3uXi24S67degO9DCq7
         yyPv3aqj6Z95WsyygWd7tggmpXc26vU3KjDXApMJHj2co9JJQXZF7PsmnX9EISaMxALj
         ugAUdBEWisI673EciopiSl9KJkmdrTDok8rq4U7e5hXues2jz8hTpp5HD6+JSPQVZY2h
         1eYw5+Q/1A9HqPKh/GhYCUZ4M/QjzB9LWsqr0ECl3+sJhSNVFzixKM7LI6DICnzqmSKa
         dYH2+t1buB6x9iPtyGpRFYAz5stNWzRC8U0BxvSKM12hhllSE9B9jrnYiT5ceLvdpwni
         r/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Ib+QgDF9UFzx6yYhshD21WP+BFyo2CKcigd/j5hDGVU=;
        b=eK7TndBCGeYQCx4/ITlmCEtIjf3yC+uth2z7Ub8zzNOMh0sNfblxkmAxw3F/X1QuvF
         BKcS6Y3CqMYrWLRJNEg7KxXHyxoBvCl6iZbvL3fjtyeaOaFW2DdKerkDmdtC7G0ubjDq
         Sy7MFS1jzKOTP5hQ3hwMx/ASYvPYowXGyL4lBFtVIdM6pxWd5LB+UhBqpK+q1tlcUpi0
         RruvjzLjQ5+7uZGJL/77wnrkG/qA6vHX3ddllgZP7s6hsXVcG1M0rtfOepst+pHybM2Q
         F2eRgSqHhjz8LYq1+IlKkMyqicPNZ6AL4ociE/WttRdziiI9Vs9p9EUi4ALv18n2G16k
         oZDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t124si1046550wmb.11.2019.04.30.00.21.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:21:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLN4i-0002gI-Gs
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:21:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLMz5-00069P-7l
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:15:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLMz3-0004Qd-3B
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:15:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51414)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLMz1-0004PR-Gb; Tue, 30 Apr 2019 03:15:20 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FD82C057E3A;
	Tue, 30 Apr 2019 07:15:15 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DCC8100200A;
	Tue, 30 Apr 2019 07:15:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:13:40 +0200
Message-Id: <20190430071405.16714-6-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 30 Apr 2019 07:15:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 05/30] hw/arm: Express dependencies of the
 exynos machines with Kconfig
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
X-TUID: kqyxVplj3RQR

Add Kconfig dependencies for the Exynos-related boards (nuri and
smdkc210).
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 17 ++++++-----------
 hw/arm/Kconfig                  | 10 ++++++++++
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 613d19a06d..2a11e76cc7 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -1,8 +1,14 @@
 # Default configuration for arm-softmmu
=20
+# TODO: ARM_V7M is currently always required - make this more flexible!
+CONFIG_ARM_V7M=3Dy
+
 CONFIG_PCI=3Dy
 CONFIG_PCI_DEVICES=3Dy
 CONFIG_PCI_TESTDEV=3Dy
+
+CONFIG_EXYNOS4=3Dy
+
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
 CONFIG_ECC=3Dy
@@ -26,7 +32,6 @@ CONFIG_ADS7846=3Dy
 CONFIG_MAX111X=3Dy
 CONFIG_SSI_SD=3Dy
 CONFIG_SSI_M25P80=3Dy
-CONFIG_LAN9118=3Dy
 CONFIG_SMC91C111=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
@@ -36,21 +41,15 @@ CONFIG_PFLASH_CFI01=3Dy
 CONFIG_PFLASH_CFI02=3Dy
 CONFIG_MICRODRIVE=3Dy
 CONFIG_USB_MUSB=3Dy
-CONFIG_USB_EHCI_SYSBUS=3Dy
 CONFIG_PLATFORM_BUS=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
=20
 CONFIG_ARM11MPCORE=3Dy
-CONFIG_A9MPCORE=3Dy
 CONFIG_A15MPCORE=3Dy
=20
-CONFIG_ARM_V7M=3Dy
 CONFIG_NETDUINO2=3Dy
=20
-CONFIG_ARM_GIC=3Dy
 CONFIG_ARM_TIMER=3Dy
-CONFIG_ARM_MPTIMER=3Dy
-CONFIG_A9_GTIMER=3Dy
 CONFIG_PL011=3Dy
 CONFIG_PL022=3Dy
 CONFIG_PL031=3Dy
@@ -61,11 +60,9 @@ CONFIG_PL080=3Dy
 CONFIG_PL110=3Dy
 CONFIG_PL181=3Dy
 CONFIG_PL190=3Dy
-CONFIG_PL310=3Dy
 CONFIG_PL330=3Dy
 CONFIG_CADENCE=3Dy
 CONFIG_XGMAC=3Dy
-CONFIG_EXYNOS4=3Dy
 CONFIG_PXA2XX=3Dy
 CONFIG_BITBANG_I2C=3Dy
 CONFIG_FRAMEBUFFER=3Dy
@@ -73,7 +70,6 @@ CONFIG_XILINX_SPIPS=3Dy
 CONFIG_ZYNQ_DEVCFG=3Dy
=20
 CONFIG_ARM11SCU=3Dy
-CONFIG_A9SCU=3Dy
 CONFIG_DIGIC=3Dy
 CONFIG_MARVELL_88W8618=3Dy
 CONFIG_OMAP=3Dy
@@ -123,7 +119,6 @@ CONFIG_VERSATILE_I2C=3Dy
 CONFIG_PCI_EXPRESS=3Dy
 CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=3Dy
=20
-CONFIG_SDHCI=3Dy
 CONFIG_INTEGRATOR=3Dy
 CONFIG_INTEGRATOR_DEBUG=3Dy
=20
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index d298fbdc89..acd07b2add 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -8,7 +8,13 @@ config DIGIC
=20
 config EXYNOS4
     bool
+    select A9MPCORE
+    select I2C
+    select LAN9118
+    select PL310 # cache controller
     select PTIMER
+    select SDHCI
+    select USB_EHCI_SYSBUS
=20
 config HIGHBANK
     bool
@@ -104,6 +110,10 @@ config ZAURUS
=20
 config A9MPCORE
     bool
+    select A9_GTIMER
+    select A9SCU       # snoop control unit
+    select ARM_GIC
+    select ARM_MPTIMER
=20
 config A15MPCORE
     bool
--=20
2.21.0

