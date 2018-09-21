Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2857892wrd;
        Fri, 21 Sep 2018 01:26:15 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZi3GpihIgcnZRTD/qYhGKyiIeg6Lay18dCVbCROSdITtIeoTF2+UM4Ciz3nVYHaFDQGlyR
X-Received: by 2002:a37:a0c2:: with SMTP id j185-v6mr4326139qke.67.1537518375192;
        Fri, 21 Sep 2018 01:26:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518375; cv=none;
        d=google.com; s=arc-20160816;
        b=npIyo0rTvvrU54+XUyGBWgDHgv2Js9K6ivA3oc50rmBC1zEAyJ2j64Vcll+XwkLvjr
         XzzaXEVAP3FvMA0c3WF5Nke2OB7pDPTTM9nx8/pdraq5qW3tMPGnwrKm1ANuhotE8x8L
         Y9nMQ0Sz7qk7s82sShcYtuQBdl1m0vxCSDYCe8EKce1zVVrdPuLSTvDunkkzmfJQJRC7
         3HgzMZstNgCnR7Hnqdv+X5yb2++G1AzwraKAeu3tmEpLxDc/gfnZHyYz7kteqPd+J1VD
         hkLdJcG/et05tHWZBDaLDJS4/HcOa1l8BPrynqhO/Ft7oHaWm7O0NMioSZE/h/lwnPdW
         1PhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=idEAd0P0QXrbQ4igSW7QB1AeRtRHe9CwDqS+1rb+eyA=;
        b=ZcVkthxfpWBto0wquBPTcZLKD86IPgRuVpvUIJlffr/S+jvOpu49xUwhK6k3tDVEf9
         ko3TA8GcKYWIinbjqM9CjLxEYmu0BypB0imMnSQI8OqGt6JlUNkHUOywTCmKG/1vpPF9
         RtVA3a19DvT6Fjc+v8P5ekMFOC2KUsEQpVy+QP3ZF6hPJrofYtAfcvLjoN83yh2qxS++
         EZlXfmKYUjlsVGtueMNud3vXC1MBFNCPBx3agfh51rBkOxLtZRw+VTDsVizPK4AR8x7G
         ovjGUDd/2Vu98cBb71ldTN/ekYmlXCFSPKKN8twGmAKgTxEvvZLvuUKIdSwLymSeJHaV
         UY0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k18-v6si1564187qtm.101.2018.09.21.01.26.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:26:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54391 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3GlS-0001hp-JR
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:26:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gf8-0004BT-Jo
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 04:19:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gf3-0003X8-Hf
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 04:19:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33490)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Geu-00036c-G3; Fri, 21 Sep 2018 04:19:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE67D86676;
	Fri, 21 Sep 2018 08:19:27 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9736F7D665;
	Fri, 21 Sep 2018 08:19:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:17:57 +0200
Message-Id: <20180921081819.9203-7-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 21 Sep 2018 08:19:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v2 06/28] hw/arm/smmuv3: Implement get_attr API
 to report IOMMU_ATTR_VFIO_NESTED
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
X-TUID: bA5dLfrTbjBJ

Virtual SMMUv3 requires physical nested stages for VFIO integration.
Let's advertise this.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 8c4e99fecc..d6895071a5 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1504,6 +1504,17 @@ static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
     }
 }
 
+static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
+                           enum IOMMUMemoryRegionAttr attr,
+                           void *data)
+{
+    if (attr == IOMMU_ATTR_VFIO_NESTED) {
+        *(bool *) data = true;
+        return 0;
+    }
+    return -EINVAL;
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
@@ -1511,6 +1522,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
 
     imrc->translate = smmuv3_translate;
     imrc->notify_flag_changed = smmuv3_notify_flag_changed;
+    imrc->get_attr = smmuv3_get_attr;
 }
 
 static const TypeInfo smmuv3_type_info = {
-- 
2.17.1

