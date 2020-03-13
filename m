Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2220143lfc;
        Fri, 13 Mar 2020 07:38:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsyGxqoeKCZ+n39rYyQXK02zaa2TfQJr1FyIYQn/SO4ofleAytEIuygdg+OHUQWJ7g8KYjg
X-Received: by 2002:ac8:51d6:: with SMTP id d22mr12637635qtn.11.1584110280949;
        Fri, 13 Mar 2020 07:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584110280; cv=none;
        d=google.com; s=arc-20160816;
        b=GfKhPe9GQmf7sM8ilRa456iJoFN7NEsRpJnmtrNDGXiB8P4WIEf9wm1bVWXZUifzeG
         /W3vioe9OQnUOog73Hw3b2UpmajWKSLv+7ClOdFd5IfsD2Zk826HXf4I/45HfSKRHzOs
         qxskBHCbjoTqqc55SoKMX1uek2eya4l2yNzZfDhcp5rom/RCPth1R6p/DWIbF+lgUTin
         KWr6chd9QOGXra1Oq8/a60NIaXnQHQVD3KgvRBLipUIGjk4Q6K0iKVucySZuM290emX4
         qX2W1QLTlD/H1788O9Du6lcSFd8bher12CKlT6K1V4S//OHS210CAOCSnNeNZTqVSYbO
         AeKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=qEAv6IpogbV7YHyhj2l6c6UjHVFT5rsptczJTs+HL8c=;
        b=ZW2o0276e55xclDN2O3EVrmBPTGkKWRWt0Rdp8HdLoRDFf8Dvle7iZAdujwUpjY+Vx
         ZyYiiyZOG+ZLCbPcZsJToE1krqGtfTMxWyG+4liwsejIZSzvlKNE7VXedSA8OLJN8ylB
         Kfs59s8/VVogLZs2CaFwWiK1rarBZyPnBKOLUvhZKB7FFsj4hmZblhBwIIrH5xLvvgkS
         M9CeScA7+S2pp4d7e0L/SL3wcLmPnafqCXmJQ5NB2HHVl1g1Q2A3YgucHNxBsDgssmcG
         HCdjPoDAi4gYO2Fdn4x5owe8MyvOrx29ijJD/7Me9BfjTn5/c7noJ3a8t7HCNIrPCjln
         puPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@marvell.com header.s=pfpt0818 header.b="iVe/ipo9";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 194si5269711qkf.109.2020.03.13.07.38.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:38:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@marvell.com header.s=pfpt0818 header.b="iVe/ipo9";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:60030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jClRo-0003La-9F
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60930)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3X-0005sr-Gq
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 03:48:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3W-0001av-GE
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 03:48:31 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:14992
 helo=mx0b-0016f401.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3U-0001V8-Bv; Fri, 13 Mar 2020 03:48:28 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02D7jiWU023265; Fri, 13 Mar 2020 00:48:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=pfpt0818; bh=qEAv6IpogbV7YHyhj2l6c6UjHVFT5rsptczJTs+HL8c=;
 b=iVe/ipo9dIab1/pUn/lnIVmy4KIa8U27A5fis00wp1p4uP/uOmGRhxYR+0SeyxXOHMiP
 wxx0cFsla1+tHkYQYpfvb/YPDBChdTjBA72EjOFutrfpn2j+vqWdaiTSRh0TYzL8BEo6
 ZN2y3SIAboiedJYH3Nktlt2GrMqugdZXU6vdk7RIsGdzz4ZXzN26N4XydQ/abQBl1nIC
 okJbYuPYvqxJGebVX0l0FVmWG+ZpPPRJZtPRV9ZZeLR8zkYW5b1fHVvWYohWGL2T+8hJ
 MZbLjK1XNke+UogX94Uf0XvubseVxQcbLMM4ynsfTVkUlKnJ0qMTi88veOGKQYshOQPF fg== 
Received: from sc-exch01.marvell.com ([199.233.58.181])
 by mx0a-0016f401.pphosted.com with ESMTP id 2yqt7t2v9w-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 00:48:25 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by SC-EXCH01.marvell.com
 (10.93.176.81) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 13 Mar 2020 00:48:24 -0700
Received: from SC-EXCH04.marvell.com (10.93.176.84) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 13 Mar 2020 00:48:23 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Mar 2020 00:48:18 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <bharatb.linux@gmail.com>
Subject: [PATCH v7 1/5] hw/vfio/common: Remove error print on mmio region
 translation by viommu
Date: Fri, 13 Mar 2020 13:18:07 +0530
Message-ID: <20200313074811.27175-2-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200313074811.27175-1-bbhushan2@marvell.com>
References: <20200313074811.27175-1-bbhushan2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_03:2020-03-11,
 2020-03-13 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.148.174
X-Mailman-Approved-At: Fri, 13 Mar 2020 10:36:05 -0400
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
Cc: Eric Auger <eric.auger@redhat.com>, Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qt7OlUZQJO6h

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

