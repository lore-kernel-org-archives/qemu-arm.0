Received: by 10.25.150.194 with SMTP id y185csp1556105lfd;
        Tue, 8 Nov 2016 04:18:14 -0800 (PST)
X-Received: by 10.202.63.214 with SMTP id m205mr7570349oia.123.1478607494583;
        Tue, 08 Nov 2016 04:18:14 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r188si18803913oie.223.2016.11.08.04.18.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Nov 2016 04:18:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c45Lx-0001D2-RR
	for alex.bennee@linaro.org; Tue, 08 Nov 2016 07:18:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c45Lr-0001AJ-FY
	for qemu-arm@nongnu.org; Tue, 08 Nov 2016 07:18:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1c45Ln-0003wY-G6
	for qemu-arm@nongnu.org; Tue, 08 Nov 2016 07:18:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53190)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1c45Ln-0003w5-Aj; Tue, 08 Nov 2016 07:18:03 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5CCEB7AE99;
	Tue,  8 Nov 2016 12:18:02 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-42.ams2.redhat.com [10.36.116.42])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uA8CHsvj027755; Tue, 8 Nov 2016 07:17:59 -0500
From: Thomas Huth <thuth@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Date: Tue,  8 Nov 2016 13:17:49 +0100
Message-Id: <1478607473-25851-2-git-send-email-thuth@redhat.com>
In-Reply-To: <1478607473-25851-1-git-send-email-thuth@redhat.com>
References: <1478607473-25851-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 08 Nov 2016 12:18:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/5] MAINTAINERS: Add some ARM related files to
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
Cc: Fam Zheng <famz@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tpo7k/0aW8Yn

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

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 82c814a..d7eef43 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -118,6 +118,7 @@ S: Maintained
 F: target-arm/
 F: hw/arm/
 F: hw/cpu/a*mpcore.c
+F: include/hw/cpu/a*mpcore.h
 F: disas/arm.c
 F: disas/arm-a64.cc
 F: disas/libvixl/
@@ -420,6 +421,7 @@ M: Peter Chubb <peter.chubb@nicta.com.au>
 L: qemu-arm@nongnu.org
 S: Odd fixes
 F: hw/*/imx*
+F: include/hw/*/imx*
 F: hw/arm/kzm.c
 F: include/hw/arm/fsl-imx31.h
 
@@ -428,6 +430,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/integratorcp.c
+F: hw/misc/arm_integrator_debug.c
 
 Musicpal
 M: Jan Kiszka <jan.kiszka@web.de>
@@ -452,6 +455,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/realview*
+F: hw/cpu/realview_mpcore.c
 F: hw/intc/realview_gic.c
 F: include/hw/intc/realview_gic.h
 
@@ -464,6 +468,7 @@ F: hw/arm/spitz.c
 F: hw/arm/tosa.c
 F: hw/arm/z2.c
 F: hw/*/pxa2xx*
+F: hw/misc/mst_fpga.c
 F: include/hw/arm/pxa.h
 
 Stellaris
@@ -485,7 +490,8 @@ L: qemu-arm@nongnu.org
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

