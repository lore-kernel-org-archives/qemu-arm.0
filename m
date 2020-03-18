Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp612916lfe;
        Wed, 18 Mar 2020 03:12:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsLEfzwwPgrGoKKyAPr0gumOWC9g0M5o8QoJUW/IByyGyqR505BZBxIEVPpnafH4sg22vxj
X-Received: by 2002:a37:6606:: with SMTP id a6mr3044088qkc.364.1584526346621;
        Wed, 18 Mar 2020 03:12:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584526346; cv=none;
        d=google.com; s=arc-20160816;
        b=GIFEHK8LhMMi/GLRcfY2fqLrScXu5rIXHkAgHR34IFC1bZrW0PvVIaght5e+ncLTzK
         YhuEvxKqFBuXx8YLdVluTrWIdsXtM/pMyFYiljvR/ihq6qW4SkZb8HZO3H91LPNTW3Cz
         20y1wnpEDc9J/6aII69ygeL4faiJX409pzc0pzChoqOSsPni5V1JIZy6qrZ+L6RLiW5V
         Y1KpQ6iQLHipdggJVQkCi83iMy7jRyhvDgLlOekAjNRQ4IWI4dLhsH6YueYWClRGmSv6
         rjyh/6ByAlseAnWhgusq01/ivSFdInr3WuYP38TFEJ64IvI6pjLQj2uaGXNV8nFWpIdp
         GHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from:dkim-signature;
        bh=h+HuOg5nytFa3XWHv+N0Ol0eS84CP559ihpJU4+Bu/g=;
        b=o9tBD4ouMf1LGm52a5rzefGTshv8sywUxq5h2d7iGFc9RK41p/L8SFtQQW6Esc0EbS
         UCVuwvcSkhy62L1kuuloUAGKHaVUel6hBtdNpSLHLYx9d4gXh9kSv2Hin+R/et1jAG1G
         UAKFlgnalpate+o9sgIt6Tc6GaY33r4TwzdDB4WX+MakzGX0/tmSULsBAUfc0zU9j5Wl
         lziZEzWURsymfLJPAhsBR/9YUu/9pyNF6rqjRLT5U+wfddLsisXLIb9qBJ2/sgd3Pxof
         2oCjqxxdxd2GresKG1wZkomn85mtTCb+qBurUWlAebDjbv5sCoyGbuyM/i7LTAa0A9Bz
         pGYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=rMN77kUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 193si3994700qkh.67.2020.03.18.03.12.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Mar 2020 03:12:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=rMN77kUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:47902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEVgY-0001f2-16
	for alex.bennee@linaro.org; Wed, 18 Mar 2020 06:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgP-0001bh-70
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 06:12:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgO-0004PJ-29
 for qemu-arm@nongnu.org; Wed, 18 Mar 2020 06:12:17 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:5048
 helo=mx0b-0016f401.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2346c1f04e=bbhushan2@marvell.com>)
 id 1jEVgK-0004KH-LN; Wed, 18 Mar 2020 06:12:12 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IAAi7n008537; Wed, 18 Mar 2020 03:12:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=pfpt0818;
 bh=h+HuOg5nytFa3XWHv+N0Ol0eS84CP559ihpJU4+Bu/g=;
 b=rMN77kUrqCofMP4QeuYj+2tOXq7P+NZneSTA4yxnzXneoHLoxN2LcmvG57ZTqW3m+zRC
 1/3gShmJrH46QDWl+8z4fv8VLswIqH+BC0eDtdoZdfvn/TKkju9TZuk/p3qcp+EnVI5C
 nO6XqtW/3lVYPRzt71GtwPcEWusEQHiQldpR6MqD0P74xQfhGOqX0iaE6UgVXCQHcm9D
 XxNDggQiWFEMsOVMyPlxRBiVu2V7IBHaMO9ljoSRsp/SJ+oB1cHizFH+BZCdqoR/X4qA
 w/hUkkW0TclCUhZdFjNZgCWxd9EXehZsWzkhawhSJQy3DPyXxZoh7uPwBE5+nHm+krre vA== 
Received: from sc-exch01.marvell.com ([199.233.58.181])
 by mx0a-0016f401.pphosted.com with ESMTP id 2yu8pqj4mf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 03:12:08 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by SC-EXCH01.marvell.com
 (10.93.176.81) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 18 Mar
 2020 03:12:06 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Mar 2020 03:12:02 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v8 0/8] virtio-iommu: VFIO integration
Date: Wed, 18 Mar 2020 15:41:51 +0530
Message-ID: <20200318101159.8767-1-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
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
Cc: Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DSibIKoXUpBk

This patch series integrates VFIO with virtio-iommu.
This is only applicable for PCI pass-through with virtio-iommu.

This series is available at:
https://github.com/bharat-bhushan-devel/qemu.git virtio-iommu-vfio-integration-v8

This is tested with assigning more than one pci devices to Virtual Machine.

This series is based on:
  - virtio-iommu device emulation by Eric Augur.
    [v16,00/10] VIRTIO-IOMMU device
    https://github.com/eauger/qemu/tree/v4.2-virtio-iommu-v16

  - Linux 5.6.0-rc4

v7->v8:
  - Set page size mask as per host
    This fixes issue with 64K host/guest 
  - Device list from IOMMUDevice directly removed VirtioIOMMUNotifierNode
  - Add missing iep->viommu init on post-load

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

Bharat Bhushan (8):
  hw/vfio/common: Remove error print on mmio region translation by
    viommu
  memory: Add interface to set iommu page size mask
  vfio: set iommu page size as per host supported page size
  virtio-iommu: set supported page size mask
  virtio-iommu: Add iommu notifier for map/unmap
  virtio-iommu: Call iommu notifier for attach/detach
  virtio-iommu: add iommu replay
  virtio-iommu: add iommu notifier memory-region

 include/exec/memory.h            |  20 ++++
 include/hw/virtio/virtio-iommu.h |   2 +
 hw/vfio/common.c                 |   5 +-
 hw/virtio/virtio-iommu.c         | 192 ++++++++++++++++++++++++++++++-
 memory.c                         |  10 ++
 hw/virtio/trace-events           |   5 +
 6 files changed, 231 insertions(+), 3 deletions(-)

-- 
2.17.1

