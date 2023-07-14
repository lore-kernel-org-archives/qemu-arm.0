Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3856419eje;
        Fri, 14 Jul 2023 00:27:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:3494:b0:67a:8ed:cec with SMTP id cp20-20020a056a00349400b0067a08ed0cecmr2749303pfb.2.1689319678458;
        Fri, 14 Jul 2023 00:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689319678; cv=none;
        d=google.com; s=arc-20160816;
        b=o9CZQHumD0FpuqCre3WqjQrxG+hlrivps0MscsEg1AW1HZgiHhIgutOI4d8lVgt38q
         8naBPgPvqgmPISLaDtDyF0Zsq1BvtWwVmBcIBZ5dc+FDSFMh/W4schQlA+UjauohtsPQ
         9/qzkZqhRd/LPv6Mtz4NOD46BR0jBorRJkxeZ+OHAwuAOCk5LeukC1++q79Q2n33lixP
         Zry4xeFaZ0AkVpBvcMgrvNf7snasOBxYCSFI3jbmeYfi0usckLgfXB9iHMNz0hfzBz5e
         QVOcMfB8P9hyQ/w2l0AzYq4fBji28EX85btN2S147ygcaOiIiF4tXRZamFR+xM+PzzkZ
         HZjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IRNkAyYOxaYorrSx+EWNj/GqtvsCdKRzaPD2iT5Y+fs=;
        fh=bV1FKtOwQYMkLW8YMaj6mcOpoJ9C2r/NNmryPIpjQl4=;
        b=b4xe0G4ermAQWh1VNjbuUpQrBJgR5I0cjM6mx30HM6LPx5eyUXct95GnPpF02kU6ci
         rrXsiRyZ85Syomj4asAprDtRcdaS+l76RJ+rOhZ85B/tA9/MwMroKVYMq9c8IbVaeTeH
         CDOFnaqQhsJ5sbqRkffx3B/hBo1dHOTZfEi8LaaGWVk4rQx6v9GM90zXH7ewqD8qHBPU
         dqDmKEQX69Re0fchmteSsIaKdIBlBO7IJeRknXmgN0O21WazsltCvr2LJCqLSYratxNi
         gTR1lTl1c8thzlF8ZRevtzJu3OfgmlDb+bOtC+oiYZl5hOCx7aRrHvyNS/m4tcOjYWg+
         e4Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k3MELwL0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b21-20020aa79515000000b0066c6e0a49dasor319501pfp.0.2023.07.14.00.27.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 14 Jul 2023 00:27:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k3MELwL0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689319678; x=1691911678;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IRNkAyYOxaYorrSx+EWNj/GqtvsCdKRzaPD2iT5Y+fs=;
        b=k3MELwL0diu9sAkw/7ETssrEvUmofEJ3yM9GCVw+XeZy1SYc7eZR34heMQzqS7jhHF
         c8t6Q8bx5ylqdx3KBSlJRCwVZaZQiBMzXaiTt8IsXp1rGFmMSihhbeaUGGGhhBV+zmgh
         RagewraqnrTZm7DlRNsTRxIVZ+xxxsk5OmN9oAeUCdcNBSZl2fSH8hE5Kj4iVgg61z3C
         /TBPfwRClEOOFa6fxl4jJsGofNDgDxD4agaQrBkPQPFUPiUuH63YumU19oOyLyWBW+VY
         wHxZAdE/XeulYoxofOX6ATGRbxAyEfZsK2+EKqFmgyjnYBAQfWl+Ztleei10lUhlAW9H
         l7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689319678; x=1691911678;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IRNkAyYOxaYorrSx+EWNj/GqtvsCdKRzaPD2iT5Y+fs=;
        b=aIumpMEFDnA0Ll7HTz4iBOygyR06itgzCKvSK7LtmaovhExzLaka1LA04az9UkUQIq
         1MImaZhWPjvTaTHg0lOG2eeC1zA4VpG5K1O5zZLxnLcCt8zvPzdbHqUdc6w4Y3BzHRDH
         IFMrm1V1ZWb+8IFGheyazO3EF/uCdIkUEHJkuBfVXzw8yUhUW5e0J/qT90GQGL414ryX
         sa0VeOVRF5G1vucf1pmtX1OmgI37+XvcGjo6Z9BzBL1LpQ+9II5+HUzJaITfu1KJjYPK
         oJs2/jbQ3ez/FNATPTK5jTPIKkehCyzQiEUyDkWy0nJ+YovMeb2h5o+BSuV++/vVquCy
         SMlg==
X-Gm-Message-State: ABy/qLbZNqivQg64438AVVVk4ON9nxJZxzRb7qofNd7bHCAjb4uf5j4y
	NWnPpyZ3goPxgzE4I31+wzbi+82Gnp+9pL43Y+LaXsnl
X-Google-Smtp-Source: APBJJlFFsOnLXF1j+lTUlJBCrs88c10bHqIA2B+VU4NZ451YAayOrlynIUvPahnUMYa/B5m5NasXaA==
X-Received: by 2002:a05:6a00:2d20:b0:67a:20d0:b9bb with SMTP id fa32-20020a056a002d2000b0067a20d0b9bbmr3009177pfb.1.1689319677878;
        Fri, 14 Jul 2023 00:27:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.149.227] ([172.58.27.104])
        by smtp.gmail.com with ESMTPSA id fm12-20020a056a002f8c00b00666b6dc10desm6550256pfb.56.2023.07.14.00.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 00:27:57 -0700 (PDT)
Message-ID: <f9c35a6c-be32-7758-d78a-e63449f864b8@linaro.org>
Date: Fri, 14 Jul 2023 08:27:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v2 11/11] hw/char/pl011: Implement TX FIFO
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20230710175102.32429-1-philmd@linaro.org>
 <20230710175102.32429-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230710175102.32429-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: aO4+kAs44Zdy

On 7/10/23 18:51, Philippe Mathieu-Daudé wrote:
> +static gboolean pl011_xmit(void *do_not_use, GIOCondition cond, void *opaque)
> +{
> +    PL011State *s = opaque;
> +    int ret;
> +    const uint8_t *buf;
> +    uint32_t buflen;
> +    uint32_t count;
> +    bool tx_enabled;
> +
> +    if (!qemu_chr_fe_backend_connected(&s->chr)) {
> +        /* Instant drain the fifo when there's no back-end */
> +        return pl011_drain_tx(s);
> +    }
> +
> +    tx_enabled = s->cr & CR_UARTEN;

What happened to "Hello, World"?  We ought to be consistent.
For actual modeling, I think you need TXE too.

Where does UARTFR get updated after successfully transmitting data?

>   static void pl011_write_txdata(PL011State *s, const uint8_t *buf, int length)
> @@ -162,12 +218,32 @@ static void pl011_write_txdata(PL011State *s, const uint8_t *buf, int length)
>       if (!(s->cr & CR_TXE)) {
>           qemu_log_mask(LOG_GUEST_ERROR, "PL011 write data but TX disabled\n");
>       }
> +    if (!fifo8_is_empty(&s->xmit_fifo)) {
> +        /*
> +         * If the UART is disabled in the middle of transmission
> +         * or reception, it completes the current character before
> +         * stopping.
> +         */
> +        pl011_xmit(NULL, G_IO_OUT, s);
> +        return;
> +    }

Why is this in write_txdata?  I would expect to find this with a write to UARTCR.
You appear to *not* be queuing data unless the fifo is empty.

> +    if (length > fifo8_num_free(&s->xmit_fifo)) {
> +        /*
> +         * The FIFO contents remain valid because no more data is
> +         * written when the FIFO is full, only the contents of the
> +         * shift register are overwritten. The CPU must now read
> +         * the data, to empty the FIFO.
> +         */
> +        trace_pl011_fifo_tx_overrun();
> +        s->rsr |= RSR_OE;
> +        return;
> +    }
> +
> +    trace_pl011_fifo_tx_put(length);
> +    fifo8_push_all(&s->xmit_fifo, buf, length);

Since length will always be 1, probably we should just remove it.

> +static bool pl011_xmit_fifo_state_needed(void *opaque, int version_id)
> +{
> +    PL011State* s = opaque;
> +
> +    return pl011_is_fifo_enabled(s) && !fifo8_is_empty(&s->xmit_fifo);
> +}

Ok.

>   static int pl011_post_load(void *opaque, int version_id)
>   {
>       PL011State* s = opaque;
> @@ -455,6 +538,11 @@ static int pl011_post_load(void *opaque, int version_id)
>           s->read_pos = 0;
>       }
>   
> +    if (pl011_xmit_fifo_state_needed(s, version_id)) {
> +        /* Reschedule another transmission */
> +        qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP, pl011_xmit, s);
> +    }

Ok.

> @@ -473,6 +561,7 @@ static const VMStateDescription vmstate_pl011 = {
>           VMSTATE_UINT32(int_enabled, PL011State),
>           VMSTATE_UINT32(int_level, PL011State),
>           VMSTATE_UINT32_ARRAY(read_fifo, PL011State, PL011_FIFO_DEPTH),
> +        VMSTATE_FIFO8_TEST(xmit_fifo, PL011State, pl011_xmit_fifo_state_needed),

Not ok.

The new data should go in its own VMStateDescription, like vmstate_pl011_clock.


r~
