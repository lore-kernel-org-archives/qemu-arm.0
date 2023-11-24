Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp1143472ejj;
        Fri, 24 Nov 2023 04:47:32 -0800 (PST)
X-Received: by 2002:a05:600c:470f:b0:3fe:1fd9:bedf with SMTP id v15-20020a05600c470f00b003fe1fd9bedfmr2458995wmo.11.1700830052620;
        Fri, 24 Nov 2023 04:47:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700830052; cv=none;
        d=google.com; s=arc-20160816;
        b=OuKSRLom9Z/yDwowNkvIrNQGzjbEDH7oPhoNTSfEn4bHtVLgCzBwa9LghAccoHabwJ
         RK9rXgT6wqapxeg7NhFKvzr5j7OTOe4hXqQytYBMhzUryYNaiOaFOn+b9leDl9J02hgC
         GqvExLGenb/6VRhVV3YgVYHzZVN+ZJmXkU82uCXFs+yFblqli0g8sdxgwKd3QibOPumF
         SBvLdX5MVGxJNBJyWCfpbur0RQW1P5ZkLof9i6yPSkjEuWJRMt4VU+wlSTgmo07Cdur9
         I42x3uiq/FQLt+C92Cyvu1nL9SjxgkE5EX3ZyovsWvHw5ohpr3W/nh0Kofm4ucgmsMwl
         LG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=U2xSlMOjhRTHcGlZQri8H/KgmcTvXC+4xuXicKM3J4A=;
        fh=37/FTotk6F/4zdisNjMOj2KU/Yd7zFmhZS/ez4heekA=;
        b=GQnKjGk9n8HPq3W6ofbUGFovwmxMYqU/7U14L80dJ29OcfJajuT5OvSSEKX+rI6/+L
         BBrvy52jNrTyVC0+qMPAFHpOwFaZE4Boc/UVZat/hYSC5uopNu4JsbscTnpAopXgQZtD
         OxhnDfZMsKQHROcdE/h71hpAiYAmfWdCXg2MgPgFg/BU2HFrZOOH24SUrXgzIPhHvUY0
         0jfmFy46x21vcPc/gaePpNSNfYChYIZXFJPJ6XR8r5MUmi98BK2sLp0h6M1oQ6/u37IY
         hD/0HzC7NK17hm3LU146pwx8fMWyDIzFuvHaqst3l2YHoT1AzmAiaYQo97MoJbWuCBBQ
         UDPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hI8uEX9o;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k21-20020a05600c1c9500b004083caf5e1dsor846787wms.2.2023.11.24.04.47.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 24 Nov 2023 04:47:32 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hI8uEX9o;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700830052; x=1701434852; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U2xSlMOjhRTHcGlZQri8H/KgmcTvXC+4xuXicKM3J4A=;
        b=hI8uEX9oUBqy3qP3I/buqSpxFkq7Hk7UY7xm1yERE5Kno0dVllb+ivVTrf0PQ0FB7O
         rJ4UARNGnZBTmoE5eaBRhBgmE4sRKtUOT8jKFYYikfGOoLyZBY5CGT1BbjX+8G9R6sBM
         uZjDRwQW9RPnYf7j3m7PWhhz7VoJRRSf4l0nnt16pCs6XVJ2nF00Sqg1ZjgsxBibOKjf
         t9Mpbz/ydgrmrXTAF4dihbVIHp2Qnltljiu5vSCihHSlzod2APo04lLWbjs7HNMWOUC9
         ekFjkTKnW1dBmKcjKVwNKcQXk06D1fYQOvv5SOf7FGMbVIU1jCmhumdYp8VinbqkUdZB
         4kYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700830052; x=1701434852;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U2xSlMOjhRTHcGlZQri8H/KgmcTvXC+4xuXicKM3J4A=;
        b=kGwtwq/T/tmIDZiKexwBVbXxmkNlBrxqx8LNpz0xBz8RZaNykxPoebBRX26V20GQH/
         nuxEacEd9D5WhXtCGVbd2SIwhHVXbbf3i4twOnCcjmI+AjvH18uw8IE41BFhPtobw7CA
         Q8Nnw676jOM1UVaY8f70KIKDWLKnSZFM6oZUcA0MyMRIkpgCw5V/DxHyFrAwYCHVfqPv
         Gb23CBWQQzEmxA22C+dD9R3Usnwr3KYVVUW+ovEfxp+i5o+bv4OZVrKgSXs/PD22z0Jz
         p6WyLk0KnkQJOsPR7seHKusT9D4hz3QxXUp+8YUvrmDmW8Hzcp4xWn7rmlO91svGb9p7
         k7+w==
X-Gm-Message-State: AOJu0YyGdR/4l2hfEwZkbi8WCoGihkcHSV7G5NcdpsmpYhSHKdeuk4Xd
	Kci45fGmT//weQTxRsVB11uW5YVTfMPwMWzyCxjFBw==
X-Google-Smtp-Source: AGHT+IHBHw0DQlH8XOCUX9Mv/un6JTCKpVtZHx+hVgc8VfuNytdkotwkBQIhImrphwzQCL1OemPYXA==
X-Received: by 2002:a05:600c:350f:b0:40b:37f2:95bc with SMTP id h15-20020a05600c350f00b0040b37f295bcmr2500711wmq.6.1700830052182;
        Fri, 24 Nov 2023 04:47:32 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.218.17])
        by smtp.gmail.com with ESMTPSA id v19-20020adfd053000000b0032f9688ea48sm4165581wrh.10.2023.11.24.04.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 04:47:31 -0800 (PST)
Message-ID: <bc15ee84-9ef5-4558-a978-88c0d5b06978@linaro.org>
Date: Fri, 24 Nov 2023 13:47:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2 v4 10/10] hw/char/pl011: Implement TX FIFO
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Gavin Shan <gshan@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org,
 Mikko Rapeli <mikko.rapeli@linaro.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20231109192814.95977-1-philmd@linaro.org>
 <20231109192814.95977-11-philmd@linaro.org>
 <CAJ+F1CKFFU_VEA4nhgWw9RLDgc_gD0h-FPfvSP4LaFC1j4pP6Q@mail.gmail.com>
 <ZV3aMYohaUsg5gWx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ZV3aMYohaUsg5gWx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 11hmaJWz+J4d

On 22/11/23 11:38, Daniel P. Berrangé wrote:
> On Wed, Nov 22, 2023 at 02:31:29PM +0400, Marc-André Lureau wrote:
>> Hi
>>
>> On Thu, Nov 9, 2023 at 11:30 PM Philippe Mathieu-Daudé
>> <philmd@linaro.org> wrote:
>>>
>>> If the UART back-end chardev doesn't drain data as fast as stdout
>>> does or blocks, buffer in the TX FIFO to try again later.
>>>
>>> This avoids having the IO-thread busy waiting on chardev back-ends,
>>> reported recently when testing the Trusted Reference Stack and
>>> using the socket backend:
>>> https://linaro.atlassian.net/browse/TRS-149?focusedCommentId=149574
>>>
>>> Implement registering a front-end 'watch' callback on back-end
>>> events, so we can resume transmitting when the back-end is writable
>>> again, not blocking the main loop.
>>
>> I do not have access to that Jira issue.
>>
>> In general, chardev backends should have some buffering already
>> (socket, files etc).
>>
>> If we want more, or extra control over buffering, maybe this should be
>> implemented at the chardev level, rather than each frontend implement
>> its own extra buffering logic...
>>
>> Regardless, I think frontends should have an option to "drop" data
>> when the chardev/buffer is full, rather than hanging.
> 
> Does anyone really want data to be dropped by QEMU ? Every time I've seen
> a scenario where data has been dropped or lost, it has been considered
> a bug to be solved.

A kind of counter example is the RX UART model, which is used in
embedded world and respects the baudrate timing. I guess some scripts
were working with the QEMU UART chardev, but them the same script
failed when using HW UART, so realistic HW baudrate was emulated using
the timer API. See the chardev frontend handlers:

static int can_receive(void *opaque)
{
     RSCIState *sci = RSCI(opaque);
     if (sci->rx_next > qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
         return 0;
     } else {
         return FIELD_EX8(sci->scr, SCR, RE);
     }
}

The TX path also use a timer:

static void send_byte(RSCIState *sci)
{
     if (qemu_chr_fe_backend_connected(&sci->chr)) {
         qemu_chr_fe_write_all(&sci->chr, &sci->tdr, 1);
     }
     timer_mod(&sci->timer,
              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + sci->trtime);

The more complex 16550A UART model also use timer in FIFO mode.

> Sure, we don't want QEMU to block on chardev writes, but we want that
> more than throwing away data.
> 
> What's the use case for capturing data from the serial port, but throwing
> it away if the other end of a socket doesn't read quickly enough ?
> 
> If someone does want lossy serial ports, they could configure the UDP
> charedev backend already.
> 
> With regards,
> Daniel
