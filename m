Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2218089lfc;
        Fri, 13 Mar 2020 07:36:27 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu1OpLaiQBzOG8lL3U6EONOXNcGr2tTSadgG7OUYHmsXpjyZ6UpwnmT93tlbYiHds0KN/FQ
X-Received: by 2002:a05:620a:13a7:: with SMTP id m7mr11995874qki.181.1584110187149;
        Fri, 13 Mar 2020 07:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584110187; cv=none;
        d=google.com; s=arc-20160816;
        b=Es/JnkLkcda/fyBrkG/pPCjPSc+WMjXWlowbi2DXM7QOXC9FWvF5lMgvoRCmrZijgq
         bg10oBliSGCLJgG8ycp1BvoADyvUf3fZZ+4lkPY38fxpS23FXPO510fibWrci1NMq4ts
         Sf1IjhzOFcLltIUYhl+F9qsNfK7j7qbcrCX/e6OP8bQitEgs+Ktf4kFj4Un+tcD9vcAi
         FQwdOZr1bBoxrG7a/WvQzLxdk8XZEsfP1UwA0z8dl4Odxdf9AEjSRtsRkClo/f6kBjgj
         uLxWdw8dOcB5wnZOIN8NSSRxuum4mTMSSs8R/JKG5e/xCHLEH8t3wdU94xabU82CcApy
         NT2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from:dkim-signature;
        bh=t1nHDW03GnsfZ0SAAaMapgUkcZPgjRWuz4lGz3NWJ88=;
        b=zpne6iZSMh8C/2eZ1MPGkAjUuon0D0tkSljFtP/TdBlHYK3YehR0D1yYQMmfIfGO3s
         k7rcppByZ6q3rGmVpFPQ0XzEMGP8PCp3LFZFb+nknQ5sZ1+5X3b8vDEFcWitcVVKLjHe
         sHqQaCsV9Q6ZUuRXkjvQ/r9GLQbk/6tN1pIPoLzBHSpkKssBIfe6w1Dp667citlOOI2C
         srqHXvtY7XkEPitDQw3gmICuHmeTpFp4+yzMnJEyEDgmWYEctnbWarRb27lPoQz0h785
         qroBg7FE+ndfHbJRkCoIJGedisrVtAtUmXla4vDz4dDjCuRaxclEQ/y5ztu40g+EAD7A
         TT+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=HPmn5hWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o51si5028739qtj.187.2020.03.13.07.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:36:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=HPmn5hWc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:59998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jClQI-0000WZ-EB
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCeYt-0007JY-KH
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:16:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCeYs-0005xD-5o
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:16:51 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:21802
 helo=mx0b-0016f401.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCeYr-0005wT-Uc; Fri, 13 Mar 2020 03:16:50 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02D7Ar5H000993; Fri, 13 Mar 2020 00:16:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=pfpt0818;
 bh=t1nHDW03GnsfZ0SAAaMapgUkcZPgjRWuz4lGz3NWJ88=;
 b=HPmn5hWc7j6oDa3SF51nBnQp1pEWsdLcvHhaHUoYCCjyYIiiejqELIZgC+vqJq8JUOPU
 5dsdPxSZnDmk+pCfLuRgawWwDgreCamzn2opAGCMkN+LNvXFbFNaMielos31jw/17tQA
 kGZ+Gkjdfz/skbj6D8l9+iw2GNC2dO2zKc24d6EBfCLTbVeAg5SKEwV1Da8nKbMqNAN5
 jKzMdDt6mqc9KagFf179n4OHnckGqYdkFMw74K7gIbnXQ2OXgFiWSTSOP0XKpWu6QszV
 JRQ+2auUDdif6Q1GpilUy4moscwFjEXP7OfIC/ArkPCuscHs8mvr/wYc4gGw0av42qdz Iw== 
Received: from sc-exch02.marvell.com ([199.233.58.182])
 by mx0a-0016f401.pphosted.com with ESMTP id 2yqt7t2s57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 00:16:47 -0700
Received: from SC-EXCH02.marvell.com (10.93.176.82) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Mar
 2020 00:16:46 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Mar 2020 00:16:42 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <bharatb.linux@gmail.com>
Subject: [PATCH V6 0/5] virtio-iommu: VFIO integration
Date: Fri, 13 Mar 2020 12:46:39 +0530
Message-ID: <20200313071639.26595-1-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_02:2020-03-11,
 2020-03-13 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.148.174
X-Mailman-Approved-At: Fri, 13 Mar 2020 10:35:46 -0400
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
Cc: Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lGqG58/57vIC

This patch series integrates VFIO with virtio-iommu.
This is only applicable for PCI pass-through with virtio-iommu.

This series is available at:
https://github.com/bharat-bhushan-devel/qemu.git virtio-iommu-vfio-integration-v6

This is tested with assigning more than one pci devices to Virtual Machine.

This series is based on:
  - virtio-iommu device emulation by Eric Augur.
    [v16,00/10] VIRTIO-IOMMU device
    https://github.com/eauger/qemu/tree/v4.2-virtio-iommu-v16

  - Linux 5.6.0-rc4

v5->v6:
  - Rebase to v16 version from Eric
  - Tested with upstream Linux
  - Added a patch from Eric/Myself on removing mmio-region error print in vfio

v4->v5:
 - Rebase to v9 version from Eric
 - PCIe device hotplug fix
 - Added Patch 1/5 from Eric previous series (Eric somehow dropped in
   last version.
 - Patch "Translate the MSI doorbell in kvm_arch_fixup_msi_route"
   already integrated with vsmmu3

v3->v4:
 - Rebase to v4 version from Eric
 - Fixes from Eric with DPDK in VM
 - Logical division in multiple patches

v2->v3:
 - This series is based on "[RFC v3 0/8] VIRTIO-IOMMU device"
   Which is based on top of v2.10-rc0 that
 - Fixed issue with two PCI devices
 - Addressed review comments

v1->v2:
  - Added trace events
  - removed vSMMU3 link in patch description

Bharat Bhushan (5):
  hw/vfio/common: Remove error print on mmio region translation by
    viommu
  virtio-iommu: Add iommu notifier for map/unmap
  virtio-iommu: Call iommu notifier for attach/detach
  virtio-iommu: add iommu replay
  virtio-iommu: add iommu notifier memory-region

 hw/vfio/common.c                 |   2 -
 hw/virtio/trace-events           |   5 +
 hw/virtio/virtio-iommu.c         | 189 ++++++++++++++++++++++++++++++-
 include/hw/virtio/virtio-iommu.h |   6 +
 4 files changed, 199 insertions(+), 3 deletions(-)

-- 
2.17.1

