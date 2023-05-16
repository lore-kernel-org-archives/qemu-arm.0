Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp436352ejq;
        Tue, 16 May 2023 07:04:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5abJJr4EPlkI7pqXNXRUvyGXgaznsK5Y4Ieiq6gSe2WeWXCGXv+NaZ9S4lxZer6o1V2weC
X-Received: by 2002:a05:6214:1c85:b0:616:6f8f:d99f with SMTP id ib5-20020a0562141c8500b006166f8fd99fmr60786542qvb.4.1684245899379;
        Tue, 16 May 2023 07:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684245899; cv=none;
        d=google.com; s=arc-20160816;
        b=nXF496NSeRuFuXXT/fVCbuLDKypjPm0uvwWn7LsPm/t4zP2MG31CrbWAtEyk0ln6l8
         Bl5pkQvFMo39w3o1eTh9TNy43xEsQeDUm15Z3DTb+aZX8usHRYnkcFuK0ZuaZaYgZhw3
         HXRZOfGqHHp7NYLnvAvtNZimWVxDfQln0tIJmPOuH55NEXOHG1ji1/TK9JFR/z7zVykb
         cup/GSV5B/OOPuPJCuANBxLDYcH+LkPkKsbvsZijET9/aF6NHsp50FBw3BBFGBdjBMgx
         i6cyq1RGt9sYGLKiFHYeXb90+CcdmsCAramD0DWKIDJg96M89SuBJnc7Y16E65dstnM5
         ahDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=h9rfEFJLku7TA/bVkyJ7MjJoo8u4gwNzndxMH7j+j9k=;
        b=yL0XZ88sU5XIhYYoRXEgJld5YkkqZ977DZ7OaobQ+6HscbBJQRxVvoH+3PJlXz9Dm0
         aiQhG8xLJRsDtYPqhl+dRpfcua9Mq91R25xCjEmI1M0SQEGEjIOkqBNvFiKxgpy0yPss
         H6CEdro+vo7XKFi9Po8ba9CDyQ0g0prtLw6e6KOisuCpYIoA9Lmca6636hxnmcNwOgBL
         OLBlVpNYoRWlpFZIGH4DpyI4feSnBZo5BsTl6PreXL/2Reksx10OOLEsql9ASiwCxNeS
         QNs0C2qVPnkHKE9GLae8oSPSOOnysRXZ5cI+77xG1IsYB0blmivLE23PnKv9DcUDWZel
         4Csw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kpZe281G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2-20020a05620a130200b00759554bbe3csi1192119qkj.234.2023.05.16.07.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 07:04:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kpZe281G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyvIK-00039l-8x; Tue, 16 May 2023 10:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyvIG-00034V-4a
 for qemu-arm@nongnu.org; Tue, 16 May 2023 10:04:48 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyvIE-0006zo-AC
 for qemu-arm@nongnu.org; Tue, 16 May 2023 10:04:47 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6434e263962so10415936b3a.2
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 07:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684245882; x=1686837882;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h9rfEFJLku7TA/bVkyJ7MjJoo8u4gwNzndxMH7j+j9k=;
 b=kpZe281GNbQAQM3WVZUGXCGXdXR04OOf3gV51aqA78kSiLzwW0F26DnzEobwwfiUm6
 3d1EQ/cPFv/wZobrCTWK5B4FRFFdbcPSTjkC40wMYxEyarKFLJAms362YzNxiU9bSCcB
 iSIYH5sfOuJuqHYJfxsqbtADk67kOA2x6tYrDhLlLVlxC7oqTibrkOagZXbhSUjl7fHo
 QLYNuVbLnnBrK2UytSclwcAcUtt+RJTNtzPdbh/rRss5caKonGs8tSzmaPzYIRtNee2K
 29b0Zot5wpUW79LbQlO158kT38euxeGFhM0zLBScheG2L1qsXl2KIR66pOb6RC9wVZU4
 0PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684245882; x=1686837882;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h9rfEFJLku7TA/bVkyJ7MjJoo8u4gwNzndxMH7j+j9k=;
 b=Qgvj6Ark1a5boDc2nPo4fkXeX6KUxm/q4ZfF1PPCIql3ySvxVVUepTtsiMw22BxNE8
 /wK6u4f13oktK8gODEXwm++Y7YZJ+Np/flOKXMFTLyTbaQ6IN1csqMvgYe75oeVVsTUk
 Axz8yRJRbmoD0TXWtleYaPBhuk4dmyEVr6Sn/i4mmQfU4KCiazTNU/q7nVXvz9hIKC3Z
 hAXhDNcb7nZq48EPBZmegvemQBT4ZTKGfHook6eZ4eODqIwJCB2zm6TNTQv+f8ZbgMmV
 zJVC/0Q6W/V4ZUnadgzdDgOMD3GkI/J8soWdeyZNsBx+ipNKRTygaG8LYV3iJsWPgXvQ
 w5bg==
X-Gm-Message-State: AC+VfDyXtpUBz7F0nDxWYhz011tGQr3cIUSQKZkjmlQNnkiOZHtDPGdO
 uUTvXrd7HDn2F7CnHW2aKz43xg==
X-Received: by 2002:a05:6a00:2401:b0:63d:2c2f:e3a2 with SMTP id
 z1-20020a056a00240100b0063d2c2fe3a2mr48662439pfh.18.1684245881889; 
 Tue, 16 May 2023 07:04:41 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:ec81:440e:33a4:40b9?
 ([2602:ae:1598:4c01:ec81:440e:33a4:40b9])
 by smtp.gmail.com with ESMTPSA id
 k18-20020aa792d2000000b0064cca73d911sm638173pfa.103.2023.05.16.07.04.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 07:04:41 -0700 (PDT)
Message-ID: <20ae05e8-19b3-232e-0c26-935e668932d2@linaro.org>
Date: Tue, 16 May 2023 07:04:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 11/54] accel/tcg: Add aarch64 specific support in
 ldst_atomicity
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-12-richard.henderson@linaro.org>
 <CAFEAcA-En1=iy_M7o0Ky+5ZwOJ4TWxoNz7Yq27ftYgnbV9j8OA@mail.gmail.com>
 <0e0a1d89-8d7f-5ad7-f920-b361a19c8ef9@linaro.org>
 <CAFEAcA-endaUPopDahNVGbe91=OfK0HPzKtsLBgpuScKAPc_og@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-endaUPopDahNVGbe91=OfK0HPzKtsLBgpuScKAPc_og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.666,
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
X-TUID: b51yNG8dJRK8

On 5/16/23 06:56, Peter Maydell wrote:
> On Tue, 16 May 2023 at 14:51, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 5/16/23 06:29, Peter Maydell wrote:
>>> On Mon, 15 May 2023 at 15:38, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>>
>>>> We have code in atomic128.h noting that through GCC 8, there
>>>> was no support for atomic operations on __uint128.  This has
>>>> been fixed in GCC 10.  But we can still improve over any
>>>> basic compare-and-swap loop using the ldxp/stxp instructions.
>>>>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>>    accel/tcg/ldst_atomicity.c.inc | 60 ++++++++++++++++++++++++++++++++--
>>>>    1 file changed, 57 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
>>>> index 69c1c61997..c3b2b35823 100644
>>>> --- a/accel/tcg/ldst_atomicity.c.inc
>>>> +++ b/accel/tcg/ldst_atomicity.c.inc
>>>> @@ -263,7 +263,22 @@ static Int128 load_atomic16_or_exit(CPUArchState *env, uintptr_t ra, void *pv)
>>>>         * In system mode all guest pages are writable, and for user-only
>>>>         * we have just checked writability.  Try cmpxchg.
>>>>         */
>>>> -#if defined(CONFIG_CMPXCHG128)
>>>> +#if defined(__aarch64__)
>>>> +    /* We can do better than cmpxchg for AArch64.  */
>>>> +    {
>>>> +        uint64_t l, h;
>>>> +        uint32_t fail;
>>>> +
>>>> +        /* The load must be paired with the store to guarantee not tearing. */
>>>> +        asm("0: ldxp %0, %1, %3\n\t"
>>>> +            "stxp %w2, %0, %1, %3\n\t"
>>>> +            "cbnz %w2, 0b"
>>>> +            : "=&r"(l), "=&r"(h), "=&r"(fail) : "Q"(*p));
>>>> +
>>>> +        qemu_build_assert(!HOST_BIG_ENDIAN);
>>>> +        return int128_make128(l, h);
>>>> +    }
>>>
>>> The compiler (well, clang 11, anyway) seems able to generate equivalent
>>> code to this inline asm:
>>
>> See above, where GCC 8 can do nothing, and that is still a supported compiler.
> 
> Yeah, but it'll work fine even without the explicit inline
> asm, right? 

No, GCC < 10 does not support __sync_* or __atomic_* on __uint128_t at all.

> Is the performance difference critical enough to justify
> an inline asm implementation that's only needed for older
> compilers ?

Yes.  It's the difference between stop-the-world and not.


r~

