Received: by 10.223.188.70 with SMTP id a6csp1284486wrh;
        Fri, 1 Sep 2017 10:21:50 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb542VB7JKLldRKfpB2fmN5viuaIXgRdfx4+XzsWPv4L9fZlviRV0xj2VIo/e/hGQqy+ek1C
X-Received: by 10.200.52.252 with SMTP id x57mr4133251qtb.40.1504286510687;
        Fri, 01 Sep 2017 10:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504286510; cv=none;
        d=google.com; s=arc-20160816;
        b=wZgHx+vMhUsK52zxh6Gpz9/O7fUy2D/fdtihzgeyBb+CKMUcPWlcIxu1zl+RFhZZRY
         6UsNpg8zdGootaLjoiyczUyz1FwM0yE8c1rNCLtDiotfImN7E0U63ptX1xb5Ofizk8HA
         MWXy+Y4+KQpdh2P7ugGVgbrMeUVW27HvLjZluZ0VzQRZXbND43RhZ3raGnv9H9a4GSyl
         9GBQMdEqMvFdudbO1aaEfPSxjOVkqBpMU2NsSM2ndaUpaDkrpo79vQ7roQXi0KuQ5clx
         L1Rgg+HrB+IwKrFvrU/PV3Tvwl93e43zBt0D98lkrsQ70EbY+ebN56Du+nwq5BFtXJuA
         n9ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=OShEdZ9s8A9F7A3Hsq9dnPP+AVlE0rg8sARWZ9KMNZo=;
        b=CAtWt9J5VSb96Wr6fKtIwAUDxgmKd8NFr/pL79rupG6tq5aBdf95rtKAE36rNV8lrj
         5/GfVnC4htDeTthagx7JoiVpydND2gQ8+67S1YI62tDpH1u3rbIgB51QRz1sMnKaeAU9
         CUKO+49zc3zT1hVy33zy/T3oOAi4CPLv5yWxOllp3V7GyELWMLeYF7kP3YRrgfdjmsH2
         xxJ88DSd9q9hXY6kguuGXtDVE1A2veaWkDIW5L34kd6Qn6m3cDykcajSPDjy5eMmI2rs
         t8wUJo+IFgI4Jks/pVarAWAqF3KI8LujfUllZ+ocLX3DNQkIrRKNNWqUO9tuMMMCPP6D
         uLsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c67si2062673qka.550.2017.09.01.10.21.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:21:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnpdc-0004aa-FU
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:21:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpdX-0004Z3-Qd
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:21:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpdT-0001iy-Ob
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:21:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50614)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpdT-0001i8-Gx; Fri, 01 Sep 2017 13:21:39 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D9CA8B13F;
	Fri,  1 Sep 2017 17:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1D9CA8B13F
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7FB7627DE;
	Fri,  1 Sep 2017 17:21:25 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:03 +0200
Message-Id: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 01 Sep 2017 17:21:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 00/20] ARM SMMUv3 Emulation Support
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cxGsI7/XZRsT

This series implements the emulation code for ARM SMMUv3.

Changes since v6:
- DPDK testpmd now running on guest with 2 assigned VFs
- Changed the instantiation method: add the following option to
  the QEMU command line
  -device smmuv3 # for virtio/vhost use cases
  -device smmuv3,caching-mode # for vfio use cases (based on [1])
- splitted the series into smaller patches to allow the review
- the VFIO integration based on "tlbi-on-map" smmuv3 driver
  is isolated from the rest: last 2 patches, not for upstream.
  This is shipped for testing/bench until a better solution is found.
- Reworked permission flag checks and event generation

testing:
- in dt and ACPI modes
- virtio-net-pci and vhost-net devices using dma ops with various
  guest page sizes [2]
- assigned VFs using dma ops [3]:
  - AMD Overdrive and igbvf passthrough (using gsi direct mapping)
  - Cavium ThunderX and ixgbevf passthrough (using KVM MSI routing)
- DPDK testpmd on guest running with VFIO user space drivers (2 igbvf) [3]
  with guest and host page size equal (4kB)

Known limitations:
- no VMSAv8-32 suport
- no nested stage support (S1 + S2)
- no support for HYP mappings
- register fine emulation, commands, interrupts and errors were
  not accurately tested. Handling is sufficient to run use cases
  described above though.
- interrupts and event generation not observed yet.

Best Regards

Eric

This series can be found at:
v7: https://github.com/eauger/qemu/tree/v2.10.0-SMMU-v7
Previous version at:
v6: https://github.com/eauger/qemu/tree/v2.10.0-rc2-SMMU-v6

References:
[1] [RFC v2 0/4] arm-smmu-v3 tlbi-on-map option
    https://lkml.org/lkml/2017/8/11/426

[2] qemu cmd line excerpt:
-device smmuv3 \
-netdev tap,id=tap0,script=no,downscript=no,ifname=tap0,vhost=off \
-device virtio-net-pci,netdev=tap0,mac=6a:f5:10:b1:3d:d2,iommu_platform,disable-modern=off,disable-legacy=on \
[3] use -device smmuv3,caching-mode


History:
v6 -> v7:
- see above

v5 -> v6:
- Rebase on 2.10 and IOMMUMemoryRegion
- add ACPI TLBI_ON_MAP support (VFIO integration also works in
  ACPI mode)
- fix block replay
- handle implementation defined SMMU_CMD_TLBI_NH_VA_AM cmd
  (goes along with TLBI_ON_MAP FW quirk)
- replay systematically unmap the whole range first
- smmuv3_map_hook does not unmap anymore and the unmap is done
  before the replay
- add and use smmuv3_context_device_invalidate instead of
  blindly replaying everything

v4 -> v5:
- initial_level now part of SMMUTransCfg
- smmu_page_walk_64 takes into account the max input size
- implement sys->iommu_ops.replay and sys->iommu_ops.notify_flag_changed
- smmuv3_translate: bug fix: don't walk on bypass
- smmu_update_qreg: fix PROD index update
- I did not yet address Peter's comments as the code is not mature enough
  to be split into sub patches.

v3 -> v4 [Eric]:
- page table walk rewritten to allow scan of the page table within a
  range of IOVA. This prepares for VFIO integration and replay.
- configuration parsing partially reworked.
- do not advertise unsupported/untested features: S2, S1 + S2, HYP,
  PRI, ATS, ..
- added ACPI table generation
- migrated to dynamic traces
- mingw compilation fix

v2 -> v3 [Eric]:
- rebased on 2.9
- mostly code and patch reorganization to ease the review process
- optional patches removed. They may be handled separately. I am currently
  working on ACPI enablement.
- optional instantiation of the smmu in mach-virt
- removed [2/9] (fdt functions) since not mandated
- start splitting main patch into base and derived object
- no new function feature added

v1 -> v2 [Prem]:
- Adopted review comments from Eric Auger
        - Make SMMU_DPRINTF to internally call qemu_log
            (since translation requests are too many, we need control
             on the type of log we want)
        - SMMUTransCfg modified to suite simplicity
        - Change RegInfo to uint64 register array
        - Code cleanup
        - Test cleanups
- Reshuffled patches

v0 -> v1 [Prem]:
- As per SMMUv3 spec 16.0 (only is_ste_consistant() is noticeable)
- Reworked register access/update logic
- Factored out translation code for
        - single point bug fix
        - sharing/removal in future
- (optional) Unit tests added, with PCI test device
        - S1 with 4k/64k, S1+S2 with 4k/64k
        - (S1 or S2) only can be verified by Linux 4.7 driver
        - (optional) Priliminary ACPI support

v0 [Prem]:
- Implements SMMUv3 spec 11.0
- Supported for PCIe devices,
- Command Queue and Event Queue supported
- LPAE only, S1 is supported and Tested, S2 not tested
- BE mode Translation not supported
- IRQ support (legacy, no MSI)

Eric Auger (18):
  hw/arm/smmu-common: smmu base device and datatypes
  hw/arm/smmu-common: IOMMU memory region and address space setup
  hw/arm/smmu-common: smmu_read/write_sysmem
  hw/arm/smmu-common: VMSAv8-64 page table walk
  hw/arm/smmuv3: Wired IRQ and GERROR helpers
  hw/arm/smmuv3: Queue helpers
  hw/arm/smmuv3: Implement MMIO write operations
  hw/arm/smmuv3: Event queue recording helper
  hw/arm/smmuv3: Implement translate callback
  target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
  hw/arm/smmuv3: Implement data structure and TLB invalidation
    notifications
  hw/arm/smmuv3: Implement IOMMU memory region replay callback
  hw/arm/virt: Store the PCI host controller dt phandle
  hw/arm/sysbus-fdt: Pass the VirtMachineState to the node creation
    functions
  hw/arm/sysbus-fdt: Pass the platform bus base address in
    PlatformBusFDTData
  hw/arm/sysbus-fdt: Allow smmuv3 dynamic instantiation
  hw/arm/smmuv3: [not for upstream] add SMMU_CMD_TLBI_NH_VA_AM handling
  hw/arm/smmuv3: [not for upstream] Add caching-mode option

Prem Mallappa (2):
  hw/arm/smmuv3: Skeleton
  hw/arm/virt-acpi-build: Add smmuv3 node in IORT table

 default-configs/aarch64-softmmu.mak |    1 +
 hw/arm/Makefile.objs                |    1 +
 hw/arm/smmu-common.c                |  527 ++++++++++++++++
 hw/arm/smmu-internal.h              |  105 ++++
 hw/arm/smmuv3-internal.h            |  584 +++++++++++++++++
 hw/arm/smmuv3.c                     | 1181 +++++++++++++++++++++++++++++++++++
 hw/arm/sysbus-fdt.c                 |  129 +++-
 hw/arm/trace-events                 |   48 ++
 hw/arm/virt-acpi-build.c            |   63 +-
 hw/arm/virt.c                       |    6 +-
 include/hw/acpi/acpi-defs.h         |   15 +
 include/hw/arm/smmu-common.h        |  123 ++++
 include/hw/arm/smmuv3.h             |   80 +++
 include/hw/arm/sysbus-fdt.h         |    2 +
 include/hw/arm/virt.h               |   15 +
 target/arm/kvm.c                    |   27 +
 target/arm/trace-events             |    3 +
 17 files changed, 2886 insertions(+), 24 deletions(-)
 create mode 100644 hw/arm/smmu-common.c
 create mode 100644 hw/arm/smmu-internal.h
 create mode 100644 hw/arm/smmuv3-internal.h
 create mode 100644 hw/arm/smmuv3.c
 create mode 100644 include/hw/arm/smmu-common.h
 create mode 100644 include/hw/arm/smmuv3.h

-- 
2.5.5

