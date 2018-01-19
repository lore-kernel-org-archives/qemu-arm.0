Received: by 10.28.71.27 with SMTP id u27csp827370wma;
        Fri, 19 Jan 2018 06:50:07 -0800 (PST)
X-Google-Smtp-Source: ACJfBoudq4l3El1L/prfEqlT02uC5RHwpgRexu97LGZCZ5ts6xvC/MgDLZsuWFrFZJkPfDpHGy96
X-Received: by 10.129.159.199 with SMTP id w190mr10171344ywg.302.1516373407512;
        Fri, 19 Jan 2018 06:50:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516373407; cv=none;
        d=google.com; s=arc-20160816;
        b=BGe1YlphkWHmzwFiEuiPIVqq7vRBPJevLkhkwXkyNiE+xDei7dCMpgTWenUA0Oc4xJ
         a/DUWRA2NcpNsxWaJTcoOfTpJI78j1JAXo5xdbImJUW58AJlbo4yO8ODdW6RpW0Wnh6w
         yZZca83TgGZuuPfaLuCQGcFxE0SIgleBEO8MIWyXqhtds4siOvE5RtDj+qQ42/JjCEdr
         ziJuOJd1kMulOdOo8FG5HBkfCVzB0y5siUy7zUdv/v2ZHblleH6ppKXc+wSc/QgEgR5P
         UdHeEhDZNhFqMVPbYU1dinLr3cmUYDdcKICzOGrRltCtjUlgoWdYb+5JI48b1QiZ6GFT
         dQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=l3RSEuFHtnxoffp+sAQu7URu+l/MWscqShoU3hZ3+C4=;
        b=Pyuj2WUXuiaO0BB7BFLFHl6nOj/PNhiHIPpNrlmurogjkMZ8TpqerP4mzrjcfxGD7Q
         uRpZm98tdB6spDjdNPUzQcGh6S86E/8P0EvuAjJNToSsPLj/W9UxdqRitP5nml3U3VO5
         Q3VPL8oQSHJ7BvijytFSrvqPu+8hW5xPiwUcys4cx97UohRmONpywHa8u94WBpXUfUYx
         uHbl3ZIiGxO7ljTXbA0iFfC39gGcmFz8sgQ9Y+3StSFiohfMTsXgZPDfgsRhU9GFYUtm
         3d5db52+RMGhn/K9ui4RJRq2ej6oHG+84kX05Ax+ayZpQOxEpHJ7b/m0NTN/xOEnJeLQ
         y6cg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l17si645978ybl.191.2018.01.19.06.50.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 06:50:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecXza-0004GV-UN
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 09:50:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecXzK-0004Cf-06
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:49:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecXzG-00063p-0R
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:49:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58492)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecXzF-00063R-NB; Fri, 19 Jan 2018 09:49:45 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 772DDC0586A0;
	Fri, 19 Jan 2018 14:49:44 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5FCD25C885;
	Fri, 19 Jan 2018 14:49:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:48:53 +0000
Message-Id: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 19 Jan 2018 14:49:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 00/22] VIRTIO-IOMMU device
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wx4riT32jaEJ

This series implements the virtio-iommu device.

This v5 is an upgrade to v0.5 spec [1].

Compared to v4:
- event queue and fault reporting
- we now return the IOAPIC MSI region if the virtio-iommu is instantiated
  in a PC machine.
- we bypass transactions on MSI HW region and fault on reserved ones.
- We support ACPI boot with mach-virt (based on IORT proposal)
- We moved to the new driver naming conventions
- simplified mach-virt instantiation
- worked around the disappearing of pci_find_primary_bus

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v2.11.0-virtio-iommu-v5

References:
[1] [RFC] virtio-iommu version 0.5
git://linux-arm.org/virtio-iommu.git viommu/v0.5

[2] guest branch featuring the virtio-iommu driver v0.5
git://linux-arm.org/linux-jpb.git virtio-iommu/v0.5.1

Testing:
- tested with guest using virtio-pci-net and virtio-blk-pci
  (,vhost=off,iommu_platform,disable-modern=off,disable-legacy=on)
- virtio-blk-pci uses irqfd: with GICv3, use
  "target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route"
  available on my branch
- VFIO support will be brought by a separate series
- on x86 is hacked guest kernel (available on demand)

History:
v4 -> v5:
- new functionalities reported above + below fixes:
- in virtio_iommu_translate, check the dev->as is not NULL
- initialize as->device_list in virtio_iommu_get_as
- initialize bufstate.error to false in virtio_iommu_probe

v3-> v4:
- see above

v2 -> v3:
- rebase on top of 2.10-rc0 and especially
  [PATCH qemu v9 0/2] memory/iommu: QOM'fy IOMMU MemoryRegion
- add mutex init
- fix as->mappings deletion using g_tree_ref/unref
- when a dev is attached whereas it is already attached to
  another address space, first detach it
- fix some error values
- page_sizes = TARGET_PAGE_MASK;
- I haven't changed the unmap() semantics yet, waiting for the
  next virtio-iommu spec revision.

v1 -> v2:
- fix redifinition of viommu_as typedef


Eric Auger (22):
  machine: Add a get_primary_pci_bus callback
  hw/arm/virt: Implement get_primary_pci_bus
  pc: Implement get_primary_pci_bus
  update-linux-headers: Import virtio_iommu.h
  linux-headers: Partial update for virtio-iommu
  virtio-iommu: Add skeleton
  virtio-iommu: Decode the command payload
  virtio-iommu: Add the iommu regions
  virtio-iommu: Register attached endpoints
  virtio-iommu: Implement attach/detach command
  virtio-iommu: Implement map/unmap
  virtio-iommu: Implement translate
  virtio-iommu: Implement probe request
  virtio-iommu: Add an msi_bypass property
  virtio-iommu: Implement fault reporting
  virtio_iommu: Handle reserved regions in translation process
  hw/arm/virt: Add virtio-iommu to the virt board
  hw/arm/virt-acpi-build: Add virtio-iommu node in IORT table
  memory.h: Add set_page_size_mask IOMMUMemoryRegion callback
  hw/vfio/common: Set the IOMMUMemoryRegion supported page sizes
  virtio-iommu: Implement set_page_size_mask
  hw/vfio/common: Do not print error when viommu translates into an mmio
    region

 hw/arm/virt-acpi-build.c                      |   55 +-
 hw/arm/virt.c                                 |   99 ++-
 hw/i386/pc.c                                  |    8 +
 hw/vfio/common.c                              |    7 +-
 hw/virtio/Makefile.objs                       |    1 +
 hw/virtio/trace-events                        |   25 +
 hw/virtio/virtio-iommu.c                      | 1063 +++++++++++++++++++++++++
 include/exec/memory.h                         |    4 +
 include/hw/acpi/acpi-defs.h                   |   21 +-
 include/hw/arm/virt.h                         |   19 +
 include/hw/boards.h                           |    3 +
 include/hw/vfio/vfio-common.h                 |    1 +
 include/hw/virtio/virtio-iommu.h              |   63 ++
 include/standard-headers/linux/virtio_ids.h   |    1 +
 include/standard-headers/linux/virtio_iommu.h |  195 +++++
 linux-headers/linux/virtio_iommu.h            |    1 +
 scripts/update-linux-headers.sh               |    3 +
 17 files changed, 1552 insertions(+), 17 deletions(-)
 create mode 100644 hw/virtio/virtio-iommu.c
 create mode 100644 include/hw/virtio/virtio-iommu.h
 create mode 100644 include/standard-headers/linux/virtio_iommu.h
 create mode 100644 linux-headers/linux/virtio_iommu.h

-- 
1.9.1

