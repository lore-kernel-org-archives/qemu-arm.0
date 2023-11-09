Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp825065ejq;
        Thu, 9 Nov 2023 15:34:24 -0800 (PST)
X-Received: by 2002:a05:6808:1a8a:b0:3b6:4e58:dd54 with SMTP id bm10-20020a0568081a8a00b003b64e58dd54mr2643065oib.26.1699572864306;
        Thu, 09 Nov 2023 15:34:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699572864; cv=none;
        d=google.com; s=arc-20160816;
        b=KZWDrUNIn3vRvu73NYH7aKCamaL0QJfU+AOKMlkfR5mielpvQZXXp7Hi9J8rY7TDYX
         xcP9v4RxD7iq929NwUfbbxxab/C0tYm1yuuBepxPWBdhaaKo09+7jOuHZPvARGeOcVmf
         q++Js1MBy8oKrHDZdCFaJLoBUEUh2EVIQeCSYtICsqYXGPcHmByqLQfd75Wl+nYRUChO
         phrsyP+VoEUiQc4aDqxlk1UrA88NLcmTl8ivYBu8r42hed41CYzANEBtqWZJifIA5cuY
         wckMnuIW2v+ucPRIDJYM5Z+Fucfp84Ib3zFyRAHcn0T/3vxM8lOO0y0Wnv4wMp2vD9IT
         Uj0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=v3jppUeEd320Y8fdOz/rUSZHbzt53xKH4zhdrGWNlDo=;
        fh=fhNV6EMYPN76jrUN/t8QrsmYfpKAju5LBgcGi6qRGCU=;
        b=DEPALmPIwkqAvCuC1ZqXsUiXx0ogwaVV8zpABcmodzY4UdgPHsC0rFCEhVTDPfOHro
         zdXDq/MiUsNkLQvMcpSt1AJ7IOYPj3K+gNoHit4xJRyFMmOL+QHbphNSmRvKcwR11itv
         gCy5SJq25+tlVqOE6ks+klPZ3dESzbcF/Mwx0FGNZM+8nwKzU9afDuNv61z0sfV7mEOO
         FwbX12E44VTrMWY1mvBC8ktPnoGOe4MBNvmUGNUwiMjTy1fgNhF2aCVsvhFKtG+Am6ZV
         1YhcoZVn4qBvFd5XUPDmdwj+yZv7xlMiTB5AP/kxrz8SSAP0mgH1XDxomEHs7JDcjWTP
         ywuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wc6J5gDu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gn7-20020a0568082dc700b003ae23619098sor8426138oib.1.2023.11.09.15.34.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 15:34:24 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wc6J5gDu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699572864; x=1700177664; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v3jppUeEd320Y8fdOz/rUSZHbzt53xKH4zhdrGWNlDo=;
        b=wc6J5gDukjJ4kaI1YOzEBKGsrF2ftxnWxHKAMyUpohnveHJGtSXTS9kyYsJ9xMesNx
         2kWYOTh+n9Cww0117lmFovl4DPBso5OchbSDrZ0WsHIOT2POGoSgAsewoFd2GwpqI9Mt
         sMQ6e8jQxyFxRdEpYKE1rGBV8R+q7LL4g/AKDRzZD/PNqbBADOMbzzNTRDYFU7iQefa9
         FhHACWfeoFJEbHnpVfmsjm+2iAJ7ZG2d8Dh5/IdeNlThIIRnGLS59wTKKpIr9l96G6YZ
         rsG67NucNF44v12vxFCZtelo/C4uoSvUjkhyUr9f7XXKSKsKaRGPPYvr2RQyxaT0F32Q
         Vxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699572864; x=1700177664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v3jppUeEd320Y8fdOz/rUSZHbzt53xKH4zhdrGWNlDo=;
        b=JprMNj+NzRlxATljYfUtZFZSnjIQnXKa3TLJnTTB9punlRcSFFGKOTwkS6Gq8+y0zk
         fRv+SxVwq5vLTBqXRW7MRLDwSnhZQxRnoDK1Fd0UFlrMQ4bw4LXSPGuDiueMUDxlmKXZ
         rFryFou3QQP4nsGRyt+Wo279W00+UGByOXB8MUjF629zQe2t5v7ApRAp6LoHO0FnILkB
         oSKX64GRo5KIvkvSnDMAlQJ4oojpNuKdsR1xrwm9oxqfw8xkPZCb/oBqBER2rNVaLDHV
         E+rW41oGR4q4Jiyk5JYb+eKFukzCksVI64xdnkzAB++3BDdL9victvp3CNs/eWjEQS4S
         El3g==
X-Gm-Message-State: AOJu0Yzr2fYjO447bwG4BJGL+a9MxjS7WkN5VoAvyAKySeuPTKrp2XHf
	7QUXjxaAXxX/XfwE5xGx2zSadpwI
X-Google-Smtp-Source: AGHT+IFvAMWOwhO7wqRrIv2YKQqzWdvtS3FVFZLPhIW4lhB0BAwve4GdIdZKbU9n3ixE+P1cJ7kZ5A==
X-Received: by 2002:a05:6808:4c4:b0:3b2:dfa0:aea3 with SMTP id a4-20020a05680804c400b003b2dfa0aea3mr3849934oie.3.1699572863810;
        Thu, 09 Nov 2023 15:34:23 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2607:fb91:1ee6:29b:6626:64c4:1b48:c565? ([2607:fb91:1ee6:29b:6626:64c4:1b48:c565])
        by smtp.gmail.com with ESMTPSA id 29-20020a630a1d000000b0057412d84d25sm5191779pgk.4.2023.11.09.15.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 15:34:23 -0800 (PST)
Message-ID: <858ea782-e9da-4eed-a065-ef0266e01591@linaro.org>
Date: Thu, 9 Nov 2023 15:34:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2 v4 10/10] hw/char/pl011: Implement TX FIFO
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org,
 Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20231109192814.95977-1-philmd@linaro.org>
 <20231109192814.95977-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231109192814.95977-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zJCm2KCYopMs

On 11/9/23 11:28, Philippe Mathieu-Daudé wrote:
> If the UART back-end chardev doesn't drain data as fast as stdout
> does or blocks, buffer in the TX FIFO to try again later.
> 
> This avoids having the IO-thread busy waiting on chardev back-ends,
> reported recently when testing the Trusted Reference Stack and
> using the socket backend:
> https://linaro.atlassian.net/browse/TRS-149?focusedCommentId=149574
> 
> Implement registering a front-end 'watch' callback on back-end
> events, so we can resume transmitting when the back-end is writable
> again, not blocking the main loop.
> 
> Similarly to the RX FIFO path, FIFO level selection is not
> implemented (interrupt is triggered when a single byte is available
> in the FIFO).
> 
> We only migrate the TX FIFO if it is in use.
> 
> Reported-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> Suggested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/char/pl011.c      | 107 ++++++++++++++++++++++++++++++++++++++++---
>   hw/char/trace-events |   4 ++
>   2 files changed, 105 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index f474f56780..a14ece4f07 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -57,6 +57,9 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
>   /* Data Register, UARTDR */
>   #define DR_BE   (1 << 10)
>   
> +/* Receive Status Register/Error Clear Register, UARTRSR/UARTECR */
> +#define RSR_OE  (1 << 3)
> +
>   /* Interrupt status bits in UARTRIS, UARTMIS, UARTIMSC */
>   #define INT_OE (1 << 10)
>   #define INT_BE (1 << 9)
> @@ -156,6 +159,68 @@ static void pl011_reset_tx_fifo(PL011State *s)
>       fifo8_reset(&s->xmit_fifo);
>   }
>   
> +static gboolean pl011_drain_tx(PL011State *s)
> +{
> +    trace_pl011_fifo_tx_drain(fifo8_num_used(&s->xmit_fifo));
> +    pl011_reset_tx_fifo(s);
> +    s->rsr &= ~RSR_OE;
> +    return G_SOURCE_REMOVE;
> +}
> +
> +static gboolean pl011_xmit(void *do_not_use, GIOCondition cond, void *opaque)
> +{
> +    PL011State *s = opaque;
> +    int ret;
> +    const uint8_t *buf;
> +    uint32_t buflen;
> +    uint32_t count;
> +    bool tx_enabled;
> +
> +    tx_enabled = (s->cr & CR_UARTEN) && (s->cr & CR_TXE);
> +    if (!tx_enabled) {
> +        /*
> +         * If TX is disabled, nothing to do.
> +         * Keep the potentially used FIFO as is.
> +         */
> +        return G_SOURCE_REMOVE;
> +    }
> +
> +    if (!qemu_chr_fe_backend_connected(&s->chr)) {
> +        /* Instant drain the fifo when there's no back-end */
> +        return pl011_drain_tx(s);
> +    }
> +
> +    count = fifo8_num_used(&s->xmit_fifo);
> +    if (count < 1) {
> +        /* FIFO empty */
> +        return G_SOURCE_REMOVE;
> +    }

Could swap these two blocks.  Certainly the fifo does not need draining if it is empty...

> +    if (!fifo8_is_empty(&s->xmit_fifo)) {
> +        /* Reschedule another transmission if we couldn't transmit all */
> +        guint r = qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP,
> +                                        pl011_xmit, s);
> +        if (!r) {
> +            /* Error in back-end? */
> +            return pl011_drain_tx(s);
> +        }
> +    }
> +
> +    pl011_update(s);
> +
> +    return G_SOURCE_REMOVE;

The documentation for FEWatchFunc says you should be returning G_SOURCE_CONTINUE to leave 
the source in the main loop.  That certainly makes more sense than re-adding a watch when 
the fifo is not empty.  There's also no error handling to do then.  Just


     pl011_update(s);
     return fifo8_is_empty(&s->xmit_fifo) ? G_SOURCE_REMOVE : G_SOURCE_CONTINUE;

> +    case 12: /* UARTCR */ {
> +        uint16_t en_bits = s->cr & (CR_UARTEN | CR_TXE | CR_RXE);
> +        uint16_t dis_bits = value & (CR_UARTEN | CR_TXE | CR_RXE);
> +        if (en_bits ^ dis_bits && !fifo8_is_empty(&s->xmit_fifo)) {
> +            /*
> +             * If the UART is disabled in the middle of transmission
> +             * or reception, it completes the current character before
> +             * stopping.
> +             */
> +            pl011_xmit(NULL, G_IO_OUT, s);

This seems wrong.  You don't know that the host device is ready.

We will never transmit a partial character because the host will never accept less than 
one character at a time.  Therefore there's absolutely nothing we need to do in order to 
"complete the current character", which is the one we started with the *previous* pl011_xmit.

Just set the CR bits with no further comment.


r~
