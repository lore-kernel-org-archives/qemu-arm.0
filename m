Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp807880wrw;
        Sat, 10 Nov 2018 00:14:02 -0800 (PST)
X-Google-Smtp-Source: AJdET5dTVMLg/E3ZNSx263i0hNc3Whx/E68D/ue27VU8oLEhNISUQHDxacQ7q+YPuchWJ6S5TZQw
X-Received: by 2002:ac8:43d0:: with SMTP id w16mr11759299qtn.78.1541837642879;
        Sat, 10 Nov 2018 00:14:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541837642; cv=none;
        d=google.com; s=arc-20160816;
        b=Q7jCaMj3GQlecEsMheRgniZ78So9Hugk3vzQ5vAGpYbgZV90+qpF0+y/SmaK/+wzk/
         ygOm+Ni2Xh2SYJAJsZAZ4wfYHAAfWOBFjQZ/jn+uuHZQ7Z40vh7TRDNX92P+SatJCp6q
         KOZy0PY+nSYMqoEwiO1Q1sqEfESG2KNMlDZfWMKalA/D3ZaEfFstDivhAHAWGPUVK2xz
         5amuwraVi/XXFCsLKcJQsjFmFKKasLrZZuEFkxpKtYvNXrY94qRiyf8K7zv69ZU/6af5
         vG51/12CH2M1OVs69X5rcNcqrNaPNACg0yPtu4yzWN7lc/HXWqtNV1wpYh4isnyigNBi
         msAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=02RQdFbYjAUFtHRXhyS6PnnA16j9PPsqVektP6D0n7c=;
        b=NFLieJHYPuymTNhjEg2VeOiVj+aNvQv8v8Jn76YZRMIN6r/cQR0Bu9v4hC8wizqWMt
         WmxvQe4it6b8VbWRwULEUSXKmcuswct22f9qYu1rLdE70RI1QmQ08RpXGx1+9foYrhtz
         l+nvxHFBX7E/+WS4jIC379AnXhjO1tlofmIzQZJjrowMCVv17DgSDTTG1QaWzoylEm9O
         zw0PiUoqTcGQh+I7CeWhxoLQaVTE3hHDPrMyw9IchRL3KjieJDdpL1IAYSzLWjy735au
         F+sD9/shoYs+pUObyvYdHxCemjHwNfGCX6wpDahGCtzBb+Z1Y1nMfuh3RXJJAu9eCokF
         LC6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kBRl5ZDX;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CMO0sjKH;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=gyW4Mjcs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g24si7181196qtm.208.2018.11.10.00.14.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Nov 2018 00:14:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kBRl5ZDX;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CMO0sjKH;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=gyW4Mjcs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37473 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLOP4-0003nA-8O
	for alex.bennee@linaro.org; Sat, 10 Nov 2018 03:14:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOm-0003lD-7E
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gLOOZ-0000Ti-Ba
	for qemu-arm@nongnu.org; Sat, 10 Nov 2018 03:13:38 -0500
Received: from greensocs.com ([193.104.36.180]:43679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gLOOY-0000TB-Vc; Sat, 10 Nov 2018 03:13:31 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id E08565D19A6;
	Sat, 10 Nov 2018 09:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837607;
	bh=JiC+TmMFd9OLB4+WksacmGkhv9++c1guh9aOUkKjcTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kBRl5ZDX/CyglnRFtf7DPe2vBe4uX7hsAonqGiswXHvHxkhJ7KjJkGZ/UfGpUm3tN
	9iXoo7lu2GZK7NPxZ1sM5w43/0MaEJ5MigOXEjczKVq/c8Q/U98bAZRsZchELgpP9d
	d+4LTeGspLbBSLlaEtar9WEMLwEiDQ/tGwE7Um7c=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=CMO0sjKH;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=gyW4Mjcs
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mttch_idWQUd; Sat, 10 Nov 2018 09:13:21 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 08FA45E2E3; Sat, 10 Nov 2018 09:13:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837601;
	bh=JiC+TmMFd9OLB4+WksacmGkhv9++c1guh9aOUkKjcTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CMO0sjKHOzCYWZasLKPTpbj5K4X9t60XwFEhTXsJ4OZPv66J6VEtZ0dQGnKw6E3Vx
	u0f27VV5ncfmQuWbghf2vmc5PwcNkVj34p9OrlFmSjkenpzh9G2i4NpHRW3xr3lXu3
	L1OYuGgVg/YjDtu0PeoPZc2eWnEHgi4zCzlg8VRQ=
Received: from michell-laptop.home.lmichel.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 7E5746FD81;
	Sat, 10 Nov 2018 09:13:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1541837600;
	bh=JiC+TmMFd9OLB4+WksacmGkhv9++c1guh9aOUkKjcTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gyW4MjcsM76OkwCYLYonZZ9swsUkCoWF9UyYVte2dWUJovrt1y5al3xbAWVoIO9R0
	dqJwGoxaUiRy11+w6jzMPfjW5ZqTG5imcgJCoiNpfrt9xuMBJeVp5H845jfNwdi6X2
	u22fUTCrxNKPCdBSCbrWHkz24DaKCMTzLDGjDsWI=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Nov 2018 09:11:32 +0100
Message-Id: <20181110081147.4027-2-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181110081147.4027-1-luc.michel@greensocs.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 01/16] hw/cpu: introduce CPU clusters
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
X-TUID: BM55JJnhm7YC

This commit adds the cpu-cluster type. It aims at gathering CPUs from
the same cluster in a machine.

For now it only has a `cluster-id` property.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
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
index 126fe0be7e..8e20b0e672 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1022,11 +1022,13 @@ Machine core
 M: Eduardo Habkost <ehabkost@redhat.com>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 S: Supported
 F: hw/core/machine.c
 F: hw/core/null-machine.c
+F: hw/cpu/cluster.c
 F: include/hw/boards.h
+F: include/hw/cpu/cluster.h
 T: git git://github.com/ehabkost/qemu.git machine-next
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

