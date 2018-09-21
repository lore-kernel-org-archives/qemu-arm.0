Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2851833wrd;
        Fri, 21 Sep 2018 01:19:12 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdaQQBgj+t31STmw1DFNXN1KkevBGy3QO0MZ15x4DP+eSsaRn60Wy/sC2B/qzoLGS3iWf7hN
X-Received: by 2002:a37:c442:: with SMTP id h2-v6mr8416934qkm.30.1537517952828;
        Fri, 21 Sep 2018 01:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537517952; cv=none;
        d=google.com; s=arc-20160816;
        b=tx/H5H94UAeCoIIYaAFtfYtrl9MmyyeE8YFQs6Rjkap1BhiY9XtT3sPf3ZSAdZs1X3
         cLj6ZuV1LN572qsqQ370aZ7aEZmQe+pmWfvswrvCRTeinW0kKQ1nxVtAvZAqtgddHehK
         ei/wlrJFhgNaOZ6UAl3XEx8/5h72LZOCYrRXQrNOm/UzPU3qBleqJg4UEUv5FtkClmu1
         Msr8OQnG1/ifNtppjB8kBvvjyBf0puB5bh6LS9HkTJR+MJKjDl8pa2MsWv1m+hUDN1PC
         YhOY2JaFu8FQr7Q3LTZiC8Ck9TT4rEIvT4LWIT6755I05xMe1Za8jwUK6xDo9Ixp/s/e
         bcmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=Iy6wYls6h1HtUmAu4aI18ZwZ1iD8WXEdQCQbb+Beoe8=;
        b=XKAP2dkskFhckYAKQS+6w5XcKrKtKP5Y2wguaTxA2CUbo4p9Vl4ETTjv5HzQd9U52v
         8Vf7EED63+1KY0FrYNj6+0GcFMPA+ky+jX5mIBttCLBIhaxmQ8xPSUyHcooa9DzESBiA
         VwonXZD0F4e9g5AecpN/Rjc5rjlOBzLr57pAm19wW8LLEHRxzNJl/dhO/W0mj90ysmAq
         zcaMrsQdC7CZVPOqhkKslGxQAbDmyXZxfb/Eg22AM0HQISiEXA5hnq7e7F36sCEbWs7p
         Zo8nT/eF5bEQSJuozliqzfDV7KNMXf8JUp3qGRhiZ37ZTa6ycat2bSl3olEyJL6wsWTA
         6oew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r48-v6si3311142qtj.56.2018.09.21.01.19.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:19:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3Gee-0003bH-6A
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:19:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GeO-0003ZI-92
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:18:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GeJ-0000rz-AA
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:18:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50644)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3GeJ-0000pD-24; Fri, 21 Sep 2018 04:18:51 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 246DC307D847;
	Fri, 21 Sep 2018 08:18:50 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8FB97D904;
	Fri, 21 Sep 2018 08:18:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:17:51 +0200
Message-Id: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 21 Sep 2018 08:18:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 00/28] vSMMUv3/pSMMUv3 2 stage VFIO integration
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ElgvbDPr08N0

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
- Physical SMMUs faults are reported to the guest via en eventfd
  mechanism and reinjected into this latter.

Note: some iommu memory notifier rework related patches are close
to those previously published by Peter and Liu. I will be pleased to
add their Signed-off-by if they agree/wish.

Note: The 2 first patches were sent separately in:
[PATCH 0/2] ARM SMMUv3: Fix event queue handling and memory region names
 as they are fixes of current SMMU emulation code.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v3.0.0_2stage-rfc-v2

Testing:
- For testing use my kernel branch
  https://github.com/eauger/linux/tree/v4.19-rc4-2stage-rfc-v2 [1]
- Tested on Qualcomm HW with 1/2 assigned e1000e NICs. Hotplug
  was also tested OK.
- Known limitation:
  - currently sending an NH_ASID command instead of NH_VA
    upon guest NH_VA. This may cause important perf downgrade.
    Propagating NH_VA does not work at the moment.

References:
- [1] [RFC v2 00/20] SMMUv3 Nested Stage Setup
  (https://lkml.org/lkml/2018/9/18/1087)
  The User API still is unstable and under discussion.

History:
v1 -> v2:
- Fixed dual assignment (asid now correctly propagated on TLB invalidations)
- Integrated fault reporting

Next Steps:
- Mature the user API with people involved in SVA work (KVM forum may be a
  good opportunity to meet)
- Submit the IOMMU cfg notifier changes and some VFIO changes separately, to
  progress independently on the kernel dependency

Eric Auger (28):
  hw/arm/smmu-common: Fix the name of the iommu memory regions
  hw/arm/smmuv3: fix eventq recording and IRQ triggerring
  update-linux-headers: Import iommu.h
  linux-headers: Partial header update
  memory: add IOMMU_ATTR_VFIO_NESTED IOMMU memory region attribute
  hw/arm/smmuv3: Implement get_attr API to report IOMMU_ATTR_VFIO_NESTED
  hw/vfio/common: Refactor container initialization
  hw/vfio/common: Force nested if iommu requires it
  memory: Introduce IOMMUIOLTBNotifier
  memory: rename memory_region notify_iommu, notify_one
  memory: Add IOMMUConfigNotifier
  memory: Add arch_id in IOTLBEntry
  hw/arm/smmuv3: Store s1ctrptr in translation config data
  hw/arm/smmuv3: Implement dummy replay
  hw/arm/smmuv3: Notify on config changes
  hw/arm/smmuv3: Fill the IOTLBEntry arch_id on NH_VA invalidation
  hw/vfio/common: Introduce vfio_alloc_guest_iommu helper
  hw/vfio/common: Introduce vfio_dma_(un)map_ram_section helpers
  hw/vfio/common: Register specific nested mode notifiers and
    memory_listener
  hw/vfio/common: Register MAP notifier for MSI binding
  target/arm/kvm: Notifies IOMMU on MSI stage 1 binding
  vfio/pci: Always set up MSI route before enabling vectors
  hw/arm/smmuv3: Remove warning about unsupported MAP notifiers
  memory: Introduce IOMMU_NOTIFIER_INIT_CFG IOMMU Config Notifier
  memory: Introduce IOMMU Memory Region inject_faults API
  hw/vfio/common: Handle fault_handler
  hw/arm/smmuv3: Init fault handling
  hw/arm/smmuv3: Implement fault injection

 exec.c                          |  12 +-
 hw/arm/smmu-common.c            |  12 +-
 hw/arm/smmuv3-internal.h        |  26 +-
 hw/arm/smmuv3.c                 | 189 +++++++--
 hw/i386/intel_iommu.c           |  16 +-
 hw/misc/tz-mpc.c                |   8 +-
 hw/ppc/spapr_iommu.c            |   2 +-
 hw/s390x/s390-pci-inst.c        |   4 +-
 hw/vfio/common.c                | 666 ++++++++++++++++++++++++--------
 hw/vfio/pci.c                   |   1 +
 hw/vfio/trace-events            |   4 +-
 hw/virtio/vhost.c               |  12 +-
 include/exec/memory.h           | 140 +++++--
 include/hw/arm/smmu-common.h    |   1 +
 include/hw/vfio/vfio-common.h   |   1 +
 linux-headers/linux/iommu.h     | 237 ++++++++++++
 linux-headers/linux/vfio.h      |  48 +++
 memory.c                        |  66 +++-
 scripts/update-linux-headers.sh |   2 +-
 target/arm/kvm.c                |  46 +--
 20 files changed, 1206 insertions(+), 287 deletions(-)
 create mode 100644 linux-headers/linux/iommu.h

-- 
2.17.1

