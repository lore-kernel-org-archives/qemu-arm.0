Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7180808wrq;
        Thu, 28 Jun 2018 02:04:38 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcvXzZAzU/LkWpu2pjpmdrEk5/FmEog1MMFxbUdJ04lqUJf+8EpfVtOIhIVg7J/E/WajbkE
X-Received: by 2002:a0c:e987:: with SMTP id z7-v6mr8320471qvn.202.1530176678301;
        Thu, 28 Jun 2018 02:04:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530176678; cv=none;
        d=google.com; s=arc-20160816;
        b=Sq1iMcj3p6HIBPPALvePBV78TZaFdT19C2BxxeaV5wJoOp6I7L/MwzYEBaERSZvOb8
         fYOszaDJ7VeRGqFZdNhivLQaxzzRy2MUuZWplpN0dyZGfeTwJenEJ7uOyBdsEbGaDWzQ
         kMR6ERYMAaS6AZWqZmF6Ws0sBPToeDhhVRSVi/7H9wrpc/mG6juwYZPWrXnwr+ONiGdM
         DmACk7+VORamSxQacT7GtGoj5dcbBQHBfodDwDe6KZXe8U8nf3UK4x/20BgA2P3n7phO
         qF6BoXFrh7XZpyAXVJIO24BIt5UXmyT9oFB1xhf1+3Zye4JMpahHnYFhmSVxva+YiC8c
         VMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=bYcFr+1tqQfIbVyu/55khTLRcIu9tp0UJJT54vple9M=;
        b=o2ugm02QJ5C6+6PTDayHK1A8gfD1sgiOk+wv96Oiwit6NNnw040ndI2P1Xjw8MFdFW
         XcHztoa9ddQYA75uzLXexrDbcLQxEMQ5wDlR+3gXrzh5ggTpK5Vnp4XpEh+kAkkfIFRn
         DscpQifc7uYRCMMmowSY6A41DnjN4DEZP1SoDBUI+hNdqa7dw9Dtpu8UZe4Gw2mWZ1ok
         QkLyMvZ6vDJANu5CnMAo+QEekGgwaPgkaFMmFhaFivwvz1/44RCzgBK8P0CE7jLTTdT4
         tFapjmoGkeRtbR2+4PaQr8pXxWFHQ08kIPF22WbHkw/S7oOHF7lXIgzbQ0+U4z3EqoCH
         Ha7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q97-v6si2372042qkq.350.2018.06.28.02.04.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 02:04:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35151 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYSqz-0001zt-T3
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 05:04:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fYSqn-0001zU-NC
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 05:04:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fYSqi-0004EF-Cf
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 05:04:25 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35012 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fYSqi-0004DU-4a; Thu, 28 Jun 2018 05:04:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E354B738E0;
	Thu, 28 Jun 2018 09:04:18 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4147213ED6A;
	Thu, 28 Jun 2018 09:04:17 +0000 (UTC)
Date: Thu, 28 Jun 2018 11:04:15 +0200
From: Andrew Jones <drjones@redhat.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Message-ID: <20180628090415.lysdgq66x5kkgq3x@kamzik.brq.redhat.com>
References: <1530094388-607-1-git-send-email-hongbo.zhang@linaro.org>
	<20180627165616.34d36aaf@redhat.com>
	<CAHmQWvDAHmDvamC8tUF8JbLjbssAax+5Hza6S+w_go=YbM4wDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmQWvDAHmDvamC8tUF8JbLjbssAax+5Hza6S+w_go=YbM4wDA@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 28 Jun 2018 09:04:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 28 Jun 2018 09:04:18 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
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
X-TUID: Q/TlY7SmoAAr

On Thu, Jun 28, 2018 at 04:11:56PM +0800, Hongbo Zhang wrote:
> On 27 June 2018 at 22:56, Igor Mammedov <imammedo@redhat.com> wrote:
> > On Wed, 27 Jun 2018 18:13:08 +0800
> > Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >
> >> This patch introduces a new Arm machine type 'SBSA' with features:
> >>  - Based on legacy 'virt' machine type.
> >>  - Newly designed memory map.
> >>  - EL2 and EL3 are enabled by default.
> >>  - AHCI controller attached to system bus, and then CDROM and hard disc
> >>    can be added to it.
> >>  - EHCI controller attached to system bus, with USB mouse and key board
> >>    installed by default.
> >>  - E1000 ethernet card on PCIE bus.
> >>  - VGA display adaptor on PCIE bus.
> >>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
> >>  - No virtio functions enabled, since this is to emulate real hardware.
> > I'd drop all default (convenience) devices unless they are specified in SBSA,
> > and make management explicitly provide needed devices on CLI.
> >
> Thanks for review.
> 
> I mentioned these default values because they are different from the
> 'virt' machine from which this sbsa machine derives. (sbsa has uart
> too, it is same with 'virt' PL011).
> Qemu implementation should has such default values, if the sbsa
> machine does not offer them, they fallback to the parent machine's.

QEMU's default devices is one of the problems with QEMU. Any serious
use of QEMU must be done with '-nodefaults' and then explicit devices.
To avoid requiring long command lines QEMU supports '-readconfig'. We
already have two mach-virt configs that can be used as a basis for a
new SBSA config. See docs/config/mach-virt-graphical.cfg and
docs/config/mach-virt-serial.cfg.

> The parent 'virt' machine's default cpu type is cortext-a15, that is
> not proper for a armv8 server, and its default memory is 128M, that is
> not enough to load uefi, even 512M cannot either, so I set the sbsa
> defualt minimal memory to 1G.

config files support setting a memory size, but unfortunately not the
CPU type. I'm not sure why it doesn't. Maybe readconfig can be taught
to do so?

> 
> The core numbers, is a new default. Server is smp in common sense,
> single core isn't like a server, so some even want to set to max
> capability as default, but this isn't good either I think, because
> gicv3 memory space in Qemu can even support more than 200 cores, that
> is too much.

Core numbers can be managed with config
[smp-opts]
  cpus = "4"

> (gicv2 currently support 8 cores, but there are issues to boot smp for
> both gicv2 and gicv3 now, it should be another thread)
> 
> >>
> >> This is the prototype, more features can be added in futrue.
> >>
> >> Purpose of this is to have a standard QEMU platform for Arm firmware
> >> developement etc. where the legacy machines cannot meets requirements.
> >>
> >> Arm Trusted Firmware and UEFI porting to this are done seperately.
> >>
> >> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> >> ---
> > [...]
> >
> >> @@ -94,6 +98,8 @@
> >>
> >>  #define PLATFORM_BUS_NUM_IRQS 64
> >>
> >> +#define SATA_NUM_PORTS 6
> >> +
> >>  /* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
> >>   * RAM can go up to the 256GB mark, leaving 256GB of the physical
> >>   * address space unallocated and free for future use between 256G and 512G.
> >> @@ -168,6 +174,47 @@ static const int a15irqmap[] = {
> >>      [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
> >>  };
> >>
> >> +static const MemMapEntry sbsa_memmap[] = {
> >> +    /* Space up to 0x8000000 is reserved for a boot ROM */
> >> +    [VIRT_FLASH] =              {          0, 0x08000000 },
> >> +    [VIRT_CPUPERIPHS] =         { 0x08000000, 0x00020000 },
> >> +    /* GIC distributor and CPU interfaces sit inside the CPU peripheral space */
> >> +    [VIRT_GIC_DIST] =           { 0x08000000, 0x00010000 },
> >> +    [VIRT_GIC_CPU] =            { 0x08010000, 0x00010000 },
> >> +    [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 },
> >> +    /* The space in between here is reserved for GICv3 CPU/vCPU/HYP */
> >> +    [VIRT_GIC_ITS] =            { 0x08080000, 0x00020000 },
> >> +    /* This redistributor space allows up to 2*64kB*123 CPUs */
> >> +    [VIRT_GIC_REDIST] =         { 0x080A0000, 0x00F60000 },
> >> +    [VIRT_UART] =               { 0x09000000, 0x00001000 },
> >> +    [VIRT_RTC] =                { 0x09010000, 0x00001000 },
> >> +    [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
> >> +    [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
> >> +    [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
> >> +    [VIRT_AHCI] =               { 0x09050000, 0x00010000 },
> >> +    [VIRT_EHCI] =               { 0x09060000, 0x00010000 },
> >> +    [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> >> +    [VIRT_SECURE_MEM] =         { 0x0e000000, 0x01000000 },
> >> +    [VIRT_PCIE_MMIO] =          { 0x10000000, 0x7fff0000 },
> >> +    [VIRT_PCIE_PIO] =           { 0x8fff0000, 0x00010000 },
> >> +    [VIRT_PCIE_ECAM] =          { 0x90000000, 0x10000000 },
> >> +    /* Second PCIe window, 508GB wide at the 4GB boundary */
> >> +    [VIRT_PCIE_MMIO_HIGH] =     { 0x100000000ULL, 0x7F00000000ULL },
> >> +    [VIRT_MEM] =                { 0x8000000000ULL, RAMLIMIT_BYTES },
> > does spec require support for 32-bit guest or is it only 64bit,
> > if the later I'd put it somewhere high where we can increase region
> > to terrabytes.
> >
> Spec only requires it to be compliant with armv8.
> Designed purpose of this is to run 64bit guests, because in practice
> an arm server is usually 64bit.

I agree with Igor that if we're going to add a new machine type that is
only for 64bit, then we shouldn't base our memory map on mach-virt's,
but rather create a new one taking advantage of a much larger address
space. Firmware would need to start taking the base of RAM from the
DTB, and the address of the DTB from x0, but it probably should anyway.

> 
> > another idea that was floating around (considering we don't care about legacy)
> > is to use flexible base address and tell firmware[*] via register where it's.
> > Then it would be able to support 32 guest with small amount of RAM
> > and 64 bit guests with huge amount of RAM using a single memory range.
> > (to keep memory management simple). It's also future friendly, as in case
> > if we need to move it we could do easily by changing base address for new machine
> > type only and firmware would automatically pick it up from register
> > (without all compat nightmare we have with 2 regions in pc/q35 machines).
> >
> > [*] When I've talked with Laszlo about it he said it was not easy to do in uefi
> > but still possible.
> Sounds not easy.
> I think the first step is to get this merged, and then we can add more
> features if necessary.
> I've already seen some points in trusted firmware and uefi need to be fixed.

It sounds to me like the current mach-virt machine type, with an SBSA
readconfig file would be sufficient for now, and that we should only
merge a new machine type when firmware supports a dynamic RAM base,
allowing the new machine type to have quite a different memory map.

> 
> >
> > same applies to GIG regions/mmio/ecam where we are twisting our hands when trying to
> > increase number of things.
> >
> > [...]
> >
>

Thanks,
drew 
