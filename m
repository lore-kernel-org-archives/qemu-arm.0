Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp950702wrt;
        Thu, 22 Nov 2018 09:19:57 -0800 (PST)
X-Google-Smtp-Source: AJdET5ckqvxe6Ghk5d8frxa+yavuQuHZoq34gOABaclyllVjTctb4jCvTmrFBbyVWU6/b/obb0nN
X-Received: by 2002:a0d:f2c6:: with SMTP id b189-v6mr12344869ywf.473.1542907197124;
        Thu, 22 Nov 2018 09:19:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542907197; cv=none;
        d=google.com; s=arc-20160816;
        b=S3S4bB7TFwZczAb8lbp+yaopdPD2RRBeXP50Yn9GYcWZffTIo/i7C7ifGh0F83SNWx
         7tIIemXL+++ofGjwru7GF7W5iYbi0dYm4cQeObS0jY2q4CMYTHFzh5KWl4yEF3nqt5lx
         pra75WNL8JH8X3PwBlBF+MRmkFJUTqPEb87QOOfFjZccGfpKcl4YIvnV66g6hRMoCcxW
         NRAyJCtlaY7xQnSOdCNvGwbL96xdogn+SVzKxtp4QdfmtwFFeE0ig6Tshrjvf10rWmKE
         jZQ3VElzRS9K6dquMvwb0lxJXLJVNus05E3aNZoq1peAqPcsTEDEBwd15mENrsE9fnrr
         hlhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=Gv9p8rgeikkLs3KeUx3oNqYPZalierVp4Dn5/TszVso=;
        b=zqLvlYYsX0D5bmHrucu8TXSLEa+Xhgr5vwLaUBVhobslk87DvvGfSp4tjBaXWrIfRj
         SEO6uuFK+7uHXyBshseTJnaMZVy5/cxfJ59E2VovF+sTFIm4qQxjzZgxBfpx5jWe4MBg
         dfStafAIiza/3AIysEGt7KxNooXx4pszXRLBzCE7vEAkqn5yPtV6QRlxODoiDq2rSpCv
         moaDlsaWk8us5P3D6qz9AXx2r1lK9rcB7aRf0IJ2WmdjOBRFpoEcF7S+CwrPuspiaAqp
         KGbnvElvA8Dgq/SvQ7hChf0I2LKTKnbausU4t5jxMcuYcWhhDUARUskFJZV/Y1KYrEk5
         6QIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r186-v6si26377064ywb.299.2018.11.22.09.19.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 09:19:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48083 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPsdw-0008Nd-5I
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 12:19:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsaQ-0004oo-OY
	for qemu-devel@nongnu.org; Thu, 22 Nov 2018 12:16:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsaN-0005eY-HS
	for qemu-devel@nongnu.org; Thu, 22 Nov 2018 12:16:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55752)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gPsaA-0005Pl-Qr; Thu, 22 Nov 2018 12:16:04 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70760B0829;
	Thu, 22 Nov 2018 17:15:52 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 927A360920;
	Thu, 22 Nov 2018 17:15:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Thu, 22 Nov 2018 18:15:21 +0100
Message-Id: <20181122171538.12359-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 22 Nov 2018 17:15:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v9 00/17] VIRTIO-IOMMU device
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /xpybwrYeM2x

This series rebases the virtio-iommu device on qemu 3.1.0-rc2
and implements the v0.8(.1) virtio-iommu spec [1]. The pci proxy
for the virtio-iommu device is now available and needs to be
instantiated from the command line using "-device virtio-iommu-pci".
The iommu machvirt option is not used anymore to instantiate the
virtio-iommu.

At the moment the virtio-iommu-device only is functional in the
ARM virt machine. Indeed, besides its instantiation, links between
the PCIe end points and the IOMMU must be described. This is achieved
by DT or ACPI description (IORT). This description currently only is
done in ARM virt.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v3.1.0-rc2-virtio-iommu-v0.9

References:
[1] [PATCH v3 0/7] Add virtio-iommu driver

[2] guest branch featuring the virtio-iommu driver v0.8.1 + ACPI
    integration not yet officially released by Jean.
https://github.com/eauger/linux/tree/virtio-iommu-v0.8.1

Testing:
- tested with guest using virtio-net-pci
  (,vhost=off,iommu_platform,disable-modern=off,disable-legacy=on)
  and virtio-blk-pci
- VFIO/VHOST integration is not part of this series
- When using the virtio-blk-pci, some EDK2 FW versions feature
  unmapped transactions and in that case the guest fails to boot.

History:

v8 -> v9:
- virtio-iommu-pci device needs to be instantiated from the command
  line (RID is not imposed anymore).
- tail structure properly initialized

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

Eric Auger (17):
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
  virtio-iommu: Expose the IOAPIC MSI reserved region when relevant
  virtio-iommu: Implement fault reporting
  virtio_iommu: Handle reserved regions in translation process
  virtio-iommu-pci: Add virtio iommu pci support
  hw/arm/virt: Add the virtio-iommu device tree mappings
  hw/arm/virt-acpi-build: Introduce fill_iort_idmap helper
  hw/arm/virt-acpi-build: Add virtio-iommu node in IORT table

 hw/arm/virt-acpi-build.c                      |   91 +-
 hw/arm/virt.c                                 |   57 +-
 hw/virtio/Makefile.objs                       |    1 +
 hw/virtio/trace-events                        |   26 +
 hw/virtio/virtio-iommu.c                      | 1040 +++++++++++++++++
 hw/virtio/virtio-pci.c                        |   51 +
 hw/virtio/virtio-pci.h                        |   14 +
 include/hw/acpi/acpi-defs.h                   |   21 +-
 include/hw/arm/virt.h                         |    2 +
 include/hw/pci/pci.h                          |    1 +
 include/hw/virtio/virtio-iommu.h              |   65 ++
 include/standard-headers/linux/virtio_ids.h   |    1 +
 include/standard-headers/linux/virtio_iommu.h |  159 +++
 linux-headers/linux/virtio_iommu.h            |    1 +
 qdev-monitor.c                                |    1 +
 scripts/update-linux-headers.sh               |    3 +
 16 files changed, 1501 insertions(+), 33 deletions(-)
 create mode 100644 hw/virtio/virtio-iommu.c
 create mode 100644 include/hw/virtio/virtio-iommu.h
 create mode 100644 include/standard-headers/linux/virtio_iommu.h
 create mode 100644 linux-headers/linux/virtio_iommu.h

-- 
2.17.2

