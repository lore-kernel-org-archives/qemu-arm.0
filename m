Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11097904wrx;
        Tue, 26 Feb 2019 05:58:31 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ7Y4erqPMR4IWrscVdFSsosFulp9cuq945yw7Kx1mInrg0GtwuhBpNLc9kvoZJiVNx21H8
X-Received: by 2002:a0d:c6c6:: with SMTP id i189mr18248548ywd.12.1551189511906;
        Tue, 26 Feb 2019 05:58:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551189511; cv=none;
        d=google.com; s=arc-20160816;
        b=ztjVrW5rGISpCrJN7u3rSMCuawpURIyF7k7E35mLyEUC+ZMu9VpxrCrQaJ0vIg60eZ
         Boy6XKIY9J7ODZiBQKvB/iG79MCR1xDCFgTFEwrWJyN7YlnnL6P+/31m+3H/UJCJl4fI
         KoE0p6mtFJL85dTDLNO1xrUt9UDM0/9jY5+0Ltg7GTHAxDOUHM3+KbRSLU+B+zmtKUMF
         tXMQBiYOrcV6TifHrKZ3s2rz9f2mMQk+c66leKS2jlAg9wcgL8w1gLyKf9syYELEJBjk
         4+McrT7rq/0vVxbu63jSoY3OG7Jb6iNUFd49UogFEEySMW+UNTqy9O+HSCOj9/s6LSNh
         sIug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=aZubl2mG0koGiCPBDf80HgL9leTYg1oZlwce9ZJErWo=;
        b=R2WLJmwrmmL/PSODjZrBahEpGfjQKu9XOWdJuXWH7zrFvynjHWAzqFD2S0Mb2YnFQh
         2v318ZXpAZgU3hFgzpvfFEcmzD7ei44ZyBZdEwaeGWfzsViXAOE/E48Q5pDBHeoEfciQ
         H+VRZpb1DO3YqLY4HevYqJUAABCuLvZz01xbFlQnfSH4kvju75w3x+TbZxl6e659SOca
         fv8VwoWx7VYKfTaYkc7kgsDhJzNMYkEFiuJk98+HESmLEn/EyCh8kMg/mc6Pr1Ama09Q
         H93AW9a0av8JL3QwuiM4jlqWrvOuP2cEpoDfUFaWO2KvADUdSo4deoMjVCbPWxaWS0Ku
         AV/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i123si7118049ywg.373.2019.02.26.05.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 05:58:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gydFf-00066s-9e
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 08:58:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd8z-0000YP-K6
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 08:51:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd8q-0007OA-LF
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 08:51:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52066)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyd8o-0007Lr-MU; Tue, 26 Feb 2019 08:51:28 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9434730821E2;
	Tue, 26 Feb 2019 13:51:24 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A78105E1BD;
	Tue, 26 Feb 2019 13:51:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 14:50:08 +0100
Message-Id: <20190226135014.31854-13-eric.auger@redhat.com>
In-Reply-To: <20190226135014.31854-1-eric.auger@redhat.com>
References: <20190226135014.31854-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 26 Feb 2019 13:51:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v8 12/18] hw/arm/boot: Expose the PC-DIMM nodes
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
X-TUID: qoVkYIvVSwye

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

This patch adds memory nodes corresponding to PC-DIMM regions.

NVDIMM and ACPI_NVDIMM configs are not yet set for ARM so we
don't need to care about NVDIMM at this stage.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---
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

