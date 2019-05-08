Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4714925wrh;
        Wed, 8 May 2019 04:30:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyQ4I3mNgKcI9VIeaSF6/r/RKecBlbowthcIpjllx3giVsnZgYz/E+mUtM2lHfNaovgjg8d
X-Received: by 2002:adf:ec0f:: with SMTP id x15mr3105062wrn.120.1557315044894;
        Wed, 08 May 2019 04:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557315044; cv=none;
        d=google.com; s=arc-20160816;
        b=ghyskisiHZOFqO82+dsTjfR9lhn8xFCVnQqaJYtbC0ncwW3yFgfqGqpxcH90i7wEAy
         OFpqlZ8af5GPBYe1GxCvK5uqVLA+s7q9EXzcOSh54fcBY9Y2ooZEEcxtmKoavPVjPJQE
         XlDQlnjCnN1Hf+sbSh7SqTfJCqWYYkxp1RLldvsHNei2HKYeya2fu6pn4t4GHSkM06L7
         Te+gtejGi3SK9pB2ni9Im30Ua7dSIdlN4H34vMI9h5/fusnRX1odgBTDswtXORL4qOgJ
         BEW8aBN/pS4v4Hb9CXZCvR8+SkiA9ip9lOngnTW8TQcQzDJDxKaGfvCeo9IvRQ3jYxVN
         gvfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=euDbYukUunzWf2Zre5ZSrbtkk4J2+ci9a3w4dyAZO/M=;
        b=hsSxttBXBORyRjoiIh/3qG1RcZwsurP7KgO23PuP6rI7R8DgRl3zkF0yiGChHQE0U7
         h4cUewU90UyYio0Q8+IUIGLld8/oa9FdEBrLlYvxwz2wKb514Fw/bEuq2C58vx3bDRs2
         +WqBuDsXZM54Jy2eEoKLH4+dNpQyezRqYBn6rwVOUIaE1cxF3wloa4JhUv2RYziDU3rz
         tIcYRV+nEzYKlDrj2RFAH/nntK9eJF5LehHEDASi8VcOVkqlRyHuITwHaygK/71Huw7V
         CYsugo4r5ItRnWh8UsV11L4LRNYbbIGSCZgayGJpgbul4uTHU4dRn1Uxi4AsiybVsZUt
         rL+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NRSLhEt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19si6947977wrg.360.2019.05.08.04.30.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 04:30:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NRSLhEt2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35224 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOKmZ-0007jO-VW
	for alex.bennee@linaro.org; Wed, 08 May 2019 07:30:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1hOKmS-0007gy-9o
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:30:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1hOKmR-0004Oi-1T
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:30:36 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:39954)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1hOKmQ-0004Kl-LY
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:30:34 -0400
Received: by mail-lj1-x242.google.com with SMTP id d15so17159731ljc.7
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=euDbYukUunzWf2Zre5ZSrbtkk4J2+ci9a3w4dyAZO/M=;
	b=NRSLhEt2wl4A+ew+zj3Ev1XksjInP1szlciL8baa0fGf/S1e6yIQMpNp6nudnR/xvf
	KB/l8jNQEPZahWzBr07Tw/uXbrBjMhRpz59Yh+3nTQjZUN2akHu0T0ivMRjGvv3vwUhv
	inX/hoZaot/a6GUNnaxlAGrM793kBpWp6iAUlq8gNaWGnzce1qgPFCyBvykGjOsQ9S+6
	w8LgUlcEGXaemrr8UuTKT1q4mHTeR0j4Cf+5a742el5q4h5QRJZhy1woQwV/jxxKfnra
	E/gAayrgDYIjzc+LeGfxF4U5692TxODWdAuoqxFU3b+AuZO0swzsf5S+47YY1ttC1531
	yl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=euDbYukUunzWf2Zre5ZSrbtkk4J2+ci9a3w4dyAZO/M=;
	b=lWgebcRHcnCwiq11CybUlw57CVT30eFD3JLqisnBu0ygHYLHyGk4oSZXyacGx1UI9W
	m5qBjjVC5wm7fpYwNUw6Yb0bPzgxw4Azmqqpf6CyMerDJCzMYLSUE12Rw4m6yL3+k86X
	ap2pLrV7SThfGOdb5Psl7MOjncVBiwEiq1ameCIF7VWyc+56K8SOZYTq2NArPZBzdVoe
	xuX+yLBBepeUsZsuQQOvCUNmAF8UVQN5GLnC5mhAAfTn2ABJa09b/YgB+KB70RiAdBj5
	MGKvbKvUlnWRAbkmK6yLnSvUA86yEdGan19e50eWe71I6/6X8UXeIMWJGkZTvADkTiOy
	FRVw==
X-Gm-Message-State: APjAAAX2eVff+iWE8L8upL2xbj+juwKIlXoJp0wPITINiE0BrLuoae4w
	m5RYMdn6OX49JqIMXWDZNYD6WP9RZPsW1fCvlN6j+w==
X-Received: by 2002:a2e:894e:: with SMTP id b14mr15563289ljk.158.1557315033407;
	Wed, 08 May 2019 04:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <1555560291-3415-1-git-send-email-hongbo.zhang@linaro.org>
	<1555560291-3415-3-git-send-email-hongbo.zhang@linaro.org>
	<CAFEAcA-poCxPqPtfhx4mUJ5pcOjn1Hz-WNxEt29f=JgpFMi4Kg@mail.gmail.com>
In-Reply-To: <CAFEAcA-poCxPqPtfhx4mUJ5pcOjn1Hz-WNxEt29f=JgpFMi4Kg@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 8 May 2019 19:30:26 +0800
Message-ID: <CAHmQWvB4AZGM+MV0LP-vtfoW0kG4RFkf0R6NoRWm8WrFuum+Og@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v7 2/2] hw/arm: Add arm SBSA reference
 machine, devices part
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
Cc: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TR6/RDUO/6wY

On Tue, 30 Apr 2019 at 22:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 18 Apr 2019 at 05:05, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >
> > Following the previous patch, this patch adds peripheral devices to the
> > newly introduced SBSA-ref machine.
> >
> > Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> > ---
> >  hw/arm/sbsa-ref.c | 451 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 451 insertions(+)
>
> Some fairly minor comments on this one.
>
> > +static void create_flash(const SBSAMachineState *vms,
> > +                         MemoryRegion *sysmem,
> > +                         MemoryRegion *secure_sysmem)
> > +{
> > +    /*
> > +     * Create one secure and nonsecure flash devices to fill SBSA_FLASH
> > +     * space in the memmap, file passed via -bios goes in the first one.
> > +     */
> > +    hwaddr flashsize = vms->memmap[SBSA_FLASH].size / 2;
> > +    hwaddr flashbase = vms->memmap[SBSA_FLASH].base;
> > +
> > +    create_one_flash("sbsa-ref.flash0", flashbase, flashsize,
> > +                     bios_name, secure_sysmem);
> > +    create_one_flash("sbsa-ref.flash1", flashbase + flashsize, flashsize,
> > +                     NULL, sysmem);
> > +}
>
> I think Markus might have an opinion on the best way to create
> flash devices on a new board model. Is "just create two flash
> devices the way the virt board does" the right thing?
>
For the firmware part, we are using two flashes, one secure and
another non-secure.

> > +static void create_ahci(const SBSAMachineState *vms, qemu_irq *pic)
> > +{
> > +    hwaddr base = vms->memmap[SBSA_AHCI].base;
> > +    int irq = vms->irqmap[SBSA_AHCI];
> > +    DeviceState *dev;
> > +    DriveInfo *hd[NUM_SATA_PORTS];
> > +    SysbusAHCIState *sysahci;
> > +    AHCIState *ahci;
> > +    int i;
> > +
> > +    dev = qdev_create(NULL, "sysbus-ahci");
> > +    qdev_prop_set_uint32(dev, "num-ports", NUM_SATA_PORTS);
> > +    qdev_init_nofail(dev);
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[irq]);
> > +
> > +    sysahci = SYSBUS_AHCI(dev);
> > +    ahci = &sysahci->ahci;
> > +    ide_drive_get(hd, ARRAY_SIZE(hd));
> > +    for (i = 0; i < ahci->ports; i++) {
> > +        if (hd[i] == NULL) {
> > +            continue;
> > +        }
> > +        ide_create_drive(&ahci->dev[i].port, 0, hd[i]);
> > +    }
> > +}
> > +
> > +static void create_ehci(const SBSAMachineState *vms, qemu_irq *pic)
> > +{
> > +    hwaddr base = vms->memmap[SBSA_EHCI].base;
> > +    int irq = vms->irqmap[SBSA_EHCI];
> > +    USBBus *usb_bus;
> > +
> > +    sysbus_create_simple("platform-ehci-usb", base, pic[irq]);
> > +
> > +    usb_bus = usb_bus_find(-1);
> > +    usb_create_simple(usb_bus, "usb-kbd");
> > +    usb_create_simple(usb_bus, "usb-mouse");
>
> I don't think we should automatically create the usb keyboard
> and mouse devices. The user can do it on the command line if they
> want them.
>
OK.

> >  static void sbsa_ref_init(MachineState *machine)
> >  {
> >      SBSAMachineState *vms = SBSA_MACHINE(machine);
> > @@ -125,6 +552,7 @@ static void sbsa_ref_init(MachineState *machine)
> >      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
> >      const CPUArchIdList *possible_cpus;
> >      int n, sbsa_max_cpus;
> > +    qemu_irq pic[NUM_IRQS];
> >
> >      if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a57"))) {
> >          error_report("sbsa-ref: CPU type other than the built-in "
> > @@ -209,11 +637,34 @@ static void sbsa_ref_init(MachineState *machine)
> >                                           machine->ram_size);
> >      memory_region_add_subregion(sysmem, vms->memmap[SBSA_MEM].base, ram);
> >
> > +    create_fdt(vms);
> > +
> > +    create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
> > +
> > +    create_secure_ram(vms, secure_sysmem);
> > +
> > +    create_gic(vms, pic);
> > +
> > +    create_uart(vms, pic, SBSA_UART, sysmem, serial_hd(0));
> > +    create_uart(vms, pic, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
> > +    create_uart(vms, pic, SBSA_SECURE_UART_MM, secure_sysmem, serial_hd(2));
>
> What's the third UART for (ie what is the name intended to mean)?
> Should we have more than one non-secure UART?
>
Yes, this is called " Standalone Management Mode", I will add comment
for it, this is needed by server RAS feature.

> thanks
> -- PMM
