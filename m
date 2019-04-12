Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp367722wrx;
        Fri, 12 Apr 2019 03:12:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzmCwCvWtxYB/VUUEfRDb/umd/Hsekvh5wDlp8YfQTth4b3Y5YR0J96kq/ZLfzkdHLX3clb
X-Received: by 2002:a1c:988d:: with SMTP id a135mr11177744wme.24.1555063924051;
        Fri, 12 Apr 2019 03:12:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555063924; cv=none;
        d=google.com; s=arc-20160816;
        b=0PdRm9mE5Jp14d5uYmBojYU3KTzCSN8taOq+w/DGmaJ6xBey0UJJFN8VK+cmBiQKVQ
         U68fQTcD5+ijG3hOhq3ZGkwyG8YrLP8WeGe7eunX1IUjWNARTnI2sA6udY1WDOE1uCz6
         AcW3u/M7HjuIA2fLIMQkuOXYTUZgb2/E6DEKgQf/xg69uq4S5+0V15GxUdj56uR+0z+x
         Eu8dcYMKxoiNgnrzFQFj2ZGJGnfee2aA3aqTzlNq83LC/dq33teCsct99Ee4DNOl40BO
         F7H3qZXBHhE17PJ7JimjqDBgSPYbH/LywTX2vvvLzYeCgDS+u7pPfQXFEodOzbJq/a1+
         dqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=eybzNwX4P2v0fNLB1ymiUe5goBuHfuevlcDLn9aj46I=;
        b=X6G1HBeoA5s22yYNstz1q4sgVAB7GWG1D5VvHwC+jmLBGc0PdL/pM+z1Ng7pHPB5lU
         oKO62XQlCVcGkHslGfXuc4quB4k5CKkGakgvFoucf56CblX4daLUVRvQdWyDM3ZlF83J
         JqplonuP5hAWn0P7dFgdV1Zq7cAfRgzSmzpuKv2/UjC3Q5GFOBw3f1hNSRcpDUQJySma
         eD0j0jWXV+rBGWqN/Fozrkhhqbr81gy/yVszNJCB8V3lchb28kvdAPXyekz9pnfOOPDu
         ou08F/qYAl3a1FyWollxWFGWI0qbiP9IZgqBJbEG3aHWI2Cdpdi4dpNGpsNk7KHU9T4X
         8XEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si21259594wrn.134.2019.04.12.03.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:12:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEtAB-0007jp-2S
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:12:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt4N-0002Dk-LW
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 06:06:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt4L-0004ml-NX
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 06:06:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hEt4G-0004eS-86; Fri, 12 Apr 2019 06:05:57 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 792003091753;
	Fri, 12 Apr 2019 10:05:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-161.ams2.redhat.com [10.36.117.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA0F419C65;
	Fri, 12 Apr 2019 10:05:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 12 Apr 2019 12:03:44 +0200
Message-Id: <20190412100354.6409-18-eric.auger@redhat.com>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
References: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 12 Apr 2019 10:05:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v3 17/27] hw/vfio/common: Introduce
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
Cc: yi.l.liu@intel.com, mst@redhat.com, jean-philippe.brucker@arm.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oxJUT0wMYAV/

Soon this code will be called several times. So let's introduce
an helper.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 0853c8c376..cf876d5264 100644
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
@@ -480,6 +481,19 @@ out:
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
@@ -587,6 +601,7 @@ static void vfio_listener_region_add(MemoryListener *=
listener,
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
         IOMMUMemoryRegion *iommu_mr =3D IOMMU_MEMORY_REGION(section->mr)=
;
+        hwaddr offset;
         int iommu_idx;
=20
         trace_vfio_listener_region_add_iommu(iova, end);
@@ -596,11 +611,11 @@ static void vfio_listener_region_add(MemoryListener=
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

