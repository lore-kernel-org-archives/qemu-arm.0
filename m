Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp812518wrw;
        Sat, 10 Nov 2018 00:20:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5fFO9Js+LXxhJeTzDf4qmMIOCgKy/GIEEJuPbwxYMA+ypUHds84yaQ+e2pPVzfeGnopXw+t
X-Received: by 2002:aed:2b01:: with SMTP id p1mr11683045qtd.101.1541838008588;
        Sat, 10 Nov 2018 00:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541838008; cv=none;
        d=google.com; s=arc-20160816;
        b=diUIOwBRYIfiqBsWDiyOVzpF/CZFpSPHT+Rm+o9M4Xm9ydnn6+o1G0m1v4Coh+43Rc
         TtbR3CrMkFdINjIaSjQK/QF2jkM15htqeVg18tDsh1dJCDJ5dn+sHFzmnacwPazOSRtp
         ogBqmaUVfhe/WMk+uaSEqDmMkxxfhaDvOCw2Uzhq5R05tIQmKDioy75Mp6UYxuUU7Eas
         YMXdMi33j5z1kwylx1eaI3Jp7xS/d0GV7JfMAocH0j9tvvmZMdihqA+49S2HYFDMXvPC
         JifMAhQIgqGnC3Ni3UL7BUUUnoColV1KG3uMyGblXFiYoyIJiA9GNbRWilkb/99p6p9J
         hEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=cAIZTRNGPoPiqVtW5MnVVxBT7CaHU2Gg+yih/5Pn2Cw=;
        b=nYUeXL0u+oZ5aj9nwcL66stVNCD5r0zD2nvdqVtDKdGBt2xr4MCBg7fqca2Ok+M2Cx
         nA/Yy7QLFi+qVsl2YOqrshhYK06pY4ZYWp0GOYCAyBk8zIWtQjM14gz1fbUElIpS2Wyd
         WXQyfFK/STXEmWGClxfqiDmhEW0ulKcQ+tv8OPH+mHd4aIi8B6IxHBPRhfZPirGJa2Xa
         9kQrfIeej0V8u2nluqsCz7pGo1SD+Qs0h47XL/3M+D5H4ZWGSCA+AMEHvoLvRzt192sf
         wA4Anr50PaAr56EaAM4v+TfYIp4ksbHxH9yyF55IKY2dhiTujtU6BuigN8jQcG4qaAG9
         vePA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Ir2Z3oJF;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=k5N2xuuR;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=k5N2xuuR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n9si4181271qke.100.2018.11.10.00.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 00:20:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Ir2Z3oJF;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=k5N2xuuR;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=k5N2xuuR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLOUv-0001tB-LF
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 03:20:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOP4-00040u-1N
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:14:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOP0-0000uy-Fh
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:14:01 -0500
Received: from greensocs.com ([193.104.36.180]:43701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gLOOy-0000V7-M7; Sat, 10 Nov 2018 03:13:58 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 3581D5D19A1;
	Sat, 10 Nov 2018 09:13:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837612;
	bh=LMxXTTNAWH8AGdUZMYt2021rnq5Xws6PAKfpWkpVZSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ir2Z3oJFXw3GFSXq6F83CJqebtl7evg+QWnJ3RJxeImRo8hTfNUrOKEMwwsF+0K2u
	HjeEuKByHYY/Xx0G5MJLNjSVzJNkV56p1fZpVQ3eS4aNtIRmue3TX6K5trplfu9Va/
	yCELPMN6+g0VbKAQGZ6fQzX78MOjxLPeasvhVGEs=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=k5N2xuuR;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=k5N2xuuR
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qpWh6bbwxvQp; Sat, 10 Nov 2018 09:13:31 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 8BB315D19AB; Sat, 10 Nov 2018 09:13:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837608;
	bh=LMxXTTNAWH8AGdUZMYt2021rnq5Xws6PAKfpWkpVZSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k5N2xuuRUN7PydvZ05mNM1fKwpwXpiHiG/d2oiplbeGTkzS7UjVRPA9WHk72JluZ9
	f27C+dMUSEwTMX13uIt0qwBKEFQK9wHV3DKy32WYWMJnz2fUKInNK9GombUgqaPYAL
	39XlbsGJAq0AFhIHQF1L7xh0yDg+h9C+6u8kPRr8=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id D8E035D19AA;
	Sat, 10 Nov 2018 09:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837608;
	bh=LMxXTTNAWH8AGdUZMYt2021rnq5Xws6PAKfpWkpVZSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k5N2xuuRUN7PydvZ05mNM1fKwpwXpiHiG/d2oiplbeGTkzS7UjVRPA9WHk72JluZ9
	f27C+dMUSEwTMX13uIt0qwBKEFQK9wHV3DKy32WYWMJnz2fUKInNK9GombUgqaPYAL
	39XlbsGJAq0AFhIHQF1L7xh0yDg+h9C+6u8kPRr8=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 09:11:47 +0100
Message-Id: <20181110081147.4027-17-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181110081147.4027-1-luc.michel@greensocs.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 16/16] arm/xlnx-zynqmp: put APUs and RPUs in
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
X-TUID: SGsunegM2Dej

Create two separate CPU clusters for APUs and RPUs.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
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

