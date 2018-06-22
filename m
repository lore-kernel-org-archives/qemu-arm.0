Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp656701wrq;
        Fri, 22 Jun 2018 03:23:35 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeKaW4ZMsrcXmgPsMywv6X3c5vqKlVM7hCRu09/SlRCVQ8CGYSDrx6UFiJi+DZk6O6vncVa
X-Received: by 2002:a37:13e6:: with SMTP id 99-v6mr740101qkt.252.1529663015272;
        Fri, 22 Jun 2018 03:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529663015; cv=none;
        d=google.com; s=arc-20160816;
        b=XveXRjBLV93jan+Tae2LzoSPPskIB45p7ElnmR1zd1aW4QAv32Iw1UgDyWvXgVWGxa
         NNravad0LtASKCV7lCnQefhyUyvILFDVImxkLB1dz2Y5Zza/7iLlwkGm9ldly67lcdcC
         sC6WuLl2hjwiC0YpFGiGD3p4oDCkS1elO8GwFJvD4cRAiXgglQPaZTquBMTNX+V5qDxx
         FkS3LKLhGvhioroJCnh77hQSFODPovLnHfEFm6qHRw05ruQokSfOkTnmNhrz3ZkB+uBz
         /dIz1M9UGP9ZShuYf4HrYCXcHP/rZxyxqblhkFtt/0PY8Z9KbT4HqyRSvSpkW9XdamYA
         JO3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=542jOdhmn3/4bBPVYZ7JsY5enZ+MatkrlxwjSKzLuPw=;
        b=MV2dScM5iEhR6lOTatUbYYWfgrAIPwcQJM4YsNLjK+EQWPyEKmRBLRqynDekHLT9hk
         Q3K+Uk0SFNAAq/CVpAEPH4ojtgJ3OjTqxHY8MZGJ+nRTiDpv/myEH7QOQRxsVGd4W1a6
         kHPqgh8PlVbV3wibrAluiKgpcfYSL1XYMfbMrpqgvprFLCOWeVC5uw6ywpcgTqiayPUA
         QYgX9VSC7sFWIFCnodA0seMysMdCgeXrZI54h/nWL57VA7lnLYcThN0Qzm/dVxqsB+aF
         mbpantL3/IWdk5c/FO/o8Jj18R7ENeie2waMKF1HO297kAvSG/NApANT1e+0b9e6Zj3a
         jd5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o22-v6si4290002qka.72.2018.06.22.03.23.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 03:23:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWJE6-0003KV-RQ
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 06:23:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWJA3-0000Jk-Vj
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 06:19:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWJA3-0005bT-1U
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 06:19:23 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57204 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fWJA2-0005ab-R9; Fri, 22 Jun 2018 06:19:22 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45FF28151D6F;
	Fri, 22 Jun 2018 10:19:22 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F11C011166E1;
	Fri, 22 Jun 2018 10:19:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com
Date: Fri, 22 Jun 2018 12:19:08 +0200
Message-Id: <1529662749-32069-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529662749-32069-1-git-send-email-eric.auger@redhat.com>
References: <1529662749-32069-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 22 Jun 2018 10:19:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 22 Jun 2018 10:19:22 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 4/5] hw/arm/boot: Expose the PC-DIMM nodes in the DT
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wp1NBU5xBXQi

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

This patch add memory nodes corresponding to PC-DIMM
regions.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/boot.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index cc425ce..81668bd 100644
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
@@ -516,6 +517,37 @@ static void fdt_add_psci_node(void *fdt)
     qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
 }
 
+static int fdt_add_hotpluggable_memory_nodes(void *fdt,
+                                             uint64_t base, uint64_t len,
+                                             uint32_t acells, uint32_t scells) {
+    MemoryDeviceInfoList *info_list = qmp_memory_device_list();
+    MemoryDeviceInfoList *info;
+    uint64_t end, cur, size;
+    MemoryDeviceInfo *mi;
+    PCDIMMDeviceInfo *di;
+    bool is_nvdimm;
+    int ret;
+
+    end = base + len;
+    for (cur = base, info = info_list; cur < end;
+         cur += size, info = info->next) {
+        if (!info) {
+            break;
+        }
+        mi = info->value;
+        is_nvdimm = (mi->type == MEMORY_DEVICE_INFO_KIND_NVDIMM);
+        di = !is_nvdimm ? mi->u.dimm.data : mi->u.nvdimm.data;
+
+        ret = fdt_add_memory_node(fdt, acells, di->addr,
+                                  scells, di->size, di->node);
+        if (ret < 0) {
+            return ret;
+        }
+        size = di->size;
+    }
+    return 0;
+}
+
 int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
                  hwaddr addr_limit, AddressSpace *as)
 {
@@ -600,6 +632,14 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
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

