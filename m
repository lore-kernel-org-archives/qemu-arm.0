Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp114108wrq;
        Mon, 2 Jul 2018 10:26:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdCGfPHWppXGWrdPS5TEYl4RohqXMn2sIBuzjBwWjFVfeCtyBtYE0X+5efQ7872BkPQOf4D
X-Received: by 2002:aed:3403:: with SMTP id w3-v6mr24692779qtd.361.1530552413435;
        Mon, 02 Jul 2018 10:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530552413; cv=none;
        d=google.com; s=arc-20160816;
        b=f7UFWjXLldx9tBWcYT9wLvray+4A6+SK3Ggp5f3vRdfSUUJpPj6Hk75vq51qYNoLAo
         W8hr1FIxcyl0ERxE4NYPrnDUQ+TagMmOddb5hRhIbtU0Es5jOIJEKzSn7CRB3lgaK1XF
         9a0QhdbnJo08wuclXYo/EHrox2XHJCmxEiQ41EgQzLwaPbz5Ib1BZANb4jktpY1rMW75
         6mesTAp46AtwvrDKQBBRbSEowM4JZkL/ZwOcSsWO9ikepmoboJ45DrjJcBJ5xtsQ8qVd
         Qb25k+FLzjqRJzVgNzDeKeCM+NtyNWxXjHjUCYYrnn/G3/UUHuanWiCuK3i0hvwP7/sP
         QN6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=aAzPnEaKDffulhRLMoM4Cv2nNHplizEpYX0pjLDgM6w=;
        b=GpovOG9CwjsvdDbcUDwb4HThrOHTzrpT2jsaWsafcxPXLVOkPnxWczD3tTASxwBwOd
         CsOdNtO/NxyoAeLTc0hTpos3XKcxR4bhFAiy82kyIyZpwCMyQl58z/5rpwa1VRVWPx5M
         2KZ5AZAriON+pXlIh24NVElrWyoVoQ/F6oSkIo8DrYslXSdKXUaP32av0yZ8A5zQEDSI
         Ylne5xDkTFHJ4MGiC4BtVcQa9yRVh2Jg2K1S8rA20zwxpUmYwS9rPB02SFVFbiimuZw4
         i8SKFi5mXujKtWI9GrQG/lSBbRMsXntihWVUXrDCQHCoBsFONnThLXj6+5rgXxyHi3tu
         9Xng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r13-v6si1573334qvr.217.2018.07.02.10.26.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 10:26:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa2bE-0002Dw-Rq
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 13:26:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2Y9-0000P7-F5
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 13:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2Y8-0006qa-Ga
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 13:23:41 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49754 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fa2Y2-0006kr-6s; Mon, 02 Jul 2018 13:23:34 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C45BA7CBBA;
	Mon,  2 Jul 2018 17:23:33 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14588111AF38;
	Mon,  2 Jul 2018 17:23:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Mon,  2 Jul 2018 19:22:36 +0200
Message-Id: <1530552162-15533-10-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
References: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 02 Jul 2018 17:23:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 02 Jul 2018 17:23:33 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC v2 09/15] hw/arm/boot: Expose the PC-DIMM nodes
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
Cc: wei@redhat.com, drjones@redhat.com, david@gibson.dropbear.id.au,
	dgilbert@redhat.com, agraf@suse.de
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bug/8sy/Rh/u

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

This patch add memory nodes corresponding to PC-DIMM regions.

NV_DIMM and ACPI_NVDIMM configs are not yet set for ARM so we
don't need to care about NV-DIMM at this stage.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- added qapi_free_MemoryDeviceInfoList and simplify the loop
---
 hw/arm/boot.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 5243a25..2c7d558 100644
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
@@ -516,6 +517,35 @@ static void fdt_add_psci_node(void *fdt)
     qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
 }
 
+static int fdt_add_hotpluggable_memory_nodes(void *fdt,
+                                             uint64_t base, uint64_t len,
+                                             uint32_t acells, uint32_t scells) {
+    MemoryDeviceInfoList *info, *info_list = qmp_memory_device_list();
+    MemoryDeviceInfo *mi;
+    PCDIMMDeviceInfo *di;
+    bool is_nvdimm;
+    int ret = 0;
+
+    for (info = info_list; info != NULL; info = info->next) {
+        mi = info->value;
+        is_nvdimm = (mi->type == MEMORY_DEVICE_INFO_KIND_NVDIMM);
+        di = !is_nvdimm ? mi->u.dimm.data : mi->u.nvdimm.data;
+
+        if (is_nvdimm) {
+            ret = -ENOENT; /* NV-DIMM not yet supported */
+        } else {
+            ret = fdt_add_memory_node(fdt, acells, di->addr,
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
@@ -611,6 +641,14 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         }
     }
 
+    rc = fdt_add_hotpluggable_memory_nodes(fdt, binfo->device_memory_start,
+                                           binfo->device_memory_size,
+                                           acells, scells);
+    if (rc < 0) {
+            fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
+            goto fail;
+    }
+
     rc = fdt_path_offset(fdt, "/chosen");
     if (rc < 0) {
         qemu_fdt_add_subnode(fdt, "/chosen");
-- 
2.5.5

