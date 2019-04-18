Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp934719wrx;
        Thu, 18 Apr 2019 11:15:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWxuW+KLvFzHoniaytKDdlCOaTWY/vs0HDE5GrqnoezWW6PJ5jTJr9Vcqj4Q1k7WLa675H
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr4170107wmj.0.1555611315907;
        Thu, 18 Apr 2019 11:15:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555611315; cv=none;
        d=google.com; s=arc-20160816;
        b=DhAtXbtSqxj3D809+G8ugTfJIgWr10XT2gxdzC+sQ3zdBxHEnA4cnNadTQfkqmwV9L
         B4EwvCPw5pZWZmTNIseLEKBHr2mQD4hFqH6LwbHq7CvUxIhWkawLHSpDB0vGSMR7Tt0c
         ZSD9sjbkSEBrAD+ztEtf0FlrPPuNorGC6Ha7EHwffaZR/N3uadXrDHBPjb0AWNJBu/uP
         saISj9Rt8BDeCGwEuikXxDZodAPYj0WgSLdA4yqm/4FAya3vyhvj2oyt7H8Tgk75rn7v
         J+4l3KIjKn3AXzf0exTtvV0yN1be7FmuCnQH1yQnggR43unNtgopDaI0hHFqgXvJOZva
         UEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=KFoqIwmVBhuoY34UGL85E7zGLWoTaRPNTddU1iM+aZs=;
        b=S/jAJ092YtVNaSFRI4sIUpbw9icWB6jlO2v+4aomX64rBwLYGxNzrOmU/bqts8lirN
         jZL+3eo+X6eCzYEOBmUTQ4v+dN98m9cBvRmeUQH77vBJwkvLBf+W+D4hvgaYKOa/aFYK
         hSePbTr1J9nTmrtor8MOV4rlIWYFzjXcNKpHnnCgZpcs9sfb61vsPmy7rB3RHz9OaI8m
         HBlaNDxENCxrml4mkhvT7NYP3Rc6FPduGE2S3Ic6Hlq+0wLuueyMFsxNZN3Q0Z7yIFY/
         C8i5CUnr+2BG8cbQtfOwDau+MQzo5xadv6217m7tN50AaaOp1Yrpa04+5yQKcZlM1ukF
         QSZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19si2197994wrd.172.2019.04.18.11.15.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:15:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45243 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBZ4-0005Ks-Ro
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:15:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBPj-0005lE-Bh
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:05:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBPh-0003nW-Tk
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:05:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41516)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBPg-0003gO-GQ; Thu, 18 Apr 2019 14:05:32 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0BB5308A121;
	Thu, 18 Apr 2019 18:05:26 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E25711001DC8;
	Thu, 18 Apr 2019 18:05:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:53 +0200
Message-Id: <20190418180057.3593-26-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 18 Apr 2019 18:05:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-QEMU-4.1 v5 25/29] hw/arm: Express
 dependencies of the microbit / nrf51 machine with Kconfig
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
X-TUID: rmBSqG/oVLs3

Add Kconfig dependencies for the NRF51 / microbit machine.

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
index 58439c492a..708eae19e5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -347,8 +347,14 @@ config FSL_IMX6UL
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

