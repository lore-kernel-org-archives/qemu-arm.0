Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local (host5-81-235-77.range5-81.btcentralplus.com. [5.81.235.77])
        by smtp.gmail.com with ESMTPSA id x25sm11114275wrx.27.2017.02.24.09.16.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Feb 2017 09:16:43 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D0C863E0198;
	Fri, 24 Feb 2017 17:16:42 +0000 (GMT)
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org> <1487262963-11519-13-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.5
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [PATCH v2 12/13] armv7m: Raise correct kind of UsageFault for attempts to execute ARM code
In-reply-to: <1487262963-11519-13-git-send-email-peter.maydell@linaro.org>
Date: Fri, 24 Feb 2017 17:16:42 +0000
Message-ID: <87mvdbldad.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: DWedZ6hFzhN2


Peter Maydell <peter.maydell@linaro.org> writes:

> M profile doesn't implement ARM, and the architecturally required
> behaviour for attempts to execute with the Thumb bit clear is to
> generate a UsageFault with the CFSR INVSTATE bit set.  We were
> incorrectly implementing this as generating an UNDEFINSTR UsageFault;
> fix this.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.h       | 1 +
>  linux-user/main.c      | 1 +
>  target/arm/helper.c    | 4 ++++
>  target/arm/translate.c | 8 ++++++--
>  4 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 017e301..228747f 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -54,6 +54,7 @@
>  #define EXCP_VFIQ           15
>  #define EXCP_SEMIHOST       16   /* semihosting call */
>  #define EXCP_NOCP           17   /* v7M NOCP UsageFault */
> +#define EXCP_INVSTATE       18   /* v7M INVSTATE UsageFault */
>
>  #define ARMV7M_EXCP_RESET   1
>  #define ARMV7M_EXCP_NMI     2
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 4fd49ce..b6043d8 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -574,6 +574,7 @@ void cpu_loop(CPUARMState *env)
>          switch(trapnr) {
>          case EXCP_UDEF:
>          case EXCP_NOCP:
> +        case EXCP_INVSTATE:
>              {
>                  TaskState *ts = cs->opaque;
>                  uint32_t opcode;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6a476b4..948aba2 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6244,6 +6244,10 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
>          env->v7m.cfsr |= R_V7M_CFSR_NOCP_MASK;
>          break;
> +    case EXCP_INVSTATE:
> +        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
> +        env->v7m.cfsr |= R_V7M_CFSR_INVSTATE_MASK;
> +        break;
>      case EXCP_SWI:
>          /* The PC already points to the next instruction.  */
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC);
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 4436d8f..9fded03 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7978,9 +7978,13 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>      TCGv_i32 addr;
>      TCGv_i64 tmp64;
>
> -    /* M variants do not implement ARM mode.  */
> +    /* M variants do not implement ARM mode; this must raise the INVSTATE
> +     * UsageFault exception.
> +     */
>      if (arm_dc_feature(s, ARM_FEATURE_M)) {
> -        goto illegal_op;
> +        gen_exception_insn(s, 4, EXCP_INVSTATE, syn_uncategorized(),
> +                           default_exception_el(s));
> +        return;
>      }
>      cond = insn >> 28;
>      if (cond == 0xf){


--
Alex Bennée
