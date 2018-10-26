Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp450640wro;
        Fri, 26 Oct 2018 01:42:20 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ffzVbbfx2bEmMX3aylB23ZTxdbdQDJnDvzwTCHwgpuAABgSvokSprJIbSUEVrGVrixPwgI
X-Received: by 2002:a0c:93e2:: with SMTP id g31mr117875qvg.194.1540543339940;
        Fri, 26 Oct 2018 01:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540543339; cv=none;
        d=google.com; s=arc-20160816;
        b=azevBFSf5Z7iNU9A/DfkzQ+B+3N2+KPsNvCC67zzF9/+vwWa0e4FcOlJ1L1+enNC3B
         z8uQER/IOF7LPNxQ1hlSED+p2Di9oowEsY52MNOkhe3OPNcpT1yJpzFrztetZP/k7vcv
         H5JFWXr95YpKxx7iR5spPJULO67lPsOJk+IgyAcJVyqLQ5vW0xR0wAVNt/rB07iRd6BS
         Rao2ExTpcw/kPNBNfF0DMMNVftjfHsbiMwS3ym/SGB7+WolDLhUxQW4ZMXXncPLVfZvZ
         N9d/5HTUmeggYb2DygAGt8WFO5hkgMSoOU/sPyVFA+MeBGeE+HYsQcOjGLMa/IHj9ayy
         1R5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=agKjZRFwaqmNtrQyX8RLlLY7jSY17tuCkmcN6zy7WIg=;
        b=HtBJ/AWxe1tv9O2wXn8UeJ1ofHkReyxiTlHDGCnvHk6RTkuICWY/zOpqCAxJTWajiU
         p6FQyIVbTHWuliRB01hzpbNmlXgquu14gEW/nOm46tG2uT9bf8QQnVtfUdQXrgLkgzy3
         6eEoP/JF4Hi5FsCqwatA2dLLjFqLmWFclo9HjCgRSDK+8dQ41OVhbciN1Ik8kJt7DWX2
         VhN8a3lQWdrNg/zXqz/nJVjk4rfXRbV5XWG9ugFp93S/L12m/5lIoR9K67SYfqFxSVbX
         ottMXj4ANL+fKNk/pqZibTLr54RwQTDMBnZ8Ymvpl2lPVNGHyc5W9RVBSoWTQeayUrgd
         +/vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VCXgaPL6;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=v2chrusj;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2Zz+F0Y4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u10si8009273qvr.204.2018.10.26.01.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 01:42:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=VCXgaPL6;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=v2chrusj;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2Zz+F0Y4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFxhD-0006Su-EQ
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 04:42:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxUF-0000gN-W9
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:28:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gFxJE-0004pt-Lq
	for qemu-devel@nongnu.org; Fri, 26 Oct 2018 04:17:34 -0400
Received: from greensocs.com ([193.104.36.180]:45399)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gFxJ9-0004lQ-Jm; Fri, 26 Oct 2018 04:17:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 135B9441B51;
	Fri, 26 Oct 2018 10:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541838;
	bh=FPZyVC5tVv7WdxRkgpQY4rs7Qz562EN5IzYD1va8ctA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VCXgaPL6J26K7DWcPgz3zrwUzWftlUIfLVrm2lrRniGthevfZTh4Cv9B0b8fyhpSL
	8sRHNzhpIJyhXRnGkxQV9P4tyRihnFPxq0XKbonD6uAVVqLkR2eCcJVGRlK2rFmDC5
	1loqC0IzoXQ6bPMlxvn58mdfXQHbvexKSGfVwaN8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=v2chrusj;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=2Zz+F0Y4
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4dOj2i8Wkzhi; Fri, 26 Oct 2018 10:17:12 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 06B44441B44; Fri, 26 Oct 2018 10:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541832;
	bh=FPZyVC5tVv7WdxRkgpQY4rs7Qz562EN5IzYD1va8ctA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=v2chrusjq7+j20MYPahLseoT0uO21jAmycZnqy4KmyaqkvX7zrTCUnGH+uKJH7FA/
	s3ZELv7t7hoxqYQaAm/T66ngby4A3SBDq8GGpzx5SsEa6qkTcYzD29Wbd6Q8DEomgw
	ICLroHqmHNkyvrGwgRrzok7MnUXcfVBNqbfAQ9Hc=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 97110441B41;
	Fri, 26 Oct 2018 10:17:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1540541831;
	bh=FPZyVC5tVv7WdxRkgpQY4rs7Qz562EN5IzYD1va8ctA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=2Zz+F0Y4DKzjR4bR9uWKkKkEyIEL+N3BIahz/3TaH1iYyDpBLo0oiZqaE6HrSZe/B
	Avl+yqAbo/Wp6oaY9k30kD7glUMrX6GxFHl8RZmI3DTkNRyCeaC0unpmP3rZb2YoAU
	9ia++TLqNJujMj+IwNmFf13G2oYQXxspioiIHW64=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Oct 2018 10:16:38 +0200
Message-Id: <20181026081653.24602-2-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026081653.24602-1-luc.michel@greensocs.com>
References: <20181026081653.24602-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v3 01/16] hw/cpu: introduce CPU clusters
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
X-TUID: 7zSzb9qX73oG

This commit adds the cpu-cluster type. It aims at gathering CPUs from
the same cluster in a machine.

For now it only has a `cluster-id` property.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 include/hw/cpu/cluster.h | 38 +++++++++++++++++++++++++++++++
 hw/cpu/cluster.c         | 49 ++++++++++++++++++++++++++++++++++++++++
 hw/cpu/Makefile.objs     |  2 +-
 3 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/cpu/cluster.h
 create mode 100644 hw/cpu/cluster.c

diff --git a/include/hw/cpu/cluster.h b/include/hw/cpu/cluster.h
new file mode 100644
index 0000000000..f233a47a4a
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
+#ifndef QEMU_HW_CPU_CLUSTER_H
+#define QEMU_HW_CPU_CLUSTER_H
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
index 0000000000..11121e6f26
--- /dev/null
+++ b/hw/cpu/cluster.c
@@ -0,0 +1,49 @@
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
+#include "hw/cpu/cluster.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
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

