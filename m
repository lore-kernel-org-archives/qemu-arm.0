Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp262551wrw;
        Fri, 16 Nov 2018 03:29:48 -0800 (PST)
X-Received: by 2002:a9d:11f7:: with SMTP id y52mr6320326oty.332.1542367788350;
        Fri, 16 Nov 2018 03:29:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542367788; cv=none;
        d=google.com; s=arc-20160816;
        b=ZcRV9Y9agFCVWA4kZGF2dPesFDU7dcsfhbijTFnEWBaKJ/1z4YYlGA011NAwZrP921
         CIOdMnc0AqtNw4J1idDLh/CyndUXb3ptERi3snMJS/y+CcOwGNVBxtnr1kIrTvmxqF/8
         epelXuf5GaXn+3cNLi2T0m28b+PK9da5gRlLVX2xMUk179rHA30RR/vfetKGKosP/i3y
         bn1eVcLHQYFQWTZkxA2TYSU6DXAZE1PKvAUsv0YVeMGbiCoUadIMgXpIRReWQosTheji
         MWKdSbmHO2f3RCcYZqlppDemRPdBlvIV2ux63YkF3C5oAcxEeckoErspbWl+IaU+Qx4J
         mwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=DRlzpMoLM2v6Iw4CrCabHyf+j8Xzt7cxUbRau7FK8zM=;
        b=GaEnRkiqHtrTzDfafZ+QqZHLl8s/ktkLtKz6vRfWAuqr9hFoPXJCcbtqkce49Jec1c
         QG9A4twa8I0cnsUTs2KC9EUgO4KVeSHe2C19SzEc/nr91nTBnCW/CGRHnrNBQoB0NXtG
         wguvbQqPznAQNMYgrJqvfljmSqCZRWGh1OzZ06WWH/004tAbjXsCXvqKGdGyt34dwLnW
         SJUbxpFPaIVeArAJWN4EgK9TTPj/Xh7CGm73ikctkdzSCSU0rk/kDVqaXiCfF3itytwR
         utMVd+1yU8WNtqvC/3NGMHfmBGw2fnYouLIgxNIB9BWFc3ILYuBHzL5sAFC5mWUlqx13
         E4eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xq62t54A;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k186-v6sor15281514oif.31.2018.11.16.03.29.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Nov 2018 03:29:48 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xq62t54A;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=DRlzpMoLM2v6Iw4CrCabHyf+j8Xzt7cxUbRau7FK8zM=;
        b=Xq62t54Ae6d9+OCu1B6I088Z6oUY6g/TfEaCSoo4PaHNMmpAdZeShI+4aXuSMLvPeF
         nFz2b1qhNRp1UdumizqHn/Z/f86hzQpTH9KMTGjAqXV+DioGbZqF6i7jqOU4UoPgr9/0
         H7M0DDxfo0SFkXr84dGPEZJIvIkV+H9P11HX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=DRlzpMoLM2v6Iw4CrCabHyf+j8Xzt7cxUbRau7FK8zM=;
        b=aJKtte76W48H5/xUGD0SnJwludNFboqioeD5tkOtHNw14PEJTvlVkP/RwK8P8DZNOP
         is2QxD2oCZpZgIe1mhNgcQZYIkX5f+JbdMk7+psO+cY2rsHOy0SdG96mCSlBiEMsJI9j
         i96lxd1AnAxw+ux4Kfb+L+L/Dai2x5aO8gBtOet5WxMRxbtfSbmyMQ2Lwj4KzOac06Am
         MkZ8dMevbkCit+0ZpqD5rY7zWz0uWywdOaowFdPkL8fK6XvlVFV73AwYXWiMVdazpJNG
         40wQpvKRLOA2nD0nQEe9Dzi/Ue9tVPQ2EnGE/G+5Xo6B2Z5DACoL/bxtZki8EI0W8+cZ
         Eyaw==
X-Gm-Message-State: AGRZ1gJgMkMaY9US/yHmZMAmw2hVJf8HU7jEi/mpgu5maOChbWh8n2Df
	7dyEe8H77mWyrtsJim4ZxpdeW3T9ZgUDtwn0dvaLigU3
X-Google-Smtp-Source: AJdET5flVAkdl1uuL3ZC6Fhf8wjfVyau+DgMTVBGE0ywm3UImWA2UU3MMk3Ly/9V/LmCwbLc040jGa4jEENPBqCZ2Bw=
X-Received: by 2002:aca:ed92:: with SMTP id l140mr700246oih.112.1542367787948;
 Fri, 16 Nov 2018 03:29:47 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Fri, 16 Nov 2018 03:29:27
 -0800 (PST)
In-Reply-To: <CAHmQWvD1ocAfZo=9aJYeuVDWrBk=AF_D-AgHriYb3-7=n+rR6A@mail.gmail.com>
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com> <CAHmQWvD1ocAfZo=9aJYeuVDWrBk=AF_D-AgHriYb3-7=n+rR6A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Nov 2018 11:29:27 +0000
Message-ID: <CAFEAcA_a-YMNaGtPPn+8DBFmx4xGYCkuybMck_Wquw6zmLTbCQ@mail.gmail.com>
Subject: Re: [PATCH v4] hw/arm: Add arm SBSA reference machine
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: XG74PWuAvWak

On 16 November 2018 at 10:46, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> On Fri, 16 Nov 2018 at 00:05, Peter Maydell <peter.maydell@linaro.org> wrote:
>> If after you've done that this patch is still more than
>> about 500 lines long, I would recommend that you split it
>> up into coherent pieces, to make it easier to review.

> I think however I re-work this file, it is still more than 500 lines.
> If split it, then how? one for most basic skeleton, including memory
> map, class and instance init etc, and another adding peripheral
> devices, like pcie etc?

Yes, that's a reasonable split.

>> This is still generating a lot of device tree nodes.
>> I thought we had agreed that we were going to just have
>> a minimal device tree that says "here is the RAM" and nothing
>> else ?
>>
> If I remember correct, it was not only the RAM, but also the CPUs
> because it depends on the command parameters dynamically, and also the
> GIC as well since it depends on the CPU number.
> And should NUMA info if used, be added to DT?
> And by the way, I didn't find the RAM size info in the DT.

You should include the absolute minimum you need that you
cannot either say "we know what this value is because we
know the board" or probe for anyway. I think that is basically
ram inf and number of CPUs. (Ram size and numa configuration
is added to the dtb by the hw/arm/boot.c code, which sets up
the "/memory" nodes.)

You shouldn't need to put the GIC info into the DT, because
you can just hard code into UEFI where it is in memory.

>> > +static void create_ehci(const VirtMachineState *vms, qemu_irq *pic)
>> > +{
>> > +    hwaddr base = vms->memmap[VIRT_EHCI].base;
>> > +    int irq = vms->irqmap[VIRT_EHCI];
>> > +    USBBus *usb_bus;
>> > +
>> > +    sysbus_create_simple("exynos4210-ehci-usb", base, pic[irq]);
>>
>> What is this using the exynos4210 USB device for? That
>> is definitely not correct for a generic board.
>>
> Checked the code:
> #define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
> #define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
> #define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
> #define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
> #define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
>
> The first one seems only a parent type, not a general instance, cannot
> be used directly.
> The other four are specific instances using the first as parent type,
> one of them can be chosen to use.
> That is my understanding, any comments, or do we need to implement one
> which seems generic?

You need to work out what you want and implement that;
I don't really know enough about USB to advise.
You probably also need to consider how you want
the USB companion chip stuff to work -- I know that
we've had a bug report that the Exynos4210 USB setup
is not getting that right, so it may be a poor example
to copy from.

>> > +
>> > +    usb_bus = usb_bus_find(-1);
>> > +    usb_create_simple(usb_bus, "usb-kbd");
>> > +    usb_create_simple(usb_bus, "usb-mouse");
>>
>> Don't create USB devices by default -- let the user do it on
>> the command line.
>>
> Some users hope that, I can remove it if not reasonable.

Almost no other board models do it (only a few PPC ones
and an sh4 board). Generally for QEMU the approach we take
is that we don't provide defaults, we expect the user
(or the 'management layer' software like libvirt) to
specify what they want. This allows users to specify that
they *don't* want a usb keyboard, for instance.

>> > +    /* If we have an EL3 boot ROM then the assumption is that it will
>> > +     * implement PSCI itself, so disable QEMU's internal implementation
>> > +     * so it doesn't get in the way. Instead of starting secondary
>> > +     * CPUs in PSCI powerdown state we will start them all running and
>> > +     * let the boot ROM sort them out.
>> > +     * The usual case is that we do use QEMU's PSCI implementation;
>> > +     * if the guest has EL2 then we will use SMC as the conduit,
>> > +     * and otherwise we will use HVC (for backwards compatibility and
>> > +     * because if we're using KVM then we must use HVC).
>> > +     */
>> > +    if (vms->secure && firmware_loaded) {
>> > +        vms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
>> > +    } else if (vms->virt) {
>> > +        vms->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
>> > +    } else {
>> > +        vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
>> > +    }
>>
>> Do you actually intend this to work in all these cases? I
>> thought the intention was "always start the boot rom in EL3"
>> for this board, like the real hardware would. In that case, most
>> of these if clauses are dead code.
>>
> Well, I myself prefer "always enable EL3" too.
> But during this work, I found that if EL2/EL3 enabled, QEMU runs much
> slower than without EL2/3, so I guess if there would be some user of
> this platform, for the reason of speed they choose to disable EL2/3,
> should we give them such a chance?
> If get confirmation that we always enable EL2/3, that is fine for me,
> this will make codes cleaner.
>
> (By the way, I wonder why QEMU becomes much slower with EL2/3 enabled,
> because when OS is running, most of the time, we don't call into
> EL2/3, does this mean there is a big space for us to optimize it?)

I think users who don't care about the EL2/EL3 parts of the software
stack should just use the "virt" machine instead -- that is the
board we have for "run as fast as possible and just boot a kernel".

It would be interesting at some point to find out why EL2 and EL3
are causing slowdowns, yes.

thanks
-- PMM
