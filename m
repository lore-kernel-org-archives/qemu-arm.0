Received: by 10.25.77.65 with SMTP id a62csp304568lfb;
        Thu, 9 Feb 2017 04:53:28 -0800 (PST)
X-Received: by 10.200.48.172 with SMTP id v41mr2437089qta.54.1486644808536;
        Thu, 09 Feb 2017 04:53:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 123si7908612qkj.221.2017.02.09.04.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Feb 2017 04:53:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cboE1-0002c8-Vk
	for alex.bennee@linaro.org; Thu, 09 Feb 2017 07:53:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1cboDx-0002bE-7S
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 07:53:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1cboDs-0007OI-Cc
	for qemu-arm@nongnu.org; Thu, 09 Feb 2017 07:53:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:54705)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agraf@suse.de>)
	id 1cboDs-0007Nz-6L; Thu, 09 Feb 2017 07:53:16 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id D5D40AD67;
	Thu,  9 Feb 2017 12:53:14 +0000 (UTC)
From: Alexander Graf <agraf@suse.de>
To: qemu-devel@nongnu.org
Date: Thu,  9 Feb 2017 13:53:26 +0100
Message-Id: <1486644810-33181-1-git-send-email-agraf@suse.de>
X-Mailer: git-send-email 1.8.5.6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 195.135.220.15
Subject: [Qemu-arm] [PATCH v2 0/4] target-arm: Add some omitted dma cache
 coherency flags
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, qemu-arm@nongnu.org,
	Laszlo Ersek <lersek@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>, mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FL/bEgVjH1no

ARM is amazing when it comes to cache coherency and VMs. While any sane
architecture allows the host to override the guest's caching attributes,
that's very hard to do on ARM.

That means that the guest may directly access guest memory bypassing the
cache while QEMU happily writes to / reads from cache. The end result is
very nasty, because both sides see very different views of the world.
 
That means that we need to be very cautious to tell guests that devices
that QEMU emulates are going to use data in the cache rather than directly
on memory.

We added this to PCI a while back for DT (5d636e21 "hw/arm/virt: mark the PCIe
host controller as DMA coherent in the DT") and ACPI (bc64b96 "hw/arm/virt-
acpi-build: _CCA attribute is compulsory") but never updated virtio-mmio or
fw-cfg in DT or ACPI tables.

This patch set adds the respective cache coherency flags for them in both DT and
ACPI.

Fortunately, no guests except for Linux 4.9.7 and 4.9.8 are broken because of
this. Upstream realized quickly enough that every user of virtio-mmio out there
describes its cache coherency incorrectly and reverted the patch that would
require said dma coherency flag. But we should be safe for the future and "do
the right thing".

Alexander Graf (4):
  target-arm: Declare virtio-mmio as dma-coherent in dt
  hw/arm/virt: Declare virtio-mmio as dma cache coherent in ACPI
  hw/arm/virt: Declare fwcfg as dma cache coherent in ACPI
  hw/arm/virt: Declare fwcfg as dma cache coherent in dt

 hw/arm/vexpress.c        | 1 +
 hw/arm/virt-acpi-build.c | 2 ++
 hw/arm/virt.c            | 2 ++
 3 files changed, 5 insertions(+)

-- 
2.10.0

