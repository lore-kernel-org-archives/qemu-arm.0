Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7138252wrx;
        Fri, 22 Feb 2019 08:28:18 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY1sjbpYxdJ8BwhJ45f3Fqt5uV6tgO6mwCQ2a7DU/LdltX1OXhxr7zbxYW1DeE3Vqqz12n9
X-Received: by 2002:a25:c00a:: with SMTP id c10mr3975012ybf.156.1550852898730;
        Fri, 22 Feb 2019 08:28:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550852898; cv=none;
        d=google.com; s=arc-20160816;
        b=ckD4NBkyVbdgMv1Qv5ElPiUCQAMgBRwJPft8tR+TXqtI8E05/hXJt+dxIr83dvjsv+
         fFE/U/QZqcJ6x+UsChWp6nz5cp32uuPGKhsoTYAfoNuObhNkp/cplvVIMZHDodMDCxPT
         /JP0eTqxeSA4HJCFZDM9a/BXKdgRam8dJxLF4uq976CGGFAUIBehsYIbBmEkCuU7VL+c
         UG+4P/W1AKfvHeGgAW57GshqieUU+WrI4Bg4s8I+jxrWnTbgILHdfkXsVFrznLXgJhRx
         pbxsqyK2P0us5o3l8nKOep+xL/K6d++iLai39KasWAAza2tYpiZtDysw6PB70gEPdNRW
         NcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=Slj5BhYlnyn0st5v0vaCvg+f1HueaFmwhZA1WgoDHz0=;
        b=gFJrZemiTjgbCJf9o4ctghPROfCd7NA7P6H2/nell8nzYE1+Ni3wUy6yoxRS+NKJFO
         u+yxCYr5vMlxT+sxdGlW/T9NN0gAEcc7h62HCxvdVhUvWc6ajS3yVcHEP3x+JQaT2231
         dKafXv1F0Xjszx44hRJpKT3hwodspMhyIfHHaB0AGDPy+MQrucWzKHwM3Fg/We9HFlqE
         nI6bACBC26IK8NFb2vh5KPy6uLygJ0NXEp5a+uy6jviwl1/1DlrgWaDt8EJhbExU7Ql4
         RlCxTgcw7Y9250FTEW40kNgcn74uqN9U1SHnMch5hObV9FoF1NDKBAZHIgDhKWWQT+po
         f1hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si1231209ybk.317.2019.02.22.08.28.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 08:28:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxDgQ-0007x1-4c
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 11:28:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxDgH-0007wf-6I
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 11:28:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gxDgD-00036s-Mi
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 11:28:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59018)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gxDgD-0002op-8M; Fri, 22 Feb 2019 11:28:05 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0E6AC01BC86;
	Fri, 22 Feb 2019 16:27:48 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31AD660191;
	Fri, 22 Feb 2019 16:27:44 +0000 (UTC)
Date: Fri, 22 Feb 2019 17:27:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190222172742.18c3835a@redhat.com>
In-Reply-To: <20190220224003.4420-1-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 22 Feb 2019 16:27:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 00/17] ARM virt: Initial RAM
 expansion and PCDIMM/NVDIMM support
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EEEhJr/S3p5U

On Wed, 20 Feb 2019 23:39:46 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> This series aims to bump the 255GB RAM limit in machvirt and to
> support device memory in general, and especially PCDIMM/NVDIMM.
> 
> In machvirt versions < 4.0, the initial RAM starts at 1GB and can
> grow up to 255GB. From 256GB onwards we find IO regions such as the
> additional GICv3 RDIST region, high PCIe ECAM region and high PCIe
> MMIO region. The address map was 1TB large. This corresponded to
> the max IPA capacity KVM was able to manage.
> 
> Since 4.20, the host kernel is able to support a larger and dynamic
> IPA range. So the guest physical address can go beyond the 1TB. The
> max GPA size depends on the host kernel configuration and physical CPUs.
> 
> In this series we use this feature and allow the RAM to grow without
> any other limit than the one put by the host kernel.
> 
> The RAM still starts at 1GB. First comes the initial ram (-m) of size
> ram_size and then comes the device memory (,maxmem) of size
> maxram_size - ram_size. The device memory is potentially hotpluggable
> depending on the instantiated memory objects.
> 
> IO regions previously located between 256GB and 1TB are moved after
> the RAM. Their offset is dynamically computed, depends on ram_size
> and maxram_size. Size alignment is enforced.
> 
> In case maxmem value is inferior to 255GB, the legacy memory map
> still is used. The change of memory map becomes effective from 4.0
> onwards.
> 
> As we keep the initial RAM at 1GB base address, we do not need to do
> invasive changes in the EDK2 FW. It seems nobody is eager to do
> that job at the moment.
> 
> Device memory being put just after the initial RAM, it is possible
> to get access to this feature while keeping a 1TB address map.
> 
> This series reuses/rebases patches initially submitted by Shameer
> in [1] and Kwangwoo in [2] for the PC-DIMM and NV-DIMM parts.
> 
> Functionally, the series is split into 3 parts:
> 1) bump of the initial RAM limit [1 - 9] and change in
>    the memory map

> 2) Support of PC-DIMM [10 - 13]
Is this part complete ACPI wise (for coldplug)? I haven't noticed
DSDT AML here no E820 changes, so ACPI wise pc-dimm shouldn't be
visible to the guest. It might be that DT is masking problem
but well, that won't work on ACPI only guests.

Even though I've tried make mem hotplug ACPI parts not x86 specific,
I'm afraid it might be tightly coupled with hotplug support.
So here are 2 options make DSDT part work without hotplug or
implement hotplug here. I think the former is just a waste of time
and we should just add hotplug. It should take relatively minor effort
since you already implemented most of boiler plate here.

As for how to implement ACPI HW part, I suggest to borrow GED
device that NEMU guys trying to use instead of GPIO route,
like we do now for ACPI_POWER_BUTTON_DEVICE to deliver event.
So that it would be easier to share this with their virt-x86
machine eventually.


> 3) Support of NV-DIMM [14 - 17]
The same might be true for NUMA but I haven't dug this deep in to
that part.

> 
> 1) can be upstreamed before 2 and 2 can be upstreamed before 3.
> 
> Work is ongoing to transform the whole memory as device memory.
> However this move is not trivial and to me, is independent on
> the improvements brought by this series:
> - if we were to use DIMM for initial RAM, those DIMMs would use
>   use slots. Although they would not be part of the ones provided
>   using the ",slots" options, they are ACPI limited resources.
> - DT and ACPI description needs to be reworked
> - NUMA integration needs special care
> - a special device memory object may be required to avoid consuming
>   slots and easing the FW description.
> 
> So I preferred to separate the concerns. This new implementation
> based on device memory could be candidate for another virt
> version.
> 
> Best Regards
> 
> Eric
> 
> References:
> 
> [0] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
> http://patchwork.ozlabs.org/cover/914694/
> 
> [1] [RFC PATCH 0/3] add nvdimm support on AArch64 virt platform
> https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg04599.html
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/v3.1.0-dimm-v7
> 
> History:
> 
> v6 -> v7:
> - Addressed Peter and Igor comments (exceptions sent my email)
> - Fixed TCG case. Now device memory works also for TCG and vcpu
>   pamax is checked
> - See individual logs for more details
> 
> v5 -> v6:
> - mingw compilation issue fix
> - kvm_arm_get_max_vm_phys_shift always returns the number of supported
>   IPA bits
> - new patch "hw/arm/virt: Rename highmem IO regions" that eases the review
>   of "hw/arm/virt: Split the memory map description"
> - "hw/arm/virt: Move memory map initialization into machvirt_init"
>   squashed into the previous patch
> - change alignment of IO regions beyond the RAM so that it matches their
>   size
> 
> v4 -> v5:
> - change in the memory map
> - see individual logs
> 
> v3 -> v4:
> - rebase on David's "pc-dimm: next bunch of cleanups" and
>   "pc-dimm: pre_plug "slot" and "addr" assignment"
> - kvm-type option not used anymore. We directly use
>   maxram_size and ram_size machine fields to compute the
>   MAX IPA range. Migration is naturally handled as CLI
>   option are kept between source and destination. This was
>   suggested by David.
> - device_memory_start and device_memory_size not stored
>   anymore in vms->bootinfo
> - I did not take into account 2 Igor's comments: the one
>   related to the refactoring of arm_load_dtb and the one
>   related to the generation of the dtb after system_reset
>   which would contain nodes of hotplugged devices (we do
>   not support hotplug at this stage)
> - check the end-user does not attempt to hotplug a device
> - addition of "vl: Set machine ram_size, maxram_size and
>   ram_slots earlier"
> 
> v2 -> v3:
> - fix pc_q35 and pc_piix compilation error
> - kwangwoo's email being not valid anymore, remove his address
> 
> v1 -> v2:
> - kvm_get_max_vm_phys_shift moved in arch specific file
> - addition of NVDIMM part
> - single series
> - rebase on David's refactoring
> 
> v1:
> - was "[RFC 0/6] KVM/ARM: Dynamic and larger GPA size"
> - was "[RFC 0/5] ARM virt: Support PC-DIMM at 2TB"
> 
> Best Regards
> 
> Eric
> 
> 
> Eric Auger (12):
>   hw/arm/virt: Rename highmem IO regions
>   hw/arm/virt: Split the memory map description
>   hw/boards: Add a MachineState parameter to kvm_type callback
>   kvm: add kvm_arm_get_max_vm_ipa_size
>   vl: Set machine ram_size, maxram_size and ram_slots earlier
>   hw/arm/virt: Dynamic memory map depending on RAM requirements
>   hw/arm/virt: Implement kvm_type function for 4.0 machine
>   hw/arm/virt: Bump the 255GB initial RAM limit
>   hw/arm/virt: Add memory hotplug framework
>   hw/arm/virt: Allocate device_memory
>   hw/arm/boot: Expose the pmem nodes in the DT
>   hw/arm/virt: Add nvdimm and nvdimm-persistence options
> 
> Kwangwoo Lee (2):
>   nvdimm: use configurable ACPI IO base and size
>   hw/arm/virt: Add nvdimm hot-plug infrastructure
> 
> Shameer Kolothum (3):
>   hw/arm/boot: introduce fdt_add_memory_node helper
>   hw/arm/boot: Expose the PC-DIMM nodes in the DT
>   hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
> 
>  accel/kvm/kvm-all.c             |   2 +-
>  default-configs/arm-softmmu.mak |   4 +
>  hw/acpi/nvdimm.c                |  31 ++-
>  hw/arm/boot.c                   | 136 ++++++++++--
>  hw/arm/virt-acpi-build.c        |  23 +-
>  hw/arm/virt.c                   | 364 ++++++++++++++++++++++++++++----
>  hw/i386/pc_piix.c               |   6 +-
>  hw/i386/pc_q35.c                |   6 +-
>  hw/ppc/mac_newworld.c           |   3 +-
>  hw/ppc/mac_oldworld.c           |   2 +-
>  hw/ppc/spapr.c                  |   2 +-
>  include/hw/arm/virt.h           |  24 ++-
>  include/hw/boards.h             |   5 +-
>  include/hw/mem/nvdimm.h         |   4 +
>  target/arm/kvm.c                |  10 +
>  target/arm/kvm_arm.h            |  13 ++
>  vl.c                            |   6 +-
>  17 files changed, 556 insertions(+), 85 deletions(-)
> 

