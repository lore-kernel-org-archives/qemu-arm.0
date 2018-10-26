Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp442535wro;
        Fri, 26 Oct 2018 01:32:48 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ca+5iskfdppzMcA5QZdD6Rl02QNOutpB78ATyzp/slmx451wz3kiJWQKGWk5iQiz9uuwIz
X-Received: by 2002:ac8:7153:: with SMTP id h19-v6mr2332113qtp.361.1540542768068;
        Fri, 26 Oct 2018 01:32:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540542768; cv=none;
        d=google.com; s=arc-20160816;
        b=xJVrhUJbhwPnnwYpmo6ezFwblumfnip8mIXYjp2rhRESfoBGr2mxBYdPVizXbMn1tY
         U+cYqzVwRp0YJSZ+GwDtrx2n5crKp1PMltqnuKlqG636lllLJz/DVSX+g0eOm1eMCB+g
         355i3ZsXXBO/NB2o4vxiZjLMPQAVLMvvi4xSjj2vFZxvoqRCZXbV75VktKf/ebUJI4Qu
         4bi0MzALpcFy7Cx30F8GKBaAsGBQtbmigJcepXUqmUsrGSvm8LGkRFUr1sCa3d9or3f4
         IVY1O8QR9ICXpGjWnqg9ihqInAhq5uV414xfoNjywVmYiOlGmgF9//ahNbpxQcDKZaT2
         xJdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=B96iYAP+yDxunFBsutVaLB/8KOOqd1GpT/Afs7qZa1U=;
        b=b2gMqBYm9Hphig6XlKtdTXKCZKNmi9SBBDAsTdAevNQDMoZjNxoB8f9S/94bEL9u9Q
         FAZR4bitXyyfWulUyYpfISeAujwSMHevdlj/nt096uJDp5A7PyCX6qLHswmCxaxTzbdY
         R/EX2C2aUkcK6PzPiu4MM8IeNmRGYISK7QQVdmFppl5JVnDa/sNJUCnghQOBIJhjSQsZ
         CbaeS45+rkGJQgzJBMkPaeFw9jQ254mYbybyrkpSOThCgV1cosUxyMP0TdKKH82a9iKy
         7Z2U3imHU2FDdeh3axkU9p2U4rtoBAE++SqnDQEdTwR/HN4Io9v8Gjp8mO4+HENUGsQf
         mzRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iE35CTiv;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=htkXR1t1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=htkXR1t1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t184-v6si3645346qkh.171.2018.10.26.01.32.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:32:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=iE35CTiv;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=htkXR1t1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=htkXR1t1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58819 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxXz-0005ZL-F5
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:32:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUF-0000gX-KT
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 04:28:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJX-0004x7-5T
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 04:17:52 -0400
Received: from greensocs.com ([193.104.36.180]:45407)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJW-0004lb-Ov; Fri, 26 Oct 2018 04:17:51 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 63F95441B4C;
	Fri, 26 Oct 2018 10:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541842;
	bh=vDaD67RQ3c5X2pyk00EKbHlGZty38odwBUnpI9bYUZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iE35CTivZ6RF76dBikz7M0+R7/Z+AKRp8IHaxisgS8v/hMpXSiIJpti1TYPxe4LkY
	iPeZfKdTjBEpOQiGpeev1OYqWTGK9wnG/xEXvh3Fl5W8i28M2kConanJgQ5dVj+jzB
	s4Y6ZQD0lY4DdAtBLPqgVwXBXsyB2RrKWPbFVGNs=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=htkXR1t1;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=htkXR1t1
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFgPReZDztvv; Fri, 26 Oct 2018 10:17:21 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id C473E441B47; Fri, 26 Oct 2018 10:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541839;
	bh=vDaD67RQ3c5X2pyk00EKbHlGZty38odwBUnpI9bYUZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=htkXR1t1O3Vl32T2v05gjVNzeQYnxvUpFmAhnUrBkVF4ni7IPxaTZqER+DX6CB+DT
	fP5JmPGhfggHrk28qnqWxIvKYA9v5T1CVBM1lJGaOaqxwKEgboKNDKitLT1t9Nai56
	11B7qLGBIGydpAmmCkh+nJvFDLewtoIGHpth5nDg=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 4D69F441B42;
	Fri, 26 Oct 2018 10:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541839;
	bh=vDaD67RQ3c5X2pyk00EKbHlGZty38odwBUnpI9bYUZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=htkXR1t1O3Vl32T2v05gjVNzeQYnxvUpFmAhnUrBkVF4ni7IPxaTZqER+DX6CB+DT
	fP5JmPGhfggHrk28qnqWxIvKYA9v5T1CVBM1lJGaOaqxwKEgboKNDKitLT1t9Nai56
	11B7qLGBIGydpAmmCkh+nJvFDLewtoIGHpth5nDg=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:53 +0200
Message-Id: <20181026081653.24602-17-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 16/16] arm/xlnx-zynqmp: put APUs and RPUs in
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
X-TUID: IPuWfXsIn7IT

Create two separate CPU clusters for APUs and RPUs.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
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
index c195040350..7cc01f0b77 100644
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
+
+    qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
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
@@ -211,14 +218,19 @@ static void xlnx_zynqmp_init(Object *obj)
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
@@ -331,10 +343,13 @@ static void xlnx_zynqmp_realize(DeviceState *dev, E=
rror **errp)
     qdev_prop_set_uint32(DEVICE(&s->gic), "num-cpu", num_apus);
     qdev_prop_set_bit(DEVICE(&s->gic), "has-security-extensions", s->sec=
ure);
     qdev_prop_set_bit(DEVICE(&s->gic),
                       "has-virtualization-extensions", s->virt);
=20
+    qdev_prop_set_uint32(DEVICE(&s->apu_cluster), "cluster-id", 0);
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

