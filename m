Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1491302ejo;
        Wed, 13 Dec 2023 01:13:21 -0800 (PST)
X-Received: by 2002:a05:600c:198b:b0:40c:4be1:ae11 with SMTP id t11-20020a05600c198b00b0040c4be1ae11mr2033894wmq.188.1702458800892;
        Wed, 13 Dec 2023 01:13:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702458800; cv=none;
        d=google.com; s=arc-20160816;
        b=PuGXVMvMVu02yWJCzk5G81LBn9kxOVJVKyZi0IEeP3pUJ19Xt3VvgOfToPSUZbmlrQ
         ms+PBGS0rIBVwj0GzidiSio6BySFw7TqHShZnS/wfI6OMoU/EgrQVrs2GYB4TXUuY+KR
         xN8ZpQd60bcJVPw5s6ZAWd15TztgE3Xx3BiSjIT5WFMATzAXaJQB8OkkyssCZu6HZEx2
         aNWfKBEftrsJx23jmk74j6NA82WJWucGLSqaZ9pawxpjeoBXhoNeu1nO2ac9bmMVnSKC
         n2OQnIPcEUxulMuJOQDU9X6iQZphYyIDhWwfuU+e1ABtOWkY/v9QiF5eHVs8hUjaXC6C
         ccmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3vCRBepvGDIF+h/atkNkxz5l7o+29hEqO81znVRZd54=;
        fh=whROT/TrZZWy3SjVspV1lQ66SoXcaNqXq+BZFjesvVU=;
        b=hc5AW+8ebFBDLqgLTw+GtT5WySA1fI9N56UiJtivA87MDld70CTOG9tdc2yfYJ4x6u
         whLgoJNCD/+FsxQOW9drFENevX5SM/4aEfuVQN/sRdP0OtlBTmH62rWzETqKOtGrU4OD
         bVJSvQHMJlklTvaUE28CQLSzn9rLURNLOYL13NvxOyD91/Shddlv3oY0mqRSg08cf8wi
         8ldcZ+cOADkUZ9xVmsIlsibWx0QBHREHJTZoB4CGN1J2kzF3qyEOIF5mxMXnKwq/IunX
         1YqQSoDUbZFslZCmQzskIrhZXMmUgcXKt5va8N8pLrY1tHUipy8tFjIVc7bjcc0ew6Wd
         pUng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SkSEyv+N;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v6-20020adfe4c6000000b003363eddd237sor184264wrm.7.2023.12.13.01.13.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Dec 2023 01:13:20 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SkSEyv+N;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702458800; x=1703063600; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3vCRBepvGDIF+h/atkNkxz5l7o+29hEqO81znVRZd54=;
        b=SkSEyv+N/rNUkby++LDOvlAJ7aJ44LqWq3XgLWMaIFTe7NF5ZpIy8PGdLG/BuBjUyq
         kLGaxQDKlVZG0zFnzesShzcAzmCpWIdyTgdmNxv+KWoxJBaGN5wdu0q0PPxpmcyg74GT
         ERt15CtBZ2vox9zOEshJ5Nuc1oVNbRjSrXf+6kqZteIChV5LaznmL3jlTnUb9b7O5PL+
         uCOUO/jqOA2RTkooIWPslPEEm5d6IDVNqBZKNoiHinLLPBcDFTFYV0cQVq3Dj6ZrcP+N
         wxZNz07Xp9lJ7GhXuLy7RS0zxiWUVKB3DMUVYDqPJeVjxp29dN+abKfwZsieo4Q7BCQ0
         2XIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702458800; x=1703063600;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3vCRBepvGDIF+h/atkNkxz5l7o+29hEqO81znVRZd54=;
        b=o6VusQtEA8z042c5F0/ZmMGFnjiPKuDf9cFECnvNhAaxS7oi9F22w+rj110M7I0tfB
         rWgzRUgb2Xu/cCDCz9ycJssHrouB8S2VSQXOx4GD24PncVn7Xlax591PmLIRtPere2e0
         Gj1AEY4qg+E8heC2OfvHNO2lIpdq+4RL5/e3sSF9dteVsE3XvSOvVANZ2iOHrU8cv3ub
         MjzfwoILL4do1nN/7XKSO7kFUrEKaHzYHRyQaMfslPqND3y0nSwFUjVcSJDogN4GfFmV
         PFXDVxq6SNE5uurvBmLu6qnyvzfqnSrAvYokIQ+aLW4KYCdfzEahbjVgwHIYaGEzmM0i
         nv0w==
X-Gm-Message-State: AOJu0YwjVERLwAx5mPeK5ckAI7K5I52bU9IHhaMoyVqMJicm6yo7kU3b
	4lF4wOPPEB1nHQfrqeoHMNHq5acSfTSIJwPiC27yVMcE
X-Google-Smtp-Source: AGHT+IE9xay8x/YNBjFbm+6BzCl5z3RD+Pky9tTfGzbEVRlsBLYbIRZLUEOA+vH420pZ2xd+I5XBfw==
X-Received: by 2002:a1c:7919:0:b0:40c:311d:c677 with SMTP id l25-20020a1c7919000000b0040c311dc677mr4091566wme.165.1702458800305;
        Wed, 13 Dec 2023 01:13:20 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.50.175] (109.red-88-28-22.dynamicip.rima-tde.net. [88.28.22.109])
        by smtp.gmail.com with ESMTPSA id jb4-20020a05600c54e400b0040c5cf930e6sm1139226wmb.19.2023.12.13.01.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 01:13:19 -0800 (PST)
Message-ID: <ffc9c69b-f66b-4520-81a3-a2f125a7b7ea@linaro.org>
Date: Wed, 13 Dec 2023 10:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2 v4 04/10] hw/char/pl011: Extract
 pl011_write_txdata() from pl011_write()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
References: <20231109192814.95977-1-philmd@linaro.org>
 <20231109192814.95977-5-philmd@linaro.org>
 <e499f176-d882-4727-8caf-268d72e06606@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e499f176-d882-4727-8caf-268d72e06606@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /qy9VPOXkvUv

On 10/11/23 00:17, Richard Henderson wrote:
> On 11/9/23 11:28, Philippe Mathieu-Daudé wrote:
>> When implementing FIFO, this code will become more complex.
>> Start by factoring it out to a new pl011_write_txdata() function.
>> No functional change intended.
> 
> ...
>> @@ -262,19 +273,13 @@ static void pl011_write(void *opaque, hwaddr 
>> offset,
>>                           uint64_t value, unsigned size)
>>   {
>>       PL011State *s = (PL011State *)opaque;
>> -    unsigned char ch;
>>       trace_pl011_write(offset, value, pl011_regname(offset));
>>       switch (offset >> 2) {
>>       case 0: /* UARTDR */
>> -        /* ??? Check if transmitter is enabled.  */
>> -        ch = value;
>> -        /* XXX this blocks entire thread. Rewrite to use
>> -         * qemu_chr_fe_write and background I/O callbacks */
>> -        qemu_chr_fe_write_all(&s->chr, &ch, 1);
>> -        s->int_level |= INT_TX;
>> -        pl011_update(s);
>> +        s->readbuff = value;
> 
> Why the write to readbuff?

I think I wanted to use it when FIFO is disabled due to:

https://developer.arm.com/documentation/ddi0183/g/programmers-model/register-descriptions/line-control-register--uartlcr-h?lang=en

UARTLCR_H.FEN:

   Enable FIFOs:

   0 = FIFOs are disabled (character mode) that is, the FIFOs become
       1-byte-deep holding registers

   1 = transmit and receive FIFO buffers are enabled (FIFO mode).

and we don't have a fifo8_change_capacity() method.

Otherwise, not sure what for is this field... I'll see if we can
just remove it.
