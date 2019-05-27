Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6307368wrg;
        Mon, 27 May 2019 04:42:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzSZeMC0FusjlGqeWFN0UfoqoSthjY8hwYF4Xz2n2qAaPABOQY6wWIYI22Df9SFFmuk5mIq
X-Received: by 2002:a0c:8767:: with SMTP id 36mr34587537qvi.28.1558957366172;
        Mon, 27 May 2019 04:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558957366; cv=none;
        d=google.com; s=arc-20160816;
        b=YnwIYKf98GD/VsjxHXoYXCXfJye2YA6kDkcUXA3+pd/eoGVa2Uav3TghVQlu6d8lA8
         qi2JuE+ODOihJP/6vGNQAW/yQugGW7cViI1bDuQ64IiUqE5HPXNzPOno6KdFmr+pwYSc
         WxsvX/IRsVRn6zGLrKHGa8yw7dlCp+c9cOg0Yulst/Z2fjX7XlES7QFy5GRUaE3akNKt
         nO3olX1dT8bi035yyE2VV9kfAsNFGkq6t4hRZ2RugCeJuSVsYbjHW0Ro54RQYU9wgk6g
         SDZK0zxSpmzod1O+EfnXoQMHuwXwpAOR+m+BVfuMr61DFoHewJLVv1Xtzd8RwZDhTAgG
         9IZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=RPLeSuVcFko17r6HNpAkQy4V7kOj95tDYX9s+wvUHVg=;
        b=LjCbV4zbkSiqKY2JSlx0/zfzqwVe5E/Z2hhu+cACmlRcbQjmE0pkwS1C92+d8eFAMk
         o8bc7z4NeTNNYZDKLToIAl/CQaTzlC9j3l/i+3vaRpzKjgAodZF2nmxINC4xgItgpnOr
         fe4jhS/ZfNzPK9pTbecguWibOC76iWvUApiHyQ5jnZPkccYQgZBQzsn5+7K70C16L2bD
         jJl7p6+JyjyAMJVw9FYME2wUs3Jd4l+E21judXbGKSM7BXQgzyLgFgttqWpTrP5IJk8t
         Sid5tFf1PTZBm9pwIxki+Jr+6azMFJzbTUPNj3K2tE6W2G5quUDCKbkMNDN8BAEW3jUh
         tHCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n48si2041869qvn.218.2019.05.27.04.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 04:42:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43987 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVE1d-0002tU-Mc
	for alex.bennee@linaro.org; Mon, 27 May 2019 07:42:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE1S-0002tO-JY
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:42:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE1R-0002wd-47
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:42:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49046)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE1Q-0002vc-Tk; Mon, 27 May 2019 07:42:33 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CB5EC058CA8;
	Mon, 27 May 2019 11:42:25 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 370345D962;
	Mon, 27 May 2019 11:42:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:36 +0200
Message-Id: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 27 May 2019 11:42:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 00/27] vSMMUv3/pSMMUv3 2 stage VFIO integration
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XtqyeH7Xw7Ri

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

Note: The first patch is a code cleanup and was sent separately.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v4.0.0-2stage-rfcv4

Compatible with kernel series:
[PATCH v8 00/29] SMMUv3 Nested Stage Setup
(https://lkml.org/lkml/2019/5/26/95)

History:
v3 -> v4:
- adapt to changes in uapi (asid cache invalidation)
- check VFIO_PCI_DMA_FAULT_IRQ_INDEX is supported at kernel level
  before attempting to set signaling for it.
- sync on 5.2-rc1 kernel headers + Drew's patch that imports sve_context.=
h
- fix MSI binding for MSI (not MSIX)
- fix mingw compilation

v2 -> v3:
- rework fault handling
- MSI binding registration done in vfio-pci. MSI binding tear down called
  on container cleanup path
- leaf parameter propagated

v1 -> v2:
- Fixed dual assignment (asid now correctly propagated on TLB invalidatio=
ns)
- Integrated fault reporting


Andrew Jones (1):
  update-linux-headers: Add sve_context.h to asm-arm64

Eric Auger (26):
  vfio/common: Introduce vfio_set_irq_signaling helper
  update-linux-headers: Import iommu.h
  header update against 5.2.0-rc1 and IOMMU/VFIO nested stage APIs
  memory: add IOMMU_ATTR_VFIO_NESTED IOMMU memory region attribute
  memory: add IOMMU_ATTR_MSI_TRANSLATE IOMMU memory region attribute
  hw/arm/smmuv3: Advertise VFIO_NESTED and MSI_TRANSLATE attributes
  hw/vfio/common: Force nested if iommu requires it
  memory: Prepare for different kinds of IOMMU MR notifiers
  memory: Add IOMMUConfigNotifier
  memory: Add arch_id and leaf fields in IOTLBEntry
  hw/arm/smmuv3: Store the PASID table GPA in the translation config
  hw/arm/smmuv3: Implement dummy replay
  hw/arm/smmuv3: Fill the IOTLBEntry arch_id on NH_VA invalidation
  hw/arm/smmuv3: Fill the IOTLBEntry leaf field on NH_VA invalidation
  hw/arm/smmuv3: Notify on config changes
  hw/vfio/common: Introduce vfio_alloc_guest_iommu helper
  hw/vfio/common: Introduce hostwin_from_range helper
  hw/vfio/common: Introduce helpers to DMA map/unmap a RAM section
  hw/vfio/common: Setup nested stage mappings
  hw/vfio/common: Register a MAP notifier for MSI binding
  vfio-pci: Expose MSI stage 1 bindings to the host
  memory: Introduce IOMMU Memory Region inject_faults API
  hw/arm/smmuv3: Implement fault injection
  vfio-pci: register handler for iommu fault
  vfio-pci: Set up fault regions
  vfio-pci: Implement the DMA fault handler

 exec.c                          |  12 +-
 hw/arm/smmu-common.c            |  10 +-
 hw/arm/smmuv3.c                 | 198 +++++++++--
 hw/arm/trace-events             |   3 +-
 hw/i386/amd_iommu.c             |   2 +-
 hw/i386/intel_iommu.c           |  25 +-
 hw/misc/tz-mpc.c                |   8 +-
 hw/ppc/spapr_iommu.c            |   2 +-
 hw/s390x/s390-pci-inst.c        |   4 +-
 hw/vfio/common.c                | 572 ++++++++++++++++++++++++++------
 hw/vfio/pci.c                   | 471 ++++++++++++++++----------
 hw/vfio/pci.h                   |   4 +
 hw/vfio/platform.c              |  54 ++-
 hw/vfio/trace-events            |   8 +-
 hw/virtio/vhost.c               |  14 +-
 include/exec/memory.h           | 158 +++++++--
 include/hw/arm/smmu-common.h    |   1 +
 include/hw/vfio/vfio-common.h   |  10 +
 linux-headers/linux/iommu.h     | 280 ++++++++++++++++
 linux-headers/linux/vfio.h      | 107 ++++++
 memory.c                        |  67 +++-
 scripts/update-linux-headers.sh |   5 +-
 22 files changed, 1593 insertions(+), 422 deletions(-)
 create mode 100644 linux-headers/linux/iommu.h

--=20
2.20.1

