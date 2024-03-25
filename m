Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp743420ejj;
        Mon, 25 Mar 2024 07:39:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQgO2/NsWDO0YbPAjpcJkDjt4W7aX+Jh67+uPPOIWbmSdmIsd/jjzZXhYFCSeWO0kIX67QFjDg2wWRqhnagyrJHi7PFRO1
X-Google-Smtp-Source: AGHT+IH/sUy3pQT1jwRa6Fxddg1BAfDNeTaXiZ4HCDg9oV2rhR+N5cwiBWdSXLpZBkAqcjprelp7
X-Received: by 2002:a9d:63d1:0:b0:6e6:8adc:36e with SMTP id e17-20020a9d63d1000000b006e68adc036emr7953227otl.6.1711377585848;
        Mon, 25 Mar 2024 07:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711377585; cv=none;
        d=google.com; s=arc-20160816;
        b=s/tAJ+u8KfA8W1QewYmwwVaMXbpQqWcdGhAh6CZRwF9IZmpxLOnxmm5zI0n6oSCCKh
         SExNlANb+2YqtYgoaDLU9Sx5R/Dk77QY02Sj6nPPM0ip5tYTETMljKTNNFLnIYeFDhey
         CkBrUGdGGsPc4+VJP6eURoz2XQ3kkR1I3vh8FvrOOsYIW5PGjSUY6vdjRat1AyvXos11
         7V24HptzwPmz1Vi4WEIG1jOGnrY8CAj+4eowIMMnzZDIfoToL/SKA/U56KbmwkSjodqo
         7DS/5nurna0zHiMxRbjJrToritkSH9T6S1laPUjWNbCP4HonHqEf3yOlmO/uMFhQSHuz
         GqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cLo0clHLzmfqJyAmA9loIdTW7dvRHYH5J9MCipaP/mI=;
        fh=6ZEpquk8WYfdeYjA/rVgQG/C+OZdCH/wdP8RYPwLgqA=;
        b=0lCYX2LLrFN/STsjSZpJUIKETxNiImkYGVeCdFQTwWNvTWD4W2pKexmtlD1c1gQwR0
         CvH4sQQ1mC/ZHZnKIZ3HlQHcsCFg7V7UZE3wSsXkNbRr+yG/eUlPXcymld6gF9pFFlV5
         7MBti3JKt264FdPVLKaAktiBcVHZxpGsL5QzbSaKQohBrj9GxbdbL+0Fu0/517LThbOe
         4WVo5aLAvGCLihALdWK0rs0/I30lEnlnO2p7bYmE7OBd9NLRlzqFR5/hcBXhnq2i6Zs6
         WRyaXSux2CU8nkNqL9RzaS52nSI6z4K9F8/MyKRKHYq44fHx4s7jn+la+et6gmAV+t1X
         MtPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xi7lwluT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8-20020ae9e648000000b0078a39130c22si5421623qkl.710.2024.03.25.07.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 07:39:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xi7lwluT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rolU5-00035H-LL; Mon, 25 Mar 2024 10:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rolU2-00031r-BN
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 10:39:30 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rolTy-0001OD-Ma
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 10:39:29 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d4a901e284so87786781fa.1
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711377564; x=1711982364; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cLo0clHLzmfqJyAmA9loIdTW7dvRHYH5J9MCipaP/mI=;
 b=Xi7lwluTMYLogA+QOtufmfxjeZSaoVp8Sc4Tvuu+eukxCg/akuf03AYgBdd2jRSDem
 HCaCDZZZ0CQmYya2akSJFI9wgqpgKa/29vPxbNqIh25IX+qOfbu9LMq9RkbW7dKMAXO7
 MoC7j5+MDYQQ1f5bOxRCQG9wS02npXUJD01ljTsC1rCv8PEA/sIC/KORsG6RVNJTX37K
 aJJHpPWAd8A5RNA+ovrAAlta7ebehZYU4zdjMd2cI5MdLPYPDLcuDMppIJtni156Frfg
 HdR631ZwG6ulPZmmzzMKBcvQhr/yCBtmGJLY022jUGWKe/yRiw3yP2yC8Ozxwx0lUQpi
 +FLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711377564; x=1711982364;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cLo0clHLzmfqJyAmA9loIdTW7dvRHYH5J9MCipaP/mI=;
 b=RpAdgAdS0ejedDrd6yob2wLdfkKwtNYT7x6Zl9O3qkmYgLaY0RLjCjSsewS6PHgz6w
 +kqxi7lGG36tzB0FQm2ocdKgc88KUFOHDzwMGcr/PfU0Pdf7l0hylAz7hKMghXXioYFc
 aLhA6CkD63YMpsxHK5tJ+7twWJoJKE/EsKVxa6KKM51uP6tfViFqKx8XKyqoZnymsjAk
 JTcYgSVMYUjTpBLzRHyvppeytk76f9LMk7TAJr8tVkxWM4gHtfXc84fD6cb0ANjuvtY1
 n0EBRonOtyEIjIJo1ELVWu3CA1CEkqL668M6ZUdLDiLh2fRjvAHvArDf5jnNMVXUHB8a
 pakQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFipeeefK7a4IPMDX0JS1azTW+f0TEQ7ho5xtwkiz5a1cUz3rvvCpGx3kD1Jwqx1bJ8xJH0wvSWWFpGOydtptvoDHl
X-Gm-Message-State: AOJu0Ywb1u6wyXjRtBL3UsBzZ31X3jkZ6KhLRqv0qHklct0WUtvB7Phm
 QZUiaWVyj9glUshGSYnRze5HjGggjQWEn123+xXjmpvZmtDNZ1go/3RzvaTBpOY=
X-Received: by 2002:a05:651c:2ca:b0:2d4:7373:2a5b with SMTP id
 f10-20020a05651c02ca00b002d473732a5bmr5691225ljo.47.1711377564267; 
 Mon, 25 Mar 2024 07:39:24 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.214])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a17090663ca00b00a4a33cfe593sm1271473ejk.39.2024.03.25.07.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 07:39:23 -0700 (PDT)
Message-ID: <e3806179-47ed-4952-a7b6-c256a2aad197@linaro.org>
Date: Mon, 25 Mar 2024 15:39:21 +0100
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9aM8J+0RjYnvr8Xr8Q2j3w_TgxHO-gPDn8MaAcAUDynw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22d.google.com
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
X-TUID: tbWWtWMeBeeL

On 25/3/24 14:47, Peter Maydell wrote:
> On Mon, 25 Mar 2024 at 13:33, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Currently clock_set() returns whether the clock has
>> been changed or not. In order to combine this information
>> with other clock calls, pass an optional boolean and do
>> not return anything.  The single caller ignores the return
>> value, have it use NULL.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/hw/clock.h       | 22 ++++++++++++++++------
>>   hw/core/clock.c          |  8 +++++---
>>   hw/misc/bcm2835_cprman.c |  2 +-
>>   hw/misc/zynq_slcr.c      |  4 ++--
>>   4 files changed, 24 insertions(+), 12 deletions(-)
>>
>> diff --git a/include/hw/clock.h b/include/hw/clock.h
>> index bb12117f67..474bbc07fe 100644
>> --- a/include/hw/clock.h
>> +++ b/include/hw/clock.h
>> @@ -180,21 +180,28 @@ static inline bool clock_has_source(const Clock *clk)
>>    * clock_set:
>>    * @clk: the clock to initialize.
>>    * @value: the clock's value, 0 means unclocked
>> + * @changed: set to true if the clock is changed, ignored if set to NULL.
>>    *
>>    * Set the local cached period value of @clk to @value.
>> - *
>> - * @return: true if the clock is changed.
>>    */
>> -bool clock_set(Clock *clk, uint64_t value);
>> +void clock_set(Clock *clk, uint64_t period, bool *changed);
> 
> What's wrong with using the return value? Generally
> returning a value via passing in a pointer is much
> clunkier in C than using the return value, so we only
> do it if we have to (e.g. the return value is already
> being used for something else, or we need to return
> more than one thing at once).

Then I'd rather remove (by inlining) the clock_update*() methods,
to have explicit calls to clock_propagate(), after multiple
clock_set*() calls. clock_update*() are used in 4 files:

$ git grep -l clock_update hw/misc/
hw/misc/bcm2835_cprman.c
hw/misc/npcm7xx_clk.c
hw/misc/npcm7xx_mft.c
hw/misc/stm32l4x5_rcc.c
$ git grep clock_update hw/misc/ | wc -l
       37

Regards,

Phil.
