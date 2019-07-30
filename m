Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3738622wrv;
        Mon, 29 Jul 2019 17:51:28 -0700 (PDT)
X-Received: by 2002:a63:e610:: with SMTP id g16mr103955807pgh.392.1564447888611;
        Mon, 29 Jul 2019 17:51:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564447888; cv=none;
        d=google.com; s=arc-20160816;
        b=stgL5DCQkaqeoT6eG5hXQkSqUziOvQ+7IAqs3Gtt7DHDHrv+DGzqjnOaShsRYd305X
         qG1X4dqkHcTOXlm1ty8/cOVy+r3rtGwhFB558wXQyFpkXrEzd9a0X5succ/NBUN3spL0
         xBBODpb+o5z4JZTFfQ3hFR6tKkUXFAI02ILdh9Yx3hMZCcrGF9y272J45mejz01E9FF5
         gSXCwTOqnxIn5bJ1m5EAWQ5oLokNz8iu5IDbzIY4xgLKfptX+rYyrb6i0TnjPaQfmDHV
         xJmk78LlNlcwQoYkt638ATOyGRdVXA0CaEqwpLA0jcJdBou2t1bHbhhWbTBQ1I7mlzGe
         CCdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=LF7L82GhpFbVdHeg16Q5O7ojfqytaYQnqcY5Dv+kQXE=;
        b=HaxiqJGSivAw29Bsov18ulhGI0Q1Db1L+TPv+9yC0f6YiLnKn1HN3S8eNfzM+ZUkhE
         cgpRRTF24bQTypKQdkswK4CGaULY5ad7jdSHygHKQPkl0+MgMGDztpRfT3W18CEjVJQZ
         UJM6+Z57gVIuA5fxOQeXP7hKHWneZJa3bpKwTgsgFMGX9KSgkPqaNrGcKwGmfk01Pew0
         UYsjO+xZgViin6bRn16tV98Ab8PdDmQe9zL70ajUPGuOVOnCJXbdkILeMSmuDvPheNfG
         k1fsTUb/cPxn3+CQXEk+HYxCI1yTrnJ6oAE2RZlkGK//NT4SoOFF/hyCQZTGphWrTCom
         qJbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NtXXzMJ7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r27sor44534333pfq.73.2019.07.29.17.51.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 17:51:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NtXXzMJ7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LF7L82GhpFbVdHeg16Q5O7ojfqytaYQnqcY5Dv+kQXE=;
        b=NtXXzMJ7KGT3WpJqKxX+cIhueHC2Ibnsyt2qtYuc2Z1DU7yxoYbD7FcgcAgBuWNhDi
         YtmLbSb9z5QP9E8ytviq1US9YNaa+VG1O3bHv879uEAW4Y+KSkltrWsaKeDrdfj3JWeU
         uncm0JC6EywytvBvuoy7LtWyf4W+8XEYWIje3sZRzZZ64sR3Siv9GqsKU+DOEDpr92N6
         OdoGR7j+MjnNDN8WMSrXL/P3nRATUaP5rNbuK0BMGXLIcsYDHevb6iyW2ukzLrA1JrZW
         tqCa4k7jk0GJYINLrQ5M+6Prbckgec+P8V/4/2jXdcDPJBQIlvzFApLeKmjsgV0cdjn0
         fiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LF7L82GhpFbVdHeg16Q5O7ojfqytaYQnqcY5Dv+kQXE=;
        b=lUeHcwvaN3z/gjoo+xZIpxe/OU2pIk9ecj2vK1M62lgyy0KJiv/IbPmT8R1MbvONl1
         YhsVA1SbcncaHIif8xn5aVyaEb3VDawHIQ+E1ht0YOyP1zflqe6KdKOOCsAW740JDmAv
         4h7i8+Fm6iOInPDnreHlBCGWuaxjyvZLczufqhfO5weEVoDEGlZwsqJxhYEgbgrtY97j
         wZuw5/30cBTfeUrru1ypGH6pz3/6AVFGByOFDeoMCf9KL+gN9Na/CwsTdAGcI7sRJZEG
         NFV6XVujVWQ3lp4wcbVEWGWG0DhpF+QCHU73Jqrt/Fw6CeNdRhlrAKDAcpoPFMHGfgXQ
         cvQA==
X-Gm-Message-State: APjAAAXOfsWunFdKWJJP+t3gijzMA5ER+LU4Q8jf4pD1lQZnzS8XtFHK
	Aj0nwS7f6GCXP2YFlaq5KOwz+jZub9YB0w==
X-Google-Smtp-Source: APXvYqwVUWMV/I2EwAyVhIPt4QCisbkYAWEZCrNNPH1c4HBBAvF1u5ilKo4jqCfcFZBw21dWJljlqA==
X-Received: by 2002:a62:35c6:: with SMTP id c189mr39285539pfa.96.1564447887584;
        Mon, 29 Jul 2019 17:51:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.101.105] ([75.147.178.105])
        by smtp.gmail.com with ESMTPSA id g2sm103342035pfq.88.2019.07.29.17.51.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 17:51:26 -0700 (PDT)
Subject: Re: [PATCH 07/67] target/arm: Introduce add_reg_for_lit
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-8-richard.henderson@linaro.org>
 <CAFEAcA_HY=WuGEPxTEm5g5tYuCDHXRDs=9EXQd6r+zvsL6_=Uw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <af4f9f07-ac63-dfeb-9f2d-734ffff3fe7d@linaro.org>
Date: Mon, 29 Jul 2019 17:51:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_HY=WuGEPxTEm5g5tYuCDHXRDs=9EXQd6r+zvsL6_=Uw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: HWmw/Gbv9akL

On 7/29/19 7:15 AM, Peter Maydell wrote:
> On Fri, 26 Jul 2019 at 18:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Used only on the thumb side so far, but will be more obvious
>> once we start unifying the implementation of A32+T32.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/translate-vfp.inc.c |  34 +------
>>  target/arm/translate.c         | 163 +++++++++++++++------------------
>>  2 files changed, 76 insertions(+), 121 deletions(-)
>>
>> diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
>> index e7389bc057..4066b2febf 100644
>> --- a/target/arm/translate-vfp.inc.c
>> +++ b/target/arm/translate-vfp.inc.c
>> @@ -941,14 +941,7 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
>>          offset = -offset;
>>      }
>>
>> -    if (s->thumb && a->rn == 15) {
>> -        /* This is actually UNPREDICTABLE */
>> -        addr = tcg_temp_new_i32();
>> -        tcg_gen_movi_i32(addr, s->pc & ~2);
>> -    } else {
>> -        addr = load_reg(s, a->rn);
>> -    }
>> -    tcg_gen_addi_i32(addr, addr, offset);
>> +    addr = add_reg_for_lit(s, a->rn, offset);
>>      tmp = tcg_temp_new_i32();
>>      if (a->l) {
>>          gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
>> @@ -983,14 +976,7 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
>>          offset = -offset;
>>      }
>>
>> -    if (s->thumb && a->rn == 15) {
>> -        /* This is actually UNPREDICTABLE */
>> -        addr = tcg_temp_new_i32();
>> -        tcg_gen_movi_i32(addr, s->pc & ~2);
>> -    } else {
>> -        addr = load_reg(s, a->rn);
>> -    }
>> -    tcg_gen_addi_i32(addr, addr, offset);
>> +    addr = add_reg_for_lit(s, a->rn, offset);
>>      tmp = tcg_temp_new_i64();
>>      if (a->l) {
>>          gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
>> @@ -1029,13 +1015,7 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
>>          return true;
>>      }
>>
>> -    if (s->thumb && a->rn == 15) {
>> -        /* This is actually UNPREDICTABLE */
>> -        addr = tcg_temp_new_i32();
>> -        tcg_gen_movi_i32(addr, s->pc & ~2);
>> -    } else {
>> -        addr = load_reg(s, a->rn);
>> -    }
>> +    addr = add_reg_for_lit(s, a->rn, 0);
>>      if (a->p) {
>>          /* pre-decrement */
>>          tcg_gen_addi_i32(addr, addr, -(a->imm << 2));
>> @@ -1112,13 +1092,7 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
>>          return true;
>>      }
>>
>> -    if (s->thumb && a->rn == 15) {
>> -        /* This is actually UNPREDICTABLE */
>> -        addr = tcg_temp_new_i32();
>> -        tcg_gen_movi_i32(addr, s->pc & ~2);
>> -    } else {
>> -        addr = load_reg(s, a->rn);
>> -    }
>> +    addr = add_reg_for_lit(s, a->rn, 0);
>>      if (a->p) {
>>          /* pre-decrement */
>>          tcg_gen_addi_i32(addr, addr, -(a->imm << 2));
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index a48e9a90f8..5e2dd8bb16 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -214,6 +214,23 @@ static inline TCGv_i32 load_reg(DisasContext *s, int reg)
>>      return tmp;
>>  }
>>
>> +/*
>> + * Create a new temp, incremented by OFS, except PC is aligned but not
>> + * incremented for thumb.  This is used for load/store for which use of
>> + * PC implies (literal), or ADD that implies ADR.
>> + */
>> +static TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs)
>> +{
>> +    TCGv_i32 tmp = tcg_temp_new_i32();
>> +
>> +    if (reg == 15) {
>> +        tcg_gen_movi_i32(tmp, (s->pc_read & ~3) + ofs);
>> +    } else {
>> +        tcg_gen_addi_i32(tmp, cpu_R[reg], ofs);
>> +    }
>> +    return tmp;
>> +}
> 
> This is losing the information in the comments about the UNPREDICTABLE
> cases. Are there callsites where the new function is called where
> "thumb and reg == 15" is not UNPREDICTABLE, or are they all
> that way?

These call sites are that way, but this function will eventually be used for
LDR (literal) and ADR, which obviously are not UNPREDICTABLE.

I don't think this comment attached to this code is useful as-is.  Either we do
the natural a32-ish behaviour and use ALIGN(PC,4), or we should
gen_illegal_op() and be done with it.

Would you prefer a function like

/* Use of PC is UNPREDICTABLE in thumb mode, but allowed in arm mode. */
static TCGv_i32 load_reg_nothumbpc(DisasContext *s, int reg)
{
    if (unlikely(reg == 15) && s->thumb) {
        gen_illegal_op(s);
        /* Unreachable tcg ops will be deleted but must still be legal. */
        return tcg_const_i32(0);
    }
    return load_reg(s, reg);
}

for these specific usages?


r~
