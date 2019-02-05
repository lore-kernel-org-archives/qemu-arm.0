Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5048680wrt;
        Tue, 5 Feb 2019 10:03:12 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYsGKXUelTijK1TurQv1SEbyGoRMDVGE2ixV8mBOcB8C4osyga9sbPPj3lIDeRnLy/KcUMt
X-Received: by 2002:a81:2ed6:: with SMTP id u205mr5053130ywu.176.1549389792185;
        Tue, 05 Feb 2019 10:03:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549389792; cv=none;
        d=google.com; s=arc-20160816;
        b=JdPXSjdFL2ltKIndmsAhurYYSI4nnQIMDuAwVwKcqOecPLQv1pPkN9qrKLb7pBVpRy
         4cKz1mrv8m7ZYKL7ne1KZRvNJP+TYBuWRmVMjLSMJfu322hluW0bdxy1PAvxsww/m+W0
         TWk7VQfyj3mJkT7Q5PVaFEOpqVsRzLL7xEY2mbhFh9r2G2pQi2bXqkamwh8LDPP2CwdY
         OPz/JrMWvyBxcqAO7iTVvFOByprIyRfTCazPaivU9MlOqGaPNlU+5pHN7br394pXjnH7
         B9qaAWXKSpcUy++hpF+i714ciHAqKEy5GBwX4j6sQU+Moqlo096Cs5sH9RpLxKe2YpUY
         vQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=fNpkJ3K+HJYZd5J+b1EYN6ZYygINbcP1oR9lIkJ1wBs=;
        b=tDSgTwlwliMWTlZe6QNZy1kArCtAZKX0HqhuKS8z8TLxX9181WjSomxNb2TKsTDoL0
         dGPkhPj/gbV7hGsVT8Z2rOxEHx/cefV251wKS7weHEqlHAImQ+N0X4MZ3lV+6mpOk/Zw
         4mE1F4Gj1CSiq16cbL52GyCgW3j36MyWWp61mEhQRC7emeGwa9ALCuE9OhcxaqwrejcU
         AD6voGu0Bmdz2Uy6h3lb4OMEJLH3EKoTq4cBGfuKmazF2iziX70cD4rPeCPTy014cQZZ
         /rmM2R6hPx2fsdUlY1Y1eT85RzFT9uL5DSGG5A9FgCRNQGVIf+fGDkDTxYwE0CZ7DJDH
         DZkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 84si2333877ywo.466.2019.02.05.10.03.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 10:03:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr53v-00074k-JU
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 13:03:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4bt-0000QG-S5
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:34:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4bs-0004TZ-Tl
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:34:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51229)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gr4bq-0004RT-0Q; Tue, 05 Feb 2019 12:34:10 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0885F59469;
	Tue,  5 Feb 2019 17:34:09 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5206657982;
	Tue,  5 Feb 2019 17:34:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  5 Feb 2019 18:33:00 +0100
Message-Id: <20190205173306.20483-13-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-1-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 05 Feb 2019 17:34:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 12/18] hw/arm/boot: Expose the PC-DIMM nodes
 in the DT
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xgaM+5ynvUB2

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

This patch add memory nodes corresponding to PC-DIMM regions.

NV_DIMM and ACPI_NVDIMM configs are not yet set for ARM so we
don't need to care about NV-DIMM at this stage.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v3 -> v4:
- git rid of @base and @len in fdt_add_hotpluggable_memory_nodes

v1 -> v2:
- added qapi_free_MemoryDeviceInfoList and simplify the loop
---
 hw/arm/boot.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 2ef367e15b..2a70e8aa82 100644
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
@@ -526,6 +527,34 @@ static void fdt_add_psci_node(void *fdt)
     qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
 }
=20
+static int fdt_add_hotpluggable_memory_nodes(void *fdt,
+                                             uint32_t acells, uint32_t s=
cells) {
+    MemoryDeviceInfoList *info, *info_list =3D qmp_memory_device_list();
+    MemoryDeviceInfo *mi;
+    PCDIMMDeviceInfo *di;
+    bool is_nvdimm;
+    int ret =3D 0;
+
+    for (info =3D info_list; info !=3D NULL; info =3D info->next) {
+        mi =3D info->value;
+        is_nvdimm =3D (mi->type =3D=3D MEMORY_DEVICE_INFO_KIND_NVDIMM);
+        di =3D !is_nvdimm ? mi->u.dimm.data : mi->u.nvdimm.data;
+
+        if (is_nvdimm) {
+            ret =3D -ENOENT; /* NV-DIMM not yet supported */
+        } else {
+            ret =3D fdt_add_memory_node(fdt, acells, di->addr,
+                                      scells, di->size, di->node);
+        }
+        if (ret < 0) {
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
@@ -621,6 +650,12 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_=
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

