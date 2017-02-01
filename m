Received: by 10.25.77.65 with SMTP id a62csp484494lfb;
        Wed, 1 Feb 2017 10:03:17 -0800 (PST)
X-Received: by 10.55.69.80 with SMTP id s77mr4241321qka.159.1485972197814;
        Wed, 01 Feb 2017 10:03:17 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com. [2607:f8b0:400d:c0d::241])
        by mx.google.com with ESMTPS id s4si14965284qtd.114.2017.02.01.10.03.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Feb 2017 10:03:17 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) client-ip=2607:f8b0:400d:c0d::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x241.google.com with SMTP id s58so24778598qtc.2;
        Wed, 01 Feb 2017 10:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=5c0idpoAQGDYe2QHJfgY8mNS/m2LUgqZlZy9otghwEI=;
        b=PHLvcIdZZRR1812K6S5e15J4wqCYlPQXW/+9dcVsufqg42EAXgXr3Pvo9FKfmYK7IA
         3tC+3n4divqTD2t6ln61CB5maaYHoILfPrhiO26v1MkFbADReXjWmtBqHLbQiOVJpT7N
         XYvO1Rn+czolazvmAAV4YHrqYLl5VUW6zFamOPXTQMKXBeg+vvzBJH3GVWIsA5ZWHax/
         ZYueprmK9+w2BKisHN03LJVbhX971jL4H9sj6S5JA9F/u6a/pe5cklkaxE4nnkXRSD7B
         D2DnMPP3KPIRW7Ts+Hx5K+IDXQi91S5md4077aedqYLAZO4qONpXiZdOP0mHqrY5Er/4
         kfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=5c0idpoAQGDYe2QHJfgY8mNS/m2LUgqZlZy9otghwEI=;
        b=Vl/6ZChTFlt3S/6oCgEX+Y/2vNKzihNEV5WbP3H5Bapuq8A3WIQvlb5NnGBR+/sV3K
         WutRzq4YY4j4Ql5q12Mvspcr7jracYTJCX5S4FqvDAPBSxGfIBZeHFp+r8ZptlGIV8Oz
         rmpKqV4NZ+oZ4MeXgramrUzz7+b8sV8Qn6OS8EGUiry5Ha3oTn/wmCYviQXSvi2PLBQh
         cfgOGtIn2/2nW7dHsVFeBPu99Jl5LYxa3bThwyGztDkESJt7MGHsS6NNQ5BEWwfLG0Vl
         eahTK5eFtR1UTZlU+kQjmx7UJl6l7lhS8xDJSuZ6MibmCrHRzsJwV2Rb6p0QrjbDcLJi
         5C9Q==
X-Gm-Message-State: AIkVDXL/p+UF79zcTzlKtL7f5uS9mcjTdRQgodXEhOi67dgJVOlpPOOJ2N69OOu3fxQO/A==
X-Received: by 10.200.58.101 with SMTP id w92mr3971751qte.160.1485972197310;
        Wed, 01 Feb 2017 10:03:17 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from anchor.twiddle.net ([2602:47:d954:1500:221:9bff:feff:8add])
        by smtp.googlemail.com with ESMTPSA id s2sm19206352qts.25.2017.02.01.10.03.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Feb 2017 10:03:16 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v8 16/25] cputlb and arm/sparc targets: convert mmuidx
 flushes from varg to bitmap
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20170127103922.19658-1-alex.bennee@linaro.org>
 <20170127103922.19658-17-alex.bennee@linaro.org>
 <70fe24bb-c8f1-43c4-010f-a682bdd507ef@twiddle.net>
 <87efzi41hk.fsf@linaro.org>
Cc: mttcg@greensocs.com, qemu-devel@nongnu.org, fred.konrad@greensocs.com,
 a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com,
 nikunj@linux.vnet.ibm.com, mark.burton@greensocs.com, pbonzini@redhat.com,
 jan.kiszka@siemens.com, serge.fdrv@gmail.com, peter.maydell@linaro.org,
 claudio.fontana@huawei.com, bamvor.zhangjian@linaro.org,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, "open list:ARM" <qemu-arm@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <0f259091-2279-52d6-0019-4d78133c8113@twiddle.net>
Date: Wed, 1 Feb 2017 10:03:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <87efzi41hk.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: tdIrMLj/Chq/

On 02/01/2017 03:03 AM, Alex Bennée wrote:
> 
> Richard Henderson <rth@twiddle.net> writes:
> 
>> On 01/27/2017 02:39 AM, Alex Bennée wrote:
>>> +    for (mmu_idx = 0; mmu_idx < NB_MMU_MODES; mmu_idx++) {
>>>
>>> -        tlb_debug("%d\n", mmu_idx);
>>> +        if (test_bit(mmu_idx, &mmu_idx_bitmask)) {
>>> +            tlb_debug("%d\n", mmu_idx);
>>>
>>> -        memset(env->tlb_table[mmu_idx], -1, sizeof(env->tlb_table[0]));
>>> -        memset(env->tlb_v_table[mmu_idx], -1, sizeof(env->tlb_v_table[0]));
>>> +            memset(env->tlb_table[mmu_idx], -1, sizeof(env->tlb_table[0]));
>>> +            memset(env->tlb_v_table[mmu_idx], -1, sizeof(env->tlb_v_table[0]));
>>> +        }
>>
>> Perhaps it doesn't matter since NB_MMU_MODES is so small but
>>
>>    for (; idxmap != 0; idxmap &= idxmap - 1) {
>>      int mmu_idx = ctz32(idxmap);
>>      ...
>>    }
> 
> Perhaps but if it is OK with you I'll skip this optimisation for now? We
> are basically in the slow path by this point and for clarity I'd prefer
> to keep it as is.

That's fine.


r~
