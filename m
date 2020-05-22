Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2394253lfb;
        Fri, 22 May 2020 02:30:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1LrMZMUmwqw7d188eyzDlhc7/vQFhH0qNwYfHz+cc0CFnGzA9aQl6yh6vYCKZp4N6YpPs
X-Received: by 2002:a25:9d82:: with SMTP id v2mr21895840ybp.268.1590139851577;
        Fri, 22 May 2020 02:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590139851; cv=none;
        d=google.com; s=arc-20160816;
        b=am77KvVpQ+i0zhZLt/tbWkJxH7IYHMx2XB2Pq/9pyObQ6K0nibFtUULGoQZXP69daT
         +ZbS7/OqQAViAWwBEog9IentP0FfLiof/4taUh09ixOeFpMsUOOK5ySEo46R/6T+LIKr
         Wiu6VzpcVyRJKiHBOKCLeZK9S3NuYiVkFTPsPNjjYTsHgq3FC+/oQdWQpnJDql+RKWiF
         vUbhcM/tSgPfLzEDZpLe1Oq6uNX4PelkHso0RJsZjwcHotkiSOi/Z8SG5FYOPbQBQFJ+
         qo2oHZ6HGrosWiADv63VVmqbCmCej3uDOTXtBNPsvdQ7k/AoMmRvZCmRQ64vtGy/5Ewf
         TU+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nF0Zz2tYNcVFNJ5PUvWvL3lB/NQEzfmuqjlJ2RrZJTk=;
        b=wPQZO5pEzVkWWyJ0T1GzdPP0aowNPsbSo69i3gCQri+P0gQ4EZdGAsbVcS+ZsLq6mS
         G5t4MnMPL0Bx/lfxzOfd4WwWHHKAZws5OY+vf476LrufMp66gg4ttP6ZtDC4PHBjba2V
         LFus73mVmiciFE7EFF6ZdJbefJIQ6YvCnFqJcaR3EfEhj4tQKeUrb8Q80nQs2NKqd+Le
         LeZzN3Vro1QyIuAFyPPTRls4SlqkWHp7qmyY2FiamfjuonUU8NYGZteTC2zf7lpkXDg8
         fEo5+XKfEk6cwNnxBH/CtWXx4cVyC2nJd5Lxi7RdMgNuO8LesUo2HOoJ1PvT2I60cP/p
         5aWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dbxEoQ1M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n63si7787340ybc.120.2020.05.22.02.30.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 02:30:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dbxEoQ1M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jc40w-0005SI-UY
	for alex.bennee@linaro.org; Fri, 22 May 2020 05:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc40p-0005QK-5v
 for qemu-arm@nongnu.org; Fri, 22 May 2020 05:30:43 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jc40n-0004fA-Ek
 for qemu-arm@nongnu.org; Fri, 22 May 2020 05:30:42 -0400
Received: by mail-ot1-x342.google.com with SMTP id h7so7772429otr.3
 for <qemu-arm@nongnu.org>; Fri, 22 May 2020 02:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nF0Zz2tYNcVFNJ5PUvWvL3lB/NQEzfmuqjlJ2RrZJTk=;
 b=dbxEoQ1MOgfk7i7ZyFjY/8t5tRCEHqnQcoCHd+aUie+5NIUA3x2osIfPWeg0/ybS9j
 BR32ym2906FD9OLdjCTDeucsprFeedFkJjZmeWqLAJ7umNYB1c/nOS2wDOrF0WbMjtRN
 LUUccD6Z8zLCNUvIaDSSX1jb7bbdzbRKYOLICJn0W3ieK6wYvfE8+h0wIu4EtufJudqG
 n+FvG1dXrd3K+9rS28/I+66hZgkpVul98WeXy1iGaECaZHzRBN8nXwR6H8YS9+0mD8a9
 IJ/o1ecRnSC3nwVGa0Ph+t1dq33keluxCxmRpfq7eiReSwXluN12ApIKXNqr1MSR1vDa
 VzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nF0Zz2tYNcVFNJ5PUvWvL3lB/NQEzfmuqjlJ2RrZJTk=;
 b=BvpbNhC5T5IuYhzwfDdb6HILGGMaR3R4WpOXNyiPia986V3mQ1XZ5T9cmD4OBKCysL
 MK4l4E05NWuI82TLqjrT3n7r/FbwjYAX1gUr8rFrnd4Z2DEioy5yHQQInXu9DjEvGT3R
 MYGkbb2YMeIvyv0awpklZ2Z/rgPXKj5z2LHAnaYnjSugXLWrtRAk1OyDiItuEJXNqB1Y
 pnhKfDHBGpU7gTIjR3BXlpEFZWknELML679pcFpvXQDtsFCZjg4zduaX1r9vH4QOknN9
 QjZbxwLKIHP87OY+sWK25Ro3soDN0hwy+NZU32MHxHHgIBAsUeXL5Fc33LYRjGEElX+i
 tzfg==
X-Gm-Message-State: AOAM5333j1mBuMeGn3vn4Z21C5lruPe0dfwPyH/VOTOLMK9COy6gWciN
 qEszHa3WQdJFlAqyRLf5KFlfHH9IR7FFOVWf0qlHNw==
X-Received: by 2002:a9d:b82:: with SMTP id 2mr9746842oth.221.1590139839986;
 Fri, 22 May 2020 02:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200519084904.1069-1-geert+renesas@glider.be>
 <CAFEAcA9-wQ72_M+ZY+EbEgw1L9LVchBgpLivexFXVZ3HuCtcZg@mail.gmail.com>
 <CAMuHMdWrTbWTrLvMnX=60F+UqH6DJ9kDU1FZ5TnT2=mbah1yfg@mail.gmail.com>
In-Reply-To: <CAMuHMdWrTbWTrLvMnX=60F+UqH6DJ9kDU1FZ5TnT2=mbah1yfg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 May 2020 10:30:28 +0100
Message-ID: <CAFEAcA9TzPcWWiJNTQ=EZzsSVy5qTPz5DXTePGmXWBTxZg7i7w@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Fix PL061 node name and properties
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yCa5yow0NC/n

On Fri, 22 May 2020 at 09:29, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Peter,
>
> On Thu, May 21, 2020 at 6:59 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > On Tue, 19 May 2020 at 09:49, Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Make the created node comply with the PL061 Device Tree bindings:
> > >   - Use generic node name "gpio" instead of "pl061",
> > >   - Add missing "#interrupt-cells" and "interrupt-controller"
> > >     properties.
> >
> > Where have these properties come from? They must be optional,
> > because in the version of the binding documentation from Linux
> > 5.0 they're not described:
> > https://elixir.bootlin.com/linux/v5.0/source/Documentation/devicetree/bindings/gpio/pl061-gpio.txt
>
> Many old DT bindings are incomplete.

Yeah, but production QEMU is out there in the world based on
the old DT binding documentation. So you can't unilaterally
make a part of the binding that wasn't documented and that QEMU
didn't emit mandatory. It might be preferable for new QEMU to
emit it, of course.

> When running the validation on a device tree passed to the guest
> (extracted from /sys/firmware/devicetree/base, converted to dts, and
>  manually fixed up the phandles), the following is reported about the
> pl061 node:
>
>     virt.dt.yaml: pl061@9030000: {'reg': [[0, 151191552, 0, 4096]],
> 'gpio-controller': True, 'phandle': [[32771]], '#gpio-cells': [[2]],
> 'clocks': [[32768]], '#interrupt-cells': [[2]], 'compatible':
> ['arm,pl061', 'arm,primecell'], 'clock-names': ['apb_pclk'],
> '$nodename': ['pl061@9030000']} is not valid under any of the given
> schemas
>     [...]
>             virt.dt.yaml: pl061@9030000: 'interrupts' is a required property
>
>     virt.dt.yaml: pl061@9030000: $nodename:0: 'pl061@9030000' does not
> match '^gpio@[0-9a-f]+$'
>     virt.dt.yaml: pl061@9030000: 'interrupt-controller' is a required property

This is just saying "the yaml says these things are mandatory".
You could equally get rid of them by marking them optional in
the yaml, right?

Also, complaining about the nodename seems like a bug in the
validation: it is not a mandatory part of the spec, just a
recommendation.

> > Since the devicetree spec says that the interrupt-controller
> > property "defines a node as an interrupt controller node"
> > and a GPIO chip isn't an interrupt controller, this seems
> > like some kind of error in the dtb binding. Maybe I'm
> > missing something...
>
> PL061 is an interrupt controller, as it can assert its interrupt output
> based on activity on GPIO input lines.

By that logic the PL011 UART is an interrupt controller, because
it can assert its interrupt output based on activity on the serial
port input lines.

A GPIO controller is not an interrupt controller inherently.
Maybe you can use it in a system design as an interrupt
controller if you want to, and in that system's dtb perhaps
it would make sense to label it as one, but the virt board's
PL061 is in no way an interrupt controller -- it's just a GPIO
controller.

> > What actually goes wrong if QEMU doesn't specify these
> > properties?
>
> It means that other devices that have their interrupt output connected
> to a PL061 GPIO input won't work, as their driver in the guest OS cannot
> find the interrupt.  Note that arm/virt.c currently doesn't instantiate
> such devices.

OK. But why would we want to run an interrupt line through the GPIO
controller when we have a perfectly good interrupt controller in
the system already?

It might be reasonable to add the properties now to avoid setting
a bear trap for ourselves in future; on the other hand if running
interrupt lines through the GPIO controller doesn't work then it
acts as a nudge to stop people adding devices that are wired
up in a weird way.

> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index 7dc96abf72cf2b9a..99593d7bce4d85cb 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -818,13 +818,15 @@ static void create_gpio(const VirtMachineState *vms)
> > >                                       qdev_get_gpio_in(vms->gic, irq));
> > >
> > >      uint32_t phandle = qemu_fdt_alloc_phandle(vms->fdt);
> > > -    nodename = g_strdup_printf("/pl061@%" PRIx64, base);
> > > +    nodename = g_strdup_printf("/gpio@%" PRIx64, base);
> >
> > Does the devicetree binding really mandate what the node name is?
> > I thought that finding the right device was doe via the
> > 'compatible' string and the nodename could be whatever the
> > device tree creator wanted.
>
> Matching is indeed done based on compatible value.

OK, then we don't need to change the node name here. Lots
of the other devices on the virt board have node names that
happen to use the device name rather than being more generic.

thanks
-- PMM
