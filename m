Received: by 10.25.0.23 with SMTP id 23csp2160341lfa;
        Wed, 7 Jun 2017 09:04:22 -0700 (PDT)
X-Received: by 10.55.19.33 with SMTP id d33mr34715970qkh.214.1496851462342;
        Wed, 07 Jun 2017 09:04:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496851462; cv=none;
        d=google.com; s=arc-20160816;
        b=rAYDpesFi37FhUBKbAPIatoT2f9S2grovDP1wrS6iIBVgx2j9f3SRJm9IsCW3E8ktw
         nIG/8mBvQmYhT8XHtvZ2jF1BMJEdVONSKGX0R+DaHiCYnNMXIpaWM1dn/eroLRpHfHjW
         W90xAmO7VOZnhQBdXRBnaw1u14WxiHSXVcWg/X+oNLrQYRkcpZtWSNvqsYd7fz9B7wYI
         Q1xy8zddyHiR/CzhL2NnT9zMGvMilar4fNjG9HOpHj71Hu3qsjOATtCLDhE/QA++7RSI
         5W5PNYlT7SVeTIFRvZXtIQL0qyDnjsd8klZ+7M80O44oQM9BjPtmq+g78w0DjT4mAhin
         tzOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=usPtpdBrQ3hHDvpvhByZmnfAUOBqY4OJ5UnvgNCFgiw=;
        b=dB16a4o+6kphpOuIzHC7+25W/sPlPXqnLy+ZjGfr5DfifuwTVNT9sSDi511auqzO1C
         krDqShmwK3yqkcQSd9Fmv89cLBDSAOwU7LcUViNCGgMLAjO6UVo/Z0PKSkINgLRpaYan
         TzlvMkqkfJnz6aEGBp5Yw7vnn1yJTZeUdavg0sLpY15DUFHWcwMMNxT1fJAE9D5iWqIb
         DTykUxMj8bx40t8kE6StE7MHrmK+Ta4B+wqjlX2WuJJVo72+aAY1LHMJOV1Cse4brCfT
         /aR3h0O6eT4bmSMt3fr2omUFD4TyqMexJHinGj4sFhGCrBTqQcMJ1shZdx049zMdS4tt
         lD1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t1si2406275qti.137.2017.06.07.09.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Jun 2017 09:04:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44904 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIdRT-0000PR-NV
	for alex.bennee@linaro.org; Wed, 07 Jun 2017 12:04:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIdOy-0005qr-4g
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 12:01:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIdOv-0007xX-3R
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 12:01:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36904)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dIdOu-0007xS-U6; Wed, 07 Jun 2017 12:01:41 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E0D880470;
	Wed,  7 Jun 2017 16:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8E0D880470
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8E0D880470
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 50F44189A9;
	Wed,  7 Jun 2017 16:01:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Wed,  7 Jun 2017 18:01:19 +0200
Message-Id: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 07 Jun 2017 16:01:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 0/8] VIRTIO-IOMMU device
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
X-TUID: TffPdtKApvBW

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
https://github.com/eauger/qemu/tree/virtio-iommu-rfcv2

References:
[1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,
[2] [RFC PATCH linux] iommu: Add virtio-iommu driver
[3] [RFC PATCH kvmtool 00/15] Add virtio-iommu

History:
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

