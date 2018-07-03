Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp695680wrq;
        Tue, 3 Jul 2018 00:26:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc4aSE0ZROoySkdF0ilcDj5fW1s51FcvtV+tBUcSF9g1bRdb2gBODTISu1TBZVclqIFTi9I
X-Received: by 2002:a37:258b:: with SMTP id l11-v6mr24050601qkl.438.1530602762417;
        Tue, 03 Jul 2018 00:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530602762; cv=none;
        d=google.com; s=arc-20160816;
        b=guUqeoiyCnARaV4dDfvpISrw7uUGrOAIhz5SaS8ZKqNeX6dqPznP9Ov45J9lnOzJik
         0g7ZXHO/ibwaKbJoOVLfq5GKQvycMB/in4Vrl+oyZGQAd6eJR1dmsrjNVt5G4kmcqtOy
         tMumBiAss1VTotJ4nRv499LrjdGHrdqwfw+p1iAX5Z+KMkt5P9RfAGkDNxRzuLHvGuqE
         tPIAL44fUuFaW16J7fPI91eCm5KrRvEigpzmBAL7vrfEXxH8rrdLdf86KFJ0n+8zQJkF
         JjIxVTgjqVap30OYlsHtzml9y0O/Kng0NgmRBWp3KoxWox8PxqFO/c1Z46KY/T7CyBSG
         leGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=aAzPnEaKDffulhRLMoM4Cv2nNHplizEpYX0pjLDgM6w=;
        b=yzfnHVCx4h+AoWc6gt0/mTwWKJPX7pO6cgdvY//UMctGHbEgVsRdXcmboeSN9RJHJk
         Uwa/0QMUcBpUju+a9MPdGyj+ptXhrI1/qpacxdKiN9tXoje4Eu1tk3ujvSSQvpAFSUHI
         LmbRDNJEWEG1MfLA27UvuP0lSVeK5dVpw0B6QVlDalztjzFf+8FITUb5EStv4l0CkiCq
         YWBtBEaqsaodoB3LqR6xgVUyipNg8cnqynoz61q9l6BbGNKDaA/5yq27+G3sfOU1CXEl
         qjZgxV0jRZ+xlPsw4iRLk8EqGf6xEZg0zn9orEuAalj+4DbbrYmX9ujWfXpntqfXW3Mr
         F4Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h8-v6si518177qvb.169.2018.07.03.00.26.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 00:26:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faFhK-0004PM-0X
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 03:26:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFfx-0003nL-7O
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:25:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFcE-0005Pk-Gd
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:24:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48870 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faFcD-0005OY-Sl; Tue, 03 Jul 2018 03:20:46 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 043BF402346D;
	Tue,  3 Jul 2018 07:20:45 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 155861C5B5;
	Tue,  3 Jul 2018 07:20:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  3 Jul 2018 09:19:52 +0200
Message-Id: <1530602398-16127-10-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 03 Jul 2018 07:20:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 03 Jul 2018 07:20:45 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v3 09/15] hw/arm/boot: Expose the PC-DIMM nodes in
 the DT
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
Cc: drjones@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XY31cF4WtB5R

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

