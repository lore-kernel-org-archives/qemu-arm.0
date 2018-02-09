Received: by 10.28.71.27 with SMTP id u27csp1246470wma;
        Fri, 9 Feb 2018 10:23:16 -0800 (PST)
X-Received: by 2002:a17:902:2881:: with SMTP id f1-v6mr232790plb.439.1518200596059;
        Fri, 09 Feb 2018 10:23:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518200596; cv=none;
        d=google.com; s=arc-20160816;
        b=PM7ryEbuRouGKu9ykNet13dL5eCh0M0P8Q+vWI9K0goRNCoIsvf9c33kAzE6w59h3m
         8rBieVL+lLMmcam1lzod29LByLG9RjwQ9MOJrJF7L0tGdm0zU6g6dU7FFAriIPigcvuG
         QnMeCJRmQYoHMtNt1zgvT3Q4hTXbgqMCVUDUr5Ad+t/2OTh6G5sxo4uWLWDsqOg1UvgD
         SgEBoBb+svZ+tnDNDqHlgBVgDA9ay+e+p5OgqODkrQGEv0YWGO2PX3C59R1/5Z1sj2/x
         O8iUnKVQpNKwtOZlFVzhB9d3uwNPjX4k7tiWSQQwu8ZIRtS1aGiJ522mda+dTA5um5sM
         5DNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=QV8c0m8BWEVMk4XjMowUrafARDbrFrpogyU96I/Viio=;
        b=EfGJ2YRAIRWqfFAqLUudEXRGb4r7KmpUwOBAPcpoBJhLZ1/erLUT4i61vPphef1yz+
         CXyVgJTjyNwzhmtAvwbtlY5XdgGzNrFwM0p9kOP9DRUJYJOjsS87uIuGfU7R5Lm0ur6N
         MUAMn3nXn+w3Gk9KyQT3BC45Xzt1wp1Q1W4rwWALrH3eLpnPZJENOfGvCqq5+XsWrSzl
         iOOBXZIS+DfbSFIBsH4a3Bt7Mwb8DNWod1dk40Sm550jMOwgOcQ/n4S4EjgVkFH9XNnq
         ktgcI4ur9zB9RPzZ0giCBkyNSE3HLq0XZ9cEt/C1dX3WxKam4DJlSCxnkx8YFjvyKxD+
         ooWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JC5dX5Lw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c9sor632764pgn.58.2018.02.09.10.23.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Feb 2018 10:23:16 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JC5dX5Lw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QV8c0m8BWEVMk4XjMowUrafARDbrFrpogyU96I/Viio=;
        b=JC5dX5LwgvmGBKEIT//PmBSE8uuba/PTEB3WqLMuVtQcB8iRjh8E3nG7jiLLZz0ecw
         hPBNSyDXuBWuE/5+yEe1wbzUoAfNCY4jc7YczRbShrC1Wz8EnjGwCiw3GXppJ+SvHOQC
         ZC+27LUQPa5EcSsaBdq3YNHkWZEC2ZUtLHkQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QV8c0m8BWEVMk4XjMowUrafARDbrFrpogyU96I/Viio=;
        b=d+ltoZUnr2FmEF41Wkg/fQ0sNx8rGCSbXysKbsta3KQpFld1/OzPOyIdA3J1Wf0l0r
         F2LI7woIKy3nK1TWCqz+vzMfS0aET80y5QOEjyOuTIrI0OCQBScLKwrsvtF+iShhr8B2
         tK99T2ppB8oiYLQIgIJQcH/osy1Eiz42aKY21/se0HFDsCLkEkb6fKgrN4NYGRK7a5av
         WwYRZsBc4Atg6wGjUVbUrGDzxeTIk9vGyhgaGOA2Lp2D6oM1sneCFsi1saWjaVaDnCZi
         Kw2cKlVy9dveb/SFgg93Ig5K3/cB7jVjqlL7BBovFB75+ctp0vhBXQc9pxq01VoTvpjZ
         djAg==
X-Gm-Message-State: APf1xPC0GP6i75AMFrAWGA1A+lfTW9qSQJzJOqFfvl/2WaaIfNCSP8NY
	vy7dLt7dXDQjiO4RvYeVFUZixklS
X-Google-Smtp-Source: AH8x227npBnbsRgcL5tGBVujR9p5lyrKcAh7xaEK5+JLKd9y5yGwOb3/K+wuRlssiZ+uW8f7l9Rr7A==
X-Received: by 10.101.80.7 with SMTP id f7mr3152463pgo.35.1518200595534;
        Fri, 09 Feb 2018 10:23:15 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id p9sm6724422pgs.35.2018.02.09.10.23.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Feb 2018 10:23:14 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 29/32] arm/translate-a64: add FP16 FMOV to
 simd_mod_imm
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-30-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5504394e-b013-1129-10b7-3ddf62c5dc19@linaro.org>
Date: Fri, 9 Feb 2018 10:23:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-30-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: iRuTpP3c1mRg

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> Only one half-precision instruction has been added to this group.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - checkpatch fixes
> ---
>  target/arm/translate-a64.c | 48 ++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 38 insertions(+), 10 deletions(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index fa21299061..b209f57d55 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -6160,6 +6160,8 @@ static void disas_simd_copy(DisasContext *s, uint32_t insn)
>   *   MVNI - move inverted (shifted) imm into register
>   *   ORR  - bitwise OR of (shifted) imm with register
>   *   BIC  - bitwise clear of (shifted) imm with register
> + * With ARMv8.2 we also have:
> + *   FMOV half-precision
>   */
>  static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
>  {
> @@ -6176,8 +6178,11 @@ static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
>      int i;
>  
>      if (o2 != 0 || ((cmode == 0xf) && is_neg && !is_q)) {
> -        unallocated_encoding(s);
> -        return;
> +        /* Check for FMOV (vector, immediate) - half-precision */
> +        if (!(arm_dc_feature(s, ARM_FEATURE_V8_FP16) && o2 && cmode == 0xf)) {
> +            unallocated_encoding(s);
> +            return;
> +        }
>      }
>  
>      if (!fp_access_check(s)) {
> @@ -6235,19 +6240,42 @@ static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
>                      imm |= 0x4000000000000000ULL;
>                  }
>              } else {
> -                imm = (abcdefgh & 0x3f) << 19;
> -                if (abcdefgh & 0x80) {
> -                    imm |= 0x80000000;
> -                }
> -                if (abcdefgh & 0x40) {
> -                    imm |= 0x3e000000;
> +                if (o2) {
> +                    /* FMOV (vector, immediate) - half-precision
> +                     *
> +                     * We don't need fancy immediate expansion, just:
> +                     * imm16 = imm8<7>:NOT(imm8<6>):Replicate(imm8<6>,2):
> +                     *         imm8<5:0>:Zeros(6);
> +                     */
> +                    uint32_t imm8_5_0 = extract32(abcdefgh, 0, 6);
> +                    uint32_t imm8_6 = extract32(abcdefgh, 6, 1);
> +                    uint32_t imm8_7 = extract32(abcdefgh, 7, 1);
> +                    uint32_t imm8_6_rep = imm8_6 << 1 | imm8_6;
> +                    uint32_t imm8_6_not = ~imm8_6;
> +                    imm = deposit64(imm, 6, 6, imm8_5_0);
> +                    imm = deposit64(imm, 12, 2, imm8_6_rep);
> +                    imm = deposit64(imm, 14, 1, imm8_6_not);
> +                    imm = deposit64(imm, 15, 1, imm8_7);
> +                    /* now duplicate across the lanes */
> +                    imm = bitfield_replicate(imm, 16);
>                  } else {
> -                    imm |= 0x40000000;
> +                    imm = (abcdefgh & 0x3f) << 19;
> +                    if (abcdefgh & 0x80) {
> +                        imm |= 0x80000000;
> +                    }
> +                    if (abcdefgh & 0x40) {
> +                        imm |= 0x3e000000;
> +                    } else {
> +                        imm |= 0x40000000;
> +                    }
> +                    imm |= (imm << 32);
>                  }
> -                imm |= (imm << 32);

Please use vfp_expand_imm(MO_16, abcdefgh), which probably didn't exist when
you first wrote this.


r~
