Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp236909njl;
        Tue, 8 Oct 2024 07:35:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJwOk/GzN7u5jVSWpzk9wuB9QxuTsHEh+e38N1FAsWA8RNs5RwGK+7lzfSjLM0OvanMB7wqBInKYagyQ==@linaro.org
X-Received: by 2002:a05:6402:1ccd:b0:5c8:9553:c779 with SMTP id 4fb4d7f45d1cf-5c8d2ebdf0cmr14303423a12.27.1728398119441;
        Tue, 08 Oct 2024 07:35:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728398119; cv=none;
        d=google.com; s=arc-20240605;
        b=ggPSpS2xWBt8Z9c3PPLh6cOzxaFOdQSjqSkTlhyTl7Y4/Q+qYGCfuwR+JojgSuFvno
         6R4WqmeQzTmw0H2KEdRixApRKeLG+keXj0JoYxtc2vbauQayCazvjbR51pPOT0panQZ+
         JMYCNdSqb3z9h3WXPnSz7MnIi7GsRXr7Kl9orj+264WM+Cdlc/7ZTvAb4TEhmAYSi3Ds
         E+Zf2AyM73I3+9JcMJY5CKEL7lbBnhduicrHLUED+uZgu2oY/HM58P067vmhQLC1u/Vv
         SxwCfe/g9SP2l8LotPh802sgl7nvdrl48saTomyRwRxIaQoJNBjKlWVJXy+XIJ/faKo0
         Jg4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ejEHR1wMlkNLtiJ1Hqtaqwe+D7rXesFiFwGrxD/Swxc=;
        fh=rwhzM3gzT8D0WyMs5LqSH1b340rG68EPA7h24wKbf4k=;
        b=c3Jq1ufwUcEYUMQA6+P94tI7BDI1EsraszFdspr4P1XDazvZ9v0/7l+sNydQ7QSk6C
         UvCCBLj286trV5PV2aAw+0UEOzzdzdKI/afDaOSPsJ7IFxcOZnPwg4flmZ3kGTUh/jwt
         kDLhML3Bcrzf8e5V4ECpI9XSBl6U2jmvMEp54paqKIqaeZ58adFjSysDXYO3Q+hdAHip
         leaE9JvbkDB7nYX998EqYZao7oAlqMy7WYz3H11crG6FZQ9NM5/ZZG4zD3KBvsobM2IJ
         juWzpzUzOq+R0WEqixXL56uOAZs8vX/PyVuovtBo9VfVm8Mey8n2LhUxTobe87+y327j
         bm8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KHh6p9FM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c8e05e4038sor2069498a12.8.2024.10.08.07.35.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:35:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KHh6p9FM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728398119; x=1729002919; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ejEHR1wMlkNLtiJ1Hqtaqwe+D7rXesFiFwGrxD/Swxc=;
        b=KHh6p9FMidET3xYDZpKtGeqx4fPq7tKusgm4KpQRtqtKAxa3NU/jA6NPcXxWmLlGkF
         euMcGNumlUvte5uzTdFsonMRG+dm7pK8OboNwkIS7vL6Os2uRxi5dW9YoxGNScqFvxNB
         YflVFEu/du80c8+1WmEj1LnxU4OsgvEhuq3Fu+s2Rvniis7rT955sN91WEXgDEKvmB5W
         Omhu4p8gecV3Tmm3Mb0cfLD4ZHOxAxeVwyeBUpfX54Hki2c0zvlQ8f9gzscYEn2RUzuw
         0MNenAWeRU9cjSFCUpz4hQ6wH73taDGSaAswO/mtWJuQMQNDgDWpLm5um1Ahf6Vs79lp
         oA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398119; x=1729002919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejEHR1wMlkNLtiJ1Hqtaqwe+D7rXesFiFwGrxD/Swxc=;
        b=cy4ihB0mAIs9ynOc/lcc5ivAZ+xd1sfjSE0YBy/zUeZrstvOnpU8XT0+gZi8noZVFF
         ZNiKVHaVNyd5vKUsSKt5AQIRzGp/Inc+4RBbBDGOeZ63QN5glX5hPFwXYv4/ccS6N9YM
         bOAWtyh0R969yqCGmjJn3g/gK9Zpc0DYLIH5hwChbIouhgJ1TpiLiQw+2I4bAbfJeXNq
         yMm2+AZs5sHut7FLJ9MTTJG5xtgc42pZ0nnFF1msd7DfKeVuPMqvZUqgTTE+ac9Kp4J4
         xrxoYAvDNA0Xa40ukFWPflNhqT8xOpoFXOVCAuK+YY8Q9RgT7J/lD2xCmfAagTfLfGl6
         XNdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7Bfs0yqpIN5WbeQmiJ33mApgGYVxuCD88fPNv8VM45RRW7YMZc8O2o8pb3nzepYkoZVn3JcwoHn3iQw==@linaro.org
X-Gm-Message-State: AOJu0YzwV1Zjo7ss4EcAszHOCSTv9b9gqM/EXf3/f/Nw2lUKGBZ4ChzW
	vlzgAfg2j6O+rZUHHppHocUjokyf10rBF4NcjexdUWJjTm//0ppPBg4V2GUPOiuKK0UCYBp7blW
	0rsbOnLPXO4NgEBiZUU9BNraVh5ddjnevv2WRv+wB
X-Google-Smtp-Source: AGHT+IEJhPFIg7Qd18l/zzU6VuxNjyfZlpL9dJ5GySWcXx1gRxvqO8ZcTix41f8blmGjq8Y98ULXs/w/4SLM1BwGu+4=
X-Received: by 2002:a05:6402:c42:b0:5c8:ad38:165c with SMTP id
 4fb4d7f45d1cf-5c8d2ebdaf7mr14866174a12.23.1728398118716; Tue, 08 Oct 2024
 07:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-15-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:35:07 +0100
Message-ID: <CAFEAcA9B1OsYgChehuz7uRgP-=Mbh=4zSK+owJz+BoBvA4Cnvg@mail.gmail.com>
Subject: Re: [PATCH v2 14/21] target/arm: Pass MemOp to get_phys_addr_with_space_nogpc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: Pc4qNM4XNV6t

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Zero is the safe do-nothing value for callers to use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 3 ++-
>  target/arm/helper.c    | 4 ++--
>  target/arm/ptw.c       | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 2b16579fa5..a6088d551c 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1461,6 +1461,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
>   * @env: CPUARMState
>   * @address: virtual address to get physical address for
>   * @access_type: 0 for read, 1 for write, 2 for execute
> + * @memop: memory operation feeding this access, or 0 for none
>   * @mmu_idx: MMU index indicating required translation regime
>   * @space: security space for the access
>   * @result: set on translation success.
> @@ -1470,7 +1471,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
>   * a Granule Protection Check on the resulting address.
>   */
>  bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
> -                                    MMUAccessType access_type,
> +                                    MMUAccessType access_type, MemOp memop,
>                                      ARMMMUIdx mmu_idx, ARMSecuritySpace space,
>                                      GetPhysAddrResult *result,
>                                      ARMMMUFaultInfo *fi)
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 3f77b40734..f2f329e00a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3602,8 +3602,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
>       * I_MXTJT: Granule protection checks are not performed on the final address
>       * of a successful translation.
>       */
> -    ret = get_phys_addr_with_space_nogpc(env, value, access_type, mmu_idx, ss,
> -                                         &res, &fi);
> +    ret = get_phys_addr_with_space_nogpc(env, value, access_type, 0,
> +                                         mmu_idx, ss, &res, &fi);

0 is the correct thing here, because AT operations are effectively
assuming an aligned address (cf AArch64.AT() setting "aligned = true"
in the Arm ARM pseudocode).

Is there a way to write this as something other than "0" as
an indication of "we've definitely thought about this callsite
and it's not just 0 for back-compat behaviour" ? Otherwise we
could add a brief comment.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
