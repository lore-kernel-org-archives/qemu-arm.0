Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w198sm2322734wme.21.2017.07.12.02.41.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jul 2017 02:41:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 18C113E01A1;
	Wed, 12 Jul 2017 10:41:12 +0100 (BST)
References: <149942760788.8972.474351671751194003.stgit@frigg.lan> <149943378206.8972.1141843062606418973.stgit@frigg.lan>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Llu=C3=ADs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>, Richard Henderson <rth@twiddle.net>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v12 25/27] target/arm: [tcg] Port to disas_log
In-reply-to: <149943378206.8972.1141843062606418973.stgit@frigg.lan>
Date: Wed, 12 Jul 2017 10:41:12 +0100
Message-ID: <87tw2i801z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: UPO+oUcA4+e9


Lluís Vilanova <vilanova@ac.upc.edu> writes:

> Incrementally paves the way towards using the generic instruction translation
> loop.
>
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> Reviewed-by: Richard Henderson <rth@twiddle.net>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target/arm/translate.c |   13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 00cac01d66..5db381491f 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -12133,6 +12133,15 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>      }
>  }
>
> +static void arm_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
> +{
> +    DisasContext *dc = container_of(dcbase, DisasContext, base);
> +
> +    qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
> +    log_target_disas(cpu, dc->base.pc_first, dc->pc - dc->base.pc_first,
> +                     dc->thumb | (dc->sctlr_b << 1));
> +}
> +
>  /* generate intermediate code for basic block 'tb'.  */
>  void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
>  {
> @@ -12236,9 +12245,7 @@ done_generating:
>          qemu_log_in_addr_range(dc->base.pc_first)) {
>          qemu_log_lock();
>          qemu_log("----------------\n");
> -        qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
> -        log_target_disas(cs, dc->base.pc_first, dc->pc - dc->base.pc_first,
> -                         dc->thumb | (dc->sctlr_b << 1));
> +        arm_tr_disas_log(&dc->base, cs);
>          qemu_log("\n");
>          qemu_log_unlock();
>      }


--
Alex Bennée
