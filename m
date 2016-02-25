Received: by 10.25.208.211 with SMTP id h202csp2752319lfg;
        Thu, 25 Feb 2016 03:31:28 -0800 (PST)
X-Received: by 10.140.235.137 with SMTP id g131mr58928036qhc.43.1456399888777;
        Thu, 25 Feb 2016 03:31:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w107si7687292qge.8.2016.02.25.03.31.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 03:31:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYu8m-0006kF-1Y
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 06:31:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1aYtzs-0007jN-SA
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 06:22:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1aYtzo-0006EM-Pb
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 06:22:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1aYtzo-0006EI-IX; Thu, 25 Feb 2016 06:22:12 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id D57C550F4F;
	Thu, 25 Feb 2016 11:22:11 +0000 (UTC)
Received: from thh440s.fritz.box (vpn1-7-102.ams2.redhat.com [10.36.7.102])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1PBM8Us017044; Thu, 25 Feb 2016 06:22:09 -0500
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Thu, 25 Feb 2016 12:22:04 +0100
Message-Id: <1456399324-24259-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com, i.mitsyanko@gmail.com,
	peter.chubb@nicta.com.au, d.solodkiy@samsung.com,
	m.kozlov@samsung.com, balrogg@gmail.com
Subject: [Qemu-arm] [PATCH] MAINTAINERS: Add some missing ARM related header
	files
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2nMJh4toq7pP

Some header files in the include/hw/arm/ directory can be assigned
to entries in the MAINTAINERS file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9179386..5b29408 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -363,6 +363,7 @@ M: Dmitry Solodkiy <d.solodkiy@samsung.com>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/exynos*
+F: include/hw/arm/exynos4210.h
 
 Calxeda Highbank
 M: Rob Herring <robh@kernel.org>
@@ -390,6 +391,7 @@ L: qemu-arm@nongnu.org
 S: Odd fixes
 F: hw/*/imx*
 F: hw/arm/kzm.c
+F: include/hw/arm/fsl-imx31.h
 
 Integrator CP
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -432,6 +434,7 @@ F: hw/arm/spitz.c
 F: hw/arm/tosa.c
 F: hw/arm/z2.c
 F: hw/*/pxa2xx*
+F: include/hw/arm/pxa.h
 
 Stellaris
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -761,6 +764,7 @@ OMAP
 M: Peter Maydell <peter.maydell@linaro.org>
 S: Maintained
 F: hw/*/omap*
+F: include/hw/arm/omap.h
 
 IPack
 M: Alberto Garcia <berto@igalia.com>
-- 
1.8.3.1

