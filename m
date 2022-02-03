Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2148597lfk;
        Thu, 3 Feb 2022 14:02:24 -0800 (PST)
X-Received: by 2002:a63:393:: with SMTP id 141mr74285pgd.267.1643925744004;
        Thu, 03 Feb 2022 14:02:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643925744; cv=none;
        d=google.com; s=arc-20160816;
        b=xY/D6TYxCy+aDWUBcZxeev2K1V1GGx+/RTZOhTbmw8w0eX+SOl9hi9AnqZWFu7Zspv
         +rSLxK4ED49ZfYrNi87/5xcnrHz3eqZb30OUlvtYhQrGJwMmTgM6FVU2IIwLk3bQncnH
         Vneo0b8aubx8TmxFgNVyBcvBltVXVv550Sjf8f82/sLgyRgimYpBx7VCpmEtnh1fC9Z5
         kYoMl6IQuLSuk9dnMJMB9uwayt84834Sp9NbfIAAACRn4Xgl4Qu8DYzqTKiPMnr/GUY/
         GCkkTIpA863l3DCxy+P+LdbCEOaYmmq381r3XT5r95iPHJCPoHFHJdkIUHDz02AnxRXO
         aQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Hlvm+MjaT3L/Zf1f3awZy/er0qThgJL2b/6l9FAGleo=;
        b=NMQyZyt80ew2joLc7IsWFKsl1TWfPiG27Fok2xq/Ch5jhUIZ6rGJnwufSujQg05pS8
         7H7oModJSK01VsKS23gpFmqg+ydj7TeyPlaX3TD/xKp6cohS07USzvLOGNpQ42XoAimG
         BjEo8PEQHWo/HNtD1rpOGhv/wjvEiZuE/dXJh5wkY+lj7IE5LYWjfSJSO6H+yEx09ti8
         SJpwIkYte1YWnGDN62meTEDxTDHZ6FKj9q8jJWr9g0zRXJ56LBmJsmLgQ7MBoj0Fy0uG
         L1JTyqBU4BNNF8uAlitj4UJeXuxuctBkCfrN02H+WCWbZ0VAT+vvnk9jZiOzYmjXlRJR
         WRFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oGyyhyVs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l142sor55595pfd.74.2022.02.03.14.02.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Feb 2022 14:02:23 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oGyyhyVs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Hlvm+MjaT3L/Zf1f3awZy/er0qThgJL2b/6l9FAGleo=;
        b=oGyyhyVs2yKdO2Vo8yMUZYhPdwZqaytlHZs76/x+0qNj8glDkCJttvxMeDXFxc0Mtm
         BgWU2HzYuETWbjnw6Ka43q7osxuGdPdv/fHKlMrgISiZQ2g18GtGrl+k0qkWGxmrb5P/
         sjQFXUbPbENZ2WVoCuavArg9xlPvzzs6xShZoq707DRVt63yuOwEkCpzWf0Av4c50EuN
         kbzfodo27sp0fDN6dsvWxwzWftX0nY140krV16bqaQhggidkbx2P38C8lJBTOMpKJKhs
         M+HjIU3OJcKoqd9g9eo8w2LCKfzkl/ju62YbeuOE2Xm5aBsH4CPlX7f4aA/cPQa1Upu5
         E2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Hlvm+MjaT3L/Zf1f3awZy/er0qThgJL2b/6l9FAGleo=;
        b=tBnDoWOzzuv1segGBS7sgFVpmLyrwVXK4DTn2mJluPOuQCGMVk137RVcdFuNccUfxn
         P/IPkjvzqNfu0/d5qTTmMIx/7SPqYJ3gpSgZ/+uE8LFrDtJiaKufMMBSbCjh4DeCfXoH
         MwnAT4f+F+0RGUZ5+TsSfcDEb3O2io7YZVNtpN7SJdPTP+mYiPAqd8d/RDIllb0bt15N
         LMGJmQQ/KUr9/I4k2CclBolUUe704/BGbt5E2TRWKJ0l48Wv+GWKF6VyWLGOF435B+5z
         iERVWfSRUEG4O0EQaPlFdf2/FN7PsgnLbOrxZsWrPeg0mpDRf8Hk8z5P7vw8Xl/7BLBu
         x4Bw==
X-Gm-Message-State: AOAM530Zy7HU4Xy8Mx3AEbe91UBJsAPun9Y0+ZTCL+pQYFYYK4itRpD6
	czMLv570RoefHepihIb05nz8OC/y
X-Google-Smtp-Source: ABdhPJzySfDHhEt33vTN9Kq1KKhs5TYX98Il0UgKZ+FVT62vjBs/nx9coeEEqexw1cJGWWCEjEW/pw==
X-Received: by 2002:a05:6a00:b42:: with SMTP id p2mr184345pfo.50.1643925741913;
        Thu, 03 Feb 2022 14:02:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:8003:3a49:fd00:e4a0:3bb7:a616:35c9? ([2001:8003:3a49:fd00:e4a0:3bb7:a616:35c9])
        by smtp.gmail.com with ESMTPSA id z13sm8229pfh.45.2022.02.03.14.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 14:02:21 -0800 (PST)
Message-ID: <2b1358f1-0447-4805-d7e2-e01eb1b3ed9d@linaro.org>
Date: Fri, 4 Feb 2022 09:02:16 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/13] hw/intc/arm_gicv3_its: Fix address calculation in
 get_ite() and update_ite()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-7-peter.maydell@linaro.org>
 <afbbee74-b6fc-7b55-f7e4-c5ae926f7519@linaro.org>
 <CAFEAcA9Dj0K5T677__5wBA5=T5c1qOxNxwW5hkZU9-vDCP-76Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9Dj0K5T677__5wBA5=T5c1qOxNxwW5hkZU9-vDCP-76Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: bDCCVj5fG7L9

On 2/3/22 21:45, Peter Maydell wrote:
> On Thu, 3 Feb 2022 at 03:59, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 2/2/22 06:32, Peter Maydell wrote:
>>> In get_ite() and update_ite() we work with a 12-byte in-guest-memory
>>> table entry, which we intend to handle as an 8-byte value followed by
>>> a 4-byte value.  Unfortunately the calculation of the address of the
>>> 4-byte value is wrong, because we write it as:
>>>
>>>    table_base_address + (index * entrysize) + 4
>>> (obfuscated by the way the expression has been written)
>>>
>>> when it should be + 8.  This bug meant that we overwrote the top
>>> bytes of the 8-byte value with the 4-byte value.  There are no
>>> guest-visible effects because the top half of the 8-byte value
>>> contains only the doorbell interrupt field, which is used only in
>>> GICv4, and the two bugs in the "write ITE" and "read ITE" codepaths
>>> cancel each other out.
>>>
>>> We can't simply change the calculation, because this would break
>>> migration of a (TCG) guest from the old version of QEMU which had
>>> in-guest-memory interrupt tables written using the buggy version of
>>> update_ite().  We must also at the same time change the layout of the
>>> fields within the ITE_L and ITE_H values so that the in-memory
>>> locations of the fields we care about (VALID, INTTYPE, INTID and
>>> ICID) stay the same.
> 
>> This is confusing: 5-3 is titled "example of the number of bits that might be stored in an
>> ITE"?  Surely there must be a true architected format for this table, the one real
>> hardware uses.  Surely tcg will simply have to suck it up and break migration to fix this
>> properly.
> 
> No, the ITE format is implementation-defined, like that of the other
> in-guest-memory tables the ITS uses. It's UNPREDICTABLE for a guest
> to try to directly access the tables in memory -- they are only ever
> written or read by the ITS itself in response to incoming commands,
> so it's not a problem for the format in memory to be impdef. This
> flexibility in the spec allows implementations to minimize the size
> of their data tables based on how large an ID size they support and
> other potentially-configurable parameters. For instance if you look
> at the values for the GITS_BASER* for the GIC-700 in its TRM you
> can see that its Collection Table entry size is only 2 bytes, since
> it uses the "rdbase is a CPU number" format; an ITS that used the
> "rdbase is a physical address" implementation choice would need
> more bytes there. (QEMU also uses "rdbase is a CPU number", but
> we have rather profligately opted to use 8 bytes per collection
> table entry.)

Ah, right.  In which case,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
