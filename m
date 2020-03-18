Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp614512lfe;
        Wed, 18 Mar 2020 03:14:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv1TU1mEf7KcyrDpLyfrDteskgmtcsVIZWVOphrrSmAZ+T45M61xyiaNyK6m5Jl285UW0Ap
X-Received: by 2002:aed:32c7:: with SMTP id z65mr3458336qtd.81.1584526440405;
        Wed, 18 Mar 2020 03:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584526440; cv=none;
        d=google.com; s=arc-20160816;
        b=THoYhZZ67SkNmvTkg3tREiEs26ATtdquYDyeGw4uXvfdYcIflbg+1anV48JmfI3T17
         ikcTEfCO2OIIV1t/Ya6Jd9NEW6FaOd5K80pwcu3PT1d5WWauwva/EvKMz64ebsusWOBu
         mRWSy8cti4UbBmFNY6zdry1E/ZlEj3oTXFx2e2UFOlQ/Oq+aV4GpxxxZ3TSmV8KGzjoZ
         eTKmuevNrQsSjPwvDkRvPgvFuZLgzuqw5/MJ/DhDwfCbxUDnu68tMeBezQxAxhATOMm4
         PNc6F7fviKFj2k9lTkB8FXYymLRF2wcSdbJsy56rCtQtZdWiC5Tw/6YAqQSTQn7BJGvX
         CZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=FbEgKzpeFw4OscqegPpPMFTJgFQvhUCCZhKzMe/ZA1w=;
        b=MERrHYcI423wMYvAfP71S6WQzYArHsOc3wAUnFtX80U7NbvE1df+wzjGL3DqyWClPJ
         ZGwZ/NgvqO0uJz3o1TlMZgREl6S6CjsM8leTJx53jCL4+jb48unbY2M+WRJ1ewpUJYAV
         E7F2YXM2nSydV807bjczc+ewyPsMttiPWA/vUi4+NOaB3TB43IOflbkZHoYGAkmYRkoI
         r9JYJEfizkWVQAONHkRrG0iUYuYw1nwtPAjCSrg7dtGyxnil8w5IkTaG43de2La3pzEy
         SkPe1aDiE17nZqd1mKLrzQcr4axjFFdKe3Ex1kvqBXEvbYUNmjTt3iI+v6sbspgUJA8Q
         XHWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=S8kUj1rP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si3696573qke.84.2020.03.18.03.14.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Mar 2020 03:14:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=S8kUj1rP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:47999 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEVi3-0004KX-ON
	for alex.bennee@linaro.org; Wed, 18 Mar 2020 06:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgb-00021J-2C
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 06:12:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVga-0004au-5Q
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 06:12:28 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:43926)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVga-0004aY-0T; Wed, 18 Mar 2020 06:12:28 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IABKBe030363; Wed, 18 Mar 2020 03:12:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=FbEgKzpeFw4OscqegPpPMFTJgFQvhUCCZhKzMe/ZA1w=;
 b=S8kUj1rP7r46a3n7d0DFqDR3T/eB5PHPtcaCVxCb7JY2nZ3REtiUDpVkDtMXLfDwsxc8
 aqv3VRKXOo+GDxJ3pxGRB6ZVJcoIqD9ObBdyRUC6zRIDxHEmYUL5UWH5zBgH+cuvnlgK
 g1ctP7Rse+QpdCGIaPEM6E3YtYxjOCwXKQXehETDCycMkQN+ujH8k/12H+FRSQXm46bg
 VMxw/cIh9J+zI9+dJBxRQFavmITCTM7uqkb6c9qhUMxK2uO+GRHcfNnU1aI4J5qq9KIo
 TeIp15UvkUNPA/sOAtLh7/G10h2qTte/y3GUxA1l2fcLPONxLqDNzO1Pj3WXT4U9nnmp iQ== 
Received: from sc-exch04.marvell.com ([199.233.58.184])
 by mx0b-0016f401.pphosted.com with ESMTP id 2yu9rp9tur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 03:12:26 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 18 Mar
 2020 03:12:23 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Mar 2020 03:12:19 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v8 3/8] vfio: set iommu page size as per host supported page
 size
Date: Wed, 18 Mar 2020 15:41:54 +0530
Message-ID: <20200318101159.8767-4-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318101159.8767-1-bbhushan2@marvell.com>
References: <20200318101159.8767-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
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
X-TUID: yso8DZV0kPDl

Set iommu supported page size mask same as host Linux
supported page size mask.

Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
v7->v8:
 - new patch

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

