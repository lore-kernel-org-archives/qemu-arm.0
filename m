Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7200460wrx;
        Thu, 7 Mar 2019 06:22:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxy+evVM3IxyvRjFIVgWJfzIOPiVpwJdZ8tGubTsRf9WO83oxOPdfUqH01+kxeBYjCmCYfU
X-Received: by 2002:a25:2f91:: with SMTP id v139mr11390545ybv.407.1551968579132;
        Thu, 07 Mar 2019 06:22:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551968579; cv=none;
        d=google.com; s=arc-20160816;
        b=jbVeDHpgnFMwv3TQ0eNnuZJIt/sBa1NXOkZWa+ISvvcNOvmnn0Ih3BB2d6w2FfGpL8
         iZN9QSMYXu/JxmIXYuUHY4s3cN3bvk6Br1GA9pObDvZS3vTsQW+SwxgI76YoY4mfZOjq
         p7VsB8asNna7Xy8AbZFd62SflVeqQgxTI+x4kxW4l3OXp7XK8s3pGI85HlrPi9iEVz+D
         XI0rsFGltKeMzOHR4exHgbAky/KiZB/PABXSg5J47PYENabRKadenQ9Wy8tHDWNgEHMf
         NgW6E5lE58R1d0DUQH6kbhAGdY/ej0534STKPdp7mR7aA5RIwzd4n9f1ykXhlEBds83l
         GEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3MLndHpGdmtp42mxp66FIkGNvTHPa9Cilb3fl+3NQ0g=;
        b=mzmcrfNZmc4wHuk8C6JEwGzpTqN62E/9EwkosqOaMuscDIAowY/cxtnzIm/hVAk/Do
         gI19wmh6FZcDogHBb0iNThFgtqYnKQ1yyOdKB1XOnTWRmH0lJKd+NuHszyWVeYql9Z7D
         i6LN0cqJi0KlW3ydLYtdHD6S/X+6SwcBqUwgsV5i3fUFEVjCRf/el8xcNOeR3RyLKqGb
         KaRk3DvnyEdVibV+KxDJf/+81OASs51mgnY77OL1araAm6HC1MBIor3h2pGYulZ5dmCl
         zgU0T3hdk6l8kToia185ohP5uy7ml/PSrMtSzjnC+hGyda4lwLG0uuc+LmCprACJYLh5
         i3uA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5si2735372ywq.218.2019.03.07.06.22.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:22:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1tvG-0007QS-HI
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:22:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tsH-0004n9-Op
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:19:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tsG-0008OU-U3
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:19:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48288)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tsG-0008Ny-Nl; Thu, 07 Mar 2019 09:19:52 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0256D3089E68;
	Thu,  7 Mar 2019 14:19:52 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ADD8B5C1B5;
	Thu,  7 Mar 2019 14:19:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:31 +0100
Message-Id: <1551968334-18982-7-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 07 Mar 2019 14:19:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 06/29] hw/arm: Express dependencies of
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bCIkNLmA03Ul

This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 8 +-------
 hw/arm/Kconfig                  | 9 +++++++++
 hw/display/Kconfig              | 1 +
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 13cfffa..51032c5 100644
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
@@ -48,10 +48,7 @@ CONFIG_ARM11MPCORE=3Dy
 CONFIG_NETDUINO2=3Dy
=20
 CONFIG_PL041=3Dy
-CONFIG_PL050=3Dy
 CONFIG_PL080=3Dy
-CONFIG_PL110=3Dy
-CONFIG_PL181=3Dy
 CONFIG_PL190=3Dy
 CONFIG_PL330=3Dy
 CONFIG_CADENCE=3Dy
@@ -111,9 +108,6 @@ CONFIG_VERSATILE_I2C=3Dy
 CONFIG_PCI_EXPRESS=3Dy
 CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=3Dy
=20
-CONFIG_INTEGRATOR=3Dy
-CONFIG_INTEGRATOR_DEBUG=3Dy
-
 CONFIG_ALLWINNER_A10_PIT=3Dy
 CONFIG_ALLWINNER_A10_PIC=3Dy
 CONFIG_ALLWINNER_A10=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2747e2b..a08a863 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -34,6 +34,15 @@ config HIGHBANK
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
index a96ea76..364d628 100644
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

