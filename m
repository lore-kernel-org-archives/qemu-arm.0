Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp739817wrw;
        Tue, 6 Nov 2018 03:07:45 -0800 (PST)
X-Google-Smtp-Source: AJdET5diRTkYffaZI4aEH+38Ssn44JjwJoYFZyHoJWgGXEASmN7KewRPJ+b4EiVehp8cM20FrZPb
X-Received: by 2002:ac8:66c9:: with SMTP id m9-v6mr25219741qtp.349.1541502465102;
        Tue, 06 Nov 2018 03:07:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541502465; cv=none;
        d=google.com; s=arc-20160816;
        b=phCOi5lb3ah1oN+GBbp6krhdk0w4H2BBXpcGmJrAVACFRlsOdpFqk6c81tVIoXTQtX
         h9sxx9bqTv/cFSAdCr+6lyl7IHmEXh8jFWivkcI3wPk6b50uvXk+LrPt7upJ+L72EA8j
         H3TB/pmB4f4aP3jw8zEzp+CnDjOsq3jLJ6RjtUfKIA1xA4dp1unvNpK8q/1wPN5zW5bs
         suKsDwUqu8GK8o39PcwFrJNfZkuNAUwGxkeHOrV2nnCod+ZjSZJHooTPCm2qlMJA0qLu
         HvyHCb53y5fxIcWtGyYMnxepMBk3KV6DEaw2XxP6bgBh8kSseIY0fD33uSN46gGAdgva
         iCGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=MQpSZkOxxw8UidpXMe0DBz6hF5UcEnT82oWaYJ/eV2E=;
        b=KdAXqQzLFeMUouLUoq1pnJ6SLZnwjjkyc7ufrbx+jKaR7PqvZqEhMvidQt6wvxOJHK
         OPTc2QZrqE7+F5W2/RfGU0eR70F6T/lHVT7vNiDijriy2+MfsUUfNNhF5mgKb9Jq97JI
         BzgnwQuECSvFEJSPkiHVusfCRla/N2rwatswQnxxWNNcHTVPUX4QmPtku0MpLC7H4RRu
         3hSYbxqDqlVWBf6jbgK9eDV1bN2gxkBqiqusxNEsUC2r7Vs+jYtkiOrTIxSG/iMCYulA
         GfLMeWIFciZrWehlM+XLxtCikAHQhDKmDTI4dsOzG007i+E+nbaIKeogVrQFH/JqT/57
         cC2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="KqX/g044";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=K5lY2yjT;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ixawxQ5p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a50si11267800qva.46.2018.11.06.03.07.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 03:07:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="KqX/g044";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=K5lY2yjT;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ixawxQ5p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40303 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJzCy-0007G0-I2
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 06:07:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBa-0006FP-A5
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gJzBU-0000oU-3o
	for qemu-arm@nongnu.org; Tue, 06 Nov 2018 06:06:18 -0500
Received: from greensocs.com ([193.104.36.180]:46660)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gJzBT-0000nN-HV; Tue, 06 Nov 2018 06:06:11 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 3097D5C0278;
	Tue,  6 Nov 2018 12:06:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502369;
	bh=MxbKaNPQK1NN8a+G9jf/26t1f3PDDIZbSdujeWwAJmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KqX/g044FhMkvigUvT+SkJoSnE/pb9nv7wfDi++en6uFTg0XRZOMHZ/wsbz5+YZVQ
	OJ1BTA/G5P6zMZQrSmxa9cSBuG0YW1AsbxZvAWs9SVdWIDgY+S5Th9fK1mYRG9rytD
	lHoldbQm0SNR48bbpdwLMwD/zSp4cRli3Nxd8oYc=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=K5lY2yjT;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ixawxQ5p
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xr6Ah43N669x; Tue,  6 Nov 2018 12:06:05 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 0F50C441B53; Tue,  6 Nov 2018 12:06:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502365;
	bh=MxbKaNPQK1NN8a+G9jf/26t1f3PDDIZbSdujeWwAJmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K5lY2yjTE/ChuweE12Uz7RvYZsWFYKR/aOX3LIVyNiRzDZzQqa94Q8MHzbjZuYUJ1
	vy9OH/XDrHwGin53Mdtz8uVlxMnro+xa9WpUUa6XIaYKnhlTN6czlkASeHOlky9L1J
	9NUCDOu1WwodqzCzZ7jeGei73VdKeUKvJwjH0cXY=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 9AA464F7670;
	Tue,  6 Nov 2018 12:06:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541502364;
	bh=MxbKaNPQK1NN8a+G9jf/26t1f3PDDIZbSdujeWwAJmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ixawxQ5peUoPSxYlqDrGuzm464/A3PyybQfK1EgKPtFQ4H8PmnTa03e9qO/1IFmsz
	l8aFkWqoWOC2NZBprd+A27hnUJJaPbOSHKmYqKSB4+19t4quMtqehI77sBTaufbAcx
	eJvJOMkz+V20spvtRlej0lzq4sp0aNmcBZGNl6eQ=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Nov 2018 12:05:33 +0100
Message-Id: <20181106110548.4209-2-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181106110548.4209-1-luc.michel@greensocs.com>
References: <20181106110548.4209-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 01/16] hw/cpu: introduce CPU clusters
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
X-TUID: ecE/mqURnXl1

This commit adds the cpu-cluster type. It aims at gathering CPUs from
the same cluster in a machine.

For now it only has a `cluster-id` property.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/cpu/cluster.h | 38 ++++++++++++++++++++++++++
 hw/cpu/cluster.c         | 59 ++++++++++++++++++++++++++++++++++++++++
 hw/cpu/Makefile.objs     |  2 +-
 3 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/cpu/cluster.h
 create mode 100644 hw/cpu/cluster.c

diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
new file mode 100644
index 0000000000..0e5f121ec2
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
+    uint64_t cluster_id;
+} CPUClusterState;
+
+#endif
diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
new file mode 100644
index 0000000000..a23d55054a
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
+    static uint64_t cluster_id_auto_increment =3D 0;
+    CPUClusterState *cluster =3D CPU_CLUSTER(obj);
+
+    cluster->cluster_id =3D cluster_id_auto_increment++;
+}
+
+static Property cpu_cluster_properties[] =3D {
+    DEFINE_PROP_UINT64("cluster-id", CPUClusterState, cluster_id, 0),
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

