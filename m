Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp5121519wrh;
        Wed, 8 May 2019 10:50:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMAavlWHrTh+mL/LTmnANGwVSAUnH/AsXZM7hAO1/Opw97epfMOBH7w9FmQQchp2OdUIWF
X-Received: by 2002:a5d:4604:: with SMTP id t4mr2778608wrq.93.1557337853384;
        Wed, 08 May 2019 10:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557337853; cv=none;
        d=google.com; s=arc-20160816;
        b=ujAgconDKjK9/FH/0b7OPQpOf7KP25USOsw7JTvwT4hwxcTvxfUh2tV7zRrwCzbJVG
         u9OKExkhYC7SJs6P6nqh+XnvUwCB2xVNJ3L6DLhZeyIvuDSers5PdA0PG4iiCKIthp1U
         +YE0SNQnYQ3fEETrRBDbIOwGJX90MhZIg1PRIQXUb5CD4X+GmFgjrmCxOto+9ukWMrQV
         RXzSW0mnQueN85yGqv1nlaITCdsoDxHA8TYChKIuLQnzfw2/hKZIvwBRtTWLJ7OmFVDU
         3M+ZMrXaauG66nvVPDU7JzNwkc554dGM9R5m2OzuUb0t0CwIRj+4dztTDpib/w5VpOsu
         ffdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C/8TFpEj/WIrJQSWJD3/NdWYF5S3VIWsu2Euwn9fjbw=;
        b=DfBkcx4BEadsaryMzmkcpDNDEdSiWTLFuqyDS7MtWxXmKx/Q+F8n35EFsLFbb2LE0U
         GDdV/1CWnV9ZMl0Pa4hQU3BvVRmOVOxyYWNHI+PWUOnftQE9SKtiTyQtSegE48AT5QxI
         3TLbuut9X57trQ43B65dAN+y/WMbpSx+zdOXSPdlxZw9khEmJKXEJRm1C0CS3P4AQJv4
         iCC3yUo3HCwX0AznP0rEK/p1mITfyDWheITMycE+bilHppQm/2LyfI+SAcE2uTTCCGiS
         u939eveGbd2HEGQo79mg+dht9G7k2uDdSlPwocCBaIyYltLvjd1d9o62zSXcelRQ6/wS
         5eYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=oBuMZI3m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si1905301wmb.87.2019.05.08.10.50.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 10:50:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=oBuMZI3m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:41073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOQiS-000521-Eb
	for alex.bennee@linaro.org; Wed, 08 May 2019 13:50:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <radoslaw.biernacki@linaro.org>) id 1hOQge-0004Ks-J1
	for qemu-devel@nongnu.org; Wed, 08 May 2019 13:49:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <radoslaw.biernacki@linaro.org>) id 1hOQgc-00068n-Ix
	for qemu-devel@nongnu.org; Wed, 08 May 2019 13:49:00 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:41431)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <radoslaw.biernacki@linaro.org>)
	id 1hOQga-00066Z-Cm
	for qemu-devel@nongnu.org; Wed, 08 May 2019 13:48:56 -0400
Received: by mail-yw1-xc43.google.com with SMTP id o65so15144056ywd.8
	for <qemu-devel@nongnu.org>; Wed, 08 May 2019 10:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6E1rJcy6W9vB2kc74SAOH1pZFwmEt8nbZ4TAon/rMBA=;
	b=oBuMZI3mAnB6tFczv1u9i5B3TNMsBqfJ8YZNowjkUI9e4Mqk6uCRYnPH/ag5/XRRnM
	w53KKAW+1bW4G3qw0mzq7k3ZX8S2U6ok56O7QCMEyhEghRTt5x6z9fr829MaOB7yUiDm
	QdB2l4f0BfjOM708OIDt4SphgjyaMQDTMVWEsKEsqJgCqLFtK/KKdZd3fSmkcfWKS62+
	bQdAXTX+tq5b00dZphULyGJXXktLvuGf5cc5lWQIfTaYPeJmTkutBltTcV85kXWc/s9n
	5Lznm6QvJHtXDfO4s9wzROBMMqqH6V7+GfScYzKm9ckRKah3BAGsXUxePV1BL1529CTS
	9+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6E1rJcy6W9vB2kc74SAOH1pZFwmEt8nbZ4TAon/rMBA=;
	b=Tu0KKgTmezXffDd37GbI6TzR5VGhth8ggVfdgLm5P0Ml0eZHZButs0vCUrAPnXPomp
	+AjLe+aMi/Py02CgnOGYMjo7w9yPLId6EQHAF2WX00g/64pt+P1JIvzXjTvtYhPkcuwy
	NQUsfQYrC1hVEROA1lMj6qD7KvANx8Mt+BpdnxiYOcrxsliNE+4LEl6t2xuPZGd7lRcR
	7ulnk+Kix+uF8JgE/BL72wvmo/eGMxUm+qyvgUaGRpvQS5+2pytYW8fDPkgAMO4Hvrvn
	bZRc/H4+R/rpU5gotD17XLLHzE7IrS1VCFs0+yNvJWEXe2TwOMvMnkLl1EMCzOhWfkvf
	vSGA==
X-Gm-Message-State: APjAAAWXtqcz/U9FmkQ1UW5SMBlc3I9fnJEfgCcoz/MxzLc5zJspJeaN
	PxyvCQTWqZlrTjEOlSVw/sYKw45XF0/6eyGMOfZjMg==
X-Received: by 2002:a25:8145:: with SMTP id j5mr26617049ybm.114.1557337733008; 
	Wed, 08 May 2019 10:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <1555560291-3415-1-git-send-email-hongbo.zhang@linaro.org>
	<1555560291-3415-3-git-send-email-hongbo.zhang@linaro.org>
	<CAFEAcA-poCxPqPtfhx4mUJ5pcOjn1Hz-WNxEt29f=JgpFMi4Kg@mail.gmail.com>
	<CAHmQWvB4AZGM+MV0LP-vtfoW0kG4RFkf0R6NoRWm8WrFuum+Og@mail.gmail.com>
In-Reply-To: <CAHmQWvB4AZGM+MV0LP-vtfoW0kG4RFkf0R6NoRWm8WrFuum+Og@mail.gmail.com>
From: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Date: Wed, 8 May 2019 19:48:41 +0200
Message-ID: <CAEK-wKkiyNYjKKsJzukC_LLi163ngWV4P18-47Z6xxF0azB2uw@mail.gmail.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c43
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v7 2/2] hw/arm: Add arm SBSA reference
 machine, devices part
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3aBb11h9Usv4

On Wed, 8 May 2019 at 13:30, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:

> On Tue, 30 Apr 2019 at 22:17, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > On Thu, 18 Apr 2019 at 05:05, Hongbo Zhang <hongbo.zhang@linaro.org>
> wrote:
> > >
> > > Following the previous patch, this patch adds peripheral devices to the
> > > newly introduced SBSA-ref machine.
> > >
> > > Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> > > ---
> > >  hw/arm/sbsa-ref.c | 451
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 451 insertions(+)
> >
> > Some fairly minor comments on this one.
> >
> > > +static void create_flash(const SBSAMachineState *vms,
> > > +                         MemoryRegion *sysmem,
> > > +                         MemoryRegion *secure_sysmem)
> > > +{
> > > +    /*
> > > +     * Create one secure and nonsecure flash devices to fill
> SBSA_FLASH
> > > +     * space in the memmap, file passed via -bios goes in the first
> one.
> > > +     */
> > > +    hwaddr flashsize = vms->memmap[SBSA_FLASH].size / 2;
> > > +    hwaddr flashbase = vms->memmap[SBSA_FLASH].base;
> > > +
> > > +    create_one_flash("sbsa-ref.flash0", flashbase, flashsize,
> > > +                     bios_name, secure_sysmem);
> > > +    create_one_flash("sbsa-ref.flash1", flashbase + flashsize,
> flashsize,
> > > +                     NULL, sysmem);
> > > +}
> >
> > I think Markus might have an opinion on the best way to create
> > flash devices on a new board model. Is "just create two flash
> > devices the way the virt board does" the right thing?
> >
> For the firmware part, we are using two flashes, one secure and
> another non-secure.
>
> > > +static void create_ahci(const SBSAMachineState *vms, qemu_irq *pic)
> > > +{
> > > +    hwaddr base = vms->memmap[SBSA_AHCI].base;
> > > +    int irq = vms->irqmap[SBSA_AHCI];
> > > +    DeviceState *dev;
> > > +    DriveInfo *hd[NUM_SATA_PORTS];
> > > +    SysbusAHCIState *sysahci;
> > > +    AHCIState *ahci;
> > > +    int i;
> > > +
> > > +    dev = qdev_create(NULL, "sysbus-ahci");
> > > +    qdev_prop_set_uint32(dev, "num-ports", NUM_SATA_PORTS);
> > > +    qdev_init_nofail(dev);
> > > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> > > +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[irq]);
> > > +
> > > +    sysahci = SYSBUS_AHCI(dev);
> > > +    ahci = &sysahci->ahci;
> > > +    ide_drive_get(hd, ARRAY_SIZE(hd));
> > > +    for (i = 0; i < ahci->ports; i++) {
> > > +        if (hd[i] == NULL) {
> > > +            continue;
> > > +        }
> > > +        ide_create_drive(&ahci->dev[i].port, 0, hd[i]);
> > > +    }
> > > +}
> > > +
> > > +static void create_ehci(const SBSAMachineState *vms, qemu_irq *pic)
> > > +{
> > > +    hwaddr base = vms->memmap[SBSA_EHCI].base;
> > > +    int irq = vms->irqmap[SBSA_EHCI];
> > > +    USBBus *usb_bus;
> > > +
> > > +    sysbus_create_simple("platform-ehci-usb", base, pic[irq]);
> > > +
> > > +    usb_bus = usb_bus_find(-1);
> > > +    usb_create_simple(usb_bus, "usb-kbd");
> > > +    usb_create_simple(usb_bus, "usb-mouse");
> >
> > I don't think we should automatically create the usb keyboard
> > and mouse devices. The user can do it on the command line if they
> > want them.
> >
> OK.
>

Actually I need to rise an objection to this one.
As we trying to make SBSA machine as close as possible to real machine, we
should have keyboard and mouse.
Those have the same requirement as for VGA. It's just an expected piece of
HW when you for e.g. installing a server.
We also do a lot of FW work so it is expected to have keyboard (and even
mouse) in UEFI.


>
> > >  static void sbsa_ref_init(MachineState *machine)
> > >  {
> > >      SBSAMachineState *vms = SBSA_MACHINE(machine);
> > > @@ -125,6 +552,7 @@ static void sbsa_ref_init(MachineState *machine)
> > >      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
> > >      const CPUArchIdList *possible_cpus;
> > >      int n, sbsa_max_cpus;
> > > +    qemu_irq pic[NUM_IRQS];
> > >
> > >      if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a57"))) {
> > >          error_report("sbsa-ref: CPU type other than the built-in "
> > > @@ -209,11 +637,34 @@ static void sbsa_ref_init(MachineState *machine)
> > >                                           machine->ram_size);
> > >      memory_region_add_subregion(sysmem, vms->memmap[SBSA_MEM].base,
> ram);
> > >
> > > +    create_fdt(vms);
> > > +
> > > +    create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
> > > +
> > > +    create_secure_ram(vms, secure_sysmem);
> > > +
> > > +    create_gic(vms, pic);
> > > +
> > > +    create_uart(vms, pic, SBSA_UART, sysmem, serial_hd(0));
> > > +    create_uart(vms, pic, SBSA_SECURE_UART, secure_sysmem,
> serial_hd(1));
> > > +    create_uart(vms, pic, SBSA_SECURE_UART_MM, secure_sysmem,
> serial_hd(2));
> >
> > What's the third UART for (ie what is the name intended to mean)?
> > Should we have more than one non-secure UART?
> >
> Yes, this is called " Standalone Management Mode", I will add comment
> for it, this is needed by server RAS feature.
>
> > thanks
> > -- PMM
>
