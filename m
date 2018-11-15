Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp6797807wrw;
        Thu, 15 Nov 2018 01:42:58 -0800 (PST)
X-Google-Smtp-Source: AJdET5dSik6JflhepEnppbx1friEZozlwDB1grhm75jIsaHnMTGf7IpLJni9yXdhNoOJrgOMpN7v
X-Received: by 2002:ac8:60cb:: with SMTP id i11mr5424504qtm.360.1542274978163;
        Thu, 15 Nov 2018 01:42:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542274978; cv=none;
        d=google.com; s=arc-20160816;
        b=U/jq7/9FWRJbLol1OtNTkbbe0bPozasm0VoCk5qIaRKDJ/S1/aRmHrN6Aps69ByaAk
         fjYAs0Ytoeyx5tObZD4TzGFfVyBghFH6iubRQuaEQg5k5NfSV7aLbseroscyD1Smpoaj
         rNkxZBZav4C9rLVaAfwJnBj//ruCj9u/DtK7fYm0Zwji113ad+ZIV6TDZdF/60hfeGCt
         G28ENepKu2EVZL6nMmRaVAaDfbjQwKAyfjrjd7m89iV/ycBc4JM8+GYmPokLXrTiMMsJ
         WxeYYkzuTweVJPhM6V/SKiwy1YyvBWa0//golHpPC19BD5jjWzFM5RbRF9c37SrnQsCS
         nhJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=5CuWqAdFtsqH3WAlBaO9+nJVWI8hvv6C366sJ/EwWH8=;
        b=yQAOkNJKYC3Euh4oQJMRbHqWpS6KUMGcDDtU1NpO5WtMr5ya73IUMbdySn7RdliPwf
         KRH7vR1Gv9EpNqKdemsWazKyk1zJMmd+7zoRbgjVfkwpHK85SCpAZnJFMxhTX1HeZJzJ
         S+8CDDeT689SBK1EBEjPKBHE+3OgeN1s++3ww7LTjBphwx9PtC8IZZEjhE4YzV68YxyM
         6WE97i+iYIh/YKJ54iXvTaKfY3NfiVkEQ6SS2nQRkdSPN1vC3h0WwZ+9mLUacTkUdPPp
         /iTnYF8ql3Iq24n3KU9k+pujrHnHGK7PFNmFIlsc8/hFRbj1+NST/Qi1Le1/2DtPsgQo
         Vwug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pAbLDrai;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mYD9Zjny;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mYD9Zjny;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t11si6578573qtn.365.2018.11.15.01.42.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 01:42:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=pAbLDrai;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mYD9Zjny;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mYD9Zjny;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNEAr-00074I-FK
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 04:42:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAU-0006my-QR
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gNEAH-0004Ms-NL
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 04:42:28 -0500
Received: from greensocs.com ([193.104.36.180]:41855)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gNEAH-0004Lm-0q; Thu, 15 Nov 2018 04:42:21 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 1AB9C6FD8D;
	Thu, 15 Nov 2018 10:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274934;
	bh=tkFfkyXsfXUrbWBdmWA6tql8O+uSKaP2Zc61/2iL4AE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pAbLDraioJ5rhlQy0Mg1c+0or6HMNHHAodhfj8QwsHZp06R/xRk4RqwhACtJXK3pl
	KfB/CBz1rdakFd3IiMifcz9RODGOqitw1Om0ReexqTP8DAsVhHiKtZ7JNd/MpXncj6
	RSMpLfMnCgv9mx92iIbbq/oKwLmCXIuz731yddN4=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=mYD9Zjny;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=mYD9Zjny
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eYhW1oBDq3sg; Thu, 15 Nov 2018 10:42:12 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 933415BD180; Thu, 15 Nov 2018 10:42:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274932;
	bh=tkFfkyXsfXUrbWBdmWA6tql8O+uSKaP2Zc61/2iL4AE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mYD9ZjnysHWZn838BvBDRau6gRSIRsixwl3UaEvgSdZh8jQEuDoTAHfSctjUh2CUp
	mA57anHUgMTO4pBgyQmTzE6qyFK4oHh/qzwI1AFG8ORAhYEP04YDEodw/KpLgy2kvB
	BJZQr0xNAGN57XHRTQo+Q4kE3eJteroNptj5Yoww=
Received: from michell-laptop.hive.antfield.fr
	(lfbn-1-8165-82.w90-112.abo.wanadoo.fr [90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 32E795BD196;
	Thu, 15 Nov 2018 10:42:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542274932;
	bh=tkFfkyXsfXUrbWBdmWA6tql8O+uSKaP2Zc61/2iL4AE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mYD9ZjnysHWZn838BvBDRau6gRSIRsixwl3UaEvgSdZh8jQEuDoTAHfSctjUh2CUp
	mA57anHUgMTO4pBgyQmTzE6qyFK4oHh/qzwI1AFG8ORAhYEP04YDEodw/KpLgy2kvB
	BJZQr0xNAGN57XHRTQo+Q4kE3eJteroNptj5Yoww=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 10:41:52 +0100
Message-Id: <20181115094207.22846-2-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115094207.22846-1-luc.michel@greensocs.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v6 01/16] hw/cpu: introduce CPU clusters
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
X-TUID: noBICKa4gOHm

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
index 4b8db618f5..3e7a0b09c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1029,11 +1029,13 @@ Machine core
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

