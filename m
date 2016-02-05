Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v191sm17452662wme.1.2016.02.05.06.09.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2016 06:09:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id A75443E025C;
	Fri,  5 Feb 2016 14:09:03 +0000 (GMT)
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org> <1454506721-11843-5-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.17; emacs 25.0.90.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-devel] [PATCH 4/7] target-arm: Update arm_generate_debug_exceptions() to handle EL2/EL3
In-reply-to: <1454506721-11843-5-git-send-email-peter.maydell@linaro.org>
Date: Fri, 05 Feb 2016 14:09:03 +0000
Message-ID: <87k2mjnta8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: LHZm5pxbVZXF


Peter Maydell <peter.maydell@linaro.org> writes:

> The arm_generate_debug_exceptions() function as originally implemented
> assumes no EL2 or EL3. Since we now have much more of an implementation
> of those now, fix this assumption.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu.h | 48 +++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 43 insertions(+), 5 deletions(-)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index cf2df50..0fb79d0 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1742,9 +1742,7 @@ typedef enum ARMASIdx {
>      ARMASIdx_S = 1,
>  } ARMASIdx;
>
> -/* Return the Exception Level targeted by debug exceptions;
> - * currently always EL1 since we don't implement EL2 or EL3.
> - */
> +/* Return the Exception Level targeted by debug exceptions. */
>  static inline int arm_debug_target_el(CPUARMState *env)
>  {
>      bool secure = arm_is_secure(env);
> @@ -1767,6 +1765,14 @@ static inline int arm_debug_target_el(CPUARMState *env)
>
>  static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
>  {
> +    if (arm_is_secure(env)) {
> +        /* MDCR_EL3.SDD disables debug events from Secure state */

Is it worth commenting that BRK still works?

> +        if (extract32(env->cp15.mdcr_el3,ctct 16, 1) != 0

The != 0 is superfluous here.

> +            || arm_current_el(env) == 3) {
> +            return false;
> +        }
> +    }
> +
>      if (arm_current_el(env) == arm_debug_target_el(env)) {
>          if ((extract32(env->cp15.mdscr_el1, 13, 1) == 0)
>              || (env->daif & PSTATE_D)) {
> @@ -1778,10 +1784,42 @@ static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
>
>  static inline bool aa32_generate_debug_exceptions(CPUARMState *env)
>  {
> -    if (arm_current_el(env) == 0 && arm_el_is_aa64(env, 1)) {
> +    int el = arm_current_el(env);
> +
> +    if (el == 0 && arm_el_is_aa64(env, 1)) {
>          return aa64_generate_debug_exceptions(env);
>      }
> -    return arm_current_el(env) != 2;
> +
> +    if (arm_is_secure(env)) {
> +        int spd;
> +
> +        if (el == 0 && (env->cp15.sder & 1)) {
> +            /* SDER.SUIDEN means debug exceptions from Secure EL0
> +             * are always enabled. Otherwise they are controlled by
> +             * SDCR.SPD like those from other Secure ELs.
> +             */
> +            return true;
> +        }
> +
> +        spd = extract32(env->cp15.mdcr_el3, 14, 2);
> +        switch (spd) {
> +        case 1:
> +            /* SPD == 0b01 is reserved, but behaves as 0b00. */
> +        case 0:
> +            /* For 0b00 we return true if external secure invasive debug
> +             * is enabled. On real hardware this is controlled by external
> +             * signals to the core. QEMU always permits debug, and behaves
> +             * as if DBGEN, SPIDEN, NIDEN and SPNIDEN are all tied high.
> +             */
> +            return true;
> +        case 2:
> +            return false;
> +        case 3:
> +            return true;
> +        }
> +    }
> +
> +    return el != 2;
>  }
>
>  /* Return true if debugging exceptions are currently enabled.

Otherwise:

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

--
Alex Bennée
