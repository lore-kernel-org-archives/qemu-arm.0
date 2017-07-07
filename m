Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 9sm13628wml.25.2017.07.07.10.32.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jul 2017 10:32:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 81BE53E0157;
	Fri,  7 Jul 2017 18:32:02 +0100 (BST)
References: <20170707161822.29659-1-alex.bennee@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Etienne Carriere <etienne.carriere@linaro.org>, Joakim Bech <joakim.bech@linaro.org>, "Emilio G . Cota" <cota@braap.org>, Richard Henderson <rth@twiddle.net>
Subject: Re: [RFC PATCH] target/arm: ensure eret exits the run-loop
In-reply-to: <20170707161822.29659-1-alex.bennee@linaro.org>
Date: Fri, 07 Jul 2017 18:32:02 +0100
Message-ID: <87inj49mr1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: kep0yPbCTvOJ


Alex Bennée <alex.bennee@linaro.org> writes:

> Previously DISAS_JUMP did ensure this but with the optimisation of
> 8a6b28c7 (optimize indirect branches) we might not leave the loop.
> This means if any pending interrupts are cleared by changing IRQ flags
> we might never get around to servicing them. You usually notice this
> by seeing the lookup_tb_ptr() helper gainfully chaining TBs together
> while cpu->interrupt_request remains high and the exit_request has not
> been set.
>
> This breaks amongst other things the OPTEE test suite which executes
> an eret from the secure world after a non-secure world IRQ has gone
> pending which then never gets serviced.
>
> An alternate approach might be for the exception helpers to ensure the
> exit request flag is set if an IRQ is now unmasked.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> CC: Etienne Carriere <etienne.carriere@linaro.org>
> CC: Joakim Bech <joakim.bech@linaro.org>
> CC: Peter Maydell <peter.maydell@linaro.org>
> CC: Emilio G. Cota <cota@braap.org>
> CC: Richard Henderson <rth@twiddle.net>
> ---
>  target/arm/translate-a64.c | 3 ++-
>  target/arm/translate.c     | 6 ++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index e55547d95d..3ee88b2590 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1788,7 +1788,8 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
>              return;
>          }
>          gen_helper_exception_return(cpu_env);
> -        s->is_jmp = DISAS_JUMP;
> +        /* Must exit loop to check un-masked IRQs */
> +        s->is_jmp = DISAS_EXIT;

Given the wording of:

/* is_jmp field values */
#define DISAS_NEXT    0 /* next instruction can be analyzed */
#define DISAS_JUMP    1 /* only pc was modified dynamically */
#define DISAS_UPDATE  2 /* cpu state was modified dynamically */
#define DISAS_TB_JUMP 3 /* only pc was modified statically */

I'm thinking that really these DISAS_JUMP's should be DISAS_UPDATEs and
we need to disable the TB chaining optimisations for this. I'll prepare
a more comprehensive series next week. However testing this patch for
known failure modes will be useful.


>          return;
>      case 5: /* DRPS */
>          if (rn != 0x1f) {
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 0862f9e4aa..920fb41395 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -4475,7 +4475,8 @@ static void gen_rfe(DisasContext *s, TCGv_i32 pc, TCGv_i32 cpsr)
>       */
>      gen_helper_cpsr_write_eret(cpu_env, cpsr);
>      tcg_temp_free_i32(cpsr);
> -    s->is_jmp = DISAS_JUMP;
> +    /* Must exit loop to check un-masked IRQs */
> +    s->is_jmp = DISAS_EXIT;
>  }
>
>  /* Generate an old-style exception return. Marks pc as dead. */
> @@ -9519,7 +9520,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>                      tmp = load_cpu_field(spsr);
>                      gen_helper_cpsr_write_eret(cpu_env, tmp);
>                      tcg_temp_free_i32(tmp);
> -                    s->is_jmp = DISAS_JUMP;
> +                    /* Must exit loop to check un-masked IRQs */
> +                    s->is_jmp = DISAS_EXIT;
>                  }
>              }
>              break;


--
Alex Bennée
