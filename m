Received: by 10.28.71.27 with SMTP id u27csp2116341wma;
        Sat, 17 Feb 2018 11:30:45 -0800 (PST)
X-Google-Smtp-Source: AH8x224amsYZu6diNsU0AtpRCZU+pVbTbOxHpaBabqXlRteDfL548glKgw8ExbVQlZvpsiRr93wS
X-Received: by 10.129.239.14 with SMTP id o14mr7652171ywm.193.1518895845773;
        Sat, 17 Feb 2018 11:30:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518895845; cv=none;
        d=google.com; s=arc-20160816;
        b=Fn/dvShQfj8O7eEC3jFEoGhxz9Mw8UPYzy2/zJgeyMxaVVX5+dB6jLjIi8QkA2WVuv
         EpANIqEzcMN8g9faFia9Zh8ZiQLPuVLJA6erMK7jR9aPqw19CSdk/4jty5x/iD4dFlbg
         nCxSR3eKyhqcGd8OgbXG8MsO35bogf4EKsWcOijh5CWqJciHfvYh+tG6+x85Axmq4GTB
         5FS58yCEhCq6IXYRZCvC+pQFvWGV8uXk4gJg6p8l+X9n5k2v7RijTLNTvpkR7NsPICgw
         c6t/tEP5OkUcJjYFDMaGgPzrYdJ/sKpncEPppcRDmHlV0OIi1gDX+CA9unMd3/gS4QE1
         YzAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=logTv/tVrVFq68X85F9gJjxmN7QSfmXLxaN99fXMnyQ=;
        b=OXLoezVVQWfyICCI5R2HhO8ec+DP9LhWzikId1Y1Ug/0qZNa5zgdAly/dvgAAkrwBa
         6mwR2ThcFguUkFu/WNBP/q9eONht6ZKhFZOibN+710OTyTkx/v6nAzdHdsEd0v8QNuh3
         bnv+bFdo7PqWold5vo6YxM0OPIup1QG2UN6vSYJKrNSG4aNnF8E/od9zOOJd5xUpieK4
         PUPTT5LNqTV9PVpMxm5zT3BOwVPQwm15JhltNL7BJzNgPR/gYhslwFYTbbHnpJiVlfA3
         efZbqAdzOETKposeh1hi7UVcBcOGegI/z4J+CndFWjA/h63S0N3cxL/UA5CYxsAMt9lJ
         PckA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s185si941615ywg.364.2018.02.17.11.30.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:30:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en8C5-0001PI-4i
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:30:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1en7W0-0003Ft-0T
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:47:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1en7Vv-0000QJ-8i
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:47:16 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36072 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1en7Vv-0000Lz-36; Sat, 17 Feb 2018 13:47:11 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C81FEAE83;
	Sat, 17 Feb 2018 18:47:06 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DEE8D2024CA2;
	Sat, 17 Feb 2018 18:46:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Sat, 17 Feb 2018 19:46:42 +0100
Message-Id: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Sat, 17 Feb 2018 18:47:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Sat, 17 Feb 2018 18:47:06 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v9 00/14] ARM SMMUv3 Emulation Support
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
Cc: mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OkmJHRikPutP

This series implements the emulation code for ARM SMMUv3.

SMMUv3 gets instantiated by adding ",iommu=smmuv3" to the virt
machine option.

VHOST integration will be handled in a separate series. VFIO
integration is not targeted at the moment. Only stage 1 and
AArch64 PTW are supported.

Main changes since v8:
- fix mingw compilation (qemu/log.h)
- put gpl v2 license on all files to respect initial license
- change proto of smmu_ptw* to clarify inputs/outputs and
  prepare for iotlb emulation
- fix hash table lookup
- cleanup access type handling during ptw
- cleanup reset infra (parent_reset)
- replace some inline functions by macros
- fix some CMD fields
- increment cmdq cons only after cmd execution
- replace some remaining error_report by qemu_log_mask

Best Regards

Eric

This series can be found at:
v9: https://github.com/eauger/qemu/tree/v2.11.0-SMMU-v9
Previous version at:
v8: https://github.com/eauger/qemu/tree/v2.11.0-SMMU-v8

History:

v8 -> v9:
- see above description

v7 -> v8:
Took into account Peter's comments:
- revisit queue data structures
- use registerfields.h and got rid of reg array
- use dma_memory_read for all descriptor fetches
- got rid of page table walk for an iova range and
  implemented standard page table walk for single IOVA
- revisit event data structure
- report events in many more situations and pass the event
  handle all along the decode and ptw phases
- fix gerror/gerron computations
- completely got rid of stage2 decoding
- use a machine option for instantiation
- get rid of VFIO integration
- get rid of VHOST integration (this will be added in a
- abort in case vhost/vfio notifiers get detected
  second step together with TLB emulation)
- Tested migration
- fixed TTBR index computation (issue reported by Tomasz)

v6 -> v7:
- DPDK testpmd now running on guest with 2 assigned VFs
- Changed the instantiation method: add the following option to
  the QEMU command line
  -device smmu # for virtio/vhost use cases
  -device smmu,caching-mode # for vfio use cases (based on [1])
- splitted the series into smaller patches to allow the review
- the VFIO integration based on "ltlbi-on-map" smmuv3 driver
  is isolated from the rest: last 2 patches, not for upstream.
  This is shipped for testing/bench until a better solution is found.
- Reworked permission flag checks and event generation

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
- Tested with DPDK and e1000


Eric Auger (11):
  hw/arm/smmu-common: smmu base device and datatypes
  hw/arm/smmu-common: IOMMU memory region and address space setup
  hw/arm/smmu-common: VMSAv8-64 page table walk
  hw/arm/smmuv3: Wired IRQ and GERROR helpers
  hw/arm/smmuv3: Queue helpers
  hw/arm/smmuv3: Implement MMIO write operations
  hw/arm/smmuv3: Event queue recording helper
  hw/arm/smmuv3: Implement translate callback
  hw/arm/smmuv3: Abort on vfio or vhost case
  target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
  hw/arm/virt: Handle iommu in 2.12 machine type

Prem Mallappa (3):
  hw/arm/smmuv3: Skeleton
  hw/arm/virt: Add SMMUv3 to the virt board
  hw/arm/virt-acpi-build: Add smmuv3 node in IORT table

 default-configs/aarch64-softmmu.mak |    1 +
 hw/arm/Makefile.objs                |    1 +
 hw/arm/smmu-common.c                |  371 ++++++++++++
 hw/arm/smmu-internal.h              |   96 +++
 hw/arm/smmuv3-internal.h            |  611 +++++++++++++++++++
 hw/arm/smmuv3.c                     | 1118 +++++++++++++++++++++++++++++++++++
 hw/arm/trace-events                 |   36 ++
 hw/arm/virt-acpi-build.c            |   56 +-
 hw/arm/virt.c                       |  109 +++-
 include/hw/acpi/acpi-defs.h         |   15 +
 include/hw/arm/smmu-common.h        |  136 +++++
 include/hw/arm/smmuv3.h             |   91 +++
 include/hw/arm/virt.h               |   11 +
 target/arm/kvm.c                    |   27 +
 target/arm/trace-events             |    3 +
 15 files changed, 2674 insertions(+), 8 deletions(-)
 create mode 100644 hw/arm/smmu-common.c
 create mode 100644 hw/arm/smmu-internal.h
 create mode 100644 hw/arm/smmuv3-internal.h
 create mode 100644 hw/arm/smmuv3.c
 create mode 100644 include/hw/arm/smmu-common.h
 create mode 100644 include/hw/arm/smmuv3.h

-- 
2.5.5

