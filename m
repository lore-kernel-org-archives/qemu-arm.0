X-Received: by 2002:a17:90b:350e:b0:1b9:5875:a683 with SMTP id ls14-20020a17090b350e00b001b95875a683mr9415551pjb.51.1645624832239;
        Wed, 23 Feb 2022 06:00:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645624832; cv=none;
        d=google.com; s=arc-20160816;
        b=0ssj+CXslTFOegfcmYK7z3YesI9OkJ1i6JHGhJkEoBhOTWHJkyGJoXpIoRiZIbVFe9
         gSs7gADaxCQcSP9AS9jl/Rv2VS3wKRsDAwq647FaQY5vMfKF+7iuWNf7B9IhXPoQykvp
         cYVLzZRFQF1DtJbJRkfVcpdnvS1rIVm9adU1B1IqdTWX0wqjJTcNIwzjCxvpNGRxcV+G
         /oYprN0oKCk4ZWRykIPY6r45B2mX4o+mGdMi8/DcIwWGAvsUSwbUpuntXkxctC9sCGHO
         3pgdGqebV69m/g4hsEDuF8NfrU3Fo2Ab3IyaiIrhhGONEH6qw6nMeT4a80997TlFfVyQ
         Bajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=T+y+xA9qj6MT32+TrngYhekIAhT/7dydOHxB+0xIjuk=;
        b=zISuvoHAGjF1tMDBxN22jn84HK0is6dbZccEXUpkrz86PS0RaeuP7ft/YM8V8KxBUL
         miBpw6YbQ2zkg7gkPihcqJYlhfB3q+i+8ZqxfxX35iaft4EZ7RtGDRFLmYUSpS3a+JWP
         zCZObATISjLlgBjyCDiFHIxQLGRRQkPmg67cpYxdKObppM9tF1ffy8dh+3EYGglWMeb2
         5dfrMpOk16eMGDE/yBgovbNyWAPZC6vjzxS+3uXro4ZGB7KwVCyd+dbPOURX3VwfLc7W
         Rxwa3k+HZdXzMZaboBTdUyqx0SFNQVRSY5o/ySzuspvC3goUTltRS801CxLgaHcM8Whv
         rLnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=FkpRnf2U;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id rm12sor1365185pjb.10.2022.02.23.06.00.32
        (Google Transport Security);
        Wed, 23 Feb 2022 06:00:32 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=FkpRnf2U;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=T+y+xA9qj6MT32+TrngYhekIAhT/7dydOHxB+0xIjuk=;
        b=FkpRnf2Up7Q+vWgLfvUFo/IKiMKt30ESfTJBJrW5ECcrbHE9/dB/vCGxWdCFQOZu8/
         Z267wm9nmu/hG4fNHzFkvzBTXMpZzMJIuOsdsCGJfskZiRnBxvOoBq4sd31Oqfm/hD2/
         xnCufaiGVP+Xs+aYVYJjkIIVxuEvtBU1aGgczjwL4sGOJ4SnFeyS+QmN3QmLwbwIovuL
         XTaNLID8PM8yNLCtCJQECv3NLujNS7ici+9Hw3IiQ77skPrmQ+YGqOhODwgWKcu4VXMY
         3G5ZFHBP06XxPNG9BkoR7A0oJpGTJhePIi3HP53IyBkc9FR5Z5JhUuwGba3CNog8W047
         WM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T+y+xA9qj6MT32+TrngYhekIAhT/7dydOHxB+0xIjuk=;
        b=hD0lC/+Nzm2MMXZvhdBxUdQ1F4MnY1/eoCA+ThzsX++K1w7AAm2DVQpsImm163ccsl
         5x7Dkc0jY0Jdc++Ebm1jergWNmrS45ygpSm3ePNfWK3YwDWGyTrpfdIiutIKrhzDfvNI
         PIteFm4vW4V4tPR4ndmtHj6qOHAt1eji21c/ZXSOB3HQqWZZ2Pr5zG+ecWsQs51GZx78
         UQXmy7EOhGrWgqGj3UFZW064p2DuaMfp5VW8SY6e/YnWVlBl1hyXIeZzZfVKYh7HSRga
         I/zrXZcal0TPs4KjCtjrR0NR33TbLboLcVwxHpVXZN+AVE5j2u2ve7Kj/dAP71/ylCkT
         7L1A==
X-Gm-Message-State: AOAM530dtc+8e3Ch3rpREUR8+HuMgq+GabIzM0aGc3nizXArM7V1blO8
	vKEOwdHeTAtvSLzjgEJgw/c=
X-Google-Smtp-Source: ABdhPJwFML46R6l0kPC9idX1KXzHO3cMwSgYMZYbxtHZrRuBDswWyFAQEBf0pXB9YvJvqMGL6Ak40Q==
X-Received: by 2002:a17:90b:618:b0:1bc:2e76:6385 with SMTP id gb24-20020a17090b061800b001bc2e766385mr9344329pjb.1.1645624831121;
        Wed, 23 Feb 2022 06:00:31 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net. [83.50.68.71])
        by smtp.gmail.com with ESMTPSA id c15sm20221929pfv.6.2022.02.23.06.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 06:00:30 -0800 (PST)
Message-ID: <35c33bc0-54ac-b40d-6f81-f75ba59b163a@gmail.com>
Date: Wed, 23 Feb 2022 15:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Laszlo Ersek <lersek@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <cleber@redhat.com>, Oleg Vasilev <me@svin.in>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Idan Horowitz
 <idan.horowitz@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <YhYVVnVSL8K1S4MC@redhat.com>
 <e9f70381-03f2-9582-8ad6-e9252d3195ab@gmail.com>
 <YhY56KLLPrqGWtBM@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <YhY56KLLPrqGWtBM@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wWWtHHD6X17C

On 23/2/22 14:43, Daniel P. Berrangé wrote:
> On Wed, Feb 23, 2022 at 02:34:23PM +0100, Philippe Mathieu-Daudé wrote:
>> On 23/2/22 12:07, Daniel P. Berrangé wrote:
>>> On Tue, Feb 22, 2022 at 06:33:41PM +0100, Philippe Mathieu-Daudé wrote:
>>>> +Igor/MST for UEFI tests.
>>>>
>>>> On 22/2/22 17:38, Daniel P. Berrangé wrote:
>>>>> On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Bennée wrote:
>>>>>>
>>>>>> Alex Bennée <alex.bennee@linaro.org> writes:
>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> TL;DR:
>>>>>>>
>>>>>>>      - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
>>>>>>
>>>>>> Laszlo,
>>>>>>
>>>>>> Would it be possible to do a less debug enabled version of EDK2 on the
>>>>>> next update to pc-bios/edk2-*?
>>>>>
>>>>> NB, Laszlo is no longer  maintaining EDK2 in QEMU, it was handed
>>>>> over to Philippe.  I'm CC'ing Gerd too since he's a reviewer and
>>>>> an EDK2 contributor taking over from Lazslo in EDK2 community
>>>>
>>>> We need the DEBUG profile to ensure the bios-tables-tests work.
>>>
>>> Can you elaborate on what bios-tables-tests needs this for, and
>>> what coverage we would loose by disabling DEBUG.
>>
>> Maybe it was only required when the tests were developed...
>> I'll defer that question to Igor.
>>
>>> It may well be a better tradeoff to sacrifice part of bios-tables-tests
>>> in favour of shipping more broadly usable images without DEBUG.
>>
>> Why not, if users are aware/happy to use a unsafe image with various
>> unfixed CVEs.
> 
> Note there's nothing special about EDK2 in regard of CVE fixes (or lack
> thereof). The same applies to every other firmware we ship, as well as
> QEMU code itself.

OK, we are good then, thanks.

Phil.
