Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1141168ejb;
        Thu, 30 Mar 2023 03:31:15 -0700 (PDT)
X-Received: by 2002:a17:906:3d49:b0:930:2530:5f47 with SMTP id q9-20020a1709063d4900b0093025305f47mr23683057ejf.11.1680172275769;
        Thu, 30 Mar 2023 03:31:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680172275; cv=none;
        d=google.com; s=arc-20160816;
        b=Z2WTYEh/2PWMVu16thAamIgveaW+KGhv1GNMFVCPAkw3IhqsA4z1LdfEpITQkRKgbN
         Mw2dGvsI6d+TPl/VBOQctOaf+M/JYlobiGuSyKFhX4vdqR+/a+ieTQxjRFgEXyNuyVGg
         egFwC9p5MLRtggNAIMt+5IwkFvrrsl2QpmHTrqiXDuO5xXLlNiJVk4zVPU3wdCDFaTQh
         8z/iWeaz6lF/3qv06Tv79BowPk4JTgLvJXOgI+GxRBId2WnW8cstTW0Vn05FjD6a2BiF
         LAGv1Ki22Um55rFPC/xrurmxQ9JpYbQxXZnJNKNc50SlGkOoZFlvqWWr+I+AK5NKhvqc
         5qTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6j5tKtWtgjVcee30MA/GvCiq1FDILEDXA9D/KFXqD/Y=;
        b=LmQpVzMetXC1VYi/w+kT2tZqf99pak7ocmN0AMatXBm1zZCXGModvhflhwLsaTUivE
         klrTzUrHPoHnxxCmfEiolh1KugOlLYJmjDtIRwDU25hZmmIs7uhT6FyclN3tUXVz96+4
         kHS1k7kx7pXduNGgvfdRg5zD9YDp/f3wGc+SCjNa5aCp14t4Fd5nHQ4Dp/JbeJjss/5i
         tD1evi3UAcIl03r4XS8UFfc5CIp76IUD0F3Usk3AZpRYrjiyAXIuOnF9owIwd5M+CB/5
         +iPD4/RdNf+LE7iAXiTY4dvWaiYG8XOF4+dTpbUDv1DnDaAihv6wJtZ7dz1HNQ8N7uQB
         9b1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ePcPsT2x;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ga42-20020a1709070c2a00b0094772ed025fsor369635ejc.108.2023.03.30.03.31.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Mar 2023 03:31:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ePcPsT2x;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680172275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6j5tKtWtgjVcee30MA/GvCiq1FDILEDXA9D/KFXqD/Y=;
        b=ePcPsT2xkAcEPhhiqHXnXt15lS3tSsRUBS+B7LGtFb2lK/Cd3tLXBtUm6/J3Yk2LdE
         OrKIQ3U1tzw+3nYWjvl06i69x7YJ7GxdScuiEi0V8wRILcJTaRv5JJzJH8E//3KVjpXo
         aTzEZykcuFWFPnjzhirW3u5TwtoHzNMGAdJ6uNQxiue/s5Ka+0g7J1wdi0ULH7r/noZi
         ZgZspwQVt+bzqgsh47y02qOTGK36MgrAv3TE4rMKB2de90+mz4wbaYF86SEsYwE29L5b
         ErlVhXc/UJJ7SJ0otPp4JLlw7YQB3YC2/2kP11uhUhVpB8cCTX7OQ500Zp84xPzy3/fY
         kbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680172275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6j5tKtWtgjVcee30MA/GvCiq1FDILEDXA9D/KFXqD/Y=;
        b=2NgjhAAxsivfFyPpAKDS6zoMh1mJZrqcqshH/LWj7ev2FPJeT/Pfg81eRX31fBcgie
         tiTJ+/FE54J7fnjScV9QJ1In81ffA9Uu+KQzyv8FgCQDfG+F8Oe5lmTMKC+bntSGML8q
         HWuXGo1k6dTVSXEVrnVDKEZ7s+SoxaNkzUep/q/NJ0DXLm6Ns+gJ3fa0+6Z+05+5ZIyA
         3sRQeoPSGpj6lAdezWcNeQhqfx5u42lcYoJ3iUf19ApEwl5wTUWd+81+7QgESaQpHCFd
         5liowxuqt0mwu16tBY3ODMmkdcHO6LsdDRfeeExZJNFMIw5iA38vQM7uWV1IsvUDaf6a
         iOtA==
X-Gm-Message-State: AAQBX9cg/RAR7jWoA2Q7UeF5g0iykpWaXu3aHOmztpNqH2AL1VGgoQqL
	uGCAeyPBAf6/bF4OA3WWsyuJO1nzbPTsecqWjkNFeUJo
X-Google-Smtp-Source: AKy350aDTQQsQFJ6XGXT10JB/68gcSqjaV0iCJUo22jcMgbWWxlNS+X/Zvd5DR2RHxD83PqiLZvZgGMezkKSRwHRzhE=
X-Received: by 2002:a17:906:8683:b0:939:a51a:dc30 with SMTP id
 g3-20020a170906868300b00939a51adc30mr2711398ejx.2.1680172275299; Thu, 30 Mar
 2023 03:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230328212516.29592-1-philmd@linaro.org>
In-Reply-To: <20230328212516.29592-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Mar 2023 11:31:04 +0100
Message-ID: <CAFEAcA_yP9ibO2NOC0pL4SNbPmHtB+TfPm0A06YfC4Mwec5xAQ@mail.gmail.com>
Subject: Re: [PATCH-for-8.0 v3] target/arm: Fix non-TCG build failure by
 inlining pauth_ptr_mask()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Fabiano Rosas <farosas@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: yoY97UGhGv4k

On Tue, 28 Mar 2023 at 22:25, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> aarch64_gdb_get_pauth_reg() -- although disabled since commit
> 5787d17a42 ("target/arm: Don't advertise aarch64-pauth.xml to
> gdb") is still compiled in. It calls pauth_ptr_mask() which is
> located in target/arm/tcg/pauth_helper.c, a TCG specific helper.
>
> To avoid a linking error when TCG is not enabled:
>
>   Undefined symbols for architecture arm64:
>     "_pauth_ptr_mask", referenced from:
>         _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
>   ld: symbol(s) not found for architecture arm64
>   clang: error: linker command failed with exit code 1 (use -v to see inv=
ocation)
>
> - Inline pauth_ptr_mask() in aarch64_gdb_get_pauth_reg()
>   (this is the single user),
> - Rename pauth_ptr_mask_internal() as pauth_ptr_mask() and
>   inline it in "internals.h",
>
> Fixes: e995d5cce4 ("target/arm: Implement gdbstub pauth extension")
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> Supersedes: <20230328133054.6553-1-philmd@linaro.org>
>
> Since v2:
> - Rebased (patch #1 merged)
> - Addressed rth's comments
> - Added R-b tags
> ---
>  target/arm/internals.h        | 16 +++++++---------
>  target/arm/gdbstub64.c        |  7 +++++--
>  target/arm/tcg/pauth_helper.c | 18 +-----------------
>  3 files changed, 13 insertions(+), 28 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 673519a24a..71f4c6d8a2 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1389,15 +1389,13 @@ int exception_target_el(CPUARMState *env);
>  bool arm_singlestep_active(CPUARMState *env);
>  bool arm_generate_debug_exceptions(CPUARMState *env);
>
> -/**
> - * pauth_ptr_mask:
> - * @env: cpu context
> - * @ptr: selects between TTBR0 and TTBR1
> - * @data: selects between TBI and TBID
> - *
> - * Return a mask of the bits of @ptr that contain the authentication cod=
e.
> - */
> -uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data);
> +static inline uint64_t pauth_ptr_mask(ARMVAParameters param)
> +{
> +    int bot_pac_bit =3D 64 - param.tsz;
> +    int top_pac_bit =3D 64 - 8 * param.tbi;
> +
> +    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
> +}

Any reason for deleting the doc comment ?

thanks
-- PMM
