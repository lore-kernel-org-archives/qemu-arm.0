Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3747199njk;
        Tue, 3 Dec 2024 06:56:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWvTTAswPwC+EyRjDeYzBql2bjQ22UH6VJnLTP4sTHGawcvaSNaEGZZ3BLsSiTx87ZrgPFkwFtl3u9GFw==@linaro.org
X-Received: by 2002:a05:6a00:889:b0:71e:7887:81ac with SMTP id d2e1a72fcca58-7257fcac14emr2884680b3a.16.1733237766177;
        Tue, 03 Dec 2024 06:56:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733237766; cv=none;
        d=google.com; s=arc-20240605;
        b=DPmSx5PDSjhjo1FHl8RDgfvsoMKoAfVwKfp5PrkxBLIoRGYgjc1wr97woy/AHWLPR6
         JpIYDZbmMu5wKHDfSCUms84Sj7gs0Ky4MC1dHMgfpqSta6zpJtuMcvlS2ZcSot9LT4nS
         jYPMYgzGJYHON0N9cGIQ/aau+oBhoD1V5NAQ5y8xFf5GYYagMwkrAgZjs0WQ8VwnFUYl
         Gghizt+knH3vwYUvnNhoejJqQrrDXUW89e4ndh3fT6tba0yZST+Z7ezh4dAYES3nKNQO
         ZkokCsjmnIorl+KcB6ygTzzROWQnqnYCdYOh170RACu03U0/jiYSeLja1cMsBsk7iw5m
         uxMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=q+kc96z5ScfmNUcRJ2QkY4fyC2is1v5rmCpXPKmqZAU=;
        fh=rK/3qU4s+WvqWbO0hFJHzVt/sjys7C+nvgA+fZF+oCw=;
        b=DY7C6iZ6JUcavFYu7t5S1bXKorL/S4EODsTJLu14OSpVzfR5NrXfSAVjgxEGIbAbgX
         6WR4AnivMQIaquGX/naJbS+o7i4WQwllqozEUFfbz9Sy8rLLBH4acyv08iHKLwHsgNuf
         NadUaxNSBtVMvzfHyDylzvplyuTAg5eTNcz3UrkYcVNAVopYhZRHsYFJbUSFdQf3Q3xL
         JjuGPzxeiJ4Skyf/6IMLrawbZW0FfzfW4OoyRIZlyA8kytJjFkMPdqweVveZ/Z78ndaz
         SnK7cMS6glElu472CtVUSMjaz1yLPGU8TY5pNMDna0CkjzBsCctOCiVofxi24ODgtBap
         avVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FPaXy+xR;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7254176c8a2sor8087165b3a.4.2024.12.03.06.56.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Dec 2024 06:56:06 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FPaXy+xR;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733237766; x=1733842566; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+kc96z5ScfmNUcRJ2QkY4fyC2is1v5rmCpXPKmqZAU=;
        b=FPaXy+xRZTT11Ez5OQrcYnAKv9g+DW5Jp7xWhHWF2V55n+GofjyKQ2gqMwRv3e5DPs
         2P7vBscZBUke1p+TULJfPvGMClwpIP4GUiJrmGp5cULVz7RK81ROXIYgXMA/fHzpuMrD
         SMLlt+pm1a3ENScTVdyf4RrDxIl4yhUsReaVKwwg9Gi5euHENcir1e9NqFZRsS34XvSj
         /JGp2NMvsVGpowT55QyuBtQagAzP2TlzJXk6wV5zC2I1KNgalVfZlYMT7iQ9PCQhHAbg
         NsbsYotRHbM7Pb6fxCgkn1zOV7owV7Y5/htOmzjQtkoFfwy9rUDFPCNxTWTtMD0w+cPj
         3r8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733237766; x=1733842566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+kc96z5ScfmNUcRJ2QkY4fyC2is1v5rmCpXPKmqZAU=;
        b=uiKwd6Zplu68WEiewMDJPWQZPcJ/QKwsAspFQ+o6DP9699OISb9snOrtNoO48D4WuD
         4U7URQhWKtsg20UZVrDSjhBMkQU1JLEk8hdLp2om0i1tta9YGZoa42WLU4tT7eE473Ae
         752WNtg6lyPp/I8RPeLYh01FajYRvK9fxbpw8NfmIg9uSOyVGUjH1KrZa3TI4WzTmDus
         B1CejdvLi5y96tov/wE23wNzhQi8Fr+X5mpUXLlGaJiEbsLqiPpzV0vsmlMN+zr+/SQT
         mwGdEol4n64fwrALIAg8LO6Yi/IBIPMfgIkxm5d1aHK5LsGqv3G0jqPRx1YDcg6T4C7O
         TSMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8/WfuBgma6SHkrZnv/wZ48gE4fCcD5bbu8tS+RQSH3cte9Q6ulcZzsDhC2/UxL0s054JDgQN9L/5+oA==@linaro.org
X-Gm-Message-State: AOJu0Yy/sRij0tc1YT0UbNY7eIsbs7G5hARo8YoVY8RouoJiLnTPZbWa
	womSU4JLbZMSomsMWUhstq2XLE2iLhz7E/fGsLB3xoGvPHwBA2uFGsG+vaKgcsHMhg==
X-Gm-Gg: ASbGnctK6CkWgQFZv6fZ94RCPKPY8c01A8g+YTfeE/IijRkHXTCSrlJVk/WwATuGeBc
	FOfiKOMT3RYHwh2SNeTJAaXiHSgDaQ/Z+SKm6eQz32fZu5U5ZtA+gfNe1GE3PPkPyGFK7er9dlc
	AuoOLakH8fQBIM7eLkutBKesG7jkttDYIy2f3TzLoEoDlPxr/M5hO5Gir/47+EzNFUB/B4aKe3u
	s323u/D44+TEzgaTXrlARoJXu1lXi5Un3ALthGvx9OLfKxR5ihHXOxi9MtTZY0=
X-Google-Smtp-Source: AGHT+IGbeMGGFGQuKV7fKZKB/Gz+zvE+3N9o1GPUk4FHnrEyjZfW3356o9XW6Bm9pwji2oW4zgWuSw==
X-Received: by 2002:a05:6a00:3d06:b0:71e:7cb2:57e7 with SMTP id d2e1a72fcca58-7257fa5b914mr3061343b3a.10.1733237765705;
        Tue, 03 Dec 2024 06:56:05 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([179.93.129.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725418148bfsm10558936b3a.164.2024.12.03.06.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 06:56:05 -0800 (PST)
Message-ID: <f043b94a-278f-4009-87b9-9b2ba4b80c42@linaro.org>
Date: Tue, 3 Dec 2024 11:55:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, alex.bennee@linaro.org,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
 <4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org>
 <5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
 <21d8399a-91bf-4599-a73d-351f9f0c147c@linaro.org>
 <CAFEAcA-4_tnm9iPCf_3E4HKKXJ9h6w9oMiYaN0Y4s9wmpji3Jg@mail.gmail.com>
 <6cd6b3fd-8362-4fa8-b6e5-e0e3aded3215@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <6cd6b3fd-8362-4fa8-b6e5-e0e3aded3215@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 1VoHDfeyaCMw

Hi Pierrick,

On 12/2/24 14:33, Pierrick Bouvier wrote:
> On 12/2/24 03:04, Peter Maydell wrote:
>> On Mon, 2 Dec 2024 at 10:58, Marcin Juszkiewicz
>> <marcin.juszkiewicz@linaro.org> wrote:
>>>
>>> W dniu 1.12.2024 o 19:09, Pierrick Bouvier pisze:
>>>> Hi Marcin,
>>>>
>>>> On 12/1/24 05:34, Marcin Juszkiewicz wrote:
>>>
>>>>> So RME tests probably need longer timeouts or would not run at all.
>>>>>
>>>>
>>>> By any chance, are you running those tests in debug mode?
>>>
>>> zOMG, thanks! Turned out that I left "--enable-debug" in my local build
>>> and forgot to remove it.
>>>
>>> 90s vs 2974s is a difference ;D
>>
>> That is a particularly awful debug-to-non-debug performance
>> difference; it might be worth looking into what exactly
>> is causing it.
>>
> 
> Indeed.
> 
> This test boots a nested VM (using kvm, not tcg), do you any idea why such use case could be so slow with QEMU?

It's not "really" using kvm acceleration right?

It's using kvm but the kvm module in the host kernel is actually running
fully emulated in QEMU system mode (-accel tcg is being passed to it).

So I understand it's "all TCG" in the end and no HW acceleration is ever used in the tests.


Cheers,
Gustavo
