Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp110869wrq;
        Mon, 2 Jul 2018 10:23:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf77tgVyq+vSDyrYetNzKE9k36+/oGbvxJvrieVreZdHIpsn24Tcr+Lx2/BNEcSmM2deMWZ
X-Received: by 2002:ac8:51d2:: with SMTP id d18-v6mr23560965qtn.80.1530552195292;
        Mon, 02 Jul 2018 10:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530552195; cv=none;
        d=google.com; s=arc-20160816;
        b=ALxP/E5d4n8gOHW/Oo2wx9sxI7LIijsvBPcjIjhyZuTJVIqHp5oRuQEdPEzbFKl5FC
         iUiAmq95IBYcixfvUl501Mhh2dE/7yIAq2U9Wa4uI+vZmsgHxmvIvhrLZYT6IVoMbNzU
         0jz6xSZ2Yh80dUjgrzb4D0pl7ZdXu5iQ0XuKP9Runv5HFrlDO/chTaAgUPE+iH7DfaFx
         /lG8y6Cm3o77HH034TfUFbafuWLc58XlKFtC3rddOXfa8Qx5wyun+cth/99U4f04Tj3A
         yanoSMnIdZrKzO7BYVP84uVWd4vdRbJVduXzWHysZE4ViQcKySDf3ZXRSrmptfOw5JV3
         HpHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=9r4PEdkZFLbYQQXwX02+lK8me23lIv6HRL/3GaH62nQ=;
        b=biwovUS1f3f9WVSTv4miWMYzieEAdHleYnLYrg12sIFYsCfCcas1eofkgNXrjQq9Z7
         z/CeeUgpkqyVvPrdEnB8OAQ+LOMf9wFvE0vEKg4eBZbCorLLt17QSid4dXsD/7HM7H7D
         yHQ5FZBDaeEwpQvPKrGxT0dWq0io9c4axcmgbMVr0DYnuxeOyOdM66YciO/F0K+Myaj1
         vZ8pYJF5Ow8D+463ZszxgTY7psnGNCPXYqKo5anBCMIJNTXLLqEJ8IWMB5E74v1IMGvf
         AaFKpOvyGk4QvDyvt/C49CRmL0G6+TeAQDkcpus+a8tTyhGjJnrtXSMuZtQTxeB+O5k9
         9hhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n33-v6si1470837qvg.190.2018.07.02.10.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 10:23:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34485 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa2Xi-0008HZ-GL
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 13:23:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2XW-0008HH-G2
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:23:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2XS-0006Cw-Bd
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:23:02 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47948 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fa2XS-0006CQ-5l; Mon, 02 Jul 2018 13:22:58 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 808B687A82;
	Mon,  2 Jul 2018 17:22:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCD2F111E41E;
	Mon,  2 Jul 2018 17:22:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Mon,  2 Jul 2018 19:22:27 +0200
Message-Id: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 02 Jul 2018 17:22:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 02 Jul 2018 17:22:57 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v2 00/15] ARM virt: PCDIMM/NVDIMM at 2TB
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
X-TUID: OHlbBcOUD55u

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
https://github.com/eauger/qemu/tree/v2.12.0-dimm-2tb-v1

History:
v1:
- kvm_get_max_vm_phys_shift moved in arch specific file
- addition of NVDIMM part
- single series
- rebase on David's refactoring

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

