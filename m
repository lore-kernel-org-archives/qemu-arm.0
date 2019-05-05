Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1435310wrh;
        Sun, 5 May 2019 07:05:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwHzYsQVvXAYJdsTgDj4S/ojdwnBFLXj3kdjKZBJ3utd43xOAVePElJuxyD2cwC7HW4eBvK
X-Received: by 2002:a1c:ca08:: with SMTP id a8mr12845133wmg.5.1557065114394;
        Sun, 05 May 2019 07:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557065114; cv=none;
        d=google.com; s=arc-20160816;
        b=djoGHkWOW9VxcMaCdfwopESJ0VOWTXsLiM/6P0OxKJd/Kse8bzsiwpIWdFHzJYMlS1
         MKVXRu+Bl0VKN7xqTRcbnGcnhY4ylTOvVwzlIWCw1Wt83dIQFiCvGjB4Emzpc0v7TZT3
         dXy3zZQ34b1YJzxxM3/vr9JXcVJCjuFC8TL0dS2c5IuWKgbMdKlocuVrrzAJCYqcrVld
         cBtOQlR2PP2KSNti+SwcyGwPNjcSfXZMLgk8NQNKCk811IrpWyuJP85yhCxvkpOt1VEr
         DB3+xgs/ctgeygHOEPxLT2fjmmQ1ZIqSdfGv7xZXzcbZ39+DNw8iBlMRu/D1ugN2c8/z
         J7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=aqKW7xeR43VOnFHPOYOBO0Se/6WOa//PtW3rj/v58jo=;
        b=Vx7KDMFdDkoHpYzZuBvcgOCSOsszPAkCt1whhLIstPzwT2Ssf3QbAGN1WaTHZ66xm4
         yhZE21givfgRV3JiAe3mAboVB6j/g4foapcysVly+Yu9HRJL/8r1Dl9Yo7uJTzDScEpv
         zryFj9UwZogcHEhshXscCmO8JKkZhT0qqbiZx6AjsIqu3vJktDfZ1ZzWwx86I37AithD
         ojFfSfnFamHoIsZpzahPyOtSX1ZuHxTFkSwfXFOQoPSLz4vssRgiP0+AA1DJwCQk9cTZ
         4ubBL88mC7JrAVkDs1q5PtwK2x42ljNO3LfljJwd4VHDOcC+GgxqxZF+scd1LBO3lu4l
         0riA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si5577683wrm.24.2019.05.05.07.05.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:05:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHlR-0002Tf-Di
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:05:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeM-0004WL-Bu
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeK-0004wA-8z
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36606)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHeI-0004uI-BN; Sun, 05 May 2019 09:57:50 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EDE7307EAB3;
	Sun,  5 May 2019 13:57:49 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20AE860C18;
	Sun,  5 May 2019 13:57:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:57:07 +0200
Message-Id: <20190505135714.11277-22-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Sun, 05 May 2019 13:57:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 21/28] hw/arm: Express dependencies of sabrelite
 with Kconfig
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
X-TUID: 7n2b1NJRCaTg

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

