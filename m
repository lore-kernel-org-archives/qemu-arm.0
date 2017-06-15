Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o65sm1623101wmo.19.2017.06.15.01.30.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jun 2017 01:30:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 0CC283E0219;
	Thu, 15 Jun 2017 09:30:44 +0100 (BST)
References: <20170614194821.8754-1-rth@twiddle.net> <20170614194821.8754-6-rth@twiddle.net>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-devel@nongnu.org, cota@braap.org, pbonzini@redhat.com, qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 5/5] target/arm: Exit after clearing interrupt mask
In-reply-to: <20170614194821.8754-6-rth@twiddle.net>
Date: Thu, 15 Jun 2017 09:30:44 +0100
Message-ID: <87y3stmz4b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: Duo32lEbWC/4


Richard Henderson <rth@twiddle.net> writes:

> Exit to cpu loop so we reevaluate cpu_arm_hw_interrupts.
>
> Cc: qemu-arm@nongnu.org
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <rth@twiddle.net>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target/arm/translate-a64.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 860e279..e55547d 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1422,7 +1422,9 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
>          gen_helper_msr_i_pstate(cpu_env, tcg_op, tcg_imm);
>          tcg_temp_free_i32(tcg_imm);
>          tcg_temp_free_i32(tcg_op);
> -        s->is_jmp = DISAS_UPDATE;
> +        /* For DAIFClear, exit the cpu loop to re-evaluate pending IRQs.  */
> +        gen_a64_set_pc_im(s->pc);
> +        s->is_jmp = (op == 0x1f ? DISAS_EXIT : DISAS_JUMP);
>          break;
>      }
>      default:
> @@ -11369,6 +11371,9 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
>          case DISAS_JUMP:
>              tcg_gen_lookup_and_goto_ptr(cpu_pc);
>              break;
> +        case DISAS_EXIT:
> +            tcg_gen_exit_tb(0);
> +            break;
>          case DISAS_TB_JUMP:
>          case DISAS_EXC:
>          case DISAS_SWI:


--
Alex Bennée
