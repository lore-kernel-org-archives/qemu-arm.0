Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a75sm1531658wme.18.2016.04.21.06.18.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Apr 2016 06:18:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id F1BBC3E00A6;
	Thu, 21 Apr 2016 14:18:22 +0100 (BST)
References: <1461186921-14977-1-git-send-email-sergey.fedorov@linaro.org> <1461186921-14977-10-git-send-email-sergey.fedorov@linaro.org>
User-agent: mu4e 0.9.17; emacs 25.0.92.6
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sergey Fedorov <sergey.fedorov@linaro.org>
Cc: qemu-devel@nongnu.org, Sergey Fedorov <serge.fdrv@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>, Peter Maydell <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@suse.de>, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 09/10] tcg: Clean up direct block chaining safety checks
In-reply-to: <1461186921-14977-10-git-send-email-sergey.fedorov@linaro.org>
Date: Thu, 21 Apr 2016 14:18:22 +0100
Message-ID: <87y487t80x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 2QXQAEOBqKFO


Sergey Fedorov <sergey.fedorov@linaro.org> writes:

> From: Sergey Fedorov <serge.fdrv@gmail.com>
>
> We don't take care of direct jumps when address mapping changes. Thus we
> must be sure to generate direct jumps so that they always keep valid
> even if address mapping changes. Luckily, we can only allow to execute a
> TB if it was generated from the pages which match with current mapping.
>
> Document tcg_gen_goto_tb() declaration and note the reason for
> destination PC limitations.
>
> Some targets with variable length instructions allow TB to straddle a
> page boundary. However, we make sure that both of TB pages match the
> current address mapping when looking up TBs. So it is safe to do direct
> jumps into the both pages. Correct the checks for some of those targets.
>
> Given that, we can safely patch a TB which spans two pages. Remove the
> unnecessary check in cpu_exec() and allow such TBs to be patched.
>
> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
> Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
> ---
>
> Changes in v4:
>  * Documented tcg_gen_goto_tb() declaration
>  * Destination PC check explanatory comments moved to tcg_gen_goto_tb()
>    declaration comment
>  * Updated commit message
>
>  cpu-exec.c               |  7 ++-----
>  target-arm/translate.c   |  3 ++-
>  target-cris/translate.c  |  4 +++-
>  target-i386/translate.c  |  2 +-
>  target-m68k/translate.c  |  2 +-
>  target-s390x/translate.c |  2 +-
>  tcg/tcg-op.h             | 10 ++++++++++
>  7 files changed, 20 insertions(+), 10 deletions(-)
>
> diff --git a/cpu-exec.c b/cpu-exec.c
> index bbfcbfb54385..065cc9159477 100644
> --- a/cpu-exec.c
> +++ b/cpu-exec.c
> @@ -508,11 +508,8 @@ int cpu_exec(CPUState *cpu)
>                      next_tb = 0;
>                      tcg_ctx.tb_ctx.tb_invalidated_flag = 0;
>                  }
> -                /* see if we can patch the calling TB. When the TB
> -                   spans two pages, we cannot safely do a direct
> -                   jump. */
> -                if (next_tb != 0 && tb->page_addr[1] == -1
> -                    && !qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
> +                /* See if we can patch the calling TB. */
> +                if (next_tb != 0 &&
> !qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {

A pointer to the definitive comment helps ;-)

                /* See if we can patch the calling TB, see tcg_gen_goto_tb */

>                      tb_add_jump((TranslationBlock *)(next_tb & ~TB_EXIT_MASK),
>                                  next_tb & TB_EXIT_MASK, tb);
>                  }
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 940ec8d981d1..34196a821772 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -4054,7 +4054,8 @@ static inline void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
>      TranslationBlock *tb;
>
>      tb = s->tb;
> -    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
> +    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
> +        ((s->pc - 1) & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
>          tcg_gen_goto_tb(n);
>          gen_set_pc_im(s, dest);
>          tcg_gen_exit_tb((uintptr_t)tb + n);
> diff --git a/target-cris/translate.c b/target-cris/translate.c
> index a73176c118b0..9c8ff8f2308a 100644
> --- a/target-cris/translate.c
> +++ b/target-cris/translate.c
> @@ -524,7 +524,9 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
>  {
>      TranslationBlock *tb;
>      tb = dc->tb;
> -    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
> +
> +    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
> +        (dc->ppc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_tl(env_pc, dest);
>                  tcg_gen_exit_tb((uintptr_t)tb + n);
> diff --git a/target-i386/translate.c b/target-i386/translate.c
> index 1a1214dcb12e..cb725b41c37d 100644
> --- a/target-i386/translate.c
> +++ b/target-i386/translate.c
> @@ -2094,7 +2094,7 @@ static inline void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
>      tb = s->tb;
>      /* NOTE: we handle the case where the TB spans two pages here */
>      if ((pc & TARGET_PAGE_MASK) == (tb->pc & TARGET_PAGE_MASK) ||
> -        (pc & TARGET_PAGE_MASK) == ((s->pc - 1) & TARGET_PAGE_MASK))  {
> +        (pc & TARGET_PAGE_MASK) == (s->pc_start & TARGET_PAGE_MASK))  {
>          /* jump to same page: we can use a direct jump */
>          tcg_gen_goto_tb(tb_num);
>          gen_jmp_im(eip);
> diff --git a/target-m68k/translate.c b/target-m68k/translate.c
> index 7560c3a80841..e2ce6c615e07 100644
> --- a/target-m68k/translate.c
> +++ b/target-m68k/translate.c
> @@ -861,7 +861,7 @@ static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
>      if (unlikely(s->singlestep_enabled)) {
>          gen_exception(s, dest, EXCP_DEBUG);
>      } else if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
> -               (s->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
> +               (s->insn_pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_i32(QREG_PC, dest);
>          tcg_gen_exit_tb((uintptr_t)tb + n);
> diff --git a/target-s390x/translate.c b/target-s390x/translate.c
> index c871ef2bb302..c5179fe05d7e 100644
> --- a/target-s390x/translate.c
> +++ b/target-s390x/translate.c
> @@ -610,7 +610,7 @@ static int use_goto_tb(DisasContext *s, uint64_t dest)
>  {
>      /* NOTE: we handle the case where the TB spans two pages here */
>      return (((dest & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK)
> -             || (dest & TARGET_PAGE_MASK) == ((s->pc - 1) & TARGET_PAGE_MASK))
> +             || (dest & TARGET_PAGE_MASK) == (s->pc & TARGET_PAGE_MASK))
>              && !s->singlestep_enabled
>              && !(s->tb->cflags & CF_LAST_IO)
>              && !(s->tb->flags & FLAG_MASK_PER));
> diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
> index c446d3dc7293..ace39619ef89 100644
> --- a/tcg/tcg-op.h
> +++ b/tcg/tcg-op.h
> @@ -753,6 +753,16 @@ static inline void tcg_gen_exit_tb(uintptr_t val)
>      tcg_gen_op1i(INDEX_op_exit_tb, val);
>  }
>
> +/**
> + * tcg_gen_goto_tb() - output goto_tb TCG operation
> + * @idx: Direct jump slot index (0 or 1)
> + *
> + * See tcg/README for more info about this TCG operation.
> + *
> + * NOTE: Direct jumps with goto_tb are only safe within the pages this TB
> + * resides in because we don't take care of direct jumps when address mapping
> + * changes, e.g. in tlb_flush().
> + */
>  void tcg_gen_goto_tb(unsigned idx);
>
>  #if TARGET_LONG_BITS == 32

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

--
Alex Bennée
