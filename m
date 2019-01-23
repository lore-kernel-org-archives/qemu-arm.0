Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp523297wrt;
        Wed, 23 Jan 2019 02:22:58 -0800 (PST)
X-Google-Smtp-Source: ALg8bN753KGAUavs391eYeH+zYzTMsJ6QtN7HRHVhzK3NGKUwr0cZC9+DAJ2JzwOUrok42IzB4/S
X-Received: by 2002:adf:c711:: with SMTP id k17mr1945236wrg.197.1548238978819;
        Wed, 23 Jan 2019 02:22:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548238978; cv=none;
        d=google.com; s=arc-20160816;
        b=FZeXDqvdUE+V4BRRc21NL+sWCrt8/T1I0qd+oMQK12L69nZ8yy1pHqCOtoqbQ/2MUr
         AED40svjl0gOoKdduTEl4RutuyIiuP+m+Hy8ml+lHv7zFzDqUlPqGDqfLHD4L7M3oZqE
         tRSFDRXu9i1Jc0yyR2ML/ujgreQL/Bf0rIyW8XawhiMXtUhrvs7pJfVp5FqH08yzCkEE
         OYXhkHdVryyXUjvBrHWT9MaLXO604x2dRnmsZgBKxJ6u9E2d1PeznfYPEkaUYvnj+eKE
         Cd3DTy91sVTR5yhGu6SWVb7g6Aa+3gnllQuJXIzVdtCT4M20yAUPEhJBPE41+CUycnyr
         9aiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=az0Bfpd2GHKJRyLVvlCS6Avm7EEdpkAlelqHaGcx7ow=;
        b=FkRVBk/JWLE5B6dQo0Ahf9xxMSfpLWB+jeXBWjduaAfD4fCee5tNCVJAERX0bywd6S
         3n0Bclcq5mcRr/ROk8HBRNVUX3KYQ6bZt154O11/dk3wp3U5SGZDfehfGYxP6CVKBFFr
         iSaT7PLgp+6dfh2z7F/cVKGtafpPTSASXzwATPAk0pRw1yNth7rcY+rR+m6XLnD0CoHj
         Sl3NFCJJ2IKa5uWPIsNnNfGTBEYGWWhPqF7aEQ//qln4gTujAZFZYAvqN5EuLPQ29PeT
         OTGJSiUmL09DnKct3UQno108c6OuXbBj0EC6vMJOzHedKh8wB8ENIoJLPQ2+6cZ6C3JH
         fZ2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si72508198wru.440.2019.01.23.02.22.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:22:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFgP-000760-PI
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:22:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFeg-0005nq-51
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:21:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFea-0001aX-4B
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:21:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56518)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFeZ-0001Zx-Rn; Wed, 23 Jan 2019 05:21:04 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B19387648;
	Wed, 23 Jan 2019 10:15:09 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3A2960192;
	Wed, 23 Jan 2019 10:15:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:40 +0100
Message-Id: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 23 Jan 2019 10:15:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 00/18] ARM virt: Initial RAM expansion and
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
X-TUID: PL2Bv+yp5ECE

This is a respin of [RFC v4 00/16] ARM virt: PCDIMM/NVDIMM at 2TB

This series aims to bump the 255GB RAM limit in machvirt and to
support device memory in general, and especially PCDIMM/NVDIMM.

Compared to v4, we now put all the memory at 1GB: first comes the
initial ram (-m) of size ram_size and then comes the device memory
(,maxmem) of size maxram_size - ram_size. The device memory is
potentially hotpluggable depending on the instantiated memory
objects.

IO regions currently located between 256GB and 1TB are moved after
the RAM. The IO offset obviously depends on ram_size/maxram_size
values. So this is a change of memory map that would become effective
from 4.0 onwards.

An enabler for this series is the support of dynamic IPA range at
KVM/ARM level. The RAM capacity then depends on pCPU and host kernel.

As we keep the initial RAM at 1GB base address, we do not need to do
invasive changes in the EDK2 FW. It seems nobody is eager to do
that job at the moment.

This series reuses/rebases patches initially submitted by Shameer
in [1] and Kwangwoo in [2] for the PC-DIMM and NV-DIMM parts.

Functionally the series could be split into 3 parts:
1) bump of the initial RAM limit [1 - 10] and change in
   the memory map
2) Support of PC-DIMM [11 - 14]
3) Support of NV-DIMM [15 - 18]

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
https://github.com/eauger/qemu/tree/v3.1.0-dimm-v5

History:

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

Alexey Kardashevskiy (1):
  update-linux-headers.sh: Copy new headers

Eric Auger (12):
  linux-headers: Update to v5.0-rc2
  hw/arm/virt: Split the memory map description
  hw/arm/virt: Move memory map initialization into machvirt_init
  hw/boards: Add a MachineState parameter to kvm_type callback
  kvm: add kvm_arm_get_max_vm_phys_shift
  vl: Set machine ram_size, maxram_size and ram_slots earlier
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

 accel/kvm/kvm-all.c                           |    2 +-
 default-configs/arm-softmmu.mak               |    4 +
 hw/acpi/nvdimm.c                              |   28 +-
 hw/arm/boot.c                                 |  120 +-
 hw/arm/virt-acpi-build.c                      |   22 +-
 hw/arm/virt.c                                 |  278 ++++-
 hw/i386/pc_piix.c                             |    8 +-
 hw/i386/pc_q35.c                              |    8 +-
 hw/ppc/mac_newworld.c                         |    3 +-
 hw/ppc/mac_oldworld.c                         |    2 +-
 hw/ppc/spapr.c                                |    2 +-
 include/hw/arm/virt.h                         |   20 +-
 include/hw/boards.h                           |    2 +-
 include/hw/mem/nvdimm.h                       |   12 +
 include/standard-headers/drm/drm_fourcc.h     |   63 +
 include/standard-headers/linux/ethtool.h      |   19 +-
 .../linux/input-event-codes.h                 |   19 +
 include/standard-headers/linux/pci_regs.h     |    1 +
 .../standard-headers/linux/virtio_balloon.h   |    8 +
 include/standard-headers/linux/virtio_blk.h   |   54 +
 .../standard-headers/linux/virtio_config.h    |    3 +
 include/standard-headers/linux/virtio_gpu.h   |   18 +
 include/standard-headers/linux/virtio_ring.h  |   52 +
 .../standard-headers/rdma/vmw_pvrdma-abi.h    |    1 +
 linux-headers/asm-arm/unistd-common.h         |    1 +
 linux-headers/asm-arm64/unistd.h              |    1 +
 linux-headers/asm-generic/unistd.h            |   10 +-
 linux-headers/asm-mips/sgidefs.h              |    8 -
 linux-headers/asm-mips/unistd.h               | 1074 +----------------
 linux-headers/asm-mips/unistd_n32.h           |  338 ++++++
 linux-headers/asm-mips/unistd_n64.h           |  334 +++++
 linux-headers/asm-mips/unistd_o32.h           |  374 ++++++
 linux-headers/asm-powerpc/unistd.h            |  389 +-----
 linux-headers/asm-powerpc/unistd_32.h         |  381 ++++++
 linux-headers/asm-powerpc/unistd_64.h         |  372 ++++++
 linux-headers/linux/kvm.h                     |   29 +
 linux-headers/linux/vfio.h                    |   92 ++
 linux-headers/linux/vhost.h                   |  113 +-
 linux-headers/linux/vhost_types.h             |  128 ++
 scripts/update-linux-headers.sh               |   11 +-
 target/arm/kvm.c                              |    8 +
 target/arm/kvm_arm.h                          |   16 +
 vl.c                                          |    6 +-
 43 files changed, 2764 insertions(+), 1670 deletions(-)
 create mode 100644 linux-headers/asm-mips/unistd_n32.h
 create mode 100644 linux-headers/asm-mips/unistd_n64.h
 create mode 100644 linux-headers/asm-mips/unistd_o32.h
 create mode 100644 linux-headers/asm-powerpc/unistd_32.h
 create mode 100644 linux-headers/asm-powerpc/unistd_64.h
 create mode 100644 linux-headers/linux/vhost_types.h

--=20
2.20.1

