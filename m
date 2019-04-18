Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp938436wrx;
        Thu, 18 Apr 2019 11:19:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0CryNno9mTMZ7K+k1nmQ8XHvetf42hVYVg5oPxDkHfQh6F+/9gbLKLjazeiFmZFRmQbRG
X-Received: by 2002:a5d:4446:: with SMTP id x6mr61575071wrr.147.1555611549305;
        Thu, 18 Apr 2019 11:19:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555611549; cv=none;
        d=google.com; s=arc-20160816;
        b=umt43I4eIuyhS5gB6PKUSxnVqr8vzBF6gbU/oNE5qHntMYXEYgLvi77HdbrOLkV7N7
         2nIOiyThpJbM3YkKuWCcwXKgEIRs036+SuuHRSXmEFpQcpgE9py3FNtZ2QsupwvFo0pi
         XjFBZId6R7kxqyvv470Kht9Flm/JL8rkZbppj3r67fA+b59PdT0315jpHoJ9FX4GzJ6K
         vkLb4ggG1ZkQTQusso2Y7nNRyyfcsWW+4ZoyoBTWqOu+hS7cMC1FpfWr+XAaKTwv/aNb
         gq89eXek0Xw6l74e5Kj7u9ppjKRcLqMv+Ktcdww2dTF0cNDVZRbtWAY9AKSKkH0SOfWg
         N2mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=4C2QnbaXhuKOThuwq/ti6p8Cd/433pimSj+ZTwfmj14=;
        b=uCA8R7QMTFcQnhy1RcHKNgvieGtVfZNBBfMPM6elMrXAsuZBfPKylTTpNEC7OS2QuG
         IQPVcFfKKLneHHYh+5rJqpfEEHhBFSy/d6ALRM49JFk0zK7lf69wkiPyXz8IZa7S0kh+
         /2rvLa3GvTgnIYQGFpDA76aSfIvq0wMACGhEOD5b4E/qXGCAHf/5+YEsatLDMSrwtu67
         F8xnPF5QA/1gI1ydt4sVbM46PPX0XbzaQJPjMWIeiJRyVso690cCSWWUr+6xgJjXksbL
         GPwv+ndbAMrCuDt9VoXpvdeW6AYYMm4TfRz2YKtmuBM843mLmowJ3e/fn88zO5AFel+W
         3B/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si1969335wmb.24.2019.04.18.11.19.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:19:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBcq-0008Mc-A0
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:19:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBOt-000553-G9
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:04:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBOr-0003HM-Js
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:04:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40666)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBOp-0003Dp-L5; Thu, 18 Apr 2019 14:04:41 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E891A30944B6;
	Thu, 18 Apr 2019 18:04:36 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42BE51001DC8;
	Thu, 18 Apr 2019 18:04:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:50 +0200
Message-Id: <20190418180057.3593-23-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 18 Apr 2019 18:04:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-QEMU-4.1 v5 22/29] hw/arm: Express
 dependencies of sabrelite with Kconfig
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
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Cedric Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>, Philippe Mathieu-Daude <f4bug@amsat.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nlKzBP6xlzhc

Add Kconfig dependencies for the Sabrelite / iMX6 machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 4 +---
 hw/arm/Kconfig                  | 7 +++++++
 hw/arm/Makefile.objs            | 3 ++-
 3 files changed, 10 insertions(+), 4 deletions(-)

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
index 059fb8282c..065c7acf1b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -177,6 +177,10 @@ config REALVIEW
     select DS1338 # I2C RTC+NVRAM
     select USB_OHCI
=20
+config SABRELITE
+    bool
+    select FSL_IMX6
+
 config STELLARIS
     bool
     select ARM_V7M
@@ -289,6 +293,9 @@ config FSL_IMX31
=20
 config FSL_IMX6
     bool
+    select A9MPCORE
+    select IMX
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

