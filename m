Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp622495wrd;
        Sat, 1 Sep 2018 07:29:46 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbyfV+jT4y/6jITzZgdvKkumtDk78GvVDjh7Bk3bCt0dQ3lNNBWNoYlKDizU/SJzvnqm44e
X-Received: by 2002:a0c:99ec:: with SMTP id y44-v6mr19433657qve.226.1535812186682;
        Sat, 01 Sep 2018 07:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535812186; cv=none;
        d=google.com; s=arc-20160816;
        b=loo+Zxv7diZA4vLcZDhHH5a1FDnJg35yTHEH5q7hYtYrbUJYTY9W/5YdcrxVg3MgyG
         0zBSr9tw0StDxhueEXPh7pmLR1Xzg68u8Q7icUt6ZKVpQzGMo/ixPGTZ6Mv7B+HFssgA
         7/HBHzYt060ptDXLUY7R7eDchwN7ewie+K2ER5n2UofmFY5UXkLDpqZfHMBPLfPiFDVa
         EJt0TifW7cEgtPoJEHpnP+QQdc6imQd93aQRgZEClLb6KwBd3QgmtfkKfos3wSygDJLA
         iqMkdL4ervoKs8bjtwEvHBCSAgKRG+ji972KvFeJEPTHib2g13e5upi0yri80LUw27w8
         OV/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1stYm28Wu0GDkCrbY5r4vmjSyZhPuGAn0zgkAlhXqnc=;
        b=OeEuJ9gY7IMWYLRFA5MlJNdLsjFWBsR0RDvDy8hR2cF+jnSWknm61+Q1xp0Ta/Uplo
         MGWKG1tzMsmc+5fkxoIDzrm0McVMjZWg3T2PKNHg9IStzKZAfQ3jMENO63ZPmjiZv+UT
         DbVFuNpjRcCRiAPzlqBR2/zVXRIAYw1b8wk7f4s85NJMDpAtAhtCGB7JU3dGrj5v6hmC
         tydqpoaWaByvn4aQNxQTknM2i5G5hY+AjGywhkFFrHqVkGiTtUasuO4YeWA/pjDGbH8e
         xhR9hN2n2pJLsJrC6lIW6CItjXgaB+88cZ9GDlRqxql9PvCJ9qNWqre68AUEDJJ/FaPI
         a52g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b190-v6si1422166qke.317.2018.09.01.07.29.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 07:29:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37358 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw6uI-0001Cz-4o
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 10:29:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6qH-0005sK-AD
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:25:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6ou-0005q0-Mv
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:24:15 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51140 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fw6ot-0005oa-2m; Sat, 01 Sep 2018 10:24:11 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A138626360;
	Sat,  1 Sep 2018 14:24:10 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C50D02166B41;
	Sat,  1 Sep 2018 14:24:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  1 Sep 2018 16:23:06 +0200
Message-Id: <20180901142312.11662-15-eric.auger@redhat.com>
In-Reply-To: <20180901142312.11662-1-eric.auger@redhat.com>
References: <20180901142312.11662-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Sat, 01 Sep 2018 14:24:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Sat, 01 Sep 2018 14:24:10 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC 14/20] hw/vfio/common: Introduce
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
X-TUID: hSkiRNxMH4y+

Soon this code will be called several times. So let's introduce
an helper.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 7bd3cc250d..2342bccf38 100644
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

