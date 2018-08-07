Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4338505wru;
        Tue, 7 Aug 2018 08:32:59 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe7xYpWGHcn1ciVONqA/LMgPwmb19ZpPLQ+cpFABcqDTKor5qRYkAA+otFo8n3dVCmO1vRf
X-Received: by 2002:a0c:8b11:: with SMTP id q17-v6mr17330244qva.193.1533655979424;
        Tue, 07 Aug 2018 08:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533655979; cv=none;
        d=google.com; s=arc-20160816;
        b=o5m6Ev32CReu4ACKKcFRPwiYyV6OZDR+XEXWRYKtG01Y7/nEZWt2lT9wy75wOTytJy
         BMdh7OAf642hgyzklc6CDkyCHEUgApRZlvYztuCp17e1fTXKe5TraSxIO4eKrFdDaC6I
         vqfQZs6UxbyEw5b1tNFOXScV32KUp9RTfRO4gUZiT75VZms/+v7FHSPTMX5zSlntwupj
         qeAnsgL4JFAx3RUNBo8iTP1LoneBbKaIFPTqc15nvnJx9RdEc/hyxakERO54kQLgJ093
         BfKvEEAJCGbMf+QArTlldFZjinT4Im760ivHs6qL/9KxdDkXKz/vITVdoYv/Xjvw1TS/
         rPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:arc-authentication-results;
        bh=QZvLSdL+7a7PRVS3kwrtMuK1eZq24j68WBpKEkhQNcA=;
        b=zoGKt/JrWgsflMvzcAkUFgyIWeivQswKJbrMvGkSUUIn+B8/hdNkHyVsyqontWD1mr
         fjp6hXrvhYUod0AReVNyRKdDceK6XuC0/WUvsaBxxa57PjEiCJ6y8ZVw3RBbOIzKTMdU
         pMWqXIEkUTU7KvhH/g8Bb4Znfc3SbBdu5fmy2aACPoguMyKTNhbISEUQ4AXiN/+vsDV+
         OQSdYTKdsZQLupDhhwcKhNYUH/MRMezIQSzmZiZVcCvMSus4fOKhOYP7BHw80Ls6AsUx
         ECmZr7vmh1nUV6tler3MTOPcTnZq6LYRMj+Mu7nix29XUyCUehBgmJePvKBfehHkx5yL
         OT2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j41-v6si1638093qtk.138.2018.08.07.08.32.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 08:32:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fn3yk-000062-TS
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 11:32:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1fn3yW-0008VX-BD
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 11:32:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert.uytterhoeven@gmail.com>) id 1fn3yS-0002v3-Uk
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 11:32:44 -0400
Received: from mail-ua0-f194.google.com ([209.85.217.194]:33514)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert.uytterhoeven@gmail.com>)
	id 1fn3yS-0002ut-Pk; Tue, 07 Aug 2018 11:32:40 -0400
Received: by mail-ua0-f194.google.com with SMTP id i4-v6so16585794uak.0;
	Tue, 07 Aug 2018 08:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QZvLSdL+7a7PRVS3kwrtMuK1eZq24j68WBpKEkhQNcA=;
	b=JsAmrzPEv/jUfXMh0el1G/CxHDEEkRKwv92tfEEtmvdd/ShGQ6ZlyWHEy/fReCy211
	HdQP8iYGjpDnzM61/VXTdcY3yQBi9Tgh85uD0hsL/VvXCvlUhzRfF/pwBVml8dSx+S9D
	LsFXnI5Q9RE0Q6k34LUH1Na8nYTipRS2ER8QD/paAv8FKC6aOeaJH79nI6nejkqMunED
	peMDxqWxDrZ1lfLXBptMHhgaigXpW28MxpkRVCLWtvuUShUPzffuScon2eOkYY8biqSj
	LSAFYthlomM+e9xT4ObV5uK+iOdJhSerp/6vqKnPofbD3kKK9ZYgFYU20jomIF+4W+on
	MYsQ==
X-Gm-Message-State: AOUpUlFy+GK3DUHbJZogXZ/P4IORqS7SlAg1bIKaBJn1O0T4nAtzYHfq
	Ob0wvhEjXJh7gsh0QC+glPLwB3jSpzZzIgrs6W8=
X-Received: by 2002:ab0:5b57:: with SMTP id
	v23-v6mr13858749uae.72.1533655959914; 
	Tue, 07 Aug 2018 08:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20180725143413.9728-1-geert+renesas@glider.be>
	<20180725143413.9728-5-geert+renesas@glider.be>
	<e52bfdab-5c23-a617-8bef-0c17ab831ec1@redhat.com>
In-Reply-To: <e52bfdab-5c23-a617-8bef-0c17ab831ec1@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Aug 2018 17:32:27 +0200
Message-ID: <CAMuHMdUuHcoZxFVFivBwD3LveeE8yQ+AnaWFr76kATG+rCzd=w@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.194
Subject: Re: [Qemu-arm] [PATCH v3 4/4] hw/arm/sysbus-fdt: Add support for
 instantiating generic devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <damm+renesas@opensource.se>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +MCnDpKOXc+1

Hi Eric,

On Tue, Aug 7, 2018 at 4:19 PM Auger Eric <eric.auger@redhat.com> wrote:
> On 07/25/2018 04:34 PM, Geert Uytterhoeven wrote:
> > Add a fallback for instantiating generic devices without a type-specific
> > or compatible-specific instantation method.  This will be used when no
> > other match is found.
> >
> > The generic instantation method creates a device node with "reg" and
> > (optional) "interrupts" properties, and copies the "compatible"
> > property and other optional properties from the host.
> > For now the following optional properties are copied, if found:
> >   - "#gpio-cells",
> >   - "gpio-controller",
> >   - "#interrupt-cells",
> >   - "interrupt-controller",
> >   - "interrupt-names".
> >
> > More can be added when needed.
> >
> > This avoids having to write device-specific instantation methods for
> instantiation

Thanks, will fix.

> > each and every "simple" device using only a set of generic properties.
> > Devices that need more specialized handling can still provide their
> > own instantation method.

Arghl, one more.

> > --- a/hw/arm/sysbus-fdt.c
> > +++ b/hw/arm/sysbus-fdt.c
> > @@ -415,6 +415,99 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
> >      return 0;
> >  }
> >
> > +static HostProperty generic_copied_properties[] = {
> > +    {"compatible", false},
> > +    {"#gpio-cells", true},
> > +    {"gpio-controller", true},
> > +    {"#interrupt-cells", true},
> > +    {"interrupt-controller", true},
> > +    {"interrupt-names", true},
>
> I think we would need to enumerate the other source properties which
> were not copied to the guest fdt and either warn the userspace those
> were omitted or fail. We may end up generating an incomplete guest dt
> node that may not work properly.

The list above is quite generic, so it is expected that some of the optional
properties (marked "true") cannot be copied. Hence warning about them
will be noisy, and confuse users.  Failing is definitely the wrong thing
to do.

If the host lacks a property that is mandatory for a specific device, the
device won't have worked on the host before neither, right?

The major issue remains that an incomplete guest DT node may be generated
if the list above lacks certain needed properties, or if subnodes are
needed.
I expect the guest OS driver would complain about the missing parts, though.
In that case, either the list should be extended, or a device-specific
instantiation method should be written.

> > +/**
> > + * add_generic_fdt_node
> > + *
> > + * Generates a generic DT node by copying properties from the host
> > + */
> > +static int add_generic_fdt_node(SysBusDevice *sbdev, void *opaque)
> > +{

> > +    /* Copy interrupts (remapped) */
> > +    if (vbasedev->num_irqs) {
> > +        irq_attr = g_new(uint32_t, vbasedev->num_irqs * 3);
> > +        for (i = 0; i < vbasedev->num_irqs; i++) {
> > +            irq_number = platform_bus_get_irqn(pbus, sbdev , i)
> > +                             + data->irq_start;
> > +            irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
> > +            irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
> > +            irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>
> I think this part is not generic enough. How can you assume the IRQs are
> level or edge? Can't you copy the source interrupt properties and just
> overwrite the IRQ number?

I have to check that. I wouldn't be surprised if the virtualized GIC supports
only a subset of all possible flags and/or remaps interrupt types too.

I see the AMD XGBE driver looks at VFIO_IRQ_INFO_AUTOMASKED to choose
between GIC_FDT_IRQ_FLAGS_LEVEL_HI and GIC_FDT_IRQ_FLAGS_EDGE_LO_HI.
The VFIO_IRQ_INFO_* don't seem to provide more details.
There are also no users of GIC_FDT_IRQ_FLAGS_LEVEL_LO and
GIC_FDT_IRQ_FLAGS_EDGE_HI_LO in the Qemu sources...

So probably following the AMD XGBE example is the way forward?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
