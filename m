Received: by 10.25.0.144 with SMTP id 138csp186798lfa;
        Fri, 14 Apr 2017 01:40:38 -0700 (PDT)
X-Received: by 10.55.90.70 with SMTP id o67mr6618550qkb.251.1492159238478;
        Fri, 14 Apr 2017 01:40:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n187si1230673qkc.126.2017.04.14.01.40.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Apr 2017 01:40:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cywmT-0000di-Vq
	for alex.bennee@linaro.org; Fri, 14 Apr 2017 04:40:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cywjV-0006gS-01
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 04:37:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cywjN-0008KS-S6
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 04:37:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41170)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1cywjN-0008KG-JC; Fri, 14 Apr 2017 04:37:25 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43D83C05678D;
	Fri, 14 Apr 2017 08:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 43D83C05678D
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 43D83C05678D
Received: from thinkpad.redhat.com (ovpn-116-243.ams2.redhat.com
	[10.36.116.243])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEFA917AA5;
	Fri, 14 Apr 2017 08:37:21 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Apr 2017 10:37:14 +0200
Message-Id: <20170414083717.13641-2-lvivier@redhat.com>
In-Reply-To: <20170414083717.13641-1-lvivier@redhat.com>
References: <20170414083717.13641-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 14 Apr 2017 08:37:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 1/4] arm: remove remaining
 cannot_destroy_with_object_finalize_yet
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
Cc: Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5xpWy2w0w1T5

With commit ce5b1bbf624b ("exec: move cpu_exec_init() calls to
realize functions"), we can now remove all the
remaining cannot_destroy_with_object_finalize_yet as
unsafe references have been moved to cpu_exec_realizefn().
(tested with QOM command provided by commit 4c315c27).

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/allwinner-a10.c | 6 ------
 hw/arm/bcm2836.c       | 6 ------
 hw/arm/digic.c         | 6 ------
 hw/arm/fsl-imx25.c     | 5 -----
 hw/arm/fsl-imx31.c     | 5 -----
 hw/arm/fsl-imx6.c      | 5 -----
 hw/arm/xlnx-zynqmp.c   | 6 ------
 7 files changed, 39 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index ca15d1c..f62a9a3 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -118,12 +118,6 @@ static void aw_a10_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = aw_a10_realize;
-
-    /*
-     * Reason: creates an ARM CPU, thus use after free(), see
-     * arm_cpu_class_init()
-     */
-    dc->cannot_destroy_with_object_finalize_yet = true;
 }
 
 static const TypeInfo aw_a10_type_info = {
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 8451190..8c43291 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -160,12 +160,6 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
 
     dc->props = bcm2836_props;
     dc->realize = bcm2836_realize;
-
-    /*
-     * Reason: creates an ARM CPU, thus use after free(), see
-     * arm_cpu_class_init()
-     */
-    dc->cannot_destroy_with_object_finalize_yet = true;
 }
 
 static const TypeInfo bcm2836_type_info = {
diff --git a/hw/arm/digic.c b/hw/arm/digic.c
index d60ea39..94f3263 100644
--- a/hw/arm/digic.c
+++ b/hw/arm/digic.c
@@ -101,12 +101,6 @@ static void digic_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = digic_realize;
-
-    /*
-     * Reason: creates an ARM CPU, thus use after free(), see
-     * arm_cpu_class_init()
-     */
-    dc->cannot_destroy_with_object_finalize_yet = true;
 }
 
 static const TypeInfo digic_type_info = {
diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 2126f73..9056f27 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -290,11 +290,6 @@ static void fsl_imx25_class_init(ObjectClass *oc, void *data)
 
     dc->realize = fsl_imx25_realize;
 
-    /*
-     * Reason: creates an ARM CPU, thus use after free(), see
-     * arm_cpu_class_init()
-     */
-    dc->cannot_destroy_with_object_finalize_yet = true;
     dc->desc = "i.MX25 SOC";
 }
 
diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index dd1c713..d7e2d83 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -262,11 +262,6 @@ static void fsl_imx31_class_init(ObjectClass *oc, void *data)
 
     dc->realize = fsl_imx31_realize;
 
-    /*
-     * Reason: creates an ARM CPU, thus use after free(), see
-     * arm_cpu_class_init()
-     */
-    dc->cannot_destroy_with_object_finalize_yet = true;
     dc->desc = "i.MX31 SOC";
 }
 
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 76dd8a4..6969e73 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -442,11 +442,6 @@ static void fsl_imx6_class_init(ObjectClass *oc, void *data)
 
     dc->realize = fsl_imx6_realize;
 
-    /*
-     * Reason: creates an ARM CPU, thus use after free(), see
-     * arm_cpu_class_init()
-     */
-    dc->cannot_destroy_with_object_finalize_yet = true;
     dc->desc = "i.MX6 SOC";
 }
 
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index bc4e66b..4f67158 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -439,12 +439,6 @@ static void xlnx_zynqmp_class_init(ObjectClass *oc, void *data)
 
     dc->props = xlnx_zynqmp_props;
     dc->realize = xlnx_zynqmp_realize;
-
-    /*
-     * Reason: creates an ARM CPU, thus use after free(), see
-     * arm_cpu_class_init()
-     */
-    dc->cannot_destroy_with_object_finalize_yet = true;
 }
 
 static const TypeInfo xlnx_zynqmp_type_info = {
-- 
2.9.3

