Received: by 10.80.163.71 with SMTP id 65csp3117785edn;
        Thu, 6 Oct 2016 02:51:06 -0700 (PDT)
X-Received: by 10.200.38.107 with SMTP id v40mr13785370qtv.76.1475747466838;
        Thu, 06 Oct 2016 02:51:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c12si7351017qkh.323.2016.10.06.02.51.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 02:51:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bs5KU-0006rf-9l
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 05:51:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs5KN-0006oz-1a
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 05:50:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bs5KK-00079O-MI
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 05:50:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47718)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bs5KK-00078q-Cd; Thu, 06 Oct 2016 05:50:56 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2627335F6A;
	Thu,  6 Oct 2016 09:50:55 +0000 (UTC)
Received: from localhost.redhat.com (vpn1-6-233.ams2.redhat.com [10.36.6.233])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u969okS1016130; Thu, 6 Oct 2016 05:50:53 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com
Date: Thu,  6 Oct 2016 09:50:38 +0000
Message-Id: <1475747444-12552-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1475747444-12552-1-git-send-email-eric.auger@redhat.com>
References: <1475747444-12552-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 06 Oct 2016 09:50:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 2/8] hw: vfio: common: vfio_get_iommu_type1_info
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
X-TUID: ADefnBGxPwPI

Introduce vfio_get_iommu_type1_info helper that allows to handle
variable size vfio_iommu_type1_info allocation with capability
chain support.

Besides, fixes a checkpatch warning on vfio_host_win_add's call.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 29188a1..4f4014e 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -900,6 +900,27 @@ static void vfio_put_address_space(VFIOAddressSpace *space)
     }
 }
 
+static int vfio_get_iommu_type1_info(int fd,
+                                     struct vfio_iommu_type1_info **pinfo)
+{
+    size_t argsz = sizeof(struct vfio_iommu_type1_info);
+
+    *pinfo = g_malloc0(argsz);
+retry:
+    (*pinfo)->argsz =  argsz;
+
+    if (ioctl(fd, VFIO_IOMMU_GET_INFO, *pinfo)) {
+        return -errno;
+    }
+    if ((*pinfo)->argsz > argsz) {
+        argsz = (*pinfo)->argsz;
+        *pinfo = g_realloc(*pinfo, argsz);
+        goto retry;
+    }
+    return 0;
+}
+
+
 static int vfio_connect_container(VFIOGroup *group, AddressSpace *as)
 {
     VFIOContainer *container;
@@ -937,7 +958,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as)
     if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1_IOMMU) ||
         ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
         bool v2 = !!ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU);
-        struct vfio_iommu_type1_info info;
+        struct vfio_iommu_type1_info *pinfo;
 
         ret = ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &fd);
         if (ret) {
@@ -961,14 +982,14 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as)
          * existing Type1 IOMMUs generally support any IOVA we're
          * going to actually try in practice.
          */
-        info.argsz = sizeof(info);
-        ret = ioctl(fd, VFIO_IOMMU_GET_INFO, &info);
+        vfio_get_iommu_type1_info(fd, &pinfo);
         /* Ignore errors */
-        if (ret || !(info.flags & VFIO_IOMMU_INFO_PGSIZES)) {
+        if (ret || !(pinfo->flags & VFIO_IOMMU_INFO_PGSIZES)) {
             /* Assume 4k IOVA page size */
-            info.iova_pgsizes = 4096;
+            pinfo->iova_pgsizes = 4096;
         }
-        vfio_host_win_add(container, 0, (hwaddr)-1, info.iova_pgsizes);
+        vfio_host_win_add(container, 0, (hwaddr)(-1), pinfo->iova_pgsizes);
+        g_free(pinfo);
     } else if (ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_IOMMU) ||
                ioctl(fd, VFIO_CHECK_EXTENSION, VFIO_SPAPR_TCE_v2_IOMMU)) {
         struct vfio_iommu_spapr_tce_info info;
-- 
1.9.1

