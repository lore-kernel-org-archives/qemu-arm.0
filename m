Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5055235wrx;
        Wed, 20 Feb 2019 14:56:05 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaqTNDvcm2qrg5Y3Zv/8JIDkQSRY47cr2YJu7I/x5/uQnx79+6HrzRA+F+JDKfdyFqWtRsp
X-Received: by 2002:a25:2d5:: with SMTP id 204mr30414173ybc.219.1550703365556;
        Wed, 20 Feb 2019 14:56:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550703365; cv=none;
        d=google.com; s=arc-20160816;
        b=w5a+AzFpKAK0dltIEJndcQBy7xit4F6NDjH6KsjO9UhlPgPKkplI3nL37+9gNsMeEU
         z5wUgRYxPAaJSDsiFRIc4S6GoaF+J4VjqH5FbKYcyeFhO9UJPgyELEXtkFZ7Ehosx/kO
         2Fc8pYnzU4CLjOi0p7S69vhjNFr3/Bs1tJi6oDMTjmuizGOycLB6lLD/y3NLkiMfbhIc
         U/qnw5ovBKJGXoLWW9EuyIg4xQvmKHZ6Yk8AZ4TJFLDXFwg94cDEv9bUxyCm9txDLUAy
         0dDY+wW3hQ56C/sYB2yGSxW/iLIhxSP5bD7Wyetm4oD7JbOE7+JIbq08zdlbqN04m2BZ
         h0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=e6toacrp3PyV9BJtDSX7uGHaqBgdBV0OjJ5r29B9kdE=;
        b=HEFtwOSykJpxOTDvC7KceEBC7pwtQJnbCVt4izcbratf1ehnkYSdI0XbGw7f4OeViy
         HF4byLJ8HvtrKxkj4aFMmJaA2CEGi6247EMD3FbDjkKf4LV98ug1Oq15wgq015Tlf3LF
         gbRIkuD8+o0JGpME9FaGkIXJNTa5HtY0/hzWopAbzk21yzBZEiqppK8EIr79lko1xXGi
         tlndlFycMalrRt1JAkrltJPLHNgrxSLHFIOP34/8JHyswUuo41TGRwBg8OLcTl6CqG8o
         2XPccZW9IH9MjtBlaIgctOUySLt3eT+QGlIJofL2UwxXQ786ENif3aZBDVYhsLrC6vIc
         SESQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o84si8814041ywd.343.2019.02.20.14.56.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 14:56:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50188 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwama-0007uV-W2
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 17:56:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaY4-0004Mj-SM
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:41:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaY3-0000O8-PU
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:41:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58380)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwaY1-0000D8-N8; Wed, 20 Feb 2019 17:41:03 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3F52C049E24;
	Wed, 20 Feb 2019 22:40:54 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3073F5D6AA;
	Wed, 20 Feb 2019 22:40:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 20 Feb 2019 23:39:57 +0100
Message-Id: <20190220224003.4420-12-eric.auger@redhat.com>
In-Reply-To: <20190220224003.4420-1-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 20 Feb 2019 22:40:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 11/17] hw/arm/boot: Expose the PC-DIMM nodes
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pm+CBSqqjWvN

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

This patch adds memory nodes corresponding to PC-DIMM regions.

NV_DIMM and ACPI_NVDIMM configs are not yet set for ARM so we
don't need to care about NV-DIMM at this stage.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
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
index a830655e1a..255aaca0cf 100644
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
+            fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
+            goto fail;
+    }
+
     rc =3D fdt_path_offset(fdt, "/chosen");
     if (rc < 0) {
         qemu_fdt_add_subnode(fdt, "/chosen");
--=20
2.20.1

