Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7203940wrx;
        Fri, 22 Feb 2019 09:36:11 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbXS0DhANh6cDF9t/zgz7DOYYsKSA68ck+pCKGtfjp1I6Oh0OS2RQua3iJhavtoMeVakW2G
X-Received: by 2002:a81:2944:: with SMTP id p65mr4124733ywp.91.1550856971789;
        Fri, 22 Feb 2019 09:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550856971; cv=none;
        d=google.com; s=arc-20160816;
        b=KVt+GPLkmcn+ojUE5NH9lZEVCz4OATzIT33ZXr6p7YDiNUp6aZw43CkpQsp3eHuGtm
         9e8Z7U1fa9ilPutXIMCp6AfYDzQIAnFnF/QpOOGl8CgCC3E4Xdj1uSqR+jxnqYHGDeW8
         LHgkH3Rhsjp4kjf7f6py3wEcCVRNeV32ss13xl4sRBI0AU9nnwmj0Alyc0wsXdAztNB/
         R120QeGhYfDM64UDVuSsDAFSfkzPDAVL0E8Uxr6nBTKL7fPe69oMhGsc88y7UdIBwQVC
         9rU9Z+BgqnOpaVgyBKZRxXlaHaBGugSxGiZxE2R58Bpxyc88kJZnmMzIJ66DnaGQrQ8K
         z3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=jPEOu3QzZk9pu3ZDOGO6TR/Qg+moGReq+hWG+/rQNAo=;
        b=KOMNhRGsAPqKH6V6QxNi5SL5GDaMkDEP3lVBY0dsA5WsqlVd2lj5SFMCbI3tNgQbOk
         DrZ/BlJDZbKTX0pv8KdWj6StNDoQ2yfHBpRwgtSWIdTIE0oHayvdPoS1WFXN0Tw79InE
         esF1wvznqVk/CYCuccrnrr/w/DxXEMmBShrarS3+86Bke4q0WTtkOHEyCui2om9RzkOf
         wsphSzsNEDKs2B0JS1d8IlRvcF0Vyba2GlOyis3Pe4V+vp0/oCfm+FYTiJ9b81ByexRC
         t273TO8DPCf9Bsas9nqNFpK6xQF7Jq93FTDi/4Otg3zqfOu03kWuzwVdPOtHGviJq5h4
         mfbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x126si1195165ywe.25.2019.02.22.09.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 09:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxEk7-0006sg-9B
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 12:36:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gxEjy-0006sO-U7
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 12:36:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gxEjx-0005dt-6m
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 12:36:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59088)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gxEjw-0005Y8-UM; Fri, 22 Feb 2019 12:36:01 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E1D1307D978;
	Fri, 22 Feb 2019 17:35:52 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9992600CD;
	Fri, 22 Feb 2019 17:35:33 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190222172742.18c3835a@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c016024e-9f4b-8953-f492-8802675f7e22@redhat.com>
Date: Fri, 22 Feb 2019 18:35:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190222172742.18c3835a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 22 Feb 2019 17:35:52 +0000 (UTC)
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
	dgilbert@redhat.com, shameerali.kolothum.thodi@huawei.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2GHw2jm6FO2N

Hi Igor,

On 2/22/19 5:27 PM, Igor Mammedov wrote:
> On Wed, 20 Feb 2019 23:39:46 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> This series aims to bump the 255GB RAM limit in machvirt and to
>> support device memory in general, and especially PCDIMM/NVDIMM.
>>
>> In machvirt versions < 4.0, the initial RAM starts at 1GB and can
>> grow up to 255GB. From 256GB onwards we find IO regions such as the
>> additional GICv3 RDIST region, high PCIe ECAM region and high PCIe
>> MMIO region. The address map was 1TB large. This corresponded to
>> the max IPA capacity KVM was able to manage.
>>
>> Since 4.20, the host kernel is able to support a larger and dynamic
>> IPA range. So the guest physical address can go beyond the 1TB. The
>> max GPA size depends on the host kernel configuration and physical CPUs.
>>
>> In this series we use this feature and allow the RAM to grow without
>> any other limit than the one put by the host kernel.
>>
>> The RAM still starts at 1GB. First comes the initial ram (-m) of size
>> ram_size and then comes the device memory (,maxmem) of size
>> maxram_size - ram_size. The device memory is potentially hotpluggable
>> depending on the instantiated memory objects.
>>
>> IO regions previously located between 256GB and 1TB are moved after
>> the RAM. Their offset is dynamically computed, depends on ram_size
>> and maxram_size. Size alignment is enforced.
>>
>> In case maxmem value is inferior to 255GB, the legacy memory map
>> still is used. The change of memory map becomes effective from 4.0
>> onwards.
>>
>> As we keep the initial RAM at 1GB base address, we do not need to do
>> invasive changes in the EDK2 FW. It seems nobody is eager to do
>> that job at the moment.
>>
>> Device memory being put just after the initial RAM, it is possible
>> to get access to this feature while keeping a 1TB address map.
>>
>> This series reuses/rebases patches initially submitted by Shameer
>> in [1] and Kwangwoo in [2] for the PC-DIMM and NV-DIMM parts.
>>
>> Functionally, the series is split into 3 parts:
>> 1) bump of the initial RAM limit [1 - 9] and change in
>>    the memory map
> 
>> 2) Support of PC-DIMM [10 - 13]
> Is this part complete ACPI wise (for coldplug)? I haven't noticed
> DSDT AML here no E820 changes, so ACPI wise pc-dimm shouldn't be
> visible to the guest. It might be that DT is masking problem
> but well, that won't work on ACPI only guests.

guest /proc/meminfo or "lshw -class memory" reflects the amount of mem
added with the DIMM slots. So it looks fine to me. Isn't E820 a pure x86
matter? What else would you expect in the dsdt? I understand hotplug
would require extra modifications but I don't see anything else missing
for coldplug.
> Even though I've tried make mem hotplug ACPI parts not x86 specific,
> I'm afraid it might be tightly coupled with hotplug support.
> So here are 2 options make DSDT part work without hotplug or
> implement hotplug here. I think the former is just a waste of time
> and we should just add hotplug. It should take relatively minor effort
> since you already implemented most of boiler plate here.

Shameer sent an RFC series for supporting hotplug.

[RFC PATCH 0/4] ARM virt: ACPI memory hotplug support
https://patchwork.kernel.org/cover/10783589/

I tested PCDIMM hotplug (with ACPI) this afternoon and it seemed to be
OK, even after system_reset.

Note the hotplug kernel support on ARM is very recent. I would prefer to
dissociate both efforts if we want to get a chance making coldplug for
4.0. Also we have an issue for NVDIMM since on reboot the guest does not
boot properly.

> 
> As for how to implement ACPI HW part, I suggest to borrow GED
> device that NEMU guys trying to use instead of GPIO route,
> like we do now for ACPI_POWER_BUTTON_DEVICE to deliver event.
> So that it would be easier to share this with their virt-x86
> machine eventually.
Sounds like a different approach than the one initiated by Shameer?

Thanks

Eric
> 
> 
>> 3) Support of NV-DIMM [14 - 17]
> The same might be true for NUMA but I haven't dug this deep in to
> that part.
> 
>>
>> 1) can be upstreamed before 2 and 2 can be upstreamed before 3.
>>
>> Work is ongoing to transform the whole memory as device memory.
>> However this move is not trivial and to me, is independent on
>> the improvements brought by this series:
>> - if we were to use DIMM for initial RAM, those DIMMs would use
>>   use slots. Although they would not be part of the ones provided
>>   using the ",slots" options, they are ACPI limited resources.
>> - DT and ACPI description needs to be reworked
>> - NUMA integration needs special care
>> - a special device memory object may be required to avoid consuming
>>   slots and easing the FW description.
>>
>> So I preferred to separate the concerns. This new implementation
>> based on device memory could be candidate for another virt
>> version.
>>
>> Best Regards
>>
>> Eric
>>
>> References:
>>
>> [0] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
>> http://patchwork.ozlabs.org/cover/914694/
>>
>> [1] [RFC PATCH 0/3] add nvdimm support on AArch64 virt platform
>> https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg04599.html
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/v3.1.0-dimm-v7
>>
>> History:
>>
>> v6 -> v7:
>> - Addressed Peter and Igor comments (exceptions sent my email)
>> - Fixed TCG case. Now device memory works also for TCG and vcpu
>>   pamax is checked
>> - See individual logs for more details
>>
>> v5 -> v6:
>> - mingw compilation issue fix
>> - kvm_arm_get_max_vm_phys_shift always returns the number of supported
>>   IPA bits
>> - new patch "hw/arm/virt: Rename highmem IO regions" that eases the review
>>   of "hw/arm/virt: Split the memory map description"
>> - "hw/arm/virt: Move memory map initialization into machvirt_init"
>>   squashed into the previous patch
>> - change alignment of IO regions beyond the RAM so that it matches their
>>   size
>>
>> v4 -> v5:
>> - change in the memory map
>> - see individual logs
>>
>> v3 -> v4:
>> - rebase on David's "pc-dimm: next bunch of cleanups" and
>>   "pc-dimm: pre_plug "slot" and "addr" assignment"
>> - kvm-type option not used anymore. We directly use
>>   maxram_size and ram_size machine fields to compute the
>>   MAX IPA range. Migration is naturally handled as CLI
>>   option are kept between source and destination. This was
>>   suggested by David.
>> - device_memory_start and device_memory_size not stored
>>   anymore in vms->bootinfo
>> - I did not take into account 2 Igor's comments: the one
>>   related to the refactoring of arm_load_dtb and the one
>>   related to the generation of the dtb after system_reset
>>   which would contain nodes of hotplugged devices (we do
>>   not support hotplug at this stage)
>> - check the end-user does not attempt to hotplug a device
>> - addition of "vl: Set machine ram_size, maxram_size and
>>   ram_slots earlier"
>>
>> v2 -> v3:
>> - fix pc_q35 and pc_piix compilation error
>> - kwangwoo's email being not valid anymore, remove his address
>>
>> v1 -> v2:
>> - kvm_get_max_vm_phys_shift moved in arch specific file
>> - addition of NVDIMM part
>> - single series
>> - rebase on David's refactoring
>>
>> v1:
>> - was "[RFC 0/6] KVM/ARM: Dynamic and larger GPA size"
>> - was "[RFC 0/5] ARM virt: Support PC-DIMM at 2TB"
>>
>> Best Regards
>>
>> Eric
>>
>>
>> Eric Auger (12):
>>   hw/arm/virt: Rename highmem IO regions
>>   hw/arm/virt: Split the memory map description
>>   hw/boards: Add a MachineState parameter to kvm_type callback
>>   kvm: add kvm_arm_get_max_vm_ipa_size
>>   vl: Set machine ram_size, maxram_size and ram_slots earlier
>>   hw/arm/virt: Dynamic memory map depending on RAM requirements
>>   hw/arm/virt: Implement kvm_type function for 4.0 machine
>>   hw/arm/virt: Bump the 255GB initial RAM limit
>>   hw/arm/virt: Add memory hotplug framework
>>   hw/arm/virt: Allocate device_memory
>>   hw/arm/boot: Expose the pmem nodes in the DT
>>   hw/arm/virt: Add nvdimm and nvdimm-persistence options
>>
>> Kwangwoo Lee (2):
>>   nvdimm: use configurable ACPI IO base and size
>>   hw/arm/virt: Add nvdimm hot-plug infrastructure
>>
>> Shameer Kolothum (3):
>>   hw/arm/boot: introduce fdt_add_memory_node helper
>>   hw/arm/boot: Expose the PC-DIMM nodes in the DT
>>   hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
>>
>>  accel/kvm/kvm-all.c             |   2 +-
>>  default-configs/arm-softmmu.mak |   4 +
>>  hw/acpi/nvdimm.c                |  31 ++-
>>  hw/arm/boot.c                   | 136 ++++++++++--
>>  hw/arm/virt-acpi-build.c        |  23 +-
>>  hw/arm/virt.c                   | 364 ++++++++++++++++++++++++++++----
>>  hw/i386/pc_piix.c               |   6 +-
>>  hw/i386/pc_q35.c                |   6 +-
>>  hw/ppc/mac_newworld.c           |   3 +-
>>  hw/ppc/mac_oldworld.c           |   2 +-
>>  hw/ppc/spapr.c                  |   2 +-
>>  include/hw/arm/virt.h           |  24 ++-
>>  include/hw/boards.h             |   5 +-
>>  include/hw/mem/nvdimm.h         |   4 +
>>  target/arm/kvm.c                |  10 +
>>  target/arm/kvm_arm.h            |  13 ++
>>  vl.c                            |   6 +-
>>  17 files changed, 556 insertions(+), 85 deletions(-)
>>
> 
> 
