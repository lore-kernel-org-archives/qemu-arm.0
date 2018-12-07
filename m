Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp240908wrt;
        Fri, 7 Dec 2018 01:06:31 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XSDpXrmtagGnMjmAIs+gqjZ9Y5NNodG24NSZySHUDXA564ET6FeUzwCxQL4ybaj6XbMtMr
X-Received: by 2002:a37:9cd4:: with SMTP id f203mr1100792qke.155.1544173591512;
        Fri, 07 Dec 2018 01:06:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544173591; cv=none;
        d=google.com; s=arc-20160816;
        b=hUju0Zn33hMrs/Q9ckdeYn8F6VSWBQPpmlfNdBtzY9tIGVydQUXd6LgHjRlhMf9SP5
         GAc3dIdDO3m06lAqRgApTWTR8gs91UBH0fx/CKZsd5dAQ9WFCq7eImA1TTlsTlt/SwBd
         Zw675m/OSaJr+dEcnkXyJ7RTSoNLIBTyXc+LMUDT+Dv1kcDEaSiW88pAeF7SNxcvV7iU
         VnYBpSNYvHyfkh3eRmWQr8PNdPh35UDpkTdYudIuZnl+tKfBOh9cjUWtHTmU76sSnphE
         bBu8YDwJ3d9lyewVsZ5vZuxQYJG40Mfc7AwlPh0kGsO6iy3njBfvgT75oyUZT7GotTAe
         /OwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=shOjjGMM5ohF4IcEpNl1Af+zBUDTq9t8Tlkd9Ep4q9k=;
        b=QinlwwFuN5+O7MLF8RXOJLY387kgi7CmN7KbKM9byEQtVm7vrxZbTUR4MHQTPORLrB
         t7jkUr/I00oGpOAjhG16e+l111EqERVp6WWCxHsnXRa7jttWwebqLwyHCi9Qh3x8cDZV
         O2H3ApsCeSGBTnpHe1U+07YNfVSpBq6lgQg87K3KXPG9QcJLWmly2FiPlNTLWVbJbxb0
         PxnbOgRCic8p2ypo6eFoMYHqXcacBhHkj6PuPt6ZWyuwR+YrG0/X+eOjH6G3ecv44OPU
         Cgyv1DF91NFQgWlKjRAKkgJ6HQKVobstJdEgizmzUECGBhfWhgU/KKOH6Rzv/fmJwT6V
         eu5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=XV3yCyGG;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Ajz1vfMD;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=z1+UaR0E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c54si1924673qtb.13.2018.12.07.01.06.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:06:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=XV3yCyGG;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Ajz1vfMD;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=z1+UaR0E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44861 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVC5e-0004Nv-Pv
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 04:06:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1Z-00089H-DM
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:02:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gVC1Y-0005fP-B4
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 04:02:17 -0500
Received: from greensocs.com ([193.104.36.180]:52241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gVC1X-0005Rk-SR; Fri, 07 Dec 2018 04:02:16 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id D1507480024;
	Fri,  7 Dec 2018 10:01:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173314;
	bh=qT1myRY8+72bGIoRFHUkl0awqFWddD9vzwxt3H9ioig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XV3yCyGGd0WS0n1cMj5WbEVVR6kLqWlHB28ZE8eIyX07DhHC/Jhv5Zi4+nU40p5ui
	8JkYoZpF6QbIABL8P5xBHqnDSU0HRlF7QuJNVerKsvkgly6Fe6cL3a8IyCbTSwRLRo
	koeegQLyZ4zovW3vOER6UrLsx447md3lxcJWbeUc=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Ajz1vfMD;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=z1+UaR0E
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ujpnGvA8f5ez; Fri,  7 Dec 2018 10:01:54 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 1392B48001C; Fri,  7 Dec 2018 10:01:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173308;
	bh=qT1myRY8+72bGIoRFHUkl0awqFWddD9vzwxt3H9ioig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ajz1vfMD1cGgZcb1RCzF36aXePccBemPugnW32OXkolXLuLddBkzYYN2Qxm3h4Cgb
	SMksIasQIMWSLOcbUPyizfbHQFKkYwcSdibZrpzujOXqGOjWZO7Arxhl3oRcR2ptSn
	OyUldMBSf0ySIXJsfsdKjji+j6nvRfwM3r6XQMkk=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 951C148002B;
	Fri,  7 Dec 2018 10:01:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1544173307;
	bh=qT1myRY8+72bGIoRFHUkl0awqFWddD9vzwxt3H9ioig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=z1+UaR0Eprn37p6DyL9pDiL4dR2JSVrLyMmzZpvRNCBpfgmtOThg1LP87zhlvdEf7
	CKRZzpx1SNH6wMe2W1ic/h63eAkmO8Ut1RjSBw6S3I2wuKi2Y0mg1e234XVHX3m6cD
	DuP0Q9ECdX78xBNf5W5xI3NqDDItgZVrxifz+VNg=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Dec 2018 10:01:34 +0100
Message-Id: <20181207090135.7651-17-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181207090135.7651-1-luc.michel@greensocs.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v8 16/16] arm/xlnx-zynqmp: put APUs and RPUs in
 separate CPU clusters
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8CZm4pFkgH16

Create two separate CPU clusters for APUs and RPUs.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/arm/xlnx-zynqmp.h |  3 +++
 hw/arm/xlnx-zynqmp.c         | 23 +++++++++++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

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
index c195040350..c67ac2e64a 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -176,16 +176,23 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState =
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
+    qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
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
@@ -211,14 +218,20 @@ static void xlnx_zynqmp_init(Object *obj)
 {
     XlnxZynqMPState *s =3D XLNX_ZYNQMP(obj);
     int i;
     int num_apus =3D MIN(smp_cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
=20
+    object_initialize_child(obj, "apu-cluster", &s->apu_cluster,
+                            sizeof(s->apu_cluster), TYPE_CPU_CLUSTER,
+                            &error_abort, NULL);
+    qdev_prop_set_uint32(DEVICE(&s->apu_cluster), "cluster-id", 0);
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
@@ -331,10 +344,12 @@ static void xlnx_zynqmp_realize(DeviceState *dev, E=
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
2.19.2

