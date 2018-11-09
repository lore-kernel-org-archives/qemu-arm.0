Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp566918wrw;
        Fri, 9 Nov 2018 03:30:59 -0800 (PST)
X-Google-Smtp-Source: AJdET5foYoLiMxFL1MJWa6l9CXGA8oLH8xuyBg4gC+5cPlfiYnE0Ve7kun8A2ekTRs96FAh/HdiP
X-Received: by 2002:a37:9f87:: with SMTP id i129mr7447928qke.255.1541763059547;
        Fri, 09 Nov 2018 03:30:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541763059; cv=none;
        d=google.com; s=arc-20160816;
        b=1KksykvtluT5BosfUY0xoaRJx25/aRcoBJoZ088p1ncydkY7taUrMZaDj+8MctyW7j
         QWDBXjTm/nc5lPCyc1C40J1SMyWQgNm0e3NYxQxCJuN7mIbPNlE4kakjOhGzYiuX+d0k
         0nCegGgmRCnrwaMp16fBXbB5KPUedIE7SgaPdSL0VMUoOXd+pcl9ex74aiSAjm46JP8Q
         s4zWsNnDrAsyfFnMQH1LJeGdXaW/jSqhNxTM+A5U5NOm4Ft5hwTvzDsVNu6zGSEZ+AoA
         SufA6q66ozT3j/dd9l+NKB4toygcOU/PBU0vbj1jgoWbgYFSWfzxvh0xQwLagQDRnB6H
         okpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=kiJyzLz2oa30uChWXyib8s8H8HVpoHDtA8kvBe/FZAU=;
        b=IDxbsv+F5LN+XfTQ9wMR1tksVK9bRt+Osg//PrR+GbIaJYKnQXdxSJsFyiSPBK9iy3
         h8HRPIcO5AlE2IATPd0ngnSREtt06J25ek58tsYiZs9mwIM4lbs4H+6xWmlHAvIbLc1z
         UnfMt9XA6HKaWzuqJhpqSQXYxjtc8n0ffn6tBfVbrmfRSVu8IkGP924YiZT2wokhWanJ
         SdxVjgdJwpHNSmANfoFFvGkwDwKYXW/qxElTHhrCUsnBSGroywXsOvCPc9ssw0+PTVAj
         pXZNghKlo6qvsQGuOnH001RdnONddnltHXN7Qsi0hBZoLZxbOFpkgz1K7dojXr/aKJrV
         QmPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x31si5566616qvc.205.2018.11.09.03.30.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 03:30:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL506-0006YC-WC
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 06:30:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL4zk-0006Tv-C5
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:30:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL4zX-0007Jh-Ol
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:30:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:10844)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gL4zQ-0006jp-8S; Fri, 09 Nov 2018 06:30:18 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F1459D41A;
	Fri,  9 Nov 2018 11:30:12 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CFAD75C219;
	Fri,  9 Nov 2018 11:30:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Fri,  9 Nov 2018 12:29:39 +0100
Message-Id: <20181109112957.10067-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 09 Nov 2018 11:30:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v8 00/18] VIRTIO-IOMMU device
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vzcNroOXMUQg

This series rebases the virtio-iommu device on qemu 3.1.0-rc0
and implements the v0.8 virtio-iommu spec [1]. Most importantly
the pci proxy for the virtio-iommu device is now available and
gets instantiated by the ARM virt machine when the ",iommu=virtio"
virt machine option is added.

The virtio-iommu-pci device always uses the 00:01.0 BDF and is
transparently instantiated by machvirt. The rationale is the
virtio-iommu-pci is not bound to be hotplugged and its BDF must
be known when building the guest device tree or ACPI tables.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v3.1.0-rc0-virtio-iommu-v0.8

References:
[1] [PATCH v3 0/7] Add virtio-iommu driver

[2] guest branch featuring the virtio-iommu driver v0.8 + ACPI
    integration not yet officially released by Jean.
https://github.com/eauger/linux/tree/v4.19-rc7-virtio-iommu-v0.8-iort

Testing:
- tested with guest using virtio-net-pci
  (,vhost=off,iommu_platform,disable-modern=off,disable-legacy=on)
  and virtio-blk-pci
- VFIO/VHOST integration is not part of this series
- When using the virtio-blk-pci, some EDK2 FW versions feature
  unmapped transactions and in that case the guest fails to boot.

History:

v7 -> v8:
- virtio-iommu-pci added
- virt instantiation modified
- DT and ACPI modified to exclude the iommu RID from the mapping
- VIRTIO_IOMMU_F_BYPASS, VIRTIO_F_VERSION_1 features exposed

v6 -> v7:
- rebase on qemu 3.0.0-rc3
- minor update against v0.7
- fix issue with EP not on pci.0 and ACPI probing
- change the instantiation method

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

Eric Auger (18):
  update-linux-headers: Import virtio_iommu.h
  linux-headers: Partial update for virtio-iommu v0.8
  virtio-iommu: Add skeleton
  virtio-iommu: Decode the command payload
  virtio-iommu: Add the iommu regions
  virtio-iommu: Endpoint and domains structs and helpers
  virtio-iommu: Implement attach/detach command
  virtio-iommu: Implement map/unmap
  virtio-iommu: Implement translate
  virtio-iommu: Implement probe request
  virtio-iommu: Add an msi_bypass property
  virtio-iommu: Implement fault reporting
  virtio_iommu: Handle reserved regions in translation process
  virtio-iommu-pci: Add virtio iommu pci support
  hw/arm/virt: Add virtio-iommu to the virt board
  hw/arm/virt-acpi-build: Introduce fill_iort_idmap helper
  hw/arm/virt-acpi-build: Add virtio-iommu node in IORT table
  hw/arm/virt: Allow virtio-iommu instantiation

 hw/arm/virt-acpi-build.c                      |   90 +-
 hw/arm/virt.c                                 |   56 +-
 hw/virtio/Makefile.objs                       |    1 +
 hw/virtio/trace-events                        |   26 +
 hw/virtio/virtio-iommu.c                      | 1064 +++++++++++++++++
 hw/virtio/virtio-pci.c                        |   50 +
 hw/virtio/virtio-pci.h                        |   14 +
 include/hw/acpi/acpi-defs.h                   |   21 +-
 include/hw/pci/pci.h                          |    1 +
 include/hw/virtio/virtio-iommu.h              |   65 +
 include/standard-headers/linux/virtio_ids.h   |    1 +
 include/standard-headers/linux/virtio_iommu.h |  159 +++
 linux-headers/linux/virtio_iommu.h            |    1 +
 qdev-monitor.c                                |    1 +
 scripts/update-linux-headers.sh               |    3 +
 15 files changed, 1522 insertions(+), 31 deletions(-)
 create mode 100644 hw/virtio/virtio-iommu.c
 create mode 100644 include/hw/virtio/virtio-iommu.h
 create mode 100644 include/standard-headers/linux/virtio_iommu.h
 create mode 100644 linux-headers/linux/virtio_iommu.h

-- 
2.17.2

