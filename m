Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp695634wrq;
        Tue, 3 Jul 2018 00:25:57 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdGP+UzuFvFR0rSJJznt0SqN96zKq1K71o40gN5QEssYM6qeennvx0QkAMPV9Y3hLMJ94R6
X-Received: by 2002:a37:7c07:: with SMTP id x7-v6mr25647259qkc.224.1530602757199;
        Tue, 03 Jul 2018 00:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530602757; cv=none;
        d=google.com; s=arc-20160816;
        b=bDslPwIkCb47Mg8n0tiGmxWC1iEylwEcf5aVfTWr3p9vVSwvns4xGS520b8ds2nyZ0
         9L2LYcY9gAYfjYgMy8cqg5E+WxKRCQ8+72DEa3ZjW6VzXUELYfNPqENWlNJA/Jbb59ve
         e7XQt6N7sfWdrel/IZ9Ty7f2Bi7auBCqsq3u3LGyqz9nDHYX5AclEBw5ri43m3rEt7Oj
         AwJ+9fEVaURWyuui06WHSx2dHZ6NvRcnEGX1RJCszesd1Zv6pN71IPtuU7ymGz9L75jO
         f6cxhP1pEFhlSi67sDDicXJepZtV8WO0ImaNhmn7s+SH6KPkHJ+duKzXiBRrPD8DOJuM
         pS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=eR6d4Xf8kU+kcYqJOizN0wkq5dqFnivJnB+JYGWzaQQ=;
        b=FD2bTAzOZ8ZYzD51qK2n9lFjkOj5xlzo1wL2q2w4NHtzytfavtMSv9rjDj78xk749M
         T9JgRaccSLv4bDQlsY/AvrgIDX7bkYaiuIGAFiSlMsn3iJb2/5D+M4xvT/MEBwD8JQmB
         KVSLSwdGa4X4eK2tmuhA/nxhXYJc1xoGsnpQ8phytIUk5N0sRSGNDxBmW55udGVU1Cb/
         z/bsaGl2AQwZTpgxsYAWs/4t5J2hdTE9Apjav6NkCY7PbgYjaC63kMcp/TelX6nvENi0
         VoU27q5tdjfn8o/p7+Z+gIDItNz15jco9JfcGxMnvGFmQUh68RidS4cYhzNbOQwupuwv
         gXCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o17-v6si159871qta.399.2018.07.03.00.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 00:25:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faFhE-0004Ht-MK
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 03:25:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFcu-00039D-1z
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:25:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFbp-0004yt-Hy
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:21:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49494 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faFbo-0004wx-RW; Tue, 03 Jul 2018 03:20:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80F4E4075188;
	Tue,  3 Jul 2018 07:20:19 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98D1B1C5A3;
	Tue,  3 Jul 2018 07:20:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  3 Jul 2018 09:19:43 +0200
Message-Id: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 03 Jul 2018 07:20:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 03 Jul 2018 07:20:19 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v3 00/15] ARM virt: PCDIMM/NVDIMM at 2TB
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
Cc: drjones@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ltMquCjfJ4RZ

This series aims at supporting PCDIMM/NVDIMM intantiation in
machvirt at 2TB guest physical address.

This is achieved in 3 steps:
1) support more than 40b IPA/GPA
2) support PCDIMM instantiation
3) support NVDIMM instantiation

This series reuses/rebases patches initially submitted by Shameer in [1]
and Kwangwoo in [2].

I put all parts all together for consistency and due to dependencies
however as soon as the kernel dependency is resolved we can consider
upstreaming them separately.

Support more than 40b IPA/GPA [ patches 1 - 5 ]
-----------------------------------------------
was "[RFC 0/6] KVM/ARM: Dynamic and larger GPA size"

At the moment the guest physical address space is limited to 40b
due to KVM limitations. [0] bumps this limitation and allows to
create a VM with up to 52b GPA address space.

With this series, QEMU creates a virt VM with the max IPA range
reported by the host kernel or 40b by default.

This choice can be overriden by using the -machine kvm-type=<bits>
option with bits within [40, 52]. If <bits> are not supported by
the host, the legacy 40b value is used.

Currently the EDK2 FW also hardcodes the max number of GPA bits to
40. This will need to be fixed.

PCDIMM Support [ patches 6 - 11 ]
---------------------------------
was "[RFC 0/5] ARM virt: Support PC-DIMM at 2TB"

We instantiate the device_memory at 2TB. Using it obviously requires
at least 42b of IPA/GPA. While its max capacity is currently limited
to 2TB, the actual size depends on the initial guest RAM size and
maxmem parameter.

Actual hot-plug and hot-unplug of PC-DIMM is not suported due to lack
of support of those features in baremetal.

NVDIMM support [ patches 12 - 15 ]
----------------------------------

Once the memory hotplug framework is in place it is fairly
straightforward to add support for NVDIMM. the machine "nvdimm" option
turns the capability on.

Best Regards

Eric

References:

[0] [PATCH v3 00/20] arm64: Dynamic & 52bit IPA support
https://www.spinics.net/lists/kernel/msg2841735.html

[1] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
http://patchwork.ozlabs.org/cover/914694/

[2] [RFC PATCH 0/3] add nvdimm support on AArch64 virt platform
https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg04599.html

Tests:
- On Cavium Gigabyte, a 48b VM was created.
- Migration tests were performed between kernel supporting the
  feature and destination kernel not suporting it
- test with ACPI: to overcome the limitation of EDK2 FW, virt
  memory map was hacked to move the device memory below 1TB.

This series can be found at:
https://github.com/eauger/qemu/tree/v2.12.0-dimm-2tb-v3

History:

v2 -> v3:
- fix pc_q35 and pc_piix compilation error
- kwangwoo's email being not valid anymore, remove his address

v1 -> v2:
- kvm_get_max_vm_phys_shift moved in arch specific file
- addition of NVDIMM part
- single series
- rebase on David's refactoring

v1:
- was "[RFC 0/6] KVM/ARM: Dynamic and larger GPA size"
- was "[RFC 0/5] ARM virt: Support PC-DIMM at 2TB"

Best Regards

Eric


Eric Auger (9):
  linux-headers: header update for KVM/ARM KVM_ARM_GET_MAX_VM_PHYS_SHIFT
  hw/boards: Add a MachineState parameter to kvm_type callback
  kvm: add kvm_arm_get_max_vm_phys_shift
  hw/arm/virt: support kvm_type property
  hw/arm/virt: handle max_vm_phys_shift conflicts on migration
  hw/arm/virt: Allocate device_memory
  acpi: move build_srat_hotpluggable_memory to generic ACPI source
  hw/arm/boot: Expose the pmem nodes in the DT
  hw/arm/virt: Add nvdimm and nvdimm-persistence options

Kwangwoo Lee (2):
  nvdimm: use configurable ACPI IO base and size
  hw/arm/virt: Add nvdimm hot-plug infrastructure

Shameer Kolothum (4):
  hw/arm/virt: Add memory hotplug framework
  hw/arm/boot: introduce fdt_add_memory_node helper
  hw/arm/boot: Expose the PC-DIMM nodes in the DT
  hw/arm/virt-acpi-build: Add PC-DIMM in SRAT

 accel/kvm/kvm-all.c                            |   2 +-
 default-configs/arm-softmmu.mak                |   4 +
 hw/acpi/aml-build.c                            |  51 ++++
 hw/acpi/nvdimm.c                               |  28 ++-
 hw/arm/boot.c                                  | 123 +++++++--
 hw/arm/virt-acpi-build.c                       |  10 +
 hw/arm/virt.c                                  | 330 ++++++++++++++++++++++---
 hw/i386/acpi-build.c                           |  49 ----
 hw/i386/pc_piix.c                              |   8 +-
 hw/i386/pc_q35.c                               |   8 +-
 hw/ppc/mac_newworld.c                          |   2 +-
 hw/ppc/mac_oldworld.c                          |   2 +-
 hw/ppc/spapr.c                                 |   2 +-
 include/hw/acpi/aml-build.h                    |   3 +
 include/hw/arm/arm.h                           |   2 +
 include/hw/arm/virt.h                          |   7 +
 include/hw/boards.h                            |   2 +-
 include/hw/mem/nvdimm.h                        |  12 +
 include/standard-headers/linux/virtio_config.h |  16 +-
 linux-headers/asm-mips/unistd.h                |  18 +-
 linux-headers/asm-powerpc/kvm.h                |   1 +
 linux-headers/linux/kvm.h                      |  16 ++
 target/arm/kvm.c                               |   9 +
 target/arm/kvm_arm.h                           |  16 ++
 24 files changed, 597 insertions(+), 124 deletions(-)

-- 
2.5.5

