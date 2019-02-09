Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp292210wrq;
        Fri, 8 Feb 2019 22:40:37 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZZsGcP2Ng2Sxh745YrVWFF6qunr7Wdxn+AmCsC4+4SOTUDIeyo04ylymwkxymoUCkogzZH
X-Received: by 2002:a1c:e3d7:: with SMTP id a206mr1595582wmh.12.1549694436842;
        Fri, 08 Feb 2019 22:40:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549694436; cv=none;
        d=google.com; s=arc-20160816;
        b=yTHCnrLHR/sjog4X7eGeiSvxKqrli3STyXVmZ1PnTbzSWOgZVLmefVZxk0bgnc426s
         OZx9E+YALMvJdOGSDcmqpKCh9fYW9U0ksE44BBK0ajL6h7R9KAemo7EZnzqM4z4xC1fi
         xaaQ8xlTETSzdEfwKln+PzSdU1qOAsjUQyjgQZyXRaszDjJN3oyc9ppa3f6/oDRBR61p
         njTVZZQX994qJmy2sIyINb7rxZZQ95XiCRqrrTZIxD4i//IKlUUux5CzI13DHN6A21CD
         c+8HsBteyhNW8nFpadahTGa3UE161HLTX3GiwjIBw7OFCmR6VRJmGHHu8j34fLR1IzHv
         aD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=4juNGtcQLmb64grwir+sJ9LIm6+ZsgkVHbuEoNd8voc=;
        b=do/FQhXEX5uUE3aRzat7aMkrP7BQ9/FDHnuWCL2iRTzpJtymPV4ju+xNL2a+sFCBQ8
         y9plH1fP9rWh+hkDaXIVTkOo7ABy6UV1xWHiZgWu6pvH6OrG3SaUlsIEDsR0qFePtszs
         Xn20vC+PL5USwIdcgmBIc635yhJ6+pYuh/WYbA+uG3t6JJ/F8AJr+mUdrDeChOxlb+3s
         cysrFtPRF9u6V2E79VBfbfkxHeHjO419S+gl3D8H1Ogaku8LNPahWwxkO9Ondlf/RYZ6
         gyhYIXZmNwBBKCXWVwOsMuwfj0G3h6XSL1T2Zbd6NmPehh6o9Rfzw8XUSe2XxEkJ5K/Z
         GBdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si2431981wrm.265.2019.02.08.22.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:40:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41434 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMJX-0003ub-UG
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:40:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIv-0003W3-9p
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:39:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIs-0003Ns-LW
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:39:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33004)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMIs-0003EH-Ap; Sat, 09 Feb 2019 01:39:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 73B8AC04D319;
	Sat,  9 Feb 2019 06:39:39 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F002B54505;
	Sat,  9 Feb 2019 06:39:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:04 +0100
Message-Id: <1549694366-1284-4-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sat, 09 Feb 2019 06:39:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 03/25] hw/arm: Express dependencies of
 integratorcp with Kconfig
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
Cc: qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uumtfFc9XFFD

This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 11 +----------
 hw/arm/Kconfig                  |  9 +++++++++
 hw/display/Kconfig              |  1 +
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 59734ee..2033050 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -7,6 +7,7 @@ CONFIG_PCI_DEVICES=3Dy
=20
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
+CONFIG_INTEGRATOR=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -31,7 +32,6 @@ CONFIG_ADS7846=3Dy
 CONFIG_MAX111X=3Dy
 CONFIG_SSI_SD=3Dy
 CONFIG_SSI_M25P80=3Dy
-CONFIG_SMC91C111=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
 CONFIG_FTGMAC100=3Dy
@@ -49,15 +49,8 @@ CONFIG_A15MPCORE=3Dy
=20
 CONFIG_NETDUINO2=3Dy
=20
-CONFIG_ARM_TIMER=3Dy
-CONFIG_PL011=3Dy
-CONFIG_PL022=3Dy
-CONFIG_PL031=3Dy
 CONFIG_PL041=3Dy
-CONFIG_PL050=3Dy
 CONFIG_PL080=3Dy
-CONFIG_PL110=3Dy
-CONFIG_PL181=3Dy
 CONFIG_PL190=3Dy
 CONFIG_PL330=3Dy
 CONFIG_CADENCE=3Dy
@@ -119,8 +112,6 @@ CONFIG_VFIO_XGMAC=3Dy
 CONFIG_VFIO_AMD_XGBE=3Dy
=20
 CONFIG_SDHCI=3Dy
-CONFIG_INTEGRATOR=3Dy
-CONFIG_INTEGRATOR_DEBUG=3Dy
=20
 CONFIG_ALLWINNER_A10_PIT=3Dy
 CONFIG_ALLWINNER_A10_PIC=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 984de8a..c022b8d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -33,6 +33,15 @@ config HIGHBANK
=20
 config INTEGRATOR
     bool
+    select ARM_TIMER
+    select INTEGRATOR_DEBUG
+    select PL011 # UART
+    select PL031 # RTC
+    select PL050 # keyboard/mouse
+    select PL110 # pl111 LCD controller
+    select PL181 # display
+    select PCI
+    select SMC91C111
=20
 config MAINSTONE
     bool
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index ee3acd9..34c8c12 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -21,6 +21,7 @@ config JAZZ_LED
=20
 config PL110
     bool
+    select FRAMEBUFFER
=20
 config SII9022
     bool
--=20
1.8.3.1

