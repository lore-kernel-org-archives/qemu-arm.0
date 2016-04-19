Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f8sm11470700wjm.13.2016.04.19.04.37.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Apr 2016 04:37:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 003083E0312;
	Tue, 19 Apr 2016 12:37:03 +0100 (BST)
References: <1460324732-30330-1-git-send-email-sergey.fedorov@linaro.org> <1460324732-30330-10-git-send-email-sergey.fedorov@linaro.org>
User-agent: mu4e 0.9.17; emacs 25.0.92.6
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sergey Fedorov <sergey.fedorov@linaro.org>
Cc: qemu-devel@nongnu.org, Sergey Fedorov <serge.fdrv@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>, Peter Maydell <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, Michael Walle <michael@walle.cc>, Aurelien Jarno <aurelien@aurel32.net>, Leon Alrae <leon.alrae@imgtec.com>, Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>, Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v3 09/10] tcg: Clean up direct block chaining safety checks
In-reply-to: <1460324732-30330-10-git-send-email-sergey.fedorov@linaro.org>
Date: Tue, 19 Apr 2016 12:37:03 +0100
Message-ID: <878u09x21s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: ynLdNnRF8ISD


Sergey Fedorov <sergey.fedorov@linaro.org> writes:

> From: Sergey Fedorov <serge.fdrv@gmail.com>
>
> We don't take care of direct jumps when address mapping changes. Thus we
> must be sure to generate direct jumps so that they always keep valid
> even if address mapping changes. However we only allow to execute a TB
> if it was generated from the pages which match with current mapping.
>
> Document in comments in the translation code the reason for these checks
> on a destination PC.
>
> Some targets with variable length instructions allow TB to straddle a
> page boundary. However, we make sure that both TB pages match the
> current address mapping when looking up TBs. So it is safe to do direct
> jumps into both pages. Correct the checks for those targets.
>
> Given that, we can safely patch a TB which spans two pages. Remove the
> unnecessary check in cpu_exec() and allow such TBs to be patched.
>
> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
> Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
> ---
>  cpu-exec.c                    | 7 ++-----
>  target-alpha/translate.c      | 5 ++++-
>  target-arm/translate-a64.c    | 5 ++++-
>  target-arm/translate.c        | 7 ++++++-
>  target-cris/translate.c       | 8 +++++++-
>  target-i386/translate.c       | 7 +++++--
>  target-lm32/translate.c       | 4 ++++
>  target-m68k/translate.c       | 6 +++++-
>  target-microblaze/translate.c | 4 ++++
>  target-mips/translate.c       | 4 ++++
>  target-moxie/translate.c      | 4 ++++
>  target-openrisc/translate.c   | 4 ++++
>  target-ppc/translate.c        | 4 ++++
>  target-s390x/translate.c      | 9 ++++++---
>  target-sh4/translate.c        | 4 ++++
>  target-sparc/translate.c      | 4 ++++
>  target-tricore/translate.c    | 4 ++++
>  target-unicore32/translate.c  | 4 ++++
>  target-xtensa/translate.c     | 8 ++++++++
>  19 files changed, 87 insertions(+), 15 deletions(-)
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
> +                if (next_tb != 0 && !qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
>                      tb_add_jump((TranslationBlock *)(next_tb & ~TB_EXIT_MASK),
>                                  next_tb & TB_EXIT_MASK, tb);
>                  }

We've already discussed on IRC the confusion of next_tb ;-)

> diff --git a/target-alpha/translate.c b/target-alpha/translate.c
> index 5b86992dd367..5fa66309ce2e 100644
> --- a/target-alpha/translate.c
> +++ b/target-alpha/translate.c
> @@ -464,7 +464,10 @@ static bool use_goto_tb(DisasContext *ctx, uint64_t dest)
>      if (in_superpage(ctx, dest)) {
>          return true;
>      }
> -    /* Check for the dest on the same page as the start of the TB.  */
> +    /* Direct jumps with goto_tb are only safe within the page this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */

I'm all for harmonising the comments but I think for the common case we
could refer to a central location for the page linking rules and only
expand the comment for subtle differences between the front ends.

>      return ((ctx->tb->pc ^ dest) & TARGET_PAGE_MASK) == 0;
>  }
>
> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
> index b13cff756ad1..bf8471c7fa99 100644
> --- a/target-arm/translate-a64.c
> +++ b/target-arm/translate-a64.c
> @@ -274,7 +274,10 @@ static inline bool use_goto_tb(DisasContext *s, int n, uint64_t dest)
>          return false;
>      }
>
> -    /* Only link tbs from inside the same guest page */
> +    /* Direct jumps with goto_tb are only safe within the page this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
>      if ((s->tb->pc & TARGET_PAGE_MASK) != (dest & TARGET_PAGE_MASK)) {
>          return false;
>      }
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 940ec8d981d1..aeb3e84e8d40 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -4054,7 +4054,12 @@ static inline void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
>      TranslationBlock *tb;
>
>      tb = s->tb;
> -    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
> +    /* Direct jumps with goto_tb are only safe within the pages this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
> +    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
> +        ((s->pc - 1) & TARGET_PAGE_MASK) == (dest &
> TARGET_PAGE_MASK)) {

Isn't this check avoided by the fact the translate loop bails on end_of_page?

>          tcg_gen_goto_tb(n);
>          gen_set_pc_im(s, dest);
>          tcg_gen_exit_tb((uintptr_t)tb + n);
> diff --git a/target-cris/translate.c b/target-cris/translate.c
> index a73176c118b0..7acac076167e 100644
> --- a/target-cris/translate.c
> +++ b/target-cris/translate.c
> @@ -524,7 +524,13 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
>  {
>      TranslationBlock *tb;
>      tb = dc->tb;
> -    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
> +
> +    /* Direct jumps with goto_tb are only safe within the pages this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
> +    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
> +        (dc->ppc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_tl(env_pc, dest);
>                  tcg_gen_exit_tb((uintptr_t)tb + n);
> diff --git a/target-i386/translate.c b/target-i386/translate.c
> index 1a1214dcb12e..d0f440fc7697 100644
> --- a/target-i386/translate.c
> +++ b/target-i386/translate.c
> @@ -2092,9 +2092,12 @@ static inline void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
>
>      pc = s->cs_base + eip;
>      tb = s->tb;
> -    /* NOTE: we handle the case where the TB spans two pages here */
> +    /* Direct jumps with goto_tb are only safe within the pages this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
>      if ((pc & TARGET_PAGE_MASK) == (tb->pc & TARGET_PAGE_MASK) ||
> -        (pc & TARGET_PAGE_MASK) == ((s->pc - 1) & TARGET_PAGE_MASK))  {
> +        (pc & TARGET_PAGE_MASK) == (s->pc_start & TARGET_PAGE_MASK))  {
>          /* jump to same page: we can use a direct jump */
>          tcg_gen_goto_tb(tb_num);
>          gen_jmp_im(eip);
> diff --git a/target-lm32/translate.c b/target-lm32/translate.c
> index 256a51f8498f..18d648ffc729 100644
> --- a/target-lm32/translate.c
> +++ b/target-lm32/translate.c
> @@ -138,6 +138,10 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
>      TranslationBlock *tb;
>
>      tb = dc->tb;
> +    /* Direct jumps with goto_tb are only safe within the page this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
>      if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
>              likely(!dc->singlestep_enabled)) {
>          tcg_gen_goto_tb(n);
> diff --git a/target-m68k/translate.c b/target-m68k/translate.c
> index 7560c3a80841..282da60cbcca 100644
> --- a/target-m68k/translate.c
> +++ b/target-m68k/translate.c
> @@ -861,7 +861,11 @@ static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
>      if (unlikely(s->singlestep_enabled)) {
>          gen_exception(s, dest, EXCP_DEBUG);
>      } else if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
> -               (s->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
> +               (s->insn_pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
> +        /* Direct jumps with goto_tb are only safe within the page this TB
> +         * resides in because we don't take care of direct jumps when address
> +         * mapping changes.
> +         */
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_i32(QREG_PC, dest);
>          tcg_gen_exit_tb((uintptr_t)tb + n);
> diff --git a/target-microblaze/translate.c b/target-microblaze/translate.c
> index f944965a14e1..6028750ba7de 100644
> --- a/target-microblaze/translate.c
> +++ b/target-microblaze/translate.c
> @@ -128,6 +128,10 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
>  {
>      TranslationBlock *tb;
>      tb = dc->tb;
> +    /* Direct jumps with goto_tb are only safe within the page this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
>      if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_tl(cpu_SR[SR_PC], dest);
> diff --git a/target-mips/translate.c b/target-mips/translate.c
> index a3a05ec66dd2..37b834d2df59 100644
> --- a/target-mips/translate.c
> +++ b/target-mips/translate.c
> @@ -4195,6 +4195,10 @@ static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>  {
>      TranslationBlock *tb;
>      tb = ctx->tb;
> +    /* Direct jumps with goto_tb are only safe within the page this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
>      if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
>          likely(!ctx->singlestep_enabled)) {
>          tcg_gen_goto_tb(n);
> diff --git a/target-moxie/translate.c b/target-moxie/translate.c
> index a437e2ab6026..fb99038399fa 100644
> --- a/target-moxie/translate.c
> +++ b/target-moxie/translate.c
> @@ -127,6 +127,10 @@ static inline void gen_goto_tb(CPUMoxieState *env, DisasContext *ctx,
>      TranslationBlock *tb;
>      tb = ctx->tb;
>
> +    /* Direct jumps with goto_tb are only safe within the page this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
>      if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
>          !ctx->singlestep_enabled) {
>          tcg_gen_goto_tb(n);
> diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
> index 5d0ab442a872..da60fae26a75 100644
> --- a/target-openrisc/translate.c
> +++ b/target-openrisc/translate.c
> @@ -194,6 +194,10 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
>  {
>      TranslationBlock *tb;
>      tb = dc->tb;
> +    /* Direct jumps with goto_tb are only safe within the page this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
>      if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
>                                         likely(!dc->singlestep_enabled)) {
>          tcg_gen_movi_tl(cpu_pc, dest);
> diff --git a/target-ppc/translate.c b/target-ppc/translate.c
> index 6f0e7b4face6..92ded8ec433b 100644
> --- a/target-ppc/translate.c
> +++ b/target-ppc/translate.c
> @@ -3832,6 +3832,10 @@ static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>      if (NARROW_MODE(ctx)) {
>          dest = (uint32_t) dest;
>      }
> +    /* Direct jumps with goto_tb are only safe within the page this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
>      if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
>          likely(!ctx->singlestep_enabled)) {
>          tcg_gen_goto_tb(n);
> diff --git a/target-s390x/translate.c b/target-s390x/translate.c
> index c871ef2bb302..9f6ae60622b2 100644
> --- a/target-s390x/translate.c
> +++ b/target-s390x/translate.c
> @@ -608,9 +608,12 @@ static void gen_op_calc_cc(DisasContext *s)
>
>  static int use_goto_tb(DisasContext *s, uint64_t dest)
>  {
> -    /* NOTE: we handle the case where the TB spans two pages here */
> -    return (((dest & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK)
> -             || (dest & TARGET_PAGE_MASK) == ((s->pc - 1) & TARGET_PAGE_MASK))
> +    /* Direct jumps with goto_tb are only safe within the pages this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
> +    return (((dest & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK) ||
> +             (dest & TARGET_PAGE_MASK) == (s->pc & TARGET_PAGE_MASK))
>              && !s->singlestep_enabled
>              && !(s->tb->cflags & CF_LAST_IO)
>              && !(s->tb->flags & FLAG_MASK_PER));
> diff --git a/target-sh4/translate.c b/target-sh4/translate.c
> index 7c189680a7a4..660692d06090 100644
> --- a/target-sh4/translate.c
> +++ b/target-sh4/translate.c
> @@ -210,6 +210,10 @@ static void gen_goto_tb(DisasContext * ctx, int n, target_ulong dest)
>      TranslationBlock *tb;
>      tb = ctx->tb;
>
> +    /* Direct jumps with goto_tb are only safe within the pages this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
>      if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
>  	!ctx->singlestep_enabled) {
>  	/* Use a direct jump if in same page and singlestep not enabled */
> diff --git a/target-sparc/translate.c b/target-sparc/translate.c
> index 58572c34cf3e..d09a500e8bd4 100644
> --- a/target-sparc/translate.c
> +++ b/target-sparc/translate.c
> @@ -309,6 +309,10 @@ static inline void gen_goto_tb(DisasContext *s, int tb_num,
>      TranslationBlock *tb;
>
>      tb = s->tb;
> +    /* Direct jumps with goto_tb are only safe within the pages this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
>      if ((pc & TARGET_PAGE_MASK) == (tb->pc & TARGET_PAGE_MASK) &&
>          (npc & TARGET_PAGE_MASK) == (tb->pc & TARGET_PAGE_MASK) &&
>          !s->singlestep)  {
> diff --git a/target-tricore/translate.c b/target-tricore/translate.c
> index 912bf226bedc..b67154a3f410 100644
> --- a/target-tricore/translate.c
> +++ b/target-tricore/translate.c
> @@ -3240,6 +3240,10 @@ static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>  {
>      TranslationBlock *tb;
>      tb = ctx->tb;
> +    /* Direct jumps with goto_tb are only safe within the pages this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
>      if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
>          likely(!ctx->singlestep_enabled)) {
>          tcg_gen_goto_tb(n);
> diff --git a/target-unicore32/translate.c b/target-unicore32/translate.c
> index 39af3af05f15..04dcbb0bb466 100644
> --- a/target-unicore32/translate.c
> +++ b/target-unicore32/translate.c
> @@ -1094,6 +1094,10 @@ static inline void gen_goto_tb(DisasContext *s, int n, uint32_t dest)
>      TranslationBlock *tb;
>
>      tb = s->tb;
> +    /* Direct jumps with goto_tb are only safe within the page this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
>      if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
>          tcg_gen_goto_tb(n);
>          gen_set_pc_im(dest);
> diff --git a/target-xtensa/translate.c b/target-xtensa/translate.c
> index 989448846902..7eeb279e5030 100644
> --- a/target-xtensa/translate.c
> +++ b/target-xtensa/translate.c
> @@ -418,6 +418,10 @@ static void gen_jump(DisasContext *dc, TCGv dest)
>  static void gen_jumpi(DisasContext *dc, uint32_t dest, int slot)
>  {
>      TCGv_i32 tmp = tcg_const_i32(dest);
> +    /* Direct jumps with goto_tb are only safe within the pages this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
>      if (((dc->tb->pc ^ dest) & TARGET_PAGE_MASK) != 0) {
>          slot = -1;
>      }
> @@ -446,6 +450,10 @@ static void gen_callw(DisasContext *dc, int callinc, TCGv_i32 dest)
>  static void gen_callwi(DisasContext *dc, int callinc, uint32_t dest, int slot)
>  {
>      TCGv_i32 tmp = tcg_const_i32(dest);
> +    /* Direct jumps with goto_tb are only safe within the pages this TB resides
> +     * in because we don't take care of direct jumps when address mapping
> +     * changes.
> +     */
>      if (((dc->tb->pc ^ dest) & TARGET_PAGE_MASK) != 0) {
>          slot = -1;
>      }


--
Alex Bennée
