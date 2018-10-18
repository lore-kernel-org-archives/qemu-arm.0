Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2390464wrt;
        Thu, 18 Oct 2018 07:42:53 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62rxCqvvuSwgeXl7vefZJXYBAu8BJdiV+vu1Wi+9CggwmTpFF/7oeFdfR8XYPWmWDj89hyV
X-Received: by 2002:a37:4b44:: with SMTP id y65-v6mr27919336qka.218.1539873773472;
        Thu, 18 Oct 2018 07:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539873773; cv=none;
        d=google.com; s=arc-20160816;
        b=pV1qIkMzh+IDFczKwtVL4dfGrSepE9HKJroSR1Qmmnpbf0Darlu5d8C+hIaWkQr3Ws
         93ev8+l6PtYGRWOesth+MsbZWiCbEsmzg5gsuEA8sUazjvIsz+eThA2SAPR2wOaFY2RO
         Sv4umKe313kl8qwCmtrut1l5UEzoTRERXpEbpJi9qLJs6YokyAWxlifDal1r1K9kCbXz
         isDG//Iap4NowuXKZHCRepX7ZmJ9Ho1yTcAUPv5uJFxeKmbqmH4LD36iB7g4YDcSJRT+
         sMUwPqaow3QFn/4kSZGyb1GC81TfRwm+muz61VjmOdWNII3GpFg1gSWpdZCuAiPX0z2G
         zU6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=vRnQ0CldHInWyBID1QzqAS4tOWLZz+a3YO1/Bi+iJc0=;
        b=JdA5Bdb92OHw8TUEOfew5FtPvky5QyNMpbXFKQ1z1ntGNvun6fcNqlWTMcQoilukll
         CuWZhiFrOmiIOW02zvvoOYfBPJaQH+xXCwvWnaimK0EriOEx9ywOYBHb7C+g0hJv+GBE
         BByNIvY+do0vuLJbo8UwxDfBS2del/Rza7GAuYjQS5jIKlSN01811NUF4rXGElGpO321
         gr/gQbTqdAk6guBgca71YNCb/uHJFxict6UexkQ4ZiNwyEkxibT6IKyj/iJAUTu+5B+l
         M617g2e0rTgEd3RLdu8EnPnee4excGecqKvKUqZyksMlX5tOYRKUO0c1k7GFP3aIINdG
         wSSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y40-v6si4936546qtb.175.2018.10.18.07.42.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:42:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42744 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9Vk-00074q-Fd
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:42:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9LA-00064i-1f
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9L9-0007TU-8q
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56694)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD9L9-0007ST-0A; Thu, 18 Oct 2018 10:31:55 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CAEB430F8BF3;
	Thu, 18 Oct 2018 14:31:53 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6DF7E60150;
	Thu, 18 Oct 2018 14:31:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Thu, 18 Oct 2018 16:30:36 +0200
Message-Id: <20181018143042.29588-11-eric.auger@redhat.com>
In-Reply-To: <20181018143042.29588-1-eric.auger@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 18 Oct 2018 14:31:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 10/16] hw/arm/boot: Expose the PC-DIMM nodes in
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
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P9zuL7f8gdPr

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
index ba2004da5c..81d621ce14 100644
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
@@ -516,6 +517,34 @@ static void fdt_add_psci_node(void *fdt)
     qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
 }
 
+static int fdt_add_hotpluggable_memory_nodes(void *fdt,
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
@@ -611,6 +640,12 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         }
     }
 
+    rc = fdt_add_hotpluggable_memory_nodes(fdt, acells, scells);
+    if (rc < 0) {
+            fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
+            goto fail;
+    }
+
     rc = fdt_path_offset(fdt, "/chosen");
     if (rc < 0) {
         qemu_fdt_add_subnode(fdt, "/chosen");
-- 
2.17.1

