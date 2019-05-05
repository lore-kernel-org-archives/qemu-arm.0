Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1446370wrh;
        Sun, 5 May 2019 07:17:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwpJTdSwqo78PShXaM6C+jfx5G4WM6FL+Yzvq5AgvMzAH6vKhY3KBdIxpZRyKqdbIl2ZISk
X-Received: by 2002:adf:9042:: with SMTP id h60mr7131669wrh.248.1557065837073;
        Sun, 05 May 2019 07:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557065837; cv=none;
        d=google.com; s=arc-20160816;
        b=dSS366uoGcRPXVf5cZtom+V5svSIouhCWYpMHEJsono2CwmL7kHLZR8fagDZSZsOGn
         GVDpWDjHUkjgvMqtt20AFbDG4RtrK/bTelB2wpGeA43Ot33Q28lhHa5jW9H6LJdUaWsG
         CDl1cxhq8LwR+7jejjNJU5rs0B56/qEw1SKRO+GgU8qseigPgZHRDP+cXipk6sQ5RjJg
         CEU1S9rUOk29+my+3oAdf0YsNEHLIvDRwbu++tlDtNRzoTBa/Y34hPoKM2cGXJF8OK1U
         x9kn09ZH+IZ8C3Fh4COEnQ0Ud8+vDZQ0klnliyBhkiHraaqcAZDTqb51KPR2H/GecgTv
         n6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=RqAodsi+P4u1IFuSQ1d1OCGAHfYLlTU9clrbSTJ2C4E=;
        b=eGkyQr9pw34m0bgWrnoo4ozpfG4wgN/9UJNcFolvJ2BY1ejtYy37EvJ5roStb5myOg
         extY4X1IB89Xw49aCiBf+0FWb0mSuYOIcMoExBhUStgH5x2CioQ2lyhFRuIij+i5+h5s
         DaHSr02+tPqn2fERqmxa5dlTJDcCV5JNl1YROe6vcw1dvHZ4KOujQLsv2h9BFhV0tExk
         IEGubWJAohGSyZMEOm6neffx7UXi/i8I9dr2L1+8IffOIDzik/+JPbDg3igrZyE5OV72
         oZJnwou+iiff4+oMl4Vps6W3idUtAI6WcXbHPq4wDy5pi+vnrDh4XYmlsg9gg1UY41Is
         UUfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x65si5090317wmf.174.2019.05.05.07.17.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:17:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHx6-0004ez-23
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:17:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeP-0004ZH-Vd
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeN-0004yo-Cw
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60250)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHeM-0004vv-3s; Sun, 05 May 2019 09:57:55 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0CA8D81DF6;
	Sun,  5 May 2019 13:57:52 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F41B160C47;
	Sun,  5 May 2019 13:57:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:57:09 +0200
Message-Id: <20190505135714.11277-24-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sun, 05 May 2019 13:57:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 23/28] hw/arm: Express dependencies of the
 remaining IMX boards with Kconfig
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
X-TUID: NsSWqTcOILni

IMX25, IMX7 and IMX6UL were still missing the Kconfig dependencies.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  2 --
 hw/arm/Kconfig                  | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 1455d083d8..6dc388c43e 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -37,7 +37,6 @@ CONFIG_SABRELITE=3Dy
 CONFIG_EMCRAFT_SF2=3Dy
=20
 CONFIG_VGA=3Dy
-CONFIG_IMX_FEC=3Dy
=20
 CONFIG_NRF51_SOC=3Dy
=20
@@ -49,4 +48,3 @@ CONFIG_PCIE_PORT=3Dy
 CONFIG_XIO3130=3Dy
 CONFIG_IOH3420=3Dy
 CONFIG_I82801B11=3Dy
-CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7af94a8184..4a14749792 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -285,6 +285,10 @@ config XLNX_VERSAL
=20
 config FSL_IMX25
     bool
+    select IMX
+    select IMX_FEC
+    select IMX_I2C
+    select DS1338
=20
 config FSL_IMX31
     bool
@@ -299,6 +303,7 @@ config FSL_IMX6
     select IMX
     select IMX_FEC
     select IMX_I2C
+    select SDHCI
=20
 config ASPEED_SOC
     bool
@@ -324,12 +329,26 @@ config MPS2
=20
 config FSL_IMX7
     bool
+    imply PCI_DEVICES
+    imply TEST_DEVICES
+    select A15MPCORE
+    select PCI
+    select IMX
+    select IMX_FEC
+    select IMX_I2C
+    select PCI_EXPRESS_DESIGNWARE
+    select SDHCI
=20
 config ARM_SMMUV3
     bool
=20
 config FSL_IMX6UL
     bool
+    select A15MPCORE
+    select IMX
+    select IMX_FEC
+    select IMX_I2C
+    select SDHCI
=20
 config NRF51_SOC
     bool
--=20
2.21.0

