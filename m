Received: by 10.223.183.22 with SMTP id l22csp2599561wre;
        Thu, 17 Aug 2017 13:13:10 -0700 (PDT)
X-Received: by 10.98.91.3 with SMTP id p3mr6317106pfb.20.1503000790760;
        Thu, 17 Aug 2017 13:13:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503000790; cv=none;
        d=google.com; s=arc-20160816;
        b=UBgVfpbmpptge2TgRqyCRzg1qKXALKGjI70iCwskKfEw0iejBk7i4rcyf1JSX/1JUf
         MfVgXdnIx8xDt9t8TjjCCKTxtiTznQ/W5KpSuHRaSIJIh/DOlfGKp2gC/0XOb5C9Ikeu
         u+5VdS9sk1intDiSqSaAl2RIX32ul0LzY8PKSAxxp2FkoHSTTfoLffXVXHa0AAyiM8ul
         BzYgVdD4ZC46eNxhfEqwOiPsGZoiZbg31TCGL+MWEi15w2wzeZTM7Q4xUulClT6JaCoF
         M41wdHkLWIf4//Z7OjgcYvjAzam/31vLCoNhj8FoLzG5W9DK/ZV+b1GkQcy2JPMguh6F
         Dnig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=hLSpsz1d+nb9lePdmsz6dt0E00HVSdFMa+COk5lvYpI=;
        b=f2sITuQZhIDletA4YL5VSTfbSnlrdUBqLAlAbsurlGZ97po198gZqyseU6BecMwRIA
         WOcMa516PMGGZUBk/eiMdPwVINJl4B6PmLtujlNr3+X9p7tSJLc+vD9nAnk5UOG+Qcul
         xMiK+KovNls2VWJcBo0nm6zFY5XC0ISQRM+2QZJzoT6I1R27ugQSOY3s1KTjGmY2FlV8
         nNtxK1dNw48uWN92TolRV70gvpt4Qh5SoDvNMsD/9HH4yOqo2w85fMhCVw0i6ejzogGW
         96K/rlVi1rYPZvIwJkEbtC6rezytyl8GosRtMXzxLu+itkNhuDyiWAFQUPjZfzsfL54D
         Q5cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kD2lcXfY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::232 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-pg0-x232.google.com (mail-pg0-x232.google.com. [2607:f8b0:400e:c05::232])
        by mx.google.com with ESMTPS id g3si2672604plb.21.2017.08.17.13.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 13:13:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::232 as permitted sender) client-ip=2607:f8b0:400e:c05::232;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kD2lcXfY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::232 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-pg0-x232.google.com with SMTP id t3so21628265pgt.0
        for <alex.bennee@linaro.org>; Thu, 17 Aug 2017 13:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hLSpsz1d+nb9lePdmsz6dt0E00HVSdFMa+COk5lvYpI=;
        b=kD2lcXfYnmq6dfrlnkJd8XitZWrvO8YBv7fYgmzaMi6lGWpXktfu/XEOUz3uyejcWK
         9USz81oIFks2tddZfXEjlDZUg//SyL3zT6pP/4K7g6ttj65e/9ZoygdkmFcBt57Xmoo/
         WYauzvYXNrvyN3St/ECDd3aYU2qYIzTZ7oKqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hLSpsz1d+nb9lePdmsz6dt0E00HVSdFMa+COk5lvYpI=;
        b=pcwUUOp/7D3RMK5enTA4hj7qd8snqa3+O9SfoEDIqJo9vHCN3G9g0nI0w8yM6g9QmF
         bJwVBEQTlO0OPuVOVRzupAwXRj/Odo498L31qs/SzDnuKrzulp4Ya5j77KW4W84nEWBu
         xRlgBMaZ/5p8pTuJv1Kxrnhxgn/5X/PIVw39xAZZB2E+pnUG9DgTba9iDjlQPNZNFhDM
         1f/FWwIGN/ir8HDqRU5LO8f3D6DwKzi11RVFwLA0VEgOrxlak4XlgpG7mg3kVHuV1m6c
         S/4vnBPVziccdwzQRVntj91KHECpGxByWKeaLAiTQyJjhMQUTugrYJuUr5E/+t0G4amz
         6uTw==
X-Gm-Message-State: AHYfb5j/M9o+wLirzQpnVr5+4M1OlfsDI0qDsG4hRPx4K2RCc2NzrBRm
	q1of12+wcCiC2mlDLVem0RbB
X-Received: by 10.98.15.86 with SMTP id x83mr6280292pfi.288.1503000790239;
        Thu, 17 Aug 2017 13:13:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id n1sm9022249pfj.46.2017.08.17.13.13.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 13:13:09 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH 3/9] tcg: generate ptrs to vector
 registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, rth@twiddle.net,
 cota@braap.org, batuzovk@ispras.ru
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20170817180404.29334-1-alex.bennee@linaro.org>
 <20170817180404.29334-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <63b2dd72-90bf-d9f6-9f7c-c9919904e74e@linaro.org>
Date: Thu, 17 Aug 2017 13:13:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170817180404.29334-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: msQw76kTwzNz

On 08/17/2017 11:03 AM, Alex Bennée wrote:
> As we operate directly on the vectors in memory we pass around the
> address for TCG_TYPE_VECTOR. Currently only helpers ever see these
> values but if we were to generate simd backend instructions they would
> load directly from the backing store.
> 
> We also need to ensure when copying from one temp register to the
> other the right size is used.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tcg/tcg.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 35598296c5..e16811d68d 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -2034,7 +2034,21 @@ static void temp_load(TCGContext *s, TCGTemp *ts, TCGRegSet desired_regs,
>          break;
>      case TEMP_VAL_MEM:
>          reg = tcg_reg_alloc(s, desired_regs, allocated_regs, ts->indirect_base);
> -        tcg_out_ld(s, ts->type, reg, ts->mem_base->reg, ts->mem_offset);
> +        if (ts->type == TCG_TYPE_VECTOR) {
> +            /* Vector registers are ptr's to the memory representation */
> +            TCGArg args[TCG_MAX_OP_ARGS];
> +            int const_args[TCG_MAX_OP_ARGS];
> +            args[0] = reg;
> +            args[1] = ts->mem_base->reg;
> +            args[2] = ts->mem_offset;
> +            const_args[0] = 0;
> +            const_args[1] = 0;
> +            const_args[2] = 1;
> +            /* FIXME: needs to by host_ptr centric */
> +            tcg_out_op(s, INDEX_op_add_i64, args, const_args);

This fails when the offset is out of range for the addition, and technically if
the backend does not support 3-operand addition.  You didn't see this because
the x86 backend does use lea, and has a 32-bit offset.

Once upon a time we had a tcg_out_addi; if we go this way with TCG_TYPE_VECTOR,
we should re-introduce that.


r~
