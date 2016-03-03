Received: by 10.25.208.211 with SMTP id h202csp2725033lfg;
        Thu, 3 Mar 2016 06:25:15 -0800 (PST)
X-Received: by 10.141.1.87 with SMTP id c84mr3466844qhd.1.1457015115645;
        Thu, 03 Mar 2016 06:25:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t5si46526qgt.117.2016.03.03.06.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 06:25:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abUBm-0005J5-Ul
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 09:25:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abUBj-0005Ht-Ip
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 09:25:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abUBi-0007eT-BE
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 09:25:11 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:32774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abUBh-0007df-2j
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 09:25:10 -0500
Received: by mail-vk0-x234.google.com with SMTP id k1so6239654vkb.0
	for <qemu-arm@nongnu.org>; Thu, 03 Mar 2016 06:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BTDXb9DfloPON7EhgvQ5eDPVlzxdIbkWAx4+2Mj08Is=;
	b=QGk3cRavSKwzfOSwrvOzm3Kas2y5ECzuECZ3Fi4rHsKe9FErhdmXVfhnWo1X90gCE2
	W/pl04EQYTHPz2VFOiS/PxdjNPSiZn4AWlNVFQ/9tAHsSQS/tFio1/RJPAiVFTrlW5qw
	dumTmjiLfJqc147S9y1a14vSpJhyxTmxqvEXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BTDXb9DfloPON7EhgvQ5eDPVlzxdIbkWAx4+2Mj08Is=;
	b=WmppEBusMyyB/N+pXnOYXOg8FHrHyrEzMF+VQqHqrKvSX7gWD/qYrgMohHj5l7zRz6
	/4Jaglq04fqe9Sowc7uID2YIQwjRWHU0x3YWEfTHKCbE9sHTwCl5hKqiSnWtc74iFHh1
	V85g+D+8EjdF8Ab0q2au9UB5bwE3s03zMEFd3vsognxjNF+3CIIo19HxhgdJ07EJNukF
	/+z+wxDx9vzvtz9rHuAwGnnTKtCSWa9hpY7d2ysTcbINkRwQ8Ak252PLjoYjWPdyRV/0
	KrHTWiaxKk3Z09JAcRs/2/+HchCTcQGpfhOIiPzdT/NzRLRBS+iajU9bI1a79w3zZu5a
	k37A==
X-Gm-Message-State: AD7BkJI4ozrvsjFgBn6j6a004mfMrtHxZGBiJRAZuCW1UwF2oHabAiqaeAYE8psGMHfonkj0qQgSOAIFuv89qCGR
X-Received: by 10.31.47.207 with SMTP id v198mr2061881vkv.6.1457015108618;
	Thu, 03 Mar 2016 06:25:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 3 Mar 2016 06:24:49 -0800 (PST)
In-Reply-To: <1456787490-17112-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1456787490-17112-1-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2016 14:24:49 +0000
Message-ID: <CAFEAcA8G92yYdFAa6P0fdK1KLULAD6rxNc=ENG5=Qp8Lxf8g2w@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH RFC] bcm2835_dma: add emulation of Raspberry
	Pi DMA controller
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PKn2KnWnTtLr

On 29 February 2016 at 23:11, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
> This patch applies on top of the previous series for Windows and
> framebuffer support:
>   https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg06387.html
>
> After preparing that, I was disappointed to discover that Raspbian
> won't boot cleanly without the DMA controller. In the hope of beating
> the freeze deadline (it's still February 29 here :-) I'm sending this
> for review.
>
> After applying this patch, it is possible to boot Raspbian to the GUI
> using a command such as:
>
>   qemu-system-arm -M raspi2 -kernel raspbian-boot/kernel7.img -sd
>   2015-09-24-raspbian-jessie.img -append "rw earlyprintk loglevel=8
>   console=ttyAMA0 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootwait"
>   -dtb raspbian-boot/bcm2709-rpi-2-b.dtb -serial stdio
>
> As before, this derives from the original (out of tree) work of
> Gregory Estrade, Stefan Weil and others to support Raspberry Pi
> 1. This patch in particulary is Gregory's code, which I have cleaned
> up for submission.

Should it have a Signed-off-by: line and/or authorship line
from Gregory, then?

(This is largely about giving credit where due, so it's Gregory's
choice really. I forget whether we've had this discussion before
but I couldn't find anything in a quick sweep through earlier mail
threads.)

> +static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
> +{
> +    BCM2835DMAChan *ch = &s->chan[c];
> +    uint32_t data, xlen, ylen;
> +    int16_t dst_stride, src_stride;
> +
> +    if (!(s->enable & (1 << c))) {
> +        return;
> +    }
> +
> +    while ((s->enable & (1 << c)) && (ch->conblk_ad != 0)) {
> +        /* CB fetch */
> +        ch->ti = ldl_phys(&s->dma_as, ch->conblk_ad);
> +        ch->source_ad = ldl_phys(&s->dma_as, ch->conblk_ad + 4);
> +        ch->dest_ad = ldl_phys(&s->dma_as, ch->conblk_ad + 8);
> +        ch->txfr_len = ldl_phys(&s->dma_as, ch->conblk_ad + 12);
> +        ch->stride = ldl_phys(&s->dma_as, ch->conblk_ad + 16);
> +        ch->nextconbk = ldl_phys(&s->dma_as, ch->conblk_ad + 20);

These should use the ldl_{le,be}_phys functions. (If you care
about modelling the response to "unreadable address" you can
use address_space_ldl_{le,be}.)

> +
> +        if (ch->ti & BCM2708_DMA_TDMODE) {
> +            /* 2D transfer mode */
> +            ylen = (ch->txfr_len >> 16) & 0x3fff;
> +            xlen = ch->txfr_len & 0xffff;
> +            dst_stride = ch->stride >> 16;
> +            src_stride = ch->stride & 0xffff;
> +        } else {
> +            ylen = 1;
> +            xlen = ch->txfr_len;
> +            dst_stride = 0;
> +            src_stride = 0;
> +        }
> +
> +        while (ylen != 0) {
> +            /* Normal transfer mode */
> +            while (xlen != 0) {
> +                if (ch->ti & BCM2708_DMA_S_IGNORE) {
> +                    /* Ignore reads */
> +                    data = 0;
> +                } else {
> +                    data = ldl_phys(&s->dma_as, ch->source_ad);
> +                }
> +                if (ch->ti & BCM2708_DMA_S_INC) {
> +                    ch->source_ad += 4;
> +                }
> +
> +                if (ch->ti & BCM2708_DMA_D_IGNORE) {
> +                    /* Ignore writes */
> +                } else {
> +                    stl_phys(&s->dma_as, ch->dest_ad, data);
> +                }
> +                if (ch->ti & BCM2708_DMA_D_INC) {
> +                    ch->dest_ad += 4;
> +                }
> +
> +                /* update remaining transfer length */
> +                xlen -= 4;
> +                if (ch->ti & BCM2708_DMA_TDMODE) {
> +                    ch->txfr_len = (ylen << 16) | xlen;
> +                } else {
> +                    ch->txfr_len = xlen;
> +                }
> +            }
> +
> +            if (--ylen != 0) {
> +                ch->source_ad += src_stride;
> +                ch->dest_ad += dst_stride;
> +            }
> +        }
> +        ch->cs |= BCM2708_DMA_END;
> +        if (ch->ti & BCM2708_DMA_INT_EN) {
> +            ch->cs |= BCM2708_DMA_INT;
> +            s->int_status |= (1 << c);
> +            qemu_set_irq(ch->irq, 1);
> +        }
> +
> +        /* Process next CB */
> +        ch->conblk_ad = ch->nextconbk;
> +    }

This loop allows a guest to make QEMU lock up (stop responding to monitor
commands, etc) if it feeds the device a circular loop of CBs. On the other
hand I don't think we have a good approach to avoiding this problem,
so never mind.

> +    ch->cs &= ~BCM2708_DMA_ACTIVE;
> +}
> +
> +static uint64_t bcm2835_dma_read(BCM2835DMAState *s, hwaddr offset,
> +                                 unsigned size, unsigned c)
> +{
> +    BCM2835DMAChan *ch = &s->chan[c];
> +    uint32_t res = 0;
> +
> +    assert(size == 4);
> +    assert(c < BCM2835_DMA_NCHANS);

It's a bit late to assert after you've already used c as
an array index... (the compiler is free to conclude that the
condition must always be true, for instance.)

> +
> +    switch (offset) {
> +    case BCM2708_DMA_CS:
> +        res = ch->cs;
> +        break;
> +    case BCM2708_DMA_ADDR:
> +        res = ch->conblk_ad;
> +        break;
> +    case BCM2708_DMA_INFO:
> +        res = ch->ti;
> +        break;
> +    case BCM2708_DMA_SOURCE_AD:
> +        res = ch->source_ad;
> +        break;
> +    case BCM2708_DMA_DEST_AD:
> +        res = ch->dest_ad;
> +        break;
> +    case BCM2708_DMA_TXFR_LEN:
> +        res = ch->txfr_len;
> +        break;
> +    case BCM2708_DMA_STRIDE:
> +        res = ch->stride;
> +        break;
> +    case BCM2708_DMA_NEXTCB:
> +        res = ch->nextconbk;
> +        break;
> +    case BCM2708_DMA_DEBUG:
> +        res = ch->debug;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +                      __func__, offset);
> +        break;
> +    }
> +    return res;
> +}
> +
> +static void bcm2835_dma_write(BCM2835DMAState *s, hwaddr offset,
> +                              uint64_t value, unsigned size, unsigned c)
> +{
> +    BCM2835DMAChan *ch = &s->chan[c];
> +    uint32_t oldcs;
> +
> +    assert(size == 4);
> +    assert(c < BCM2835_DMA_NCHANS);
> +
> +    switch (offset) {
> +    case BCM2708_DMA_CS:
> +        oldcs = ch->cs;
> +        if (value & BCM2708_DMA_RESET) {
> +            ch->cs |= BCM2708_DMA_RESET;

The comment about this bit earlier says it's self-clearing, but I
don't see where it gets cleared.

Otherwise looks OK.

thanks
-- PMM
