Received: by 10.80.166.35 with SMTP id d32csp641130edc;
        Mon, 17 Oct 2016 12:55:48 -0700 (PDT)
X-Received: by 10.237.38.68 with SMTP id z62mr27622705qtc.73.1476734148238;
        Mon, 17 Oct 2016 12:55:48 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q62si16574662qka.275.2016.10.17.12.55.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 12:55:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwE0h-0006gX-HL
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 15:55:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bwDkc-0001ZT-8u
	for qemu-devel@nongnu.org; Mon, 17 Oct 2016 15:39:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bwDkY-0007zI-S5
	for qemu-devel@nongnu.org; Mon, 17 Oct 2016 15:39:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36260)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1bwDkW-0007xi-Ev; Mon, 17 Oct 2016 15:39:04 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8179D66844;
	Mon, 17 Oct 2016 19:39:03 +0000 (UTC)
Received: from localhost.redhat.com (vpn1-5-170.ams2.redhat.com [10.36.5.170])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u9HJcVFa009529; Mon, 17 Oct 2016 15:39:00 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com
Date: Mon, 17 Oct 2016 19:38:29 +0000
Message-Id: <1476733110-14293-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1476733110-14293-1-git-send-email-eric.auger@redhat.com>
References: <1476733110-14293-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 17 Oct 2016 19:39:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 7/8] hw: vfio: common: vfio_prepare_msi_mapping
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
Cc: diana.craciun@freescale.com, Bharat.Bhushan@freescale.com,
	drjones@redhat.com, christoffer.dall@linaro.org, fkan@apm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NAqibidJSSQ7

Introduce an helper function to retrieve the iommu type1 capability
chain info.

The first capability ready to be exploited is the msi resv
capability. vfio_prepare_msi_mapping allocates a MemoryRegion
dedicated to host MSI IOVA mapping. Its size matches the host needs.
This region is mapped on guest side on the platform bus memory container.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v4 -> v5:
- use msi_resv struct

v3 -> v4:
- initialize err to NULL

v3: creation
---
 hw/vfio/common.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 4f4014e..1e2282c 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -34,6 +34,8 @@
 #include "qemu/range.h"
 #include "sysemu/kvm.h"
 #include "trace.h"
+#include "hw/platform-bus.h"
+#include "qapi/error.h"
 
 struct vfio_group_head vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -920,12 +922,70 @@ retry:
     return 0;
 }
 
+static struct vfio_info_cap_header *
+vfio_get_iommu_type1_info_cap(struct vfio_iommu_type1_info *info, uint16_t id)
+{
+    struct vfio_info_cap_header *hdr;
+    void *ptr = info;
+
+    if (!(info->flags & VFIO_IOMMU_INFO_CAPS)) {
+        return NULL;
+    }
+
+    for (hdr = ptr + info->cap_offset; hdr != ptr; hdr = ptr + hdr->next) {
+        if (hdr->id == id) {
+            return hdr;
+        }
+    }
+    return NULL;
+}
+
+static void vfio_prepare_msi_mapping(struct vfio_iommu_type1_info *info,
+                                     AddressSpace *as, Error **errp)
+{
+    struct vfio_iommu_type1_info_cap_msi_resv *msi_resv;
+    MemoryRegion *pbus_region, *reserved_reg;
+    struct vfio_info_cap_header *hdr;
+    PlatformBusDevice *pbus;
+
+    hdr = vfio_get_iommu_type1_info_cap(info,
+                                        VFIO_IOMMU_TYPE1_INFO_CAP_MSI_RESV);
+    if (!hdr) {
+        return;
+    }
+
+    msi_resv = container_of(hdr, struct vfio_iommu_type1_info_cap_msi_resv,
+                            header);
+    /*
+     * MSI must be iommu mapped: allocate a GPA region located on the
+     * platform bus that the host will be able to use for MSI IOVA allocation
+     */
+    reserved_reg = memory_region_find_by_name(as->root, "reserved-iova");
+    if (reserved_reg) {
+        memory_region_unref(reserved_reg);
+        return;
+    }
+
+    pbus_region = memory_region_find_by_name(as->root, "platform bus");
+    if (!pbus_region) {
+        error_setg(errp, "no platform bus memory container found");
+        return;
+    }
+    pbus = container_of(pbus_region, PlatformBusDevice, mmio);
+    reserved_reg = g_new0(MemoryRegion, 1);
+    memory_region_init_reserved_iova(reserved_reg, OBJECT(pbus),
+                                     "reserved-iova",
+                                     msi_resv->size, &error_fatal);
+    platform_bus_map_region(pbus, reserved_reg);
+    memory_region_unref(pbus_region);
+}
 
 static int vfio_connect_container(VFIOGroup *group, AddressSpace *as)
 {
     VFIOContainer *container;
     int ret, fd;
     VFIOAddressSpace *space;
+    Error *err = NULL;
 
     space = vfio_get_address_space(as);
 
@@ -983,6 +1043,14 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as)
          * going to actually try in practice.
          */
         vfio_get_iommu_type1_info(fd, &pinfo);
+        vfio_prepare_msi_mapping(pinfo, as, &err);
+        if (err) {
+            error_append_hint(&err,
+                    "Make sure your machine instantiates a platform bus\n");
+            error_report_err(err);
+            goto free_container_exit;
+        }
+
         /* Ignore errors */
         if (ret || !(pinfo->flags & VFIO_IOMMU_INFO_PGSIZES)) {
             /* Assume 4k IOVA page size */
-- 
1.9.1

