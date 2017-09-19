Received: by 10.223.172.38 with SMTP id v35csp4640953wrc;
        Tue, 19 Sep 2017 00:47:36 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAICqroN4sGES/3NFY4O0qsYd0OogVVBNMi9Cy87/6vQm1nxo3n8MrA5xCQESNSPfPRsTGJ
X-Received: by 10.55.221.217 with SMTP id u86mr731797qku.64.1505807256036;
        Tue, 19 Sep 2017 00:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505807256; cv=none;
        d=google.com; s=arc-20160816;
        b=HJuMIojg2ZFiPyduzkK3qzO/FJ4TkMeh2jJv85OSjWttvIkeip4cN61sRjBJYov33S
         FsMyuIXWLFQlbVdbuuafAGXaD0952GVZHWjRq5FiUc2yxoybldv6NlvtcYEN/fptuElZ
         9DaQ6k+AtdGicUM0ilizvxtdo/0OzZeSALCpR1iU23HOi0zOhGl9qY+Fd5PlJAIPJR5U
         gztYGzlLJHWYDViAmmyIGMX6h8e+lxineQAIE8Bbg6enmbBv7Ju2aay6vyuwhjj2oTRr
         kUn/K+O2HCty9i1txiiQfB1fZMDSnPAB7jr8kmBZvj3a1zrfyyhX4jTFzP2Hqru9hxav
         kOdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=5Ba9N3N8hht5C9xmMDS3bGfd6h2B8XzFoOZ9nfLhLZQ=;
        b=HyYA6BsZ9hJWwuoCY33QiFsrE9dx845w2OGCGe+iGAXTiIuQqH0FEGt+NlZUaKTS1A
         rldWxsgBrwXD5gFe9Gb02zFOfvfTcX9IKjYgpuIYgPmbsm2xfuZQB1jJTN6eaMiHkJZf
         KeNIXHKJIQlAqsmgPsbQvBSwujM+MqsncT9qHA4x33hx4VZqF/hG20nncAly+n+gz2aX
         OPopTA0OH53QHSc/ZzwUUqb25QxHpjGeLeBw8hbdO/3GXO3N/9ZXOw0Z/QKKuR+ESoq/
         lKPE3fiXAvAH16HC9mGRaTEwgtPbsgW4muGEEZDeDEAga7pfc5T25TnzLm238EMTRe1t
         j2Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h9si201938qtc.28.2017.09.19.00.47.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 00:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40579 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duDFl-0007dB-NV
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 03:47:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDFY-0007bJ-9z
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:47:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDFU-0000Qw-9S
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:47:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38302)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1duDFU-0000QO-0i; Tue, 19 Sep 2017 03:47:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA5B47E44D;
	Tue, 19 Sep 2017 07:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CA5B47E44D
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C4A761348;
	Tue, 19 Sep 2017 07:46:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue, 19 Sep 2017 09:46:32 +0200
Message-Id: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 19 Sep 2017 07:47:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 00/16] VIRTIO-IOMMU device
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
X-TUID: TAT4y8Xzajxm

This series implements the virtio-iommu device.

This v4 is an upgrade to v0.4 spec [1] and applies on QEMU v2.10.0.
- probe request support although no reserved region is returned at
  the moment
- unmap semantics less strict, as specified in v0.4
- device registration, attach/detach revisited
- split into smaller patches to ease review
- propose a way to inform the IOMMU mr about the page_size_mask
  of underlying HW IOMMU, if any
- remove warning associated with the translation of the MSI doorbell

The device gets instantiated using the "-device virtio-iommu-device"
option. It currently works with ARM virt machine only, as the machine
must handle the dt binding between the virtio-mmio "iommu" node and
the PCI host bridge node.

The associated VHOST/VFIO adaptation is available on the branch
below but is not officially delivered as part of this series.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v2.10.0-virtio-iommu-v4

References:
[1] [RFC] virtio-iommu version 0.4
    git://linux-arm.org/virtio-iommu.git branch viommu/v0.4

Testing:
- guest kernel with v0.4 virtio-iommu driver (4kB page)
- tested with guest using virtio-pci-net and vhost-net
  (,vhost=on/off,iommu_platform,disable-modern=off,disable-legacy=on  )
- tested with VFIO and guest assigned with 2 VFs
- tested with DPDK on guest with 2 assigned VFs

Not tested:
- hot-plug/hot-unplug of EP: not implemented

History:
v2-> v4:
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

Eric Auger (16):
  update-linux-headers: import virtio_iommu.h
  linux-headers: Update for virtio-iommu
  virtio-iommu: add skeleton
  virtio-iommu: Decode the command payload
  virtio-iommu: Add the iommu regions
  virtio-iommu: Register attached devices
  virtio-iommu: Implement attach/detach command
  virtio-iommu: Implement map/unmap
  virtio-iommu: Implement translate
  virtio-iommu: Implement probe request
  hw/arm/virt: Add 2.11 machine type
  hw/arm/virt: Add virtio-iommu to the virt board
  memory.h: Add set_page_size_mask IOMMUMemoryRegion callback
  hw/vfio/common: Set the IOMMUMemoryRegion supported page sizes
  virtio-iommu: Implement set_page_size_mask
  hw/vfio/common: Do not print error when viommu translates into an mmio
    region

 hw/arm/virt.c                                 | 115 +++-
 hw/vfio/common.c                              |   7 +-
 hw/virtio/Makefile.objs                       |   1 +
 hw/virtio/trace-events                        |  24 +
 hw/virtio/virtio-iommu.c                      | 923 ++++++++++++++++++++++++++
 include/exec/memory.h                         |   4 +
 include/hw/arm/virt.h                         |   5 +
 include/hw/vfio/vfio-common.h                 |   1 +
 include/hw/virtio/virtio-iommu.h              |  61 ++
 include/standard-headers/linux/virtio_ids.h   |   1 +
 include/standard-headers/linux/virtio_iommu.h | 177 +++++
 linux-headers/linux/virtio_iommu.h            |   1 +
 scripts/update-linux-headers.sh               |   3 +
 13 files changed, 1312 insertions(+), 11 deletions(-)
 create mode 100644 hw/virtio/virtio-iommu.c
 create mode 100644 include/hw/virtio/virtio-iommu.h
 create mode 100644 include/standard-headers/linux/virtio_iommu.h
 create mode 100644 linux-headers/linux/virtio_iommu.h

-- 
2.5.5

