Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp107823ejb;
        Wed, 31 May 2023 10:08:54 -0700 (PDT)
X-Received: by 2002:a05:6358:c23:b0:127:7e69:d3c0 with SMTP id f35-20020a0563580c2300b001277e69d3c0mr2901233rwj.11.1685552934310;
        Wed, 31 May 2023 10:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685552934; cv=none;
        d=google.com; s=arc-20160816;
        b=E/YXxbNN1tEI9fGaTaZ+IGEW4WjzrN2/j+iQtdWa3bzYnPuqk9hH/Dtz8IXE+R4L2H
         mfSFozwDPP0sJM9jPWU/VJ+y33vqMha4Z2Xk5yxLf/n9chTbNobee1vU5OtvP0miYDii
         tmZtxtYp1khn7441xpAVXaVMFRVZSTjU56arFdJuDB0K0tLb294czDePm7maCXLnD+h8
         mK6oswk+YDW9UZGNSSK1aJWND7DLuqZgar1cz2jFn+eFaV+kukkf4hzyTa5ejdSDOCW/
         vhNpxfmmJSaOBbG2DyL8Y0QikcBkSjAP5EWgEysTV9KrxaXx2dnmV8hPl2x3LcrVAoDE
         xltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=sBMrABB9Qj89rgVrPECZc5SgBeBIp80s+Map8XvbmnA=;
        b=db1Lbd8xl69pd9Kx8VyzDWolQ1iW9Zgjd8vdvY0kEYQ1+BYv6irD5rXxRLdiSIxuVu
         g8PeoRXK1Vd9HHxffgmFJPXMbfggOHI7NaQWiQIJHnZxexLunHsMfk0MQHaqY9HuyYzK
         nKJsXKa//778MMtgvN5SUuyNnqh+B5ACKZEd9YbKM4rituQ/T92j1cAeUTV0ExyMLgo7
         cfv8NLSok60Oknjqd3fi9b8YhYUHQ2Pv5tyj2A2z3mTKyUmom8bu3tQ2SN/PE+3Ay+qq
         Nwk3h8/PbKwFo6I1+Tj50BBitMv9CtQpbiPt+m042ESj4reDW3NXGTm7IzIRVc9rgncG
         l4Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kH0+eb8E;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w10-20020a17090a8a0a00b002559700c525sor513075pjn.2.2023.05.31.10.08.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 May 2023 10:08:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kH0+eb8E;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685552934; x=1688144934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBMrABB9Qj89rgVrPECZc5SgBeBIp80s+Map8XvbmnA=;
        b=kH0+eb8E0suzs1M6Tjepu9Bf5AIuv2LaO17PvdL2bxYdnV2ylYCRIdpSw6CX3B9in2
         UJ/s8EsI+FizdBZergS43J1TNphGFaZpWaiFL7YY/xPr2MYGMY6I35Ko60SjzbcbwH7y
         6kGHoXIWKCMXEIXxH7SlBa9sjRX0T68jaY+4X87Rw9glt7TG/+H6OwYHdji/bwYdkZ8E
         aNTigaixxLn8fSOZarFqyxvgwaRcA2iNkHRDISmejJvzjT3nVBe9hcMnnl+Zq/MIx4F4
         6tkp/W1K4gvXvYxegVnq6XJ6CyxMFhLyocuUKUoYnOJyLfoO78llUm109K+bwpabBHOk
         Fqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685552934; x=1688144934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBMrABB9Qj89rgVrPECZc5SgBeBIp80s+Map8XvbmnA=;
        b=Y4llNW76jnHNRqnxNqqglYxLtuf+LvJQveBYSfqjuMyPVo/DoEUx3Io99cSHnTXsZq
         emApGbRaS/27iPO0aPx73P9Mqy1GcFWCzZlk6RfGdQXf776ew5Ybhi+pRpxKNNWaS8tx
         51OLZSqa1Mu2O6Vg7bZlZrJSxbWfoBCGTVRSiukRT3RMBhYszOvT0hRKqQG01DDBaNhy
         caJdOQYTEpApcF9S5Ni65GgOvAcftpd6nuKLKwja30xgImZk4wNpR9P1KNtqHLz3XNQt
         pYLrhL7AqLhZyvKlO9Wz3oLsHCivhQhLwbt3pN1aRQ/lRXFyQwsmwXVh+anbM4DjOpzV
         lkxg==
X-Gm-Message-State: AC+VfDzke+3EbQDJ0cjEFM3APWJ+R+r5TVywopVeYishDDPC2AUKJHN4
	Y9E9OmCpPLZZR/lKDENYrMNwX0qhlB7Y/eG+LPYFhg==
X-Google-Smtp-Source: ACHHUZ74PaikpnuvV4qwCII57TIQj17aSJw+XSMX75ptji8Qj2xkf7fnW3huEHscDoMArssWQokhIw==
X-Received: by 2002:a17:90a:8b92:b0:258:817a:814e with SMTP id z18-20020a17090a8b9200b00258817a814emr950347pjn.28.1685552933695;
        Wed, 31 May 2023 10:08:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1598:4c01:3019:d9fa:8bb1:50d7? ([2602:ae:1598:4c01:3019:d9fa:8bb1:50d7])
        by smtp.gmail.com with ESMTPSA id i8-20020a654848000000b0050f85ef50d1sm1438903pgs.26.2023.05.31.10.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 10:08:53 -0700 (PDT)
Message-ID: <c8499cae-befb-7130-3114-350ee97bf49d@linaro.org>
Date: Wed, 31 May 2023 10:08:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/2] Implement AES on ARM using x86 instructions and vv
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20230531112239.3164777-1-ardb@kernel.org>
 <722d7683-80b4-bb23-3ca2-77f8de23b801@linaro.org>
 <CAMj1kXEH4zFcOZGz0HvTbpcMUup+cyZEr0JQxH1uXpGcbAc6ow@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAMj1kXEH4zFcOZGz0HvTbpcMUup+cyZEr0JQxH1uXpGcbAc6ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: iUcStmn4/CPf

On 5/31/23 09:47, Ard Biesheuvel wrote:
> On Wed, 31 May 2023 at 18:33, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 5/31/23 04:22, Ard Biesheuvel wrote:
>>> Use the host native instructions to implement the AES instructions
>>> exposed by the emulated target. The mapping is not 1:1, so it requires a
>>> bit of fiddling to get the right result.
>>>
>>> This is still RFC material - the current approach feels too ad-hoc, but
>>> given the non-1:1 correspondence, doing a proper abstraction is rather
>>> difficult.
>>>
>>> Changes since v1/RFC:
>>> - add second patch to implement x86 AES instructions on ARM hosts - this
>>>     helps illustrate what an abstraction should cover.
>>> - use cpuinfo framework to detect host support for AES instructions.
>>> - implement ARM aesimc using x86 aesimc directly
>>>
>>> Patch #1 produces a 1.5-2x speedup in tests using the Linux kernel's
>>> tcrypt benchmark (mode=500)
>>>
>>> Patch #2 produces a 2-3x speedup. The discrepancy is most likely due to
>>> the fact that ARM uses two instructions to implement a single AES round,
>>> whereas x86 only uses one.
>>
>> Thanks.  I spent some time yesterday looking at this, with an encrypted disk test case and
>> could only measure 0.6% and 0.5% for total overhead of decrypt and encrypt respectively.
>>
> 
> I don't understand what 'overhead' means in this context. Are you
> saying you saw barely any improvement?

I saw, without changes, just over 1% of total system emulation time was devoted to aes, 
which gives an upper limit to the runtime improvement possible there.  But I'll have a 
look at tcrypt.

> aesenc_MC() can be implemented on x86 the way I did in patch #!, using
> aesdeclast+aesenc

Oh, nice.  I have not read the actual patches yet.

>> ppc64:
>>
>>       asm("lxvd2x 32,0,%1;"
>>           "lxvd2x 33,0,%2;"
>>           "vcipher 0,0,1;"
>>           "stxvd2x 32,0,%0"
>>           : : "r"(o), "r"(i), "r"(k), : "memory", "v0", "v1", "v2");
>>
>> ppc64le:
>>
>>       unsigned char le[16] = {8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7};
>>       asm("lxvd2x 32,0,%1;"
>>           "lxvd2x 33,0,%2;"
>>           "lxvd2x 34,0,%3;"
>>           "vperm 0,0,0,2;"
>>           "vperm 1,1,1,2;"
>>           "vcipher 0,0,1;"
>>           "vperm 0,0,0,2;"
>>           "stxvd2x 32,0,%0"
>>           : : "r"(o), "r"(i), "r"(k), "r"(le) : "memory", "v0", "v1", "v2");
>>
>> There are also differences in their AES_Te* based C routines as well, which made me wonder
>> if we are handling host endianness differences correctly in emulation right now.  I think
>> I should most definitely add some generic-ish tests for this...
>>
> 
> The above kind of sums it up, no? Or isn't this working code?

It sums up the problem.  It works to produce the same output as the x86 instructions, with 
input bytes in the same order.  It shows that we have to extra careful emulating vcipher 
etc, and should have unit tests.


r~
