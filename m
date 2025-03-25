Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2329730njc;
        Mon, 24 Mar 2025 18:22:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTywr8wqNPRvnIM/r5MQZG+g1WiRWdA0v3MF+KCqPtP3OxLa+p5dpN82xTJhG2TQ+eOpUWtk7aiYmkIQ==@linaro.org
X-Received: by 2002:a17:90b:28cc:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-3030fe93e6emr26887783a91.10.1742865764911;
        Mon, 24 Mar 2025 18:22:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742865764; cv=none;
        d=google.com; s=arc-20240605;
        b=XT3P9abm1f8UnJeamxe9hjveYk3K3HJb0jxYhtdaB7NWQfMAfLC7r7WMdmIk95jjIp
         N2B0PkfFnfmAegKDcAaHtYkSzh/kj7/uvACGpNcuFiLgctGmsdCLVGsPjhF0Wc0fkfFe
         psk6E7W2Xf1XmQ4UXNZ/zdELoO47Gm+Fqkf6PyUw7E03/YzE1MdeHHzfdXU1Ju7ew73C
         5z1r2k4LG+1bdo2ueZXoOmayQwVneSLTp3dgz9Tv9anw3KjZX+rnTI0nPmUJgFrVAAtR
         BNCNDkJxWiDcYGJJ+vALh6uWWu6DGzTKMb+l8x9QcY2FxNoLIj9TU8V3mcgiLIJN3gzi
         Gy8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aG/ikolZ9gVRmszvosTh9e33E/vQ1AmQm3yTNYjPZIM=;
        fh=QdogeJndDFisuOUsM+as0w/2uXELE49QHh3Uswr0vkA=;
        b=JqXA6SF8uwT4DbRx3aZ9jf0T0L3M7qq/OH9C6lSrX2dAcLIGqKZKTF49knWb8sjkAa
         iXauV4juWlQXuC2J6f2ILhWDc4OH54zZ+YRG7wKlxA7Q/kPjdGqpG/90Aq3K/Q22WCbB
         VwZuDfw1RJ0HevB4WGt0d9uTwVjVu+HnxerxzpH4GeApNyCco7Wc+MhkyGjqiBQfMwXP
         d2CFAwySrzOTRu3pr9v7wTsJpphogMDQJFey+iJCWKG30sUwTZXaLsuxiOcWr3zWumym
         BoOUjcwMCrEy8hfdUyTaD8Q680mYAJnoGnECs5I15qS308kEngUZFMHeYaZ0OvirOBf3
         kZuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jnhgyma6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a27dcc5bsor5000830a12.1.2025.03.24.18.22.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 18:22:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jnhgyma6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742865764; x=1743470564; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aG/ikolZ9gVRmszvosTh9e33E/vQ1AmQm3yTNYjPZIM=;
        b=jnhgyma6MlJkOZyN7Deh2lL/48kGcu2c27bPfX+eujdAPwILMNHH0TzPawoVXj2b0/
         ZoEkolIi8+MD3tpHZQvrcB+f1d7gaRRdK+PZI3ObGQESeXY8ggBvLNKXt/w0IQapRTkN
         AkEA8/vVH0qhTHwewdhRicjCG39RtBDHaXr357mrwGDXRJREC0r9Q967QZER+b8qa5j9
         ohgb6DIxfh/H6GzGZwIbnYdzEZU/4Lej8kVGm1vBSLtuhbjlT84fcybUo1xzYNkmBmZI
         W9rTpXRBJ0AD0OZTF7kPrgWV5B7DW5h7Veqhf6dUblOxpUbQGRulxIflkQJNsgAWOE9Q
         zCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742865764; x=1743470564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aG/ikolZ9gVRmszvosTh9e33E/vQ1AmQm3yTNYjPZIM=;
        b=Z6oQ8vMAwUzrZdj2AHjO9jjYWTVwHE8b5uY7s/hkWgyQgyIGaVE45qst1O/UuRdFgX
         t55koz8t6ce5z6zwxl58CpX/xePH6Ve/WJ15sMQTTysXnMi2zhMCPuWh0xtOdTg5Y+mo
         IDQGY83iklvUjNz9towNE26xB1kBTxaR0yuKrSkX47PHAKtRYtOBVRbik7bRICZolhSy
         fawVKIPvTbd3WOZYY+MzhI+g5VBu3qD/MvdMvYUkiXan2dbqnLkUDmndCPebYp6ZmqVC
         djnXs7Wsn/eQ6OECxc1fR3yVqcu7hPUz5nWq7r7XljmSARKgyGYX6N3ePWYlddtIxzQt
         q5jg==
X-Forwarded-Encrypted: i=1; AJvYcCWPj3DTf+VoUzAQzzrbFcqfQWdHicWZucy1FBtLMRNEayJA6PRI73sMhZftMs8f37BKB18sc9VQjxtBwg==@linaro.org
X-Gm-Message-State: AOJu0Yye+PGZQgz5+N7uR8qzNQxFU7SjFacr+ch3n4yTqPn12VswpwFm
	Tq0AWThwsIGDFDEzULFSof3hNJbsF4ru2IMMJoXLn7Y2h1Kr6n/0iNmkh73wTPPB2g==
X-Gm-Gg: ASbGncs7qkPYzpmULB1CJR7Pt+7AdrKbdz9eyy31m2i4p8p1Ii3zhOMwZHOgjeuqSxV
	PdmtdIUgCVcndSY71240zrsUJ7WrQSONwGBWus9ZXFb3i0DZMisC2a8zcUNFTgOBCTfkmfaPS9u
	6HhV2kWH0+IGexFPWDB40h0FoNOgtQbLaNCPOAIi/dhTK3kvsZTPNQwEDloFiT7iAYgIBCcxyjv
	DydWB4sIq6qUhRHWdqUexUlLc0OPBCz5UAY+dyLQozm+nrbYr5Aug1S2Ge7ek0by2fxVOg/ZpgR
	HXroBA5L6TSHGrzqrqekkKmR9XW+sGyh0aIPu34R3AOyQ19xM9we7HA3GTFVakzsnUIcSKuvbzU
	0aQhhRX4i
X-Google-Smtp-Source: AGHT+IHEZCg9xs1G0ztU1F3GqMs42dpDB5T8VAwisopTv+ewq4W5/2ROGq56Z/iMGj+HJJwkTysYNg==
X-Received: by 2002:a17:90b:2743:b0:2ff:4a8d:74f8 with SMTP id 98e67ed59e1d1-3030fe721dfmr21437984a91.6.1742865764131;
        Mon, 24 Mar 2025 18:22:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030fe83d50sm8832615a91.24.2025.03.24.18.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 18:22:43 -0700 (PDT)
Message-ID: <67313299-0ce6-457d-ace7-73ad864a0eb0@linaro.org>
Date: Mon, 24 Mar 2025 18:22:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 26/30] hw/arm/armv7m: prepare compilation unit to be
 common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
 <20250320223002.2915728-27-pierrick.bouvier@linaro.org>
 <0c9055a3-2650-4802-a28c-e5d79052bc81@linaro.org>
 <6cce9fd1-d008-4b63-a77f-c091fcd933e0@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <6cce9fd1-d008-4b63-a77f-c091fcd933e0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: iUSyyVKH9DL8

On 3/24/25 14:31, Pierrick Bouvier wrote:
> On 3/23/25 12:48, Richard Henderson wrote:
>> On 3/20/25 15:29, Pierrick Bouvier wrote:
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    hw/arm/armv7m.c | 12 ++++++++----
>>>    1 file changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
>>> index 98a69846119..c367c2dcb99 100644
>>> --- a/hw/arm/armv7m.c
>>> +++ b/hw/arm/armv7m.c
>>> @@ -139,8 +139,9 @@ static MemTxResult v7m_sysreg_ns_write(void *opaque, hwaddr addr,
>>>        if (attrs.secure) {
>>>            /* S accesses to the alias act like NS accesses to the real region */
>>>            attrs.secure = 0;
>>> +        MemOp end = target_words_bigendian() ? MO_BE : MO_LE;
>>>            return memory_region_dispatch_write(mr, addr, value,
>>> -                                            size_memop(size) | MO_TE, attrs);
>>> +                                            size_memop(size) | end, attrs);
>>
>> target_words_bigendian() is always false for arm system mode.
>> Just s/TE/LE/.
>>
> 
> Good point.
> 
> By the way, what's the QEMU rationale behind having Arm big endian user binaries, and not 
> provide it for softmmu binaries?

For system mode, endianness is set via a combination of CPSR.E, SCTLR.B and SCTLR.EE, 
details depending on armv4, armv6, armv7+.

It is IMPLEMENTATION DEFINED how the cpu initiailizes at reset.  In olden times, via a 
board-level pin (sometimes switched, sometimes soldered).  We model the board-level pin 
via the "cfgend" cpu property.

In any case, for system mode we expect the guest to do the same thing it would need to do 
on real hardware.  For user mode, we can't do that, as we're also emulating the OS layer, 
which needs to know the endianness to expect from the guest binaries.

> If those systems are so rare, why would people need a user mode emulation?

IMO armbe-linux-user is extinct.

Debian never had big-endian support at all.  If there was some other distro which had it, 
I don't recall which.  Otherwise you'd need to bootstrap the entire toolchain, which to me 
seems rather beside the point.


r~
