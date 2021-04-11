Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp3052602lfr;
        Sun, 11 Apr 2021 05:10:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsdEYsmk9b0hyCZrpX+bsUoQ9ZzDPzvc/g5vnbBZ7P6WHeUpsbmz31AwCOfhA7dWkfv8ls
X-Received: by 2002:a67:ed4e:: with SMTP id m14mr17127811vsp.40.1618143013906;
        Sun, 11 Apr 2021 05:10:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618143013; cv=none;
        d=google.com; s=arc-20160816;
        b=NMDEDTIOhxRGsqgNzDVFtq7xQ6xfUOCpF1MtkKw0aAbmfoNHRfl2K4uk9t7/sqNvA1
         VE6LYEqrvzJia3RBZgCvybK9t4P5pocw6evgTN9aIzsHicNETfKBd38ezD7ZeOhw2KQ7
         2YnaC558jXEL/c0A5JSuXndydjWj8k2fNW0BmYoMOHSAaevivfls7JaYGyCQ7qKwlzEQ
         RTkjQic0L2rZx/ZX4zV49dqKVF8yyeFp1gOzIyyn92HPb5rAQ6BwtEFp4fqd2mYbcn1I
         Fv5b2eWibLpuUIE1VhrlFm/6Ur8tWEGXnYax6E7dLvR5EsTVCszfiFeM9tO9wshPDftw
         +02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=GOuV0CIDjCcOWa3rY5nawUX4wz8HR/h1vZ8RpKSRMZQ=;
        b=jbMx0U5ukhMWBa2LQZ3aRgWFmRaFChnTD1bZHOtP5eHSYmjZVhsQP7X2u1/VkMqKj0
         t6f8GAnwR9irLvLTuafTL8btAQVx8E+X4d4gSvoMCY5kur4kjjj8s2PO7VgGVGnIfzl1
         4+Zmlg+pglwRRtXXmw/kPmyAC/I71K3okiw71YKKeBeiX0e/iyog7VjcgN8eExAbG6KD
         SqglaW0hzlOFiXckYp7asQnc38Jlk42uE6JrLYGNSwsl+AHy8CHY7DL+hVxh2mRwvVzu
         moRlB2mIfiZaabdg066wvx8iUBDnI4heiwdqLuT1mLjZ8TSJT8eTkdfMVjWJLbObA67X
         yfyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O81CIvsc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si684837ual.181.2021.04.11.05.10.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Apr 2021 05:10:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O81CIvsc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVYur-00089h-3L
	for alex.bennee@linaro.org; Sun, 11 Apr 2021 08:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYuK-00088h-68
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 08:09:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lVYuH-00025S-C6
 for qemu-arm@nongnu.org; Sun, 11 Apr 2021 08:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618142976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GOuV0CIDjCcOWa3rY5nawUX4wz8HR/h1vZ8RpKSRMZQ=;
 b=O81CIvscLKQpJ+xiqWe++9WsfBZRSqIKeTIhD3Cp8o9RiFeAKiTiQsysD54J9O58OKi8eJ
 ryIab3rdNHxSKHDhfBj1nZ+GvOOQoQsHHgiUrYrHTcpG2C8l3Y9B5Eve0lnF+GXBElyy0u
 UlgmNp0Wy/10EgfGo4gz1/uVnyjMh4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-ReniJGHxPCi1x43XZwMSxw-1; Sun, 11 Apr 2021 08:09:34 -0400
X-MC-Unique: ReniJGHxPCi1x43XZwMSxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 782E7802B40;
 Sun, 11 Apr 2021 12:09:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D445101E5AF;
 Sun, 11 Apr 2021 12:09:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com
Subject: [RFC v9 00/29] vSMMUv3/pSMMUv3 2 stage VFIO integration
Date: Sun, 11 Apr 2021 14:08:43 +0200
Message-Id: <20210411120912.15770-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, jacob.jun.pan@linux.intel.com,
 jean-philippe@linaro.org, tn@semihalf.com, chenxiang66@hisilicon.com,
 jiangkunkun@huawei.com, shameerali.kolothum.thodi@huawei.com,
 nicoleotsuka@gmail.com, vivek.gautam@arm.com, vdumpa@nvidia.com,
 yi.l.liu@intel.com, peterx@redhat.com, zhangfei.gao@gmail.com,
 yuzenghui@huawei.com, zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pPl4GZludF34

Up to now vSMMUv3 has not been integrated with VFIO. VFIO
integration requires to program the physical IOMMU consistently
with the guest mappings. However, as opposed to VTD, SMMUv3 has
no "Caching Mode" which allows easy trapping of guest mappings.
This means the vSMMUV3 cannot use the same VFIO integration as VTD.

However SMMUv3 has 2 translation stages. This was devised with
virtualization use case in mind where stage 1 is "owned" by the
guest whereas the host uses stage 2 for VM isolation.

This series sets up this nested translation stage. It only works
if there is one physical SMMUv3 used along with QEMU vSMMUv3 (in
other words, it does not work if there is a physical SMMUv2).

- We force the host to use stage 2 instead of stage 1, when we
  detect a vSMMUV3 is behind a VFIO device. For a VFIO device
  without any virtual IOMMU, we still use stage 1 as many existing
  SMMUs expect this behavior.
- We use PCIPASIDOps to propage guest stage1 config changes on
  STE (Stream Table Entry) changes.
- We implement a specific UNMAP notifier that conveys guest
  IOTLB invalidations to the host
- We register MSI IOVA/GPA bindings to the host so that this latter
  can build a nested stage translation
- As the legacy MAP notifier is not called anymore, we must make
  sure stage 2 mappings are set. This is achieved through another
  prereg memory listener.
- Physical SMMU stage 1 related faults are reported to the guest
  via en eventfd mechanism and exposed trhough a dedicated VFIO-PCI
  region. Then they are reinjected into the guest.

Best Regards

Eric

All the patches can be found at:
https://github.com/eauger/qemu/tree/v6.0.0-rc2-2stage-rfcv9

Previous version:
v8: https://github.com/eauger/qemu/tree/v5.2.0-2stage-rfcv8

Kernel Dependencies:
[1] [PATCH v15 00/12] SMMUv3 Nested Stage Setup (IOMMU part)
[2] [PATCH v13 00/13] SMMUv3 Nested Stage Setup (VFIO part)
branch containing both:
https://github.com/eauger/linux/tree/v5.12-rc6-jean-iopf-14-2stage-v15

History:

v8 -> v9:
- added
  hw/arm/smmu-common: Allow domain invalidation for NH_ALL/NSNH_ALL
  following Chenxiang's report

v7 -> v8:
- adapt to changes to the kernel uapi
- Fix unregistration of MSI bindings
- applies on top of range invalidation fixes
- changes in IOTLBEntry (flags)
- addressed all the comments from reviewers/testers I hope.
  Many thanks to all of you! see individual logs


Eric Auger (28):
  hw/vfio/common: trace vfio_connect_container operations
  update-linux-headers: Import iommu.h
  header update against 5.12-rc6 and IOMMU/VFIO nested stage APIs
  memory: Add new fields in IOTLBEntry
  hw/arm/smmuv3: Improve stage1 ASID invalidation
  hw/arm/smmu-common: Allow domain invalidation for NH_ALL/NSNH_ALL
  memory: Add IOMMU_ATTR_VFIO_NESTED IOMMU memory region attribute
  memory: Add IOMMU_ATTR_MSI_TRANSLATE IOMMU memory region attribute
  memory: Introduce IOMMU Memory Region inject_faults API
  iommu: Introduce generic header
  vfio: Force nested if iommu requires it
  vfio: Introduce hostwin_from_range helper
  vfio: Introduce helpers to DMA map/unmap a RAM section
  vfio: Set up nested stage mappings
  vfio: Pass stage 1 MSI bindings to the host
  vfio: Helper to get IRQ info including capabilities
  vfio/pci: Register handler for iommu fault
  vfio/pci: Set up the DMA FAULT region
  vfio/pci: Implement the DMA fault handler
  hw/arm/smmuv3: Advertise MSI_TRANSLATE attribute
  hw/arm/smmuv3: Store the PASID table GPA in the translation config
  hw/arm/smmuv3: Fill the IOTLBEntry arch_id on NH_VA invalidation
  hw/arm/smmuv3: Fill the IOTLBEntry leaf field on NH_VA invalidation
  hw/arm/smmuv3: Pass stage 1 configurations to the host
  hw/arm/smmuv3: Implement fault injection
  hw/arm/smmuv3: Allow MAP notifiers
  pci: Add return_page_response pci ops
  vfio/pci: Implement return_page_response page response callback

Liu Yi L (1):
  pci: introduce PCIPASIDOps to PCIDevice

 hw/arm/smmu-internal.h                        |   1 +
 hw/vfio/pci.h                                 |  11 +
 include/exec/memory.h                         |  64 +-
 include/hw/arm/smmu-common.h                  |   1 +
 include/hw/iommu/iommu.h                      |  36 ++
 include/hw/pci/pci.h                          |  15 +
 include/hw/vfio/vfio-common.h                 |  19 +
 include/standard-headers/drm/drm_fourcc.h     |  23 +-
 include/standard-headers/linux/ethtool.h      |  54 +-
 include/standard-headers/linux/fuse.h         |   3 +-
 include/standard-headers/linux/input.h        |   2 +-
 .../standard-headers/rdma/vmw_pvrdma-abi.h    |   7 +
 linux-headers/asm-generic/unistd.h            |   4 +-
 linux-headers/asm-mips/unistd_n32.h           |   1 +
 linux-headers/asm-mips/unistd_n64.h           |   1 +
 linux-headers/asm-mips/unistd_o32.h           |   1 +
 linux-headers/asm-powerpc/kvm.h               |   2 +
 linux-headers/asm-powerpc/unistd_32.h         |   1 +
 linux-headers/asm-powerpc/unistd_64.h         |   1 +
 linux-headers/asm-s390/unistd_32.h            |   1 +
 linux-headers/asm-s390/unistd_64.h            |   1 +
 linux-headers/asm-x86/kvm.h                   |   1 +
 linux-headers/asm-x86/unistd_32.h             |   1 +
 linux-headers/asm-x86/unistd_64.h             |   1 +
 linux-headers/asm-x86/unistd_x32.h            |   1 +
 linux-headers/linux/kvm.h                     |  89 +++
 linux-headers/linux/vfio.h                    | 169 +++++-
 hw/arm/smmu-common.c                          |   3 +-
 hw/arm/smmuv3.c                               | 224 ++++++-
 hw/i386/intel_iommu.c                         |   6 +-
 hw/pci/pci.c                                  |  50 ++
 hw/ppc/spapr_iommu.c                          |   2 +-
 hw/vfio/common.c                              | 565 ++++++++++++++----
 hw/vfio/pci.c                                 | 415 ++++++++++++-
 hw/virtio/virtio-iommu.c                      |   4 +-
 softmmu/memory.c                              |  10 +
 hw/arm/trace-events                           |   2 +
 hw/vfio/trace-events                          |  11 +-
 scripts/update-linux-headers.sh               |   2 +-
 39 files changed, 1626 insertions(+), 179 deletions(-)
 create mode 100644 include/hw/iommu/iommu.h

-- 
2.26.3

