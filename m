Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1749096wrt;
        Fri, 23 Nov 2018 01:18:21 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UGAYnuSMDlVYkuXFojuAor4mgQzvgTRUkAXzwDBcdXe7HCRLf1FUvxxyQ2+Bn+e19R4BSo
X-Received: by 2002:a25:bdcc:: with SMTP id g12-v6mr14753934ybk.380.1542964701619;
        Fri, 23 Nov 2018 01:18:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542964701; cv=none;
        d=google.com; s=arc-20160816;
        b=KCbGAKhIvMtY8LunerIYLRqit3qdu7kkVyfmhiTibWmFSSIq0c/HRZDOYFfcukvKJe
         AN8YkWn1sztEHWYrfeZW7z7p6jo01XD/4X9pBZaQMZAuzPaqPmt3onAsM7jXZMs0PPls
         0bozRhxSbeKpuu1XImjNbt8Yt2WGgnALHmytnfXkDMAerYdrNsVhj2TtJnMmijYKe8OK
         hLE7PGOlsk9pdKE2+KythoACuRDreApTznbg4yuirbhA3g9m4AQgME7/eBv6ii3ddGvO
         RXf3erI2wkb+ACfcGixJdgX/Ucx8gNV75ET6LZcFOYnCYt7+YvOl8FWK1Js3kLScTmd0
         WE/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=71THREh6YP6cNOi1HzAoJyBLU+8V4T0Fg18buxtLJOM=;
        b=JPjySfGTYOI2DgecYFrivkARe+TSI9/mxLNjSz8SkUVEzN9lmFRGYyq+TEOT9vZvfH
         FFc7bse9sJudhzCMo7w9uf2MsgtCea44R98ZyBjuo2D0oEJ+Q3pshMuDTFiocIKsKZLN
         v2th1IwbaebCLQrqql+mM/lGOYhJMc22USSil5BH/uWQ2/huxlLT3JgUxVFPMPEqqp4z
         2iLA8zD2/4QWysqfkQyO0PRsyD26iU8mqVubhmOEBzxCx/+/8YDpEPe0KzEHrPOZ0dkt
         fl/zYVNQDZ+aqK6yrKCbfDMgxkUH+mNHB9ih4lfmIsSehN85IkX7BUl0kmAf8zdLtlBD
         2z2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OETuszPu;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Mg9HSvVp;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Mg9HSvVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b10-v6si24482819ybe.111.2018.11.23.01.18.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:18:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=OETuszPu;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Mg9HSvVp;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Mg9HSvVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51143 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7bQ-0007vX-TJ
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:18:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7ay-0007oc-Mo
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gQ7at-0000WV-FG
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:17:52 -0500
Received: from greensocs.com ([193.104.36.180]:47021)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gQ7ar-0000Lk-2d; Fri, 23 Nov 2018 04:17:45 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 537395C0266;
	Fri, 23 Nov 2018 10:17:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964655;
	bh=ju1WYvA2EUmZY7kpvwLEudOdGl4YYRBkHtotf0cphzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OETuszPuWSpcpKvIR9ExtNDNSolDhtwyqqpawQm8woDhYoW1SE9YStV+09LlwLtD7
	vU4AlsOY3dOiGQzC8V4AtN6FGJLsKIwZCCo1OehVKnhBmLLKpuw9lJJm8sdjR+TyEj
	5omMbqM6bzChnomg5MWiHUE6E7Wrw0xc0nf3TuTA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Mg9HSvVp;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Mg9HSvVp
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u0lu6FIHAYnR; Fri, 23 Nov 2018 10:17:32 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 2114D5BD1B4; Fri, 23 Nov 2018 10:17:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964652;
	bh=ju1WYvA2EUmZY7kpvwLEudOdGl4YYRBkHtotf0cphzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mg9HSvVp+ZN2qclMleC8+PqwMr8Z3oho1bh7oUvZxs138GKzLBpq6QVZwY9Ye72JG
	qVCsl/HLOik6kqELjhylWEyJIKPcx/7Oy6YyxHkFliRnG1OyV8WuABw/VNBjLYllTM
	Nx9YeBDIIGummdQj4gziMDkn4xLDWktLi02GWIQ4=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id B659944688F;
	Fri, 23 Nov 2018 10:17:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542964652;
	bh=ju1WYvA2EUmZY7kpvwLEudOdGl4YYRBkHtotf0cphzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mg9HSvVp+ZN2qclMleC8+PqwMr8Z3oho1bh7oUvZxs138GKzLBpq6QVZwY9Ye72JG
	qVCsl/HLOik6kqELjhylWEyJIKPcx/7Oy6YyxHkFliRnG1OyV8WuABw/VNBjLYllTM
	Nx9YeBDIIGummdQj4gziMDkn4xLDWktLi02GWIQ4=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Nov 2018 10:17:14 +0100
Message-Id: <20181123091729.29921-2-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181123091729.29921-1-luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v7 01/16] hw/cpu: introduce CPU clusters
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
X-TUID: 4wlXnTfQnyJa

This commit adds the cpu-cluster type. It aims at gathering CPUs from
the same cluster in a machine.

For now it only has a `cluster-id` property.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/hw/cpu/cluster.h | 38 ++++++++++++++++++++++++++
 hw/cpu/cluster.c         | 59 ++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS              |  2 ++
 hw/cpu/Makefile.objs     |  2 +-
 4 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/cpu/cluster.h
 create mode 100644 hw/cpu/cluster.c

diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
new file mode 100644
index 0000000000..11f50d5f6b
--- /dev/null
+++ b/include/hw/cpu/cluster.h
@@ -0,0 +1,38 @@
+/*
+ * QEMU CPU cluster
+ *
+ * Copyright (c) 2018 GreenSocs SAS
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+#ifndef HW_CPU_CLUSTER_H
+#define HW_CPU_CLUSTER_H
+
+#include "qemu/osdep.h"
+#include "hw/qdev.h"
+
+#define TYPE_CPU_CLUSTER "cpu-cluster"
+#define CPU_CLUSTER(obj) \
+    OBJECT_CHECK(CPUClusterState, (obj), TYPE_CPU_CLUSTER)
+
+typedef struct CPUClusterState {
+    /*< private >*/
+    DeviceState parent_obj;
+
+    /*< public >*/
+    uint32_t cluster_id;
+} CPUClusterState;
+
+#endif
diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
new file mode 100644
index 0000000000..e0ffd76152
--- /dev/null
+++ b/hw/cpu/cluster.c
@@ -0,0 +1,59 @@
+/*
+ * QEMU CPU cluster
+ *
+ * Copyright (c) 2018 GreenSocs SAS
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+
+#include "qemu/osdep.h"
+#include "hw/cpu/cluster.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+
+static void cpu_cluster_init(Object *obj)
+{
+    static uint32_t cluster_id_auto_increment;
+    CPUClusterState *cluster =3D CPU_CLUSTER(obj);
+
+    cluster->cluster_id =3D cluster_id_auto_increment++;
+}
+
+static Property cpu_cluster_properties[] =3D {
+    DEFINE_PROP_UINT32("cluster-id", CPUClusterState, cluster_id, 0),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void cpu_cluster_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->props =3D cpu_cluster_properties;
+}
+
+static const TypeInfo cpu_cluster_type_info =3D {
+    .name =3D TYPE_CPU_CLUSTER,
+    .parent =3D TYPE_DEVICE,
+    .instance_size =3D sizeof(CPUClusterState),
+    .instance_init =3D cpu_cluster_init,
+    .class_init =3D cpu_cluster_class_init,
+};
+
+static void cpu_cluster_register_types(void)
+{
+    type_register_static(&cpu_cluster_type_info);
+}
+
+type_init(cpu_cluster_register_types)
diff --git a/MAINTAINERS b/MAINTAINERS
index 1032406c56..f7d47d2b1d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1120,11 +1120,13 @@ Machine core
 M: Eduardo Habkost <ehabkost@redhat.com>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 S: Supported
 F: hw/core/machine.c
 F: hw/core/null-machine.c
+F: hw/cpu/cluster.c
 F: include/hw/boards.h
+F: include/hw/cpu/cluster.h
 T: git https://github.com/ehabkost/qemu.git machine-next
=20
 Xtensa Machines
 ---------------
 sim
diff --git a/hw/cpu/Makefile.objs b/hw/cpu/Makefile.objs
index cd52d20b65..8db9e8a7b3 100644
--- a/hw/cpu/Makefile.objs
+++ b/hw/cpu/Makefile.objs
@@ -1,5 +1,5 @@
 obj-$(CONFIG_ARM11MPCORE) +=3D arm11mpcore.o
 obj-$(CONFIG_REALVIEW) +=3D realview_mpcore.o
 obj-$(CONFIG_A9MPCORE) +=3D a9mpcore.o
 obj-$(CONFIG_A15MPCORE) +=3D a15mpcore.o
-common-obj-y +=3D core.o
+common-obj-y +=3D core.o cluster.o
--=20
2.19.1

