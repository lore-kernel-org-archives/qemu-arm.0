Received: by 10.25.44.15 with SMTP id s15csp1094533lfs;
        Fri, 14 Jul 2017 08:46:05 -0700 (PDT)
X-Received: by 10.223.153.70 with SMTP id x64mr4956663wrb.18.1500047165008;
        Fri, 14 Jul 2017 08:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500047165; cv=none;
        d=google.com; s=arc-20160816;
        b=j572QaojKjs5n7Rgu5KVLPocA3cVu9JQ6weDlC6inVQI+i6r5FIWWu9GaZcIW/Yinc
         EXfqVwroZ87ufHmU9CnuHvfCeE75+FKl2txiiiqNfEfQ/Uf0e2WWftjy9XpnqYWcs6FA
         Mey5MyYFptpEaOW4rTMk+OPsWQMFSju/pbrfPsMCrBjiiOaKLlpHjSitKpXyA1nw/14O
         4vZ8l3mGAb/961Ll2pPjHSdTZR/kmQrFhoekvyA+49SSjt1NBGASQmcXM5bjocKMHpfD
         wnFB4y54VJ+Bp8IT8FdmwdaSAoPAy8neDl413MPu9HBgndmKwRK/pUUFafwJULAd8eyJ
         gSMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=whNGorIBylaubCJ+wDUJFjoGp/x8Nsi2so9KTSB2LXQ=;
        b=uem/ZtOB8lNyLRtSH/Q2gdnCjjLCIAxjhsvQJmJV+vr49AmEuJZ6I4KWHRl790rhnm
         UMGVneCc8ZwdnEAe9MeYdD5H4sILiono2wvtKzTy6mABNL02YuC3rU3ga4bCtqgj7gPq
         Fs882wi831y1jUkzN2gEMHVdb5BX3h6U5/2wzYIT4jZxG8hA2G5mdmSEdXiw0j0jhQK8
         XnXozW9ah4b1sM/17ssh5dWDa8wDdIOV4YRi3SEptEZbndkPjE2Tx+ayvYhCcwhU45Da
         HPhTeYUmMuZuJy9EmsI7EVZXyqgZAL5elIWK00i1C84VPvwwADjJxx8PFBqdejb2jdaQ
         r7sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=Wc6hoeea;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22b as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x22b.google.com (mail-wr0-x22b.google.com. [2a00:1450:400c:c0c::22b])
        by mx.google.com with ESMTPS id y192si2602773wmy.130.2017.07.14.08.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2017 08:46:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22b as permitted sender) client-ip=2a00:1450:400c:c0c::22b;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=Wc6hoeea;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22b as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x22b.google.com with SMTP id k67so69078296wrc.2
        for <alex.bennee@linaro.org>; Fri, 14 Jul 2017 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=whNGorIBylaubCJ+wDUJFjoGp/x8Nsi2so9KTSB2LXQ=;
        b=Wc6hoeeakBY/j9hYaaW9TMvb8dooCzFMSrGVNhZZ+skotceQ/VqRoNxMFz2ojB6EAE
         wbjHjKfDqV7SkxtMvkCY4hjde9Kopl6plfafC429C2MGfZYpMBQ+k3h9ArR3r/Powy70
         ys0/orOAJLQDSTolzPvTxsN0188/IgdIf7dgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=whNGorIBylaubCJ+wDUJFjoGp/x8Nsi2so9KTSB2LXQ=;
        b=A5DxRPHeLxkzIuFrocmmycKG4VWNYsNBePzAVFJZ4Gwez1UH4AFI9zGNOxHnfZaKJt
         xnkbjq4uJ7LhTPEb7p6doNI6WO7Bqo68hyZB+/vnfVy/9jMiU3yJqRQjfHe/TM0bWkx3
         Bv5WTRvqbV/HhK0aJqmaHBtnMdHFBcNsnmqYV5ynawDAGdnXefdaqZpgP5FnC1C6+TMw
         k/bUTWHQLv5813YFW1773QSFkgW8+dxRsV8L7Si6V8CTE0FEaf3dZseU6r7HrNpE6v0O
         uDWYW+X5ULCAt5rsqP5/u3MnFCacpmQ+I2aeuLi+1mngmZvMTM/pF4Tl63gyQicBOx55
         yMIQ==
X-Gm-Message-State: AIVw113FlAOsPuuAjZaPKmhHF+aZno8yrILP81ciXZZ1dR5YuspwB1BC
	LXKQyewb65t5lDLd1oxFXRUgtEUFf2NVgd/+eA==
X-Received: by 10.223.133.239 with SMTP id 44mr4886434wru.177.1500047164400;
 Fri, 14 Jul 2017 08:46:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 14 Jul 2017 08:45:43 -0700 (PDT)
In-Reply-To: <87mv87uj9r.fsf@linaro.org>
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
 <1500029487-14822-3-git-send-email-peter.maydell@linaro.org> <87mv87uj9r.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jul 2017 16:45:43 +0100
Message-ID: <CAFEAcA_NJpj_vigDCr8dy_OH5J4T50caAGFHZPC5a+nhdTH2Uw@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 2/9] hw/char/cmsdk-apb-uart.c: Implement
 CMSDK APB UART
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Alistair Francis <alistair.francis@xilinx.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: dDO+Qp10M05d

On 14 July 2017 at 16:32, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> Implement a model of the simple "APB UART" provided in
>> the Cortex-M System Design Kit (CMSDK).
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> This fails to compile, I think since
> 81517ba37a6cec59f92396b4722861868eb0a500 change the API for
> qemu_chr_fe_set_handlers.

>> +static void cmsdk_apb_uart_update(CMSDKAPBUART *s)
>> +{
>> +    /* update outbound irqs, including handling the way the rxo and txo
>> +     * interrupt status bits are just logical AND of the overrun bit in
>> +     * STATE and the overrun interrupt enable bit in CTRL.
>> +     */
>> +    uint32_t omask =3D (R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK);
>> +    s->intstatus &=3D ~omask;
>> +    s->intstatus |=3D (s->state & (s->ctrl >> 2) & omask);
>> +
>> +    qemu_set_irq(s->txint, !!(s->intstatus & R_INTSTATUS_TX_MASK));
>> +    qemu_set_irq(s->rxint, !!(s->intstatus & R_INTSTATUS_RX_MASK));
>> +    qemu_set_irq(s->txovrint, !!(s->intstatus & R_INTSTATUS_TXO_MASK));
>> +    qemu_set_irq(s->rxovrint, !!(s->intstatus & R_INTSTATUS_RXO_MASK));
>> +    qemu_set_irq(s->uartint, !!(s->intstatus));
>
> If we updated qemu_set_irq to take a bool instead of int would the !!
> hack no longer be needed?

I am fairly sure we have a few places that utilize the ability
to send an integer down the qemu_irq channel.

>> +    case A_STATE:
>> +        /* Bits 0 and 1 are read only; bits 2 and 3 are W1C */
>> +        s->state &=3D ~(value & 0xc);
>
> I guess:
>           s->state &=3D ~(value & (R_STATE_TXOVERRUN_MASK | R_STATE_RXOVE=
RRUN_MASK));
>
> maybe a little too verbose.

Well, it probably ought to use the bit mask names, yes.

>> +static void cmsdk_apb_uart_realize(DeviceState *dev, Error **errp)
>> +{
>> +    CMSDKAPBUART *s =3D CMSDK_APB_UART(dev);
>> +
>> +    if (s->pclk_frq =3D=3D 0) {
>> +        error_setg(errp, "CMSDK APB UART: pclk-frq property must be set=
");
>> +        return;
>> +    }
>> +
>> +    /* This UART has no flow control, so we do not need to register
>> +     * an event handler to deal with CHR_EVENT_BREAK.
>> +     */
>> +    qemu_chr_fe_set_handlers(&s->chr, uart_can_receive, uart_receive,
>> +                             NULL, s, NULL, true);
>
> I think this is now:
>
>     qemu_chr_fe_set_handlers(&s->chr, uart_can_receive, uart_receive,
>                              NULL, NULL, s, NULL, true);

Yes. It looks like we don't have to support backend swaps
(only hw/char/serial.c and virtio-console have support for that),
so just the extra NULL argument will do fine.

I propose to just fix both these nits in target-arm rather
than resend.

thanks
-- PMM
