Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp241283wrq;
        Thu, 28 Jun 2018 20:18:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcz4T5dul5Fz/qkT2hoQXQntLMp7v3YpyvapN27+3qgMdPxeteNWudVGiSwPi7kx4Tvx3ev
X-Received: by 2002:aed:2193:: with SMTP id l19-v6mr5027815qtc.116.1530242296998;
        Thu, 28 Jun 2018 20:18:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530242296; cv=none;
        d=google.com; s=arc-20160816;
        b=CvfvoNRkaY0x1hIFU0XJ/bvk19Kky39aWYMTIf2g0KyJWsY8exTiWLbXsaG72yxZGI
         pSySjeiTAT6I+SJoxlx1Q4ZIm5mtNf1DcVApQMoVmsOnf66UGf6Indx+DHjF1Moh6w1+
         wthTi6Z8lMPMhasm3lj1jTfcJxanNqcM8XC6qC6bvcn1hktq5MxXE7pUJnGzGvnFhXyn
         mwL9k0HZdZb8ddD3QwmwtmDZN/MK8w8eILV0Ht6QzYKpwG7/qmGIpdZZ0rtnDaL0u9zA
         dn3TXCoECNYigYNYTpb70SfTiSl+IOUeMiXo5puI0hQO4L+gGgONmVkSdCUlebfzUj2s
         FKyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=OLUC/XTYq4XUS4VzBKTeUx7os6wCCVEWZHglrW73+SI=;
        b=cKCc+qI3QlgT+8eVvh1aZYvvExKULUIhmEJR0T4dkr2iHWBHuYUtb41KKCr/aKc4Ph
         a7P8kHvGPSpSdmO8CQYPhtsVHz8K+AQxvDJxA0AjgSQIlohwfKmgGmiDjn+/ZvNGKNmq
         7N3LKGgIboqH00kurBnQ+JmqhdiyzRxTlP3CluF2QQ7ZD1Asb99YJHx1pMb06AnkCgf2
         X5D2W2g810cy0C2IBAR2UhXos0DpBoVYiegLLzIcbG72+ZkKamIgz1XGCY3hxW4EMmC+
         KWUqVwD3dxKSTUC+LYlAf7wx3LswWQplu5VAHt5d6/6AoUHI4utZOtPjStJKuw4jGTAV
         hiAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D9xIBZVR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m38-v6si673308qtb.84.2018.06.28.20.18.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 20:18:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D9xIBZVR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39609 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYjvM-0000aa-Gx
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 23:18:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1fYjv8-0000aD-Vq
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 23:18:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1fYjv6-0004zu-Ng
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 23:18:02 -0400
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:35600)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1fYjv6-0004yO-9A
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 23:18:00 -0400
Received: by mail-io0-x241.google.com with SMTP id q4-v6so7181473iob.2
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 20:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OLUC/XTYq4XUS4VzBKTeUx7os6wCCVEWZHglrW73+SI=;
	b=D9xIBZVR7t2z1wHBMWU3BtVBo4kdNNfM8C7DsNfv0MB6zcoLCwEjBhZfcajy5I5mmf
	3Q/rkFmBCckMzAQNRvFYBWiv1745/TwCWxl9RvNP4mDYAa00W0r9PY7U4eUBRg4pn2hK
	Wmgk34+knwi2+8d1eoNzAk0fX1q12NzI7oohA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OLUC/XTYq4XUS4VzBKTeUx7os6wCCVEWZHglrW73+SI=;
	b=pLk/gjyLwCyGZ8mb9lckjUmMdTkhbWJbLDowYRySZQEWbbq0DxhDTof1FIHjlwAD9T
	YU4JG34gs68RUSQctYR0k53VBmlCHrmralq20+OU5jH3Ekan5xnalm/mJDgr2GracT1i
	8z6whxiT46+gxl8a8hwFPi4T7IUgJBRc33AL5eAK0cMiwj9c4YMbRSHMxK1qRyC+1okp
	Ml1oCcQ3FdtHI5RsoWi5BZR73VvHnnLfsGEyOV+kMVjXFdV8Z+3jSaN/7bd2Qn0ragtk
	UsJlL5fX9X7/mBGLL11a/StCRQx69CR8L+tV8gSNgkMbkqdYUa5wefXhaYsFdsCGhMfw
	5r8Q==
X-Gm-Message-State: APt69E2ue/2K04bhHjWrIfYLW+TtVjUff/F5u2wNfXanGxkbW6vXkrQe
	slAST1rw70uoIPFk6iw0VDCI6RHSM1eBAS2IdiLHhw==
X-Received: by 2002:a6b:ba82:: with SMTP id
	k124-v6mr10069351iof.94.1530242279415; 
	Thu, 28 Jun 2018 20:17:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a65a:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 20:17:58
	-0700 (PDT)
In-Reply-To: <20180628113615.ml3t5xvxdftowsgj@kamzik.brq.redhat.com>
References: <1530094388-607-1-git-send-email-hongbo.zhang@linaro.org>
	<20180627165616.34d36aaf@redhat.com>
	<CAHmQWvDAHmDvamC8tUF8JbLjbssAax+5Hza6S+w_go=YbM4wDA@mail.gmail.com>
	<20180628090415.lysdgq66x5kkgq3x@kamzik.brq.redhat.com>
	<CAHmQWvCmdOt-Bq3sM8SUgB4-tgwKKLhTBBP+d0-vBWfaT=2pLA@mail.gmail.com>
	<20180628113615.ml3t5xvxdftowsgj@kamzik.brq.redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Fri, 29 Jun 2018 11:17:58 +0800
Message-ID: <CAHmQWvC_TsgJsaGuiZBjYM=qzpwGThvyp1BTsaVEWewFiP7DMg@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm: Add SBSA machine type
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: loIBEy2/jTDH

On 28 June 2018 at 19:36, Andrew Jones <drjones@redhat.com> wrote:
> On Thu, Jun 28, 2018 at 06:13:28PM +0800, Hongbo Zhang wrote:
>> On 28 June 2018 at 17:04, Andrew Jones <drjones@redhat.com> wrote:
>> > On Thu, Jun 28, 2018 at 04:11:56PM +0800, Hongbo Zhang wrote:
>> >> On 27 June 2018 at 22:56, Igor Mammedov <imammedo@redhat.com> wrote:
>> >> > On Wed, 27 Jun 2018 18:13:08 +0800
>> >> > Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> >> >
>> >> >> This patch introduces a new Arm machine type 'SBSA' with features:
>> >> >>  - Based on legacy 'virt' machine type.
>> >> >>  - Newly designed memory map.
>> >> >>  - EL2 and EL3 are enabled by default.
>> >> >>  - AHCI controller attached to system bus, and then CDROM and hard disc
>> >> >>    can be added to it.
>> >> >>  - EHCI controller attached to system bus, with USB mouse and key board
>> >> >>    installed by default.
>> >> >>  - E1000 ethernet card on PCIE bus.
>> >> >>  - VGA display adaptor on PCIE bus.
>> >> >>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>> >> >>  - No virtio functions enabled, since this is to emulate real hardware.
>> >> > I'd drop all default (convenience) devices unless they are specified in SBSA,
>> >> > and make management explicitly provide needed devices on CLI.
>> >> >
>> >> Thanks for review.
>> >>
>> >> I mentioned these default values because they are different from the
>> >> 'virt' machine from which this sbsa machine derives. (sbsa has uart
>> >> too, it is same with 'virt' PL011).
>> >> Qemu implementation should has such default values, if the sbsa
>> >> machine does not offer them, they fallback to the parent machine's.
>> >
>> > QEMU's default devices is one of the problems with QEMU. Any serious
>> > use of QEMU must be done with '-nodefaults' and then explicit devices.
>> > To avoid requiring long command lines QEMU supports '-readconfig'. We
>> > already have two mach-virt configs that can be used as a basis for a
>> > new SBSA config. See docs/config/mach-virt-graphical.cfg and
>> > docs/config/mach-virt-serial.cfg.
>> >
>> When Linaro members discussed the target, some of them want this can
>> be used easily and simply "qemu -bios xxx -hda yyy", just like the
>> typical x86 machines, that is another reason I set default values.
>>
>> >> The parent 'virt' machine's default cpu type is cortext-a15, that is
>> >> not proper for a armv8 server, and its default memory is 128M, that is
>> >> not enough to load uefi, even 512M cannot either, so I set the sbsa
>> >> defualt minimal memory to 1G.
>> >
>> > config files support setting a memory size, but unfortunately not the
>> > CPU type. I'm not sure why it doesn't. Maybe readconfig can be taught
>> > to do so?
>> >
>> >>
>> >> The core numbers, is a new default. Server is smp in common sense,
>> >> single core isn't like a server, so some even want to set to max
>> >> capability as default, but this isn't good either I think, because
>> >> gicv3 memory space in Qemu can even support more than 200 cores, that
>> >> is too much.
>> >
>> > Core numbers can be managed with config
>> > [smp-opts]
>> >   cpus = "4"
>> >
>> >> (gicv2 currently support 8 cores, but there are issues to boot smp for
>> >> both gicv2 and gicv3 now, it should be another thread)
>> >>
>> >> >>
>> >> >> This is the prototype, more features can be added in futrue.
>> >> >>
>> >> >> Purpose of this is to have a standard QEMU platform for Arm firmware
>> >> >> developement etc. where the legacy machines cannot meets requirements.
>> >> >>
>> >> >> Arm Trusted Firmware and UEFI porting to this are done seperately.
>> >> >>
>> >> >> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>> >> >> ---
>> >> > [...]
>> >> >
>> >> >> @@ -94,6 +98,8 @@
>> >> >>
>> >> >>  #define PLATFORM_BUS_NUM_IRQS 64
>> >> >>
>> >> >> +#define SATA_NUM_PORTS 6
>> >> >> +
>> >> >>  /* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
>> >> >>   * RAM can go up to the 256GB mark, leaving 256GB of the physical
>> >> >>   * address space unallocated and free for future use between 256G and 512G.
>> >> >> @@ -168,6 +174,47 @@ static const int a15irqmap[] = {
>> >> >>      [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
>> >> >>  };
>> >> >>
>> >> >> +static const MemMapEntry sbsa_memmap[] = {
>> >> >> +    /* Space up to 0x8000000 is reserved for a boot ROM */
>> >> >> +    [VIRT_FLASH] =              {          0, 0x08000000 },
>> >> >> +    [VIRT_CPUPERIPHS] =         { 0x08000000, 0x00020000 },
>> >> >> +    /* GIC distributor and CPU interfaces sit inside the CPU peripheral space */
>> >> >> +    [VIRT_GIC_DIST] =           { 0x08000000, 0x00010000 },
>> >> >> +    [VIRT_GIC_CPU] =            { 0x08010000, 0x00010000 },
>> >> >> +    [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 },
>> >> >> +    /* The space in between here is reserved for GICv3 CPU/vCPU/HYP */
>> >> >> +    [VIRT_GIC_ITS] =            { 0x08080000, 0x00020000 },
>> >> >> +    /* This redistributor space allows up to 2*64kB*123 CPUs */
>> >> >> +    [VIRT_GIC_REDIST] =         { 0x080A0000, 0x00F60000 },
>> >> >> +    [VIRT_UART] =               { 0x09000000, 0x00001000 },
>> >> >> +    [VIRT_RTC] =                { 0x09010000, 0x00001000 },
>> >> >> +    [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
>> >> >> +    [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>> >> >> +    [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>> >> >> +    [VIRT_AHCI] =               { 0x09050000, 0x00010000 },
>> >> >> +    [VIRT_EHCI] =               { 0x09060000, 0x00010000 },
>> >> >> +    [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
>> >> >> +    [VIRT_SECURE_MEM] =         { 0x0e000000, 0x01000000 },
>> >> >> +    [VIRT_PCIE_MMIO] =          { 0x10000000, 0x7fff0000 },
>> >> >> +    [VIRT_PCIE_PIO] =           { 0x8fff0000, 0x00010000 },
>> >> >> +    [VIRT_PCIE_ECAM] =          { 0x90000000, 0x10000000 },
>> >> >> +    /* Second PCIe window, 508GB wide at the 4GB boundary */
>> >> >> +    [VIRT_PCIE_MMIO_HIGH] =     { 0x100000000ULL, 0x7F00000000ULL },
>> >> >> +    [VIRT_MEM] =                { 0x8000000000ULL, RAMLIMIT_BYTES },
>> >> > does spec require support for 32-bit guest or is it only 64bit,
>> >> > if the later I'd put it somewhere high where we can increase region
>> >> > to terrabytes.
>> >> >
>> >> Spec only requires it to be compliant with armv8.
>> >> Designed purpose of this is to run 64bit guests, because in practice
>> >> an arm server is usually 64bit.
>> >
>> > I agree with Igor that if we're going to add a new machine type that is
>> > only for 64bit, then we shouldn't base our memory map on mach-virt's,
>> > but rather create a new one taking advantage of a much larger address
>> > space. Firmware would need to start taking the base of RAM from the
>> > DTB, and the address of the DTB from x0, but it probably should anyway.
>> >
>> >>
>> >> > another idea that was floating around (considering we don't care about legacy)
>> >> > is to use flexible base address and tell firmware[*] via register where it's.
>> >> > Then it would be able to support 32 guest with small amount of RAM
>> >> > and 64 bit guests with huge amount of RAM using a single memory range.
>> >> > (to keep memory management simple). It's also future friendly, as in case
>> >> > if we need to move it we could do easily by changing base address for new machine
>> >> > type only and firmware would automatically pick it up from register
>> >> > (without all compat nightmare we have with 2 regions in pc/q35 machines).
>> >> >
>> >> > [*] When I've talked with Laszlo about it he said it was not easy to do in uefi
>> >> > but still possible.
>> >> Sounds not easy.
>> >> I think the first step is to get this merged, and then we can add more
>> >> features if necessary.
>> >> I've already seen some points in trusted firmware and uefi need to be fixed.
>> >
>> > It sounds to me like the current mach-virt machine type, with an SBSA
>> > readconfig file would be sufficient for now, and that we should only
>> > merge a new machine type when firmware supports a dynamic RAM base,
>> > allowing the new machine type to have quite a different memory map.
>> >
>> Had a quick look at readconfig, it seems it cannot satisfy the SBSA design.
>>
>> The SBSA has EHCI and AHCI on the top level, eg so called system bus
>> in the Arm system, that is the case in real hardware.
>> If we use readconfig, they should appear at PCIE bus, that is not the
>> case we want.
>
> SBSA doesn't even require EHCI or AHCI, afaict, so the decision to have
> them on the system bus must have a different rationale. Can you please
> share it? Also, when making that decision were other operating systems
> (Windows) considered?
>
Well, during the development stage, two names were used: Enterprise
and SBSA. I was hesitating to decide which one is better.
Now I know the Enterprise is better, because what we want is a
standard armv8 platform as a base of firmware and software
development. For armv7, there is vexpress acts as such role, but for
armv8, there is no such platform, 'virt' is really a virtual one, no
real hard ware is like that, we want a qemu platform similar as real
armv8 hardware, we want fw/sw developed on this platform can be easily
run on real hardware when it is ready, we want can be used as simple
as typical x86 "qemu -bios -hda" if no specific requirements needed.
But when term SBSA is used here, people may pay much attention to
details of SBSA spec itself, that is not we want, we may want some
part of it, but not fully compliant with it. SBSA spec described much
requirements on CPU cores, and the armv8 emulation in Qemu is already
there, my Enterprise/SBSA platform doesn't touch it at all.
So I am considering giving up name SBSA, reuse name Enterprise.

As to OS, Windows isn't considered yet. I've tested Debian official arm release.

> Anyway, I believe with some work you should be able to modify the platform
> bus code to allow them to be specified on the command line and still show
> up on the system bus.
>
>> And when people start to use this, I think more features will be added in.
>>
>> "firmware supports a dynamic RAM base", -- this need to be done, but
>> other porting on this platform have been done, initial idea is to have
>> a SBSA prototype first, and firmware later, and then further usage,
>> such as CCIX development, can be done on this platform at last.
>
> The firmware has no reason to change if the base of RAM matches mach-virt.
> To me, it seems this machine model and the firmware change should be done
> together.
>
Oops, it was my misunderstand, I though "firmware supports a dynamic
RAM base" is new feature and requirement, it is not, we've already use
it.

Firmware need some changes, for new peripherals, new memory map, and
some SBSA requirement for example GIVv3(after level2)
Firmware is ready, will be upstreamed soon:
https://git.linaro.org/people/hongbo.zhang/atf-sbsa.git/log/?h=sbsa_gicv3
https://git.linaro.org/people/radoslaw.biernacki/atf.git/log/?h=sbsa12
https://git.linaro.org/people/radoslaw.biernacki/edk2.git/


> Thanks,
> drew
>
>>
>> >>
>> >> >
>> >> > same applies to GIG regions/mmio/ecam where we are twisting our hands when trying to
>> >> > increase number of things.
>> >> >
>> >> > [...]
>> >> >
>> >>
>> >
>> > Thanks,
>> > drew
>>
