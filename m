Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1175337lfi;
        Mon, 23 Mar 2020 01:46:55 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuBFrgBZH5iImyQwJ5mz/4VhLi1m2XP2WbOhYZzRIqkKrfVFtO74Wdm7e0UP4ApTEsF2HyQ
X-Received: by 2002:a37:aa92:: with SMTP id t140mr18026193qke.119.1584953215286;
        Mon, 23 Mar 2020 01:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584953215; cv=none;
        d=google.com; s=arc-20160816;
        b=i0KRTKTH9U5W9xqge8IhvDsoIOWHRlSPbH5waueQiPUQ6lpBO+8DBy+exJLwapTbfZ
         AnOLsmCDHamlcENPE3ecYCc9YddPT9dRWs+c0mCRm69YhkeDq2s3hwQIiurTR2xZNn3z
         BNdxKL4t5VFPs+gFDWmS0T/jQjPV0kZZLl8G4NeldsOtEboueerRdD5k9vHk7ehqOID4
         wY+XqWl44Qn1Qu1t3a0n8eMPieTANBqjeLTPmH/lvLv9NQnDIH0LJO8Utv2CG+Z82T2/
         mLQTRiDD4UHO9tGs1Oeoxdu51qMbaQA5v17wEI+tRrfxD7f3hrJzB0ioLE7TbEndZi2O
         64vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=qEAv6IpogbV7YHyhj2l6c6UjHVFT5rsptczJTs+HL8c=;
        b=bJZ9F256AyTqF8GWZQsiEb09FYrVfB8oWtdusMNwi1YFjBgNH7HiJpuwdBnoA+etvL
         Fks4tx0hR6yT7ZpSvG7oU17KtmALm3XccAqUGeekW+/ny3aJmT5vnO7AqexVyR23lFC4
         hDnQuRqtFcjOUpSr2ThZJHtMlET/+y1J3x1tLnj0YR3QZ6bTc5WHaZ43np8W8XblXfGQ
         pVKUFu8PcuiAhkfur+FHru6rz72W0QAh5CiIfsOFfWyvC/Dqh4C5x72zBYtyQ3kTuRkl
         GtsxAUxL+6W31jjqTEL6VPkbUj9V7L1lyvH856F49Qsu5UTtdvQptDhDxKIg9NGL0iAm
         f5JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@marvell.com header.s=pfpt0818 header.b=QmidH2Ec;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6si7796274qvo.110.2020.03.23.01.46.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 01:46:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@marvell.com header.s=pfpt0818 header.b=QmidH2Ec;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:58552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGIjW-00081d-Mx
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 04:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48335)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjJ-0007yR-Af
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 04:46:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjI-00034C-Cr
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 04:46:41 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:13382
 helo=mx0b-0016f401.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjG-000331-1x; Mon, 23 Mar 2020 04:46:38 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N8dj0Q010653; Mon, 23 Mar 2020 01:46:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=qEAv6IpogbV7YHyhj2l6c6UjHVFT5rsptczJTs+HL8c=;
 b=QmidH2EckQDjt3AcVakyn4T5TG19v6Ne2x5+5HfHlbXgcPYaCIXc5RadonxBLFQPnSHN
 ehFMaSaBms/o1IYBkvqGN4Sz2ZRqV383mUjY0l61DwyhCt86bP+4rmldwTewh3qnb6f3
 zBJ5VnVFCXct5nKA8sbFCU4VbWGQzJRJTV1r9WnmnNDSlSD/cbXbeq33A2fwzIBOgNog
 gsTcmMHRm0OrvrBbNRwwqeAh7CtWdDgsGF5ALO35clHOIk84rTFF2eu12EZ7jtHTSfER
 haudumhaenwYVoszg+1t7WK2SUYOZrGijsa+fY8a844T7iXkCxPqX2BvUZOSqkAXTHcF ew== 
Received: from sc-exch02.marvell.com ([199.233.58.182])
 by mx0a-0016f401.pphosted.com with ESMTP id 2ywg9ndrvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 01:46:34 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 23 Mar
 2020 01:46:32 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Mar 2020 01:46:27 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v9 1/9] hw/vfio/common: Remove error print on mmio region
 translation by viommu
Date: Mon, 23 Mar 2020 14:16:09 +0530
Message-ID: <20200323084617.1782-2-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323084617.1782-1-bbhushan2@marvell.com>
References: <20200323084617.1782-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_02:2020-03-21,
 2020-03-23 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.148.174
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>, Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lNFqmyg8Xkbq

On ARM, the MSI doorbell is translated by the virtual IOMMU.
As such address_space_translate() returns the MSI controller
MMIO region and we get an "iommu map to non memory area"
message. Let's remove this latter.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
---
 hw/vfio/common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 5ca11488d6..c586edf47a 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -426,8 +426,6 @@ static bool vfio_get_vaddr(IOMMUTLBEntry *iotlb, void **vaddr,
                                  &xlat, &len, writable,
                                  MEMTXATTRS_UNSPECIFIED);
     if (!memory_region_is_ram(mr)) {
-        error_report("iommu map to non memory area %"HWADDR_PRIx"",
-                     xlat);
         return false;
     }
 
-- 
2.17.1

