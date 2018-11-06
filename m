Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp745955wrw;
        Tue, 6 Nov 2018 03:14:26 -0800 (PST)
X-Google-Smtp-Source: AJdET5cMW74zfv3YXrqJMdlAF0EbPehPnzATpIB4Rg29u3u1QM24x7LZdD8qtu4m207iwH9kWCax
X-Received: by 2002:ae9:e414:: with SMTP id q20mr24063867qkc.205.1541502866276;
        Tue, 06 Nov 2018 03:14:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541502866; cv=none;
        d=google.com; s=arc-20160816;
        b=eMh1dAavq44Um3peeFVQ/IL425vev8di1SfSJv13dr04fy8Z1PivDhetesLu/6JmYK
         yMkcd6y0DDDcadBmbAzSWO0oZOn5pLk4MuiCKPAGaFU2qlra2rm4ifnsmORj0/j3KT2C
         mc/i+nE8FFyDxBFaxOx7waTvPgt25E018qi4PEGeCzwOAeCpgbnBrrMtnCry2bHF+E2N
         /dXdHUM89ALy5awmJkWEuNqzQdr08D8Nay89wm4xoZSfcEQwrWIJ1JOCNyBg6eW3C5KN
         V5sWY6REanL3w5BrwFaa5X2VKeHLb/vNYRyM+vl9p5W3nByC/FIhHcOAX0of1F9F4mTJ
         eSDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=cAIZTRNGPoPiqVtW5MnVVxBT7CaHU2Gg+yih/5Pn2Cw=;
        b=A408URANmLQ9LEqrr/+1FDUijsspGUxofIxJiWyjXEYULRFqhWRie9aRpVkKVM/VYk
         jO4qRXWRjIL0GHP6iX8NXWLsaFCrjkAxQP192CyzPtcMVoUCL60kLGD9g+luGaMTL7KD
         jp3yAu5pMN1XifuMCmInDMlXJQusTusMblYe+ux5fHQnfaiyX0rCdoxlMz0vz/5ZsCK8
         INHlpnfCQXlZnZHQD+8Tsh4BLWNS4zF+9Bwizd8lADoOWu+HPiDj5LCuHqaWz0tcGUpJ
         N+Z+wrwi9c8x5BzMOP7vL8/ZorTx0SxQ3JipXUKb5AXHfgj/K+hGWsiBwDA4yxQW6AkG
         b5fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FoQbE3Ix;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2ZMjqoDQ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2ZMjqoDQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p72si1753851qkp.103.2018.11.06.03.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:14:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=FoQbE3Ix;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2ZMjqoDQ;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2ZMjqoDQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzJQ-0008W1-Np
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:14:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBy-0006dw-ML
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBv-0001Jr-7c
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:42 -0500
Received: from greensocs.com ([193.104.36.180]:46770)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBt-0000ro-PP; Tue, 06 Nov 2018 06:06:39 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A664E5C026D;
	Tue,  6 Nov 2018 12:06:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502376;
	bh=LMxXTTNAWH8AGdUZMYt2021rnq5Xws6PAKfpWkpVZSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FoQbE3IxRJjudo1Ja32o9Z3Tp04upFcv0sMakdmtSymh/v3wc9VTEKEmkyxpovaO+
	eq0F05QPF6mqdZtj6IpfoiAiu8yj8yjgkojG3f9+0BvCooycWdd2JE8xKu7NAu+f9u
	kQehL4rkpFtUdOvZzvrorVqAswxdqnllycj5be34=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=2ZMjqoDQ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=2ZMjqoDQ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZsSAne-TCseE; Tue,  6 Nov 2018 12:06:15 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 4C7825C0265; Tue,  6 Nov 2018 12:06:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502372;
	bh=LMxXTTNAWH8AGdUZMYt2021rnq5Xws6PAKfpWkpVZSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=2ZMjqoDQ8NzJ25TgSEm2vys+x974TPTWqB0oFPma0rkRRPFSEpYhN5rZgqJPOZ90c
	iCE2Yh8xHZewPAFXpUdO+0l48OwAY4w5T2KVCfNrJDnc87ehE9qpCCBUT3RzlM003N
	g2zeIPFhyM4Zko50t2qzEwN5VDBAwICDojVoI65Y=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id CA4085C024B;
	Tue,  6 Nov 2018 12:06:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502372;
	bh=LMxXTTNAWH8AGdUZMYt2021rnq5Xws6PAKfpWkpVZSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=2ZMjqoDQ8NzJ25TgSEm2vys+x974TPTWqB0oFPma0rkRRPFSEpYhN5rZgqJPOZ90c
	iCE2Yh8xHZewPAFXpUdO+0l48OwAY4w5T2KVCfNrJDnc87ehE9qpCCBUT3RzlM003N
	g2zeIPFhyM4Zko50t2qzEwN5VDBAwICDojVoI65Y=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:48 +0100
Message-Id: <20181106110548.4209-17-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 16/16] arm/xlnx-zynqmp: put APUs and RPUs in
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
X-TUID: SUZqwAcB2OzI

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

