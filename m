Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9769719wrx;
        Mon, 25 Feb 2019 02:14:28 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia9Ig+7BtiqW6hRrj/76Rs98tER69qpo0LllPHtNJ69i0wUO9niqf7x15UVP9MOpg/WhWfF
X-Received: by 2002:a5b:544:: with SMTP id r4mr13161354ybp.235.1551089668396;
        Mon, 25 Feb 2019 02:14:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551089668; cv=none;
        d=google.com; s=arc-20160816;
        b=ul8AB7pw3AfVFPM4z8JRNNB7sCGXnPVuzkVNFqMRl0mdi6FYVnKz8Yvy9CVWXjBKer
         +PZ4FztPD31T9vkWwnzuRmXq9CG1aT6I1aRwIs9ItxSruG7MocfAU8P1Sr4vTynmQpS2
         tSXlbeoAUkZ2nrxzfJ8QwemPw6X1r9vsNs8m2AEYHCVNNVmLY650G7xUuaydVeN+pA7G
         kmbPr7bYm/CsuCkD8quPkKRYbV8DqNxSVWoDUqmJPVwrn4kf9F0jwmDI6EHn1xHJdpU4
         S4X01rVBLBdjOI3VFFOOmYrdt1W0sNmmBKM1xExN9KtIwmV0f8cdaghfRY30vX1r+NHt
         h68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=3BMB01miAqMUlumNA+sNcm8UiIxDYiY+/8WjE4KnXy8=;
        b=k+YMT8z+DXij95alN5l0E+pqkFcgKLgGJ/x57i9bbJJM80neTuxNm8RHskUiQPguw6
         z94BQum9HkryJO5JflihGcdGerJo4Yk7xAJAI3Pf8xud9Vnjh4ubKaibtvBwHIYdqZMq
         ADBEz8KxoOIlUn7CqnJhTuA2wlVv3bBl410wMqPsJZ6cXh0ZV2SXUR7qe6yxHD1SchQy
         2QVSHDyCmpIAjN03sPuxvkEx3al2dAo5/89t9Xw7xn+gvIwZzznFX7o5M8qw1MprPkTT
         x7nYJot6y8YT/i5XKyJWZ+MoWgAe2k4qUqde8syBIA3Qmj7eaHk/JDqPYJYl2ClSbyR9
         vYDg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8si1373498ybk.65.2019.02.25.02.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Feb 2019 02:14:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyDHH-0002ra-LO
	for alex.bennee@linaro.org; Mon, 25 Feb 2019 05:14:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1gyDH0-0002pT-Js
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 05:14:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1gyDGy-0004GU-Ue
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 05:14:10 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:45346 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1gyDGy-0004FL-Kn; Mon, 25 Feb 2019 05:14:08 -0500
Received: from LHREML713-CAH.china.huawei.com (unknown [172.18.7.107])
	by Forcepoint Email with ESMTP id A013AAB48374A486D813;
	Mon, 25 Feb 2019 10:14:05 +0000 (GMT)
Received: from LHREML524-MBS.china.huawei.com ([169.254.2.86]) by
	LHREML713-CAH.china.huawei.com ([10.201.108.36]) with mapi id
	14.03.0415.000; Mon, 25 Feb 2019 10:13:57 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>, Auger Eric <eric.auger@redhat.com>
Thread-Topic: [Qemu-devel] [PATCH v7 00/17] ARM virt: Initial RAM expansion
	and PCDIMM/NVDIMM support
Thread-Index: AQHUyW1El5IR0Rd+70mvbAClIWqLhaXsBDYAgAAS7QCABDLGAIAAByLQ
Date: Mon, 25 Feb 2019 10:13:57 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8392D4928@lhreml524-mbs.china.huawei.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190222172742.18c3835a@redhat.com>
	<c016024e-9f4b-8953-f492-8802675f7e22@redhat.com>
	<20190225104212.7d40e65e@Igors-MacBook-Pro.local>
In-Reply-To: <20190225104212.7d40e65e@Igors-MacBook-Pro.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"david@redhat.com" <david@redhat.com>, Linuxarm <linuxarm@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BdmAzI3/nuAI

Hi Igor,

> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 25 February 2019 09:42
> To: Auger Eric <eric.auger@redhat.com>
> Cc: peter.maydell@linaro.org; drjones@redhat.com; david@redhat.com;
> qemu-devel@nongnu.org; Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; dgilbert@redhat.com;
> qemu-arm@nongnu.org; david@gibson.dropbear.id.au;
> eric.auger.pro@gmail.com
> Subject: Re: [Qemu-devel] [PATCH v7 00/17] ARM virt: Initial RAM expansio=
n
> and PCDIMM/NVDIMM support
>=20
> On Fri, 22 Feb 2019 18:35:26 +0100
> Auger Eric <eric.auger@redhat.com> wrote:

[...]

> > I understand hotplug
> > would require extra modifications but I don't see anything else missing
> > for coldplug.
> > > Even though I've tried make mem hotplug ACPI parts not x86 specific,
> > > I'm afraid it might be tightly coupled with hotplug support.
> > > So here are 2 options make DSDT part work without hotplug or
> > > implement hotplug here. I think the former is just a waste of time
> > > and we should just add hotplug. It should take relatively minor effor=
t
> > > since you already implemented most of boiler plate here.
> >
> > Shameer sent an RFC series for supporting hotplug.
> >
> > [RFC PATCH 0/4] ARM virt: ACPI memory hotplug support
> > https://patchwork.kernel.org/cover/10783589/
> >
> > I tested PCDIMM hotplug (with ACPI) this afternoon and it seemed to be
> > OK, even after system_reset.
> >
> > Note the hotplug kernel support on ARM is very recent. I would prefer t=
o
> > dissociate both efforts if we want to get a chance making coldplug for
> > 4.0. Also we have an issue for NVDIMM since on reboot the guest does no=
t
> > boot properly.
> I guess we can merge implemetation that works on some kernel configs
> [DT based I'd guess], and add ACPI part later. Though that will be
> a bit of a mess as we do not version firmware parts (ACPI tables).
>=20
> > > As for how to implement ACPI HW part, I suggest to borrow GED
> > > device that NEMU guys trying to use instead of GPIO route,
> > > like we do now for ACPI_POWER_BUTTON_DEVICE to deliver event.
> > > So that it would be easier to share this with their virt-x86
> > > machine eventually.
> > Sounds like a different approach than the one initiated by Shameer?
> ARM boards were first to use ACPI hw-reduced profile so they picked up
> available back then GPIO based way to deliver hotplug event, later spec
> introduced Generic Event Device for that means to use with hw-reduced
> profile, which NEMU implemented[1], so I'd use that rather than ad-hoc
> GPIO mapping. I'd guess it will more compatible with various contemporary
> guests and we could reuse the same code for both x86/arm virt boards)
>=20
> 1) https://github.com/intel/nemu/blob/topic/virt-x86/hw/acpi/ged.c

Thanks for this suggestion. Looks like that is definitely a better way of h=
andling
ACPI events. I will take a look and use GED for the next revision of hotplu=
g=20
series.

Thanks,
Shameer

> > Thanks
> >
> > Eric
> > >
> > >
> > >> 3) Support of NV-DIMM [14 - 17]
> > > The same might be true for NUMA but I haven't dug this deep in to
> > > that part.
> > >
> > >>
> > >> 1) can be upstreamed before 2 and 2 can be upstreamed before 3.
> > >>
> > >> Work is ongoing to transform the whole memory as device memory.
> > >> However this move is not trivial and to me, is independent on
> > >> the improvements brought by this series:
> > >> - if we were to use DIMM for initial RAM, those DIMMs would use
> > >>   use slots. Although they would not be part of the ones provided
> > >>   using the ",slots" options, they are ACPI limited resources.
> > >> - DT and ACPI description needs to be reworked
> > >> - NUMA integration needs special care
> > >> - a special device memory object may be required to avoid consuming
> > >>   slots and easing the FW description.
> > >>
> > >> So I preferred to separate the concerns. This new implementation
> > >> based on device memory could be candidate for another virt
> > >> version.
> > >>
> > >> Best Regards
> > >>
> > >> Eric
> > >>
> > >> References:
> > >>
> > >> [0] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
> > >> http://patchwork.ozlabs.org/cover/914694/
> > >>
> > >> [1] [RFC PATCH 0/3] add nvdimm support on AArch64 virt platform
> > >> https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg04599.html
> > >>
> > >> This series can be found at:
> > >> https://github.com/eauger/qemu/tree/v3.1.0-dimm-v7
> > >>
> > >> History:
> > >>
> > >> v6 -> v7:
> > >> - Addressed Peter and Igor comments (exceptions sent my email)
> > >> - Fixed TCG case. Now device memory works also for TCG and vcpu
> > >>   pamax is checked
> > >> - See individual logs for more details
> > >>
> > >> v5 -> v6:
> > >> - mingw compilation issue fix
> > >> - kvm_arm_get_max_vm_phys_shift always returns the number of
> supported
> > >>   IPA bits
> > >> - new patch "hw/arm/virt: Rename highmem IO regions" that eases the
> review
> > >>   of "hw/arm/virt: Split the memory map description"
> > >> - "hw/arm/virt: Move memory map initialization into machvirt_init"
> > >>   squashed into the previous patch
> > >> - change alignment of IO regions beyond the RAM so that it matches t=
heir
> > >>   size
> > >>
> > >> v4 -> v5:
> > >> - change in the memory map
> > >> - see individual logs
> > >>
> > >> v3 -> v4:
> > >> - rebase on David's "pc-dimm: next bunch of cleanups" and
> > >>   "pc-dimm: pre_plug "slot" and "addr" assignment"
> > >> - kvm-type option not used anymore. We directly use
> > >>   maxram_size and ram_size machine fields to compute the
> > >>   MAX IPA range. Migration is naturally handled as CLI
> > >>   option are kept between source and destination. This was
> > >>   suggested by David.
> > >> - device_memory_start and device_memory_size not stored
> > >>   anymore in vms->bootinfo
> > >> - I did not take into account 2 Igor's comments: the one
> > >>   related to the refactoring of arm_load_dtb and the one
> > >>   related to the generation of the dtb after system_reset
> > >>   which would contain nodes of hotplugged devices (we do
> > >>   not support hotplug at this stage)
> > >> - check the end-user does not attempt to hotplug a device
> > >> - addition of "vl: Set machine ram_size, maxram_size and
> > >>   ram_slots earlier"
> > >>
> > >> v2 -> v3:
> > >> - fix pc_q35 and pc_piix compilation error
> > >> - kwangwoo's email being not valid anymore, remove his address
> > >>
> > >> v1 -> v2:
> > >> - kvm_get_max_vm_phys_shift moved in arch specific file
> > >> - addition of NVDIMM part
> > >> - single series
> > >> - rebase on David's refactoring
> > >>
> > >> v1:
> > >> - was "[RFC 0/6] KVM/ARM: Dynamic and larger GPA size"
> > >> - was "[RFC 0/5] ARM virt: Support PC-DIMM at 2TB"
> > >>
> > >> Best Regards
> > >>
> > >> Eric
> > >>
> > >>
> > >> Eric Auger (12):
> > >>   hw/arm/virt: Rename highmem IO regions
> > >>   hw/arm/virt: Split the memory map description
> > >>   hw/boards: Add a MachineState parameter to kvm_type callback
> > >>   kvm: add kvm_arm_get_max_vm_ipa_size
> > >>   vl: Set machine ram_size, maxram_size and ram_slots earlier
> > >>   hw/arm/virt: Dynamic memory map depending on RAM requirements
> > >>   hw/arm/virt: Implement kvm_type function for 4.0 machine
> > >>   hw/arm/virt: Bump the 255GB initial RAM limit
> > >>   hw/arm/virt: Add memory hotplug framework
> > >>   hw/arm/virt: Allocate device_memory
> > >>   hw/arm/boot: Expose the pmem nodes in the DT
> > >>   hw/arm/virt: Add nvdimm and nvdimm-persistence options
> > >>
> > >> Kwangwoo Lee (2):
> > >>   nvdimm: use configurable ACPI IO base and size
> > >>   hw/arm/virt: Add nvdimm hot-plug infrastructure
> > >>
> > >> Shameer Kolothum (3):
> > >>   hw/arm/boot: introduce fdt_add_memory_node helper
> > >>   hw/arm/boot: Expose the PC-DIMM nodes in the DT
> > >>   hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
> > >>
> > >>  accel/kvm/kvm-all.c             |   2 +-
> > >>  default-configs/arm-softmmu.mak |   4 +
> > >>  hw/acpi/nvdimm.c                |  31 ++-
> > >>  hw/arm/boot.c                   | 136 ++++++++++--
> > >>  hw/arm/virt-acpi-build.c        |  23 +-
> > >>  hw/arm/virt.c                   | 364
> ++++++++++++++++++++++++++++----
> > >>  hw/i386/pc_piix.c               |   6 +-
> > >>  hw/i386/pc_q35.c                |   6 +-
> > >>  hw/ppc/mac_newworld.c           |   3 +-
> > >>  hw/ppc/mac_oldworld.c           |   2 +-
> > >>  hw/ppc/spapr.c                  |   2 +-
> > >>  include/hw/arm/virt.h           |  24 ++-
> > >>  include/hw/boards.h             |   5 +-
> > >>  include/hw/mem/nvdimm.h         |   4 +
> > >>  target/arm/kvm.c                |  10 +
> > >>  target/arm/kvm_arm.h            |  13 ++
> > >>  vl.c                            |   6 +-
> > >>  17 files changed, 556 insertions(+), 85 deletions(-)
> > >>
> > >
> > >

