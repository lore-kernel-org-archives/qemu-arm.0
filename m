Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp90165njb;
        Mon, 17 Feb 2025 07:01:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+NREsLuSiNHajVR+Ck9Fw5fxivnXf8UEhpFjUrfFhrbOG5m2O2/+oaBjqiz0eFpT9frvY7HqmRDAXjQ==@linaro.org
X-Received: by 2002:a05:600c:1e26:b0:439:7dfe:f12 with SMTP id 5b1f17b1804b1-4397dfe11eamr52669935e9.5.1739804511150;
        Mon, 17 Feb 2025 07:01:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739804511; cv=none;
        d=google.com; s=arc-20240605;
        b=kANV3I0gkqyIOHxKfNhzUSjwrondZ9SW/vzmooz5OF94eGicefvVWW95nkQhg3gLZ8
         wy47gKhGqR2EZt55tjmfHS/TYqKd3xYCEv2iI4g35OwVcwozd1jMN2Idkdcl1ci9FWuU
         8vxJ2r1CKOqwoDKZDHyntoE6sjdT+Qs9bPf1YWwxli3isMfb5ndQTj6hW+S+3ZyZBWxn
         Ro6DFIbjyl5mIdnwgV+59+8Ihjc447vBltPSVOgI3/rPkjBgap6lqbr/Ed/RoJSCVfqI
         V4codEyO81h249n4L2KlnBSh/l0gr9UPVFrBUAQvG/dyPK6cLf0P8v5+b9Hw6ORXW069
         32uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6AAzIQyMN9qYAjU2Tp3QEwJMsCO2X01fJXoL87c9eZM=;
        fh=3qSfCF3vtSxM4KPnr905RG7vsAJqEfIj70szSiPEREI=;
        b=cnChbxOit8PqESR1bbnkHGAY/Z4nWs3mYWGVhNyEqSXSAZvrtpJrDq1kbcfUyZuAS4
         Gssi4U/RtAvE2WUUugWS5TxGScyPoZkdAusTYlgw6SCCtfFYi7TgoNzePxXYCwEweoHS
         zZfAmTjSNKSeP8zMqVCJGR9ZGifw3+vm87F5HgYmNtWRsRmPoVxY39czhMZYpaPsP60l
         7h4rWFo5eTne4BdetJ+er+yoPJyPJNoM+RsDPLx2sKr6SGkzVYVKmNZcPnxBfL7wwPra
         qZnHejRZyJwabfWyMirYAdln9609C+CDhXjdiQGf/RDLhHrzUQHOR+TwNMZHdcWpPH7L
         KJ6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qTMf9hnz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4398a92561asor5129765e9.6.2025.02.17.07.01.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 07:01:51 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qTMf9hnz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739804510; x=1740409310; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6AAzIQyMN9qYAjU2Tp3QEwJMsCO2X01fJXoL87c9eZM=;
        b=qTMf9hnziZjoELLhhNJ2GyWfT+o7CiQ3fwPYlhsIVYGHugB3+UYo2NZthWgOdO/7tx
         6asS08NN7XCnAb9lz5RhO5vOtr7tUsw3pwlcwlJbr7dVNFtwtCPRZtSnwtXQ3hOhwWAV
         5IcGkJA8GMj+q/Pncv1kf6MR5K8UAZg+py+pGT7Z8Y2Xid76O2a1FtYFU9sA9RfQxdaj
         6USxx78Ki24Zhxfi/gSlQ0X77i9X79/DhpQa9m6mS/BFo6yh7VyF6GSOdJdhuV7AwuXG
         TmbveOJsDLGRP9fINwQYggLmmr5UpSaVWZiOUit+LAOVxt2tBetHo84qc+qvg0Ejxljs
         fTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739804510; x=1740409310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6AAzIQyMN9qYAjU2Tp3QEwJMsCO2X01fJXoL87c9eZM=;
        b=a0PssGqzl5A/7vVbE5KFsRzDkRPxtxWKKjzWzLhzvvqHLjRVEebIPLJXhFZh7RTYJh
         GJVJsPFaQNboSb2sBiacSCvgZ6tq3ttGPj+MNm9vtFCiRaoTuBprricmke9R6aE7/gJj
         xQDZWXFUQ/4+u12mjRP4U+L+kzMj+rimHcCnvIX+JhqU7SGQU3To3a1i9wqTbbcZrBGO
         ndb/Ei+VMFDlEHHXhbBiwQas1yjxlhkpTcIu1zF/ksMwnR11cp+5l+1gbZ8KdIOeEc21
         Yd6Zk2tViVHIocsa4/RmuFgbnqKeaInqgG9tECnqD661rjM48E04NQmQy1LZMqhWjAhF
         FFXA==
X-Forwarded-Encrypted: i=1; AJvYcCUwTL9MYWdv13Gc5dcpqMj/aWYpbXhUwJAUWYi+WHbLvR4uoQzfyTlFcjL6pvDuS/xO8yxyVsLA1BI/YA==@linaro.org
X-Gm-Message-State: AOJu0Yxqj13fXEm3ihoHC1l5ndkOzhqG5JTnF92D08Cp3z0y304KNEjd
	ARLLwrIbmTHTnYLKaFWkGRINDj/vtSZlgqsNknQsTwgM8qix4lQxuMYk05hO8HNWbw==
X-Gm-Gg: ASbGncsFT3VTQ+dvTcOBPpNrFsDtdHhTKPSwi5sYtvNIFBuLc7Fpx77EYRbizauC7J3
	F0luZek5/uAJ/vYt8K1X08qIQtXwUzIYnSPLpVIoKZvtpm9WSnIy9/qGZKbKsdGPPb5i4PP8mEX
	vdWs6oaZeVFZNGp57IN1KYynCAzMQk1YzUfBFwHwXBZhoIkYr4WRWDcxPVuZhRTMugxd55Ppx9W
	1BecYRQHWfglsVBKIPueWVeTG1NLn5czZOGu7Q2cSx9TWPhLwZSHstJULIVAUwD7iP49fAx/PWT
	tgHR35F9Gpx3arPQzv3kGJXJqyIRow==
X-Google-Smtp-Source: AGHT+IFgDPjon7CRTeHv9/585GbSQr6lPZYnnAggj/PUO7tDZNXLK2wK8w5zFFGob2D/MOxoGAi5KA==
X-Received: by 2002:a05:6000:1862:b0:38f:4c8a:d5ea with SMTP id ffacd0b85a97d-38f4c8ad67cmr1782672f8f.22.1739804510055;
        Mon, 17 Feb 2025 07:01:50 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.121] ([176.167.144.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b432asm12235412f8f.6.2025.02.17.07.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 07:01:49 -0800 (PST)
Message-ID: <17651f42-8a9d-444c-8598-b0a6c099cbe6@linaro.org>
Date: Mon, 17 Feb 2025 16:01:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] hw/char/pl011: Consider TX FIFO overrun error
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250208163911.54522-1-philmd@linaro.org>
 <20250208163911.54522-6-philmd@linaro.org>
 <CAFEAcA8ZSSD=TxCier0Ji8+DVDspgqKQeKJyVDZ+LEBy=j9=Lw@mail.gmail.com>
 <CAFEAcA_MLUCqBPLfdwp1u-TEFLz-u5MsmAFeGEYfpOgC0cX8zQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_MLUCqBPLfdwp1u-TEFLz-u5MsmAFeGEYfpOgC0cX8zQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: uMzHu8XzkXnB

On 17/2/25 15:52, Peter Maydell wrote:
> On Mon, 17 Feb 2025 at 14:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Sat, 8 Feb 2025 at 16:39, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>
>>> When transmission is disabled, characters are still queued
>>> to the FIFO which eventually overruns. Report that error
>>> condition in the status register.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/char/pl011.c      | 20 ++++++++++++++++++++
>>>   hw/char/trace-events |  2 ++
>>>   2 files changed, 22 insertions(+)
>>>
>>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
>>> index 447f185e2d5..ef39ab666a2 100644
>>> --- a/hw/char/pl011.c
>>> +++ b/hw/char/pl011.c
>>> @@ -61,6 +61,9 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
>>>   /* Data Register, UARTDR */
>>>   #define DR_BE   (1 << 10)
>>>
>>> +/* Receive Status Register/Error Clear Register, UARTRSR/UARTECR */
>>> +#define RSR_OE  (1 << 3)
>>> +
>>>   /* Interrupt status bits in UARTRIS, UARTMIS, UARTIMSC */
>>>   #define INT_OE (1 << 10)
>>>   #define INT_BE (1 << 9)
>>> @@ -158,6 +161,16 @@ static inline unsigned pl011_get_fifo_depth(PL011State *s)
>>>       return pl011_is_fifo_enabled(s) ? PL011_FIFO_DEPTH : 1;
>>>   }
>>>
>>> +static bool pl011_is_tx_fifo_full(PL011State *s)
>>> +{
>>> +    if (pl011_is_fifo_enabled(s)) {
>>> +        trace_pl011_fifo_tx_is_full("FIFO", fifo8_is_full(&s->xmit_fifo));
>>> +        return fifo8_is_full(&s->xmit_fifo);
>>> +    }
>>> +    trace_pl011_fifo_tx_is_full("CHAR", !fifo8_is_empty(&s->xmit_fifo));
>>> +    return !fifo8_is_empty(&s->xmit_fifo);
>>
>> More repetition of expressions, but anyway
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Here I propose to squash in this tweak:
> 
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -165,12 +165,13 @@ static inline unsigned pl011_get_fifo_depth(PL011State *s)
> 
>   static bool pl011_is_tx_fifo_full(PL011State *s)
>   {
> -    if (pl011_is_fifo_enabled(s)) {
> -        trace_pl011_fifo_tx_is_full("FIFO", fifo8_is_full(&s->xmit_fifo));
> -        return fifo8_is_full(&s->xmit_fifo);
> -    }
> -    trace_pl011_fifo_tx_is_full("CHAR", !fifo8_is_empty(&s->xmit_fifo));
> -    return !fifo8_is_empty(&s->xmit_fifo);
> +    bool fifo_enabled = pl011_is_fifo_enabled(s);
> +    bool tx_fifo_full = fifo_enabled ?
> +        fifo8_is_full(&s->xmit_fifo) : !fifo8_is_empty(&s->xmit_fifo);
> +
> +    trace_pl011_fifo_tx_is_full(fifo_enabled ? "FIFO" : "CHAR",
> +                                tx_fifo_full);
> +    return tx_fifo_full;
>   }

Thank you, appreciated!

> 
> thanks
> -- PMM
