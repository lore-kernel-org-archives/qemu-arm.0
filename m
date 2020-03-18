Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp613056lfe;
        Wed, 18 Mar 2020 03:12:34 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv7GCmvTTLTJyGjdpn2lFsvWfvX9uYqGwGKLscleLUlwTEhRTFv8Y98uTea9eojW4LnAM5z
X-Received: by 2002:a37:a552:: with SMTP id o79mr3224955qke.22.1584526354684;
        Wed, 18 Mar 2020 03:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584526354; cv=none;
        d=google.com; s=arc-20160816;
        b=0HwcSVezfwEH91Pc2HQkRZckmvKpgWTdxNgLk0u7/67KChGUiOU5/FcMd1qT8nkHix
         lEBohGT7nSFAb5DQpKqHClE25NmuWYN//H7ymZ8eAaW88SEq8Ey8ujQIrIsgU/AocOK4
         dE7YkEnL5gnybStNS4SkH09Yy30A6dvhaAs7q0IOyAJI4xTaJD+2GJhKDeR/3cYCDO51
         wPgXnLxdgxOrpx+LPsifj+UmN81yw60e8GCmklNCcgm9PXsdyVu4yT+300tSOKVf2nOQ
         xUWksTYMqhHNrb8yaEH37qtGNU1FzLE6smgRGBOUHxeGGnr766S4sj9XRlvs6xshIs0V
         YGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=qEAv6IpogbV7YHyhj2l6c6UjHVFT5rsptczJTs+HL8c=;
        b=DRiXVEJV7aYqFu+3PFlkJ1R4Ai7sbq/q+lm7xoYqL0GabnwV/Hxy4H3bRcjJO6T72S
         FibS7iEbHDZo1IwUKtYT37gpYOOVTgu3J8NWb/tA6FNGIcqTXBlb/RMlpoXqZrNezyUf
         p4zUznt+S/6Jzq7n99ERzk1WhHmJspozn++dbzA8kD6v8BdnQ06NdFO3wtMymJvYvKyP
         FMaBYQ0tfKKuv/fMddicKoAptoy6ej5vu0CQduAKZ6piasAb5BhQS/zC8R0gTwCfF+Xf
         H6Tp+ooyVnaNzJSrLvIqA2O+9ozp05VzS70VLUuKznfom+IUEw7Gr6KlymDzCBf23Jlj
         LNeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@marvell.com header.s=pfpt0818 header.b="ns/NwjO0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6si2348048qky.134.2020.03.18.03.12.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Mar 2020 03:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@marvell.com header.s=pfpt0818 header.b="ns/NwjO0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:47920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEVgg-0001xW-4Z
	for alex.bennee@linaro.org; Wed, 18 Mar 2020 06:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37039)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgS-0001gJ-Pa
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 06:12:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgR-0004Th-Mv
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 06:12:20 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:3770)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgP-0004Qb-Gx; Wed, 18 Mar 2020 06:12:17 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IABKBd030363; Wed, 18 Mar 2020 03:12:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=qEAv6IpogbV7YHyhj2l6c6UjHVFT5rsptczJTs+HL8c=;
 b=ns/NwjO0nE9iSeLin2teH9SCLcryvgjctFejuiUiwH/OpqNkqFvGMmrGJsaaA6VVkG5N
 TwZ6ADR/CYqgvGG3PRS/eDwZSLbQ4O15loy3tDc7ErwM1CDppyOo3nQM3XvC7qwUBeuR
 Q2UpeQ38E2UxV7Mf/JD2eRMagC8uFrxSSd3ZxXzGWoRKwxM+mF2yxFX4sIWygoamwMqX
 bTG9KfsNDrpOFyet9d5rKXi8oZry7P+PQRuqxyXsDrKJ/pnGf7T14ZJkIMOdHs395o6R
 P3jmliRXv50xH+2xDZI6uKrXrZw73QbdI53WNPu8flqoGiZKSdDwb1VTyvmSMqauMp5Z 7Q== 
Received: from sc-exch03.marvell.com ([199.233.58.183])
 by mx0b-0016f401.pphosted.com with ESMTP id 2yu9rp9tu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 03:12:15 -0700
Received: from DC5-EXCH01.marvell.com (10.69.176.38) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 18 Mar 2020 03:12:13 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 18 Mar 2020 03:12:12 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Mar 2020 03:12:07 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v8 1/8] hw/vfio/common: Remove error print on mmio region
 translation by viommu
Date: Wed, 18 Mar 2020 15:41:52 +0530
Message-ID: <20200318101159.8767-2-bbhushan2@marvell.com>
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
X-TUID: 92Rk1Sbib9/a

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

