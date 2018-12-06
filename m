Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10391910wrt;
        Thu, 6 Dec 2018 01:19:55 -0800 (PST)
X-Received: by 2002:a19:2106:: with SMTP id h6mr15942321lfh.29.1544087995358;
        Thu, 06 Dec 2018 01:19:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544087995; cv=none;
        d=google.com; s=arc-20160816;
        b=vhINAJirb1rdUquhRKa7gzSoke2kSl7n7O/z81AFkWd+z3uHh5Nkjrz4eYSVj6qLCC
         2N1sJxOUIRM91eAApTzxUbb3t4tTkNPdGvVzJiWg/01btuIU36JcPQcWF9gSQ1L8kcvh
         3qzuBo08vkBbZrvWMiYYZoHFRY+YZ9mW5kS9k+OUTcJJC1tYZUsFkROlwE4V+7jLQjXj
         JmYtMH4YBsm1eDT+C6n69F2chnB3GNHH1/+KaYAKIt9M0VBIP4akCpz27MbX1k9xOy3V
         XVRIMQgPNq9raeYqjciyUgJLGGOerz+h1wJ5ijBTXp9TQuVUQqW7l0ca7RxatkK1OXFk
         TNjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Yy3eQ42RF732OdZ3faZJvgeQ1xeE5wfMXRThXRhoCQE=;
        b=J242yTA5ScoxknAiY/gwDYJOcwP4bL9Z4lNBqAoEJ9Vr2kpiH++FknKJlEtAd79Mx4
         t3ooKomGWASBJ14/LjKzstSYhQYTtNSsIahZUxTq1yEPOKlSU+07CSRmmvvQxIs7J1AI
         fnwHqjvJrkLixFwZnFhKNFrYCJNbUkW/S/ieOrZzX4g17agXRXlXQFSZfG/67e/5X30e
         4cAvK4KuBqfVGOA7gMO5dN+xne4yYdPYLZoUShS7MYkYSTMBH5qkhyMv2KKnBagrQkz7
         LpTrIguWLu85QxYfzIuDijeHTzHlIyjG6WPJJ8cmLtc3wYZM50e/2lbXIXTZ7oCmx7C2
         T8uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z1qCGC+K;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f18sor6116910lfa.66.2018.12.06.01.19.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Dec 2018 01:19:55 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z1qCGC+K;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yy3eQ42RF732OdZ3faZJvgeQ1xeE5wfMXRThXRhoCQE=;
        b=Z1qCGC+KzIQsewzp9bXmm76qaqM4X/2vKnC0EOxMB1ZqUwq5JrOHHIId2sixqcTFF4
         ufBXYwR17j3d2E0CGPfU/YGb/JV9GGVXhyYuaSF2Ksc3kvHPKXij11aaRLL90FOq21O5
         xK04Pcat8/1X22mfTA0s2PRhc66Xu5zrnxyDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yy3eQ42RF732OdZ3faZJvgeQ1xeE5wfMXRThXRhoCQE=;
        b=rWiqcO0MWdZo4jUl+1Rf0ezNwvsxsl4lx6AsRB4el8KE6BoflSCn279+KEuW+iVnGe
         Pq/QvYGYFUjlPFRt3UDTDYah/udkNPuw5FRNgpIZY5oyB+EcX5rZ/ltn3rgTFUfA6XoH
         7dYb7R8vJs/obDn5zt3Ynlz/P6GNypN4GnoQtTInv+IUJsTyqFXuqLPowCzn7YxcH7P5
         4duXrp99UCcl6CZNOb5j5DZcYTuiV0mBIZTJFyNZuRL75VF+468pZcLGQoFTi+YrMEpX
         t023SlYRHqecFdrtIJeO8/b7mnrDj9qlm26IRUOtr6hn/OYbV5GEcTwtM4/6H6BnFb1q
         46bA==
X-Gm-Message-State: AA+aEWZhqVnNCj7kxUdkeO4IY7WbhvXveHeCUQSPm4xzvvB7c5QLBDOB
	HRxaeyrkDQV7mBfzLtzYPDuRKLxfz5RiKlUL6Bk4Fuec0EutTw==
X-Google-Smtp-Source: AFSGD/UJa7iwy4cS0Wy+83mWrTUbEbgIrpG5urY8kEL0yuhhJmRgVO9LHEWBA57ynW5MMAA8/Yhc/PrvrFKf+h1L7ec=
X-Received: by 2002:a19:aace:: with SMTP id t197mr15912920lfe.7.1544087994868;
 Thu, 06 Dec 2018 01:19:54 -0800 (PST)
MIME-Version: 1.0
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com>
 <CAHmQWvD1ocAfZo=9aJYeuVDWrBk=AF_D-AgHriYb3-7=n+rR6A@mail.gmail.com> <CAFEAcA_a-YMNaGtPPn+8DBFmx4xGYCkuybMck_Wquw6zmLTbCQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_a-YMNaGtPPn+8DBFmx4xGYCkuybMck_Wquw6zmLTbCQ@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Thu, 6 Dec 2018 17:19:42 +0800
Message-ID: <CAHmQWvAy0kdhXd=atnzB6_ASoRmrxv3wB8AaJPf1eFpf8ex+Pg@mail.gmail.com>
Subject: Re: [PATCH v4] hw/arm: Add arm SBSA reference machine
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: KKNHwflFktsv

On Fri, 16 Nov 2018 at 19:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On 16 November 2018 at 10:46, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> > On Fri, 16 Nov 2018 at 00:05, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> If after you've done that this patch is still more than
> >> about 500 lines long, I would recommend that you split it
> >> up into coherent pieces, to make it easier to review.
>
> > I think however I re-work this file, it is still more than 500 lines.
> > If split it, then how? one for most basic skeleton, including memory
> > map, class and instance init etc, and another adding peripheral
> > devices, like pcie etc?
>
> Yes, that's a reasonable split.
>
> >> This is still generating a lot of device tree nodes.
> >> I thought we had agreed that we were going to just have
> >> a minimal device tree that says "here is the RAM" and nothing
> >> else ?
> >>
> > If I remember correct, it was not only the RAM, but also the CPUs
> > because it depends on the command parameters dynamically, and also the
> > GIC as well since it depends on the CPU number.
> > And should NUMA info if used, be added to DT?
> > And by the way, I didn't find the RAM size info in the DT.
>
> You should include the absolute minimum you need that you
> cannot either say "we know what this value is because we
> know the board" or probe for anyway. I think that is basically
> ram inf and number of CPUs. (Ram size and numa configuration
> is added to the dtb by the hw/arm/boot.c code, which sets up
> the "/memory" nodes.)
>
> You shouldn't need to put the GIC info into the DT, because
> you can just hard code into UEFI where it is in memory.
>
> >> > +static void create_ehci(const VirtMachineState *vms, qemu_irq *pic)
> >> > +{
> >> > +    hwaddr base = vms->memmap[VIRT_EHCI].base;
> >> > +    int irq = vms->irqmap[VIRT_EHCI];
> >> > +    USBBus *usb_bus;
> >> > +
> >> > +    sysbus_create_simple("exynos4210-ehci-usb", base, pic[irq]);
> >>
> >> What is this using the exynos4210 USB device for? That
> >> is definitely not correct for a generic board.
> >>
> > Checked the code:
> > #define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
> > #define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
> > #define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
> > #define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
> > #define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
> >
> > The first one seems only a parent type, not a general instance, cannot
> > be used directly.
> > The other four are specific instances using the first as parent type,
> > one of them can be chosen to use.
> > That is my understanding, any comments, or do we need to implement one
> > which seems generic?
>
> You need to work out what you want and implement that;
> I don't really know enough about USB to advise.
> You probably also need to consider how you want
> the USB companion chip stuff to work -- I know that
> we've had a bug report that the Exynos4210 USB setup
> is not getting that right, so it may be a poor example
> to copy from.
>
> >> > +
> >> > +    usb_bus = usb_bus_find(-1);
> >> > +    usb_create_simple(usb_bus, "usb-kbd");
> >> > +    usb_create_simple(usb_bus, "usb-mouse");
> >>
> >> Don't create USB devices by default -- let the user do it on
> >> the command line.
> >>
> > Some users hope that, I can remove it if not reasonable.
>
> Almost no other board models do it (only a few PPC ones
> and an sh4 board). Generally for QEMU the approach we take
> is that we don't provide defaults, we expect the user
> (or the 'management layer' software like libvirt) to
> specify what they want. This allows users to specify that
> they *don't* want a usb keyboard, for instance.
>
One thing I forgot to mention that we have VGA on this machine, so it
is convenient/better that we have mouse/keyboard.
(Anyway my next iteration won't have them due to the xhci needs to be
rebuild separately later)

> >> > +    /* If we have an EL3 boot ROM then the assumption is that it will
> >> > +     * implement PSCI itself, so disable QEMU's internal implementation
> >> > +     * so it doesn't get in the way. Instead of starting secondary
> >> > +     * CPUs in PSCI powerdown state we will start them all running and
> >> > +     * let the boot ROM sort them out.
> >> > +     * The usual case is that we do use QEMU's PSCI implementation;
> >> > +     * if the guest has EL2 then we will use SMC as the conduit,
> >> > +     * and otherwise we will use HVC (for backwards compatibility and
> >> > +     * because if we're using KVM then we must use HVC).
> >> > +     */
> >> > +    if (vms->secure && firmware_loaded) {
> >> > +        vms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
> >> > +    } else if (vms->virt) {
> >> > +        vms->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
> >> > +    } else {
> >> > +        vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
> >> > +    }
> >>
> >> Do you actually intend this to work in all these cases? I
> >> thought the intention was "always start the boot rom in EL3"
> >> for this board, like the real hardware would. In that case, most
> >> of these if clauses are dead code.
> >>
> > Well, I myself prefer "always enable EL3" too.
> > But during this work, I found that if EL2/EL3 enabled, QEMU runs much
> > slower than without EL2/3, so I guess if there would be some user of
> > this platform, for the reason of speed they choose to disable EL2/3,
> > should we give them such a chance?
> > If get confirmation that we always enable EL2/3, that is fine for me,
> > this will make codes cleaner.
> >
> > (By the way, I wonder why QEMU becomes much slower with EL2/3 enabled,
> > because when OS is running, most of the time, we don't call into
> > EL2/3, does this mean there is a big space for us to optimize it?)
>
> I think users who don't care about the EL2/EL3 parts of the software
> stack should just use the "virt" machine instead -- that is the
> board we have for "run as fast as possible and just boot a kernel".
>
> It would be interesting at some point to find out why EL2 and EL3
> are causing slowdowns, yes.
>
> thanks
> -- PMM
