Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1761039wrt;
        Fri, 23 Nov 2018 01:30:49 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VIY+rFm7n750R1We7iZIb6Qe9l3A1jZGfbzv2iREE6dbWTwuKPPHD4cwKWbSQZWvTf/p2J
X-Received: by 2002:a25:ba85:: with SMTP id s5-v6mr14780174ybg.305.1542965449186;
        Fri, 23 Nov 2018 01:30:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542965449; cv=none;
        d=google.com; s=arc-20160816;
        b=rznyIR9fhb/5he3k2kKoN7pYwUVPKeq0fRpKTFET/X85QTNrJ/ZMcxeDJqvxtGnSwq
         5+BU25ErK4qtoWDi3sxZQPZ0rHKsuuCx35xnoj0IZCieQp5m5qxsgSl8lW6MVnCRo5B3
         f5EC8hxZp5oZjK2hk8mFyVCBHpMaTYbDIfeswjPPLSAvHf7RRffZhS24DHAbJfq/OFCm
         IehtKqSbckK1kEu/NNayhU3fwb3sDVa6vXO2md04uB7HzJe5UUSjKC2KfWhVLz+1Gk/e
         CGHqHYQuD0YCoxdrS7ajGkoYZU20BTV0DXgbTnUINuCmZ1i7ANFM1B1KXcxD2YTeP6Y7
         b9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=LFiL96Xyfnj77mSYx/+U+cX0DVJM/HdIk/5MHDNcIag=;
        b=me2cNQoM2o5zQdcPWf8ZLhPLxqfoVwT0aZUVojUqOONVWTgkhSs0GDlg1tZWwZc+SQ
         0FT0gipkx6av6ynmSf56E0wjfNAuSR5LDQJFKa1IAbBV9dP56DqNN97F2kkXVeQSVl13
         gfHzOmT6iY9ky66zZdypLeCNanyLCLaA63rudxTZ1+YQpWeX/oCxpyPvt8kR5LLbMIEm
         m+FUr69iHqnrm9WfTMOmkeN8x5Mp2Uqftk3asWOeAZJAGJINzj0yllLQrynkeBW6ndjR
         hzI9uhjHCo5m2/DxjmwfW7qv6pu/z2ykWi84s/5uPIQR38ppY5fxV/QZomIQlYHUNCbN
         Egqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=12cZahuh;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=S4PlApb2;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=S4PlApb2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h82-v6si23789282ywa.170.2018.11.23.01.30.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:30:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=12cZahuh;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=S4PlApb2;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=S4PlApb2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51218 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7nU-00030v-LE
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:30:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7bQ-0008M5-3x
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 04:18:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7bP-0001r4-5K
	for qemu-devel@nongnu.org; Fri, 23 Nov 2018 04:18:20 -0500
Received: from greensocs.com ([193.104.36.180]:47091)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7bF-0000aL-6G; Fri, 23 Nov 2018 04:18:09 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 59AB45E7086;
	Fri, 23 Nov 2018 10:17:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964661;
	bh=Dkji4JTfOdePjfk92E+wL5e2vsn+se5ApMpIQQk9dpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=12cZahuhzUCR1TBHwI8zJmsWVbX1SEChOQn4lyMju8Rby+w6AVkn95abXMBQzQlz9
	TntnG/SXhOc8fAGBrQKhdh/XmalX4GzXz7LNu3hqNIe42P1nNvhvmzM3ZLK9PyhaeL
	Soz21RQTS24Oc2WxOlCT7yn89b5CUh46h22RfDCU=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=S4PlApb2;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=S4PlApb2
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qLPA92evr3RZ; Fri, 23 Nov 2018 10:17:40 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id E67195E7089; Fri, 23 Nov 2018 10:17:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964658;
	bh=Dkji4JTfOdePjfk92E+wL5e2vsn+se5ApMpIQQk9dpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S4PlApb21u6ZttyzaxgiiRR5mVrhUPWcNWSdTRxOoyWpWLGogPPJRUBJahFztgh+O
	KPxIrXlPemRxqpVuibS+qeiToLJQXJWkhxJBL6yslxiQTBSOUGQ+RasSiILRA6BQUa
	QS4S1mYahaDEHzfkMa3X94e9k6Ncgyatea/TUzok=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 76EAE5E7087;
	Fri, 23 Nov 2018 10:17:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964658;
	bh=Dkji4JTfOdePjfk92E+wL5e2vsn+se5ApMpIQQk9dpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S4PlApb21u6ZttyzaxgiiRR5mVrhUPWcNWSdTRxOoyWpWLGogPPJRUBJahFztgh+O
	KPxIrXlPemRxqpVuibS+qeiToLJQXJWkhxJBL6yslxiQTBSOUGQ+RasSiILRA6BQUa
	QS4S1mYahaDEHzfkMa3X94e9k6Ncgyatea/TUzok=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:29 +0100
Message-Id: <20181123091729.29921-17-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v7 16/16] arm/xlnx-zynqmp: put APUs and RPUs in
 separate CPU clusters
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xoiUO1m0X9DW

Create two separate CPU clusters for APUs and RPUs.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/hw/arm/xlnx-zynqmp.h |  3 +++
 hw/arm/xlnx-zynqmp.c         | 21 +++++++++++++++++----
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 98f925ab84..591515c760 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -29,10 +29,11 @@
 #include "hw/dma/xlnx_dpdma.h"
 #include "hw/dma/xlnx-zdma.h"
 #include "hw/display/xlnx_dp.h"
 #include "hw/intc/xlnx-zynqmp-ipi.h"
 #include "hw/timer/xlnx-zynqmp-rtc.h"
+#include "hw/cpu/cluster.h"
=20
 #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
 #define XLNX_ZYNQMP(obj) OBJECT_CHECK(XlnxZynqMPState, (obj), \
                                        TYPE_XLNX_ZYNQMP)
=20
@@ -75,10 +76,12 @@
 typedef struct XlnxZynqMPState {
     /*< private >*/
     DeviceState parent_obj;
=20
     /*< public >*/
+    CPUClusterState apu_cluster;
+    CPUClusterState rpu_cluster;
     ARMCPU apu_cpu[XLNX_ZYNQMP_NUM_APU_CPUS];
     ARMCPU rpu_cpu[XLNX_ZYNQMP_NUM_RPU_CPUS];
     GICState gic;
     MemoryRegion gic_mr[XLNX_ZYNQMP_GIC_REGIONS][XLNX_ZYNQMP_GIC_ALIASES=
];
=20
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index c195040350..42a138074c 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -176,16 +176,22 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState =
*s, const char *boot_cpu,
 {
     Error *err =3D NULL;
     int i;
     int num_rpus =3D MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQM=
P_NUM_RPU_CPUS);
=20
+    object_initialize_child(OBJECT(s), "rpu-cluster", &s->rpu_cluster,
+                            sizeof(s->rpu_cluster), TYPE_CPU_CLUSTER,
+                            &error_abort, NULL);
+
+    qdev_init_nofail(DEVICE(&s->rpu_cluster));
+
     for (i =3D 0; i < num_rpus; i++) {
         char *name;
=20
         object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
                           "cortex-r5f-" TYPE_ARM_CPU);
-        object_property_add_child(OBJECT(s), "rpu-cpu[*]",
+        object_property_add_child(OBJECT(&s->rpu_cluster), "rpu-cpu[*]",
                                   OBJECT(&s->rpu_cpu[i]), &error_abort);
=20
         name =3D object_get_canonical_path_component(OBJECT(&s->rpu_cpu[=
i]));
         if (strcmp(name, boot_cpu)) {
             /* Secondary CPUs start in PSCI powered-down state */
@@ -211,14 +217,19 @@ static void xlnx_zynqmp_init(Object *obj)
 {
     XlnxZynqMPState *s =3D XLNX_ZYNQMP(obj);
     int i;
     int num_apus =3D MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
=20
+    object_initialize_child(obj, "apu-cluster", &s->apu_cluster,
+                            sizeof(s->apu_cluster), TYPE_CPU_CLUSTER,
+                            &error_abort, NULL);
+
     for (i =3D 0; i < num_apus; i++) {
-        object_initialize_child(obj, "apu-cpu[*]", &s->apu_cpu[i],
-                                sizeof(s->apu_cpu[i]),
-                                "cortex-a53-" TYPE_ARM_CPU, &error_abort=
, NULL);
+        object_initialize_child(OBJECT(&s->apu_cluster), "apu-cpu[*]",
+                                &s->apu_cpu[i], sizeof(s->apu_cpu[i]),
+                                "cortex-a53-" TYPE_ARM_CPU, &error_abort=
,
+                                NULL);
     }
=20
     sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
                           gic_class_name());
=20
@@ -331,10 +342,12 @@ static void xlnx_zynqmp_realize(DeviceState *dev, E=
rror **errp)
     qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", num_apus);
     qdev_prop_set_bit(DEVICE(&s->gic), "has-security-extensions", s->sec=
ure);
     qdev_prop_set_bit(DEVICE(&s->gic),
                       "has-virtualization-extensions", s->virt);
=20
+    qdev_init_nofail(DEVICE(&s->apu_cluster));
+
     /* Realize APUs before realizing the GIC. KVM requires this.  */
     for (i =3D 0; i < num_apus; i++) {
         char *name;
=20
         object_property_set_int(OBJECT(&s->apu_cpu[i]), QEMU_PSCI_CONDUI=
T_SMC,
--=20
2.19.1

