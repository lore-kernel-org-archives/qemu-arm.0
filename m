Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2328790ejb;
        Tue, 30 May 2023 10:21:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:2450:b0:63f:2f00:c6d with SMTP id d16-20020a056a00245000b0063f2f000c6dmr2920382pfj.2.1685467310387;
        Tue, 30 May 2023 10:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685467310; cv=none;
        d=google.com; s=arc-20160816;
        b=csVRUewmJIkh1A3iLwk25p31Sj1Z2/oMajtUoyxmNWb8Mu/qpHhQHRxAytoOhe6yVT
         vTAEjfOa7BJp3CwsNipVzHneWafGtpIl/dgIl8grLr9eoPWOOFp3rtz3GY5pqxAw09PF
         ztjjk9+zvcsU2Z+2yPkmUayMKLM62+M16odL3S3iP1IEncR8j0r2uTDW3IZmktSv+wSj
         XLHD/SwEgXnp9iX2d2OVRU1xR6j2Mk+HWdiqpCajShmrbAk6dP3O1eqESyHtelGk/6pp
         ZnJ3Bwortaakh2bx1BP+d4G+J6XdtH4LzLKd5zWoEJgfeekoNcvVBj+Cu5v+N/J6T/Ei
         c56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=50B0/Lj2G2z68eOzMBX+iLv4/VTkFzw+BlWgQOL3hnw=;
        b=zM5dDEM66EyCu+/emuCcveqmpRJr86oGFAv8r1s6pQ5gL5hy78TTuBz1y7ElhH1XfA
         5Mg1hg+Mfvxau89CYILz8ZiWihzAV+J8hIV6sJyDBiTcyLAZW+KCJ5mAOt6eoJj92yAG
         4eLCMQh+HyATQ/Br6HrfGNBkjQeG7dK9A00NwIVhG2V8LmTrv3/9FUOYHnpAikywC2/d
         Of6S2gUHtYnwZLzuoRDXjuMV8T8FcRlgUDYpBbGf4QZIThCTS27M1hVP3XuFuu2tWHRu
         GQ+yRmZt647H/BMtS9jnVB5p1gnFlwsNcvyVDLsRX1E1ZyOemetBSqs+uPzvRw2NRgR8
         IS3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bns5VUQP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m3-20020a625803000000b006410a665f8esor1956681pfb.10.2023.05.30.10.21.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 May 2023 10:21:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bns5VUQP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685467310; x=1688059310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=50B0/Lj2G2z68eOzMBX+iLv4/VTkFzw+BlWgQOL3hnw=;
        b=bns5VUQPdQJnhAQvEB6VCo+9rpT2JrTwC6z0CjXDA0yORvYa9oglK8b8W4YOIDZNVb
         EsLZueLeT0te7olH1FInTk2IW9euC9HSTqvPRs2W1quq+71hGcD+cszyL6nN3e0ahg74
         quZMcq4kkbWmVTwC9ZhJVTYdwQkzie37Mvt/TIZIw8m+GwwF/y0063ZdHQeHgQLBsqM0
         cAJ0AilDr5MmUJXaEUOodPSSnHSuk2+A0/Js9k+B8nkR0inJElY3D1XbzBfq7WBJ5vki
         msQ65D68+5JlkURVTbWWIvtW4d2csDT2ExdLK5KQss5HKIT3p+gZSb2PPE1E9YO5YrBR
         xVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467310; x=1688059310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=50B0/Lj2G2z68eOzMBX+iLv4/VTkFzw+BlWgQOL3hnw=;
        b=AD7ZexjJF7Hf+DJ24g0qG/8IVIf3uZj0pKMTPdjz0RfXPEQjREhIQRQ5cu6uJgdHTG
         +UADQhCJSseNVakYGhArezLuoelgyBM2/b/89QCtUnRFsiPGQcr15fDb95YiR5u6b7ES
         O1/Scxzm+urqMtHZBmR1NrVwIR+y29fyPt6qdcDkPPji3URH2G14L9ftPvQACa2ommY/
         3iD8M4D0Vg7vpCTwhujjP5aqLyumw2aBkQkepMcDtGxYJ0uVVUl3S3q7ikwT3gIEI8SO
         ckk738tnsbZ8WCG0s9cswcVTkA/4Z2SmIelSJrCfQoVdvcX6bROZKQt+J7hRb4vKfOM/
         Fy7Q==
X-Gm-Message-State: AC+VfDyQNhR2oFRPwpN4i3CjipnvF170Xv1ybmpAeCdQHVJ0bnNtaldE
	2/fYFIbTEVnKoeC9SzibxHxdMQQR
X-Google-Smtp-Source: ACHHUZ6jlD0WtVyUADgjVQ7Hwm5EuaNx1ptUws3lqCtJN9oO7cstkYw2tA1lkVL5SaTBLJ1X8kG1JA==
X-Received: by 2002:a17:902:e811:b0:1b0:61dc:db67 with SMTP id u17-20020a170902e81100b001b061dcdb67mr3204680plg.30.1685467309851;
        Tue, 30 May 2023 10:21:49 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1598:4c01:35a2:c45d:7485:f488? ([2602:ae:1598:4c01:35a2:c45d:7485:f488])
        by smtp.gmail.com with ESMTPSA id i12-20020a170902eb4c00b0019a773419a6sm5478538pli.170.2023.05.30.10.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 10:21:49 -0700 (PDT)
Message-ID: <44d4f3e3-2c3e-f3a3-8917-72399a084356@linaro.org>
Date: Tue, 30 May 2023 10:21:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH] target/arm: use x86 intrinsics to implement AES
 instructions
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20230530135204.2903761-1-ardb@kernel.org>
 <666b4b6c-380e-142e-9348-823006b35312@linaro.org>
 <CAMj1kXEE3X=m9X9DkMu885w=Vperp100NWcJ33XOTDm0O+1sWQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAMj1kXEE3X=m9X9DkMu885w=Vperp100NWcJ33XOTDm0O+1sWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: lkxHa83iXsy3

On 5/30/23 09:58, Ard Biesheuvel wrote:
> On Tue, 30 May 2023 at 18:43, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 5/30/23 06:52, Ard Biesheuvel wrote:
>>> +#ifdef __x86_64__
>>> +    if (have_aes()) {
>>> +        __m128i *d = (__m128i *)rd;
>>> +
>>> +        *d = decrypt ? _mm_aesdeclast_si128(rk.vec ^ st.vec, (__m128i){})
>>> +                     : _mm_aesenclast_si128(rk.vec ^ st.vec, (__m128i){});
>>
>> Do I correctly understand that the ARM xor is pre-shift
>>
>>> +        return;
>>> +    }
>>> +#endif
>>> +
>>>        /* xor state vector with round key */
>>>        rk.l[0] ^= st.l[0];
>>>        rk.l[1] ^= st.l[1];
>>
>> (like so)
>>
>> whereas the x86 xor is post-shift
>>
>>> void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
>>> {
>>>      int i;
>>>      Reg st = *v;
>>>      Reg rk = *s;
>>>
>>>      for (i = 0; i < 8 << SHIFT; i++) {
>>>          d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i & 15] + (i & ~15))]);
>>>      }
>>
>> (like so, from target/i386/ops_sse.h)?
>>
> 
> Indeed. Using the primitive operations defined in the AES paper, we
> basically have the following for n rounds of AES (for n in {10, 12,
> 14})
> 
> for (n-1 rounds) {
>    AddRoundKey
>    ShiftRows
>    SubBytes
>    MixColumns
> }
> AddRoundKey
> ShiftRows
> SubBytes
> AddRoundKey
> 
> AddRoundKey is just XOR, but it is incorporated into the instructions
> that combine a couple of these steps.
> 
> So on x86, we have
> 
> aesenc:
>    ShiftRows
>    SubBytes
>    MixColumns
>    AddRoundKey
> 
> aesenclast:
>    ShiftRows
>    SubBytes
>    AddRoundKey
> 
> and on ARM we have
> 
> aese:
>    AddRoundKey
>    ShiftRows
>    SubBytes
> 
> aesmc:
>    MixColumns
> 
> 
>> What might help: could we do the reverse -- emulate the x86 aesdeclast instruction with
>> the aarch64 aesd instruction?
>>
> 
> Help in what sense? To emulate the x86 instructions on a ARM host?

Well that too.  I meant help me understand the two primitives.

> But yes, aesenclast can be implement using aese in a similar way,
> i.e., by passing a {0} vector as the round key into the instruction,
> and performing the XOR explicitly using the real round key afterwards.

Excellent, thanks.


r~
