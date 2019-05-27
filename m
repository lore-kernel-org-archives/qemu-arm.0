Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6318260wrg;
        Mon, 27 May 2019 04:56:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwAGbo2fXCtyIQdTLCrO885VhU4rTLF2pSCJPY0QuvZVQk4kK/XfGeO53qOXbT2F90XppHs
X-Received: by 2002:ac8:3696:: with SMTP id a22mr94872902qtc.296.1558958195781;
        Mon, 27 May 2019 04:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558958195; cv=none;
        d=google.com; s=arc-20160816;
        b=ocKEj77S/vbDlljuP1K5qFOJyYZGc5j5fS2lnocHBZcEVitrILUGMItC4HE8FE4t+k
         mtiOPxpcerhfYeLjCHdcVEASAo4aHxktTPShraDMjVGUzL3Vy4PMhy6FPepeH5gYjHwM
         HiEeLN0C7lp5bF8jMAjBHEJKkhIes/j2ujoNyO/hEBI2kkKG5QLIshKMaJ1Q+1oAAs7Z
         6Sn8m2TXNbYc0yT4Hu8hpe6Y0PdP1QtL/ohjf2bV3sahYkOuWtv3zryaAz2Rz0Qrmvvv
         qtnmreOy4u+cU9sLjyj0sbLgrTWYGt6E7rXZ+OucqrzLe72ccSo/r/oArv9DHs+rC+/C
         g2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7Es73i/8SDqw8iluply6lHGWFg91VuOFRZiqbSrnXAM=;
        b=C4jreUT7+4dceBZKJPM6hu/ZxqXiDQPyp5JRmU5jaELPpNT/VkilNkeu+SqY/RKCK/
         FX+mNlPDIHtgfdvgNzxpEXruwmNnkzGJhQw8wjXAL1eiPXFus13lqiPAPMFySSdNUE70
         rJDAJ61f0zaZ4RQH1r6ds9utOrJCtdLyLs2nZEZxkVYHi1dzVBB8QmolCkN54OXiEgAf
         Q+NCg4xp9/az3oGH16TkxdmwR7Ikr4ZjOVM5lfS+8Iu97OT/xC3vN1kBqhsR3zJqAUDK
         ZgbttWCpV0HdVHaoIekg/80F60wN/CvBwQEWo41j64odMxDJPbT84V29U/NXlz3l9ILT
         Tt6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r31si255850qte.279.2019.05.27.04.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 04:56:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVEF1-0004rU-7i
	for alex.bennee@linaro.org; Mon, 27 May 2019 07:56:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE3I-0004M8-IF
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:44:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE3H-0004Py-HQ
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:44:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54026)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE3F-0004Jg-73; Mon, 27 May 2019 07:44:25 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76E90308339A;
	Mon, 27 May 2019 11:44:24 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 386895D962;
	Mon, 27 May 2019 11:44:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:53 +0200
Message-Id: <20190527114203.2762-18-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 27 May 2019 11:44:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 17/27] hw/vfio/common: Introduce
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0rAZpgDoFKJT

Soon this code will be called several times. So let's introduce
an helper.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 75fb568f95..7df8b92563 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -24,6 +24,7 @@
 #include <linux/kvm.h>
 #endif
 #include <linux/vfio.h>
+#include <linux/iommu.h>
=20
 #include "hw/vfio/vfio-common.h"
 #include "hw/vfio/vfio.h"
@@ -497,6 +498,19 @@ out:
     rcu_read_unlock();
 }
=20
+static VFIOGuestIOMMU *vfio_alloc_guest_iommu(VFIOContainer *container,
+                                              IOMMUMemoryRegion *iommu,
+                                              hwaddr offset)
+{
+    VFIOGuestIOMMU *giommu =3D g_new0(VFIOGuestIOMMU, 1);
+
+    giommu->container =3D container;
+    giommu->iommu =3D iommu;
+    giommu->iommu_offset =3D offset;
+    /* notifier will be registered separately */
+    return giommu;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -604,6 +618,7 @@ static void vfio_listener_region_add(MemoryListener *=
listener,
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
         IOMMUMemoryRegion *iommu_mr =3D IOMMU_MEMORY_REGION(section->mr)=
;
+        hwaddr offset;
         int iommu_idx;
=20
         trace_vfio_listener_region_add_iommu(iova, end);
@@ -613,11 +628,11 @@ static void vfio_listener_region_add(MemoryListener=
 *listener,
          * would be the right place to wire that up (tell the KVM
          * device emulation the VFIO iommu handles to use).
          */
-        giommu =3D g_malloc0(sizeof(*giommu));
-        giommu->iommu =3D iommu_mr;
-        giommu->iommu_offset =3D section->offset_within_address_space -
-                               section->offset_within_region;
-        giommu->container =3D container;
+
+        offset =3D section->offset_within_address_space -
+                    section->offset_within_region;
+        giommu =3D vfio_alloc_guest_iommu(container, iommu_mr, offset);
+
         llend =3D int128_add(int128_make64(section->offset_within_region=
),
                            section->size);
         llend =3D int128_sub(llend, int128_one());
--=20
2.20.1

