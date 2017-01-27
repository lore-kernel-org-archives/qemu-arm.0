Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l67sm4024891wmf.1.2017.01.27.05.53.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2017 05:53:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id C025F3E0342;
	Fri, 27 Jan 2017 13:53:26 +0000 (GMT)
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org> <1485285380-10565-8-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.1.91.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH 07/10] armv7m: Report no-coprocessor faults correctly
In-reply-to: <1485285380-10565-8-git-send-email-peter.maydell@linaro.org>
Date: Fri, 27 Jan 2017 13:53:26 +0000
Message-ID: <874m0ka9t5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: u7jgjCqmTV9G


Peter Maydell <peter.maydell@linaro.org> writes:

> For v7M attempts to access a nonexistent coprocessor are reported
> differently from plain undefined instructions (as UsageFaults of type
> NOCP rather than type UNDEFINSTR).  Split them out into a new
> EXCP_NOCP so we can report the FSR value correctly.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.h       | 1 +
>  linux-user/main.c      | 1 +
>  target/arm/helper.c    | 4 ++++
>  target/arm/translate.c | 8 ++++++++
>  4 files changed, 14 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 4b062d2..39bff86 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -53,6 +53,7 @@
>  #define EXCP_VIRQ           14
>  #define EXCP_VFIQ           15
>  #define EXCP_SEMIHOST       16   /* semihosting call */
> +#define EXCP_NOCP           17   /* v7M NOCP UsageFault */
>
>  #define ARMV7M_EXCP_RESET   1
>  #define ARMV7M_EXCP_NMI     2
> diff --git a/linux-user/main.c b/linux-user/main.c
> index db4eb68..f40d45a 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -570,6 +570,7 @@ void cpu_loop(CPUARMState *env)
>
>          switch(trapnr) {
>          case EXCP_UDEF:
> +        case EXCP_NOCP:
>              {
>                  TaskState *ts = cs->opaque;
>                  uint32_t opcode;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index e6b1c36..c23df1b 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6074,6 +6074,10 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
>          env->v7m.cfsr |= R_V7M_CFSR_UNDEFINSTR_MASK;
>          return;
> +    case EXCP_NOCP:
> +        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
> +        env->v7m.cfsr |= R_V7M_CFSR_NOCP_MASK;
> +        return;
>      case EXCP_SWI:
>          /* The PC already points to the next instruction.  */
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC);
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index a7c2abe..493c627 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -10217,6 +10217,14 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
>          break;
>      case 6: case 7: case 14: case 15:
>          /* Coprocessor.  */
> +        if (arm_dc_feature(s, ARM_FEATURE_M)) {
> +            /* We don't currently implement M profile FP support,
> +             * so this entire space should give a NOCP fault.
> +             */
> +            gen_exception_insn(s, 4, EXCP_NOCP, syn_uncategorized(),
> +                               default_exception_el(s));
> +            break;
> +        }
>          if (((insn >> 24) & 3) == 3) {
>              /* Translate into the equivalent ARM encoding.  */
>              insn = (insn & 0xe2ffffff) | ((insn & (1 << 28)) >> 4) | (1 << 28);


--
Alex Bennée
