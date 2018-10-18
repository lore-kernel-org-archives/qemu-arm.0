Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2379689wrt;
        Thu, 18 Oct 2018 07:34:49 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60NzVptl1rqpnR/mErdvokEKFaaN0xEImCUqdvDi97aWV7vX19Cc678yFNmriV87CDH/15X
X-Received: by 2002:a0c:9324:: with SMTP id d33mr29873185qvd.4.1539873289689;
        Thu, 18 Oct 2018 07:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539873289; cv=none;
        d=google.com; s=arc-20160816;
        b=GSpKDh/D6VfawXr+egJ1HNszGz6V3WPtPmRNEbXkhmSERHzRt70YEqPXsyJ77vhDqL
         ZkD1clCwxTxw+vckciaXbcXzWBQK5unY1oWF5wsgJvBdQmZOjo0VU8NKKzFRB6L9FZnM
         67lwJFbtTGxmeqxCbaaDCq5GxwvfubxHIK4gE7yqHgeBDvCKZUX/9DYHEZfp3LTboU8c
         FR1kKywQvmRWXxZq3TUxebFBp7zN8y4SVp1JMazTBwo2GyKjYa9X6b4QtmJutcRnF84m
         bP8mks3LcKQCqqgyqGKd5rOrht4NNqbTf/YWCNwkwgi2bvhcRl/dC3B3ZvTos8hrZRRT
         UwYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=sPRlHk/X3Wwe+3NL0u88JhYqksROOkKLrcTGU480T64=;
        b=MKxh0e7QuOJGqUVqYYOhInHvUMCD4Zq34o6jT5MyPIzzdOjhrxg6nQc6eXgeGofUKL
         jZezvU6wYQYThmcne8kd0wlcwH9V8jTwkVO0bXz9TGMeroncfblhQUvlAdP5WhY+LgAs
         ZbTmwM5uIyd3JKQGIN9XVx7My0LJ8qQwsfHnZ7IFSw+2vhGhc7jeUyg6qoBWSR3vdq+X
         zIRaju1JnyNhp2TyBFatUR9/xCIL6QSU3o4c3lau7IDK1VE1AogTA38BhxpEpSYdsnat
         blj+79T80t7j/t/6FcNj1B4VPBgKIhuBkUkQvTbXQ3YDdRY3rTXQyuQgRC+9nl9FAVeP
         AamA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h1-v6si2944198qtn.354.2018.10.18.07.34.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:34:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42688 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9Nx-0000MA-4l
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:34:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9KR-0005VR-Ul
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9KL-0006U8-Rk
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53432)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD9KG-0006KH-77; Thu, 18 Oct 2018 10:31:02 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80E35305ADB2;
	Thu, 18 Oct 2018 14:30:57 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5CD8F7AE29;
	Thu, 18 Oct 2018 14:30:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Thu, 18 Oct 2018 16:30:26 +0200
Message-Id: <20181018143042.29588-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 18 Oct 2018 14:30:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 00/16] ARM virt: PCDIMM/NVDIMM at 2TB
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
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LHnvYhUaUmY5

This series aims at supporting PCDIMM/NVDIMM intantiation in
mach-virt at 2TB guest physical address.

This is not material for 3.1.

Although there is another implementation alternative under
discussion on the ML, consisting in having a single device memory
region with a floating base, I continue to maintain this series
until all dependencies get resolved and this other solution gets
fully prototyped.

Here we consider that the top of the address map is the top of
the device memory starting at 2TB and whose size is defined
by maxram_size - ram_size.

We create a KVM machine with an IPA range including the top of
the device memory. Suzuki's kernel series [0] allows that settings.
In can be found on kvmarm/next branch and this branch was used for
testing.

Then the series adds the device memory framework to mach-virt
and brings support for PC-DIMM and NV-DIMM frontend devices.

This series reuses/rebases patches initially submitted by Shameer
in [1] and Kwangwoo in [2] for the PC-DIMM and NV-DIMM parts.

Notes:
- The EDK2 FW still hardcodes the max PA size to 40 bits
- The TCG machine limits the PA according to the id_aa64mmfr0 register
  PARange field. At the moment the PARange is hardcoded to 40bits for
  the A53 CPU and to 44 bits for the A57. So only an A57 based machine
  would be able to expose device memory. This consisteny check is not
  yet handled. We could think about adding the support for the phys-bit
  CPU option to set the id_aa64mmfr0.parange.

The series includes "hw/arm/boot: introduce fdt_add_memory_node
helper" which was sent separately.

Best Regards

Eric

References:

[0] [PATCH v6 00/18] arm64: Dynamic & 52bit IPA support
https://lkml.org/lkml/2018/9/26/936
kvmarm next branch can be used for testing

[1] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
http://patchwork.ozlabs.org/cover/914694/

[2] [RFC PATCH 0/3] add nvdimm support on AArch64 virt platform
https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg04599.html

Tests:
- On Cavium Gigabyte, a 48b KVM accelerated VM was created.
- PC-DIMM was tested with memtester
- NV-DIMM was tested with ndctl and an ext4 DAX FS was installed on
  guest

This series can be found at:
https://github.com/eauger/qemu/tree/v3.0.0-dimm-2tb-v4

History:

v3 -> v4:
- rebase on David's "pc-dimm: next bunch of cleanups" and
  "pc-dimm: pre_plug "slot" and "addr" assignment"
- kvm-type option not used anymore. We directly use
  maxram_size and ram_size machine fields to compute the
  MAX IPA range. Migration is naturally handled as CLI
  option are kept between source and destination. This was
  suggested by David.
- device_memory_start and device_memory_size not stored
  anymore in vms->bootinfo
- I did not take into account 2 Igor's comments: the one
  related to the refactoring of arm_load_dtb and the one
  related to the generation of the dtb after system_reset
  which would contain nodes of hotplugged devices (we do
  not support hotplug at this stage)
- check the end-user does not attempt to hotplug a device
- addition of "vl: Set machine ram_size, maxram_size and
  ram_slots earlier"

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

Eric Auger (10):
  linux-headers: header update for KVM/ARM KVM_ARM_GET_MAX_VM_PHYS_SHIFT
  hw/boards: Add a MachineState parameter to kvm_type callback
  kvm: add kvm_arm_get_max_vm_phys_shift
  vl: Set machine ram_size, maxram_size and ram_slots earlier
  hw/arm/virt: Add virt-3.2 machine type
  hw/arm/virt: Implement kvm_type function for 3.2 machine
  hw/arm/virt: Allocate device_memory
  acpi: move build_srat_hotpluggable_memory to generic ACPI source
  hw/arm/boot: Expose the pmem nodes in the DT
  hw/arm/virt: Add nvdimm and nvdimm-persistence options

Kwangwoo Lee (2):
  nvdimm: use configurable ACPI IO base and size
  hw/arm/virt: Add nvdimm hot-plug infrastructure

Shameer Kolothum (4):
  hw/arm/boot: introduce fdt_add_memory_node helper
  hw/arm/virt: Add memory hotplug framework
  hw/arm/boot: Expose the PC-DIMM nodes in the DT
  hw/arm/virt-acpi-build: Add PC-DIMM in SRAT

 accel/kvm/kvm-all.c             |   2 +-
 default-configs/arm-softmmu.mak |   4 +
 hw/acpi/aml-build.c             |  51 ++++++
 hw/acpi/nvdimm.c                |  28 ++-
 hw/arm/boot.c                   | 120 ++++++++++---
 hw/arm/virt-acpi-build.c        |  10 ++
 hw/arm/virt.c                   | 302 ++++++++++++++++++++++++++++----
 hw/i386/pc_piix.c               |   8 +-
 hw/i386/pc_q35.c                |   8 +-
 hw/ppc/mac_newworld.c           |   3 +-
 hw/ppc/mac_oldworld.c           |   2 +-
 hw/ppc/spapr.c                  |   2 +-
 include/hw/acpi/aml-build.h     |   3 +
 include/hw/arm/virt.h           |   5 +
 include/hw/boards.h             |   2 +-
 include/hw/mem/nvdimm.h         |  12 ++
 linux-headers/linux/kvm.h       |  10 ++
 target/arm/kvm.c                |   8 +
 target/arm/kvm_arm.h            |  16 ++
 vl.c                            |   6 +-
 20 files changed, 530 insertions(+), 72 deletions(-)

-- 
2.17.1

