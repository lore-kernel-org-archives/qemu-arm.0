Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp658688ejq;
        Fri, 5 May 2023 13:19:19 -0700 (PDT)
X-Received: by 2002:adf:fac1:0:b0:2d8:47c7:7b52 with SMTP id a1-20020adffac1000000b002d847c77b52mr2153404wrs.9.1683317959231;
        Fri, 05 May 2023 13:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683317959; cv=none;
        d=google.com; s=arc-20160816;
        b=rpF7MR+Xu92iWT/5yxxR9XJSB7iN0gF0Y68XXlvCXNDhMMDJRmdZ3v98qMXWvH0f+g
         O2hMtYY2zCh8Icw3wHhVltgkYhl0mzyTM6kqZg0wixk/iBFv9VrDucCvCSeeYSvqEaXs
         GWg28umL3z2tNw15grYIqZWHhrSd7FiW36STAHLyLN8USvr737PlaUocEGkka5Eas2qR
         TUvjWWdUuQCXXECckosGmxEfQMoUffJv9WreUZ/kHHdQ+6I/bdRWz2qKXOzghm8q7vbe
         HMOKvkDO4HH4dxf12ij4M6/9Cgnf+CKhjmca3tPuZ1GyCEBrthxwhUH/IHec08aaaF+J
         u9NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oX2MH8rkUaZwViiqoVzaThFDghPJE//PWA0J+d7lxhE=;
        b=ALGTyhuWP9YzfH3Ewtyt0rm0hNHlxsMDUf2oiYfyJxLQNQI9amO/JW/EnUedEqgoe+
         XQwDuNu2uXpcFTpFWCT00fgWLngBsHY5AKkvkioRQ0Q5w9Pqm9xvn6HTxzAGQqlFjFKE
         rPmdCYOiJD/MsO4mOVgreOkoYW51YTSmqKIuVtWhQrm6huxn34NFWTpd1F2fsTCuQWjK
         1GdXdCvre0VqRPRfyw+W0QXWlD5JGrMMeXiAppPRrK145ZoEIARVBY0JZ9FVJa8Xx0ej
         LR3IPW9XvOIaX+XlJ/+2/3r6acd4rI5q8Bn0zZpxUVqNVq4sdg1qCRHEHg+jw/E7wMoS
         tGvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GYYN5xRe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j15-20020adfb30f000000b003062be4eda8sor930974wrd.4.2023.05.05.13.19.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 May 2023 13:19:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GYYN5xRe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683317959; x=1685909959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oX2MH8rkUaZwViiqoVzaThFDghPJE//PWA0J+d7lxhE=;
        b=GYYN5xRemSbBNnQKthpte1wMne6s9/zt9WkEUi1kjJsBaJL53D7+zfaTZZgxZGhmZ6
         snV+A1FgjWZE0Ek+CcEzsQSWNhOQCWLsUbZTQKIhUzMwHxwufrKKVCnXXdc+u/xX90+6
         asNmCCnLcQdJratCZF28pFpXkt7Fqhq10FxvYcSnJ5TbuKEB6lf/ggWaHv5+owPjmBzl
         V7CJNlMn6u/0O8k69Ymw3yCOnT71xbw6YsHUtLZn1ywSYiVvOtHeYrGTMqspulgoDJVN
         6a6NVuVSUvmTcPzsyl4AsRQ8cfV1hheu+Dg45Ldrn1U+U7GTLYOhhUQHhZedYwpZ5j8H
         I2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683317959; x=1685909959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oX2MH8rkUaZwViiqoVzaThFDghPJE//PWA0J+d7lxhE=;
        b=hYj5i2Dfh+FNjzkuyKZXJgNkJaMOBVtjYimt2y7zgIK0H69/sSlpeJ1dykjiFgIJCz
         rJDXigFjESlWWw7nFVfYOXmphodrXmo1DRzBKCqfs1zJNMNK1+K2B7dQX/YNAJyu2SaQ
         F9M6YjhFhCjd2c24mjw5iKGm428AFqoTVGUC6TgZf2RhniIm0rMZ7RikV9LHCObObAOY
         LFgY1MR51RWA4CdnkghEPKGiyfQ2oxb3sRGz6jKJIINQlQx6YVjbEsboSMj8C3DAWUIa
         0VGrspsbQolXDQiYoqL9S4gceMgiTwVAe46VkU8xmtCPTKrBLSAW0nHY+fPUeSwxqV7r
         FwMQ==
X-Gm-Message-State: AC+VfDyG3eRQ8UZGNcNFCvl5mHhOZiUE1Oqf1dL1jKVZIELEBgUVW9ns
	r1KvRzN14ZyvCpo1IZCov4lBu2kl
X-Google-Smtp-Source: ACHHUZ5sjyv64Yi7uzozk2+1swrmigzY7Ucoa+aKGhpFxaHqgrkqORUu64nrjA4TqGvky85dALfhNw==
X-Received: by 2002:adf:e445:0:b0:306:283e:23a with SMTP id t5-20020adfe445000000b00306283e023amr2185121wrm.52.1683317958800;
        Fri, 05 May 2023 13:19:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.20.44] ([212.241.182.8])
        by smtp.gmail.com with ESMTPSA id v1-20020a5d6101000000b003062b57ffd1sm3321919wrt.50.2023.05.05.13.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 13:19:18 -0700 (PDT)
Message-ID: <8988fc6b-8f07-1ab7-663d-3392ca19f7f8@linaro.org>
Date: Fri, 5 May 2023 21:19:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 06/57] accel/tcg: Honor atomicity of loads
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-7-richard.henderson@linaro.org>
 <CAFEAcA8muJ84GMqSBuU0P2YhfERM-kftfq07N8BVO2yG9p6jBw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8muJ84GMqSBuU0P2YhfERM-kftfq07N8BVO2yG9p6jBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: JwtKBdOTIhT1

On 5/4/23 18:17, Peter Maydell wrote:
>> +    case MO_ATOM_SUBALIGN:
>> +        tmp = p & -p;
>> +        if (tmp != 0 && tmp < atmax) {
>> +            atmax = tmp;
>> +        }
>> +        break;
> 
> I don't understand the bit manipulation going on here.
> AIUI what we're trying to do is say "if e.g. p is only
> 2-aligned then we only get 2-alignment". But, suppose
> p == 0x1002. Then (p & -p) is 0x2. But that's MO_32,
> not MO_16. Am I missing something ?

You're right, this is missing a ctz32().

> 
> (Also, it would be nice to have a comment mentioning
> what (p & -p) does, so readers don't have to try to
> search for a not very-searchable expression to find out.)
> 
>> +    case MO_ATOM_WITHIN16:
>> +        tmp = p & 15;
>> +        if (tmp + (1 << size) <= 16) {
>> +            atmax = size;
> 
> OK, so this is "whole operation is within 16 bytes,
> whole operation must be atomic"...
> 
>> +        } else if (atmax == size) {
>> +            return MO_8;
> 
> ...but I don't understand the interaction of WITHIN16
> and also specifying an ATMAX value that's not ATMAX_SIZE.

I'm trying to describe e.g. LDP, which if not within16 has two 8-byte elements, one or 
both of which must be atomic.  We will have set MO_ATOM_WITHIN16 | MO_ATMAX_8.

If atmax == size, there is only one element, and since it is not within16, there is no 
atomicity.

>> +        } else if (tmp + (1 << atmax) != 16) {
> 
> Why is this doing an exact inequality check?
> What if you're asking for a load of 8 bytes at
> MO_ATMAX_2 from a pointer that's at an offset of
> 10 bytes from a 16-byte boundary? Then tmp is 10,
> tmp + (1 << atmax) is 12, but we could still do the
> loads at atomicity 2. This doesn't seem to me to be
> any different from the case it does catch where
> the first ATMAX_2-sized unit happens to be the only
> thing in this 16-byte block.

If the LDP is aligned mod 8, but not aligned mod 16, then both 8-byte operations must be 
(separately) atomic, and we return MO_64.

>> +            /*
>> +             * Paired load/store, where the pairs aren't aligned.
>> +             * One of the two must still be handled atomically.
>> +             */
>> +            atmax = -atmax;

... whereas returning -MO_64 tells the caller that we must handle an unaligned atomic 
operations.

>> +    /*
>> +     * If the page is not writable, then assume the value is immutable
>> +     * and requires no locking.  This ignores the case of MAP_SHARED with
>> +     * another process, because the fallback start_exclusive solution
>> +     * provides no protection across processes.
>> +     */
>> +    if (!page_check_range(h2g(pv), 8, PAGE_WRITE)) {
>> +        uint64_t *p = __builtin_assume_aligned(pv, 8);
>> +        return *p;
>> +    }
> 
> This will also do a non-atomic read for the case where
> the guest has mapped the same memory twice at different
> addresses, once read-only and once writeable, I think.
> In theory in that situation we could use start_exclusive.
> But maybe that's a weird corner case we can ignore?

We don't handle multiple mappings at all well.  There is an outstanding bug report about 
read+write vs read+execute mappings for a jit -- our write-protect scheme for flushing TBs 
does not work for that case.

Since we can't detect the multiple mappings at this point, I'm tempted to ignore it.
But you're correct that we could drop this check and let start_exclusive handle it.



r~
