Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5453091wrw;
        Wed, 14 Nov 2018 00:43:48 -0800 (PST)
X-Google-Smtp-Source: AJdET5dV3Ff9j/MF0lI/zKjbU1avLNq25xtD0qkknads069Cwd0AUxIgSafgjv4V+pYkiwBPbtQT
X-Received: by 2002:a0c:b6c3:: with SMTP id h3mr946680qve.128.1542185028305;
        Wed, 14 Nov 2018 00:43:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542185028; cv=none;
        d=google.com; s=arc-20160816;
        b=hqz3e8sSyw2oEYUC76u1hhjypMN35G8n6ZRiT7Z1o5MTQQkJ2X8zE+tnb8O4O4tuvj
         pcziujZjyikqh9fFCNin6r1wmcJ1/g2HkWDFDJ7wLkT/TQ9u5Q2WBWd7h8w459M8fYs+
         T8yk/O0XqJB54oHPX3WVUjHESSC5N98pdqPRvHQEItfKSJQPFqjZ+pmztOYgqCDpQYhq
         W0Uo3jRnv2jZHyMrwMvhnmghBcXfX/gDtfFct2nLESk1/0bvg0wKdxLptxJnwodKHsur
         RfnLyxM3vAaTMFnuoulan+V9q+jZrcCrX0kV5wf5aORo5i7p4X8wVAcha7KxEZl4jJFk
         FQiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=4/HeqHvn9iL4WscuOSux3U5bqc1s/dKWaDuqZ0/SLjw=;
        b=EI5diGVtAtMMUZftl7Dw5q0Sfv54lMPvOB/DqMvgEe9cXt2x/3+MwbDEsy3X1DqGZt
         4ezyOLcqIiNdMi1XGGNMwF9BSj58kLY9vLzkJK9/yP3oAh3wBEamtIDQxjwzYYCKYvd7
         u+z8FjZlGQvrV37enS0uRV3el5JnJe1+/A58w0sGXUV1FON0LxrEH3mIbM0AIFCHCk39
         eS1QQGwjBXKUoKFESzzRbbnXUiTq3cDbY3PU9O2oU15i6R6jdAeXTOe8xNN0jgznEwPV
         BTlw3eZW4J2qtvXRl66nZ9f/OKOs6JwKkGiywJ2FdvCtEAyqo6Q7xuKRAYlqDHB6NiNP
         Fl2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u135si2571768qka.242.2018.11.14.00.43.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 00:43:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58925 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMqm3-0003ot-I9
	for alex.bennee@linaro.org; Wed, 14 Nov 2018 03:43:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gMqln-0003nJ-5b
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 03:43:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gMqli-0006Yj-KU
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 03:43:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50474)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gMqli-0006Y2-DR; Wed, 14 Nov 2018 03:43:26 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CEC16C0BEAB1;
	Wed, 14 Nov 2018 08:43:24 +0000 (UTC)
Received: from thuth.com (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B156A5FC36;
	Wed, 14 Nov 2018 08:43:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Nov 2018 09:43:19 +0100
Message-Id: <1542184999-11145-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 14 Nov 2018 08:43:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] MAINTAINERS: Add entries for missing ARM boards
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-devel@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G8c0Pwb4hksy

Add entries for the boards "mcimx6ul-evk", "mcimx7d-sabre", "raspi2",
"raspi3", "sabrelite", "vexpress-a15", "vexpress-a9" and "virt".
While we're at it, also adjust the "i.MX31" section a little bit,
so that the wildcards there do not match anymore for unrelated files
(e.g. the new hw/misc/imx6ul_ccm.c file).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 70 +++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+-----
 1 file changed, 65 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b8db61..dd8ac65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -521,14 +521,15 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/gumstix.c
=20
-i.MX31
+i.MX31 (kzm)
 M: Peter Chubb <peter.chubb@nicta.com.au>
 L: qemu-arm@nongnu.org
-S: Odd fixes
-F: hw/*/imx*
-F: include/hw/*/imx*
+S: Odd Fixes
 F: hw/arm/kzm.c
-F: include/hw/arm/fsl-imx31.h
+F: hw/*/imx_*
+F: hw/*/*imx31*
+F: include/hw/*/imx_*
+F: include/hw/*/*imx31*
=20
 Integrator CP
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -537,6 +538,28 @@ S: Maintained
 F: hw/arm/integratorcp.c
 F: hw/misc/arm_integrator_debug.c
=20
+MCIMX6UL EVK / i.MX6ul
+M: Peter Maydell <peter.maydell@linaro.org>
+R: Jean-Christophe Dubois <jcd@tribudubois.net>
+L: qemu-arm@nongnu.org
+S: Odd Fixes
+F: hw/arm/mcimx6ul-evk.c
+F: hw/arm/fsl-imx6ul.c
+F: hw/misc/imx6ul_ccm.c
+F: include/hw/arm/fsl-imx6ul.h
+F: include/hw/misc/imx6ul_ccm.h
+
+MCIMX7D SABRE / i.MX7
+M: Peter Maydell <peter.maydell@linaro.org>
+R: Andrey Smirnov <andrew.smirnov@gmail.com>
+L: qemu-arm@nongnu.org
+S: Odd Fixes
+F: hw/arm/mcimx7d-sabre.c
+F: hw/arm/fsl-imx7.c
+F: include/hw/arm/fsl-imx7.h
+F: hw/pci-host/designware.c
+F: include/hw/pci-host/designware.h
+
 MPS2
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
@@ -570,6 +593,17 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/palm.c
=20
+Raspberry Pi
+M: Peter Maydell <peter.maydell@linaro.org>
+R: Andrew Baumann <Andrew.Baumann@microsoft.com>
+R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
+L: qemu-arm@nongnu.org
+S: Odd Fixes
+F: hw/arm/raspi_platform.h
+F: hw/*/bcm283*
+F: include/hw/arm/raspi*
+F: include/hw/*/bcm283*
+
 Real View
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
@@ -591,6 +625,19 @@ F: hw/*/pxa2xx*
 F: hw/misc/mst_fpga.c
 F: include/hw/arm/pxa.h
=20
+SABRELITE / i.MX6
+M: Peter Maydell <peter.maydell@linaro.org>
+R: Jean-Christophe Dubois <jcd@tribudubois.net>
+L: qemu-arm@nongnu.org
+S: Odd Fixes
+F: hw/arm/sabrelite.c
+F: hw/arm/fsl-imx6.c
+F: hw/misc/imx6_src.c
+F: hw/ssi/imx_spi.c
+F: include/hw/arm/fsl-imx6.h
+F: include/hw/misc/imx6_src.h
+F: include/hw/ssi/imx_spi.h
+
 Sharp SL-5500 (Collie) PDA
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
@@ -604,6 +651,12 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/stellaris*
=20
+Versatile Express
+M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/vexpress.c
+
 Versatile PB
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
@@ -611,6 +664,13 @@ S: Maintained
 F: hw/*/versatile*
 F: hw/misc/arm_sysctl.c
=20
+Virt
+M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
+S: Maintained
+F: hw/arm/virt*
+F: include/hw/arm/virt.h
+
 Xilinx Zynq
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 M: Alistair Francis <alistair@alistair23.me>
--=20
1.8.3.1

