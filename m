Received: by 10.80.166.35 with SMTP id d32csp443016edc;
        Wed, 12 Oct 2016 02:58:21 -0700 (PDT)
X-Received: by 10.55.34.65 with SMTP id i62mr185572qki.314.1476266301882;
        Wed, 12 Oct 2016 02:58:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b124si3449291qkd.125.2016.10.12.02.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Oct 2016 02:58:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buGIm-0002Ya-OM
	for alex.bennee@linaro.org; Wed, 12 Oct 2016 05:58:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1buGIZ-0002Q4-1S
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 05:58:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1buGIU-0001wq-1C
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 05:58:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51898)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1buGIT-0001wk-Rf; Wed, 12 Oct 2016 05:58:01 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E646C05A280;
	Wed, 12 Oct 2016 09:58:00 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-104.ams2.redhat.com
	[10.36.116.104])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9C9vuaO022019; Wed, 12 Oct 2016 05:57:57 -0400
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Date: Wed, 12 Oct 2016 11:57:55 +0200
Message-Id: <1476266275-11155-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 12 Oct 2016 09:58:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2] MAINTAINERS: Add some ARM related files to
 the corresponding sections
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
Cc: Andrzej Zaborowski <balrogg@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: csUeMpsbKxv1

The files w/cpu/a*mpcore.c are already assigned to the ARM CPU
section, but the corresponding headers include/hw/cpu/a*mpcore.h
are still missing.

The file hw/*/imx* are already assigned to the i.MX31 machine, but
the corresponding header files include/hw/*/imx* are still missing.

The file hw/misc/arm_integrator_debug.c seems to belong to Integrator
CP, hw/cpu/realview_mpcore.c seems to belong to Real View, and
hw/misc/mst_fpga.c seems to belong to PXA2XX.

And the files hw/misc/zynq* and include/hw/misc/zynq* seem to belong
to the Xilinx Zynq machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2:
 - Added some more file
 - Dropped hw/misc/arm_sysctl.c since it's unclear right now how to
   represent a file that belong to multiple machines

 MAINTAINERS | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c1c0a1..7fc5c9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -107,6 +107,7 @@ S: Maintained
 F: target-arm/
 F: hw/arm/
 F: hw/cpu/a*mpcore.c
+F: include/hw/cpu/a*mpcore.h
 F: disas/arm.c
 F: disas/arm-a64.cc
 F: disas/libvixl/
@@ -408,6 +409,7 @@ M: Peter Chubb <peter.chubb@nicta.com.au>
 L: qemu-arm@nongnu.org
 S: Odd fixes
 F: hw/*/imx*
+F: include/hw/*/imx*
 F: hw/arm/kzm.c
 F: include/hw/arm/fsl-imx31.h
 
@@ -416,6 +418,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/integratorcp.c
+F: hw/misc/arm_integrator_debug.c
 
 Musicpal
 M: Jan Kiszka <jan.kiszka@web.de>
@@ -440,6 +443,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/realview*
+F: hw/cpu/realview_mpcore.c
 F: hw/intc/realview_gic.c
 F: include/hw/intc/realview_gic.h
 
@@ -452,6 +456,7 @@ F: hw/arm/spitz.c
 F: hw/arm/tosa.c
 F: hw/arm/z2.c
 F: hw/*/pxa2xx*
+F: hw/misc/mst_fpga.c
 F: include/hw/arm/pxa.h
 
 Stellaris
@@ -473,7 +478,8 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/xilinx_*
 F: hw/*/cadence_*
-F: hw/misc/zynq_slcr.c
+F: hw/misc/zynq*
+F: include/hw/misc/zynq*
 X: hw/ssi/xilinx_*
 
 Xilinx ZynqMP
-- 
1.8.3.1

