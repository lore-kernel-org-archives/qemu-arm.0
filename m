Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4411783wrh;
        Tue, 30 Apr 2019 00:31:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqze/ZA6YCnZdNknUVTqScEcPYCGM2M/OtTkG4bsnq0PiRv/8btFFzMG3DxJ3ZcJH8zP+9VQ
X-Received: by 2002:a1c:f910:: with SMTP id x16mr2013396wmh.114.1556609463677;
        Tue, 30 Apr 2019 00:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556609463; cv=none;
        d=google.com; s=arc-20160816;
        b=Eeowf6+vIWREJ/Jzvk5JtPYmhAr2FW2sz5r43VosnaysOWqO9aKsC0bzd0A/3QW53Y
         0S1d4xeHoJelVmOaFRToFTNmGPloDDiKBJo3RH2i0zXkNwuMvqj9STF/na4NIjZP17oH
         4QuMSyEZWpntzBkuX+o8i2UloaTu4vDgE7y/Vwpus7JjXegqjY7ehXuiaod9PCQfIizY
         r90ymsiJm2vG2TDzT3V/UWhQt4BhKRGLc5oOjW6Apd0BELq3d7aN3ZDGRBxHHhuWA4qD
         AkKRX+kp8wZIn3P49qEG2W2X+v91nhEo0KhlyUGlKdhfAkyZbYuu3FMSATWZxfD18xRK
         5hkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=aqKW7xeR43VOnFHPOYOBO0Se/6WOa//PtW3rj/v58jo=;
        b=JMui58YySEpYqVJkMB2o0NJhPQ08a4TLKDDzDbNE5kx1/N0dn0KrqvPKo9idG0l78Z
         WyaANJq32f9KryMz1AJh4AYEhY28gVQM2SqVFo7jG8+ZYEh44WYfikifqP8thUlmqmaJ
         f3v1brN0Nad6y8rzS9Gcjpo2kFVpEbipgbibBXocotUQeQkGOPZ6+lar6sqkRcbwhM+A
         +JM4s07AqVinbHlMpxnmHXeRpp4wWHyYQrrQ+PENRTas0qNAYNCppzAMtiZPOG9fk0PW
         aavJJufVWc0jL1TG4fuiY5Xj62N0+eSxWBV0Tbd9O5KyKH+YVtGXpkWgZBNkZLGU9RSj
         rjig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si19477289wrv.161.2019.04.30.00.31.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:31:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLNEE-0003Dw-Oo
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:31:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN27-0000aU-OS
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:18:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN26-0005fk-Nb
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:18:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52294)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLN26-0005fN-Fh; Tue, 30 Apr 2019 03:18:30 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 809FD30B9335;
	Tue, 30 Apr 2019 07:18:29 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E47E310021B5;
	Tue, 30 Apr 2019 07:18:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:13:58 +0200
Message-Id: <20190430071405.16714-24-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 30 Apr 2019 07:18:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 23/30] hw/arm: Express dependencies of
 sabrelite with Kconfig
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
X-TUID: YQX7LhVXcbYb

Add Kconfig dependencies for the Sabrelite / iMX6 machine.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 4 +---
 hw/arm/Kconfig                  | 9 +++++++++
 hw/arm/Makefile.objs            | 3 ++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 76508e3910..ef7dd7156a 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -33,6 +33,7 @@ CONFIG_NETDUINO2=3Dy
 CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
 CONFIG_DIGIC=3Dy
+CONFIG_SABRELITE=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_SSI_M25P80=3Dy
@@ -40,13 +41,10 @@ CONFIG_IMX_FEC=3Dy
=20
 CONFIG_NRF51_SOC=3Dy
=20
-CONFIG_FSL_IMX6=3Dy
 CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
 CONFIG_FSL_IMX6UL=3Dy
=20
-CONFIG_IMX_I2C=3Dy
-
 CONFIG_PCIE_PORT=3Dy
 CONFIG_XIO3130=3Dy
 CONFIG_IOH3420=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index abf2af0967..0a1eab568b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -177,6 +177,11 @@ config REALVIEW
     select DS1338 # I2C RTC+NVRAM
     select USB_OHCI
=20
+config SABRELITE
+    bool
+    select FSL_IMX6
+    select SSI_M25P80
+
 config STELLARIS
     bool
     select ARM_V7M
@@ -290,6 +295,10 @@ config FSL_IMX31
=20
 config FSL_IMX6
     bool
+    select A9MPCORE
+    select IMX
+    select IMX_FEC
+    select IMX_I2C
=20
 config ASPEED_SOC
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 4f591ca487..fadd69882c 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -22,6 +22,7 @@ obj-$(CONFIG_COLLIE) +=3D collie.o
 obj-$(CONFIG_VERSATILE) +=3D versatilepb.o
 obj-$(CONFIG_VEXPRESS) +=3D vexpress.o
 obj-$(CONFIG_ZYNQ) +=3D xilinx_zynq.o
+obj-$(CONFIG_SABRELITE) +=3D sabrelite.o
=20
 obj-$(CONFIG_ARM_V7M) +=3D armv7m.o
 obj-$(CONFIG_EXYNOS4) +=3D exynos4210.o
@@ -36,7 +37,7 @@ obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zynqmp.o xlnx-z=
cu102.o
 obj-$(CONFIG_XLNX_VERSAL) +=3D xlnx-versal.o xlnx-versal-virt.o
 obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
-obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o
+obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o
 obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) +=3D mps2.o
 obj-$(CONFIG_MPS2) +=3D mps2-tz.o
--=20
2.21.0

