Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n71sm1411160wrb.62.2017.07.12.02.32.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jul 2017 02:32:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 0FB6B3E01BB;
	Wed, 12 Jul 2017 10:32:59 +0100 (BST)
References: <149942760788.8972.474351671751194003.stgit@frigg.lan> <149943205430.8972.17786409962934999706.stgit@frigg.lan>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Llu=C3=ADs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>, Richard Henderson <rth@twiddle.net>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v12 18/27] target/arm: [tcg,a64] Port to insn_start
In-reply-to: <149943205430.8972.17786409962934999706.stgit@frigg.lan>
Date: Wed, 12 Jul 2017 10:32:59 +0100
Message-ID: <87wp7e80fo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: NcvdNgJcxhLA


Lluís Vilanova <vilanova@ac.upc.edu> writes:

> Incrementally paves the way towards using the generic instruction translation
> loop.
>
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> Reviewed-by: Richard Henderson <rth@twiddle.net>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target/arm/translate-a64.c |   11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 5c04ff3d8b..dc91661df0 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -11247,6 +11247,14 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
>      init_tmp_a64_array(dc);
>  }
>
> +static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
> +{
> +    DisasContext *dc = container_of(dcbase, DisasContext, base);
> +
> +    dc->insn_start_idx = tcg_op_buf_count();
> +    tcg_gen_insn_start(dc->pc, 0, 0);
> +}
> +
>  void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
>                                 TranslationBlock *tb)
>  {
> @@ -11278,8 +11286,7 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
>
>      do {
>          dc->base.num_insns++;
> -        dc->insn_start_idx = tcg_op_buf_count();
> -        tcg_gen_insn_start(dc->pc, 0, 0);
> +        aarch64_tr_insn_start(&dc->base, cs);
>
>          if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
>              CPUBreakpoint *bp;


--
Alex Bennée
