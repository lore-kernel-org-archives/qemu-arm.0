Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1176810lfi;
        Mon, 23 Mar 2020 01:48:34 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvgVn+0lmb3kWzO3aeF2izYNguGBkPiGWeugz3HeX8sdCTK1JN/GBq8JNSZufofiPO4XIfm
X-Received: by 2002:a37:6284:: with SMTP id w126mr19353100qkb.341.1584953314279;
        Mon, 23 Mar 2020 01:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584953314; cv=none;
        d=google.com; s=arc-20160816;
        b=GxbvSylTSVVqRr+AWLH/P/ZLa/PEhJ3QuZIAM9N4B1HP9cSbdGS3Eicz0T5U9ETXa3
         d1BDIZymCqOXuoaItsuOo0vCwbeSfTj2j/fsMN2YOl06lPVrb+yJcDZC7Mi1IhsoNcrf
         A2hyhk+jOzKVCUVFtl11UhiLegSZd6wtGdv0eS1ilZXdoEatgCq7W6morEPV8Qc0ztdm
         wzdLT5D+L6P21sLSzWPk3KM5w3SkrLmeL4jKpq8TUOJ25Kp5tVEnGtwl1x3pa2IuC33k
         nQooMYJUblzTOetBFrtEDfLUGSWsU+LdW4mV3niC4VaarhiReEClLswWuv8uQYbNsLOS
         cj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=WEugmL+w41y9WSds0AUf8b6EHXZir+QEns7Vh2avFLc=;
        b=NJQiOdu9PmQ40qED7X/NWXWfMgz9nio8QHLQ0xmwpz447FIIr/rsIYicDaACHg90mR
         k4o4pNu/aBX32usi8d6M2rzsvOdsAZvtqQo1SXXhr4kGNzEmnXHitXO+TAZ1sZwxGDsv
         ZMRKWmu7C57VRbejxYkU2dPPVGTpkoudfOy62MtckemHGcIuqi+0dz+vcDsw1Bt+1lGw
         DL1QCQp1qsB1b/wlt36+xTWeu9kYO+EaH//rvsG0dT2Arb7gdqwjTD6q083sVNq9kxme
         FXlJ+EOICwNQe6b1bEb/iG62aCrzq/s2K/uKiZPsKmo3HJI+7VCKcInUpLsm2v83zK50
         xDVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=LAMKq5Qu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si8460389qvl.159.2020.03.23.01.48.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 01:48:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=LAMKq5Qu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:58644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGIl7-0001LR-OW
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 04:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48395)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjT-0008EB-9n
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 04:46:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjS-00037M-7g
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 04:46:51 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:37044)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjQ-00036x-6K; Mon, 23 Mar 2020 04:46:50 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N8eL98013746; Mon, 23 Mar 2020 01:46:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=WEugmL+w41y9WSds0AUf8b6EHXZir+QEns7Vh2avFLc=;
 b=LAMKq5QuG4kK1ioaWD6GeDh51nj7vFAW9UY81y0rHx6XQhd/eSg9KfuuLTjVKiezo2Ku
 5heCYmp31pcEOZSqvYw0IqImQnUqUBjvolwEWKnfTJWWP72OuMg0O2jg5ajdPxtqkZXx
 qP4srqJQZL4wws9mtKz2QUvc3inoqusQ/3cYs0yBKVeh6OrTZoW2C6pso0WVskoF4uir
 t1eLYWAJGgNZpdH/AZTr4doMl/AmIlW5UtiLNsL+wJ/++xP9rpP3A3auZN23pgFfhOaw
 oZ5ABcCvXjXjt4nP0lkrgZ/UPaf06AoHM6RZbL7/pidTtX45tL9uY0hC4OoiJ5YqJlvH EA== 
Received: from sc-exch04.marvell.com ([199.233.58.184])
 by mx0b-0016f401.pphosted.com with ESMTP id 2ywvkqkxc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 01:46:45 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Mar
 2020 01:46:43 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Mar 2020 01:46:39 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v9 3/9] vfio: set iommu page size as per host supported page
 size
Date: Mon, 23 Mar 2020 14:16:11 +0530
Message-ID: <20200323084617.1782-4-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323084617.1782-1-bbhushan2@marvell.com>
References: <20200323084617.1782-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_02:2020-03-21,
 2020-03-23 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.156.173
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OqZcP8w4F/iA

Set iommu supported page size mask same as host Linux
supported page size mask.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
 hw/vfio/common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index c586edf47a..6ea50d696f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -635,6 +635,9 @@ static void vfio_listener_region_add(MemoryListener *listener,
                             int128_get64(llend),
                             iommu_idx);
 
+        memory_region_iommu_set_page_size_mask(giommu->iommu,
+                                               container->pgsizes);
+
         ret = memory_region_register_iommu_notifier(section->mr, &giommu->n,
                                                     &err);
         if (ret) {
-- 
2.17.1

