Received: by 10.25.44.15 with SMTP id s15csp4666944lfs;
        Tue, 1 Aug 2017 02:34:28 -0700 (PDT)
X-Received: by 10.55.67.136 with SMTP id q130mr7380880qka.185.1501580068202;
        Tue, 01 Aug 2017 02:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501580068; cv=none;
        d=google.com; s=arc-20160816;
        b=MxEvcGB/mVE/wR0LtBYwVzqdWKTjf5CCS2sN582QxIk832WNszCu8CqUySgAafkzwz
         2qIWTjbSNtxgQKF6cgIv8oJMgeA/JnWXxNpfUypqIJ09yWtcFWIkjuzFUNYeOOYDhZdT
         t8kl8y3ajYY+eWLQvj3SptPjx4tIPGF9i4lspieWpn9GGpVtbExsr+BBOFUFVGwjE9Xx
         e4uTS6aBTdEcCz1WKPSJPbGxkZRPgt8Hqauw3e5P60tV6NeZ6K4uFu5JnJm9AR+Ls3km
         8b7hn8mm4r/uY+5VfI/EJrC/jgdoKczKqaZDYPuAe9JGdie3afwIz3yaeO+lVLvf7QEi
         SWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=NzfYLNsGwezawbIhQUhcFE1HL6o6alkEUPElVIlshHM=;
        b=ZqK2JVC1YBM4v1hpilh9dyCdbfEBQ3zIW+ylut7ERwTfNRXwsLNtvXAJeGBfZcR/nl
         zAG5O/vsZ2oCDhEUQZO4gYNGtB16j03IWSv4Pa6bI2e9wdEmp3z6T137rVIyVyIXh0lM
         M/eYhbgRU18gOxkcPQLen8nSdddq3GYrBigVDKuKgHQ2J4E4wvv4FX7844TiWNvqB3AK
         C7dBYsPg5RxVq/LJWNcA1cuQTTVM2DFvgWFRYm58TUy7e2zP9HqBzwFmbMJIXD01JhQF
         ok5ltfrVDM6H1EvvehQ1dDX+V3Fgau5+88fMyapLP58/jkxsLz1aKWcAQacQqIjMPwMb
         MNjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i10si25710172qtg.340.2017.08.01.02.34.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Aug 2017 02:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcTZJ-0007G2-NM
	for alex.bennee@linaro.org; Tue, 01 Aug 2017 05:34:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dcTZG-0007Fq-92
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 05:34:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dcTZD-00017u-10
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 05:34:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49712)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dcTZC-00017H-OA; Tue, 01 Aug 2017 05:34:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C7EF10794A;
	Tue,  1 Aug 2017 09:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7C7EF10794A
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-181.ams2.redhat.com
	[10.36.116.181])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78D5C6047A;
	Tue,  1 Aug 2017 09:34:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue,  1 Aug 2017 11:33:06 +0200
Message-Id: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 01 Aug 2017 09:34:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 0/8] VIRTIO-IOMMU device
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
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +iibWBLuYn/9

This series implements the virtio-iommu device.

This v3 mostly is a rebase on top of v2.10-rc0 that uses
IOMMUMmeoryRegion plus some small fixes.

This is a proof of concept based on the virtio-iommu specification
written by Jean-Philippe Brucker [1].

The device gets instantiated using the "-device virtio-iommu-device"
option. It currently works with ARM virt machine only, as the machine
must handle the dt binding between the virtio-mmio "iommu" node and
the PCI host bridge node.

ACPI booting is not yet supported.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v2.10.0-rc0-virtio-iommu-rfcv3

References:
[1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,
[2] [RFC PATCH linux] iommu: Add virtio-iommu driver
[3] [RFC PATCH kvmtool 00/15] Add virtio-iommu

Testing:
- >= 4.12 guest kernel + virtio-iommu driver [2]
- guest using a virtio-net-pci device:
  ,vhost=off,iommu_platform,disable-modern=off,disable-legacy=on

History:
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


Eric Auger (8):
  update-linux-headers: import virtio_iommu.h
  linux-headers: Update for virtio-iommu
  virtio_iommu: add skeleton
  virtio-iommu: Decode the command payload
  virtio_iommu: Add the iommu regions
  virtio-iommu: Implement the translation and commands
  hw/arm/virt: Add 2.10 machine type
  hw/arm/virt: Add virtio-iommu the virt board

 hw/arm/virt.c                                 | 116 ++++-
 hw/virtio/Makefile.objs                       |   1 +
 hw/virtio/trace-events                        |  14 +
 hw/virtio/virtio-iommu.c                      | 670 ++++++++++++++++++++++++++
 include/hw/arm/virt.h                         |   5 +
 include/hw/virtio/virtio-iommu.h              |  61 +++
 include/standard-headers/linux/virtio_ids.h   |   1 +
 include/standard-headers/linux/virtio_iommu.h | 142 ++++++
 linux-headers/linux/virtio_iommu.h            |   1 +
 scripts/update-linux-headers.sh               |   3 +
 10 files changed, 1005 insertions(+), 9 deletions(-)
 create mode 100644 hw/virtio/virtio-iommu.c
 create mode 100644 include/hw/virtio/virtio-iommu.h
 create mode 100644 include/standard-headers/linux/virtio_iommu.h
 create mode 100644 linux-headers/linux/virtio_iommu.h

-- 
2.5.5

