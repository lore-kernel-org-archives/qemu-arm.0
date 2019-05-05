Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1435672wrh;
        Sun, 5 May 2019 07:05:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzADkY38Xkp1F6RVO6Y3ocxMjq/coUGlywwfMTS4qZDIM0BNwibhHIme4rdOvxc7cB4goJp
X-Received: by 2002:adf:dbc1:: with SMTP id e1mr15388949wrj.203.1557065135487;
        Sun, 05 May 2019 07:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557065135; cv=none;
        d=google.com; s=arc-20160816;
        b=xIjs8e3FWGGX/EZ10nHNrdcJAc0RX2+XxqVIwGQ1ToPrB0Ji7dzq484yGnQTz1Q42W
         iosAhj2nO8EYp73wGLDPTldSKEcrOjXymEcr6ba5A5NJuUNLrFN6c5v9Nn94rvH58NRb
         +cmFQMgjOOqK/+GcNXAxQTOgYgo8C+l0vxf8AUNxYcoSzqjjRGO7c4YNPNtSlqFLySFO
         somhzrANf9w+DcDt2MTQsjtUkjmGCIQvgRRgYV0bjwzT/W0s1YTtYOaBsELfKhtJmBm1
         29GgYA3C4Hi2Zhp84qqqY9GpjZXzAZlPQ+pZG3BVxBDhr9NYUVSVbUB8QkqsAE5BgQOy
         R0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=JuafP5QGcMVOYV3FfvjUSNuu1rJNjKqlDcUQn0LNxlY=;
        b=ETfitX52du2c968gThaBMYaVAvlh5BeVyPgZMUeIvr0ytIO0oropmQ1yHTAPZ5btbh
         RKM5T2dzlO7RjrxiItJg/u/hgrtgP9oVVrEXlHKmOnKSOJi8lPImTYUNUm0wk5wbDMv5
         R/aBnSu0z8x21xu3r1x2H1yPTOzJuF7CMYSqnL3xBtkHVacR0/lW/9WdPdRAD1Q581W0
         4RD2ZzlGZvOTc1EVG10TssR+pOl72Hv4bzvOQZ2qpDHIh4GmF40W6UDsGhHbLGwVv6rN
         Vj5tZx5nI48zEQQxR9DdpUByLNWwAIGF3bbcrEH4IV93TMAIqfVELtb4M7jts+pI00+V
         oS3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si4886371wmj.148.2019.05.05.07.05.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:05:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41500 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHlm-0002nU-I8
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:05:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeP-0004ZJ-Vi
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:58:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeN-0004yQ-66
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44734)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHeK-0004vI-Tf; Sun, 05 May 2019 09:57:54 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9982AA405A;
	Sun,  5 May 2019 13:57:50 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89ECD60C18;
	Sun,  5 May 2019 13:57:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:57:08 +0200
Message-Id: <20190505135714.11277-23-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sun, 05 May 2019 13:57:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 22/28] hw/arm: Express dependencies of the MSF2 /
 EMCRAFT_SF2 machine with Kconfig
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XAR5B0J/L+hT

Add Kconfig dependencies for the emcraft-sf2 machine - we also
distinguish between the machine (CONFIG_EMCRAFT_SF2) and the SoC
(CONFIG_MSF2) now.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 +--
 hw/arm/Kconfig                  | 8 ++++++++
 hw/arm/Makefile.objs            | 3 ++-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index ef7dd7156a..1455d083d8 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -34,9 +34,9 @@ CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
 CONFIG_DIGIC=3Dy
 CONFIG_SABRELITE=3Dy
+CONFIG_EMCRAFT_SF2=3Dy
=20
 CONFIG_VGA=3Dy
-CONFIG_SSI_M25P80=3Dy
 CONFIG_IMX_FEC=3Dy
=20
 CONFIG_NRF51_SOC=3Dy
@@ -49,5 +49,4 @@ CONFIG_PCIE_PORT=3Dy
 CONFIG_XIO3130=3Dy
 CONFIG_IOH3420=3Dy
 CONFIG_I82801B11=3Dy
-CONFIG_MSF2=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0a1eab568b..7af94a8184 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -334,9 +334,17 @@ config FSL_IMX6UL
 config NRF51_SOC
     bool
=20
+config EMCRAFT_SF2
+    bool
+    select MSF2
+    select SSI_M25P80
+
 config MSF2
     bool
+    select ARM_V7M
     select PTIMER
+    select SERIAL
+    select SSI
=20
 config ZAURUS
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index fadd69882c..eae9f6c442 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -4,6 +4,7 @@ obj-$(CONFIG_ARM_VIRT) +=3D virt.o
 obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o
 obj-$(CONFIG_DIGIC) +=3D digic_boards.o
 obj-$(CONFIG_EXYNOS4) +=3D exynos4_boards.o
+obj-$(CONFIG_EMCRAFT_SF2) +=3D msf2-som.o
 obj-$(CONFIG_HIGHBANK) +=3D highbank.o
 obj-$(CONFIG_INTEGRATOR) +=3D integratorcp.o
 obj-$(CONFIG_MAINSTONE) +=3D mainstone.o
@@ -41,7 +42,7 @@ obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o
 obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) +=3D mps2.o
 obj-$(CONFIG_MPS2) +=3D mps2-tz.o
-obj-$(CONFIG_MSF2) +=3D msf2-soc.o msf2-som.o
+obj-$(CONFIG_MSF2) +=3D msf2-soc.o
 obj-$(CONFIG_MUSCA) +=3D musca.o
 obj-$(CONFIG_ARMSSE) +=3D armsse.o
 obj-$(CONFIG_FSL_IMX7) +=3D fsl-imx7.o mcimx7d-sabre.o
--=20
2.21.0

