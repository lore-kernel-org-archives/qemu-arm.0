Received: by 10.25.15.230 with SMTP id 99csp2721157lfp;
        Thu, 30 Mar 2017 12:42:40 -0700 (PDT)
X-Received: by 10.55.41.33 with SMTP id p33mr1425357qkh.103.1490902960238;
        Thu, 30 Mar 2017 12:42:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u29si2655926qta.260.2017.03.30.12.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Mar 2017 12:42:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ctfxv-0003Ai-Oo
	for alex.bennee@linaro.org; Thu, 30 Mar 2017 15:42:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ctfxp-00039I-TN
	for qemu-arm@nongnu.org; Thu, 30 Mar 2017 15:42:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ctfxm-000758-QW
	for qemu-arm@nongnu.org; Thu, 30 Mar 2017 15:42:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57642)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ctfxm-00073Z-Hg; Thu, 30 Mar 2017 15:42:30 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8AEC4E4CD;
	Thu, 30 Mar 2017 19:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B8AEC4E4CD
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com B8AEC4E4CD
Received: from localhost.localdomain.com (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9EA2877D53;
	Thu, 30 Mar 2017 19:42:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	edgar.iglesias@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	prem.mallappa@gmail.com
Date: Thu, 30 Mar 2017 21:42:13 +0200
Message-Id: <1490902938-9009-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 30 Mar 2017 19:42:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 0/5] SMMUv3 Emmulation Support
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
Cc: drjones@redhat.com, Radha.Chintakuntla@cavium.com,
	christoffer.dall@linaro.org, Sunil.Goutham@cavium.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ELmbg7ESdRNY

This series introduces the emulation code for ARM SMMUv3.
This is the continuation of Prem's work [1].

At the moment only AArch64 translation format is supported, ie.
no support for AArch32 (LPAE) translation.

stage1, stage2 and stage1 + Stage2 are supposed to work but I only
tested stage 1 at the moment.

I will do the comprehensive inventory of unsupported features in
next version.

As reported by Edgar, TBUs are not modeled properly and this will be
addressed in next respin.

Don't spend too much time reviewing this version. This is just a rebase
plus some cleanups done while getting familiar with the code structure.
I will try to move as much in the base class and reuse Xilinx code when
sensible.

Best Regards

Eric

Testing:
- booted a 4.11-rc4 guest in dt mode with virtio-pci device

References:
[1] Prem's last iteration:
- https://lists.gnu.org/archive/html/qemu-devel/2016-08/msg03531.html

History:
v2 -> v3 [Eric]:
- rebased on 2.9
- mostly code and patch reorganization to ease the review process
- optional patches removed. They may be handled separately. I am currently
  working on ACPI enablement.
- optional instantiation of the smmu in mach-virt
- removed [2/9] (fdt functions) since not mandated
- start splitting main patch into base and derived object
- no new function feature added

v1 -> v2 [Prem]:
- Adopted review comments from Eric Auger
        - Make SMMU_DPRINTF to internally call qemu_log
            (since translation requests are too many, we need control
             on the type of log we want)
        - SMMUTransCfg modified to suite simplicity
        - Change RegInfo to uint64 register array
        - Code cleanup
        - Test cleanups
- Reshuffled patches

v0 -> v1 [Prem]:
- As per SMMUv3 spec 16.0 (only is_ste_consistant() is noticeable)
- Reworked register access/update logic
- Factored out translation code for
        - single point bug fix
        - sharing/removal in future
- (optional) Unit tests added, with PCI test device
        - S1 with 4k/64k, S1+S2 with 4k/64k
        - (S1 or S2) only can be verified by Linux 4.7 driver
        - (optional) Priliminary ACPI support

v0 [Prem]:
- Implements SMMUv3 spec 11.0
- Supported for PCIe devices,
- Command Queue and Event Queue supported
- LPAE only, S1 is supported and Tested, S2 not tested
- BE mode Translation not supported
- IRQ support (legacy, no MSI)


Eric Auger (2):
  hw/arm/smmu-common: smmu base class
  hw/arm/virt: Add 2.10 machine type

Prem Mallappa (3):
  log: Add new IOMMU type
  hw/arm/smmuv3: smmuv3 emulation model
  hw/arm/virt: Add SMMUv3 to the virt board

 default-configs/aarch64-softmmu.mak |    1 +
 hw/arm/Makefile.objs                |    1 +
 hw/arm/smmu-common.c                |  193 ++++++
 hw/arm/smmuv3-internal.h            |  544 +++++++++++++++++
 hw/arm/smmuv3.c                     | 1131 +++++++++++++++++++++++++++++++++++
 hw/arm/virt.c                       |  109 +++-
 include/hw/arm/smmu-common.h        |  151 +++++
 include/hw/arm/smmuv3.h             |   88 +++
 include/hw/arm/virt.h               |    5 +
 include/hw/compat.h                 |    3 +
 include/qemu/log.h                  |    1 +
 util/log.c                          |    2 +
 12 files changed, 2227 insertions(+), 2 deletions(-)
 create mode 100644 hw/arm/smmu-common.c
 create mode 100644 hw/arm/smmuv3-internal.h
 create mode 100644 hw/arm/smmuv3.c
 create mode 100644 include/hw/arm/smmu-common.h
 create mode 100644 include/hw/arm/smmuv3.h

-- 
2.5.5

