Received: by 10.25.208.211 with SMTP id h202csp2739790lfg;
        Thu, 3 Mar 2016 06:57:09 -0800 (PST)
X-Received: by 10.140.220.207 with SMTP id q198mr3717186qhb.103.1457017029864;
        Thu, 03 Mar 2016 06:57:09 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 53si41344340qgt.99.2016.03.03.06.57.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 06:57:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abUgf-0001NN-3N
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 09:57:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gregory.estrade@gmail.com>) id 1abUfl-00009F-JD
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 09:56:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gregory.estrade@gmail.com>) id 1abUfj-0007NZ-Et
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 09:56:13 -0500
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:34896)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gregory.estrade@gmail.com>)
	id 1abUfa-0007Kl-PO; Thu, 03 Mar 2016 09:56:02 -0500
Received: by mail-io0-x241.google.com with SMTP id n190so2349861iof.2;
	Thu, 03 Mar 2016 06:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=gDOB9WxeRECOLEi+nVRup8ihxTpQaUUX2w/KbETKEBs=;
	b=d57ak80ZN2i/PWcOmLvUChcyStJ9quz+N6lNn7PeMdzhXjU4HeZM2w59aLTYxnYA0H
	iG32byFz0j40jl0Z3u9k3p8y1WeUsvS89s7PchZGtVhI6N1fO7F44A9w8/nduW379peM
	OC4b1x/in4bXPHFwAsC0rj3xLHFvgSuzdzs+VT2GZSJ3ojxfEHGQw1MeuDRyT+oYze+F
	CO/j/+CoiUMWqIzsZq2yC/y+8UEooCb6WqRfVVhgwgYAYbQvL/Z2SRJbyxVKYUl81I9E
	eXyZ0sf1r4DtScP1pSHfGHLz/HoYEcAYwjyLqIVXMk4VHLXzbatgHro4dwLHUWRir1k/
	75yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=gDOB9WxeRECOLEi+nVRup8ihxTpQaUUX2w/KbETKEBs=;
	b=Pz6Y9Wk0boBAbdwbYJp6uWVN4R8DLLY+LwHx3mItrX+O4oJ8mD6DN7fGiDN4d5rR1B
	PuQj99qkWJHhccYBLbhcVz/z/MdP8qDJumm2LQBH1EX59DxeUp+cdY2heAPqqRXIqAAW
	TWkhnZ4KtnHaKDgqSvmKJBypm0uecC4GE7HvN+MqWfkKpIels1s/YcU1/4g5eM06inHK
	frxF2y49Vw4EPEQZ/ZOJsbbLOFzJGkh7VVtapwSEANBd5wIcd7c/BikCR86zZAAzdWeW
	8Q7RVyH04FfPiukmc0e4/foQWPT1c3AZASVCji8kSeqRB6C3IhafxQ78wFDLZ+sfeTQY
	N8hw==
X-Gm-Message-State: AD7BkJI3dQOwJ2m3G4P0KQ6HlYHF33Ofyb4ogLsoPQQjA0KHduXymx57anFFXzX4y28Zc/RPPJ/AHMjcjS7r9w==
MIME-Version: 1.0
X-Received: by 10.107.169.68 with SMTP id s65mr3452362ioe.126.1457016961819;
	Thu, 03 Mar 2016 06:56:01 -0800 (PST)
Received: by 10.79.35.39 with HTTP; Thu, 3 Mar 2016 06:56:01 -0800 (PST)
In-Reply-To: <CAFEAcA8G92yYdFAa6P0fdK1KLULAD6rxNc=ENG5=Qp8Lxf8g2w@mail.gmail.com>
References: <1456787490-17112-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA8G92yYdFAa6P0fdK1KLULAD6rxNc=ENG5=Qp8Lxf8g2w@mail.gmail.com>
Date: Thu, 3 Mar 2016 15:56:01 +0100
Message-ID: <CAEJ1hmf=vkaqsyye3SvaTNKz40qYuWfetH6D1c4vGyGgSGHRxA@mail.gmail.com>
From: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=001a1142268870f00b052d263252
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::241
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH RFC] bcm2835_dma: add emulation of
	Raspberry Pi DMA controller
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6ly12xC5RGjh

--001a1142268870f00b052d263252
Content-Type: text/plain; charset=UTF-8

I'd be glad if you add a sign-off by me, but it doesn't matter much. Having
this work finally getting into mainstream thanks to Andrew is what matters
there.
Best regards,
Gregory

On Thu, Mar 3, 2016 at 3:24 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 29 February 2016 at 23:11, Andrew Baumann
> <Andrew.Baumann@microsoft.com> wrote:
> > Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> > ---
> > This patch applies on top of the previous series for Windows and
> > framebuffer support:
> >   https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg06387.html
> >
> > After preparing that, I was disappointed to discover that Raspbian
> > won't boot cleanly without the DMA controller. In the hope of beating
> > the freeze deadline (it's still February 29 here :-) I'm sending this
> > for review.
> >
> > After applying this patch, it is possible to boot Raspbian to the GUI
> > using a command such as:
> >
> >   qemu-system-arm -M raspi2 -kernel raspbian-boot/kernel7.img -sd
> >   2015-09-24-raspbian-jessie.img -append "rw earlyprintk loglevel=8
> >   console=ttyAMA0 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootwait"
> >   -dtb raspbian-boot/bcm2709-rpi-2-b.dtb -serial stdio
> >
> > As before, this derives from the original (out of tree) work of
> > Gregory Estrade, Stefan Weil and others to support Raspberry Pi
> > 1. This patch in particulary is Gregory's code, which I have cleaned
> > up for submission.
>
> Should it have a Signed-off-by: line and/or authorship line
> from Gregory, then?
>
> (This is largely about giving credit where due, so it's Gregory's
> choice really. I forget whether we've had this discussion before
> but I couldn't find anything in a quick sweep through earlier mail
> threads.)
>
> > +static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
> > +{
> > +    BCM2835DMAChan *ch = &s->chan[c];
> > +    uint32_t data, xlen, ylen;
> > +    int16_t dst_stride, src_stride;
> > +
> > +    if (!(s->enable & (1 << c))) {
> > +        return;
> > +    }
> > +
> > +    while ((s->enable & (1 << c)) && (ch->conblk_ad != 0)) {
> > +        /* CB fetch */
> > +        ch->ti = ldl_phys(&s->dma_as, ch->conblk_ad);
> > +        ch->source_ad = ldl_phys(&s->dma_as, ch->conblk_ad + 4);
> > +        ch->dest_ad = ldl_phys(&s->dma_as, ch->conblk_ad + 8);
> > +        ch->txfr_len = ldl_phys(&s->dma_as, ch->conblk_ad + 12);
> > +        ch->stride = ldl_phys(&s->dma_as, ch->conblk_ad + 16);
> > +        ch->nextconbk = ldl_phys(&s->dma_as, ch->conblk_ad + 20);
>
> These should use the ldl_{le,be}_phys functions. (If you care
> about modelling the response to "unreadable address" you can
> use address_space_ldl_{le,be}.)
>
> > +
> > +        if (ch->ti & BCM2708_DMA_TDMODE) {
> > +            /* 2D transfer mode */
> > +            ylen = (ch->txfr_len >> 16) & 0x3fff;
> > +            xlen = ch->txfr_len & 0xffff;
> > +            dst_stride = ch->stride >> 16;
> > +            src_stride = ch->stride & 0xffff;
> > +        } else {
> > +            ylen = 1;
> > +            xlen = ch->txfr_len;
> > +            dst_stride = 0;
> > +            src_stride = 0;
> > +        }
> > +
> > +        while (ylen != 0) {
> > +            /* Normal transfer mode */
> > +            while (xlen != 0) {
> > +                if (ch->ti & BCM2708_DMA_S_IGNORE) {
> > +                    /* Ignore reads */
> > +                    data = 0;
> > +                } else {
> > +                    data = ldl_phys(&s->dma_as, ch->source_ad);
> > +                }
> > +                if (ch->ti & BCM2708_DMA_S_INC) {
> > +                    ch->source_ad += 4;
> > +                }
> > +
> > +                if (ch->ti & BCM2708_DMA_D_IGNORE) {
> > +                    /* Ignore writes */
> > +                } else {
> > +                    stl_phys(&s->dma_as, ch->dest_ad, data);
> > +                }
> > +                if (ch->ti & BCM2708_DMA_D_INC) {
> > +                    ch->dest_ad += 4;
> > +                }
> > +
> > +                /* update remaining transfer length */
> > +                xlen -= 4;
> > +                if (ch->ti & BCM2708_DMA_TDMODE) {
> > +                    ch->txfr_len = (ylen << 16) | xlen;
> > +                } else {
> > +                    ch->txfr_len = xlen;
> > +                }
> > +            }
> > +
> > +            if (--ylen != 0) {
> > +                ch->source_ad += src_stride;
> > +                ch->dest_ad += dst_stride;
> > +            }
> > +        }
> > +        ch->cs |= BCM2708_DMA_END;
> > +        if (ch->ti & BCM2708_DMA_INT_EN) {
> > +            ch->cs |= BCM2708_DMA_INT;
> > +            s->int_status |= (1 << c);
> > +            qemu_set_irq(ch->irq, 1);
> > +        }
> > +
> > +        /* Process next CB */
> > +        ch->conblk_ad = ch->nextconbk;
> > +    }
>
> This loop allows a guest to make QEMU lock up (stop responding to monitor
> commands, etc) if it feeds the device a circular loop of CBs. On the other
> hand I don't think we have a good approach to avoiding this problem,
> so never mind.
>
> > +    ch->cs &= ~BCM2708_DMA_ACTIVE;
> > +}
> > +
> > +static uint64_t bcm2835_dma_read(BCM2835DMAState *s, hwaddr offset,
> > +                                 unsigned size, unsigned c)
> > +{
> > +    BCM2835DMAChan *ch = &s->chan[c];
> > +    uint32_t res = 0;
> > +
> > +    assert(size == 4);
> > +    assert(c < BCM2835_DMA_NCHANS);
>
> It's a bit late to assert after you've already used c as
> an array index... (the compiler is free to conclude that the
> condition must always be true, for instance.)
>
> > +
> > +    switch (offset) {
> > +    case BCM2708_DMA_CS:
> > +        res = ch->cs;
> > +        break;
> > +    case BCM2708_DMA_ADDR:
> > +        res = ch->conblk_ad;
> > +        break;
> > +    case BCM2708_DMA_INFO:
> > +        res = ch->ti;
> > +        break;
> > +    case BCM2708_DMA_SOURCE_AD:
> > +        res = ch->source_ad;
> > +        break;
> > +    case BCM2708_DMA_DEST_AD:
> > +        res = ch->dest_ad;
> > +        break;
> > +    case BCM2708_DMA_TXFR_LEN:
> > +        res = ch->txfr_len;
> > +        break;
> > +    case BCM2708_DMA_STRIDE:
> > +        res = ch->stride;
> > +        break;
> > +    case BCM2708_DMA_NEXTCB:
> > +        res = ch->nextconbk;
> > +        break;
> > +    case BCM2708_DMA_DEBUG:
> > +        res = ch->debug;
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset
> %"HWADDR_PRIx"\n",
> > +                      __func__, offset);
> > +        break;
> > +    }
> > +    return res;
> > +}
> > +
> > +static void bcm2835_dma_write(BCM2835DMAState *s, hwaddr offset,
> > +                              uint64_t value, unsigned size, unsigned c)
> > +{
> > +    BCM2835DMAChan *ch = &s->chan[c];
> > +    uint32_t oldcs;
> > +
> > +    assert(size == 4);
> > +    assert(c < BCM2835_DMA_NCHANS);
> > +
> > +    switch (offset) {
> > +    case BCM2708_DMA_CS:
> > +        oldcs = ch->cs;
> > +        if (value & BCM2708_DMA_RESET) {
> > +            ch->cs |= BCM2708_DMA_RESET;
>
> The comment about this bit earlier says it's self-clearing, but I
> don't see where it gets cleared.
>
> Otherwise looks OK.
>
> thanks
> -- PMM
>

--001a1142268870f00b052d263252
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;d be glad if you add a sign-off by me, but it doesn&=
#39;t matter much. Having this work finally getting into mainstream thanks =
to Andrew is what matters there.<div>Best regards,</div><div>Gregory</div><=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Mar =
3, 2016 at 3:24 PM, Peter Maydell <span dir=3D"ltr">&lt;<a href=3D"mailto:p=
eter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">On 29 February 2016 at 23:=
11, Andrew Baumann<br>
<span class=3D"">&lt;<a href=3D"mailto:Andrew.Baumann@microsoft.com">Andrew=
.Baumann@microsoft.com</a>&gt; wrote:<br>
&gt; Signed-off-by: Andrew Baumann &lt;<a href=3D"mailto:Andrew.Baumann@mic=
rosoft.com">Andrew.Baumann@microsoft.com</a>&gt;<br>
&gt; ---<br>
&gt; This patch applies on top of the previous series for Windows and<br>
&gt; framebuffer support:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2=
016-02/msg06387.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gn=
u.org/archive/html/qemu-devel/2016-02/msg06387.html</a><br>
&gt;<br>
&gt; After preparing that, I was disappointed to discover that Raspbian<br>
&gt; won&#39;t boot cleanly without the DMA controller. In the hope of beat=
ing<br>
&gt; the freeze deadline (it&#39;s still February 29 here :-) I&#39;m sendi=
ng this<br>
&gt; for review.<br>
&gt;<br>
&gt; After applying this patch, it is possible to boot Raspbian to the GUI<=
br>
&gt; using a command such as:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0qemu-system-arm -M raspi2 -kernel raspbian-boot/kernel7.im=
g -sd<br>
&gt;=C2=A0 =C2=A02015-09-24-raspbian-jessie.img -append &quot;rw earlyprint=
k loglevel=3D8<br>
&gt;=C2=A0 =C2=A0console=3DttyAMA0 dwc_otg.lpm_enable=3D0 root=3D/dev/mmcbl=
k0p2 rootwait&quot;<br>
&gt;=C2=A0 =C2=A0-dtb raspbian-boot/bcm2709-rpi-2-b.dtb -serial stdio<br>
&gt;<br>
&gt; As before, this derives from the original (out of tree) work of<br>
&gt; Gregory Estrade, Stefan Weil and others to support Raspberry Pi<br>
&gt; 1. This patch in particulary is Gregory&#39;s code, which I have clean=
ed<br>
&gt; up for submission.<br>
<br>
</span>Should it have a Signed-off-by: line and/or authorship line<br>
from Gregory, then?<br>
<br>
(This is largely about giving credit where due, so it&#39;s Gregory&#39;s<b=
r>
choice really. I forget whether we&#39;ve had this discussion before<br>
but I couldn&#39;t find anything in a quick sweep through earlier mail<br>
threads.)<br>
<span class=3D""><br>
&gt; +static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 BCM2835DMAChan *ch =3D &amp;s-&gt;chan[c];<br>
&gt; +=C2=A0 =C2=A0 uint32_t data, xlen, ylen;<br>
&gt; +=C2=A0 =C2=A0 int16_t dst_stride, src_stride;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!(s-&gt;enable &amp; (1 &lt;&lt; c))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 while ((s-&gt;enable &amp; (1 &lt;&lt; c)) &amp;&amp; (=
ch-&gt;conblk_ad !=3D 0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* CB fetch */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ch-&gt;ti =3D ldl_phys(&amp;s-&gt;dma_as,=
 ch-&gt;conblk_ad);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ch-&gt;source_ad =3D ldl_phys(&amp;s-&gt;=
dma_as, ch-&gt;conblk_ad + 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ch-&gt;dest_ad =3D ldl_phys(&amp;s-&gt;dm=
a_as, ch-&gt;conblk_ad + 8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ch-&gt;txfr_len =3D ldl_phys(&amp;s-&gt;d=
ma_as, ch-&gt;conblk_ad + 12);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ch-&gt;stride =3D ldl_phys(&amp;s-&gt;dma=
_as, ch-&gt;conblk_ad + 16);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ch-&gt;nextconbk =3D ldl_phys(&amp;s-&gt;=
dma_as, ch-&gt;conblk_ad + 20);<br>
<br>
</span>These should use the ldl_{le,be}_phys functions. (If you care<br>
about modelling the response to &quot;unreadable address&quot; you can<br>
use address_space_ldl_{le,be}.)<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ch-&gt;ti &amp; BCM2708_DMA_TDMODE) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 2D transfer mode */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ylen =3D (ch-&gt;txfr_len &=
gt;&gt; 16) &amp; 0x3fff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xlen =3D ch-&gt;txfr_len &a=
mp; 0xffff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst_stride =3D ch-&gt;strid=
e &gt;&gt; 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_stride =3D ch-&gt;strid=
e &amp; 0xffff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ylen =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xlen =3D ch-&gt;txfr_len;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst_stride =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_stride =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (ylen !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Normal transfer mode */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (xlen !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ch-&gt;ti=
 &amp; BCM2708_DMA_S_IGNORE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /* Ignore reads */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 data =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 data =3D ldl_phys(&amp;s-&gt;dma_as, ch-&gt;source_ad);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ch-&gt;ti=
 &amp; BCM2708_DMA_S_INC) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ch-&gt;source_ad +=3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ch-&gt;ti=
 &amp; BCM2708_DMA_D_IGNORE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /* Ignore writes */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 stl_phys(&amp;s-&gt;dma_as, ch-&gt;dest_ad, data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ch-&gt;ti=
 &amp; BCM2708_DMA_D_INC) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ch-&gt;dest_ad +=3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* update rem=
aining transfer length */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xlen -=3D 4;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ch-&gt;ti=
 &amp; BCM2708_DMA_TDMODE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ch-&gt;txfr_len =3D (ylen &lt;&lt; 16) | xlen;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ch-&gt;txfr_len =3D xlen;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (--ylen !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ch-&gt;source=
_ad +=3D src_stride;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ch-&gt;dest_a=
d +=3D dst_stride;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ch-&gt;cs |=3D BCM2708_DMA_END;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ch-&gt;ti &amp; BCM2708_DMA_INT_EN) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ch-&gt;cs |=3D BCM2708_DMA_=
INT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;int_status |=3D (1 &l=
t;&lt; c);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(ch-&gt;irq, 1)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Process next CB */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ch-&gt;conblk_ad =3D ch-&gt;nextconbk;<br=
>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
</div></div>This loop allows a guest to make QEMU lock up (stop responding =
to monitor<br>
commands, etc) if it feeds the device a circular loop of CBs. On the other<=
br>
hand I don&#39;t think we have a good approach to avoiding this problem,<br=
>
so never mind.<br>
<span class=3D""><br>
&gt; +=C2=A0 =C2=A0 ch-&gt;cs &amp;=3D ~BCM2708_DMA_ACTIVE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint64_t bcm2835_dma_read(BCM2835DMAState *s, hwaddr offset,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned size, unsigned c)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 BCM2835DMAChan *ch =3D &amp;s-&gt;chan[c];<br>
&gt; +=C2=A0 =C2=A0 uint32_t res =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 assert(size =3D=3D 4);<br>
&gt; +=C2=A0 =C2=A0 assert(c &lt; BCM2835_DMA_NCHANS);<br>
<br>
</span>It&#39;s a bit late to assert after you&#39;ve already used c as<br>
an array index... (the compiler is free to conclude that the<br>
condition must always be true, for instance.)<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (offset) {<br>
&gt; +=C2=A0 =C2=A0 case BCM2708_DMA_CS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D ch-&gt;cs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case BCM2708_DMA_ADDR:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D ch-&gt;conblk_ad;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case BCM2708_DMA_INFO:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D ch-&gt;ti;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case BCM2708_DMA_SOURCE_AD:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D ch-&gt;source_ad;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case BCM2708_DMA_DEST_AD:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D ch-&gt;dest_ad;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case BCM2708_DMA_TXFR_LEN:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D ch-&gt;txfr_len;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case BCM2708_DMA_STRIDE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D ch-&gt;stride;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case BCM2708_DMA_NEXTCB:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D ch-&gt;nextconbk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 case BCM2708_DMA_DEBUG:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D ch-&gt;debug;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: =
Bad offset %&quot;HWADDR_PRIx&quot;\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 __func__, offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return res;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void bcm2835_dma_write(BCM2835DMAState *s, hwaddr offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t value, unsigned size, unsigned=
 c)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 BCM2835DMAChan *ch =3D &amp;s-&gt;chan[c];<br>
&gt; +=C2=A0 =C2=A0 uint32_t oldcs;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 assert(size =3D=3D 4);<br>
&gt; +=C2=A0 =C2=A0 assert(c &lt; BCM2835_DMA_NCHANS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (offset) {<br>
&gt; +=C2=A0 =C2=A0 case BCM2708_DMA_CS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oldcs =3D ch-&gt;cs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; BCM2708_DMA_RESET) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ch-&gt;cs |=3D BCM2708_DMA_=
RESET;<br>
<br>
</div></div>The comment about this bit earlier says it&#39;s self-clearing,=
 but I<br>
don&#39;t see where it gets cleared.<br>
<br>
Otherwise looks OK.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div>

--001a1142268870f00b052d263252--
