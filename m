Received: by 10.28.4.212 with SMTP id 203csp873447wme;
        Wed, 25 Apr 2018 07:17:33 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpE7Br8WbIpaN+w1do1W1GWQ3N4iPMXuvpaVnjK9JPf52H/5hotIpbA4VOq7H5aCpBtCMhr
X-Received: by 10.12.188.145 with SMTP id l17mr8165478qvg.228.1524665853187;
        Wed, 25 Apr 2018 07:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524665853; cv=none;
        d=google.com; s=arc-20160816;
        b=GFq1PEkLmVPwhpV5VBB7CnETD6HYUHZuG6ICa7dPGJWd1/qdGF1HbF1q+ztxD9I0SA
         i93Ytmsh2IneuIxHECapKOGqmIS6cMxWNYbvWnejy3W/Yf2IU0zrsb9U2ObV/ZMJnUZY
         M4PrKs8CCI6myu7yEvv57mDiADLvw79iuMEoLBSTQCuRd7YhIGdaIi+w1pbVSR0uLI0H
         4ZusVTyuNnC7P3OQ5fk4Xr7q14oFERU01Y/6S9Zav7ohuXp1QvVfQGfAQoppKtV5Xe3m
         H3uuHCkaBKrwf53Ylxzda9bQjHkCHG5ak6ggt/fUb80ldQubCBrkwp7ifAty7PDf9cbL
         w2Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=to9/ALyV3QeuugkyNQ6aMJp7y/0DGYdJ0P3LCnPZaNc=;
        b=BwNGW5S7BGIMhxz7LVhBwDA2VQA57MVGjBmMdqxwV+lkGtmvwAIpI7zVTbttceMTG7
         /ZpLNSugbZAqjceiJq1bsdG2uAu/dLHCLCLvXf/rGc1i5CiObTjnQsDiWzGeg96Hhahm
         hv8CUo1Gw0B5JAxxKkRgCH2/+eGLcD1OPIr89ge6qQ836aeMtiMcvEW+pej38qtTTx4Y
         BQQven1KnupKT+/ORNj+a/S064h7RoLvMxti+5Db2qCA1u9jPf+17S5YbgdntdVjIs0c
         aWKWkUhmZwXdbPKuQoatBgbF9V5HxCnCim30UFq/3+bpn55A2vzn4s7Zzq7xwWwjNaM7
         SVIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h63si8054783qkc.82.2018.04.25.07.17.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 07:17:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37171 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBLEi-0000p3-Jk
	for alex.bennee@linaro.org; Wed, 25 Apr 2018 10:17:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLDf-0000VD-7e
	for qemu-devel@nongnu.org; Wed, 25 Apr 2018 10:16:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLDd-0005n6-By
	for qemu-devel@nongnu.org; Wed, 25 Apr 2018 10:16:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43314 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fBLDW-0005h3-9q; Wed, 25 Apr 2018 10:16:18 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 554D4EB6E5;
	Wed, 25 Apr 2018 14:16:13 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A93C2023239;
	Wed, 25 Apr 2018 14:16:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Wed, 25 Apr 2018 16:15:45 +0200
Message-Id: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 25 Apr 2018 14:16:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 25 Apr 2018 14:16:13 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v12 00/17] ARM SMMUv3 Emulation Support
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SjquRVnnlGXv

This series implements the emulation code for ARM SMMUv3.

SMMUv3 gets instantiated by adding ",iommu=smmuv3" to the virt
machine option.

Only stage 1 and AArch64 PTW are supported. [1 - 14] bring the core
emulation code. [15, 16] bring optimizations and 17 brings the vhost
integration.

Important Note:
I added the last 3 patches for consistency but I would be happy
if [1 - 14] could land upstream first, without waiting for the last
3 patch additional review cycles.

Also note that for vhost integration testing I needed a fix on
kernel side: [PATCH] vhost: Fix vhost_copy_to_user(). Otherwise
vhost-net stalls are observed.

Best Regards

Eric

This series can be found at:
v12: https://github.com/eauger/qemu/tree/v2.12.0-SMMU-v12
Previous version at:
v11: https://github.com/eauger/qemu/tree/v2.12.0-rc2-SMMU-v11

History:
v11 -> v12:
core:
- leak fixes in kvm_arch_fixup_msi_route
- few changes in ptw to match get_phys_addr_lpae more closely
- some fixes in CD consistency checks
last 3 patches:
- remove mutex as BQL does the job
- change IOTLB key

v10 -> v11:
- one fix irq_ctrl_ack read
- addition of last 3 patches

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


Eric Auger (14):
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
  hw/arm/smmuv3: Cache/invalidate config data
  hw/arm/smmuv3: IOTLB emulation
  hw/arm/smmuv3: Add notifications on invalidation

Prem Mallappa (3):
  hw/arm/smmuv3: Skeleton
  hw/arm/virt: Add SMMUv3 to the virt board
  hw/arm/virt-acpi-build: Add smmuv3 node in IORT table

 default-configs/aarch64-softmmu.mak |    1 +
 hw/arm/Makefile.objs                |    1 +
 hw/arm/smmu-common.c                |  487 ++++++++++++
 hw/arm/smmu-internal.h              |   99 +++
 hw/arm/smmuv3-internal.h            |  621 +++++++++++++++
 hw/arm/smmuv3.c                     | 1497 +++++++++++++++++++++++++++++++++++
 hw/arm/trace-events                 |   58 ++
 hw/arm/virt-acpi-build.c            |   55 +-
 hw/arm/virt.c                       |  100 ++-
 include/hw/acpi/acpi-defs.h         |   15 +
 include/hw/arm/smmu-common.h        |  169 ++++
 include/hw/arm/smmuv3.h             |   87 ++
 include/hw/arm/virt.h               |   10 +
 target/arm/kvm.c                    |   38 +-
 target/arm/trace-events             |    3 +
 15 files changed, 3232 insertions(+), 9 deletions(-)
 create mode 100644 hw/arm/smmu-common.c
 create mode 100644 hw/arm/smmu-internal.h
 create mode 100644 hw/arm/smmuv3-internal.h
 create mode 100644 hw/arm/smmuv3.c
 create mode 100644 include/hw/arm/smmu-common.h
 create mode 100644 include/hw/arm/smmuv3.h

-- 
2.5.5

