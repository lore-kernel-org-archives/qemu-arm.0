Received: by 10.25.0.6 with SMTP id 6csp753349lfa;
        Sat, 13 May 2017 10:43:43 -0700 (PDT)
X-Received: by 10.55.71.150 with SMTP id u144mr8530081qka.233.1494697423117;
        Sat, 13 May 2017 10:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494697423; cv=none;
        d=google.com; s=arc-20160816;
        b=u9rHDGfME1qLBRO2y3ZCPNJr6sqq0CyqXDf/fb1SFCkkbMdbsKJL+tX5vYGYDJIEIc
         dent+yPaAW5saA+KJ4YcVH7XYEQI1ko+VGct89F6IX/pQzZhkA36gqERbXuTeY71GQ8r
         FtO4Zjqk9jwK2koo23UWqzItK1vmD1g2tCywe8ktirlIPCigWSioTDt1MpG7Q4tmikR9
         mTpRlC6mwsDhLYZ+MGwWm7vD4ma/T5sZfIBuoRPLhhrJm+v4eCwICfbEaOyZiAz2FgpT
         k2k0CJArm3e1P/0zkUVtvJCrxA9kN+HAOlkcuDUPRxK2/Rw+R/Gn2w9Pqna0C7aKx0+A
         nzfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=VSR3qjq0lySlou36pf6ibsW6t4KI2hPYxR0TkCICtHQ=;
        b=g90rENFDYCg19bH5qUhWvYbGDwR+vVk6b/dNTnPy0OszEN8VWXCrUagi0yUr4FGR6r
         fnGU/c4C4R6iAxIUq6/n0JW2SolHUdVYOjVpjzUOteU9p7a+0nqKhHteTSZwq9V1GkKA
         074FSGoF9uwICjFc7p/9wLA+opafg3JLJHI9ZZEP10RLaFrwCkTJ6HiodohFf3YUATBw
         mNFMsnuPWaXAZKlNlhujUW2UM7FCRWu/HYNNw4QQHq7zl1UcJ/hpdgSOgLDt2cs4tfwM
         k/09JpSHvx12NRlLmtdxRAi2CrZeZMsa9ocvsrvydenxzRWtkWSBJnW1lZUSfaIBLL+X
         VhQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 52si6615241qtt.290.2017.05.13.10.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 13 May 2017 10:43:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58409 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9b4t-00089M-BB
	for alex.bennee@linaro.org; Sat, 13 May 2017 13:43:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1d9b4p-00089E-Q8
	for qemu-arm@nongnu.org; Sat, 13 May 2017 13:43:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1d9b4m-0003lP-Kk
	for qemu-arm@nongnu.org; Sat, 13 May 2017 13:43:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45768)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1d9b4m-0003kl-BX; Sat, 13 May 2017 13:43:32 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C61A37EEB;
	Sat, 13 May 2017 17:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3C61A37EEB
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3C61A37EEB
Received: from localhost.localdomain.com (ovpn-116-214.ams2.redhat.com
	[10.36.116.214])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49E12D0210;
	Sat, 13 May 2017 17:43:25 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	edgar.iglesias@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	prem.mallappa@gmail.com
Date: Sat, 13 May 2017 19:43:14 +0200
Message-Id: <1494697399-352-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sat, 13 May 2017 17:43:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 0/5] ARM SMMUv3 Emulation Support
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tArnp2Whs0p9

This series introduces the emulation code for ARM SMMUv3.
This is the continuation of Prem's work [1].

This v4 is yet another visibility step as many restrictions apply
to the model at the moment:
- only VMSAv8-64 is supported (no VMSAv8-32)
- only stage 1 has been tested (Block PTE still needs to be
  implemented and tested though)
- no integration with VFIO. We are missing some quirks to force
  the guest to invalidate TLBs when updating the page tables.
  But replay will be easily implemented upon new page table scan.
- stage 2 is not supported. There is partial support when decoding
  configuration information but no support at page table walk level.
  This is my next step.
- at the moment I don't plan to support nested S1 + S2 as I
  understand no SW stack uses it at the moment.
- no support for HYP mappings
- register fine emulation, commands, interrupts and errors were
  not accurately tested. Handling is sufficient to run a guest
  with a virtio-net-pci device using dma ops.
- At the moment no change to the PCIe instantiation (further
  discussions about SMMUv2 TBUs versus SMMUv3 TLBs needed).

- In ACPI mode, the guest must feature the IOMMU probe deferral
  series wich fixes streamid multiple lookup

The smmu is instantiated when passing the smmu option to machvirt:
"-M virt-2.10,smmu"

Best Regards

Eric

This series can be found at:
v4: https://github.com/eauger/qemu/tree/v2.9-SMMU-v4

Testing:
- booted a 4.11 guest in dt and acpi mode with an iommu_platform
  virtio-net-pci device (using dma ops). Tested with the following
  guest combinations: 4K page - 39 bit VA, 4K - 48b, 64K - 39b,
  64K - 48b.
- Also Prem's unit test environment was rebased (available upon
  demand)

References:
[1] Prem's last iteration:
- https://lists.gnu.org/archive/html/qemu-devel/2016-08/msg03531.html

History:
v3 -> v4 [Eric]:
- page table walk rewritten to allow scan of the page table within a
  range of IOVA. This prepares for VFIO integration and replay.
- configuration parsing partially reworked.
- do not advertise unsupported/untested features: S2, S1 + S2, HYP,
  PRI, ATS, ..
- added ACPI table generation
- migrated to dynamic traces
- mingw compilation fix

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
- Tested with DPDK and e1000

Eric Auger (2):
  hw/arm/smmu-common: smmu base class
  hw/arm/virt: Add 2.10 machine type

Prem Mallappa (3):
  hw/arm/smmuv3: smmuv3 emulation model
  hw/arm/virt: Add SMMUv3 to the virt board
  hw/arm/virt-acpi-build: add smmuv3 node in IORT table

 default-configs/aarch64-softmmu.mak |    1 +
 hw/arm/Makefile.objs                |    1 +
 hw/arm/smmu-common.c                |  419 +++++++++++++
 hw/arm/smmu-internal.h              |   97 +++
 hw/arm/smmuv3-internal.h            |  603 +++++++++++++++++++
 hw/arm/smmuv3.c                     | 1134 +++++++++++++++++++++++++++++++++++
 hw/arm/trace-events                 |   44 ++
 hw/arm/virt-acpi-build.c            |   56 +-
 hw/arm/virt.c                       |  109 +++-
 include/hw/acpi/acpi-defs.h         |   15 +
 include/hw/arm/smmu-common.h        |  125 ++++
 include/hw/arm/smmuv3.h             |   87 +++
 include/hw/arm/virt.h               |    5 +
 13 files changed, 2687 insertions(+), 9 deletions(-)
 create mode 100644 hw/arm/smmu-common.c
 create mode 100644 hw/arm/smmu-internal.h
 create mode 100644 hw/arm/smmuv3-internal.h
 create mode 100644 hw/arm/smmuv3.c
 create mode 100644 include/hw/arm/smmu-common.h
 create mode 100644 include/hw/arm/smmuv3.h

-- 
2.5.5

