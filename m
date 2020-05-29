Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp249279lfc;
        Fri, 29 May 2020 01:02:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVHK45PAcj6DeDV0U4zWRWGFuC3CYtEnBCg4JpiBqMK81zvuTX8zl+PG24bx7+Qczi0Eyf
X-Received: by 2002:a25:b281:: with SMTP id k1mr11382152ybj.108.1590739374261;
        Fri, 29 May 2020 01:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590739374; cv=none;
        d=google.com; s=arc-20160816;
        b=duR1UIm4rIGDlXF+u0evzK9ST2nIoeY5+5FNZKE3ICe/krlT/xZhc4kA3IYQof1mmT
         1dRo1V22Ny1y2eBxLZ7SxGJD2ohPt92jExg1wM58ROmDyaMmLgbkjPYG2wNb9AFYqFbN
         J4IsRYYQal9lGRTHH+lnbrqHgZbgJQJ+6o0zqmCcxM1RwwTtlBGTZAUEMJS0P/xNdpQ5
         fBhL+SEOb0FrvzobQnj3GM0iYb1hQfbME3ABi6fyo7lGDy+yx+k/ATK6gINYxsAFNgpJ
         9/rXhyIMYcJA5hVIoG+av9fqc/bJpIQe6xWnxYLblqYxWSqO9BbZRnR3f4xUXOi3GUjA
         qikQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=wzUYv93FzC6cTw6Rjq4nNb+mQGuSBsCe1ZGs1B9hAZ8=;
        b=kLuDhIuHrjpackoh4sV4pRwtFSY35f0RCAC6pgFyYgwrjKy7fJzqKafE9n1peKPmGM
         apx7g3jJbkjwINqWtg/9R2BG1MHgRkodgg/BO4vtLSlvtTpTJg4Xj0T83AGi/7TdmjwW
         s3SjqnTp7HbKTS4fxmVTWAUT9BMzVdBtMP6pWEVFXls8FdWRZnQ13G9PZFQ3VagtQFdA
         zcI7QK3KRQ6CJAXaLaH/+BZxLYJzeuOzbPsCkxZ+HH5Pn5JMIvwQypHfXtTK8VxAwoMs
         7oeROqD6I8HNZS2rCgpAmgDD4/8ZY39NJqRbjSn2dycyU6+2nbVn1oPfHgha2MIbXevZ
         oNJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si7034352ybk.227.2020.05.29.01.02.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 01:02:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeZyf-0000I5-KY
	for alex.bennee@linaro.org; Fri, 29 May 2020 04:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geert.uytterhoeven@gmail.com>)
 id 1jeZy2-0007t6-3J; Fri, 29 May 2020 04:02:14 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <geert.uytterhoeven@gmail.com>)
 id 1jeZxz-0007Hw-RO; Fri, 29 May 2020 04:02:13 -0400
Received: by mail-ot1-f68.google.com with SMTP id v17so1330732ote.0;
 Fri, 29 May 2020 01:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wzUYv93FzC6cTw6Rjq4nNb+mQGuSBsCe1ZGs1B9hAZ8=;
 b=ZpTnC5l7YNZBJk22MVWFUBgdKG49JQnS03HAec8y0t13Uz7KyR6R7TQrylk7+c3XH5
 JUEaaMdfVMt2GfctSvTgkt5gW4Ul8P2zbQei4AwxActpm1s4HoDyQOO6Gynv6BQb/YWj
 YKSE2oWQA3ph1PzWI+e+YmLEjNILXjHz9NsD8+7NAf2sh84QkgN5VP55NGKdQAtvTieL
 lkaIiTiIhek/hVp/K2bcikBNiA4oErnBiO0o/S8mTpnJj5VwxmFCygay+dUUEJF3zEiG
 NWaGgjckkSKhpGD1HP7RVV7HedJQyR5t4UPAUxEJmisWUqLB/ZuHxiZDy75y9TbM8j6o
 hCLg==
X-Gm-Message-State: AOAM5325Obg4cXOtv7u+8xiUKNzZC4KCf5zmHrbD6uQyv9djnxtKAYEF
 4ED+HsyIbTrnHsEQyciXflQi/9fPdLwxXKZEM0E=
X-Received: by 2002:a05:6830:1151:: with SMTP id
 x17mr5248017otq.250.1590739329716; 
 Fri, 29 May 2020 01:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200519084904.1069-1-geert+renesas@glider.be>
 <CAFEAcA9-wQ72_M+ZY+EbEgw1L9LVchBgpLivexFXVZ3HuCtcZg@mail.gmail.com>
 <CAMuHMdWrTbWTrLvMnX=60F+UqH6DJ9kDU1FZ5TnT2=mbah1yfg@mail.gmail.com>
 <CAFEAcA9TzPcWWiJNTQ=EZzsSVy5qTPz5DXTePGmXWBTxZg7i7w@mail.gmail.com>
In-Reply-To: <CAFEAcA9TzPcWWiJNTQ=EZzsSVy5qTPz5DXTePGmXWBTxZg7i7w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2020 10:01:57 +0200
Message-ID: <CAMuHMdX7rWDbO1s3Tbk7M0R8=BJr1PphGbUg3N49S6sq-W4cLA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Fix PL061 node name and properties
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.210.68;
 envelope-from=geert.uytterhoeven@gmail.com; helo=mail-ot1-f68.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 04:02:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Rob Herring <robh+dt@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0/ufU9KCADwD

Hi Peter,

CC Rob, who made these properties mandatory in the pl061 DT bindings.

On Fri, May 22, 2020 at 11:30 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> On Fri, 22 May 2020 at 09:29, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, May 21, 2020 at 6:59 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > On Tue, 19 May 2020 at 09:49, Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > > > Make the created node comply with the PL061 Device Tree bindings:
> > > >   - Use generic node name "gpio" instead of "pl061",
> > > >   - Add missing "#interrupt-cells" and "interrupt-controller"
> > > >     properties.
> > >
> > > Where have these properties come from? They must be optional,
> > > because in the version of the binding documentation from Linux
> > > 5.0 they're not described:
> > > https://elixir.bootlin.com/linux/v5.0/source/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
> >
> > Many old DT bindings are incomplete.
>
> Yeah, but production QEMU is out there in the world based on
> the old DT binding documentation. So you can't unilaterally
> make a part of the binding that wasn't documented and that QEMU
> didn't emit mandatory. It might be preferable for new QEMU to
> emit it, of course.

Indeed, else QEMU will differ (more) from real hardware. Most PL061
GPIO controllers in DTS files in upstream Linux are marked as interrupt
controllers (a few haven't been updated yet).

> > When running the validation on a device tree passed to the guest
> > (extracted from /sys/firmware/devicetree/base, converted to dts, and
> >  manually fixed up the phandles), the following is reported about the
> > pl061 node:
> >
> >     virt.dt.yaml: pl061@9030000: {'reg': [[0, 151191552, 0, 4096]],
> > 'gpio-controller': True, 'phandle': [[32771]], '#gpio-cells': [[2]],
> > 'clocks': [[32768]], '#interrupt-cells': [[2]], 'compatible':
> > ['arm,pl061', 'arm,primecell'], 'clock-names': ['apb_pclk'],
> > '$nodename': ['pl061@9030000']} is not valid under any of the given
> > schemas
> >     [...]
> >             virt.dt.yaml: pl061@9030000: 'interrupts' is a required property
> >
> >     virt.dt.yaml: pl061@9030000: $nodename:0: 'pl061@9030000' does not
> > match '^gpio@[0-9a-f]+$'
> >     virt.dt.yaml: pl061@9030000: 'interrupt-controller' is a required property
>
> This is just saying "the yaml says these things are mandatory".
> You could equally get rid of them by marking them optional in
> the yaml, right?
>
> Also, complaining about the nodename seems like a bug in the
> validation: it is not a mandatory part of the spec, just a
> recommendation.

I'll defer that one to Rob, too.

> > > Since the devicetree spec says that the interrupt-controller
> > > property "defines a node as an interrupt controller node"
> > > and a GPIO chip isn't an interrupt controller, this seems
> > > like some kind of error in the dtb binding. Maybe I'm
> > > missing something...
> >
> > PL061 is an interrupt controller, as it can assert its interrupt output
> > based on activity on GPIO input lines.
>
> By that logic the PL011 UART is an interrupt controller, because
> it can assert its interrupt output based on activity on the serial
> port input lines.

Doh, bad wording on my side :-)

> A GPIO controller is not an interrupt controller inherently.
> Maybe you can use it in a system design as an interrupt
> controller if you want to, and in that system's dtb perhaps
> it would make sense to label it as one, but the virt board's
> PL061 is in no way an interrupt controller -- it's just a GPIO
> controller.

Actually it is: the virt board has a gpio-keys node that ties the
Poweroff key to a PL061 GPIO. The Linux gpio-keys driver relies on
interrupts to detect key events (for IRQ incapable GPIOs you have to use
"gpio-keys-polled" instead). This can easily be verified by looking at
/proc/interrupts on the guest:

 48:          0  9030000.gpio   3 Edge      GPIO Key Poweroff

(Unfortunately I don't know how to trigger a virtual key press in the
 guest)

> > > What actually goes wrong if QEMU doesn't specify these
> > > properties?
> >
> > It means that other devices that have their interrupt output connected
> > to a PL061 GPIO input won't work, as their driver in the guest OS cannot
> > find the interrupt.  Note that arm/virt.c currently doesn't instantiate
> > such devices.

Seems I was wrong: arm/virt does have the Poweroff key, and Linux does
find the interrupt.

> OK. But why would we want to run an interrupt line through the GPIO
> controller when we have a perfectly good interrupt controller in
> the system already?

Because the GIC (usually?) does not have its interrupt lines brought
outside the SoC, but defers external interrupt handling to a specialized
external IRQ handling block, or to a GPIO controller with interrupt
capabilities (or to PCI MSI).
If you have an external (non-PCI) device that needs to trigger an
interrupt (e.g. an I2C sensor), its to be tied to the specialized block,
or to a GPIO controller.

> It might be reasonable to add the properties now to avoid setting
> a bear trap for ourselves in future; on the other hand if running
> interrupt lines through the GPIO controller doesn't work then it
> acts as a nudge to stop people adding devices that are wired
> up in a weird way.

There are plenty of working examples for this.

> > > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > > index 7dc96abf72cf2b9a..99593d7bce4d85cb 100644
> > > > --- a/hw/arm/virt.c
> > > > +++ b/hw/arm/virt.c
> > > > @@ -818,13 +818,15 @@ static void create_gpio(const VirtMachineState *vms)
> > > >                                       qdev_get_gpio_in(vms->gic, irq));
> > > >
> > > >      uint32_t phandle = qemu_fdt_alloc_phandle(vms->fdt);
> > > > -    nodename = g_strdup_printf("/pl061@%" PRIx64, base);
> > > > +    nodename = g_strdup_printf("/gpio@%" PRIx64, base);
> > >
> > > Does the devicetree binding really mandate what the node name is?
> > > I thought that finding the right device was doe via the
> > > 'compatible' string and the nodename could be whatever the
> > > device tree creator wanted.
> >
> > Matching is indeed done based on compatible value.
>
> OK, then we don't need to change the node name here. Lots
> of the other devices on the virt board have node names that
> happen to use the device name rather than being more generic.

Obviously these can (and IMHO should) be fixed, too, together with all
other validation issues.
Thanks!

Rob: full thread at
https://lore.kernel.org/qemu-devel/20200519084904.1069-1-geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
