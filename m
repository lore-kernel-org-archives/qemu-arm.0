Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3442472wru;
        Mon, 6 Aug 2018 13:15:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpftQ+UIEkuNe86fa93LVfbN8QoXYzZo1O4PWneOPsWn6Qf1NF+rgrzpok4SLzunPE0dcT3S
X-Received: by 2002:a37:d93:: with SMTP id 141-v6mr14248715qkn.159.1533586503748;
        Mon, 06 Aug 2018 13:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533586503; cv=none;
        d=google.com; s=arc-20160816;
        b=uRthDwgeCC62/6WxW2amIpYr+Doa+54v5CJ7lOo2HFdNDvlQH9fSLEGeepesAc9C3H
         84VOWgxDqeDzh16nomDev862RtA0osrTn1Zv5JZ+RjXRTCU7m8o8vax4ZajXFRJ+M+ta
         pqSMxc8bxbFiBolBxxlFc/vIot8GENDPJ8cbeuLGZ/NW4c8eWnvndYAbjoJsZtcXfww3
         elGSATIiEWVuU3qGGrupUf2Juop6ect0PPmHQk8QvWVlGDTB/CQCOuI9GXbj6fJg9MNh
         fYOpoAjc3JhgNEoTXCvRbKgeB/X1assUjkFvqt1ldrnrDc0cdSmFV6ZF4VgFgSlvBH4n
         NhLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=OrPoINUlXuWynGSnKQIfVxXpIpD/PCDxJNchBAajGn8=;
        b=XhI7ENiWKrqxA/ZbGEgmagNaR1tYlenNwGOXp9YsVi4U7ELPnNu0in8N+Y1vFP4g6R
         fl2Py2OaqJudkYRiHm9pvW1glyCBX1vma6pBHOZwGAgZI9dKnqOiCVw7TTqSNCjTS6JE
         D3XQ++34WzTbWHHxCx/+HDlika950LCSV/Fel5trGs6+8GzZSzzUU6O7OMZvQBjGy97e
         OyY49PWLMR+ZuItm41h2/7DgmDFYXDNcrtzSADWykLnNSOlWGJmXtLs/z+PrlB8D89yy
         7puC4d0v9x69WmYHpNpd8C1rKrFLdOcr2ObNHT3D+2pD+6tVDCpdUwJ689fHOFitmUcG
         YfBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y32-v6si7399589qvy.98.2018.08.06.13.15.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 13:15:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmluB-0005ml-8J
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 16:15:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmlu2-0005gY-BP
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:14:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmlu0-0006Lb-Rd
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:14:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54402 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fmlu0-0006Jv-MK; Mon, 06 Aug 2018 16:14:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A15BA40216E3;
	Mon,  6 Aug 2018 20:14:51 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8433F2166BA0;
	Mon,  6 Aug 2018 20:14:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	mst@redhat.com, jean-philippe.brucker@arm.com
Date: Mon,  6 Aug 2018 22:14:28 +0200
Message-Id: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 06 Aug 2018 20:14:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 06 Aug 2018 20:14:51 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v7 00/16] VIRTIO-IOMMU device
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
Cc: kevin.tian@intel.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lJUm7e0Hcv3l

This series rebases the virtio-iommu device on qemu 3.0.0-rc3
and implements the v0.7 virtio-iommu spec [1]. This is a basic
upgrade as the fate of the virtio mmio based solution is unclear.

It also fixes a bug when the end-points are not attached to the
root bus.

Important notice: the way the virtio-iommu is instantiated was
changed to fit the way the smmuv3 is, ie. using a virt machine
option: ",iommu=virtio".

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v3.0.0-rc3-virtio-iommu-v0.7

References:
[1] [RFC] virtio-iommu version 0.7
git://linux-arm.org/virtio-iommu.git viommu/v0.7

[2] guest branch featuring the virtio-iommu driver v0.7
https://github.com/eauger/linux/tree/v4.18-rc1-virtio-iommu-v0.7-acpi

Testing:
- tested with guest using virtio-net-pci
  (,vhost=off,iommu_platform,disable-modern=off,disable-legacy=on)
  and virtio-blk-pci
- VFIO/VHOST integration is not part of this series

History:

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

Eric Auger (16):
  linux-headers: Partial update for virtio-iommu v0.7
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
  qdev: export qbus_find_recursive
  hw/arm/virt: Add virtio-iommu to the virt board
  hw/arm/virt-acpi-build: Add virtio-iommu node in IORT table
  hw/arm/virt: Allow virtio-iommu instantiation

 hw/arm/virt-acpi-build.c                      |   39 +-
 hw/arm/virt.c                                 |   59 +-
 hw/virtio/Makefile.objs                       |    1 +
 hw/virtio/trace-events                        |   24 +
 hw/virtio/virtio-iommu.c                      | 1041 +++++++++++++++++++++++++
 include/hw/acpi/acpi-defs.h                   |   21 +-
 include/hw/arm/virt.h                         |    1 +
 include/hw/qdev-core.h                        |    3 +
 include/hw/virtio/virtio-iommu.h              |   64 ++
 include/standard-headers/linux/virtio_ids.h   |    1 +
 include/standard-headers/linux/virtio_iommu.h |  172 ++++
 linux-headers/linux/virtio_iommu.h            |    1 +
 qdev-monitor.c                                |    5 +-
 13 files changed, 1418 insertions(+), 14 deletions(-)
 create mode 100644 hw/virtio/virtio-iommu.c
 create mode 100644 include/hw/virtio/virtio-iommu.h
 create mode 100644 include/standard-headers/linux/virtio_iommu.h
 create mode 100644 linux-headers/linux/virtio_iommu.h

-- 
2.5.5

