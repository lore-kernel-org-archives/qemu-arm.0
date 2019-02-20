Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5045787wrx;
        Wed, 20 Feb 2019 14:40:37 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ibl4+lPDQ1MuvXQH3h0yKRy38Sb+9xPcEySURaxVkuJxVhMgA0s4kfOcCM0D7ZVaMZeBEVW
X-Received: by 2002:a0d:f8c6:: with SMTP id i189mr29920532ywf.286.1550702437288;
        Wed, 20 Feb 2019 14:40:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550702437; cv=none;
        d=google.com; s=arc-20160816;
        b=wnYNYr14mgsezfrFxSODVe9Z2caenuiegUqZsW7HLQzYoN6DJjhnOCaHYLHWArwhEo
         4OH+RQ4UDMwy5Pvxpdwr903c/hPRSa+Z9AUR6cvuCIvHS2IXxhUV2LsTqEZxFGDGbmpI
         0GsFm05ygnmiphNV9O/RPiEGhwoU1OrRQmmEC9dZowUW9f5nBgy+9toE+0vHDx5zbtsX
         UNGnqaHpNtu9Dupokk/ObZros2IXTP5T1OoNaZeR43oBF5AihhC+UE5XlCr4MQg0UKAf
         +p4RSB0KVz2+eOXiC/FTtQUhsPTsmiLUv9JxZJfTxO3wK2UCxAre4MZnZ1h6vsA/cmTZ
         3OKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=TkAm8pC1gNj0a21m01lFTg824JLhcReYJPkltBSWI08=;
        b=IwWfB61FFl3F7rIOfAFkb6F41kAJz/oqX3n4ZRZO0PPUTt3U/qducvUtsodYrPDpAm
         /qTB13SN5s5HDisYM+hs+uIwc4V/wGw4D0PBuUPhKb4T9orwkgIHncJ036P0HR2Se/P5
         Lzvw0SF7mrFoXSJy13mEljQE1p8L0aCneC4oxP9kemwEzD9dqnKmFb7AH99ApUh4aaj9
         RpaP+Z7GP2cw47KysPlg2M0O8lqtLqcPhfFL2+iV2uOD7gK0qAoxuTVRddxHfmQjejYC
         Un7YgBCtUPuXYQNPhrSqqsMYYs+dyDaYrytB9+b2QpHCodBCikUjbSFcncjeWocLjI7Q
         D6iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 129si11433277ybl.206.2019.02.20.14.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 14:40:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwaXc-0003rm-JL
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 17:40:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXJ-0003qe-14
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:40:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXH-0008OO-Gg
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:40:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwaXH-0008OD-6t; Wed, 20 Feb 2019 17:40:15 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC4383082E55;
	Wed, 20 Feb 2019 22:40:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BE625D6AA;
	Wed, 20 Feb 2019 22:40:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 20 Feb 2019 23:39:46 +0100
Message-Id: <20190220224003.4420-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Wed, 20 Feb 2019 22:40:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 00/17] ARM virt: Initial RAM expansion and
 PCDIMM/NVDIMM support
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5RiKnJaoDej7

This series aims to bump the 255GB RAM limit in machvirt and to
support device memory in general, and especially PCDIMM/NVDIMM.

In machvirt versions < 4.0, the initial RAM starts at 1GB and can
grow up to 255GB. From 256GB onwards we find IO regions such as the
additional GICv3 RDIST region, high PCIe ECAM region and high PCIe
MMIO region. The address map was 1TB large. This corresponded to
the max IPA capacity KVM was able to manage.

Since 4.20, the host kernel is able to support a larger and dynamic
IPA range. So the guest physical address can go beyond the 1TB. The
max GPA size depends on the host kernel configuration and physical CPUs.

In this series we use this feature and allow the RAM to grow without
any other limit than the one put by the host kernel.

The RAM still starts at 1GB. First comes the initial ram (-m) of size
ram_size and then comes the device memory (,maxmem) of size
maxram_size - ram_size. The device memory is potentially hotpluggable
depending on the instantiated memory objects.

IO regions previously located between 256GB and 1TB are moved after
the RAM. Their offset is dynamically computed, depends on ram_size
and maxram_size. Size alignment is enforced.

In case maxmem value is inferior to 255GB, the legacy memory map
still is used. The change of memory map becomes effective from 4.0
onwards.

As we keep the initial RAM at 1GB base address, we do not need to do
invasive changes in the EDK2 FW. It seems nobody is eager to do
that job at the moment.

Device memory being put just after the initial RAM, it is possible
to get access to this feature while keeping a 1TB address map.

This series reuses/rebases patches initially submitted by Shameer
in [1] and Kwangwoo in [2] for the PC-DIMM and NV-DIMM parts.

Functionally, the series is split into 3 parts:
1) bump of the initial RAM limit [1 - 9] and change in
   the memory map
2) Support of PC-DIMM [10 - 13]
3) Support of NV-DIMM [14 - 17]

1) can be upstreamed before 2 and 2 can be upstreamed before 3.

Work is ongoing to transform the whole memory as device memory.
However this move is not trivial and to me, is independent on
the improvements brought by this series:
- if we were to use DIMM for initial RAM, those DIMMs would use
  use slots. Although they would not be part of the ones provided
  using the ",slots" options, they are ACPI limited resources.
- DT and ACPI description needs to be reworked
- NUMA integration needs special care
- a special device memory object may be required to avoid consuming
  slots and easing the FW description.

So I preferred to separate the concerns. This new implementation
based on device memory could be candidate for another virt
version.

Best Regards

Eric

References:

[0] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
http://patchwork.ozlabs.org/cover/914694/

[1] [RFC PATCH 0/3] add nvdimm support on AArch64 virt platform
https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg04599.html

This series can be found at:
https://github.com/eauger/qemu/tree/v3.1.0-dimm-v7

History:

v6 -> v7:
- Addressed Peter and Igor comments (exceptions sent my email)
- Fixed TCG case. Now device memory works also for TCG and vcpu
  pamax is checked
- See individual logs for more details

v5 -> v6:
- mingw compilation issue fix
- kvm_arm_get_max_vm_phys_shift always returns the number of supported
  IPA bits
- new patch "hw/arm/virt: Rename highmem IO regions" that eases the revie=
w
  of "hw/arm/virt: Split the memory map description"
- "hw/arm/virt: Move memory map initialization into machvirt_init"
  squashed into the previous patch
- change alignment of IO regions beyond the RAM so that it matches their
  size

v4 -> v5:
- change in the memory map
- see individual logs

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


Eric Auger (12):
  hw/arm/virt: Rename highmem IO regions
  hw/arm/virt: Split the memory map description
  hw/boards: Add a MachineState parameter to kvm_type callback
  kvm: add kvm_arm_get_max_vm_ipa_size
  vl: Set machine ram_size, maxram_size and ram_slots earlier
  hw/arm/virt: Dynamic memory map depending on RAM requirements
  hw/arm/virt: Implement kvm_type function for 4.0 machine
  hw/arm/virt: Bump the 255GB initial RAM limit
  hw/arm/virt: Add memory hotplug framework
  hw/arm/virt: Allocate device_memory
  hw/arm/boot: Expose the pmem nodes in the DT
  hw/arm/virt: Add nvdimm and nvdimm-persistence options

Kwangwoo Lee (2):
  nvdimm: use configurable ACPI IO base and size
  hw/arm/virt: Add nvdimm hot-plug infrastructure

Shameer Kolothum (3):
  hw/arm/boot: introduce fdt_add_memory_node helper
  hw/arm/boot: Expose the PC-DIMM nodes in the DT
  hw/arm/virt-acpi-build: Add PC-DIMM in SRAT

 accel/kvm/kvm-all.c             |   2 +-
 default-configs/arm-softmmu.mak |   4 +
 hw/acpi/nvdimm.c                |  31 ++-
 hw/arm/boot.c                   | 136 ++++++++++--
 hw/arm/virt-acpi-build.c        |  23 +-
 hw/arm/virt.c                   | 364 ++++++++++++++++++++++++++++----
 hw/i386/pc_piix.c               |   6 +-
 hw/i386/pc_q35.c                |   6 +-
 hw/ppc/mac_newworld.c           |   3 +-
 hw/ppc/mac_oldworld.c           |   2 +-
 hw/ppc/spapr.c                  |   2 +-
 include/hw/arm/virt.h           |  24 ++-
 include/hw/boards.h             |   5 +-
 include/hw/mem/nvdimm.h         |   4 +
 target/arm/kvm.c                |  10 +
 target/arm/kvm_arm.h            |  13 ++
 vl.c                            |   6 +-
 17 files changed, 556 insertions(+), 85 deletions(-)

--=20
2.20.1

