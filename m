Received: by 10.28.91.67 with SMTP id p64csp3776482wmb;
        Tue, 20 Mar 2018 05:38:12 -0700 (PDT)
X-Google-Smtp-Source: AG47ELu3fYhH9zTW6GL94ia6UlirNkgriiH+nOX+Oe2+8QT6QnjpKn7XtY3FoYjhX1jywmBmXi8H
X-Received: by 2002:a25:5d07:: with SMTP id r7-v6mr8834888ybb.482.1521549492680;
        Tue, 20 Mar 2018 05:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521549492; cv=none;
        d=google.com; s=arc-20160816;
        b=Ly79BOijPSweJViq5ba6KUkstTx0NHibvhOFby3UxpkVATdAkSPQz09SixoSRGXMae
         UPpri2IvsYHpU6eDm9BunGmcV99HR61yS2s0v3eA8axG6Q5iqgD520x7Kn+3L5PVyNRD
         fjthJ+i3xdRgW8nfbg4T1yskhydA6FItjiR7zR5uYRLw8PAX6A7y+vVi2uHINuF+lzzW
         6TZGCGtntWuBGzwMEiZiedsIT8yGoS+xTbBUw9OqKEl1Z4t+sIXLj8o/m3wcPoXE2Z6J
         v+m6TRxAwxLB4i7D9WVt1WBSqZrQ8nOLe8365vagGpd9tgiIHiPGt9p0ZR04QqUSV6Ve
         Dk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=IzJVRnwxTB/aLvqTz+z0XjQ4JKiXJHMhMPcFiM6a3YU=;
        b=YmM0FjA791imtyFg+z8rzXq9Qeou5F6n7JBoiqaa82lthdJBhIBh7oM6GiNu0X+jMx
         8oC5iIvBDCUAWM363YhjYPVl5HeyLyRRMxP4/ro1ZaUak6yW6YPE6/sx/G11nU4FmXlN
         roURbjGGbmajTbL2YYPn5nlMefBPEi/dCAxGg12/yYmbAEDnLZMdZImZvZ1m+iTJH0V1
         tBbOH7YYb0cezwu11loDcYaduoX9QtUTAOE0mVVirlYdVB93T2u7p0VoqcQ4qkAaKpEh
         BabDHIcU2F8yhqp3ev7t6TkNavuXkvHWQfvpSBJWrIaHpRfCCwRCPF08GufojG53dG7P
         Fqcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m43si1996268qtf.249.2018.03.20.05.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 05:38:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48194 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyGWq-00077B-2g
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 08:38:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGWa-000748-00
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:37:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGWV-0002qY-Gp
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:37:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43354 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eyGWV-0002pj-B2; Tue, 20 Mar 2018 08:37:51 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB793EB71E;
	Tue, 20 Mar 2018 12:37:50 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 210AD76FB;
	Tue, 20 Mar 2018 12:37:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Tue, 20 Mar 2018 13:37:22 +0100
Message-Id: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 20 Mar 2018 12:37:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 20 Mar 2018 12:37:50 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v10 00/14] ARM SMMUv3 Emulation Support
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wHuO8z+oI40c

This series implements the emulation code for ARM SMMUv3.

SMMUv3 gets instantiated by adding ",iommu=smmuv3" to the virt
machine option.

VHOST integration will be handled in a separate series. VFIO
integration is not targeted at the moment. Only stage 1 and
AArch64 PTW are supported.

Main changes since v9:
- addressed Peter's comments

Best Regards

Eric

This series can be found at:
v10: https://github.com/eauger/qemu/tree/v2.11.0-SMMU-v10
Previous version at:
v9: https://github.com/eauger/qemu/tree/v2.11.0-SMMU-v9

History:

v9 -> v10:
- see individual change logs

v8 -> v9:
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
  hw/arm/virt: Introduce the iommu option

Prem Mallappa (3):
  hw/arm/smmuv3: Skeleton
  hw/arm/virt: Add SMMUv3 to the virt board
  hw/arm/virt-acpi-build: Add smmuv3 node in IORT table

 default-configs/aarch64-softmmu.mak |    1 +
 hw/arm/Makefile.objs                |    1 +
 hw/arm/smmu-common.c                |  364 +++++++++++
 hw/arm/smmu-internal.h              |  102 +++
 hw/arm/smmuv3-internal.h            |  609 ++++++++++++++++++
 hw/arm/smmuv3.c                     | 1195 +++++++++++++++++++++++++++++++++++
 hw/arm/trace-events                 |   37 ++
 hw/arm/virt-acpi-build.c            |   55 +-
 hw/arm/virt.c                       |  100 ++-
 include/hw/acpi/acpi-defs.h         |   15 +
 include/hw/arm/smmu-common.h        |  146 +++++
 include/hw/arm/smmuv3.h             |   88 +++
 include/hw/arm/virt.h               |   10 +
 target/arm/kvm.c                    |   27 +
 target/arm/trace-events             |    3 +
 15 files changed, 2745 insertions(+), 8 deletions(-)
 create mode 100644 hw/arm/smmu-common.c
 create mode 100644 hw/arm/smmu-internal.h
 create mode 100644 hw/arm/smmuv3-internal.h
 create mode 100644 hw/arm/smmuv3.c
 create mode 100644 include/hw/arm/smmu-common.h
 create mode 100644 include/hw/arm/smmuv3.h

-- 
2.5.5

