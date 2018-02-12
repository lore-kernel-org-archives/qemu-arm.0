Received: by 10.28.71.27 with SMTP id u27csp206061wma;
        Mon, 12 Feb 2018 11:01:34 -0800 (PST)
X-Google-Smtp-Source: AH8x225YFTjoxldVHO76oIqIyMO4rbnGkbkNML2g/t82RSDy2MFuFxmVIJF2znAB9TsJCe2cR3Oq
X-Received: by 10.129.82.22 with SMTP id g22mr6226323ywb.19.1518462094533;
        Mon, 12 Feb 2018 11:01:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518462094; cv=none;
        d=google.com; s=arc-20160816;
        b=c/fIPNj6we816H01SmKBxbG32vsyOD6EdslaWekhcIKvFABRDIC0SiTDSzmr2QgM8V
         A3vYBX+bmKBkaZdxlshrzM7zruOfOWHXBTMgIQ+Yhkgy/2ssyg9fRojsw6V/hfatGlzV
         yH97Eor9UURYOy/nysZWcV7VPEMIpOYkkX3PMBkK1bpIq1ofL9Tk3MC6bsLK0S5cP6yT
         IFZC8OFJQ+GL+EZU7HmRi9DIPUP2pr76x/mWHn6e9oScOESewUIl8gv6jjkwDTXt/cnd
         Di2pkw0O1xm/ksIHCRZwHOkHhsaV2n90bZQ0L73z2Vw6i1nzsmpD/K9ujc/3hl+dQ+9/
         543A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=9z9QuMR9MdsC1tfNObaK5xngiJ8xMgTbfnDU3poJ/Ok=;
        b=As4QJDJW4stYfe+XkCb2bKYwXHfxuPK+H8bWExadGGv4o2e0KjZ7/T3iV7deSYBYts
         O9Bu4+PYrSKBxhvNJviGDGNNMzPxdhsIhFSPXiGn1m4i4HcXbMAbXw7NljbsjT3hro/S
         tJDQNTKYddqL6sfCYllgAxdjOVzK3oKp/uBJX26kZbq0s9+swna7UI3c6Vs2fbesDnlP
         wi54hZBvPRM1WOm2t0BglgtcJoymwIIAar1y15EEhBDedc/NAQ+FEi/zOx35NdwQdLhj
         K382H79zr7Z56sskkLqYxizLZ8vHo3azFnOzpYquXeCEvGIFLv3DnEgbotjcJkOOl3dT
         fIGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e73si1607218yba.294.2018.02.12.11.01.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:01:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39815 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJM5-0002Eo-S7
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:01:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJJb-0008Cg-Cw
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:59:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJJX-00029U-DC
	for qemu-arm@nongnu.org; Mon, 12 Feb 2018 13:58:59 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34168 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJJX-00028x-8D; Mon, 12 Feb 2018 13:58:55 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A794C8182D32;
	Mon, 12 Feb 2018 18:58:44 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C3961006ED7;
	Mon, 12 Feb 2018 18:58:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:02 +0000
Message-Id: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 12 Feb 2018 18:58:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 12 Feb 2018 18:58:44 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v6 00/22] VIRTIO-IOMMU device
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
X-TUID: UjaTlvrZDkmu

This series implements the virtio-iommu device.

This v6 is an upgrade to v0.6 virtio-iommu spec [1].

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v2.11.0-virtio-iommu-v6

References:
[1] [RFC] virtio-iommu version 0.6
git://linux-arm.org/virtio-iommu.git viommu/v0.6

[2] guest branch featuring the virtio-iommu driver v0.6
git://linux-arm.org/linux-jpb.git virtio-iommu/devel

Testing:
- tested with guest using virtio-pci-net and virtio-blk-pci
  (,vhost=off,iommu_platform,disable-modern=off,disable-legacy=on)
- virtio-blk-pci uses irqfd: with GICv3, use
  "target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route"
  available on my branch
- VFIO support will be brought by a separate series
- on x86 is hacked guest kernel (available on demand)

History:

v5 -> v6:
- minor update against v0.6 spec
- fix g_hash_table_lookup in virtio_iommu_find_add_as
- replace some error_reports by qemu_log_mask(LOG_GUEST_ERROR, ...)

v4 -> v5:
- event queue and fault reporting
- we now return the IOAPIC MSI region if the virtio-iommu is instantiated
  in a PC machine.
- we bypass transactions on MSI HW region and fault on reserved ones.
- We support ACPI boot with mach-virt (based on IORT proposal)
- We moved to the new driver naming conventions
- simplified mach-virt instantiation
- worked around the disappearing of pci_find_primary_bus
- in virtio_iommu_translate, check the dev->as is not NULL
- initialize as->device_list in virtio_iommu_get_as
- initialize bufstate.error to false in virtio_iommu_probe

v3 -> v4:
- probe request support although no reserved region is returned at
  the moment
- unmap semantics less strict, as specified in v0.4
- device registration, attach/detach revisited
- split into smaller patches to ease review
- propose a way to inform the IOMMU mr about the page_size_mask
  of underlying HW IOMMU, if any
- remove warning associated with the translation of the MSI doorbell

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
  linux-headers: Partial update for virtio-iommu v0.6
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

 hw/arm/virt-acpi-build.c                      |   54 +-
 hw/arm/virt.c                                 |   99 ++-
 hw/i386/pc.c                                  |    8 +
 hw/vfio/common.c                              |    7 +-
 hw/virtio/Makefile.objs                       |    1 +
 hw/virtio/trace-events                        |   25 +
 hw/virtio/virtio-iommu.c                      | 1069 +++++++++++++++++++++++++
 include/exec/memory.h                         |    4 +
 include/hw/acpi/acpi-defs.h                   |   21 +-
 include/hw/arm/virt.h                         |   19 +
 include/hw/boards.h                           |    3 +
 include/hw/vfio/vfio-common.h                 |    1 +
 include/hw/virtio/virtio-iommu.h              |   63 ++
 include/standard-headers/linux/virtio_ids.h   |    1 +
 include/standard-headers/linux/virtio_iommu.h |  196 +++++
 linux-headers/linux/virtio_iommu.h            |    1 +
 scripts/update-linux-headers.sh               |    3 +
 17 files changed, 1558 insertions(+), 17 deletions(-)
 create mode 100644 hw/virtio/virtio-iommu.c
 create mode 100644 include/hw/virtio/virtio-iommu.h
 create mode 100644 include/standard-headers/linux/virtio_iommu.h
 create mode 100644 linux-headers/linux/virtio_iommu.h

-- 
1.9.1

