Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2217501lfc;
        Fri, 13 Mar 2020 07:35:56 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtneBqk0U/GzD1uGdJQ3sj7UZbR0WO9d6MtqTsG25VXLEHhxienCVCXtbFV7fzj6nJIkWli
X-Received: by 2002:a37:4b4b:: with SMTP id y72mr13027139qka.175.1584110156554;
        Fri, 13 Mar 2020 07:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584110156; cv=none;
        d=google.com; s=arc-20160816;
        b=Qqkh1UeCRq4+xSmAL5LiGuw7c0k8yOiwbnymKKhqiL7TwOnV0q9aGEmfojkqL2oXpO
         4lvHgBEIQs5xathQ8K5S9c4DYfDmgdZlopNR+AEMfKAsg0ajvD5OCDyDSK5p2e1A3/jx
         U7LJ5C0Rc/zj7EDfx5Xr4xbND9/2Mn7gaEvvPPtFdfqVlv+KUcRva0cz4LWaexo4zVDT
         K+Mnrb3qd33WuKJt+Z1ZMzM76Ns0o2AmO7Zmb9XshXZuf0ySpMF74f+fwUKXsBqlH0Hi
         phBNGKqMQHW5kLgBKHARLvFlhhqf03bC6VtQKn37Sc+ccBgjFyR/4ot1RGDMb/saYCMp
         KQLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from:dkim-signature;
        bh=5x5XWt7UJuZnrVK7KO1KvYL06RXOteeFnKHck+rpKoo=;
        b=OiayAAtjbUH/BKbf5WQoONhhZGiHQA2X8UqzAxLbKCtlFYf8fpfqOz/YtzYvvJa+QP
         a53bIO/499pRdmvjAB0E49CmHk+YbLsv2oeoUp7RkCZ4fozbRzPCCDhUfKeGaXqNm935
         UY5MhhVFurlSZGqhTxgBj2dpEPv3GZplf8H2jsjVe8iCvhNHcQXU/GFg3+IP3PVO0Hf/
         P8xQ0xTbv29eKCeR0aNoydOLwm0GnAhlHnR1KEuHpu27wzJyL1ovGA/f48Pkf49YNVBI
         pq78klW/SbHGFBT2T5D71CKbdoTXc5e+4DhisVKmI5BbYbolq0y0Dr5wt/okyzwJYUHx
         Pc8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=QJp5mv80;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c188si4887477qkb.310.2020.03.13.07.35.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:35:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=QJp5mv80;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:59970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jClPn-0007u8-Vw
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60728)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3Q-0005sD-TN
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:48:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3P-0001LQ-Cp
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 03:48:24 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:30980)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2341787188=bbhushan2@marvell.com>)
 id 1jCf3P-0001Ka-6m; Fri, 13 Mar 2020 03:48:23 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02D7kdkY020456; Fri, 13 Mar 2020 00:48:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=pfpt0818;
 bh=5x5XWt7UJuZnrVK7KO1KvYL06RXOteeFnKHck+rpKoo=;
 b=QJp5mv80e26+gJ6Tpv9f4df72fcxDsL8hZUnEMzkZrtyCzgFKRsE20L6xxTmaMUx+Yoq
 5M+fpguaAwy56tHiBz7GQxyA8b/Q2LHkzmen3PINsixuuV9dzWZkN72YXAHr1l3B/+WT
 W4pO6sF7MjF6cWPDPh0xyc+al1ayZtkRcVqxL5CMrE4iFhUVQevqvAUG4Q0TbuN5iH4d
 xJJR+LkvgLjLaVsU/UauREff6ZODlfuO6WhgfH5KeWf/eTspP18BOPWtEDoiNZgvnmeS
 Q85Lr1BAhI+1wcneeH4uIgxPYIPDONdMqzBGNYCDPy7wLqX7hIzvlURnwAUoM/0UhkoZ /w== 
Received: from sc-exch02.marvell.com ([199.233.58.182])
 by mx0b-0016f401.pphosted.com with ESMTP id 2yqt7f2vnk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 13 Mar 2020 00:48:20 -0700
Received: from SC-EXCH04.marvell.com (10.93.176.84) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Mar
 2020 00:48:17 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH04.marvell.com
 (10.93.176.84) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Mar 2020 00:48:13 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <bharatb.linux@gmail.com>
Subject: [PATCH v7 0/5] virtio-iommu: VFIO integration
Date: Fri, 13 Mar 2020 13:18:06 +0530
Message-ID: <20200313074811.27175-1-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_03:2020-03-11,
 2020-03-13 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.156.173
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
X-TUID: qeISa2pTcV95

This patch series integrates VFIO with virtio-iommu.
This is only applicable for PCI pass-through with virtio-iommu.

This series is available at:
https://github.com/bharat-bhushan-devel/qemu.git virtio-iommu-vfio-integration-v7

This is tested with assigning more than one pci devices to Virtual Machine.

This series is based on:
  - virtio-iommu device emulation by Eric Augur.
    [v16,00/10] VIRTIO-IOMMU device
    https://github.com/eauger/qemu/tree/v4.2-virtio-iommu-v16

  - Linux 5.6.0-rc4

v6->v7:
  - corrected email-address

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

