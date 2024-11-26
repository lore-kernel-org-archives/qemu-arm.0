Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp287191njb;
        Tue, 26 Nov 2024 10:46:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXNSkUgcTzpd4GLfZz5ONe8nx0tn9ucUJ+9pHpCmVugbdRFrVHrs2dRHutN+xmv3ImV2xeNjkK0A2AZXQ==@linaro.org
X-Received: by 2002:a05:6a21:33a4:b0:1d9:21a0:14e0 with SMTP id adf61e73a8af0-1e0e0abe0demr760094637.12.1732646779960;
        Tue, 26 Nov 2024 10:46:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732646779; cv=none;
        d=google.com; s=arc-20240605;
        b=TUPgCqbygKly15LfTUYJkyphzLAP9bAbZal7/67fuduGdmPpIudfKUZnd5Wu4VYQeO
         eeFQF524rU4Ef1znCh0+eae8qn+ihjNKLIcXf0ukkwAZqdCwiTBNvMtLmg17+EUpMsQz
         s0uBJi0QzdMm75/mbfj8W1wUDnAPnlwr6sbIyVFv/DE0cQKpzrnafybt+uc0yXgF0wA6
         smuCMxjrIVuYUCYr8vJC78ZS0PZyYTWmykAO4rUgQfvuK58qjrcAftAg4B4SB3/uptUT
         tSSIT6VcccPXP3BaeJ5/HoeDVWE2Xp9Ly0xGKPg4jLZCQvXb8x24HIV3iRIIidEYr1xD
         fngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UOpd5qH5FKDNIIyv/+T3MFR9WErF9xtDaxWzlZNNZ5g=;
        fh=u/+EokaAevNVB0ufdjwxkWR2yo/bHAZ57uRNmPtIi1Y=;
        b=iUUGuIPikEn3o87/m3du7vIMqhr19V5mLxN+yJi4nMDdWgHhtxGESIzXAXK7qKE+FA
         /FDV2/p8/Z+wl3EN+YOZH9eA4WM1+p0cwyaRhC0tGs1aU+OxOgoO0IN4GYS++dCGdTUG
         cX8edMxNZUDSYK8pilu1in8QwbszfO5T9fvRufLxq97C4h55njv3B0gCQIY2sp4KoC2i
         j27fF5J8M3529PZvao4QREKFqy9v+9fDeMJEB3wEk2kPWxBZBfVxH0O4nJ/DBfRDsxjX
         wE+JTASf5V/6igzrwoUsgP8+pH29Uowpsb5vMdc9Q1M45BQsplMUH/0sVGUFpTRhlYcE
         2fTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vDZ6tT+q;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72519bd768fsor2232845b3a.1.2024.11.26.10.46.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Nov 2024 10:46:19 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vDZ6tT+q;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732646779; x=1733251579; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UOpd5qH5FKDNIIyv/+T3MFR9WErF9xtDaxWzlZNNZ5g=;
        b=vDZ6tT+qhIc9wQt7WlKPGUf7qzo6mM4+93g5OYwVpkgtYh7OOccZJqgqM//cJU0lOP
         90x2bFFC3EHvJ5pXyGtX7K57YOH9A0FreM6pyMSCvuZkt8BXFHA+uEmqsr2tCx8ojek9
         2WYy6+/Ym3l3K1AIzV8xr7pl5Mq6sFd51+4YhZfcCrrfx6NL5mDhSo5HX0bkV7PqxAMm
         Fak97ORnuG/l4erAnQRGFCli2vydALJ2osj8Gf3rTrC9DZSagy7HbYMBGCDHfoPdnV96
         Pvk53Vo5m97yFNOtUpywNFawo9VblcWt7kEwAnECnNSzE6ZoCYZ0Afaatvy0vQi27tLF
         hNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732646779; x=1733251579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOpd5qH5FKDNIIyv/+T3MFR9WErF9xtDaxWzlZNNZ5g=;
        b=KwnOhLPk2QaxxU3wZaXBL9iyCOl1xjZoTWXWaxgnzspmBDBdHunAf4BzZqXyHT9qg4
         n6MOglM/GXZ0HDNdqB53zDnirKXSDF2d75+9ARxv7xTdwcRgxEcOoS8Tq1o902lyqxab
         0qmiZwNYsCFrVkrqo2VeRlyGZv59wm4bn37Vtr+FWKNUZSwDfAR1hMgO5vLPQfdhBmqQ
         ZYJcZorHuzSbvjJne6D/fvxdBBP7mmcbBibMwVtrmhSAciIbtT7IAUO/9cZ9+prQFaJh
         QboAlMNByk5M4lTZbT1IFSTyFY5sCQi23F12kh/1akvA6jcV1h8439sAZMvPqBr4DRfb
         bV0g==
X-Forwarded-Encrypted: i=1; AJvYcCVrVKNnQ0H1YPO0niX/dD2uNorFj2PT+ywEIAxQSecAvYMH5rl0cMOcPfZksZ868giHQCivtOhP6Ey7hA==@linaro.org
X-Gm-Message-State: AOJu0YwN/g096hSfcD3nTxt6OjFHFOupNKIFGP12cr7RYU+168wyGlte
	5IALlZE+dVECGFGvFqSVwf8WbcyPnMPpb4VJgD5h3r6qCJv6daTUfA+HGLX92tqn/A==
X-Gm-Gg: ASbGncsqdHABF44Ux33n3mFDbI7usRp1s5zmO5oQO7uiFHP5SAzNlAKc9trorKA2Law
	USfJjRFPFRreBmr6c1WGKgNOFnOE4lMgwN5vM+blLZo7FeFbE0t2/4mXLGH3GpXi/+4s5ZwMnk+
	GXIy9WI+tOk9zHflz7OdrOR2UCAR8/HwxABfbe4NItgp4ozcymAsrO1P3lcpWTEsUm76dDo+/3c
	tTyQfRZhg80lGO/0nDOz69J+phOlASx0Br1isrGRQIRE5QPPsXmLbd/LrcNgrWPIsrpSHdJrWkE
	asl4GalZqAD3OY6uritYgQ==
X-Google-Smtp-Source: AGHT+IEbmFnweVpN7jJs/qvwQ83rTa7DycOQ4BOpWX4LxHlFTSFZc15SeL547IIIUGbPtZ6r9volfg==
X-Received: by 2002:a05:6a00:889:b0:71d:fe64:e3fa with SMTP id d2e1a72fcca58-7253014c84amr208515b3a.19.1732646778002;
        Tue, 26 Nov 2024 10:46:18 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de55b4c8sm8762893b3a.164.2024.11.26.10.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 10:46:17 -0800 (PST)
Message-ID: <561761eb-4068-4b09-84ce-56e98dd3d23d@linaro.org>
Date: Tue, 26 Nov 2024 10:46:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] docs/system/arm/virt: document missing properties
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 alex.bennee@linaro.org, Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>
References: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
 <20241122225049.1617774-12-pierrick.bouvier@linaro.org>
 <CAFEAcA8BhxbGH7xD8rpwRq2yG-FCef2yiNc6DWVmPgTFXEbLKA@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA8BhxbGH7xD8rpwRq2yG-FCef2yiNc6DWVmPgTFXEbLKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: LJuCU1TQ7KUN

On 11/25/24 09:02, Peter Maydell wrote:
> On Fri, 22 Nov 2024 at 22:52, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   docs/bypass-iommu.txt    |  2 ++
>>   docs/system/arm/virt.rst | 15 +++++++++++++++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/docs/bypass-iommu.txt b/docs/bypass-iommu.txt
>> index e6677bddd32..62818e44ed9 100644
>> --- a/docs/bypass-iommu.txt
>> +++ b/docs/bypass-iommu.txt
>> @@ -1,3 +1,5 @@
>> +.. _bypass_iommu:
>> +
> 
> This is a .txt file -- adding rST markup to it won't do anything :-)
> 
> (It's one of the remaining legacy .txt files that we haven't
> yet converted to .rst and moved to the right place in the
> documentation. The .txt files in the /docs/ directory are
> mostly the awkward ones to convert because they are a mishmash
> of internal info about the implementation and stuff that is user
> facing, that needs to be pulled apart by somebody with some
> familiarity with the feature and moved into the right places,
> or in some cases simply deleted as unnecessary.)
> 

Oops.
I was very unlucky because it's the only place where I did the mistake 
to use an anonymous link >`_, instead of ref link, so I missed it.
Adding too many rst links is bad for your (mental) health :)

I'll update the bypass_iommu link to refer to the file (upstream) instead.

>>   BYPASS IOMMU PROPERTY
>>   =====================
>>
>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>> index 11ceb898264..d3d21499ff5 100644
>> --- a/docs/system/arm/virt.rst
>> +++ b/docs/system/arm/virt.rst
>> @@ -169,10 +169,17 @@ iommu
>>     ``smmuv3``
>>       Create an SMMUv3
>>
>> +default-bus-bypass-iommu
>> +  Set ``on``/``off`` to enable/disable `bypass_iommu <bypass_iommu>`_ for
>> +  default root bus.
>> +
>>   ras
>>     Set ``on``/``off`` to enable/disable reporting host memory errors to a guest
>>     using ACPI and guest external abort exceptions. The default is off.
>>
>> +acpi
>> +  Set ``on``/``off``/``auto`` to enable/disable ACPI.
>> +
>>   dtb-randomness
>>     Set ``on``/``off`` to pass random seeds via the guest DTB
>>     rng-seed and kaslr-seed nodes (in both "/chosen" and
>> @@ -186,6 +193,14 @@ dtb-randomness
>>   dtb-kaslr-seed
>>     A deprecated synonym for dtb-randomness.
>>
>> +x-oem-id
>> +  Set string (up to 6 bytes) to override the default value of field OEMID in ACPI
>> +  table header.
>> +
>> +x-oem-table-id
>> +  Set string (up to 8 bytes) to override the default value of field OEM Table ID
>> +  in ACPI table header.
> 
> Do we have a policy about whether we should explicitly note that
> x- options are not ABI-stable when we document them?
>

I noticed that x-rme was documented, so took it as an implicit yes.

 From the commit that introduce them [1], it seems to be more a 
workaround than proper experimental options, which is a bit debatable to 
be honest.

If you prefer to not include x-oem-* options, let me know.

[1] 
https://gitlab.com/qemu-project/qemu/-/commit/90a66f48471975fd46f1caab1574679f0a0ef74b

> thanks
> -- PMM
