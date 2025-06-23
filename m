Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2740905dyb;
        Mon, 23 Jun 2025 11:54:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVR/M/GSXDwjN4tCZppUx/nEJW8TdN5Udl89dbFOLkSIcIQkGerf/zlhcoiI+wmyU4pbLTKEcpkO+PwYQ==@linaro.org
X-Received: by 2002:a05:6a00:2441:b0:748:fcfa:8be2 with SMTP id d2e1a72fcca58-7490d478702mr17718303b3a.2.1750704877348;
        Mon, 23 Jun 2025 11:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750704877; cv=none;
        d=google.com; s=arc-20240605;
        b=KPmdqHmJDh8jAsJvZauYCdunb+k3n/jMIkEJYPphs5BCJrLqvehvxgHZm8oC6IuCyW
         c1+ENkttZIa+TmCDtmjCx6VsdUPFo8QuJCSTW2V0rsPdWw2kylKUPDD6dEUT9qzzPlpq
         NWJs0nuohl1MC8/jzd0eK6HOgiCIf8El9TiYQ8lBLpJZrK8NHskdyw8Nd+7BOxgU+Kza
         5MmpGuOzdH6JLgGsP+eoQoEJOXrgGUsdRZSCyP4/csTJ/OoFzXlRs3oCpxWxsNuhOjH4
         aqnZmrqOifRyTClixR81yM6vOxKFWH72Hd7Tw4ubVEZJDrX8FLHbT/e4Eo5GX08oVM1p
         aQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3/IXpHCAIwAHF2+6D0xIvAg7uvuJY4X9jPtJNi9WglY=;
        fh=iQTikh1hdCVAmyvhGMwMo/LIXhXwj6zqqU+51oretk8=;
        b=DnilAfwZJrsGpEssxI4M1ft93jYaqikPt8Okcy6R9ivI91fWlGOompEtFYXr7mZs3T
         /14ZqdOXJB3m5l4CMNhbLfKoGdBUSxsl/apyMXEvdVFj7P+0eyKqlNgt6wL69jtEtLZe
         kk+cEeSE3nSY86zj9bpZPFG2MIlhD325fbtwiEzpnRSyYWdTg43gtntgtfdS89aedOkP
         p1txK7qyfEh2hrABMUBrlxn/EZSDQc6VjA4ip/boZ1YwKzMOmSYuj92doT+jgD9kAu2+
         TVIDjthXzsOSI1jTnO+L6r8gcOZin6/ZRQeV7FT7wAW4qgr1Xhs2VFLPGPOX3q+oXPOT
         yuiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XBKO27CZ;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7490a47bdd1sor6799065b3a.3.2025.06.23.11.54.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 11:54:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XBKO27CZ;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750704877; x=1751309677; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3/IXpHCAIwAHF2+6D0xIvAg7uvuJY4X9jPtJNi9WglY=;
        b=XBKO27CZAQB7uWJo7e9KTZBpzy6QFRpf9MTflEz96dRuU63Imz+AxZmUzu9yAPYqEh
         VVpJg+wD5YlrPVe8IEqZ7YAfpKrulBM37sLuPn40DWvaRBQIXfFasVvU9OaoP1QDKuhh
         VIsSoIuUrIAuf0pq9lazgkjR92i7VWvWgHWDt8FcYb8LBElqP+y+0lHdp9fkcGeg/AhN
         8rymYiKe46zIfXU9r0qyrLHPSCTUEQ9iW1DCeVfUTne69IgWT3VRHwyZ/GfvKeIxjtGB
         kdcfPTXaUqd8wEKSC9UVdjVbd39w97C8WTaSc1qcjpLjMJYbSWx57GpYHhc/F5bgdoKq
         Nzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750704877; x=1751309677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/IXpHCAIwAHF2+6D0xIvAg7uvuJY4X9jPtJNi9WglY=;
        b=MWz+XITO6fccQ04OYc0LC1WqPdq6q5pDk/ynz/w1H5Q7EmUePvmyUxgiolRPkINbDF
         HPPeRrgW/5IqSZjfs2gJWux6bx1KXdrBXIJ2tymyZVFxdqaJay1k/9bn9Sb55Qgwb39N
         DVTX9Avw71inEF3S6JGMQ40/T+svQr3EjokDwMLHEjHnLkNCDGu23dMFHxFGyVrdjubw
         YVFmTkm49Fv2Gt6Avuz5Djs2NTXahX+DHrQx/b6x0KELjLWL26VVsgSgXGo0UxVEZpnQ
         p66EMx3Z1uwvNSN3FRpqtzMKjdULo96lBFtmcFdtU686JuZQA5vrdktsKaOD3JJFXiX4
         feZA==
X-Forwarded-Encrypted: i=1; AJvYcCVhWJitF7dXXBEzr4fKRLFX4SBxkvSuzr1LgWiI9dAQDld+7MCc6bfU5wWLBSMMuBx9I5rtP8CebvmRMA==@linaro.org
X-Gm-Message-State: AOJu0Yyzw0meU6JxCAH3qSHQuKKjjwRc4aYpKrKK/k2QB3JzJrITMwP3
	HpoxKuRHugeBDZfB0+az4cmynRcsUOO8+N+9woMFx57ZFtTUOfOTW3G7aHixOjj8zTYcBZqs59j
	TbwC42vY=
X-Gm-Gg: ASbGncs8S0etzEZfxQMmUwOa3j3uefcR7ORAayeeSB4vWgYIOE+OkzxU+BoDmo+LFCB
	6TzTBtQMuMGtd/FzDrf5ruQeSFk7reb1V2/Y+KEAfrc32s2CiwZlQSzMU5IpXBvI5vLjeWxYPSQ
	04x2wpHjedD68rRQsOkFHCr2MI6C4rww9n04m6LFt0m+dUKlgNGufa4IdeMifNAbPAsvYotmnAj
	yW8KQn9/FukP+Q2Ku3bvuzQx5wTgeaKvaxzqy+8gss6Yru053+NKpFoJb/n9gFAY81EdGrfkcU/
	mB+MVnhevxqVP2ravUccv9SkZ56exYLkeJJsejxPvtyxYclQCJ3LVqKoW9X6kRkt0BlJmk5M8Q=
	=
X-Google-Smtp-Source: AGHT+IGut3T4373OR4+gus/ZZuHmpKmrLMdXpTr/TRLKWekKznOPkH/RicRBUxdBuXtzAQxKKpSYxQ==
X-Received: by 2002:a05:6a00:cd4:b0:748:e772:f952 with SMTP id d2e1a72fcca58-7490d651b3bmr18132635b3a.17.1750704876835;
        Mon, 23 Jun 2025 11:54:36 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f125d668sm7351529a12.54.2025.06.23.11.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 11:54:36 -0700 (PDT)
Message-ID: <99b8c58a-e570-4ab6-8abe-541fd89efec6@linaro.org>
Date: Mon, 23 Jun 2025 15:54:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v4 0/8] hw/arm: GIC 'its=off' ACPI table fixes
To: eric.auger@redhat.com, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
 <5b0f2250-e521-4172-870c-0384c5ef2382@redhat.com>
 <36ac7f90-d946-439f-ab20-123f542291b6@linaro.org>
 <cd38280c-6f5e-4c58-b40c-3391d121e557@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <cd38280c-6f5e-4c58-b40c-3391d121e557@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: sXmJKZRKzkYb

Hi Eric,

On 6/17/25 10:26, Eric Auger wrote:
> Hi Gustavo,
> 
> On 6/17/25 3:01 PM, Gustavo Romero wrote:
>> Hi Eric,
>>
>> Thanks a lot for doing a first pass on this series!
>>
>> On 6/17/25 06:35, Eric Auger wrote:
>>> Hi Gustavo,
>>>
>>> On 6/16/25 3:18 PM, Gustavo Romero wrote:
>>>> Since v2:
>>>> - Fixed no_tcg_its inverted logic (rth)
>>>>
>>>> Since v3:
>>>> - Fixed remappings in the IORT table when ITS is no present
>>>> - Rebased on master and resoled conflics, like no more "no_its"
>>>>     flag in VirtMachineClass
>>>> - Dropped patch 1/9 because we actually want the instance flags,
>>>>     not only the class flags, and the instance flags are the ones
>>>>     to be used often when deciding about the presence/absence of a
>>>>     machine feature, instead of the negated class flags ("no_*")
>>>> - Adapted the other patches that depended on 1/9
>>>> - Dropped patch 4/9 in favor of using the instance flag for
>>>>     checking if ITS is on or off
>>>> - Simplified VM options for the new "its=off" test
>>>>
>>>> v1: https://lists.gnu.org/archive/html/qemu-devel/2025-03/msg07080.html
>>>> v2:
>>>> https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00495.html
>>>> (Patches 6/14 -> 14/14 in the series)
>>>> v3: https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00567.html
>>>>
>>>> Fix ACPI tables for '-M its=off' CLI option and resolve the issue:
>>>>
>>>> https://gitlab.com/qemu-project/qemu/-/issues/2886
>>>
>>> One first comment is that this series will collide with Shameer's SMMU
>>> multi instance series which has been lunder review for quite some time
>>> (adding him in TO):
>>>
>>> I think it may be more future proof if you could rebase on it - I know
>>> it is a pain ;-( -. Or if sbdy objects for Shameer's series please raise
>>> your voice now.
>>>
>>> [PATCH v4 0/7] hw/arm/virt: Add support for user creatable SMMUv3
>>> device
>>> <https://lore.kernel.org/all/20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com/#r>
>>>
>>> https://lore.kernel.org/all/20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com/
>>>
>>
>> ayayay, life is never that easy! :)
>>
>> Thanks for point that out. Sure, I can rebase it on Shameer's series,
>> but also
>> I'd like to have this ITS fix for 10.1, so I think it's a matter of
>> understanding
>> if Shameer's series will make the 10.1 release (thanks for asking the
>> reviewers if they
>> have any current objection so we have an idea if it's close to get
>> accepted
>> or not)?
> Peter was the most annoyed by the usage of -device arm-smmuv3 option
> line. We'd better ask him.

I've talked to Peter via IRC and he said that since this is a fix it could
be merged first than Shameer's SMMU series.

In any case, I'm wondering if you could review v5 of this series, which I
published earlier today, specially patch 8/9 "Fix ACPI IORT and MADT tables
when its=off", since it's the main patch in the series and currently it has
no R-bs. I've addressed all your comments on v4.

Thanks a lot!


Cheers,
Gustavo

[v5] https://lists.nongnu.org/archive/html/qemu-devel/2025-06/msg03793.html

> On my end I don't see how we can achieve this more elegantly.
>>
>> Meanwhile, I'm pretty keen on if I'm correctly generating the IORT
>> table pruned from ITS
>> (patch 7/8 in this series), like, are the remappings for the RC and
>> SMMU nodes correct? That
>> would make me more comfortable to start working on a rebase.
> sure looking at it...
> 
> Eric
>>
>>
>>> Also I understood Shameer intended to write some new bios-tables-test.
>>
>> I see.
>>
>>
>> Cheers,
>> Gustavo
>>
> 
