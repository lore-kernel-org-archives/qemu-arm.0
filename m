Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1444543wrh;
        Sun, 5 May 2019 07:15:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzZfCZLulGXVpBKUz/V7JxXcT9Wce/xQfmFukyipS/GWLqvFLZkKh/at6471F+JEhoERmrQ
X-Received: by 2002:adf:fb07:: with SMTP id c7mr2676973wrr.177.1557065712799;
        Sun, 05 May 2019 07:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557065712; cv=none;
        d=google.com; s=arc-20160816;
        b=eBuBMBtcSvfQ+m8qG7x/V+2c7u1JBeTsRLTUih9zXNFdeKETtWt7KIIMCqEeNktNBq
         Ga1vSWvuG86Zh7Cefi65pbIczjbnKC803WlD0msVD5QrMBL1DjpBatPUlnvgtYyoqF+q
         X99GC+rjvrzYihtnMQmVtMF1qW+AgoNyd2uQeTmNbXv/K0OMeva2K+kU0Cy1xi8pkw+6
         ptMWRf2y3lfLAHevR+i93yZxWb4KWdQ14in3XSsHZrEB/J4ISrqHi/0thi8doKd14t/6
         RaX4DsZKoXr9KT7a0x9+lCQVSJpKnDDnuzdQMWDsUJHk43Z3/A0twXzJIt/Pd0uIxIoJ
         JIVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Fog20lJ/d5PEM8cDnWp77rsqH7D/76tY1XJfz1G15/U=;
        b=a3w2GFFtj7bcbxK1nLphBebIw5gLWaRfD1gHfFBFB6rApLL/B9FovZyrQx4Zbg08qi
         QgcIWTGH7XRUkrNDUSryjbJgjqHjbxcXKLEdxBP4KoOm051H4tuC1q5FNLRh2Qccqm6f
         C5vm4LBfvZPdtzMrhEI3f7aJGpa2HgdvxdAo7GNEkdrCnhSTJSs5hTUyrBmPCBXZR5g6
         oIBMSu551BW3gyOJh4xtzVZCMJI7trCfeH4UlAyRe9g25sPz2FRSd3QgaL203Q1eibCA
         H4H30XzQ3JS1IBiD6WesZE1SQCWaPkTALPFj8r1i2wBYUuQa7eqfCGfcSf/5FsxvrVNd
         JCJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d23si6528154wrc.175.2019.05.05.07.15.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:15:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHv5-0002oH-SO
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:15:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeP-0004ZC-VE
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeN-0004yt-E0
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60568)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHeN-0004x6-3E; Sun, 05 May 2019 09:57:55 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76D37307D861;
	Sun,  5 May 2019 13:57:53 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 69F8D60C47;
	Sun,  5 May 2019 13:57:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:57:10 +0200
Message-Id: <20190505135714.11277-25-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Sun, 05 May 2019 13:57:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 24/28] hw/arm: Express dependencies of the
 microbit / nrf51 machine with Kconfig
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
X-TUID: idgkXvUj3e/V

Add Kconfig dependencies for the NRF51 / microbit machine.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 +--
 hw/arm/Kconfig                  | 6 ++++++
 hw/arm/Makefile.objs            | 3 ++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 6dc388c43e..233937f394 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -35,11 +35,10 @@ CONFIG_RASPI=3Dy
 CONFIG_DIGIC=3Dy
 CONFIG_SABRELITE=3Dy
 CONFIG_EMCRAFT_SF2=3Dy
+CONFIG_MICROBIT=3Dy
=20
 CONFIG_VGA=3Dy
=20
-CONFIG_NRF51_SOC=3Dy
-
 CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
 CONFIG_FSL_IMX6UL=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4a14749792..da091ac217 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -350,8 +350,14 @@ config FSL_IMX6UL
     select IMX_I2C
     select SDHCI
=20
+config MICROBIT
+    bool
+    select NRF51_SOC
+
 config NRF51_SOC
     bool
+    select I2C
+    select ARM_V7M
=20
 config EMCRAFT_SF2
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index eae9f6c442..994e67dd0d 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -8,6 +8,7 @@ obj-$(CONFIG_EMCRAFT_SF2) +=3D msf2-som.o
 obj-$(CONFIG_HIGHBANK) +=3D highbank.o
 obj-$(CONFIG_INTEGRATOR) +=3D integratorcp.o
 obj-$(CONFIG_MAINSTONE) +=3D mainstone.o
+obj-$(CONFIG_MICROBIT) +=3D microbit.o
 obj-$(CONFIG_MUSICPAL) +=3D musicpal.o
 obj-$(CONFIG_NETDUINO2) +=3D netduino2.o
 obj-$(CONFIG_NSERIES) +=3D nseries.o
@@ -48,4 +49,4 @@ obj-$(CONFIG_ARMSSE) +=3D armsse.o
 obj-$(CONFIG_FSL_IMX7) +=3D fsl-imx7.o mcimx7d-sabre.o
 obj-$(CONFIG_ARM_SMMUV3) +=3D smmu-common.o smmuv3.o
 obj-$(CONFIG_FSL_IMX6UL) +=3D fsl-imx6ul.o mcimx6ul-evk.o
-obj-$(CONFIG_NRF51_SOC) +=3D nrf51_soc.o microbit.o
+obj-$(CONFIG_NRF51_SOC) +=3D nrf51_soc.o
--=20
2.21.0

