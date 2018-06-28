Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7140073wrq;
        Thu, 28 Jun 2018 01:12:23 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfXbXRlgLVIC4P40OkqJKjFLOArweVZ2wiUOUF6M6/9cZKXXysIoeXAIEmKOVKaqqpEaB1X
X-Received: by 2002:a37:a0c1:: with SMTP id j184-v6mr3953930qke.126.1530173543696;
        Thu, 28 Jun 2018 01:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530173543; cv=none;
        d=google.com; s=arc-20160816;
        b=b7MsFnzTr6jxDn47oWnzTd1Ob+JUuOzwWIjy1NhgfmgPG4BavbKzPleANU4pb2onUW
         bAxSZEXwRd7zA6ODnWde2ztxPvxE7WQ1z0Q/eHB/qL/NJV7q0CY2xk5wbCQ5yxaXfIVV
         9GdAhtTLO8GAW7OYIIbojBmbOJ82nj8fG2qReHBsttxJ1SQkoAqRFrhwzTvvXhectc0I
         pHzvO5un1k6KshgKgMeMLk+/xbbygKvAIyQpnRqIKbrJKDll828CgQaYyL/6+TLsA7EV
         HJWZHdJJj87ql/TWIqmCWLAOLtGE3VPymjYmifQ4Bnr553NwGH3HWz6ZmizdHIL9rQu+
         OV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=c2RodUbPWdgytNsYcyvlPmrDrtJhITg2iRGUu124KJ4=;
        b=HjGqBlVCNG0cIO8PoAiKRULVzC/vP2iir0K+b8jwBbbtjC+mp+WFvjkKXjAV2EEA8A
         WkFv1ZjRV9AQn/6dSmdN5DSZ6RRufxzQadI114I5yd5Br1QX6eNhNxEdWVewm+aqRAN5
         p/iNiGqOYdJtEjGuM+xqTC0b5Wl35HgyLY9nBhHj5+agUrq/PygvkO7zz++llgkUYRBy
         yIDaW+798GyiWpysG1ctsRHHOhjFBdypbE+VP71s9iMYIyBsdgVf5R0i4SfyEtMsDPEN
         NABJsMmpdBr7d70SPFQBb/AOQjWUT0Bx7aykNX7xoYmhYpwLXym2gjk7X7vQXQ3nrCdi
         Fp9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jmckw7O1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j26-v6si4115223qvj.26.2018.06.28.01.12.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 01:12:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jmckw7O1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYS2R-0005X7-72
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 04:12:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1fYS23-0005Wk-8z
	for qemu-devel@nongnu.org; Thu, 28 Jun 2018 04:12:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1fYS21-00029e-V9
	for qemu-devel@nongnu.org; Thu, 28 Jun 2018 04:11:59 -0400
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:42548)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1fYS21-00028n-ON
	for qemu-devel@nongnu.org; Thu, 28 Jun 2018 04:11:57 -0400
Received: by mail-io0-x241.google.com with SMTP id r24-v6so4381515ioh.9
	for <qemu-devel@nongnu.org>; Thu, 28 Jun 2018 01:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c2RodUbPWdgytNsYcyvlPmrDrtJhITg2iRGUu124KJ4=;
	b=Jmckw7O1oPfYZkrNf8993MPY47aDAwWrGshS0IujO4l5WRArh+XHojY9iKH5/Cre3K
	eT7ipIFdvD/+Wi3R6eRYPw1uUKMYC2urA+aFeVn80w/f/2mwNw4Hav4uAwRemS+AFqfz
	xAUjl62LHenVqHfJ+v2ecKkJYlsKpzrWITdAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c2RodUbPWdgytNsYcyvlPmrDrtJhITg2iRGUu124KJ4=;
	b=GQhV6zHHReTvTqdzutvaQ3/jlBvd205xJ42a7bWX24tbNVFPEGFpu5IzXfGBfxe0aI
	O6FhccsyMSuSl2lpinIv7EuJOsUMZ1JFPe5RxGB/9yb99JadbhZUVihDvalwb0L989FA
	146nInQj/qNYw/fkdf0MOcxoe4QRQznyo0LKu9w8e2RCSGOy1ji3E3xwvjkzWWCowl6P
	4mZfadMihVtLnYzMpECCOJAZT6atAXTKk+PEMDF1KcDLeD8apA0jSPHmgnktdZuOexDL
	WOiR+/7VQ7tBN83XvdT5ZqAFaA0prJ7P7KXSjTHbWQMllkct39Z1dc9tAEXpZ+THL6WR
	8iGg==
X-Gm-Message-State: APt69E0lLX/bOIrRcbbYh69Pu/W1hOLsRtixuZmf9wAXQLmOMIAX8WfL
	EzD5aiJITVDTKfxUEV5oArFBLRiqkCMichU4XIKo2w==
X-Received: by 2002:a6b:28c6:: with SMTP id
	o189-v6mr7598409ioo.149.1530173517083; 
	Thu, 28 Jun 2018 01:11:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a65a:0:0:0:0:0 with HTTP; Thu, 28 Jun 2018 01:11:56
	-0700 (PDT)
In-Reply-To: <20180627165616.34d36aaf@redhat.com>
References: <1530094388-607-1-git-send-email-hongbo.zhang@linaro.org>
	<20180627165616.34d36aaf@redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Thu, 28 Jun 2018 16:11:56 +0800
Message-ID: <CAHmQWvDAHmDvamC8tUF8JbLjbssAax+5Hza6S+w_go=YbM4wDA@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::241
Subject: Re: [Qemu-devel] [PATCH] hw/arm: Add SBSA machine type
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YMCOTAwdg9G9

On 27 June 2018 at 22:56, Igor Mammedov <imammedo@redhat.com> wrote:
> On Wed, 27 Jun 2018 18:13:08 +0800
> Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
>> This patch introduces a new Arm machine type 'SBSA' with features:
>>  - Based on legacy 'virt' machine type.
>>  - Newly designed memory map.
>>  - EL2 and EL3 are enabled by default.
>>  - AHCI controller attached to system bus, and then CDROM and hard disc
>>    can be added to it.
>>  - EHCI controller attached to system bus, with USB mouse and key board
>>    installed by default.
>>  - E1000 ethernet card on PCIE bus.
>>  - VGA display adaptor on PCIE bus.
>>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>>  - No virtio functions enabled, since this is to emulate real hardware.
> I'd drop all default (convenience) devices unless they are specified in SBSA,
> and make management explicitly provide needed devices on CLI.
>
Thanks for review.

I mentioned these default values because they are different from the
'virt' machine from which this sbsa machine derives. (sbsa has uart
too, it is same with 'virt' PL011).
Qemu implementation should has such default values, if the sbsa
machine does not offer them, they fallback to the parent machine's.
The parent 'virt' machine's default cpu type is cortext-a15, that is
not proper for a armv8 server, and its default memory is 128M, that is
not enough to load uefi, even 512M cannot either, so I set the sbsa
defualt minimal memory to 1G.

The core numbers, is a new default. Server is smp in common sense,
single core isn't like a server, so some even want to set to max
capability as default, but this isn't good either I think, because
gicv3 memory space in Qemu can even support more than 200 cores, that
is too much.
(gicv2 currently support 8 cores, but there are issues to boot smp for
both gicv2 and gicv3 now, it should be another thread)

>>
>> This is the prototype, more features can be added in futrue.
>>
>> Purpose of this is to have a standard QEMU platform for Arm firmware
>> developement etc. where the legacy machines cannot meets requirements.
>>
>> Arm Trusted Firmware and UEFI porting to this are done seperately.
>>
>> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>> ---
> [...]
>
>> @@ -94,6 +98,8 @@
>>
>>  #define PLATFORM_BUS_NUM_IRQS 64
>>
>> +#define SATA_NUM_PORTS 6
>> +
>>  /* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
>>   * RAM can go up to the 256GB mark, leaving 256GB of the physical
>>   * address space unallocated and free for future use between 256G and 512G.
>> @@ -168,6 +174,47 @@ static const int a15irqmap[] = {
>>      [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
>>  };
>>
>> +static const MemMapEntry sbsa_memmap[] = {
>> +    /* Space up to 0x8000000 is reserved for a boot ROM */
>> +    [VIRT_FLASH] =              {          0, 0x08000000 },
>> +    [VIRT_CPUPERIPHS] =         { 0x08000000, 0x00020000 },
>> +    /* GIC distributor and CPU interfaces sit inside the CPU peripheral space */
>> +    [VIRT_GIC_DIST] =           { 0x08000000, 0x00010000 },
>> +    [VIRT_GIC_CPU] =            { 0x08010000, 0x00010000 },
>> +    [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 },
>> +    /* The space in between here is reserved for GICv3 CPU/vCPU/HYP */
>> +    [VIRT_GIC_ITS] =            { 0x08080000, 0x00020000 },
>> +    /* This redistributor space allows up to 2*64kB*123 CPUs */
>> +    [VIRT_GIC_REDIST] =         { 0x080A0000, 0x00F60000 },
>> +    [VIRT_UART] =               { 0x09000000, 0x00001000 },
>> +    [VIRT_RTC] =                { 0x09010000, 0x00001000 },
>> +    [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
>> +    [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>> +    [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>> +    [VIRT_AHCI] =               { 0x09050000, 0x00010000 },
>> +    [VIRT_EHCI] =               { 0x09060000, 0x00010000 },
>> +    [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
>> +    [VIRT_SECURE_MEM] =         { 0x0e000000, 0x01000000 },
>> +    [VIRT_PCIE_MMIO] =          { 0x10000000, 0x7fff0000 },
>> +    [VIRT_PCIE_PIO] =           { 0x8fff0000, 0x00010000 },
>> +    [VIRT_PCIE_ECAM] =          { 0x90000000, 0x10000000 },
>> +    /* Second PCIe window, 508GB wide at the 4GB boundary */
>> +    [VIRT_PCIE_MMIO_HIGH] =     { 0x100000000ULL, 0x7F00000000ULL },
>> +    [VIRT_MEM] =                { 0x8000000000ULL, RAMLIMIT_BYTES },
> does spec require support for 32-bit guest or is it only 64bit,
> if the later I'd put it somewhere high where we can increase region
> to terrabytes.
>
Spec only requires it to be compliant with armv8.
Designed purpose of this is to run 64bit guests, because in practice
an arm server is usually 64bit.

> another idea that was floating around (considering we don't care about legacy)
> is to use flexible base address and tell firmware[*] via register where it's.
> Then it would be able to support 32 guest with small amount of RAM
> and 64 bit guests with huge amount of RAM using a single memory range.
> (to keep memory management simple). It's also future friendly, as in case
> if we need to move it we could do easily by changing base address for new machine
> type only and firmware would automatically pick it up from register
> (without all compat nightmare we have with 2 regions in pc/q35 machines).
>
> [*] When I've talked with Laszlo about it he said it was not easy to do in uefi
> but still possible.
Sounds not easy.
I think the first step is to get this merged, and then we can add more
features if necessary.
I've already seen some points in trusted firmware and uefi need to be fixed.

>
> same applies to GIG regions/mmio/ecam where we are twisting our hands when trying to
> increase number of things.
>
> [...]
>
