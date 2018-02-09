Received: by 10.28.71.27 with SMTP id u27csp1256952wma;
        Fri, 9 Feb 2018 10:34:32 -0800 (PST)
X-Received: by 2002:a17:902:28c3:: with SMTP id f61-v6mr3484054plb.264.1518201272064;
        Fri, 09 Feb 2018 10:34:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518201272; cv=none;
        d=google.com; s=arc-20160816;
        b=QOPRwDeVMvWayx2h+04JKUOR47mUBIKJjocO3ebDbXPsCoey/fivqGu93YwLeklUM8
         vIuapPsCT/SkT2FNxmXkA84PgwOiA2UADmY8gbasMcy29pev/LDAIS8PIIOa9pHF6pgr
         bLbQuHj1hnFEOQNw4AX2Wa4cWLgGRJyLnW4WXjb1P5YL8+UryYKxjUSnCZnksDTPzX7V
         6eiY0dqeQGuUamw/qEe8FA5fY1BvrC18M8Yk24xaOUWh4dFqVp8QraoB3Cx+oQhbiqEW
         Bi9AvzXFdB2oFocuwvMiphY8kNQWWnjMbE1o3kV7BoIDNtqlAoniHK7D+71x/qZee0oh
         0NUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=8YY40VLdOvFfYDKT7AwiP/sbgG64ayyoY14QbaxevTQ=;
        b=uWdM0gWhDFycsof3Vg6II64TD8o2252n8L57I4oQRm4I4brC+7TTQpxyeN5iEWKwfh
         DvdOgu9TFDAfTKYi9gdSLERew+ed/gWmRpJ9LXKuuj2ilhxA6XVm9RgP+DlcwmITRE5C
         apeR046fF5XsxZQS2q+zFgzf9JsHpVv0/8Ro4qT+WUXtLAhQ+KQBd3+fbcijLxOEjaa9
         tGouhEzALQInTJ+W3a4te3Y8r+f098qbJAj9TysC0173DmgUj5HtXh5Nt/UmTNN16JmQ
         xjYgAq6XS4aCBJ89/WiLFFY3Srytdf9qc1I4+5nJmFsznZz0FH8BH6Ta9bTLYBat6zJd
         2mlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M21YL9Qr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x1-v6sor932560pln.93.2018.02.09.10.34.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Feb 2018 10:34:32 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M21YL9Qr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8YY40VLdOvFfYDKT7AwiP/sbgG64ayyoY14QbaxevTQ=;
        b=M21YL9QrJ23tK2vPhmHJCiQsnW6X4uGaoRjz8Ec2iUPBDDLdXlsgdsTurZ8fpKdmL/
         7Q2Q+XRo5odYZcJacWMWHwunshtjCTgS95kg3dbqU/rnpf2KB2+3q+VoBs8WFmlA2ubr
         +FK9wqfLB5HV4gIyO+7BMmMCan+xn6y/oRq3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8YY40VLdOvFfYDKT7AwiP/sbgG64ayyoY14QbaxevTQ=;
        b=gTdL/JkvdmcduuhAIhI09cb+4+P2dTt30IG93C6SqfLamJ4xWrt/yuexw+1k7mDsbp
         61Q9KdJBtosZ/Y8+EDUKEaHMN5CyiFR+s1sejAk6juZq7qsfzv9l2qRdYYIw14tYNc2v
         b9FmCUXTZVn6QXU7/YMFCFFqRUX5MGis1d/+fQNdUYQOstyosjiwqVrd+18MuIG84eyV
         tS4MguwdsyLBZrB9aYIZnmbDXd2cjPauqZwBYVeH0R7EGlgC2WCUby+BsGVjsmzT+VWU
         R9ZLJ/BmMP8a/NyoR0Mi3aJrM1QAqUS1b3vOfWeOfZlwQoUkvHR4Q2OtsPorRzUOEeSs
         Ib9A==
X-Gm-Message-State: APf1xPAejz74OHNTlhQhJyD6CYt5HQ1PqQfxaeCjMAETdQVEK0RByqkC
	zrQCOCBNpnTQxs6zEEMmlIbVGA77
X-Google-Smtp-Source: AH8x2267mc88xubzpu1eJHR1fGUQZCxwN1oPzF7R95VcrdBfIRLRSldHUl+Je/sA+OjsKQ0sYkCQKg==
X-Received: by 2002:a17:902:2901:: with SMTP id g1-v6mr3325515plb.69.1518201271537;
        Fri, 09 Feb 2018 10:34:31 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id o62sm12608863pfk.177.2018.02.09.10.34.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Feb 2018 10:34:30 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 31/32] arm/translate-a64: implement
 simd_scalar_three_reg_same_fp16
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-32-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <669dcbee-8a38-f123-fc2d-d54926ecb270@linaro.org>
Date: Fri, 9 Feb 2018 10:34:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-32-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: zsU1pdlFYLME

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> This covers the encoding group:
> 
>   Advanced SIMD scalar three same FP16
> 
> As all the helpers are already there it is simply a case of calling the
> existing helpers in the scalar context.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - checkpatch fixes
> ---
>  target/arm/translate-a64.c | 96 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index b094399fb4..92adf43a89 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -7764,6 +7764,99 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
>      tcg_temp_free_i64(tcg_rd);
>  }
>  
> +/* AdvSIMD scalar three same FP16
> + *  31 30  29 28       24 23  22 21 20  16 15 14 13    11 10  9  5 4  0
> + * +-----+---+-----------+---+-----+------+-----+--------+---+----+----+
> + * | 0 1 | U | 1 1 1 1 0 | a | 1 0 |  Rm  | 0 0 | opcode | 1 | Rn | Rd |
> + * +-----+---+-----------+---+-----+------+-----+--------+---+----+----+
> + * v: 0101 1110 0100 0000 0000 0100 0000 0000 => 5e400400
> + * m: 1101 1111 0110 0000 1100 0100 0000 0000 => df60c400
> + */
> +static void disas_simd_scalar_three_reg_same_fp16(DisasContext *s, uint32_t insn)
> +{
> +    int rd = extract32(insn, 0, 5);
> +    int rn = extract32(insn, 5, 5);
> +    int opcode = extract32(insn, 11, 3);
> +    int rm = extract32(insn, 16, 5);
> +    bool u = extract32(insn, 29, 1);
> +    bool a = extract32(insn, 23, 1);
> +    int fpopcode = opcode | (a << 3) |  (u << 4);
> +    TCGv_ptr fpst;
> +    TCGv_i32 tcg_op1;
> +    TCGv_i32 tcg_op2;
> +    TCGv_i32 tcg_res;
> +
> +    switch (fpopcode) {
> +    case 0x03: /* FMULX */
> +    case 0x04: /* FCMEQ (reg) */
> +    case 0x07: /* FRECPS */
> +    case 0x0f: /* FRSQRTS */
> +    case 0x14: /* FCMGE (reg) */
> +    case 0x15: /* FACGE */
> +    case 0x1a: /* FABD */
> +    case 0x1c: /* FCMGT (reg) */
> +    case 0x1d: /* FACGT */
> +        break;
> +    default:
> +        unallocated_encoding(s);
> +        return;
> +    }
> +
> +    if (!fp_access_check(s)) {
> +        return;
> +    }

Missing test for fp16 enabled.

> @@ -9991,6 +10084,8 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
>                  gen_helper_advsimd_minh(tcg_res[pass], tcg_op1, tcg_op2, fpst);
>                  break;
>              default:
> +                fprintf(stderr, "%s: insn %#04x, fpop %#2x @ %#" PRIx64 "\n",
> +                        __func__, insn, fpopcode, s->pc);

Leftover debug.


r~
