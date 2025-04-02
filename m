Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3452739njd;
        Wed, 2 Apr 2025 06:36:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgS1oBaeEB+ZOPZJAneHMuj7TqZt6LMBBIFV+MQWO2ea1YkWVVHnhDmC3Y8gX126EBjQIk6O18rlEK2w==@linaro.org
X-Received: by 2002:a05:600c:1f8b:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-43dbc6fb97fmr180080585e9.31.1743601001521;
        Wed, 02 Apr 2025 06:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743601001; cv=none;
        d=google.com; s=arc-20240605;
        b=lMjIFrgDy18AYNhwPvzRYth4llddoaUFcn/tlAHMJlD0OE9opnfYcnEb3RZ12sGymn
         8sZzmwERpIOrABiuI+eOc6rxNKWFhnweBUE4C+LkSqwY3YF/h2raMLy8knGNuEHSPxH1
         ezYY5ExdpjGKUY99iyqf2/TPexsI3nO8oq6HpnKNvvpPEf0rEI0HKqD9ZUFJAoai+m51
         dGVTf928C7qnfPY6Z0p6+CY0ge6zReX9XNrnvMz4VLKuTsz0Hr/M4335Pccvz2JYGnrr
         mYy6HpbnBvcCkUk7f91Nrqt3SvfDQxj32an7Rs9EADO7Xop7kIal1mA0RqRCsS8iS4oD
         tN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lJfVCNOyKlIn5SjHIiikLpbH+IBtLpw1jWMX+o/dVSU=;
        fh=/lxGOM5nsaiR0/fhfrnEe9ZCgsPFxCf826hcZbtsed8=;
        b=H6hTp5cL5oge6em/O1lqUkih6HBAZQykmiWYyWYg+vGgS6Sek6PaHMXXuWuAe5YR+s
         GIS+1oB6ZNhbux+ICjcrfo2PGkXJjrsa0SsW4KOnpCFOz/otl/qA0Gj4Q1W9oYCKR0+d
         zCja64lyC3WN2YBq69xqadlE1cvINd3h+vHc6jtiQW3/KALUV7aJgqBeqMfy/kPZnCAx
         3NAhfYPMiBG5DWp4c7N8Xhdbzk+4fkTdKQtaqyrN8Lrqf/EDYXsFvNTfEpfG8kpllQYI
         cfYtTjZ9OY5r0v0EChtudei+MxLUNusWbh27nZZWjf1YS4xcAv+LC2bYUU1F7E4k/R9O
         X8cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RtJKrn5S;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43eae467235sor12509355e9.2.2025.04.02.06.36.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Apr 2025 06:36:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RtJKrn5S;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743601001; x=1744205801; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lJfVCNOyKlIn5SjHIiikLpbH+IBtLpw1jWMX+o/dVSU=;
        b=RtJKrn5S53oa/jvUE1/IGlKPGiB8x0Ps+cbFPRkYbr1nUE29sJilaen3I9jIrQfO6t
         4af+eMV7dA/ngdfFg6iP0AoGphCZM/+14qUxLo79Ia2ydVqjbc2XZ7GcFaROr10UauL+
         w8PUgrlJlxOZzIoPvVmgguk0SBj6N/vXlRyYakNXdr+1n2YpsMnPreg3A0K/0/VEq2IC
         1ANCq1WcWp3QgyhJjQc0NJS64pp84Enu0xDQoz7hC7+Pj0hJdnSoaLXapj4ku/c64tK1
         4ZAbZnvWj6kjxc7f9MnxzcX+21OYXEd37Uhe8WqZEC63ZAGW2gt571p985FRlelYLlek
         vxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743601001; x=1744205801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJfVCNOyKlIn5SjHIiikLpbH+IBtLpw1jWMX+o/dVSU=;
        b=UhaitE2lvnM3ObHSTymneUW7brdVUr/LSXU4/y1yPKDTcPEGToPLpFTNPVaOJfFbSW
         Vv1FVZ83Q9Up4zfDOtsRXpblJ92Gbp57rmzP/DJNNWrV1zsxbrEM2hxSVKWygj8rvOYE
         lyBdYGMdZ9ruBdTQ+5d2YU+Tho5LfBy45bRH2HJlJpJw759F2P/J01v1poClEZ6GStsx
         vYR9J5LgoGTlZaKpd/s2PhLYO7SEbFj3FcR0An1iahYTO4oOXwcYLRqt+uikLrD2k7a8
         DIrGhxUUL4YyjcZ3ebJLcaAr8ExVNmwf6n9Dhgr6G3du/0NC22tcPKRXjTzI6VdVqtGE
         1j5A==
X-Forwarded-Encrypted: i=1; AJvYcCXAzDjzlO5w/rQE4IdHrxGpynEPrledEDU/xyTgb/8JP9uHHkWvwKn4Tx4np0HGxQF80Ab08bHLV5kvaA==@linaro.org
X-Gm-Message-State: AOJu0YwFV4WlSJYxH0h2OIYJB4izDDi7aA2N3T/L84pI8tlJRCbI+jCE
	ZJ6jupiQDxIKUYoti7YdcpFMXXtJKWaDhVR6yRsLbP28yOv5LzFQOvAl53EtaHB8uQ==
X-Gm-Gg: ASbGncs+EHzo8LYYUnxbTao2d6qp64ne+mcontgH8TAuxsgrsEwCZdpJ3THmxkcRWtr
	LJ2KdiWLrdk7EK5WoaaNYUfDMPuQocxcGWyXCK0WpMY8AnCxNTIneQPz3MHslopwzf85TQ6HoFk
	KxbKhhNitb8EFOtwu0JQFw4piJzQf7RRMRRGbkqboZbeqsrd5lbAdDYlp2eUNYVGtc4LVJ3YR/2
	z2empwr2lctj8J+VKWwtI8ng+S0IVeK0ZOz9WQH2IXWCK7gGJAD+4eYaCVP/PVwHY08XTsAciBW
	jiOWta+dKv8EgV5+uDbauoWFPpTTUc67vI+5mfvt6TA4ttA6k1V+JcI3FOgerxq3iWlNMxmTeh8
	GOcHCjTmKu50c
X-Google-Smtp-Source: AGHT+IHoyscVn8p5jxvX72Ru3UvDJ2OXxx0IAldkyjAZ5Adle9QLCIrr4AZ9ithEY6/SyYpc+bvqUQ==
X-Received: by 2002:a05:600c:1e22:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-43db8526564mr178633115e9.30.1743601000940;
        Wed, 02 Apr 2025 06:36:40 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588e9sm17432591f8f.14.2025.04.02.06.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 06:36:40 -0700 (PDT)
Message-ID: <ca52ecb4-6c1d-4299-9764-5839db2d013e@linaro.org>
Date: Wed, 2 Apr 2025 15:36:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/30] target/arm/cpu: always define kvm related
 registers
To: Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-21-pierrick.bouvier@linaro.org>
 <1109fe22-9008-47c6-b14d-7323f9888822@linaro.org>
 <11b5441f-c7c0-4b4c-8061-471a49e8465a@linaro.org>
 <428e6fdb-24b9-47a2-9d3f-4ef5c2e1a0ae@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <428e6fdb-24b9-47a2-9d3f-4ef5c2e1a0ae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: REPvINkOQNTC

On 25/3/25 02:24, Richard Henderson wrote:
> On 3/24/25 14:11, Pierrick Bouvier wrote:
>> On 3/23/25 12:37, Richard Henderson wrote:
>>> On 3/20/25 15:29, Pierrick Bouvier wrote:
>>>> This does not hurt, even if they are not used.
>>>>
>>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>> ---
>>>>    target/arm/cpu.h | 2 --
>>>>    1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>>>> index a8a1a8faf6b..ab7412772bc 100644
>>>> --- a/target/arm/cpu.h
>>>> +++ b/target/arm/cpu.h
>>>> @@ -971,7 +971,6 @@ struct ArchCPU {
>>>>         */
>>>>        uint32_t kvm_target;
>>>> -#ifdef CONFIG_KVM
>>>>        /* KVM init features for this CPU */
>>>>        uint32_t kvm_init_features[7];
>>>> @@ -984,7 +983,6 @@ struct ArchCPU {
>>>>        /* KVM steal time */
>>>>        OnOffAuto kvm_steal_time;
>>>> -#endif /* CONFIG_KVM */
>>>>        /* Uniprocessor system with MP extensions */
>>>>        bool mp_is_up;
>>>
>>> I'm not sure what this achieves?   CONFIG_KVM is a configure-time 
>>> selection.
>>>
>>
>> CONFIG_KVM is a poisoned identifier.
>> It's included via config-target.h, and not config-host.h.
> 
> Whoops, yes.

If we go this way, can we consistently allow CONFIG_${HW_ACCEL}
(read "remove poisoned defs in config-poison.h)?
