Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o200sm1116244wmg.22.2017.06.14.03.38.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2017 03:38:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id DA35C3E01B1;
	Wed, 14 Jun 2017 11:38:59 +0100 (BST)
References: <20170609170100.3599-1-alex.bennee@linaro.org> <20170609170100.3599-4-alex.bennee@linaro.org> <fc351edb-7c08-c341-d8ee-85f6768e4931@twiddle.net> <87vao4b4z5.fsf@linaro.org> <9776b437-90b4-f2c2-4a0c-c1c6585379bf@twiddle.net> <20170611050730.GA12317@flamenco> <20170613225352.GA26288@flamenco>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: Richard Henderson <rth@twiddle.net>, peter.maydell@linaro.org, pbonzini@redhat.com, edgar.iglesias@xilinx.com, qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH] target/aarch64: exit to main loop after handling MSR
In-reply-to: <20170613225352.GA26288@flamenco>
Date: Wed, 14 Jun 2017 11:38:59 +0100
Message-ID: <87shj2j1ks.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 9cPQ9gYDwQT5


Emilio G. Cota <cota@braap.org> writes:

> The appended fixes it for me. Can you please test?
> [ apply with `git am --scissors' ]
>
> Thanks,
>
> 		Emilio
>
> ---- 8< ----
>
> Commit e75449a3 ("target/aarch64: optimize indirect branches") causes
> a regression by which aarch64 guests freeze under TCG with -smp > 1,
> even with `-accel accel=tcg,thread=single' (i.e. MTTCG disabled).
>
> I isolated the problem to the MSR handler. This patch forces an exit
> after the handler is executed, which fixes the regression.
>
> Signed-off-by: Emilio G. Cota <cota@braap.org>

Tested-by: Alex Bennée <alex.bennee@linaro.org>

But what exactly is the mechanism here? DISAS_UPDATE should have ensured
that the PC was updated before we get to the helper. Is this a case of
msr_i_pstate somehow getting missed or not causing a flag update which
confuses the next TB calculation?

> ---
>  target/arm/translate-a64.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 860e279..5a609a0 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1422,7 +1422,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
>          gen_helper_msr_i_pstate(cpu_env, tcg_op, tcg_imm);
>          tcg_temp_free_i32(tcg_imm);
>          tcg_temp_free_i32(tcg_op);
> -        s->is_jmp = DISAS_UPDATE;
> +        s->is_jmp = DISAS_EXIT;
>          break;
>      }
>      default:
> @@ -11362,6 +11362,10 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
>          case DISAS_NEXT:
>              gen_goto_tb(dc, 1, dc->pc);
>              break;
> +        case DISAS_EXIT:
> +            gen_a64_set_pc_im(dc->pc);
> +            tcg_gen_exit_tb(0);
> +            break;
>          default:
>          case DISAS_UPDATE:
>              gen_a64_set_pc_im(dc->pc);


--
Alex Bennée
