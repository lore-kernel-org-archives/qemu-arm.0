Received: by 10.28.71.27 with SMTP id u27csp1260220wma;
        Fri, 9 Feb 2018 10:38:03 -0800 (PST)
X-Received: by 10.107.184.198 with SMTP id i189mr4168656iof.137.1518201483382;
        Fri, 09 Feb 2018 10:38:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518201483; cv=none;
        d=google.com; s=arc-20160816;
        b=yXjITEO6Tb2Kbta3jGLokfEJqIuJFP8g88jZWEW0DPP3wTUbCuFIkKy8k43ZfMv2Z6
         sJEtxKsjcFcSuZlrp9J47zTQG8AJcNg1bCb3FR9BJYmjlHLdgVFjTTcfwrxVYy4c70Mx
         CxDkEYGZ0JcFHInJs454ReyTz2CaJkrASBJEnR/ugDLV7lBCJjAsD2J24CGc+/LFUvRt
         GHcaAm10b3mqjwabeJ7Ou3PqAqADOR8AaAfWGSjzlhP+zd0xGs/pmG2emT+HUPMLhldH
         i9pgizsGf9vsSzy39JQq07tK3i5KOmQy2IcGtqEpEVWHqYJj7gXfb8HHa2l5ixNuqsdH
         Mneg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=eCLe5TwiTa5bYDpibY3kpySSBEUfPdji3c7aoyzwDx8=;
        b=SbLpjS7A2nwj89LW9BjDLLshguWQ8S2i2//Gjfgg4TcovJdrwNrnruNRAE+davjCtB
         zkZqNiCSFKr98sadUDUqJnD4lGIFzjxR98AcKZ5iEHA8m/hnukXiNZ/F/2EzQCoKeq6y
         I74VIPz6VVd5xv+h2N+fbJDm5x6lGJ/UIR3Oen1huPq43hBlsMheBpsR4s3IOXVJkEkq
         H4cRXZMtBYklUFwiW7NRPdw30Fn2ZA304uHDdaMO/fT5RFlQDQCifnhtDfZVw8V2wxqB
         6pcszC/U1S6u2ySCWH7BwgknCHDw6vKoxzGHAQVGeAIeDx6WR4Jke/5HkMZsqBHrUScI
         suqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=faLwYlr5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i139sor1745622ioi.209.2018.02.09.10.38.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 Feb 2018 10:38:03 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=faLwYlr5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eCLe5TwiTa5bYDpibY3kpySSBEUfPdji3c7aoyzwDx8=;
        b=faLwYlr5t/Ta2KpRpIdK9SnKLhygFSqW5bC9n+vi7avlWFNvmb3hgFQtmGipbKTODD
         YyTrmqX2i4VhN0tsRprCZTfEnOqmbPLOlsUeHg0XflnPwlW9kFHb1nKvBl3CKXYHcbhW
         GONH5aAHFwJXYeTxja0lXTZSaNbaAa/E+wVlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eCLe5TwiTa5bYDpibY3kpySSBEUfPdji3c7aoyzwDx8=;
        b=L6vEydjf6dyZn+IAL7/LAsGKx7PD0Td6t5sn7lAQHhdFXjozH24pdejs8Mj31r4bpJ
         gFHZvtFM0RKp+NOXERZBIAxP5NXQeqocJkcjefsiXwSZLIq8fQSCtvHRo0nXgZG21wrT
         JdyLYHtejDKwpn8p9khdj9f8LEpMGrgOlPqa2ByAnp6GNXkNRCkbP4YOMf5jmkKnOv7o
         kDFRAnjeFfjqIVK/KAZ17F7duEHhplyzrpYfEsPuBTb3y31KrPS4HJA0uXxVFkz6Yue4
         PO2KG2PG2jvvw5yRs3VzDd3H7AWLn+Ude3OKg3yCkayF8kadrhFmBiQDD80WwZKnJnUT
         YIlQ==
X-Gm-Message-State: APf1xPBupiwkNFywsORifDnJej5ZnpkCae4XWhY1uAq77YPZQKN6WGzV
	4AqkzMk+FrYlzFkIhpHU+8RNB4gk/8c0+A==
X-Google-Smtp-Source: AH8x224TSx/EebwDqm9QsXUMFDcrZLk8BRKcCcXcP9dBziOMEQNOLDeQHmVSf8zNTLd8Q70rWY2deQ==
X-Received: by 10.107.134.97 with SMTP id i94mr4062610iod.210.1518201482889;
        Fri, 09 Feb 2018 10:38:02 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net. [174.21.6.47])
        by smtp.gmail.com with ESMTPSA id 193sm4188457itv.9.2018.02.09.10.38.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Feb 2018 10:38:02 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 32/32] arm/translate-a64: add all single
 op FP16 to handle_fp_1src_half
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-33-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ec2273c-a81a-eaa6-ef10-d229ae06e0cf@linaro.org>
Date: Fri, 9 Feb 2018 10:37:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180208173157.24705-33-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Y4ksKXE1zvaP

On 02/08/2018 09:31 AM, Alex Bennée wrote:
> This includes FMOV, FABS, FNEG, FSQRT and  FRINT[NPMZAXI]. We re-use
> existing helpers to achieve this.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/translate-a64.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 92adf43a89..265bfb14d0 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -4508,6 +4508,66 @@ static void disas_fp_csel(DisasContext *s, uint32_t insn)
>      tcg_temp_free_i64(t_true);
>  }
>  
> +/* Floating-point data-processing (1 source) - half precision */
> +static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
> +{
> +    TCGv_ptr fpst = NULL;
> +    TCGv_i32 tcg_op;
> +    TCGv_i32 tcg_res;
> +
> +    tcg_op = read_fp_sreg(s, rn);
> +    tcg_res = tcg_temp_new_i32();
> +
> +    switch (opcode) {
> +    case 0x0: /* FMOV */
> +        tcg_gen_mov_i32(tcg_res, tcg_op);
> +        break;
> +    case 0x1: /* FABS */
> +        gen_helper_advsimd_absh(tcg_res, tcg_op);
> +        break;
> +    case 0x2: /* FNEG */
> +        tcg_gen_xori_i32(tcg_res, tcg_op, 0x8000);
> +        break;
> +    case 0x3: /* FSQRT */
> +        gen_helper_sqrt_f16(tcg_res, tcg_op, cpu_env);
> +        break;
> +    case 0x8: /* FRINTN */
> +    case 0x9: /* FRINTP */
> +    case 0xa: /* FRINTM */
> +    case 0xb: /* FRINTZ */
> +    case 0xc: /* FRINTA */
> +    {
> +        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(opcode & 7));
> +        fpst = get_fpstatus_ptr(true);
> +
> +        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
> +        gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
> +
> +        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
> +        tcg_temp_free_i32(tcg_rmode);
> +        break;
> +    }
> +    case 0xe: /* FRINTX */
> +        fpst = get_fpstatus_ptr(true);
> +        gen_helper_advsimd_rinth_exact(tcg_res, tcg_op, fpst);
> +        break;
> +    case 0xf: /* FRINTI */
> +        fpst = get_fpstatus_ptr(true);
> +        gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
> +        break;
> +    default:
> +        abort();
> +    }
> +
> +    write_fp_sreg(s, rd, tcg_res);

Some of these helpers will zero-extend from 16 bits, but at least a few won't
-- notably fmov and fneg.  I wonder if it wouldn't be best to have a write_fp_hreg.


r~
