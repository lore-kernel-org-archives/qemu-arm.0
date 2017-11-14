Received: by 10.223.150.237 with SMTP id u100csp3452792wrb;
        Tue, 14 Nov 2017 02:46:39 -0800 (PST)
X-Received: by 10.80.169.21 with SMTP id l21mr16399706edc.126.1510656399206;
        Tue, 14 Nov 2017 02:46:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510656399; cv=none;
        d=google.com; s=arc-20160816;
        b=QD5gbyD/TKRa57sKDBS0bufH5AQURBaa+pY2P5dX5HYyf5AxWSdEMUSe9b4AOA7xhh
         WqNo2+vjbFWuiolScqgX6kSN7s75xjyQP4nEz0cAtiMjEv7yKAy4UK74/QVx077oirv8
         xYElVN1w2xCTP21LNfQkyAhmAuUW3EwJeuFSFSh9AeF0OTDlarRnMcJfmHB92ABaN9+e
         4oWPB4n4p76KLSI2iW/weSexAHJ7gbtfopOG0SAwXHTZ3tdPGU30Gqk6M5BfZ40Vz4us
         sr3gc2BmU5uAqGkkzt0qk+YXng35lHo2cBOcgRaPdss79vf5VqDgGZRPxWVj1npr2UXM
         6vTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=IZVVcL8V0qqeAdOqRXugw7kYOZRdImCIpDp4BdRaPDo=;
        b=AgxwfaMRpKQuBz1K2dhe2QBb07m1vQS5G863i6vzTpY2W7pcFpCWE3gdaBIdzad5uL
         D0yTz6EUjlGoe3bD8V2FbVUjFP9lCruPdWN1mKfWGRGOnXXfN8l7qqiVdHcTwaSKCBCB
         JoFUkDGnyP2SHAW2UdCnDC3FiHt524FItX87VrIc2bsYO30bTOy49a3AeM9RJjcnw+NT
         GlyYMlPMc5gRp06KeoERvgmmP5oTCZ0p/x2DxXs6M1zyelrCRXJ+XE8X84Nx5w8qnny7
         tYeZjeWIzDb+RO9u4DmXc43lHKZrdmCJERONIjY9VwDFIVKKOypeYYRo+gVEhUfd28H+
         7PmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fT53+SvB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r4sor10441064edd.1.2017.11.14.02.46.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2017 02:46:39 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fT53+SvB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IZVVcL8V0qqeAdOqRXugw7kYOZRdImCIpDp4BdRaPDo=;
        b=fT53+SvBLGuYL7zG9I0EH4IAtZsMKs5m8W7Uzp46HKQCPnjsLFE3viUFfkUhnv8ZvU
         EgutiRvZiQ3PaqivMlWi2mcyfIfk63n9xjzM1j1+Oi+3IZGt+fYNkfLmavE+Jj5pCKQf
         rqdwT8RiH15XhVgXsLsxX3+0lICnh9waz5jHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IZVVcL8V0qqeAdOqRXugw7kYOZRdImCIpDp4BdRaPDo=;
        b=tawx3rIH6Fc8bsIHLA1xEkXhoITIWe586oUdOhu09ovNElS+DsSaN7HtqgZBwlqAhT
         qOUpPe1/nMU1Js1FDXIX7U76rxieYFt6Y8bldzYpDdlqhExYUJbJfJ3I66IJUzOLGgt5
         gdGTkwEP+RZzWfldq+iGgL9bkSiKBqW54UQpfhuG3viERm6j7np6aMD76lfEH/Pf2k1t
         G5qZxWuBdyhHx/RaEWI5js+DipWTxOlD42f+Q0vPvK22mZnwDDLZGBx3itnxqu5Ga8Xu
         sTXNoMkJAvjMDLaFO5ZkQmTolQ2p0BXndfHccOyXlqdeNmIIDI1Erk2K3elT7L21fOvt
         U2zQ==
X-Gm-Message-State: AJaThX5EuomPuFsWXa2SeFJT0Lm6/x9aumUXRWGXZ89NY5wLq8sV3+pG
	Ddyk/rQJz9B8tc078zVGKGvNcDvAXzc7cQ==
X-Google-Smtp-Source: AGs4zMYXeFKQRrGmf9wa5Y1Wgow1L0mysldubAF59UOaA6XfYz6Tr6EVqEq6wBQsby4qf8Mzt+4MMA==
X-Received: by 10.80.170.133 with SMTP id q5mr16538074edc.134.1510656398788;
        Tue, 14 Nov 2017 02:46:38 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (176.red-213-99-135.dynamicip.rima-tde.net. [213.99.135.176])
        by smtp.gmail.com with ESMTPSA id d30sm15846373ede.10.2017.11.14.02.46.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Nov 2017 02:46:38 -0800 (PST)
Subject: Re: [Qemu-arm] [PATCH v1 06/12] target/arm: Decode aa32 armv8.1 three
 same
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20171004184325.24157-1-richard.henderson@linaro.org>
 <20171004184325.24157-7-richard.henderson@linaro.org>
 <87shdi9l05.fsf@linaro.org> <e8bb9454-bdbb-34ce-edb6-df31002fbb9a@linaro.org>
 <87lgj99ntr.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <033d7785-ce08-340c-cc93-dc64da4d830a@linaro.org>
Date: Tue, 14 Nov 2017 11:46:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <87lgj99ntr.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: vBheeImHE/AL

On 11/14/2017 11:06 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 11/13/2017 05:55 PM, Alex Bennée wrote:
>>>> +        case NEON_3R_VFM_VQRDMLSH:
>>>> +            if (!u) {
>>>> +                /* VFM, VFMS */
>>>> +                if ((5 & (1 << size)) == 0) {
>>>> +                    return 1;
>>>> +                }
>>>> +                break;
>>>> +            }
>>>> +            /* VQRDMLSH */
>>>> +            switch (size) {
>>>> +            case 1:
>>>> +                fn_gvec_ptr = gen_helper_gvec_qrdmlsh_s16;
>>>> +                break;
>>>> +            case 2:
>>>> +                fn_gvec_ptr = gen_helper_gvec_qrdmlsh_s32;
>>>> +                break;
>>>> +            default:
>>>> +                return 1;
>>>> +            }
>>>> +            goto do_vqrdmlx;
>>> Could we not take the opportunity to re-factor out the common bit rather
>>> than make this mega
>>
>> What, specifically, did you have in mind?
> 
> Something like:
> 
> translate: use helper to avoid goto shenanigans

Thanks, this certainly looks better.


r~

> 
> 1 file changed, 18 insertions(+), 17 deletions(-)
> target/arm/translate.c | 35 ++++++++++++++++++-----------------
> 
> modified   target/arm/translate.c
> @@ -5576,6 +5576,20 @@ static const uint8_t neon_2rm_sizes[] = {
>      [NEON_2RM_VCVT_UF] = 0x4,
>  };
> 
> +/* expand v8.1 simd helper */
> +static int do_qrdml(DisasContext *s, gen_helper_gvec_3_ptr *fn, int q, int rd, int rn, int rm)
> +{
> +    if (arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
> +        int opr_sz = (1 + q) * 8;
> +        tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
> +                           vfp_reg_offset(1, rn),
> +                           vfp_reg_offset(1, rm), cpu_env,
> +                           opr_sz, opr_sz, 0, fn);
> +        return 0;
> +    }
> +    return 1;
> +}
> +
>  /* Translate a NEON data processing instruction.  Return nonzero if the
>     instruction is invalid.
>     We process data in a mixture of 32-bit and 64-bit chunks.
> @@ -5583,7 +5597,6 @@ static const uint8_t neon_2rm_sizes[] = {
> 
>  static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>  {
> -    void (*fn_gvec_ptr)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
>      int op;
>      int q;
>      int rd, rn, rm;
> @@ -5678,24 +5691,13 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>              /* VQRDMLAH */
>              switch (size) {
>              case 1:
> -                fn_gvec_ptr = gen_helper_gvec_qrdmlah_s16;
> -                break;
> +                return do_qrdml(s, gen_helper_gvec_qrdmlah_s16, q, rd, rn, rm);
>              case 2:
> -                fn_gvec_ptr = gen_helper_gvec_qrdmlah_s32;
> +                return do_qrdml(s, gen_helper_gvec_qrdmlah_s32, q, rd, rn, rm);
>                  break;
>              default:
>                  return 1;
>              }
> -        do_vqrdmlx:
> -            if (arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
> -                int opr_sz = (1 + q) * 8;
> -                tcg_gen_gvec_3_ptr(vfp_reg_offset(1, rd),
> -                                   vfp_reg_offset(1, rn),
> -                                   vfp_reg_offset(1, rm), cpu_env,
> -                                   opr_sz, opr_sz, 0, fn_gvec_ptr);
> -                return 0;
> -            }
> -            return 1;
> 
>          case NEON_3R_VFM_VQRDMLSH:
>              if (!u) {
> @@ -5708,15 +5710,14 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>              /* VQRDMLSH */
>              switch (size) {
>              case 1:
> -                fn_gvec_ptr = gen_helper_gvec_qrdmlsh_s16;
> +                return do_qrdml(s, gen_helper_gvec_qrdmlsh_s16, q, rd, rn, rm);
>                  break;
>              case 2:
> -                fn_gvec_ptr = gen_helper_gvec_qrdmlsh_s32;
> +                return do_qrdml(s, gen_helper_gvec_qrdmlsh_s32, q, rd, rn, rm);
>                  break;
>              default:
>                  return 1;
>              }
> -            goto do_vqrdmlx;
>          }
>          if (size == 3 && op != NEON_3R_LOGIC) {
>              /* 64-bit element instructions. */
> 
> 
> --
> Alex Bennée
> 
