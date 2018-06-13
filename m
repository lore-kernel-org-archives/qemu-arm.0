Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp403487wrq;
        Wed, 13 Jun 2018 01:49:10 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLFNC5EQVR2Op6jfMAWrNEVpTAriX482ova2cjxuRaPUr5B/tpV8/WKw8v3vIHNaAP+S/Er
X-Received: by 2002:ac8:783:: with SMTP id l3-v6mr3594101qth.381.1528879750393;
        Wed, 13 Jun 2018 01:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528879750; cv=none;
        d=google.com; s=arc-20160816;
        b=NbmAWDk4tvNMxdypNOMOMPVFuTejMtk/t7gA+Mv2PBuwGSuqQLehS4QQVGsyz9rh7I
         5ei3WFvEH0oc4O5oFQCilEQwBRvP7biD07tSXQO9ZmEDnFP3mdMvM14wYRBHvmvNo2Hl
         4hcoDx1V5tOH4xZrhBNrkz4ApEz2HMoz41c6Nwxp0fyffJqs6H3S4ZqVokLgPjwEL1fn
         Hj149HjInw1G8QSpK+6P+iIO5mWtDybLKom+k45YBNxxWzWhZUafKXS+kPv5nF24un32
         pYf+qjK4bsBa3KLH2OCrnGuiDfy2TgOuyJrZyjSAdHA80BovvuZ4/BG827KtpNf3PLNP
         GaKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=QgRCx6rADOtdCP0C9PZA8ucUZ3VLeixMqvQOJVatDQ8=;
        b=LLmxuIBo1i2nQW8h5RP5W8bvXI+w7NE2Z5WaQhv/fbTNzt+uVMU9Fpkh5lVGKvkSvR
         PArvELt304FvhBfy/1h9IffrQVL1zlxkXSW8T2bEFpYDHua7/TBoZUXONhF2TDmS+1w1
         rv8b6O4HQXkpaw9vDB2AVOvZpWLXkesYLIImhD3urSTEeEeHkE5U8kJOCpK6dTc2gDHh
         yTaJrhf4VlVpsc0CY5aKlAUlWTBAOFuUodbqSCU6ezcBEweu+EUHywu7c+labVNLqnW0
         cz3RMt4uYZLAIsj1HLnUP+9z/x25IjhhdoZKtp36Ls5UTsyXejKQ4IUQKatjVTxaV2fY
         e3kg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x25-v6si526604qtm.155.2018.06.13.01.49.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 01:49:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60759 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT1Sn-00027k-Sr
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 04:49:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1Sc-00025q-98
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:48:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1SZ-0003p3-6z
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:48:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35450 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fT1SZ-0003oq-1I; Wed, 13 Jun 2018 04:48:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC6AE87A7C;
	Wed, 13 Jun 2018 08:48:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81E5E1116703;
	Wed, 13 Jun 2018 08:48:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 13 Jun 2018 10:48:34 +0200
Message-Id: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 13 Jun 2018 08:48:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 13 Jun 2018 08:48:53 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 0/9] KVM/ARM: virt-3.0: Multiple redistributor
 regions and 256MB ECAM region
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	christoffer.dall@arm.com, zhaoshenglong@huawei.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MJzjtU25f0sf

This series increases the number of vcpus usable in accelerated mode
along with GICv3 and allows up to 256 PCIe busses.

It is a combination of 2 series:
[1] [RFC v3 0/8] KVM/ARM: Relax the max 123 vcpus limitation along
    with KVM GICv3
[2] [PATCH 0/2] ARM virt: Support up to 256 PCIe buses

Both add features to the 3.0 virt machine.

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
Previous version:
https://github.com/eauger/qemu/tree/v2.12.0-virt3.0-v1

Eric Auger (9):
  linux-headers: Update to 4.18-rc0
  target/arm: Allow KVM device address overwriting
  hw/intc/arm_gicv3: Introduce redist-region-count array property
  hw/intc/arm_gicv3_kvm: Get prepared to handle multiple redist regions
  hw/arm/virt: GICv3 DT node with one or two redistributor regions
  hw/arm/virt-acpi-build: Advertise one or two GICR structures
  hw/arm/virt: Register two redistributor regions when necessary
  hw/arm/virt: Add a new 256MB ECAM region
  hw/arm/virt: Add virt-3.0 machine type

 hw/arm/virt-acpi-build.c                           |  30 ++++--
 hw/arm/virt.c                                      | 104 +++++++++++++++++----
 hw/intc/arm_gic_kvm.c                              |   4 +-
 hw/intc/arm_gicv3.c                                |  12 ++-
 hw/intc/arm_gicv3_common.c                         |  38 +++++++-
 hw/intc/arm_gicv3_its_kvm.c                        |   2 +-
 hw/intc/arm_gicv3_kvm.c                            |  40 +++++++-
 include/hw/arm/virt.h                              |  17 ++++
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
 target/arm/kvm.c                                   |  10 +-
 target/arm/kvm_arm.h                               |   3 +-
 26 files changed, 274 insertions(+), 45 deletions(-)

-- 
2.5.5

