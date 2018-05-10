Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b16-v6sm1226037wrm.89.2018.05.10.08.07.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 May 2018 08:07:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 201103E03C0;
	Thu, 10 May 2018 16:07:41 +0100 (BST)
References: <20180510140934.22855-1-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH] fix fp16 tininess
In-reply-to: <20180510140934.22855-1-peter.maydell@linaro.org>
Date: Thu, 10 May 2018 16:07:41 +0100
Message-ID: <87in7vv9aa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: DYfT78NS4RO7


Peter Maydell <peter.maydell@linaro.org> writes:

> In commit d81ce0ef2c4f105 we added an extra float_status field
> fp_status_fp16 for Arm, but forgot to initialize it correctly
> by setting it to float_tininess_before_rounding. This currently
> will only cause problems for the new V8_FP16 feature, since the
> float-to-float conversion code doesn't use it yet. The effect
> would be that we failed to set the Underflow IEEE exception flag
> in all the cases where we should.
>
> Add the missing initialization.
>
> Fixes: d81ce0ef2c4f105
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index d175c5e94f..7939c6b8ae 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -324,6 +324,8 @@ static void arm_cpu_reset(CPUState *s)
>                                &env->vfp.fp_status);
>      set_float_detect_tininess(float_tininess_before_rounding,
>                                &env->vfp.standard_fp_status);
> +    set_float_detect_tininess(float_tininess_before_rounding,
> +                              &env->vfp.fp_status_f16);
>  #ifndef CONFIG_USER_ONLY
>      if (kvm_enabled()) {
>          kvm_arm_reset_vcpu(cpu);


--
Alex Benn=C3=A9e
