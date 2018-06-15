Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp960789wrq;
        Fri, 15 Jun 2018 08:08:01 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL0QXhiMXNC7/BMXIJxEPMkO3LWD5odd9/4IMQnlc4Xk6Fpa7OUXBRU4jB7AGh22lDG7zPn
X-Received: by 2002:aed:25b7:: with SMTP id x52-v6mr1819366qtc.224.1529075281007;
        Fri, 15 Jun 2018 08:08:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529075281; cv=none;
        d=google.com; s=arc-20160816;
        b=EbGDIKm99GXKRRDdglakQIRcwZQjD09h/FMwivxOeQFE5ur1wBiRMiKOC/ydAFPc1/
         0yjntob08UFhLM8nxqLFyFRRpjgWlaXHeLspROpT6iDCXKelsQyMPbVrK9PRxeKXGV5S
         qW6tTF1RVcUsx0dbbZvlgzkZ9ZUYXVFezJaBRT+4TGUuyp0cC1C+RbKiTXngSqtgbfod
         cuhAuTIX6HeZVgO7SWbwlLZ8vtyD+HtdzgCELQMBLxt+DSO5ncZ3kVpJ3w4X7ugYF1cq
         V4CC71CdHu769M7qNZUsfUheVWXc+GnZjMwE9mztUK1s2Vug5x7Vv+RWvrr66aBgdWBB
         v3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=m4icOr9XiCBqLzyusYOFvhr0k5usrmabBbj2ICHP13c=;
        b=L6z+Uscz2eg/IWBpXO6Q65+dqvNNq6GpuzCcxpT4+SG/qlOtE5OEjt8Jo+Wv/YjFqq
         NlR63MHN9+c5crUzIsLYkLyEzCnwRoiOfwjYAA2zUdo5efYXG0OR+ZA6cUiNMPBYNCXl
         kKC1cOW63ELHYw4y9W0wnAJV23W75aVnEVIet9SZ0eZnuALCKI6ltpDMSLG1+zZf9DLv
         nPzX7c3Qwn13DE5BAKGFBlC5YHnF0i4cQNkLn2yvloRqeBUH/8jIDDTL+dM6pa52FZFS
         1HvWil50I5PV1Yw9dRRzdlLQgK1EPog6URMCPMpsQis0fQyWHAkepR09fmDClmgJ+VIA
         r61Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m123-v6si2693200qkc.165.2018.06.15.08.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 08:08:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTqKW-0004iM-ER
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 11:08:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpiX-0004R6-An
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 10:28:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fTpiW-0000un-1l
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 10:28:45 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41208 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fTpiP-0000oA-Ul; Fri, 15 Jun 2018 10:28:38 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63C90406DE3D;
	Fri, 15 Jun 2018 14:28:37 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF65F2026DEF;
	Fri, 15 Jun 2018 14:28:34 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 15 Jun 2018 16:28:19 +0200
Message-Id: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 14:28:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 15 Jun 2018 14:28:37 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v2 00/11] KVM/ARM: virt-3.0: Multiple
 redistributor regions and 256MB ECAM region
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
Cc: wei@redhat.com, drjones@redhat.com, ard.biesheuvel@linaro.org,
	marc.zyngier@arm.com, christoffer.dall@arm.com,
	zhaoshenglong@huawei.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eiSO0NBZj4FL

This series increases the number of vcpus usable in accelerated mode
along with GICv3 and allows up to 256 PCIe busses.

It is a combination of 2 series:
[1] [RFC v3 0/8] KVM/ARM: Relax the max 123 vcpus limitation along
    with KVM GICv3
[2] [PATCH 0/2] ARM virt: Support up to 256 PCIe buses

Both add features to the new 3.0 virt machine model.

VCPU changes:
-------------

Currently the max number of VCPUs usable along with the KVM GICv3
device is limited to 123. The rationale is a single redistributor
region was supported and this latter was set to [0x80A0000, 0x9000000]
within the guest physical address space, surrounded with DIST and UART
MMIO regions.

The 4.18 host kernel now allows to register several redistributor regions.
So this series overcomes the max 123 vcpu limitation by registering
a new redistributor region located just after the VIRT_MEM RAM region.
This second redistributor region has a capacity of 512 redistributors.

The max supported VCPUs in non accelerated mode is not modified.

PCIe BUS changes:
-----------------

Current Machvirt PCI host controller's ECAM region is 16MB large.
This limits the number of PCIe buses to 16.

PC/Q35 machines have a 256MB region allowing up to 256 buses.
This series tries to bridge the gap.

It declares a new ECAM region located beyond 256GB, of size 256MB
The new ECAM region is used if:
- highmem option is set (default) and,
- either FW is not loaded or we are run an aarch64 guest
- machine type >= 3.0.

aarch32 FW does not support this highmem ECAM region. For guests
without LPAE support the highmem option must be turned off.

Best Regards

Eric

This QEMU series can be found at:
https://github.com/eauger/qemu/tree/v2.12.0-virt3.0-v2
Previous version:
https://github.com/eauger/qemu/tree/v2.12.0-virt3.0-v1

History:
v1 -> v2:
- split virt machine model patch into 3 patches.
  Dared to keep Laszlo's and Drew's R-b.
- Took into account Drew's comments on v1 and collected
  his R-b.


Eric Auger (11):
  linux-headers: Update to 4.18-rc0
  target/arm: Allow KVM device address overwriting
  hw/intc/arm_gicv3: Introduce redist-region-count array property
  hw/intc/arm_gicv3_kvm: Get prepared to handle multiple redist regions
  hw/arm/virt: GICv3 DT node with one or two redistributor regions
  hw/arm/virt-acpi-build: Advertise one or two GICR structures
  hw/arm/virt: Register two redistributor regions when necessary
  hw/arm/virt: Add a new 256MB ECAM region
  hw/arm/virt: Add virt-3.0 machine type
  hw/arm/virt: Use 256MB ECAM region by default
  hw/arm/virt: Increase max_cpus to 512

 hw/arm/virt-acpi-build.c                           |  30 +++++--
 hw/arm/virt.c                                      | 100 +++++++++++++++++----
 hw/intc/arm_gic_kvm.c                              |   4 +-
 hw/intc/arm_gicv3.c                                |  12 ++-
 hw/intc/arm_gicv3_common.c                         |  38 ++++++--
 hw/intc/arm_gicv3_its_kvm.c                        |   2 +-
 hw/intc/arm_gicv3_kvm.c                            |  44 ++++++++-
 include/hw/arm/virt.h                              |  19 ++++
 include/hw/intc/arm_gicv3_common.h                 |   8 +-
 include/standard-headers/linux/pci_regs.h          |   8 ++
 include/standard-headers/linux/virtio_gpu.h        |   1 +
 include/standard-headers/linux/virtio_net.h        |   3 +
 .../LICENSES/exceptions/Linux-syscall-note         |   2 +-
 linux-headers/LICENSES/preferred/GPL-2.0           |   6 ++
 linux-headers/asm-arm/kvm.h                        |   1 +
 linux-headers/asm-arm/unistd-common.h              |   1 +
 linux-headers/asm-arm64/kvm.h                      |   1 +
 linux-headers/asm-generic/unistd.h                 |   4 +-
 linux-headers/asm-powerpc/unistd.h                 |   1 +
 linux-headers/asm-x86/unistd_32.h                  |   2 +
 linux-headers/asm-x86/unistd_64.h                  |   2 +
 linux-headers/asm-x86/unistd_x32.h                 |   2 +
 linux-headers/linux/kvm.h                          |   5 +-
 linux-headers/linux/psp-sev.h                      |  12 +++
 target/arm/kvm.c                                   |  10 ++-
 target/arm/kvm_arm.h                               |   3 +-
 26 files changed, 277 insertions(+), 44 deletions(-)

-- 
2.5.5

