Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp373512njb;
        Tue, 7 Jan 2025 10:57:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6C5RM7zxmDCx+MwT9XIFMet6M0rA3Ej0TAOWUm2K/NtzPCvKPg2KILI9s5ETIutV01BBW/JMVeRoxOQ==@linaro.org
X-Received: by 2002:a05:6000:1f88:b0:386:4034:f9a0 with SMTP id ffacd0b85a97d-38a22408cbemr50010135f8f.52.1736276226204;
        Tue, 07 Jan 2025 10:57:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736276226; cv=none;
        d=google.com; s=arc-20240605;
        b=Z00o9/R+PVCCtCkvjdmJaMBtopGRg9qf7OyPgaJ6G+e63XXZE93M+W11WcnikDwpGs
         5dIaWN/IFcTE2VNC8Hw3xHF7PNzWu4yfzUGMJZm14qn1UUESyu8L3a0Fi4dTViZAS1m+
         K9sqcXauRwgvNNKXQvaFyfMzx6BjpYGOpyNRWeOTK/w3BUbvnya/QZnloI+8b71fiMS6
         j5+GuHWBiXQJHQtj25x7qdvY3IAjrWlUycoc4Fgo9WHJgcEznCAj5d3nN+lhnyCGaDJd
         7cR5vIJsOJDQtP+oVNWB85uo5ZAYeGU/nfL0omON96IULSQhfEHqF7oVsp5zs5H0IcKW
         xVNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=c3darVpZrv40gfMs7JtLycBDIF+yCQhL7QwhFFYlrrw=;
        fh=KDSRFqQ9MMs5GHs5MnRHvgy2s2e/GZlHdC1wjA9NxHY=;
        b=HLQBM8MISvWeD0/SeOSL5ncQDShxoawXHo4lgaivg37RclGJaG9/vFGTqh23E9SLtR
         7pFDbHyhInh9IAn7bkxXQlKkevx3vxJIhemdTAwHSFkUoC4U/ma2KPGGT10GRTzNK4P8
         MBKUrMEzWTq7fk0537YfqmMwB4vBpR+FJTgeE/+lVtioTxEsVatCu+iDuwyfDkt6JNhD
         WUtQRBXrqUVoS+hv+dtE2vvRjexvEDWocbbqApspeudhaKnvYWraFK/m/bF1dM3TsTcD
         SpFAEAuc7r1wyM9/6PYyTpx6MBSjvkUDWj8Jq4K89OBmb0sHYFfGtii1/IAhiItiYLAa
         pYaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qu3Ew4vi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4367129ad29sor95166545e9.1.2025.01.07.10.57.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Jan 2025 10:57:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qu3Ew4vi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736276225; x=1736881025; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3darVpZrv40gfMs7JtLycBDIF+yCQhL7QwhFFYlrrw=;
        b=qu3Ew4viufhUALWcgxyz5eG77CPRYZn0a/ayVuaRF5Zl33QcGv0wW6p/KBLvbGNUyv
         3+DzUVB8qYlCWgBVamMKrtBewCHi9kE9auTLA6/y1Dm4ZjTmwfXIdKP98OlHKqOeFhKR
         /fiIOO2fljUm362mT/cAlfD/BHIqieodn2w5WXOs55ie0y5NxNSPpBLbyYLu0cCkVQUM
         oSolQ5RDvR/JWpcGV+cEZGzLNioIog4sVuNF9O7IzyRLrpEzCsEzOP+Br6nSzCN1ue+e
         JWGoYbCdf1n73xoc0H8y5b9OuzKlUDf5+Jz+wWPq2/zZJWMRfLE18WLpThxyP6QvenpW
         50Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736276225; x=1736881025;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3darVpZrv40gfMs7JtLycBDIF+yCQhL7QwhFFYlrrw=;
        b=pkroi/Wyzy3eIcecP6mKrCZW7Prkigs69jR/MNVc1EXFZ/i53sAQY4EA3KzGmtoyCz
         lD34DpbbjNkGfGX6I4Eklnj9qR27sQo6rYmZLDBIjp7CBXkgTN2owJyLV2I0n+0kFhlI
         isZl1nwAQYmLL++fFTilcEcvvpAaj5d4A3tff8HLJali92yZRO53AFi3Zhw2qckQDXYp
         te3GHEFdwIWxYqn7JaM+LWuIu3TYklaFB2X8BNQuaQeggAhwAWz9W46Ic0MmHCRCeBTu
         XXrbsLF4fMPFJXVgebRF3a7QGJMHz9IkNYKuXjSimya438y7ESzcKo7sboP2/seqtSuN
         bf9w==
X-Forwarded-Encrypted: i=1; AJvYcCV7k8UqxCLgstRVTiC4d1IKrnDQZ/T9D/IUgMrgTAntcEgiDTn6+Q14tnbwnHEEFM0a0n/wF3nT8Gk1/Q==@linaro.org
X-Gm-Message-State: AOJu0YzXP7euhhhqsrn2bqVXpgjgbzRIbdZnteIGBA8oMjTNcpSerQaY
	/L6jA04zqetfZhn/wlMYWEq0AqAenlTaDAQjGQ0yNPes+cJmucqni1uTNLi7Lz5CaA==
X-Gm-Gg: ASbGncvURgmKo9dFoRwt3Ag8ZQK7MMotDb5xpTxjVjOR32Ivt9BtyneLKX0n1LOMF7U
	+x6xACxuasmlluVLpO23QZ9/sTaDmBf8PMHoDassRQULRobPlYY8Yhz9YUHhObT04O4g2UjVtQi
	ZN4EyOVT3gpfjtHcHu6uOuoOXMgQWYLlp7yTIkDTt4TMI7swErBbC2Bp5Iuy0d2mP8a3Zepd/vz
	CpM4IpS/dsuB3beOBSICRQu40Of+RBlH7SxFZeZkKEAeUD+3xi7/jwbPrlGQvOGtv2t0d31Lveb
	MXyYW1LELsNx1SInsD2RCnuO
X-Google-Smtp-Source: AGHT+IE+xFX0awFyDNf7ue4odLMiLyG5RNcDktK8Off4n0U35vuGUlXBUMwfnrUkHSUOGt/fSr0dWg==
X-Received: by 2002:a05:600c:3b24:b0:436:2923:d23a with SMTP id 5b1f17b1804b1-43668b7a683mr430353145e9.33.1736276225648;
        Tue, 07 Jan 2025 10:57:05 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a71sm602097695e9.26.2025.01.07.10.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 10:57:05 -0800 (PST)
Message-ID: <d1674d1e-e6ac-441f-acbd-ad3a2dcd15aa@linaro.org>
Date: Tue, 7 Jan 2025 19:57:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] tests/qtest: Add API functions to capture IRQ
 toggling
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 armbru@redhat.com, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20241216141818.111255-1-gustavo.romero@linaro.org>
 <20241216141818.111255-7-gustavo.romero@linaro.org>
 <77ee967d-00e6-45fa-a8b1-42192e61b553@linaro.org>
Content-Language: en-US
In-Reply-To: <77ee967d-00e6-45fa-a8b1-42192e61b553@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1JOwDMt01n+z

On 7/1/25 19:35, Philippe Mathieu-Daudé wrote:
> Cc'ing maintainers:
> 
> $ ./scripts/get_maintainer.pl -f tests/qtest/libqtest.c
> Fabiano Rosas <farosas@suse.de> (maintainer:qtest)
> Laurent Vivier <lvivier@redhat.com> (maintainer:qtest)
> Paolo Bonzini <pbonzini@redhat.com> (reviewer:qtest)
> 
> On 16/12/24 15:18, Gustavo Romero wrote:
>> Currently, the QTest API does not provide a function to capture when an
>> IRQ line is raised or lowered, although the QTest Protocol already
>> reports such IRQ transitions. As a consequence, it is also not possible
>> to capture when an IRQ line is toggled. Functions like qtest_get_irq()
>> only read the current state of the intercepted IRQ lines, which is
>> already high (or low) when the function is called if the IRQ line is
>> toggled. Therefore, these functions miss the IRQ line state transitions.
>>
>> This commit introduces two new API functions:
>> qtest_get_irq_raised_counter() and qtest_get_irq_lowered_counter().
>> These functions allow capturing the number of times an observed IRQ line
>> transitioned from low to high state or from high to low state,
>> respectively.
>>
>> When used together, these new API functions then allow checking if one
>> or more pulses were generated (indicating if the IRQ line was toggled).
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Acked-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/qtest/libqtest.c | 24 ++++++++++++++++++++++++
>>   tests/qtest/libqtest.h | 28 ++++++++++++++++++++++++++++
>>   2 files changed, 52 insertions(+)


>> +uint64_t qtest_get_irq_raised_counter(QTestState *s, int num)
>> +{
>> +    /* dummy operation in order to make sure irq is up to date */
>> +    qtest_inb(s, 0);
> 
> Isn't it better to simply call:
> 
>         qtest_rsp(s);
> 
> ?

Sorry I misunderstood. You want to flush the qtest socket, right?
Could this be sufficient?

           s->ops.send(s, "\n");

Otherwise I'd rather add a "nop" command. Seeing "inb" in traces
is very confusing.

> 
>> +
>> +    return s->irq_raised_counter[num];
>> +}
