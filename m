Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp764325ejj;
        Mon, 25 Mar 2024 08:11:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkxWuC7fr7P1YzoTdiX+GrUdM4htY8LMu569TYsEq0B3e8h4XMLzYRVBJ28Cv71wADqV70f6vt3WEok5oJEqrKuHjVb/dp
X-Google-Smtp-Source: AGHT+IFhkLLGo5lk2gnzOwkgwiBs5OmchraI/GAKnA1xboLiggrndxaOP6uWOqmeQeL0kHRcVuTz
X-Received: by 2002:a05:6102:942:b0:478:2500:e90 with SMTP id a2-20020a056102094200b0047825000e90mr743492vsi.17.1711379507722;
        Mon, 25 Mar 2024 08:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711379507; cv=none;
        d=google.com; s=arc-20160816;
        b=FS2CInalsFBUwWnh6OnEamZoS4zEi85AjiB7vFIeunqBPAv0iuWyA619i/c5LOGF/g
         y7zCZe7YUhOZ7UjWlcoPq4sxxPjP3c8XJJZQgqmViPG9WJ6m5NK3hrfgbCGlJzn/rLCA
         JoyCQSbg9jUFaPNLdjlDGaQB6RL47VRxiFOqVtoZTTCZoCT6D2JIuqLm0aqo4hmYNqKv
         cVwtN3qKcYjhcO9ci605B9OOPP16OvrZXFHA/B2tJJTw/LHGK25RqYdH4IKcsnboe/M+
         FAuDXkEIiMrD9HzN5gohJ/K5WlH/jVoUrNQAn4roFz4Zzrv1UBYTr1TXw1MZ5BxLPmEx
         TPVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3FX7sZnjQhQ4h6Jv1VvSmw2+PHG1NyglOoVslUBNQvo=;
        fh=ZlXRHVka7m+G91C4Z458+Cb0ZZSwaS3NrN9w4L5GKSY=;
        b=L9PoSR0l/wjzgTUJSbflJ5UHigZX+8mFUvPIRHZqLtXIxgNelft/roPbqMJ715tUCl
         V1g9TNYOfnUR+dLoFCDa16QYYvJpKVvtVMqzUixOYSzGmR6E6AwZGV7u9rtDDBzycMUT
         af31rECwY1Zx7hKRh/HRknwhZjR7OnS7qEOQOj6TTgCeSDSkIkSGh5sToMwfKIZKJxfi
         Qnje9LWsqrJ4vq934+aXDLciqPexfhTMTtvNMPEi063Qk8oyGP7GVfVb488VvKaadGc5
         gopRWx3jNxBvOBcKLwNHd/Nexo6hoIrlGt1G5faaPnN1ZG8mmv34/zGk/J6P5OfuUwBf
         J7Ww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j7SSzOXx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h23-20020a0561023d9700b00476dd71c7f0si870451vsv.147.2024.03.25.08.11.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 08:11:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j7SSzOXx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rolz9-00074J-6W; Mon, 25 Mar 2024 11:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rolz6-00073s-FS
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 11:11:38 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rolz2-0006XE-Nb
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 11:11:35 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4148c5de23fso1343255e9.1
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 08:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711379489; x=1711984289; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3FX7sZnjQhQ4h6Jv1VvSmw2+PHG1NyglOoVslUBNQvo=;
 b=j7SSzOXxrH0vtQJT5/U9N2l5vFJunzfjU/wl9lJEJaeJyCdI1EJW8hQiMhsA16sWK+
 lxWaCY25190vBxu/6pGvoDCfth++zOtUnVNM76W9/iXyd3ybqF72eNSn/Nd9Is6pB8Cm
 dyEXa3BSoNi+mfeLsVa5Pl82ygtkrQi4ZoppVB2Txdtc/TTcZy0Wzx6l/YbZtn6h5xAa
 5iGgS/sSQ5dDOCSJLXPSMpiL9fTKPnpz9W86gDqrYxErgtb3n4iCOJd1ycTJGsZxo/DW
 3n6MtzzQxYNOBhbmZvPYt3jfkkha0jV8ZRm/JTnFauYyreFx9JOkdewev8KSSzg2+qsX
 RSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711379489; x=1711984289;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3FX7sZnjQhQ4h6Jv1VvSmw2+PHG1NyglOoVslUBNQvo=;
 b=F0/7ZUPLqPpbag/k1V6du64xA5D00l8enHKi1ZVHsUkGYMSkfpj5qEj9V4kBgmV0cx
 t2bZFauRVdrATZLyviRcrWVYxZWmWgNR8eCqkMG36cgLZnfE8R8TWOGhgrp7W8YtXPht
 LRao6OdYvG5SeC2EFF+kK2FLcrhoARIiv8JgLugwZJ9N1d6FSpebg50B3jTW+aHNsqo2
 g///q+od155LBOLuYj5OKs7YVlBOL8HmUtQpFdmQ0Ogxd9FV3L31EzrordJua/r/6TUe
 kh2tjTOd8Jy4Trk8esS9j3XxVU40Rb2/gpJCtrf/1BkgTMMBDaO+33uBts2yEgpRwo67
 SiDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdMSXfmX06jjNrd9fUOkrt6jRSzpQpBh6DSQO14C22hUEcEB/Vjikuxet+Xlc5J7eJrZSwsSCpc/6s6DTnn8fLm/No
X-Gm-Message-State: AOJu0YxPDBG4/bgO4NRDbyodYluJ9sCurEGx25/sbeDuKLtsZFhoj8yr
 D+/dusEClzYlOTFChlbjDzT3TzPhu4Q3EdVJnSMOr3XA9IlvAHKMIGRMjEu+krQ=
X-Received: by 2002:a05:600c:45d5:b0:414:869b:dbd9 with SMTP id
 s21-20020a05600c45d500b00414869bdbd9mr3394880wmo.9.1711379489337; 
 Mon, 25 Mar 2024 08:11:29 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.214])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c315300b004147c8dd13fsm8682334wmo.30.2024.03.25.08.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 08:11:28 -0700 (PDT)
Message-ID: <1d42c033-333d-4fdf-b4b7-7dc19b831982@linaro.org>
Date: Mon, 25 Mar 2024 16:11:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0? v2 2/8] hw/clock: Pass optional &bool argument to
 clock_set()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?In=C3=A8s_Varhol?=
 <ines.varhol@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Damien Hedde <damien.hedde@dahe.fr>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20240325133259.57235-1-philmd@linaro.org>
 <20240325133259.57235-3-philmd@linaro.org>
 <CAFEAcA9aM8J+0RjYnvr8Xr8Q2j3w_TgxHO-gPDn8MaAcAUDynw@mail.gmail.com>
 <e3806179-47ed-4952-a7b6-c256a2aad197@linaro.org>
 <CAFEAcA_yyWKo7E1Vz2zQXnjetYWEXtt6mUyg+t4mJXt+nsKBgA@mail.gmail.com>
 <c951c51c-3811-4997-b27d-deb8515b1539@linaro.org>
 <CAFEAcA8fMVVBxhH8NoPMcNarRYMZSFN1x5GWLg=KSxg1p_FK3Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8fMVVBxhH8NoPMcNarRYMZSFN1x5GWLg=KSxg1p_FK3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lB8605Z4EPSy

On 25/3/24 16:03, Peter Maydell wrote:
> On Mon, 25 Mar 2024 at 15:01, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 25/3/24 15:44, Peter Maydell wrote:
>>> On Mon, 25 Mar 2024 at 14:39, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>
>>>> On 25/3/24 14:47, Peter Maydell wrote:
>>>>> On Mon, 25 Mar 2024 at 13:33, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>>>
>>>>>> Currently clock_set() returns whether the clock has
>>>>>> been changed or not. In order to combine this information
>>>>>> with other clock calls, pass an optional boolean and do
>>>>>> not return anything.  The single caller ignores the return
>>>>>> value, have it use NULL.
>>>>>>
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>> ---
>>>>>>     include/hw/clock.h       | 22 ++++++++++++++++------
>>>>>>     hw/core/clock.c          |  8 +++++---
>>>>>>     hw/misc/bcm2835_cprman.c |  2 +-
>>>>>>     hw/misc/zynq_slcr.c      |  4 ++--
>>>>>>     4 files changed, 24 insertions(+), 12 deletions(-)
>>>>>>
>>>>>> diff --git a/include/hw/clock.h b/include/hw/clock.h
>>>>>> index bb12117f67..474bbc07fe 100644
>>>>>> --- a/include/hw/clock.h
>>>>>> +++ b/include/hw/clock.h
>>>>>> @@ -180,21 +180,28 @@ static inline bool clock_has_source(const Clock *clk)
>>>>>>      * clock_set:
>>>>>>      * @clk: the clock to initialize.
>>>>>>      * @value: the clock's value, 0 means unclocked
>>>>>> + * @changed: set to true if the clock is changed, ignored if set to NULL.
>>>>>>      *
>>>>>>      * Set the local cached period value of @clk to @value.
>>>>>> - *
>>>>>> - * @return: true if the clock is changed.
>>>>>>      */
>>>>>> -bool clock_set(Clock *clk, uint64_t value);
>>>>>> +void clock_set(Clock *clk, uint64_t period, bool *changed);
>>>>>
>>>>> What's wrong with using the return value? Generally
>>>>> returning a value via passing in a pointer is much
>>>>> clunkier in C than using the return value, so we only
>>>>> do it if we have to (e.g. the return value is already
>>>>> being used for something else, or we need to return
>>>>> more than one thing at once).
>>>>
>>>> Then I'd rather remove (by inlining) the clock_update*() methods,
>>>> to have explicit calls to clock_propagate(), after multiple
>>>> clock_set*() calls.
>>>
>>> You mean, so that we handle "set the clock period" and
>>> "set the mul/div" the same way, by just setting them and making
>>> it always the caller's responsibility to call clock_propagate() ?
>>
>> Yes, for consistency, to have the clock_set* family behaving
>> the same way.
>>
>>> Would you keep the bool return for clock_set and clock_set_mul_div
>>> to tell the caller whether a clock_propagate() call is needed ?
>>
>> Yes (sorry for not being clearer). The API change would be
>> less invasive, possibly acceptable during the freeze.
> 
> Sounds reasonable as an API to me. The other place we currently
> do an implicit clock_propagate() is from clock_set_source().
> Should we make that require explicit propagate too?

For API consistency, I'd rather do the same. Luc, any objection?

> For freeze: is there a way to fix this bug without changing all the
> clock APIs first?

Sure, I'll respin that for Arnaud.

> 
> thanks
> -- PMM

