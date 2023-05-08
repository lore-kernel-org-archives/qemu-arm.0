Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp1936589ejq;
        Mon, 8 May 2023 03:11:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7qGO9Ah46oW3ncSMQHmYpeRRYeF5Udy7aX0h2t2kXzmnxkXTVXDWggakOobG0utnvQ8CEI
X-Received: by 2002:a05:622a:349:b0:3f3:9489:1c33 with SMTP id r9-20020a05622a034900b003f394891c33mr154621qtw.36.1683540705388;
        Mon, 08 May 2023 03:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683540705; cv=none;
        d=google.com; s=arc-20160816;
        b=wCRJduenxIZ7Ekwigig15jxWrClO2SdLCNsYJkg822oUy8xY5R3d68ljdN5OVZ/L36
         Gbu9i48dsTT+kZjYaX88HDPVM2huLJvguWei8tNHBleAytqNqw0pHG5HgvWlNiHO22ZT
         fjMhD6oLcs8HAze8mX7rVjTY0Uk/9DDw5PfELHXvOo2x6H77RnVc2w8s5fut3nMmwul/
         oqsKbiorpJ71GEGF4uGbmvHPAJrpHObHGuAEajlQ5AxUhfhxnb+3zsz4PGD33oSqDNZu
         3M7zNpm23GHatKreHOl3lD6y4xUpuTPpYCDwnNuX2Fk2+SHfzDLMqB4kbfW7+/SJj2lx
         l70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=r7f/fkBATNzqUinvH3w4ndLoZkkktG1Ww8fEUs19hSc=;
        b=b2hq3RXg1m/gOlt8I7DWNmq7+J1ULClUnaUzvQGPhkU+BuEljII7po5/jy0KvqhYHb
         mpFglqa7U+VJE3UHkLxqT0z6a8E+UydrVq+0OKmfI8B4mSeAqzB3hmg0P/3VU77IzDyQ
         wmi+JRdBKfaguXMJhO/C2u32N3xH4vBNjgrhQmInisrJnggCi/JRrlXDSv198yrvOc/H
         P+XIC2fhytUF7AgiDu3+I0UkXOKcUJ9Mwd7kzU31UvIS2PW6ovL5sWLOPKaQKy9s4TT7
         uoXVU30OVgn89rTwwJ+eM7vLwECYM6Mvh/OekS98zJHCStjc/Gq0t8Q7S+ypVoKxD8mY
         q+hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OCCLWRpr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w21-20020ac87e95000000b003f018e18c29si2817707qtj.260.2023.05.08.03.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 03:11:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OCCLWRpr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvxqG-0005QB-IB; Mon, 08 May 2023 06:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvxqE-0005Pu-Gm
 for qemu-arm@nongnu.org; Mon, 08 May 2023 06:11:38 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvxqB-0006VW-As
 for qemu-arm@nongnu.org; Mon, 08 May 2023 06:11:37 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50b37f3e664so7869781a12.1
 for <qemu-arm@nongnu.org>; Mon, 08 May 2023 03:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683540693; x=1686132693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r7f/fkBATNzqUinvH3w4ndLoZkkktG1Ww8fEUs19hSc=;
 b=OCCLWRprweY2bhfsQGo5cnKbVv3FqujmVlyyux2kPyfH6zQJB/aoDo5mBctZXxj/xd
 WYbzOIVVo+FarsAF96uee7lFG+e7bvyz/7aAZbYFPuFrB0Tg4RgBkyuZKESGL0dSrwbU
 DU683Zyn5jtLL35C2ULRSNKe3k6vuZTEjZdDWcC/+PSG6yygwIxBlkxgdE9e0O7zJuVg
 JwkW85PBx+hQvsSzILDBiN4vVzFgwJMsdO/xpB3/DXwDK+e/zPm9CAIidzWCg5KOE1Q7
 6nghOoaFDNHc5wC3Q24fsiXHMbM0XrA0yKRhT3oibqfRwHt4a6sLGi2LzqvdIh2jIzHX
 Ei+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683540693; x=1686132693;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r7f/fkBATNzqUinvH3w4ndLoZkkktG1Ww8fEUs19hSc=;
 b=a1UUkFoqAqFG2G50FE4SW7sUbiCA93FmhnS/5etcOXMan9erMFP3wuotUSrLCtT/H7
 dxL4mu/gzACVFb2tCw2v1o2VcUeJiwrEYTfrKQqhE2izFHBI5FAf4z910I6qK5SxMG2+
 ytJruHICRvUATPyA0Z2Wh5Yt2uEy7Y1hVHrUghd4y3Sqe2NycfL34YHr36vkVPqkT5Sw
 TvgBsCgKBeG+geWxkpKLpacvXxF+/qiyAZJWBdri/Xlx3ox8h+pdOr+CVpqp8NZ5F6Wq
 Ag8eKQZXFxKs+KL/6jHFk08yzxdVZWa8vduCygtM8Lj2zVEo6QGGxB9J+uSYC3nBEATD
 2/Og==
X-Gm-Message-State: AC+VfDyOpl4QbFKK0w3bTqQJYuHTTz2z3s15HW0CKBXzEmKb5vnf5Ull
 Q7ygYKgEEZEqub0Q/kw9d/WVrv4jQz8Cj+z8vMu+WA==
X-Received: by 2002:a17:907:9345:b0:94e:c4b:4d95 with SMTP id
 bv5-20020a170907934500b0094e0c4b4d95mr7629334ejc.69.1683540693491; 
 Mon, 08 May 2023 03:11:33 -0700 (PDT)
Received: from [192.168.110.227] ([91.223.100.33])
 by smtp.gmail.com with ESMTPSA id
 p25-20020a1709065dd900b0094e4eabb402sm4777421ejv.128.2023.05.08.03.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 03:11:33 -0700 (PDT)
Message-ID: <483ae5ee-82e7-d964-7f95-ac45ce4bfb46@linaro.org>
Date: Mon, 8 May 2023 11:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 07/57] accel/tcg: Honor atomicity of stores
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-8-richard.henderson@linaro.org>
 <CAFEAcA8aqJXGcFSTU1dz6bSeJL5n+cmHq3ATt4xZGZsehJk6Tg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8aqJXGcFSTU1dz6bSeJL5n+cmHq3ATt4xZGZsehJk6Tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.964,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: k93Jnhw9hiaJ

On 5/5/23 10:28, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:11, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/cputlb.c             | 103 +++----
>>   accel/tcg/user-exec.c          |  12 +-
>>   accel/tcg/ldst_atomicity.c.inc | 491 +++++++++++++++++++++++++++++++++
>>   3 files changed, 540 insertions(+), 66 deletions(-)
> 
> 
>> +/**
>> + * store_atom_insert_al16:
>> + * @p: host address
>> + * @val: shifted value to store
>> + * @msk: mask for value to store
>> + *
>> + * Atomically store @val to @p masked by @msk.
>> + */
>> +static void store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
>> +{
>> +#if defined(CONFIG_ATOMIC128)
>> +    __uint128_t *pu, old, new;
>> +
>> +    /* With CONFIG_ATOMIC128, we can avoid the memory barriers. */
>> +    pu = __builtin_assume_aligned(ps, 16);
>> +    old = *pu;
>> +    do {
>> +        new = (old & ~msk.u) | val.u;
>> +    } while (!__atomic_compare_exchange_n(pu, &old, new, true,
>> +                                          __ATOMIC_RELAXED, __ATOMIC_RELAXED));
>> +#elif defined(CONFIG_CMPXCHG128)
>> +    __uint128_t *pu, old, new;
>> +
>> +    /*
>> +     * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
>> +     * defer to libatomic, so we must use __sync_val_compare_and_swap_16
>> +     * and accept the sequential consistency that comes with it.
>> +     */
>> +    pu = __builtin_assume_aligned(ps, 16);
>> +    do {
>> +        old = *pu;
>> +        new = (old & ~msk.u) | val.u;
>> +    } while (!__sync_bool_compare_and_swap_16(pu, old, new));
> 
> Comment says "__sync_val..." but code says "__sync_bool...". Which is right?

Fixed the comment to __sync_*_compare_and_swap_16


r~
