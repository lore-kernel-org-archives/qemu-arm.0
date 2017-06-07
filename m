Received: by 10.25.0.23 with SMTP id 23csp1977308lfa;
        Wed, 7 Jun 2017 01:36:28 -0700 (PDT)
X-Received: by 10.55.94.4 with SMTP id s4mr23356333qkb.27.1496824588292;
        Wed, 07 Jun 2017 01:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496824588; cv=none;
        d=google.com; s=arc-20160816;
        b=f/oulNsR4WRwvNUvEjH+bWd1uLL5OAPxqJvCOIYR0bo9PAHgQwJCEV1Tbf91r45MEc
         R7KBOq1oaJ2EVDSt51G4tsWdunUitCgAbXdncKUbunsO1W/B9LfstfOB+fvEo5Ms1LxW
         iL4SWCQQi84b+WI1qnfUecHO2O4wBXn/qIHsmCfrXoZy2/f361iQyNi2kgicUgyGXmWE
         scGPDWjFf77JjXNyAVCkCxH73WDcZCamAAtjv/sX8yPr65a6ubqcvXYRXY60QKtWMVTS
         lg5F2k9ciEuMG8HQjvdF/rdaHQqq4TxOkNPqBFEDmSQR8+Tkjc++R3AR/TqwpkO0NHet
         Qs6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=YLu+BQ+Z2epJbU5In2OfqaXiBITrznrJIV3DoZgsBa4=;
        b=Ea+gj6PDeVpUGMGuXUkMvezEPTU+3VEuNHaieT6FrVE4QHwoczjZC9i6izL5upUpxc
         qGa0vfBmD+PWh1P5nccuJGwdH885NS5UWA5H7II0ecIxRAb43zNhOGM7XqU6mjqS4Cep
         5VwP9PKssZUlZ8EP0E9TdR+cunYo8tPCWi23qGKu9+wTJ4/ps5fvYJ3TG/4HRb5nwXka
         uPHCRVMnUy+kPzQEmyKAPlC9ikCC0VUUqY2zpM+YJ3J1aQZTVGEB8a/HAuGsVWKOs0Gz
         ltRlSW5aHPABPvtQvuYttuc6IYBk0sUTGvawN5XdPFCxouMDPXu003FzX6QmSeY/Jtmr
         PsZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p4si1283485qkf.144.2017.06.07.01.36.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Jun 2017 01:36:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIWS1-0003Bs-HM
	for alex.bennee@linaro.org; Wed, 07 Jun 2017 04:36:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIWRx-0003BJ-Bo
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 04:36:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIWRt-0000t2-4m
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 04:36:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57875)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dIWRs-0000st-Uh; Wed, 07 Jun 2017 04:36:17 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B9E74E4D0;
	Wed,  7 Jun 2017 08:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3B9E74E4D0
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3B9E74E4D0
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C852C176B2;
	Wed,  7 Jun 2017 08:36:04 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Wed,  7 Jun 2017 10:35:48 +0200
Message-Id: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 07 Jun 2017 08:36:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 0/8] VIRTIO-IOMMU device
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
Cc: kevin.tian@intel.com, bharat.bhushan@nxp.com, marc.zyngier@arm.com,
	tn@semihalf.com, will.deacon@arm.com, drjones@redhat.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sme4gelGMxT5

This series implements the virtio-iommu device. This is a proof
of concept based on the virtio-iommu specification written by
Jean-Philippe Brucker [1]. This was tested with a guest using
the virtio-iommu driver [2] and exposed with a virtio-net-pci
using dma ops.

The device gets instantiated using the "-device virtio-iommu-device"
option. It currently works with ARM virt machine only as the machine
must handle the dt binding between the virtio-mmio "iommu" node and
the PCI host bridge node. ACPI booting is not yet supported.

This should allow to start some benchmarking activities against
pure emulated IOMMU (especially ARM SMMU).

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/virtio-iommu-rfcv1

References:
[1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,
[2] [RFC PATCH linux] iommu: Add virtio-iommu driver
[3] [RFC PATCH kvmtool 00/15] Add virtio-iommu

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
 hw/virtio/virtio-iommu.c                      | 623 ++++++++++++++++++++++++++
 include/hw/arm/virt.h                         |   5 +
 include/hw/virtio/virtio-iommu.h              |  60 +++
 include/standard-headers/linux/virtio_ids.h   |   1 +
 include/standard-headers/linux/virtio_iommu.h | 142 ++++++
 linux-headers/linux/virtio_iommu.h            |   1 +
 scripts/update-linux-headers.sh               |   3 +
 10 files changed, 957 insertions(+), 9 deletions(-)
 create mode 100644 hw/virtio/virtio-iommu.c
 create mode 100644 include/hw/virtio/virtio-iommu.h
 create mode 100644 include/standard-headers/linux/virtio_iommu.h
 create mode 100644 linux-headers/linux/virtio_iommu.h

-- 
2.5.5

