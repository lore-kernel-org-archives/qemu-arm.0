Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1175322lfi;
        Mon, 23 Mar 2020 01:46:53 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuBPqLuHdJBWkaegBp7L4j4xw/YzMqmn0zyiN7cZJUhGjP/u5KvVy+OSOL0MxnB6qHr/TBv
X-Received: by 2002:ac8:18a7:: with SMTP id s36mr19908203qtj.389.1584953213236;
        Mon, 23 Mar 2020 01:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584953213; cv=none;
        d=google.com; s=arc-20160816;
        b=MwL21SselGLQSJyVFHtQCeBuKNOyplO0k7meiZXipN5dg8ub83MdkK8p2mXkYB6bmM
         SCcMdYev3QjtIWJ0F9SpJbFLMbF/V1KXlRvYjL2FvHSimmOen5sZKgtKAubBUkb7yMo2
         rQO5F9zBbSHWPgj6zaKBOxDX/ejACRORzhJ8KVGE3O9A+W16+F/wsyn5YSCkTAdH4c/F
         FJ+EM3FcYWFNjbfHtrS3RTewIaPvjMdFvLIOi6xyOuS+EU1n/GyeXzT9oTDGa7INfFNj
         WMnTNHzNk+R7dA75LGmWCdWqFs+boNnDsn3AjaxZSH5puqg1kugx8EPsh3SZ5p1dxTT+
         J79Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from:dkim-signature;
        bh=UGMbuNIPTJ+XeDxSnjbmRh2VLg/3lbdiKdMGfaISzag=;
        b=XlrPp0DvUekdsSsm8YUJ5H4fklrLNEOFwG6b28UgjY6pUrcSJdDnCabxamiFxZ8z9H
         sp0bLz+6MpWs578Hz1DrFFe1ap9TKta41UpViAcsw5Z9K4clyU2WVX8WtGaOWAgbsibq
         31x7CZao3lM1Bhhalzc3EUx14K0jMi6ZwuDG3QFO566GhaUDyVAAz4vajPT04Ls+8VsJ
         8VOGXzjhr8OVhiAtkoaImZtfbfrUmEb/VG3aqJVG1qHbutfmAzXytKfGgWxFCKeREUpf
         /7T8LCtXqF9d8ZzzTwVqWm4SqzBeo89bTpjXPaE6EYUJs6dAs5pejL1Vq71ZH4S5v/Ax
         /sgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=II1hwlZk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g24si8505948qte.107.2020.03.23.01.46.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 01:46:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=II1hwlZk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:58542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGIjU-0007yc-L8
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 04:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48303)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjG-0007yD-JS
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 04:46:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjC-00032Z-2S
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 04:46:38 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:34412
 helo=mx0b-0016f401.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2351ca747f=bbhushan2@marvell.com>)
 id 1jGIjB-00031x-If; Mon, 23 Mar 2020 04:46:34 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N8e1Km010781; Mon, 23 Mar 2020 01:46:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=pfpt0818;
 bh=UGMbuNIPTJ+XeDxSnjbmRh2VLg/3lbdiKdMGfaISzag=;
 b=II1hwlZkkCOi5sZwchFTlaM0HYLHi3vqtTp8FDecL74MQOOYUTg5YvO6cwMJdN8u9TEg
 verrkCiEg2YA9xmpPN8oQrw7JDZ2Mw2vXZp2csUe57NymvKdkJoxaijLCR3y/3TVhRVX
 Fw+05NVuYXmGmhm4DOMMk1zBwjnWkA50XOmfFPP/hL0Qh1zLeFQwYz8Rq7k+mPDek2eX
 APjRzDHwxJ67OJTq08puN5ruFAT9u2Anp6phAtI3q9KEM3I5njoAUIUvCsU51RGlCpJl
 W0MTx8Ar2IKAdlyAQZMCLWC9IO2HdtUu7UIuNPGKpXiiRk9Z9CR7z5oVXy5QIxz8adHJ rg== 
Received: from sc-exch01.marvell.com ([199.233.58.181])
 by mx0a-0016f401.pphosted.com with ESMTP id 2ywg9ndrvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 23 Mar 2020 01:46:28 -0700
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by SC-EXCH01.marvell.com
 (10.93.176.81) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 23 Mar 2020 01:46:27 -0700
Received: from SC-EXCH03.marvell.com (10.93.176.83) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 23 Mar 2020 01:46:26 -0700
Received: from bbhushan2.marvell.com (10.93.176.43) by SC-EXCH03.marvell.com
 (10.93.176.83) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Mar 2020 01:46:22 -0700
From: Bharat Bhushan <bbhushan2@marvell.com>
To: <peter.maydell@linaro.org>, <peterx@redhat.com>,
 <eric.auger.pro@gmail.com>, <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, <mst@redhat.com>, <tnowicki@marvell.com>,
 <drjones@redhat.com>, <linuc.decode@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <bharatb.linux@gmail.com>, <jean-philippe@linaro.org>,
 <yang.zhong@intel.com>
Subject: [PATCH v9 0/9] virtio-iommu: VFIO integration
Date: Mon, 23 Mar 2020 14:16:08 +0530
Message-ID: <20200323084617.1782-1-bbhushan2@marvell.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Bharat Bhushan <bbhushan2@marvell.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5AKqV8Vqnbs3

This patch series integrates VFIO with virtio-iommu.
This is only applicable for PCI pass-through with virtio-iommu.

This series is available at:
https://github.com/bharat-bhushan-devel/qemu.git virtio-iommu-vfio-integration-v8

This is tested with assigning more than one pci devices to Virtual Machine.

v8-v9:
  - Have page size mask per endpint
  - Add PROBE interface, return page size mask
 
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

Bharat Bhushan (9):
  hw/vfio/common: Remove error print on mmio region translation by
    viommu
  memory: Add interface to set iommu page size mask
  vfio: set iommu page size as per host supported page size
  virtio-iommu: set supported page size mask
  virtio-iommu: Add iommu notifier for map/unmap
  virtio-iommu: Call iommu notifier for attach/detach
  virtio-iommu: add iommu replay
  virtio-iommu: Implement probe request
  virtio-iommu: add iommu notifier memory-region

 include/exec/memory.h                         |  20 +
 include/hw/virtio/virtio-iommu.h              |   3 +
 include/standard-headers/linux/virtio_iommu.h |   6 +
 hw/vfio/common.c                              |   5 +-
 hw/virtio/virtio-iommu.c                      | 352 +++++++++++++++++-
 memory.c                                      |  10 +
 hw/virtio/trace-events                        |   7 +
 7 files changed, 397 insertions(+), 6 deletions(-)

-- 
2.17.1

