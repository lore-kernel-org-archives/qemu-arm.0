Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11497044wrx;
        Tue, 26 Feb 2019 12:56:29 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZG7+4XYLAqhH9pW4snimc4EpHm5W47Yf9DjdKO+GqVUmtckiNPwe8bLi7lemwSG0p7j5yf
X-Received: by 2002:a25:7c06:: with SMTP id x6mr19971908ybc.387.1551214589350;
        Tue, 26 Feb 2019 12:56:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551214589; cv=none;
        d=google.com; s=arc-20160816;
        b=E6tJ9f9ZSnkjScqLCZFFQc8gCluYA7R3etFKe5zNil0iTaoFZCNPrc2VH5kBzeu2oB
         QjbJBsD1cIyrHkRIYBZb75B9UGAvJwH8lUYEwo1czNQ1dSGQprlz0ZqmVcgA4McY4kEJ
         sQbV2pZ9BTjzkWXkGBqD9MBBnOw1FTm0fEUUQsiCs0o9PGee/iU4/Y/Nb66rN7dUM40K
         i3699LEGtvIsXGYgarbMaI1Vwhf+7JoQu7Fh7REApXGVhJa+Fa64DPUtrFDswYOhNV/2
         4jBS2kge3hvfuuljI1p83v1qeCAMnX5NGlvWC7am92FVey4hxivqBlGMv8qABmRNklaH
         8RBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=QJyCUjcJR8fmZm+RiBLmtsE3CJ5rEZHX6385zrKdqHU=;
        b=cTO3UFYcW2enM42nFEDZaL18By8SRaXgQccxaP9EQFStxl7R+pIF73KBGkIw0ES1fY
         0o9AdqzMXJMdmyI7nEsR3mdhLANerK31/GdVkaDHkCzFfQoEhRt9bcXNQnXwOi7tYsG0
         YH9u/AG2uKWb2/7WvhmaLdaeSKCmEH8/Mw0VvyncaN9bXWc/+pnamvEVH0A+mtCNMH4c
         +g7PI18Pl0NVVhnytMWhdwKDb0v5fEtwm9b17+5G3cJbU3Dccs+v+eCHIJpVOkzGAFme
         B7D6KlHM3aP3ceKVByQFpK7jn1PmqFk/6QbP2GN9hdeAqzhiHLFKiVwfbwf65qz9DxJR
         5Aow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j68si8038472ywg.447.2019.02.26.12.56.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 12:56:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyjm8-0005pB-Mr
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 15:56:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjc9-0006TN-4d
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 15:46:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyjc7-0000n0-Us
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 15:46:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41828)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyjc7-0000QQ-JX; Tue, 26 Feb 2019 15:46:07 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31F1D1F560;
	Tue, 26 Feb 2019 20:45:53 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED0625D6A6;
	Tue, 26 Feb 2019 20:45:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 21:44:33 +0100
Message-Id: <20190226204439.2296-13-eric.auger@redhat.com>
In-Reply-To: <20190226204439.2296-1-eric.auger@redhat.com>
References: <20190226204439.2296-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 26 Feb 2019 20:45:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v9 12/18] hw/arm/boot: Expose the PC-DIMM nodes
 in the DT
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JPb2XgPwdAg4

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

This patch adds memory nodes corresponding to PC-DIMM regions.

NVDIMM and ACPI_NVDIMM configs are not yet set for ARM so we
don't need to care about NVDIMM at this stage.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v8 -> v9:
- removed Igor's R-b

v7 -> v8:
- s/NV_DIMM/NVDIMM
- fix indent
v6 -> v7:
- rework the error messages, use a switch/case
v3 -> v4:
- git rid of @base and @len in fdt_add_hotpluggable_memory_nodes

v1 -> v2:
- added qapi_free_MemoryDeviceInfoList and simplify the loop
---
 hw/arm/boot.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index a830655e1a..4caaf91583 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -19,6 +19,7 @@
 #include "sysemu/numa.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
+#include "hw/mem/memory-device.h"
 #include "elf.h"
 #include "sysemu/device_tree.h"
 #include "qemu/config-file.h"
@@ -522,6 +523,41 @@ static void fdt_add_psci_node(void *fdt)
     qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
 }
=20
+static int fdt_add_hotpluggable_memory_nodes(void *fdt,
+                                             uint32_t acells, uint32_t s=
cells) {
+    MemoryDeviceInfoList *info, *info_list =3D qmp_memory_device_list();
+    MemoryDeviceInfo *mi;
+    int ret =3D 0;
+
+    for (info =3D info_list; info !=3D NULL; info =3D info->next) {
+        mi =3D info->value;
+        switch (mi->type) {
+        case MEMORY_DEVICE_INFO_KIND_DIMM:
+        {
+            PCDIMMDeviceInfo *di =3D mi->u.dimm.data;
+
+            ret =3D fdt_add_memory_node(fdt, acells, di->addr,
+                                      scells, di->size, di->node);
+            if (ret) {
+                fprintf(stderr,
+                        "couldn't add PCDIMM /memory@%"PRIx64" node\n",
+                        di->addr);
+                goto out;
+            }
+            break;
+        }
+        default:
+            fprintf(stderr, "%s memory nodes are not yet supported\n",
+                    MemoryDeviceInfoKind_str(mi->type));
+            ret =3D -ENOENT;
+            goto out;
+        }
+    }
+out:
+    qapi_free_MemoryDeviceInfoList(info_list);
+    return ret;
+}
+
 int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
                  hwaddr addr_limit, AddressSpace *as)
 {
@@ -621,6 +657,12 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
         }
     }
=20
+    rc =3D fdt_add_hotpluggable_memory_nodes(fdt, acells, scells);
+    if (rc < 0) {
+        fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
+        goto fail;
+    }
+
     rc =3D fdt_path_offset(fdt, "/chosen");
     if (rc < 0) {
         qemu_fdt_add_subnode(fdt, "/chosen");
--=20
2.20.1

