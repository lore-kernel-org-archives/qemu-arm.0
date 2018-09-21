Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2858623wrd;
        Fri, 21 Sep 2018 01:27:08 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaLFvGHnBI1AmafYN18bd58AviRzjc57P62leRg7KTjb6GWJxxs+j4Yl7kbq+HTiDgBBjRn
X-Received: by 2002:ae9:d885:: with SMTP id u127-v6mr29699033qkf.219.1537518428705;
        Fri, 21 Sep 2018 01:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518428; cv=none;
        d=google.com; s=arc-20160816;
        b=0+d8C3LiDjYH9GK4CEVHgfROtwVSGkZ8J3kw0gAERyy0Wfi6LcW/otm7zExRMHJmAD
         dcSU7/AoVn0M3g4huiaA/LC0PLnsoH1Pr5wGXFKg3SgQo6nH0CV/xpV2ZgarP1c1e/4l
         g6uwkLwBCPD/9LRj/ya6g6n53SybRVcbjir7ZNssDzw01+U5tC0NFjDev+v9CpJRmyYz
         HPN/VuADo6XljZuullYaWyk4CVF/AhO2JwgqmLIdqDfOoOzHwnKdIHC/Lmck2gEpeexA
         omtW6nZx5GokIt+cSgUoT/vVuux9gAGkfqj7LeOceBdBBubD8FaN5bEUtaQnlMO1l8HR
         D5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=lltKUp0zgR5fZum3Vc1aj8HN/rM4woG1MvtK71VIOBc=;
        b=EBl5HGhXtgmkq6tQNJlUtVJ4jn1EVV9Qf4b4VrI8J1NzYD0M/3dTE4ga7OihbmyXhX
         ai9ROmPAvGCBueLk73SxdNkGIQNSx5Iv+XN0+DiOooNX8ZvxEGMwGCm+VpHgxMVbnl7x
         nDuIW7CcPoVOicPt3tcPNY2HJeNK7lLQk4M3QMUq45dt3jEDH3LpPxfIOYECTeMW8uuN
         3USyB87lNS/rnt0PFe7n1D6H5nWHHSLRxy84S1CM7DLIdJeE5obGnh7DwKicUL+n44AT
         Ox5RByLujYhbB8umz2x16X/vvYTq1+Wmj43K4eTMLMIJexRP7DKb0jeOft43JyRAxA97
         PtIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x9-v6si6759580qto.160.2018.09.21.01.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:27:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54396 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3GmK-0002PJ-4H
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:27:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gel-0003ss-2i
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 04:19:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gek-0002fT-BD
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 04:19:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Geh-0002Sm-3H; Fri, 21 Sep 2018 04:19:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BEEBC04AC42;
	Fri, 21 Sep 2018 08:19:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0662D7D904;
	Fri, 21 Sep 2018 08:19:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:17:56 +0200
Message-Id: <20180921081819.9203-6-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 21 Sep 2018 08:19:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v2 05/28] memory: add IOMMU_ATTR_VFIO_NESTED
 IOMMU memory region attribute
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
X-TUID: UTH10tTE/Ydc

We introduce a new IOMMU Memory Region attribute, IOMMU_ATTR_VFIO_NESTED
which tells whether the virtual IOMMU requires physical nested
stages for VFIO integration. Intel virtual IOMMU supports Caching
Mode and does not require 2 stages at physical level. However virtual
ARM SMMU does not implement such caching mode and requires to use
physical stage 1 for VFIO integration.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index eb4f2fb249..b6e59c139c 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -209,7 +209,8 @@ struct MemoryRegionOps {
 };
 
 enum IOMMUMemoryRegionAttr {
-    IOMMU_ATTR_SPAPR_TCE_FD
+    IOMMU_ATTR_SPAPR_TCE_FD,
+    IOMMU_ATTR_VFIO_NESTED,
 };
 
 /**
-- 
2.17.1

