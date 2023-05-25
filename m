Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp433586ejb;
        Thu, 25 May 2023 06:17:50 -0700 (PDT)
X-Received: by 2002:a1c:4b03:0:b0:3f6:41f:5a68 with SMTP id y3-20020a1c4b03000000b003f6041f5a68mr2610105wma.29.1685020670472;
        Thu, 25 May 2023 06:17:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685020670; cv=none;
        d=google.com; s=arc-20160816;
        b=FeDezZJuiiMvEQrCe7/2ZvHadi0+qp2qiLhoe8xOgvZFpKME4GE0rFwAHpziy7Puem
         zuS1KfzvcMs4wCpHnUMpqI2/rKz7FItZG1tITWdgEyZum68NCPe2JnVgCCtSUNF9/Tpo
         80UIeKkuK25s/LXF/HMlTysIYJy6V1tkF3DJNsqPO8QvC6nu+gcFNAPCThBJC4J/XWb4
         rI0mCtKw5FnBiXgek4iw804PiVlogZaZ/gBktiF0he9oLBZQbqYrzkR2EUSmPycvC1wa
         Wh87q/r5iQfuk2+d5lC1ejq9lP6xtHVg/DaQLr6wY0j234iyBy9Sz5m4UXBjtsxyYeJW
         3BjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pEEr3CfBdx2rP0p6nDBknQNxdaBA2M9y66YlDHR4tCo=;
        b=g07TU4I7R2qFjrTlTwpStLBpvFo6EAWZ74rsxhikw7NrbXReFytEoviXWnZIigf05G
         ygo/4t6WgsYu9Ff012ohEzgNY47NF/OxksrvX2w5VGqSgbcAhDyqXZ2BKP/0EI+S8f6b
         T0PxyXgtdQ7sDRU69UsWUAOLJGmettl30fOrXZfGzavIWAW/XCC0kNaMON5i2JRUwTzi
         qwHsByYALGcKtOootlB75P3j9DUtoyiPEH74lklKE+ntS2EPH5nyM4ti6KXhwq2+lnLo
         5EV/FBoNBJ/793Tr6LLmiB4chod4Hp1eES1tcl3PBSTAAOFF+8uTqEcz//m8Lt10w/kP
         fK2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kwr5Q3ez;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m19-20020a7bcb93000000b003f50ce4c15dsor399601wmi.8.2023.05.25.06.17.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 25 May 2023 06:17:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kwr5Q3ez;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685020670; x=1687612670;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pEEr3CfBdx2rP0p6nDBknQNxdaBA2M9y66YlDHR4tCo=;
        b=Kwr5Q3ezPqJobPcsxhROlvumiznT9DgL/c1JuRLY54I2Zsc6Q+iMCe1cv8RRQGT5pS
         AkwcRTNTsNM6Zrg5mtCm2HXFH2Lxv2zna4tKxo+3mfSggMwAIhDINQ49kZwsIf2nekj2
         JiG2KyAg9UO+jJ6foVgc9vHgBj4l2xCMWrO/xlA6ZEgANS/JfxfeI2T58ETQPwB7l2u+
         1p1QpyO1nGwjCKdKx92vfoRuagFcAd63yS+CW/1XFuqbgL/ZVsDngOeLsb2Q/RVFfRD/
         QaEqaLR7laelzpXzPAOdQjYprwqYiufHUEHAInG8ApZ3jeBLcwMGDhQ8B++Gbmc7pfd9
         SrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685020670; x=1687612670;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pEEr3CfBdx2rP0p6nDBknQNxdaBA2M9y66YlDHR4tCo=;
        b=YXkqiN2H7sNYPYF5m2jYW7ZVS4cxREWXqYf8i/VI9raaL1sV1OPc+k4tMv9Yk9o428
         dI7jDm5awr8jKwbwF8AChmGCxf94Y6jIeg2FAGprhUwGOBbKborTG7Razoh6IPdXJv9S
         pIAcELmHyXAnFZcnTvFh/FXtVWrXTOkfPw2ysvBWYetpfZBDl1M4m9XsQUrjG0C0vUsn
         fh293eN0os88N10f8mrsSwSne+MV/1VmeIaXKrdiwHLBdLEGGp4AcItm8tUolkCx1f+t
         EaDi5fbXGhxJFE7PZqzARg4ifAfiNpvRi25wuJ75HKAI6qlCGbyo8O7BxHiP/vdzcs3N
         1yLg==
X-Gm-Message-State: AC+VfDyhPOsYcQOKh9CGCtX0Z3/sOdaBa2+ygREdaHZX/3Wbztxgq610
	VC11fBN53Gx9eqN9xoQojLZijGXP32GUk3WSy/LYww==
X-Google-Smtp-Source: ACHHUZ7sqmKBWbMWMQAhXe3tjx57Mnt83x0HgbHBnibfnMv31uZ7iYIUcFAd+1/KV0pAVoQoDawA3g==
X-Received: by 2002:a05:600c:248:b0:3f4:fffc:cd74 with SMTP id 8-20020a05600c024800b003f4fffccd74mr2400775wmj.16.1685020670086;
        Thu, 25 May 2023 06:17:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (cor91-h02-176-184-30-254.dsl.sta.abo.bbox.fr. [176.184.30.254])
        by smtp.gmail.com with ESMTPSA id v10-20020adfe28a000000b003063a1cdaf2sm1780166wri.48.2023.05.25.06.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 06:17:49 -0700 (PDT)
Message-ID: <af5d9e7a-a19c-b269-5a33-a3fc79e79094@linaro.org>
Date: Thu, 25 May 2023 15:17:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 09/12] hw/char/pl011: Check if transmitter is enabled
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230522153144.30610-1-philmd@linaro.org>
 <20230522153144.30610-10-philmd@linaro.org>
 <CAFEAcA_7dkWB9qPkzYmW6_F1eaAet0PPk0PHywGS2EpAkFAsUQ@mail.gmail.com>
 <87zg5stvyi.fsf@linaro.org>
 <CAFEAcA9EYLWnm6kEZGJn=Ah_wy1oE+8u0bZuVPq8=wTxtUo_Hw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9EYLWnm6kEZGJn=Ah_wy1oE+8u0bZuVPq8=wTxtUo_Hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: t4Mjy6FQ1XbK

On 25/5/23 14:55, Peter Maydell wrote:
> On Thu, 25 May 2023 at 13:52, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On Mon, 22 May 2023 at 16:32, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>
>>>> Do not transmit characters when UART or transmitter are disabled.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>
>>> Last time somebody tried to add checks on the tx/rx enable bits
>>> for the PL011 it broke 'make check' because the hand-rolled
>>> UART code in boot-serial-test and migration-test doesn't
>>> set up the UART control register strictly correctly:
>>>
>>> https://lore.kernel.org/qemu-devel/CAFEAcA8ZDmjP7G0eVpxcB1jiSGarZAbqPV0xr5WquR213mBUBg@mail.gmail.com/

Hmm I ran 'make check-qtest' my build directory only targets aarch64,
I probably missed the arm (32-bit) tests :/

>>> Given that imposing these checks doesn't help anything
>>> much and might break naive bare-metal tested-only-on-QEMU
>>> code, is it worthwhile ?
>>
>> Surely we aim to be a correct model so the fix should be in our naive
>> and incorrect code?
> 
> In our own test suites, sure -- we should probably fix that
> even if we don't change the PL011 model to require it.
> But if we let this kind of thing get past us in our own testsuite,
> it suggests there's probably a lot of similar naive code out
> there in the world -- these Arm boards with PL011s are pretty
> commonly used for "my first bare metal assembly program" stuff
> and there's a lot of cargo-culting of how to do things like
> serial output, and programs that were never tested on any
> real hardware...

OK. I'll add a comment, keep the current behavior when TX is
disabled, but add a GUEST_ERROR log message.
