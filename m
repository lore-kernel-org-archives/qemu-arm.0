Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2868882wrd;
        Fri, 21 Sep 2018 01:39:01 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZrB2PueJvbeNGM7N/WOifItqu9B11ldokjeAlOPNGeCZokK/bKo41CFMRqSKOTu6/VpAqh
X-Received: by 2002:a37:20c8:: with SMTP id g191-v6mr10314568qkg.106.1537519141607;
        Fri, 21 Sep 2018 01:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537519141; cv=none;
        d=google.com; s=arc-20160816;
        b=rf5b66ipDwLAZVAxXjtPc0VGNt8d7DHz3UT7dWNsiwi4ggnFnRoke8yKZ+gxPVg3YC
         GePIVv6w/UrrEYDIAX6cYdTIwaX9kqJ3QOjjPBagIK9JAgt3m9FbS918vQLOE8T2Sd3p
         3OoEOxQVkuEJe3WMxRN5xsJZgGAp048dn8i6iFIyWjzHFGW/rjTvujXKUWMCkJPTJf/R
         Hqnfg0dti6FtSpj/StuyPd3Jvd5d4tDwFfiglVcmy2Pvmpvm4hK+Tfq/Ln1M1ieaKA7N
         REiLsn9F914OtULmwXTCXvQCFZTxcxzQ7XnvqI+LsUHi5DIlkbi6F6+CIwkDHMCrthEo
         a5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=3gkA1RSF9VFcnUDubNmRzyd/DwumMFGumHZQ6GRDZk4=;
        b=tGLVXiAKSlTQyZni+8b/VXSIMqTvQ1hJAXUp/W2+nQJ+YtpY0+YGuXDfvRoPomHa+J
         kaQc1aSmlLnfa6bgiCcdWaZ7NRW531qhy+iEuUt2hdQcJ4UXiyhPbFa4ILu9Wz8EmgsJ
         qA+mCoXA5cwEdT+yCL5rHf91fagUsKMZ953twqM7jb20i5kPmOIitgigXlx7f1UmSlPQ
         fs2RwPvS8rakeoLUIV+B/8xa+g/QlTE8AnRJw8y65V4lvmwZym7+Ff0U9Nr9+NZjnFm8
         pQLEtTZjz2CFQ78ZWUzaEk6FHcZipsFO/bEXwM96XHtFdpVSGYTKyfVl/zCWY57u4d5D
         6t2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r5-v6si296825qkf.405.2018.09.21.01.39.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:39:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3Gxp-0005IL-4B
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:39:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GgL-0005Gw-K6
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 04:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GgK-0006G1-Kk
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 04:20:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47316)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3GgD-0005k8-Pu; Fri, 21 Sep 2018 04:20:49 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8234488312;
	Fri, 21 Sep 2018 08:20:48 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C1597D904;
	Fri, 21 Sep 2018 08:20:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:08 +0200
Message-Id: <20180921081819.9203-18-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 21 Sep 2018 08:20:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v2 17/28] hw/vfio/common: Introduce
 vfio_alloc_guest_iommu helper
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 17PSjARJxCV0

Soon this code will be called several times. So let's introduce
an helper.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 5dcb502f42..ce13c102a5 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -24,6 +24,7 @@
 #include <linux/kvm.h>
 #endif
 #include <linux/vfio.h>
+#include <linux/iommu.h>
 
 #include "hw/vfio/vfio-common.h"
 #include "hw/vfio/vfio.h"
@@ -401,6 +402,19 @@ out:
     rcu_read_unlock();
 }
 
+static VFIOGuestIOMMU *vfio_alloc_guest_iommu(VFIOContainer *container,
+                                              IOMMUMemoryRegion *iommu,
+                                              hwaddr offset)
+{
+    VFIOGuestIOMMU *giommu = g_new0(VFIOGuestIOMMU, 1);
+
+    giommu->container = container;
+    giommu->iommu = iommu;
+    giommu->iommu_offset = offset;
+    /* notifier will be registered separately */
+    return giommu;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -508,6 +522,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
         IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
+        hwaddr offset;
         int iommu_idx;
 
         trace_vfio_listener_region_add_iommu(iova, end);
@@ -517,11 +532,11 @@ static void vfio_listener_region_add(MemoryListener *listener,
          * would be the right place to wire that up (tell the KVM
          * device emulation the VFIO iommu handles to use).
          */
-        giommu = g_malloc0(sizeof(*giommu));
-        giommu->iommu = iommu_mr;
-        giommu->iommu_offset = section->offset_within_address_space -
-                               section->offset_within_region;
-        giommu->container = container;
+
+        offset = section->offset_within_address_space -
+                    section->offset_within_region;
+        giommu = vfio_alloc_guest_iommu(container, iommu_mr, offset);
+
         llend = int128_add(int128_make64(section->offset_within_region),
                            section->size);
         llend = int128_sub(llend, int128_one());
-- 
2.17.1

