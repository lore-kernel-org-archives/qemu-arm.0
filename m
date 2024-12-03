Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3752465njk;
        Tue, 3 Dec 2024 07:02:16 -0800 (PST)
X-Received: by 2002:a17:902:d549:b0:215:5a82:3f8c with SMTP id d9443c01a7336-2155a82421cmr242709775ad.20.1733238131974;
        Tue, 03 Dec 2024 07:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733238131; cv=none;
        d=google.com; s=arc-20240605;
        b=Cnn7bJP8m+RNcfEg+YDZrYFS3VMACP9taWTsf6Zq8s8DHmWll4L2/Co7xUAvml134w
         62ll0/2nelUiWGgrfoD4L1wM6vxJbcj5CSyW14Bd+PdCAt02GdDD4VBcVvgAKTbnyfTC
         sQdvNWpgJV8wEPjVtYSB3TmVRLRXRdkT6+UpU3hfcQXXv3NeUjovZw+ZGyo4PK2VZf1P
         NzRiOIoPZhxxP/4yIuXWhX/XbzexycSEgep176RCIefF3HmPU6rkj87TpxQgvr39RNhH
         yKKiqj5DSdvZIpwolH5t2GGvgD1IgUBq9k7BuZ8yHdsnoYQAvHUzvzWCg+/b3gGJBR3A
         By1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gqLzY+IRT6La492ly8emVrBu9C8joyzHbon3Upe0vEo=;
        fh=EAgoFDQVu/BEH0lCaATtXyJbIGAZGIQqL0QdWIiPHfM=;
        b=d3Rd6FMb6etw2X5nhT6MjbHU7+tZ28XYBuN4+9r1GG35bT9c3rOf6m8QR9JwjWIgYS
         t4Om52s32QIh8YGFYd5tJlkbBxQWDZVSG58/OgAV/F6+8N3kj/IUyrYCHJoid4PCpCeT
         WRSSXJodk02xj/ki0CR7XTflOjV+NZsae5L/uev+0YMlpNAMN7ArcMfVb0KnPoOy5Y0Q
         U0FXpoKYztt/0x4bDlpkNpB6tnIVQwTClTakRX+qAtIZTtNCM5SuNWRcb0v6fTauRso0
         7iJK5qPOnRNNXCcePbMz/IQ69bW9PnChFmSCYnPWDRos3X/tpJ4uFlOqxKhw4gQQHWjG
         VyHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lMzMhLZi;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72532295743sor5575194b3a.3.2024.12.03.07.02.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Dec 2024 07:02:10 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lMzMhLZi;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733238130; x=1733842930; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gqLzY+IRT6La492ly8emVrBu9C8joyzHbon3Upe0vEo=;
        b=lMzMhLZic3Y91mneFK+CNo3mYf56830zLGE/KFW5NIvPcmGdh9taWoBQeaqGGfctP9
         TlRpQ6j/t+zQ8WMIY+IOWdhrXbTesET5VW+858H0iNO/RQzwKhc/DH6y5GXUxI37beN7
         1hmU+CvR0RdG9y+ULZbStX2pqhzoUWFHduK+s4qQ+4uVyCjL0QEEuj+4kOxAkqYCWIjn
         mKHCpVedy7w3t0PpZnqfeWXA1JOQmjD1marO0SdiDiedm25MZvFNdrSljy4D6q8Y8jLZ
         e8Hq15H1evObfc22FWWXMzJlBv7L30sd9YMy18blsLPbUmNDkU89JSAg6XwIpXb0bppT
         FXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733238130; x=1733842930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqLzY+IRT6La492ly8emVrBu9C8joyzHbon3Upe0vEo=;
        b=sMcs5O+BaDQBhXFsB2mFY/cujyvRXzgqCbry+WvFBheQM6GIjz4wTTa9y1PMkxdJZK
         BhdMpmwKrKkH/d3eWw0inmSxpSXvEyE1e4g+9AydRP9u+qZsqyherPTOgvEhjvrAY+NL
         Eb13+iOFELlEmci07yuCxmtmzWGQXAAyONr7ON2gLPhBY6E7shvoEiLrd8VUfcjKNNji
         a/2NDlOYsg4j4x8LIHSt2UxpKYV1aeipxauZHW2NBd+CvZax/HP2oSoqpmvkArulyPbc
         5gn35d8XgsKHfJk5XCwHXzlWnYBodz0nHCrgC32BaIW9DhcgJTAf8kxbHEa0ddyGtoBH
         J4oQ==
X-Gm-Message-State: AOJu0YzaRYSkQpwYMbTJV4OswM0lQklmJR4BCYiBdnzwHN3lk1tdpRTe
	fLNTtkwlGc/oplU0Agc0NsZvQR17hDNQHOBp7NOS/Z/n7NKaWTz1OC0GDb98lVn57O+fhM5sSeD
	C1OBEkg==
X-Gm-Gg: ASbGncvch2MUdwxwjd71jXoogVKoBSiiEKRniloUZ9iAii6YVkcZ4YdnyiTifUaXMjf
	xX3V3nyQWJNOyKHDi6q4jeGz28iajoxmcGrO7br7ZqKx5ujcSL90+eMGv1zKSSjeqPUWDTaI9qO
	7SfdAL8p4PWarH3QJkOIPJdh6kpsnzz0wUfCJIar1hO4hmIEFr9Dk3b7jWD++ruvYhvpvhS7H15
	Io4Yw7QRy4i/BukTiW6iCTTqXokOG2ES4YR+XaRIk3l9szSILDIwHWkxs8jQrk=
X-Google-Smtp-Source: AGHT+IFWWU0xifEh7JdWX7yIRoUB0hrkclGAfnre4R7nIjlYOnzio2yHi8j0x90cYJ3CgcOIWA5hmg==
X-Received: by 2002:a17:90b:4fc6:b0:2ee:b8ac:73b7 with SMTP id 98e67ed59e1d1-2ef0262bc0fmr4182124a91.16.1733238129347;
        Tue, 03 Dec 2024 07:02:09 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([179.93.129.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eeb2956718sm4700862a91.44.2024.12.03.07.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 07:02:08 -0800 (PST)
Message-ID: <b9e375ad-2b71-48a4-8e97-2cdced17ea79@linaro.org>
Date: Tue, 3 Dec 2024 12:02:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
 <4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org>
 <5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
 <CAFEAcA-xa1AKf2GAv7go5wdu+Td=4jf7Nriin-Oe3S6qEV6X0g@mail.gmail.com>
 <fd7ad48e-1e72-4735-8064-7039eedc00ae@linaro.org>
 <87ser6c5be.fsf@draig.linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <87ser6c5be.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WXUqY4ZVkLo/

Hi Alex,

On 12/2/24 15:23, Alex Bennée wrote:
> Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:
> 
>> On 12/2/24 02:57, Peter Maydell wrote:
>>> On Sun, 1 Dec 2024 at 18:09, Pierrick Bouvier
>>> <pierrick.bouvier@linaro.org> wrote:
>>>>
>>>> Hi Marcin,
>>>>
>>>> On 12/1/24 05:34, Marcin Juszkiewicz wrote:
>>>>> W dniu 28.11.2024 o 22:37, Pierrick Bouvier pisze:
>>>>>> This boot an OP-TEE environment, and launch a nested guest VM inside it
>>>>>> using the Realms feature. We do it for virt and sbsa-ref platforms.
>>>>>>
>>>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>>
>>>>>> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
>>>>>> index 5c048cfac6d..b975a1560df 100644
>>>>>> --- a/tests/functional/meson.build
>>>>>> +++ b/tests/functional/meson.build
>>>>>> @@ -13,6 +13,8 @@ endif
>>>>>>      test_timeouts = {
>>>>>>        'aarch64_aspeed' : 600,
>>>>>>        'aarch64_raspi4' : 480,
>>>>>
>>>>>> +  'aarch64_rme_virt' : 720,
>>>>>
>>>>> Took 2974.95s on M1 Pro macbook.
>>>>>
>>>>>> +  'aarch64_rme_sbsaref' : 720,
>>>>>
>>>>> This one needed 2288.29s.
>>>>>
>>>>>>        'aarch64_sbsaref_alpine' : 720,
>>>>>
>>>>> Have to check cause timed out.
>>>>>
>>>>>>        'aarch64_sbsaref_freebsd' : 720,
>>>>>
>>>>> 331.65s
>>>>>
>>>>> So RME tests probably need longer timeouts or would not run at all.
>>>>>
>>>>
>>>> By any chance, are you running those tests in debug mode?
>>>> It seems to me that CI is running functional tests with optimized
>>>> builds, so I'm not sure we want to support debug "times" here.
>>> We do need to support debug times, because a common developer
>>> use case is "doing a debug build, run 'make check-functional'
>>> to check whether anything is broken. The debug times also
>>> are useful because the CI runners can have highly variable
>>> performance -- if a test is slow enough to hit the timeout
>>> for a debug build locally, it's probably going to also hit
>>> the timeout at least sometimes in CI.
>>>
>>
>> I understand the scenario, but given how slow debug builds are, it
>> would probably be faster to advise developer to recompile in release
>> mode.
>> The overall time of compile + test is slower than waiting for debug.
>>
>> Beyond using a debugger, what is the advantage to compile with -O0?
> 
> --enable-debug
> 
>    - enables -00 with -g3 for symbols
>    - and enables additional checks to validate TCG

hm, do we ever used -g3 for --enable-debug?

https://gitlab.com/qemu-project/qemu/-/blob/master/configure?ref_type=heads#L749

I'd love to use -g3 instead of only -g for having the macro symbols.

In my builds I use --extra-cflags="-g3" to have it but would like to drop it.

unless I'm missing some other change in the flags down the lane...


Cheers,
Gustavo

> You can use --enable-debug-info for just debug info without the overhead.
> 
>>
>>> thanks
>>> -- PMM
> 
