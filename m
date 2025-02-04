Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp214388njb;
        Tue, 4 Feb 2025 05:40:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWdHW+ww7zhbcQ2zDpIDu8w7a2RcxNc7hE/etDbHD9eQKu6LeMauHEbQfbTQSU81c0mfbqJyJDW28hPsA==@linaro.org
X-Received: by 2002:a05:600c:296:b0:438:e256:a77d with SMTP id 5b1f17b1804b1-438e256a851mr182865395e9.15.1738676411849;
        Tue, 04 Feb 2025 05:40:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738676411; cv=none;
        d=google.com; s=arc-20240605;
        b=Nq/ECnszOPqUKPbq02eFuiJGO47cmOVJ+X1exX8I9Dt4vBDoQ+8Pn5/ckzWJ1NyORZ
         Mcj23nCP9Ve40eCzZY7IL1unKLwppyZU3CpaXCIjWqrzftLuxnzg+NUtfI7uOnV57mj8
         rk/SWrJ2OSjl5Bmr101tjmYPFSkJhEoXny8ImmsUTRA47b9OGfsDn0YgYLWD4PWb1GcS
         R6ig5tlEOgYgcr/QTg7e5mVBH+XeOhSihszYB/jkb9ex+Am8XIzyzHOiO8s12CS+7lGC
         w2EaoLHFV2tSI8G3A1Y7cs1ZacKm1pSYIRM4aQhVN+czJY0gpUoBoh39FTL02SCV7z/Q
         silA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4abu7DgodGgrUEXih3A/ZeH1z0OLewVueM3xF7MKAsI=;
        fh=waHsZbk/H/KmZFaZs2XrCzRuS3jArbcJ1gMrTwZlg0w=;
        b=Oafq7p+pzZyjAROV2aGJMLRe6khClzohhYGNKog7byeQ6TYFt9bVl7iAzFiqv5c6+F
         44XHrUImpASPDFn2AfwnBeuTXv4Vo3ikQ2PY4546dxhHfUMUtCNRAoAsZhdmUid2g/yV
         SLgRgPjM7vNOgTdrUisN8mAPswrpjIpy6J5gb27ec8WYm+Yo0GWjsZeBGkLIdVLW5cjy
         50Bzx74muDQo3qABKG5mJyN/aV+c46viKPVDev4mSXV8pJwO92D4t+rJUAipOdBMt17I
         SdCIF1Y8tvdDfi2gGF4jKd/jpm/t6zSw7937yT8oYhsLMFTAIuM2gIv/qrqCNaBKAHRh
         fXnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VkbSJRWF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e245f77dsor51352315e9.8.2025.02.04.05.40.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 05:40:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VkbSJRWF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738676411; x=1739281211; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4abu7DgodGgrUEXih3A/ZeH1z0OLewVueM3xF7MKAsI=;
        b=VkbSJRWFR//MbGGkNzPFJetwoUHJXAkQP3Pw2Fn506ppMmrLRYuMDqXa8zsicDb1V0
         tTi6HYpvjJBLjr0yWA2RZhObwBy1/EjG0ewzGnTkqjLcqZ1RkEJv++oqAr4x/UbFiwwt
         AicS3fwq5aNhrDV/P7MYU/q+UKAXq8osQWfnCFfcqkETSsftruAu0+EFTaIjGgoQo0iD
         JVOMhrO/W+xrHgscFnpIYKkXFaY0Dtr9mOYuM0DscRu3gvoXe1KWe+J7UIh4nFZyqBNN
         0kmVPbegA19piTCKNjGZi89S7ULg8KPVs3FIvpDrE8dTN/2f91/IT86vP+wpaSrh2u4m
         SyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738676411; x=1739281211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4abu7DgodGgrUEXih3A/ZeH1z0OLewVueM3xF7MKAsI=;
        b=nUQfK4xpOj8s0d5B91TR/S8CNw17XtzoL/mjV4Nl5FoH0n2WkUb3pwA6SHj2AIkj2M
         xZQf/fGbYqHGwhchNM6GxhRxoCj8Y8Ic48HhOufSRZkp5RIKp682EYLlxIjBd9rzLu5t
         orw2adrqtIcXw1LpkZvbgEYF1rpwhf8e80IMXL7QgvvImC6k4/DQU82ZYISRgPFYcSLR
         WL0GSsquVXxdYjDE+mBg6CZZEKW1KRijt3MwdTH273kPcgO6NTjiF3NArdhpu/uUx/tw
         KP8c1FomVjDyV75BTDYbda/XyJTvHvd3mtLq0v1B/oFZVVIsAJqQC91xFMJTK69IohWh
         pcoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW909VyUW/1kGL/ID0dYmjUsFouuuBCX1T5Tr9iApVZcHcCM2E0ho+JLK2GQRzbYpSeI6KDP8LGvz52A==@linaro.org
X-Gm-Message-State: AOJu0YxgoqLoxE7LKDOIcoDTkujXGvwMpXw/i0eaKNWVkIrna9eXHQgI
	YtmlriHMR/dHd5RnYp0XQ7+WxZ4//DIsKA4ZZke1eniFwkc4b5yZW7A6izPCTUaQOQ==
X-Gm-Gg: ASbGncu5UJ6H/tH/u2u9BEy3vBac23v3MJZhvHYk4NJIIFL9pqIpcnbwNX1eJOgPsXm
	pkrR6fCBndW+YC6+IGId/LThLfqedvpRe0YZX6os2jtenFfAD9oNrRPzLbrTLq2pp4ODHoPs2Z+
	7RN1D3PDMBcGhzdue4pXVlE8vwrR77rxsmvNhnx+8J3NHaZjTgTcF1GY4OYrXqUOHTXg2wMvhJI
	EEBlypREk5JpUcTwjqw3LG2/zdZO90lSmG3BE3z3x7xY9Wgm9Knygo8WxmDKKtd/qDfXlH0/T8f
	K3vvxzDTNVkX1NbPaGwnJ+5WwG5L7ObnGDJOw/+CRWMc6p6Y/NJFHosSSEE=
X-Google-Smtp-Source: AGHT+IEeJDWMdGayWk7JCYoXQIneANAogcQLAXjc6zdz8z0r5MNgtUPRr0BH/wOzOgyk+Ggt2TjPbQ==
X-Received: by 2002:a05:600c:4f83:b0:436:713b:cb31 with SMTP id 5b1f17b1804b1-438dc3a904cmr216578035e9.3.1738676411275;
        Tue, 04 Feb 2025 05:40:11 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc27125sm223275395e9.15.2025.02.04.05.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 05:40:10 -0800 (PST)
Message-ID: <8616891b-9747-4388-99dc-d6e53e090001@linaro.org>
Date: Tue, 4 Feb 2025 14:40:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] hw/arm/raspi: Deprecate old raspiX machine names
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 Laurent Vivier <lvivier@redhat.com>,
 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
 Jared Mauch <jared+home@puck.nether.net>, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 devel@lists.libvirt.org
References: <20250204002240.97830-1-philmd@linaro.org>
 <20250204002240.97830-12-philmd@linaro.org>
 <CAFEAcA-3JJ1tZAXsik5hAonuSO9sCqDF1xqPQVhAeN-XwAAhDw@mail.gmail.com>
 <e32a54f2-ef46-4964-89d4-a8969b6d1b05@linaro.org>
 <Z6HklNsu0Mzgh7bC@redhat.com>
 <CAFEAcA9m8g=K-0RU31kswbNSKWnUqA78KxNkcXEAqR=BhWc9bA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9m8g=K-0RU31kswbNSKWnUqA78KxNkcXEAqR=BhWc9bA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MWcSR5+Bpc/F

On 4/2/25 12:13, Peter Maydell wrote:
> On Tue, 4 Feb 2025 at 09:57, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> On Tue, Feb 04, 2025 at 10:51:04AM +0100, Philippe Mathieu-Daudé wrote:
>>> On 4/2/25 10:22, Peter Maydell wrote:
>>>> On Tue, 4 Feb 2025 at 00:23, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>>
>>>>> All previous raspi machines can be created using the
>>>>> generic machine. Deprecate the old names to maintain
>>>>> a single one. Update the tests.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>
>>>>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>>>>> index 4a3c302962a..c9a11a52f78 100644
>>>>> --- a/docs/about/deprecated.rst
>>>>> +++ b/docs/about/deprecated.rst
>>>>> @@ -257,6 +257,19 @@ Big-Endian variants of MicroBlaze ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` ma
>>>>>    Both ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` were added for little endian
>>>>>    CPUs. Big endian support is not tested.
>>>>>
>>>>> +ARM ``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b`` and ``raspi4b`` machines (since 10.0)
>>>>> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>>>>> +
>>>>> +The Raspberry Pi machines have been unified under the generic ``raspi`` machine,
>>>>> +which takes the model as argument.
>>>>> +
>>>>> +    - `raspi0`` is now an alias for ``raspi,model=Zero``
>>>>> +    - `raspi1ap`` is now an alias for ``raspi,model=1A+``
>>>>> +    - `raspi2b`` is now an alias for ``raspi,model=2B``
>>>>> +    - `raspi3ap`` is now an alias for ``raspi,model=3A+``
>>>>> +    - `raspi3b`` is now an alias for ``raspi,model=3B``
>>>>> +    - `raspi4b`` is now an alias for ``raspi,model=4B``
>>>>
>>>> This is not how we typically handle "we have a bunch
>>>> of different devboards in one family". What's wrong with the
>>>> existing set of machine names?
>>>
>>> Zoltan and you don't want to add more machine names, then you
>>> don't want a generic machine. This is very confusing.
>>
>> IMHO we can have distinct machines for each model, but
>> *NOT* have further machines for each RAM size within a
>> model.
> 
> Yes, this was what I was intending to suggest. Apologies
> if I was confusing with what I said the previous time round.

OK, let's see if we understand each other correctly as developer,
before explaining to users, taking the 4B model as example.

The 4B come in 4 physical variants, depending on the amount of
DRAM: 1G, 2G, 4G and 8G.

We can not allocate 2G on 32-bit hosts, so to have a reproducible
guest behavior on 32/64-bit hosts, it makes sense to takes the
model with 1G of DRAM as default for the 'raspi4b' machine.

If an user specify -m 2G ... 8G, we can adapt the 'board_rev'
register to expose the corresponding amount of ram. Now, how /
where to tell the users 1/ the default is 1G, and 2/ they can use
2/4/8G?
