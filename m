Received: by 10.25.44.15 with SMTP id s15csp2622184lfs;
        Sun, 9 Jul 2017 13:52:06 -0700 (PDT)
X-Received: by 10.237.63.141 with SMTP id s13mr672829qth.61.1499633526071;
        Sun, 09 Jul 2017 13:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499633526; cv=none;
        d=google.com; s=arc-20160816;
        b=hf4zLe7I48CY9RWhOts0A1CZKqIihBOeLbtYArJilHl+mp7BTEoBjCGNELcXKqvbe+
         Y5EK0y/csod9liQH4YuY856TTxrsixqkxcbj3FmVimrA3u/sA/lt/1JWvUi3Zs59dn8e
         VGqxnFHL2GZ2SJyQzf5HHvBmkcQdubpymwqCP/difyEmXgoYqb00Q8ZuQ0t3UrkCbjL2
         lIVukO/Pik19DI/tGcd6XdQ39f54BSnymdKjMYJuSh/tA5GKkP60ZBe06ZvbMjI529U6
         j/594WKY1GDTPoRGak5GlcURf2vYfAcpeVd+aqVEwt3vfrR4HujCqmGfyC2QYJPiKykB
         E/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=xCN9lyTTyrsqJi8m/XEfWLBRwVZhqXyE04+Y+3nyuXo=;
        b=YF5a8ZRG681IH/rQT0XdQjfK2wDmSytvCMGIM54rBtUfj9NqA/qgw4Q5la1hCJzxR/
         0OL/iPOMAKuFndiJvhY9p0bBMz+b2fAIgMUi3KiXTXIvUcGoEsmwHedjZvbzHf9gG+nd
         L3a7CCDjC/i3OeUfjhepPjb0znL765qRg5dJ91uH9NLeiV6OWiIf0cGt5XxMkRJmMuWq
         zWrFSrAySblJqE+ao+gNwWcGiGylpXPRMpBezew5296yeVg5QrVJ4hdCfgCJaPlWzw2O
         obDRz1hRMNRa/1FLEPpqOI6Pq/zufCf6C2kW915yKorTDzyXb1x/ETcutlZVNgfISYSZ
         /D7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id b82si2488722qkh.366.2017.07.09.13.52.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Jul 2017 13:52:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUJBT-0001aL-Dn
	for alex.bennee@linaro.org; Sun, 09 Jul 2017 16:52:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJBP-0001Yv-09
	for qemu-arm@nongnu.org; Sun, 09 Jul 2017 16:52:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dUJBL-0005jG-Tv
	for qemu-arm@nongnu.org; Sun, 09 Jul 2017 16:51:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48066)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dUJBL-0005iw-KH; Sun, 09 Jul 2017 16:51:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52243285B6;
	Sun,  9 Jul 2017 20:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 52243285B6
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 52243285B6
Received: from localhost.localdomain.com (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E96A617DC6;
	Sun,  9 Jul 2017 20:51:39 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	prem.mallappa@gmail.com
Date: Sun,  9 Jul 2017 22:51:25 +0200
Message-Id: <1499633493-19865-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Sun, 09 Jul 2017 20:51:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 0/8] ARM SMMUv3 Emulation Support
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
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oxUinak3btbr

This series implements the emulation code for ARM SMMUv3.
This is the continuation of Prem's work [1].

This v5 mainly brings VFIO integration in DT mode. On guest kernel
side, this requires a quirk [1] to force TLB invalidation on map.

The following changes also are noticeable:
- fix SMMU_CMDQ_CONS offset
- adds dma-coherent dt property which fixes the unhandled command
  opcode bug.
- implements block PTE

The smmu is instantiated when passing the smmu option to machvirt:
"-M virt-2.10,smmu"

As I haven't split the code yet so that it can be easily reviewable
I don't expect deep reviews at this stage. Also the implementation may
be largely sub-optimal.

Tested Use Cases:
- booted a guest in dt and acpi mode with an iommu_platform
  virtio-net-pci device (using dma ops). Tested with the following
  guest combinations: 4K page - 39 bit VA, 4K - 48b, 64K - 39b,
  64K - 48b.
- booted a guest (featuring [1]) with PCIe passthrough'ed PCIe devices:
  - AMD Overdrive and igbvf passthrough (using gsi direct mapping)
  - Cavium ThunderX and ixgbevf passthrough (using KVM MSI routing)

Unfortunately I have not been able to run DPDK testpmd yet on guest side.
The problem I see is the user space driver dma-maps a huge area
and this causes plenty of CMDQ_OP_TLBI_NH_VA commands to be sent
(tlbi-on-map) which are sent for each page whereas the dma-map covers a
huge page. I will work on this issue for next version.

Known limitations:
- no VMSAv8-32 suport
- no nested stage support (S1 + S2)
- no support for HYP mappings
- register fine emulation, commands, interrupts and errors were
  not accurately tested. Handling is sufficient to run use cases
  described hereafter though.

Best Regards

Eric

This series can be found at:
v5: https://github.com/eauger/qemu/tree/v2.9-SMMU-v5
v4: https://github.com/eauger/qemu/tree/v2.9-SMMU-v4

References:
[1] [RFC 0/2] arm-smmu-v3 tlbi-on-map option
[2] Prem's last iteration:
- https://lists.gnu.org/archive/html/qemu-devel/2016-08/msg03531.html

History:
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
- Tested with DPDK and e1000


Eric Auger (5):
  hw/arm/smmu-common: smmu base class
  hw/arm/virt: Add 2.10 machine type
  hw/arm/virt: Add tlbi-on-map property to the smmuv3 node
  target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
  hw/arm/smmuv3: VFIO integration

Prem Mallappa (3):
  hw/arm/smmuv3: smmuv3 emulation model
  hw/arm/virt: Add SMMUv3 to the virt board
  hw/arm/virt-acpi-build: Add smmuv3 node in IORT table

 default-configs/aarch64-softmmu.mak |    1 +
 hw/arm/Makefile.objs                |    1 +
 hw/arm/smmu-common.c                |  474 +++++++++++++
 hw/arm/smmu-internal.h              |   89 +++
 hw/arm/smmuv3-internal.h            |  651 ++++++++++++++++++
 hw/arm/smmuv3.c                     | 1256 +++++++++++++++++++++++++++++++++++
 hw/arm/trace-events                 |   54 ++
 hw/arm/virt-acpi-build.c            |   56 +-
 hw/arm/virt.c                       |  111 +++-
 include/hw/acpi/acpi-defs.h         |   15 +
 include/hw/arm/smmu-common.h        |  127 ++++
 include/hw/arm/smmuv3.h             |   87 +++
 include/hw/arm/virt.h               |    5 +
 target/arm/kvm.c                    |   28 +
 target/arm/trace-events             |    3 +
 15 files changed, 2949 insertions(+), 9 deletions(-)
 create mode 100644 hw/arm/smmu-common.c
 create mode 100644 hw/arm/smmu-internal.h
 create mode 100644 hw/arm/smmuv3-internal.h
 create mode 100644 hw/arm/smmuv3.c
 create mode 100644 include/hw/arm/smmu-common.h
 create mode 100644 include/hw/arm/smmuv3.h

-- 
2.5.5

