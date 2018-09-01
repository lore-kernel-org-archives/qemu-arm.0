Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp626137wrd;
        Sat, 1 Sep 2018 07:34:12 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaNiIg7qk68+/lWIRGqFc7i8cpFMy5tXQTYWf0ysXbtTSpx82e94bMS22Q3dKuAPlhaDDsS
X-Received: by 2002:a37:b546:: with SMTP id e67-v6mr19351756qkf.237.1535812452650;
        Sat, 01 Sep 2018 07:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535812452; cv=none;
        d=google.com; s=arc-20160816;
        b=N//AAqA930X6U9aXVYGDlfFW4hqq4IdA9U8hJRgU/O7VFYOu0L2GWdZxDDZTxGNahc
         USAANm8Qt9eypF7TFsm5cz70g8uVSlitC8iEPXuMpIqGXWvGzV0qZZ1WUvT6fs1rcYjp
         MzrAdppdv3u/xlDNjz0+vkPOvaC8R/WFYj30aqzUp98SlEXXqIYBjKsJSRAQ3tXyTp23
         BrQiUjTnTas236MJYljzrtGQBv6sE65SXgo3VSuM4CcXLAXnkX+n4csuouMgjyphkalz
         2RvvFliHJDTcpt5e5pzzT5tYipu2Me7eSwV1iGZscbFz9ZkmjYlsWdLC3MkClCbvKVzt
         ilQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=bHjDwaYDZdtOdjVnXzXES/sLOiZ5YMkbp3yalYnEL8M=;
        b=oyvB8wNcah3ZtXTpiqw0O/F0RRQNJtwUdp7Wes7m8DJpRu1imEVtUTE/j0gTOFQonI
         4wZEUEacj5ozNofPIQqJtpJkEIQiWcH/19V/9G8FVrhWhbHHYK5MGJG1wS2ty8eU9Tm/
         klPlVi1WhtoGE1bEER8wJeqDT9ZRE903zDkcWPUUI1hTxE25GUL7PyjMDHQW64xJ8qkw
         YqAHFfBnfLOfaJorJDRI6A//Cef7EeDRChVL24L4dxEt5e2HDmLqa+uc2ey/lEgHwqvC
         ar9teFveqNa9WECF3TaoGbWqLZYuj7rvCyuvIz6jePWFRP6NubkI4GUwOyYFkPNeUsqj
         920g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k23-v6si331850qvg.44.2018.09.01.07.34.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 07:34:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37387 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw6ya-0007uc-4U
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 10:34:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6qX-0006Tw-7G
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:25:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6oG-0005JU-8h
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:23:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51072 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fw6oB-0005CC-SE; Sat, 01 Sep 2018 10:23:27 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B78D2BCB0;
	Sat,  1 Sep 2018 14:23:26 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D67AA2166B41;
	Sat,  1 Sep 2018 14:23:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  1 Sep 2018 16:22:52 +0200
Message-Id: <20180901142312.11662-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Sat, 01 Sep 2018 14:23:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Sat, 01 Sep 2018 14:23:26 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC 00/20] vSMMUv3/pSMMUv3 2 stage VFIO integration
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HXVdF2YUp7i2

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

The series uses a new kernel user API [1], still under definition.

- We force the host to use stage 2 instead of stage 1, when we
  detect a vSMMUV3 is behind a VFIO device. For a VFIO device
  without any virtual IOMMU, we still use stage 1 as many existing
  SMMUs expect this behavior.
- We introduce new IOTLB "config" notifiers, requested to notify
  changes in the config of a given iommu memory region. So now
  we have notifiers for IOTLB changes and config changes.
- vSMMUv3 calls config notifiers when STE (Stream Table Entries)
  are updated by the guest.
- We implement a specific UNMAP notifier that conveys guest
  IOTLB invalidations to the host
- We implement a new MAP notifiers only used for MSI IOVAs so
  that the host can build a nested stage translation for MSI IOVAs
- As the legacy MAP notifier is not called anymore, we must make
  sure stage 2 mappings are set. This is achieved through another
  memory listener.

Physical SMMUs faults are not yet reported to the guest. This support
will be added in next releases.

Note: some iommu memory notifier rework related patches are close
to those previously published by Peter and Liu. I will be pleased to
add their Signed-off-by if they agree/wish.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v3.0.0_2stage-rfc-v1

Testing:
- For testing use my kernel branch
  https://github.com/eauger/linux/tree/v4.18-2stage-rfc++
  features [1] + small evolutions
- Tested on Qualcomm HW
- Known limitation:
  - currently sending an NH_ASID command instead of NH_VA
    upon guest NH_VA may cause important perf downgrade.
    Propagating NH_VA does not work at the moment.
  - no fault reporting to the guest

References:
- [1] [RFC 00/13] SMMUv3 Nested Stage Setup
  https://www.spinics.net/lists/kvm-arm/msg32525.html


Eric Auger (20):
  hw/arm/smmu-common: Fix the name of the iommu memory regions
  update-linux-headers: Import iommu.h
  linux-headers: Partial header update
  memory: add IOMMU_ATTR_VFIO_NESTED IOMMU memory region attribute
  hw/arm/smmuv3: Implement get_attr API to report IOMMU_ATTR_VFIO_NESTED
  hw/vfio/common: Refactor container initialization
  hw/vfio/common: Force nested if iommu requires it
  memory: Introduce IOMMUIOLTBNotifier
  memory: rename memory_region notify_iommu, notify_one
  memory: Add IOMMUConfigNotifier
  hw/arm/smmuv3: Store s1ctrptr in translation config data
  hw/arm/smmuv3: Implement dummy replay
  hw/arm/smmuv3: Notify on config changes
  hw/vfio/common: Introduce vfio_alloc_guest_iommu helper
  hw/vfio/common: Introduce vfio_dma_(un)map_ram_section helpers
  hw/vfio/common: Register specific nested mode notifiers and
    memory_listener
  hw/vfio/common: Register MAP notifier for MSI binding
  target/arm/kvm: Notifies IOMMU on MSI stage 1 binding
  vfio/pci: Always set up MSI route before enabling vectors
  hw/arm/smmuv3: Remove warning about unsupported MAP notifiers

 exec.c                          |  12 +-
 hw/arm/smmu-common.c            |  12 +-
 hw/arm/smmuv3.c                 | 100 ++++--
 hw/i386/intel_iommu.c           |  16 +-
 hw/misc/tz-mpc.c                |   8 +-
 hw/ppc/spapr_iommu.c            |   2 +-
 hw/s390x/s390-pci-inst.c        |   4 +-
 hw/vfio/common.c                | 547 +++++++++++++++++++++++---------
 hw/vfio/pci.c                   |   1 +
 hw/vfio/trace-events            |   4 +-
 hw/virtio/vhost.c               |  12 +-
 include/exec/memory.h           |  98 ++++--
 include/hw/arm/smmu-common.h    |   1 +
 linux-headers/linux/iommu.h     | 157 +++++++++
 linux-headers/linux/vfio.h      |  28 +-
 memory.c                        |  52 ++-
 scripts/update-linux-headers.sh |   2 +-
 target/arm/kvm.c                |  46 ++-
 18 files changed, 818 insertions(+), 284 deletions(-)
 create mode 100644 linux-headers/linux/iommu.h

-- 
2.17.1

