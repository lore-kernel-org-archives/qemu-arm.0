Received: by 10.80.163.71 with SMTP id 65csp3171922edn;
        Thu, 6 Oct 2016 05:00:30 -0700 (PDT)
X-Received: by 10.55.87.194 with SMTP id l185mr13758017qkb.0.1475755230904;
        Thu, 06 Oct 2016 05:00:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a20si939975qta.89.2016.10.06.05.00.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 05:00:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bs7Li-0001lt-AU
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 08:00:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs73l-0002IO-Ru
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 07:41:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs73j-0001tK-3J
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 07:41:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48760)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bs73i-0001tF-Pl; Thu, 06 Oct 2016 07:41:55 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D9798E67D;
	Thu,  6 Oct 2016 11:41:54 +0000 (UTC)
Received: from localhost.redhat.com (vpn1-6-233.ams2.redhat.com [10.36.6.233])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u96BfVNa005464; Thu, 6 Oct 2016 07:41:51 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com
Date: Thu,  6 Oct 2016 11:41:29 +0000
Message-Id: <1475754090-22681-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1475754090-22681-1-git-send-email-eric.auger@redhat.com>
References: <1475754090-22681-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 06 Oct 2016 11:41:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 7/8] hw: vfio: common: vfio_prepare_msi_mapping
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
Cc: diana.craciun@freescale.com, Bharat.Bhushan@freescale.com,
	drjones@redhat.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ac5kWIS22yW2

Introduce an helper function to retrieve the iommu type1 capability
chain info.

The first capability ready to be exploited is the msi geometry
capability. vfio_prepare_msi_mapping allocates a MemoryRegion
dedicated to host MSI IOVA mapping. Its size matches the host needs.
This region is mapped on guest side on the platform bus memory container.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v3 -> v4:
- initialize err to NULL

v3: creation
---
 hw/vfio/common.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index fe8a855..c773332 100644
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
@@ -948,12 +950,76 @@ retry:
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
+    struct vfio_iommu_type1_info_cap_msi_geometry *msi_geometry;
+    MemoryRegion *pbus_region, *reserved_reg;
+    struct vfio_info_cap_header *hdr;
+    PlatformBusDevice *pbus;
+
+    hdr = vfio_get_iommu_type1_info_cap(info,
+                                        VFIO_IOMMU_TYPE1_INFO_CAP_MSI_GEOMETRY);
+    if (!hdr) {
+        return;
+    }
+
+    msi_geometry = container_of(hdr,
+                                struct vfio_iommu_type1_info_cap_msi_geometry,
+                                header);
+
+    if (msi_geometry->flags & VFIO_IOMMU_MSI_GEOMETRY_RESERVED) {
+        return;
+    }
+
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
+                                     msi_geometry->size, &error_fatal);
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
 
@@ -1011,6 +1077,14 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as)
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

