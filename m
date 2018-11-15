Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6806221wrw;
        Thu, 15 Nov 2018 01:54:07 -0800 (PST)
X-Google-Smtp-Source: AJdET5cjHjnhWrfgRl+VA06GvVcEeLl/SUIy6jQJNRoQ7U/whlgW+dP8+ynmINotAP7UnNmtLFeM
X-Received: by 2002:a37:4b44:: with SMTP id y65mr5112127qka.316.1542275647778;
        Thu, 15 Nov 2018 01:54:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542275647; cv=none;
        d=google.com; s=arc-20160816;
        b=FHFsEM0O75egvVXZVE8PwIPEBuqFBHXQUrjlSO03TEeK2ki5owXlflXsVaLZMteONK
         9L1X7g+0De/lTQRUo4B3jb3UExxiNyAGb2cbVcY+MIz6Q0INxfYyzipxDbhgkcLz0erw
         zKLBgKZPbpc7mZyaL4oOoWbvqe2C3j1R1Hhva2Q+ResWhL3E2nb4KCm55xbO0QmslUjH
         VA87T+BdL3H45DfBa8jGgc6zC1lEQzUp4pxL7b+7O/8OME5QOoYMg3vjzDIqR7xSmsay
         A4caxkWpdqjH9MS8QeQt27qW6E60aUojUmtJZiH7FWuwhQfflb74JGsjJpODdo/C/850
         86vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=LFiL96Xyfnj77mSYx/+U+cX0DVJM/HdIk/5MHDNcIag=;
        b=ec5ss4/ntsB1T00ATv/zjVB+QXCclIKjmic0EvAkOzyz8nFtWal9FxvayIGwPLSpdd
         qUUKpYb10lQRAFB53QFqIiD153F0TsJc6gcWMI4EIXEd9s8teoA3OM/x32XUn/zQ7/tA
         xhT/8Lg4MYxehXNBQ0D7ZtF8q7t1uSou66Sr8cAuOXmCfRtyGRQFIsQex6TjZ51wB+8o
         kbrTP/Y7YpyPNQ6cg0B5lasHGQLy/moMnAS2mZbAHqlhGVqgbjVrG2Eu3PxBWHXDndup
         aqrnBt4i3X6igIWpBsf9fQaDY66qVgpIaIozLniYO0ObvUgHa5vuVXT/yhzWUeX+xsPp
         xTOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fhqipl6M;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rgBeLN2t;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rgBeLN2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s29si6877790qth.384.2018.11.15.01.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:54:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fhqipl6M;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rgBeLN2t;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=rgBeLN2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37717 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNELf-0007we-45
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:54:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAm-0007PW-SY
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAk-0004lv-EU
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:52 -0500
Received: from greensocs.com ([193.104.36.180]:41904)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEAk-0004NP-49; Thu, 15 Nov 2018 04:42:50 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id BA45C44325B;
	Thu, 15 Nov 2018 10:42:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274940;
	bh=Dkji4JTfOdePjfk92E+wL5e2vsn+se5ApMpIQQk9dpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fhqipl6MXaULk1MfmS37Pg5sVXuKicOLiowChTpqKyJQAYxLAHagKCpQlKA8by76A
	30IGygdw4P0Oq+Q5u5pwEffZcVRRG9xfv4N79rnh58uAZpfqG8KS1PoF3I0XB1puP8
	WWMNIp3oA9BhOG4xfsUXx3bDdvMzBICRhlWQnaMQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=rgBeLN2t;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=rgBeLN2t
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VpKE5Dt3e3f5; Thu, 15 Nov 2018 10:42:19 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id CF83F446876; Thu, 15 Nov 2018 10:42:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274939;
	bh=Dkji4JTfOdePjfk92E+wL5e2vsn+se5ApMpIQQk9dpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rgBeLN2tgEAcQ3JvVwPIf59Y9zYwGJDNCRichPiNH1vYH+ZEAGd5LZQCJTHy4IWeK
	j4yJK6ivKRY7OheLD1o6qL+4Eyb2/NCk0pzPZ0NafKeN9BQnzjYuWNFs0Q4CGL/HGk
	CTLgRCj4fqno0BOKT1DZZv7A4Dhr6nbtgjlfDMYU=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 5C2BC441B57;
	Thu, 15 Nov 2018 10:42:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274939;
	bh=Dkji4JTfOdePjfk92E+wL5e2vsn+se5ApMpIQQk9dpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rgBeLN2tgEAcQ3JvVwPIf59Y9zYwGJDNCRichPiNH1vYH+ZEAGd5LZQCJTHy4IWeK
	j4yJK6ivKRY7OheLD1o6qL+4Eyb2/NCk0pzPZ0NafKeN9BQnzjYuWNFs0Q4CGL/HGk
	CTLgRCj4fqno0BOKT1DZZv7A4Dhr6nbtgjlfDMYU=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:42:07 +0100
Message-Id: <20181115094207.22846-17-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v6 16/16] arm/xlnx-zynqmp: put APUs and RPUs in
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
X-TUID: R5LsR22lYnkn

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

