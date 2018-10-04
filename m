Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp777082wrt;
        Thu, 4 Oct 2018 04:37:24 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61jimspaki6xoKikj8VOAmPgzfOs7aHQsVzdOlmQZB4FiNJ1I2bOQOiyJ/cetjyLCUNzt0q
X-Received: by 2002:a0c:d48d:: with SMTP id u13-v6mr4837166qvh.165.1538653043975;
        Thu, 04 Oct 2018 04:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538653043; cv=none;
        d=google.com; s=arc-20160816;
        b=fyJ9AuLF4yu+nrMG+DDmyxytQtfjGVeJIm6bZ/5CK2W3tXlUB9SgxIXGTsw05Wfyah
         lOFQ0EIO7ch6yK7CDvsOcKeDUV9k4I5xdCFQkfdyBBFS2Ano+eYs60n0PnP3BsPyUna3
         qM5PwwTomgMty2lsbPAMdq5wBkWMdQiuAsT89cwKa6THxOAn046t4lp+iG/hPPtJJjeW
         1olQSuB5IJaBVU3KCXKwOG4bv77x1JFxw2pycpw6yriSmj+fb6O+Qim40Qpy5qnm1ZFA
         9HW4lgkcMgB7tJR5xyI2wfYrwYZOAixo1IYRshbVdgpngBQUg8O3eQf2g0pOJXXpGfad
         CPOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=MiIB6ZzuwR/N6MpyP8PWVKPvHVa9I3gEarnQE2MLXqY=;
        b=YdzdzaRanDInArWT+pMsTOPeGFH+nZCEaeqHoIAv2YBEQLjFRja+Bn2/D2KbABnujY
         ZS0FBbl0RnlsG6pVKFkEtv9/EaBjqkUC34+1yGMcwub4vFhRD3Fmm0q2IXFCLj9y88rx
         nMtdNbuRuiqLy/dXokoXwMJzXk8YDQouYPHnPncVbR8DqRiUmH78nR+IoKIoCxavGaZk
         OBDj440ZJYxZsTTetdAJ1VxnPyXqCD8POTpNQUjeSFavlkQIW3dQ9ph9MsjsOTXr1pFs
         d0V/A9t613XVDeWvYEEGGG14xAqIfqkamNhVhGs6ufMdrzh6HYzbGxIxWKicKkppP7RT
         5kWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 14-v6si2997315qkm.93.2018.10.04.04.37.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 04:37:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g81wZ-0006RP-Bs
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 07:37:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g81ss-0003yi-Hc
	for qemu-devel@nongnu.org; Thu, 04 Oct 2018 07:33:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g81s2-0005mc-CQ
	for qemu-devel@nongnu.org; Thu, 04 Oct 2018 07:32:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34018)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g81ry-0005lw-Ls; Thu, 04 Oct 2018 07:32:38 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B629985A07;
	Thu,  4 Oct 2018 11:32:37 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74B9467169;
	Thu,  4 Oct 2018 11:32:28 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<43a03645-fa17-3274-9a66-502acc27b2ee@redhat.com>
	<20181004131150.3de8174a@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b673ca5c-f38e-b4a5-7abd-debfa8382e22@redhat.com>
Date: Thu, 4 Oct 2018 13:32:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181004131150.3de8174a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 04 Oct 2018 11:32:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC v3 00/15] ARM virt: PCDIMM/NVDIMM at 2TB
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
Cc: wei@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
	david@redhat.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, agraf@suse.de,
	qemu-arm@nongnu.org, david@gibson.dropbear.id.au,
	Laszlo Ersek <lersek@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: foi0mKuSyuq0

Hi Igor,

On 10/4/18 1:11 PM, Igor Mammedov wrote:
> On Wed, 3 Oct 2018 15:49:03 +0200
> Auger Eric <eric.auger@redhat.com> wrote:
> 
>> Hi,
>>
>> On 7/3/18 9:19 AM, Eric Auger wrote:
>>> This series aims at supporting PCDIMM/NVDIMM intantiation in
>>> machvirt at 2TB guest physical address.
>>>
>>> This is achieved in 3 steps:
>>> 1) support more than 40b IPA/GPA
>>> 2) support PCDIMM instantiation
>>> 3) support NVDIMM instantiation  
>>
>> While respinning this series I have some general questions that raise up
>> when thinking about extending the RAM on mach-virt:
>>
>> At the moment mach-virt offers 255GB max initial RAM starting at 1GB
>> ("-m " option).
>>
>> This series does not touch this initial RAM and only targets to add
>> device memory (usable for PCDIMM, NVDIMM, virtio-mem, virtio-pmem) in
>> 3.1 machine, located at 2TB. 3.0 address map top currently is at 1TB
>> (legacy aarch32 LPAE limit) so it would leave 1TB for IO or PCI. Is it OK?
>>
>> - Putting device memory at 2TB means only ARMv8/aarch64 would get
>> benefit of it. Is it an issue? ie. no device memory for ARMv7 or
>> ARMv8/aarch32. Do we need to put effort supporting more memory and
>> memory devices for those configs? there is less than 256GB free in the
>> existing 1TB mach-virt memory map anyway.
>>
>> - is it OK to rely only on device memory to extend the existing 255 GB
>> RAM or would we need additional initial memory? device memory usage
>> induces a more complex command line so this puts a constraint on upper
>> layers. Is it acceptable though?
>>
>> - I revisited the series so that the max IPA size shift would get
>> automatically computed according to the top address reached by the
>> device memory, ie. 2TB + (maxram_size - ramsize). So we would not need
>> any additional kvm-type or explicit vm-phys-shift option to select the
>> correct max IPA shift (or any CPU phys-bits as suggested by Dave). This
>> also assumes we don't put anything beyond the device memory. It is OK?
>>
>> - Igor told me we was concerned about the split-memory RAM model as it
>> caused a lot of trouble regarding compat/migration on PC machine. After
>> having studied the pc machine code I now wonder if we can compare the PC
>> compat issues with the ones we could encounter on ARM with the proposed
>> split memory model.
> that's not the only issue.
> 
> For example since initial memory isn't modeled as a device
> (i.e. it's just a plain memory region), there is a bunch of numa
> code to deal with it. If initial memory were replaced by pc-dimm,
> we would drop some of it and if we deprecated old '-numa mem' we
> should be able to drop the most of it (newer '-numa memdev' maps
> directly into pc-dimm model).
see my comment below.
> 
>  
>> On PC there are many knobs to tune the RAM layout
>> - max_ram_below_4g option tunes how much RAM we want below 4G
>> - gigabyte_align to force 3GB versus 3.5GB lowmem limit if ram_size >
>> max_ram_below_4g
>> - plus the usual ram_size which affects the rest of the initial ram
>> - plus the maxram_size, slots which affect the size of the device memory
>> - the device memory is just behind the initial RAM, aligned to 1GB
>>
>> Note the inital RAM and the device memory may be disjoint due to
>> misalignment of the initial ram size against 1GB
>>
>> On ARM, we would have 3.0 virt machine supporting only initial RAM from
>> 1GB to 256 GB. 3.1 (or beyond ;-)) virt machine would support the same
>> initial RAM + device memory from 2TB to 4TB.
>>
>> With that memory split and the different machine type, I don't see any
>> major hurdle with respect to migration. Do I miss something?
> Later on someone with a need to punch holes in fixed initial RAM/device memory,
> starts making it complex.
Support of host reserved regions is not acked yet but that's a valid
argument.
> 
>> Alternative to have a split model is having a floating RAM base for a
>> contiguous initial + device memory (contiguity actually depends on
>> initial RAM size alignment too). This requires significant changes in FW
>> and also potentially impacts the legacy virt address map as we need to
>> pass the RAM floating base address in some way (using an SRAM at 1GB) or
>> using fw_cfg. Is it worth the effort? Also, Peter/Laszlo mentioned their
>> reluctance to move the RAM earlier
> Drew is working on it, lets see outcome first.
> 
> We actually may try implement single region that uses pc-dimm for
> all memory (including initial) and be still compatible with legacy layout
> as far as legacy mode sticks to the current RAM limit and device memory
> region is put at the current RAM base.
> When flexible RAM base is available, we will move that region to
> non legacy layout at 2TB (or wherever).

Oh I did not understand you wanted to also replace the initial memory by
device memory. So we would switch from a pure static initial RAM setup
to a pure dynamic device memory setup. Looks quite drastic a change to
me. As mentionned I am concerned about complexifying the qemu cmd line
and I asked livirt guys about the induced pain.

Thank you for your feedbacks

Eric


> 
>> (https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg03172.html).
>>
>> Your feedbacks on those points are really welcome!
>>
>> Thanks
>>
>> Eric
>>
>>>
>>> This series reuses/rebases patches initially submitted by Shameer in [1]
>>> and Kwangwoo in [2].
>>>
>>> I put all parts all together for consistency and due to dependencies
>>> however as soon as the kernel dependency is resolved we can consider
>>> upstreaming them separately.
>>>
>>> Support more than 40b IPA/GPA [ patches 1 - 5 ]
>>> -----------------------------------------------
>>> was "[RFC 0/6] KVM/ARM: Dynamic and larger GPA size"
>>>
>>> At the moment the guest physical address space is limited to 40b
>>> due to KVM limitations. [0] bumps this limitation and allows to
>>> create a VM with up to 52b GPA address space.
>>>
>>> With this series, QEMU creates a virt VM with the max IPA range
>>> reported by the host kernel or 40b by default.
>>>
>>> This choice can be overriden by using the -machine kvm-type=<bits>
>>> option with bits within [40, 52]. If <bits> are not supported by
>>> the host, the legacy 40b value is used.
>>>
>>> Currently the EDK2 FW also hardcodes the max number of GPA bits to
>>> 40. This will need to be fixed.
>>>
>>> PCDIMM Support [ patches 6 - 11 ]
>>> ---------------------------------
>>> was "[RFC 0/5] ARM virt: Support PC-DIMM at 2TB"
>>>
>>> We instantiate the device_memory at 2TB. Using it obviously requires
>>> at least 42b of IPA/GPA. While its max capacity is currently limited
>>> to 2TB, the actual size depends on the initial guest RAM size and
>>> maxmem parameter.
>>>
>>> Actual hot-plug and hot-unplug of PC-DIMM is not suported due to lack
>>> of support of those features in baremetal.
>>>
>>> NVDIMM support [ patches 12 - 15 ]
>>> ----------------------------------
>>>
>>> Once the memory hotplug framework is in place it is fairly
>>> straightforward to add support for NVDIMM. the machine "nvdimm" option
>>> turns the capability on.
>>>
>>> Best Regards
>>>
>>> Eric
>>>
>>> References:
>>>
>>> [0] [PATCH v3 00/20] arm64: Dynamic & 52bit IPA support
>>> https://www.spinics.net/lists/kernel/msg2841735.html
>>>
>>> [1] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
>>> http://patchwork.ozlabs.org/cover/914694/
>>>
>>> [2] [RFC PATCH 0/3] add nvdimm support on AArch64 virt platform
>>> https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg04599.html
>>>
>>> Tests:
>>> - On Cavium Gigabyte, a 48b VM was created.
>>> - Migration tests were performed between kernel supporting the
>>>   feature and destination kernel not suporting it
>>> - test with ACPI: to overcome the limitation of EDK2 FW, virt
>>>   memory map was hacked to move the device memory below 1TB.
>>>
>>> This series can be found at:
>>> https://github.com/eauger/qemu/tree/v2.12.0-dimm-2tb-v3
>>>
>>> History:
>>>
>>> v2 -> v3:
>>> - fix pc_q35 and pc_piix compilation error
>>> - kwangwoo's email being not valid anymore, remove his address
>>>
>>> v1 -> v2:
>>> - kvm_get_max_vm_phys_shift moved in arch specific file
>>> - addition of NVDIMM part
>>> - single series
>>> - rebase on David's refactoring
>>>
>>> v1:
>>> - was "[RFC 0/6] KVM/ARM: Dynamic and larger GPA size"
>>> - was "[RFC 0/5] ARM virt: Support PC-DIMM at 2TB"
>>>
>>> Best Regards
>>>
>>> Eric
>>>
>>>
>>> Eric Auger (9):
>>>   linux-headers: header update for KVM/ARM KVM_ARM_GET_MAX_VM_PHYS_SHIFT
>>>   hw/boards: Add a MachineState parameter to kvm_type callback
>>>   kvm: add kvm_arm_get_max_vm_phys_shift
>>>   hw/arm/virt: support kvm_type property
>>>   hw/arm/virt: handle max_vm_phys_shift conflicts on migration
>>>   hw/arm/virt: Allocate device_memory
>>>   acpi: move build_srat_hotpluggable_memory to generic ACPI source
>>>   hw/arm/boot: Expose the pmem nodes in the DT
>>>   hw/arm/virt: Add nvdimm and nvdimm-persistence options
>>>
>>> Kwangwoo Lee (2):
>>>   nvdimm: use configurable ACPI IO base and size
>>>   hw/arm/virt: Add nvdimm hot-plug infrastructure
>>>
>>> Shameer Kolothum (4):
>>>   hw/arm/virt: Add memory hotplug framework
>>>   hw/arm/boot: introduce fdt_add_memory_node helper
>>>   hw/arm/boot: Expose the PC-DIMM nodes in the DT
>>>   hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
>>>
>>>  accel/kvm/kvm-all.c                            |   2 +-
>>>  default-configs/arm-softmmu.mak                |   4 +
>>>  hw/acpi/aml-build.c                            |  51 ++++
>>>  hw/acpi/nvdimm.c                               |  28 ++-
>>>  hw/arm/boot.c                                  | 123 +++++++--
>>>  hw/arm/virt-acpi-build.c                       |  10 +
>>>  hw/arm/virt.c                                  | 330 ++++++++++++++++++++++---
>>>  hw/i386/acpi-build.c                           |  49 ----
>>>  hw/i386/pc_piix.c                              |   8 +-
>>>  hw/i386/pc_q35.c                               |   8 +-
>>>  hw/ppc/mac_newworld.c                          |   2 +-
>>>  hw/ppc/mac_oldworld.c                          |   2 +-
>>>  hw/ppc/spapr.c                                 |   2 +-
>>>  include/hw/acpi/aml-build.h                    |   3 +
>>>  include/hw/arm/arm.h                           |   2 +
>>>  include/hw/arm/virt.h                          |   7 +
>>>  include/hw/boards.h                            |   2 +-
>>>  include/hw/mem/nvdimm.h                        |  12 +
>>>  include/standard-headers/linux/virtio_config.h |  16 +-
>>>  linux-headers/asm-mips/unistd.h                |  18 +-
>>>  linux-headers/asm-powerpc/kvm.h                |   1 +
>>>  linux-headers/linux/kvm.h                      |  16 ++
>>>  target/arm/kvm.c                               |   9 +
>>>  target/arm/kvm_arm.h                           |  16 ++
>>>  24 files changed, 597 insertions(+), 124 deletions(-)
>>>   
>>
> 
