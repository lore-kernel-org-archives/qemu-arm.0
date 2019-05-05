Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1430639wrh;
        Sun, 5 May 2019 07:00:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzp5182srkoqhr56NpyHq1FsKDCzifxZZ6eXgn3XY4dakdwt9bdyHXYoyyCHMtVWpbaRNoq
X-Received: by 2002:a1c:f702:: with SMTP id v2mr13763320wmh.0.1557064845859;
        Sun, 05 May 2019 07:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557064845; cv=none;
        d=google.com; s=arc-20160816;
        b=feo4RY+dXdOBT5Ubgd3YkhZI6EhYl4IQ83lJL9pFNa+gO2HDkfma00iRE6yNXWO24x
         hwixM09HWWQ/Fc8KaOU2OmWgDwANi8Qa718LaUXtYuUD0IBxFBeXtTJnc9C9Ly+tFABD
         H5nXmEmx0TtBMutXppa+j4Qujkny8ZKBDWJ/KlNL1szJNMvVAdmXEfCsFnhIjDYRytHL
         5zIAaAyn5BCzIWLSbmX2V238dGXALK9pVzmc9a3C0XGYna/ZxROUNKXEC5cKQGJD/Avy
         z6GxUEsBuKD4rSEuufLxFfXOqLJnfWuxz9rG+NtG9yDnyGuwsXvaiuO48z/d/38va7Cg
         ADJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=srq7CxpCI3kGkuzs5SV0UEbVrI0SO1efbPwPup6XMjg=;
        b=oSnROUJX6HMz5t22wt+CwNGzTraoGVSz1u5Ip8tOSbQuc8j8c4z4xxSEt56zCyjQ/t
         lDJMsjazuf8Qo+FFv1YcmlFvfQ0mw+VvGQrxttOcW4DtSfzSRRjGciWpPwSsfF8WVzJt
         xxWYK9rORZTvNu4mdd9JXb9pzNer4xbuVbWd1ticuzxaWT4/D0qzpgMD4BacEbFs1CPj
         M7WLT2X7COm7e8RGttuU4R69pW8ogMP3j3LV51Qf8vI1tp0QHT9SipJKGbbo3AvFYYc9
         OWYWRe+fGu1CImFLeETEnw2PNezlo2rnMEEs2PiWkJ/R54iPQmnj7KzFMA7WWGH1QU7+
         lzPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si2063869wrt.67.2019.05.05.07.00.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:00:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHh6-0006mb-NS
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:00:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHdy-00049L-OG
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHdx-0004eR-Pg
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44422)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHdx-0004dj-Km; Sun, 05 May 2019 09:57:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E23883092656;
	Sun,  5 May 2019 13:57:28 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAD5360C67;
	Sun,  5 May 2019 13:57:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:56:53 +0200
Message-Id: <20190505135714.11277-8-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Sun, 05 May 2019 13:57:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 07/28] hw/arm: Express dependencies of musicpal
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
X-TUID: dCC1MZyx8h+s

This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 6 +-----
 hw/arm/Kconfig                  | 5 +++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 7f94811ccb..0a4d293f8a 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -11,13 +11,13 @@ CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
 CONFIG_INTEGRATOR=3Dy
 CONFIG_FSL_IMX31=3Dy
+CONFIG_MUSICPAL=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
 CONFIG_ECC=3Dy
 CONFIG_SERIAL=3Dy
 CONFIG_MAX7310=3Dy
-CONFIG_WM8750=3Dy
 CONFIG_TWL92230=3Dy
 CONFIG_TSC2005=3Dy
 CONFIG_LM832X=3Dy
@@ -40,7 +40,6 @@ CONFIG_IMX_FEC=3Dy
 CONFIG_FTGMAC100=3Dy
 CONFIG_DS1338=3Dy
 CONFIG_PFLASH_CFI01=3Dy
-CONFIG_PFLASH_CFI02=3Dy
 CONFIG_MICRODRIVE=3Dy
 CONFIG_USB_MUSB=3Dy
 CONFIG_PLATFORM_BUS=3Dy
@@ -56,14 +55,12 @@ CONFIG_PL190=3Dy
 CONFIG_PL330=3Dy
 CONFIG_CADENCE=3Dy
 CONFIG_PXA2XX=3Dy
-CONFIG_BITBANG_I2C=3Dy
 CONFIG_FRAMEBUFFER=3Dy
 CONFIG_XILINX_SPIPS=3Dy
 CONFIG_ZYNQ_DEVCFG=3Dy
=20
 CONFIG_ARM11SCU=3Dy
 CONFIG_DIGIC=3Dy
-CONFIG_MARVELL_88W8618=3Dy
 CONFIG_OMAP=3Dy
 CONFIG_TSC210X=3Dy
 CONFIG_BLIZZARD=3Dy
@@ -137,7 +134,6 @@ CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
-CONFIG_MUSICPAL=3Dy
=20
 # for realview and versatilepb
 CONFIG_LSI_SCSI_PCI=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 9087b7d714..b9f3c3c232 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -46,7 +46,12 @@ config MAINSTONE
=20
 config MUSICPAL
     bool
+    select BITBANG_I2C
+    select MARVELL_88W8618
     select PTIMER
+    select PFLASH_CFI02
+    select SERIAL
+    select WM8750
=20
 config NETDUINO2
     bool
--=20
2.21.0

