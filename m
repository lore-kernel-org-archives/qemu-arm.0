Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5616604wre;
        Thu, 31 May 2018 00:33:02 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKLH7kX7IWIoANur2VYTOzQsAx97TCN0DBomKArh8kN5a7tIdiH6ftlcBl9/tdo8FgNS5Ml
X-Received: by 2002:a37:a8ce:: with SMTP id r197-v6mr5122583qke.93.1527751982166;
        Thu, 31 May 2018 00:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527751982; cv=none;
        d=google.com; s=arc-20160816;
        b=czFEXMis9SYRmWasC/Uw6F7n6Rzm9siiRval5lqcVgeMQimdSd2GlO+z/qNcMHlU7l
         ko9W08fwIjDv/APSCtCQG0xrI3Ed+y7TIPxzc+bOZygXRY8/IeHlC1kJ+qjx8bpZnwvC
         KCoWnFJu3qZuWHcyHsPYRbH30O7yDAa0QyOD6nAG+wQ0bQoN4YPjrAH1i54WCtcMc5/V
         H9A2iDpmYKH0AsO+Kb9b127O3OVGVQ5vsWFxJ/CWcktU0ocKy+dJ+ciOPWDAgDmj7l+U
         Mu451Z6iDlHQCFHW9aw3/uNyikMSylYD5FT14HZnleSzK0BhzBi+NSQsq5TYF8NwwUx8
         FP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=gWUScCsHgm4KkSDgzs+MRx9pfE8l3igwNUtbLxR9wr0=;
        b=qokUYZ1/ulShH2w2pkWpo+Fc/vEX80/HHHjmrRibfehRXPaFop8W+tYiRvA2qspyQz
         W0lDZVfcMfDiu8xzCqvebQw5xfn3dLGN3VnAisp8cA18uTB0JJq/kzdtEY9ZNfvgfFn7
         Do8PI4bDor64TRKNYUIg583OBLd9CnTfyWTrKCF+keEt1edFCVfoGEbXqL4p+VwitNh+
         E3qMvnae50k/Y8sncS9t+A5DQu4c0iz9H6qK/H0fnifz3BVBPnlhlw6mwRdo7X/GBSFY
         F3k43WZq8m6Gp+aCFXZIdwpgfSfZ80O7qM2x3xq6HXp+UseiqOlURJYHKLKeVr/qPBBP
         a4Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v24-v6si9337820qtp.358.2018.05.31.00.33.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 00:33:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOI4z-0005sd-Lh
	for alex.bennee@linaro.org; Thu, 31 May 2018 03:33:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fOI4g-0005sS-Gz
	for qemu-devel@nongnu.org; Thu, 31 May 2018 03:32:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fOI4c-0000Wa-Nx
	for qemu-devel@nongnu.org; Thu, 31 May 2018 03:32:42 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:37081)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1fOI4c-0000VO-3w; Thu, 31 May 2018 03:32:38 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0MI6Uo-1fKRlp2Ej0-003xP0; Thu, 31 May 2018 09:31:44 +0200
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20180531011321.3119-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <7c429a17-b463-b49f-de59-2ea277b1b0b8@vivier.eu>
Date: Thu, 31 May 2018 09:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180531011321.3119-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:73cx9SF3W3Q6wYa5TFZOeMqPcV7rCnG6tjvzuJ5PNPEp+OJnfJd
	QLzqn5j5lVVHyP14EBrGcMLDnWoHefDQYaKStKsGku+f+hFk+oo9fKXF/fbRDKl4iLi+nQ7
	q0Svhp1FZTcMh5JW6WgIfVPU60yNlxlhP3W77dxhUAVjl7wmJTth23cRGkowwXUEbGGH7pp
	Qud73LBsyn9XMssdGAc5w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:MhTDENy3dcw=:Xzm9Wyw66H1axSnivbfaK2
	bWB5UWPCem+7pvRhnsD72vEXbFOpygo4CHfEJiL4njMvY39xrHd0hwxQHf4fpBFy55dmMfAC8
	+HivVwjSGdupQghE6DC96xBtgnTYoalXkzmy4pmk33JolgSpSH2qhpLYGddH4vMPqSl/A+KJs
	VjVjNdpVQbBkOw4hzw7YkZND9MldjedS8QP9HncO8PqAID6ejb6vqpcWpqyXvLQuwHkKqB1ve
	HiFitNIWxwt0ubv3laWqWB4mSj+lHpbVYcuYZzD2fuY5CrkiwHicocWgnUsdMrN/tbDZt+YVc
	588g8Cp1s8RKoqcbuU5eP+oNk4gl/EuMjF5eGZj7RFgBsFet8g3jVEPwmDN98YZSIAhLLDd08
	MgC2t/0B2w0nKenafjus2bfZFJOfG+8PMwrAws3di1l3fsMrUQueBEgd2KnUKgP9hIi5jYft5
	CoN+/eyfx7grefC6mYv09PHCu0J8CQJMceE6hCiO/Qlgc1V7+qYCNPWfBtRimRXhaH+E42x6l
	RmARwN29CdZg7H8Bod+U7H40d3EQ/pzdokTpfmmQGFAj5zcNpSrN6pdExBEFmL/0bjaKbCDJY
	GS3I+/zkouqAacYnBbKll/nEYJNgkmt56o/Wr7Cgx9himnBwRBVYZuEjf8iR14pJfZNUwi+Q9
	4JPCBmJ0Xhbar5bt25Ptte//fRvI5VrRZYss3bu9oqLfpy0aMfffcsJRBewIspFRB8kSNQ+4g
	J7le9gz16VA8+4Gj
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-devel] [PATCH] tcg: Pass tb and index to tcg_gen_exit_tb
 separately
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Alexander Graf <agraf@suse.de>, Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Michael Walle <michael@walle.cc>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZUWeJ/tWv3Ww

Le 31/05/2018 à 03:13, Richard Henderson a écrit :
> Do the cast to uintptr_t within the helper, so that the compiler
> can type check the pointer argument.  We can also do some more
> sanity checking of the index argument.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/gen-icount.h     |  2 +-
>  tcg/tcg-op.h                  | 17 +++++++++++++----
>  target/alpha/translate.c      | 12 ++++++------
>  target/arm/translate-a64.c    |  6 +++---
>  target/arm/translate.c        |  8 ++++----
>  target/cris/translate.c       |  6 +++---
>  target/hppa/translate.c       |  6 +++---
>  target/i386/translate.c       |  8 ++++----
>  target/lm32/translate.c       |  6 +++---
>  target/m68k/translate.c       |  6 +++---
>  target/microblaze/translate.c |  6 +++---
>  target/mips/translate.c       |  4 ++--
>  target/moxie/translate.c      | 14 +++++++-------
>  target/nios2/translate.c      |  8 ++++----
>  target/openrisc/translate.c   |  6 +++---
>  target/ppc/translate.c        |  4 ++--
>  target/riscv/translate.c      | 20 ++++++++++----------
>  target/s390x/translate.c      | 10 +++++-----
>  target/sh4/translate.c        |  8 ++++----
>  target/sparc/translate.c      | 16 ++++++++--------
>  target/tilegx/translate.c     |  4 ++--
>  target/tricore/translate.c    | 20 ++++++++++----------
>  target/unicore32/translate.c  |  6 +++---
>  target/xtensa/translate.c     |  4 ++--
>  tcg/tcg-op.c                  | 20 +++++++++++++++++++-
>  25 files changed, 127 insertions(+), 100 deletions(-)
> 
> diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
> index 54aaa61d65..24f7991781 100644
> --- a/include/exec/gen-icount.h
> +++ b/include/exec/gen-icount.h
> @@ -52,7 +52,7 @@ static inline void gen_tb_end(TranslationBlock *tb, int num_insns)
>      }
>  
>      gen_set_label(tcg_ctx->exitreq_label);
> -    tcg_gen_exit_tb((uintptr_t)tb + TB_EXIT_REQUESTED);
> +    tcg_gen_exit_tb(tb, TB_EXIT_REQUESTED);
>  }
>  
>  static inline void gen_io_start(void)
> diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
> index 04eb3e9e17..7513c1eb7c 100644
> --- a/tcg/tcg-op.h
> +++ b/tcg/tcg-op.h
> @@ -782,10 +782,19 @@ static inline void tcg_gen_insn_start(target_ulong pc, target_ulong a1,
>  # error "Unhandled number of operands to insn_start"
>  #endif
>  
> -static inline void tcg_gen_exit_tb(uintptr_t val)
> -{
> -    tcg_gen_op1i(INDEX_op_exit_tb, val);
> -}
> +/**
> + * tcg_gen_exit_tb() - output exit_tb TCG operation
> + * @tb: The TranslationBlock from which we are exiting
> + * @idx: Direct jump slot index, or exit request
> + *
> + * See tcg/README for more info about this TCG operation.
> + * See also tcg.h and the block comment above TB_EXIT_MASK.
> + *
> + * For a normal exit from the TB, back to the main loop, @tb should
> + * be NULL and @idx should be 0.  Otherwise, @tb should be valid and
> + * @idx should be one of the TB_EXIT_ values.
> + */
> +void tcg_gen_exit_tb(TranslationBlock *tb, unsigned idx);
>  
>  /**
>   * tcg_gen_goto_tb() - output goto_tb TCG operation
> diff --git a/target/alpha/translate.c b/target/alpha/translate.c
> index 15eca71d49..e5d62850c5 100644
> --- a/target/alpha/translate.c
> +++ b/target/alpha/translate.c
> @@ -488,7 +488,7 @@ static DisasJumpType gen_bdirect(DisasContext *ctx, int ra, int32_t disp)
>      } else if (use_goto_tb(ctx, dest)) {
>          tcg_gen_goto_tb(0);
>          tcg_gen_movi_i64(cpu_pc, dest);
> -        tcg_gen_exit_tb((uintptr_t)ctx->base.tb);
> +        tcg_gen_exit_tb(ctx->base.tb, 0);
>          return DISAS_NORETURN;
>      } else {
>          tcg_gen_movi_i64(cpu_pc, dest);
> @@ -507,12 +507,12 @@ static DisasJumpType gen_bcond_internal(DisasContext *ctx, TCGCond cond,
>  
>          tcg_gen_goto_tb(0);
>          tcg_gen_movi_i64(cpu_pc, ctx->base.pc_next);
> -        tcg_gen_exit_tb((uintptr_t)ctx->base.tb);
> +        tcg_gen_exit_tb(ctx->base.tb, 0);
>  
>          gen_set_label(lab_true);
>          tcg_gen_goto_tb(1);
>          tcg_gen_movi_i64(cpu_pc, dest);
> -        tcg_gen_exit_tb((uintptr_t)ctx->base.tb + 1);
> +        tcg_gen_exit_tb(ctx->base.tb, 1);
>  
>          return DISAS_NORETURN;
>      } else {
> @@ -1273,7 +1273,7 @@ static DisasJumpType gen_call_pal(DisasContext *ctx, int palcode)
>          if (!use_exit_tb(ctx)) {
>              tcg_gen_goto_tb(0);
>              tcg_gen_movi_i64(cpu_pc, entry);
> -            tcg_gen_exit_tb((uintptr_t)ctx->base.tb);
> +            tcg_gen_exit_tb(ctx->base.tb, 0);
>              return DISAS_NORETURN;
>          } else {
>              tcg_gen_movi_i64(cpu_pc, entry);
> @@ -3009,7 +3009,7 @@ static void alpha_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>          if (use_goto_tb(ctx, ctx->base.pc_next)) {
>              tcg_gen_goto_tb(0);
>              tcg_gen_movi_i64(cpu_pc, ctx->base.pc_next);
> -            tcg_gen_exit_tb((uintptr_t)ctx->base.tb);
> +            tcg_gen_exit_tb(ctx->base.tb, 0);
>          }
>          /* FALLTHRU */
>      case DISAS_PC_STALE:
> @@ -3025,7 +3025,7 @@ static void alpha_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>          if (ctx->base.singlestep_enabled) {
>              gen_excp_1(EXCP_DEBUG, 0);
>          } else {
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>          }
>          break;
>      default:
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index b32332ce2c..8d8a4cecb0 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -383,7 +383,7 @@ static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
>      if (use_goto_tb(s, n, dest)) {
>          tcg_gen_goto_tb(n);
>          gen_a64_set_pc_im(dest);
> -        tcg_gen_exit_tb((intptr_t)tb + n);
> +        tcg_gen_exit_tb(tb, n);
>          s->base.is_jmp = DISAS_NORETURN;
>      } else {
>          gen_a64_set_pc_im(dest);
> @@ -13883,7 +13883,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>              gen_a64_set_pc_im(dc->pc);
>              /* fall through */
>          case DISAS_EXIT:
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              break;
>          case DISAS_JUMP:
>              tcg_gen_lookup_and_goto_ptr();
> @@ -13912,7 +13912,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>              /* The helper doesn't necessarily throw an exception, but we
>               * must go back to the main loop to check for interrupts anyway.
>               */
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              break;
>          }
>          }
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 46a9725bfd..0ff5edf2ce 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -995,7 +995,7 @@ static inline void gen_bx_excret_final_code(DisasContext *s)
>      if (is_singlestepping(s)) {
>          gen_singlestep_exception(s);
>      } else {
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>      }
>      gen_set_label(excret_label);
>      /* Yes: this is an exception return.
> @@ -4263,7 +4263,7 @@ static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
>      if (use_goto_tb(s, dest)) {
>          tcg_gen_goto_tb(n);
>          gen_set_pc_im(s, dest);
> -        tcg_gen_exit_tb((uintptr_t)s->base.tb + n);
> +        tcg_gen_exit_tb(s->base.tb, n);
>      } else {
>          gen_set_pc_im(s, dest);
>          gen_goto_ptr();
> @@ -12699,7 +12699,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>              /* fall through */
>          default:
>              /* indicate that the hash table must be used to find the next TB */
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              break;
>          case DISAS_NORETURN:
>              /* nothing more to generate */
> @@ -12714,7 +12714,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>              /* The helper doesn't necessarily throw an exception, but we
>               * must go back to the main loop to check for interrupts anyway.
>               */
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              break;
>          }
>          case DISAS_WFE:
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index d2f05971ab..4ae1c04daf 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -540,10 +540,10 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
>      if (use_goto_tb(dc, dest)) {
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_tl(env_pc, dest);
> -                tcg_gen_exit_tb((uintptr_t)dc->tb + n);
> +        tcg_gen_exit_tb(dc->tb, n);
>      } else {
>          tcg_gen_movi_tl(env_pc, dest);
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>      }
>  }
>  
> @@ -3276,7 +3276,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
>          case DISAS_UPDATE:
>              /* indicate that the hash table must be used
>                     to find the next TB */
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              break;
>          case DISAS_SWI:
>          case DISAS_TB_JUMP:
> diff --git a/target/hppa/translate.c b/target/hppa/translate.c
> index 5320b217de..ce05d5619d 100644
> --- a/target/hppa/translate.c
> +++ b/target/hppa/translate.c
> @@ -779,7 +779,7 @@ static void gen_goto_tb(DisasContext *ctx, int which,
>          tcg_gen_goto_tb(which);
>          tcg_gen_movi_reg(cpu_iaoq_f, f);
>          tcg_gen_movi_reg(cpu_iaoq_b, b);
> -        tcg_gen_exit_tb((uintptr_t)ctx->base.tb + which);
> +        tcg_gen_exit_tb(ctx->base.tb, which);
>      } else {
>          copy_iaoq_entry(cpu_iaoq_f, f, cpu_iaoq_b);
>          copy_iaoq_entry(cpu_iaoq_b, b, ctx->iaoq_n_var);
> @@ -2303,7 +2303,7 @@ static DisasJumpType trans_rfi(DisasContext *ctx, uint32_t insn,
>      if (ctx->base.singlestep_enabled) {
>          gen_excp_1(EXCP_DEBUG);
>      } else {
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>      }
>  
>      /* Exit the TB to recognize new interrupts.  */
> @@ -4844,7 +4844,7 @@ static void hppa_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>          if (ctx->base.singlestep_enabled) {
>              gen_excp_1(EXCP_DEBUG);
>          } else if (is_jmp == DISAS_IAQ_N_STALE_EXIT) {
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>          } else {
>              tcg_gen_lookup_and_goto_ptr();
>          }
> diff --git a/target/i386/translate.c b/target/i386/translate.c
> index 7c21814676..697a918c11 100644
> --- a/target/i386/translate.c
> +++ b/target/i386/translate.c
> @@ -2193,7 +2193,7 @@ static inline void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
>          /* jump to same page: we can use a direct jump */
>          tcg_gen_goto_tb(tb_num);
>          gen_jmp_im(eip);
> -        tcg_gen_exit_tb((uintptr_t)s->base.tb + tb_num);
> +        tcg_gen_exit_tb(s->base.tb, tb_num);
>          s->base.is_jmp = DISAS_NORETURN;
>      } else {
>          /* jump to another page */
> @@ -2572,13 +2572,13 @@ do_gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf, bool jr)
>          gen_helper_debug(cpu_env);
>      } else if (recheck_tf) {
>          gen_helper_rechecking_single_step(cpu_env);
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>      } else if (s->tf) {
>          gen_helper_single_step(cpu_env);
>      } else if (jr) {
>          tcg_gen_lookup_and_goto_ptr();
>      } else {
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>      }
>      s->base.is_jmp = DISAS_NORETURN;
>  }
> @@ -7402,7 +7402,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>              gen_jmp_im(pc_start - s->cs_base);
>              gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
>                               tcg_const_i32(s->pc - pc_start));
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              s->base.is_jmp = DISAS_NORETURN;
>              break;
>  
> diff --git a/target/lm32/translate.c b/target/lm32/translate.c
> index fdd206a860..b32feb7564 100644
> --- a/target/lm32/translate.c
> +++ b/target/lm32/translate.c
> @@ -159,13 +159,13 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
>      if (use_goto_tb(dc, dest)) {
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_tl(cpu_pc, dest);
> -        tcg_gen_exit_tb((uintptr_t)dc->tb + n);
> +        tcg_gen_exit_tb(dc->tb, n);
>      } else {
>          tcg_gen_movi_tl(cpu_pc, dest);
>          if (dc->singlestep_enabled) {
>              t_gen_raise_exception(dc, EXCP_DEBUG);
>          }
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>      }
>  }
>  
> @@ -1137,7 +1137,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
>          case DISAS_UPDATE:
>              /* indicate that the hash table must be used
>                 to find the next TB */
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              break;
>          case DISAS_TB_JUMP:
>              /* nothing more to generate */
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index 8959e4d0f0..37d6ffd853 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -1491,10 +1491,10 @@ static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
>      } else if (use_goto_tb(s, dest)) {
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_i32(QREG_PC, dest);
> -        tcg_gen_exit_tb((uintptr_t)s->tb + n);
> +        tcg_gen_exit_tb(s->tb, n);
>      } else {
>          gen_jmp_im(s, dest);
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>      }
>      s->is_jmp = DISAS_TB_JUMP;
>  }
> @@ -6147,7 +6147,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
>          case DISAS_UPDATE:
>              update_cc_op(dc);
>              /* indicate that the hash table must be used to find the next TB */
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              break;
>          case DISAS_TB_JUMP:
>              /* nothing more to generate */
> diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
> index b79600cba5..6c64946398 100644
> --- a/target/microblaze/translate.c
> +++ b/target/microblaze/translate.c
> @@ -143,10 +143,10 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
>      if (use_goto_tb(dc, dest)) {
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_i64(cpu_SR[SR_PC], dest);
> -        tcg_gen_exit_tb((uintptr_t)dc->tb + n);
> +        tcg_gen_exit_tb(dc->tb, n);
>      } else {
>          tcg_gen_movi_i64(cpu_SR[SR_PC], dest);
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>      }
>  }
>  
> @@ -1766,7 +1766,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
>              case DISAS_UPDATE:
>                  /* indicate that the hash table must be used
>                     to find the next TB */
> -                tcg_gen_exit_tb(0);
> +                tcg_gen_exit_tb(NULL, 0);
>                  break;
>              case DISAS_TB_JUMP:
>                  /* nothing more to generate */
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index e88f983ae7..e57d71e485 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -4291,7 +4291,7 @@ static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>      if (use_goto_tb(ctx, dest)) {
>          tcg_gen_goto_tb(n);
>          gen_save_pc(dest);
> -        tcg_gen_exit_tb((uintptr_t)ctx->base.tb + n);
> +        tcg_gen_exit_tb(ctx->base.tb, n);
>      } else {
>          gen_save_pc(dest);
>          if (ctx->base.singlestep_enabled) {
> @@ -20344,7 +20344,7 @@ static void mips_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>              gen_goto_tb(ctx, 0, ctx->base.pc_next);
>              break;
>          case DISAS_EXIT:
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              break;
>          case DISAS_NORETURN:
>              break;
> diff --git a/target/moxie/translate.c b/target/moxie/translate.c
> index 28b405f0e4..29da02bc05 100644
> --- a/target/moxie/translate.c
> +++ b/target/moxie/translate.c
> @@ -132,13 +132,13 @@ static inline void gen_goto_tb(CPUMoxieState *env, DisasContext *ctx,
>      if (use_goto_tb(ctx, dest)) {
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_i32(cpu_pc, dest);
> -        tcg_gen_exit_tb((uintptr_t)ctx->tb + n);
> +        tcg_gen_exit_tb(ctx->tb, n);
>      } else {
>          tcg_gen_movi_i32(cpu_pc, dest);
>          if (ctx->singlestep_enabled) {
>              gen_helper_debug(cpu_env);
>          }
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>      }
>  }
>  
> @@ -328,7 +328,7 @@ static int decode_opc(MoxieCPU *cpu, DisasContext *ctx)
>                  tcg_temp_free_i32(t1);
>  
>                  /* Jump... */
> -                tcg_gen_exit_tb(0);
> +                tcg_gen_exit_tb(NULL, 0);
>  
>                  ctx->bstate = BS_BRANCH;
>              }
> @@ -472,14 +472,14 @@ static int decode_opc(MoxieCPU *cpu, DisasContext *ctx)
>                  tcg_gen_mov_i32(cpu_pc, REG(fnreg));
>                  tcg_temp_free_i32(t1);
>                  tcg_temp_free_i32(t2);
> -                tcg_gen_exit_tb(0);
> +                tcg_gen_exit_tb(NULL, 0);
>                  ctx->bstate = BS_BRANCH;
>              }
>              break;
>          case 0x1a: /* jmpa */
>              {
>                  tcg_gen_movi_i32(cpu_pc, cpu_ldl_code(env, ctx->pc+2));
> -                tcg_gen_exit_tb(0);
> +                tcg_gen_exit_tb(NULL, 0);
>                  ctx->bstate = BS_BRANCH;
>                  length = 6;
>              }
> @@ -584,7 +584,7 @@ static int decode_opc(MoxieCPU *cpu, DisasContext *ctx)
>              {
>                  int reg = (opcode >> 4) & 0xf;
>                  tcg_gen_mov_i32(cpu_pc, REG(reg));
> -                tcg_gen_exit_tb(0);
> +                tcg_gen_exit_tb(NULL, 0);
>                  ctx->bstate = BS_BRANCH;
>              }
>              break;
> @@ -878,7 +878,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
>              gen_goto_tb(env, &ctx, 0, ctx.pc);
>              break;
>          case BS_EXCP:
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              break;
>          case BS_BRANCH:
>          default:
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index cb8624e8d2..7fa03ed05a 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -171,10 +171,10 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
>      if (use_goto_tb(dc, dest)) {
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_tl(dc->cpu_R[R_PC], dest);
> -        tcg_gen_exit_tb((uintptr_t)tb + n);
> +        tcg_gen_exit_tb(tb, n);
>      } else {
>          tcg_gen_movi_tl(dc->cpu_R[R_PC], dest);
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>      }
>  }
>  
> @@ -880,14 +880,14 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
>      case DISAS_NEXT:
>          /* Save the current PC back into the CPU register */
>          tcg_gen_movi_tl(cpu_R[R_PC], dc->pc);
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>          break;
>  
>      default:
>      case DISAS_JUMP:
>      case DISAS_UPDATE:
>          /* The jump will already have updated the PC register */
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>          break;
>  
>      case DISAS_TB_JUMP:
> diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
> index e7c96ca990..d69f8d0422 100644
> --- a/target/openrisc/translate.c
> +++ b/target/openrisc/translate.c
> @@ -183,13 +183,13 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
>      if (use_goto_tb(dc, dest)) {
>          tcg_gen_movi_tl(cpu_pc, dest);
>          tcg_gen_goto_tb(n);
> -        tcg_gen_exit_tb((uintptr_t)dc->base.tb + n);
> +        tcg_gen_exit_tb(dc->base.tb, n);
>      } else {
>          tcg_gen_movi_tl(cpu_pc, dest);
>          if (dc->base.singlestep_enabled) {
>              gen_exception(dc, EXCP_DEBUG);
>          }
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>      }
>  }
>  
> @@ -1473,7 +1473,7 @@ static void openrisc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>          case DISAS_UPDATE:
>              /* indicate that the hash table must be used
>                 to find the next TB */
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              break;
>          default:
>              g_assert_not_reached();
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index e30d99fcbc..b28e8b91d3 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -3422,7 +3422,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>      if (use_goto_tb(ctx, dest)) {
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_tl(cpu_nip, dest & ~3);
> -        tcg_gen_exit_tb((uintptr_t)ctx->base.tb + n);
> +        tcg_gen_exit_tb(ctx->base.tb, n);
>      } else {
>          tcg_gen_movi_tl(cpu_nip, dest & ~3);
>          if (unlikely(ctx->singlestep_enabled)) {
> @@ -7410,7 +7410,7 @@ static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>              gen_debug_exception(ctx);
>          }
>          /* Generate the return instruction */
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>      }
>  }
>  
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index ee2bbc55b0..0b6be74f2d 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -129,13 +129,13 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>          /* chaining is only allowed when the jump is to the same page */
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_tl(cpu_pc, dest);
> -        tcg_gen_exit_tb((uintptr_t)ctx->base.tb + n);
> +        tcg_gen_exit_tb(ctx->base.tb, n);
>      } else {
>          tcg_gen_movi_tl(cpu_pc, dest);
>          if (ctx->base.singlestep_enabled) {
>              gen_exception_debug();
>          } else {
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>          }
>      }
>  }
> @@ -548,7 +548,7 @@ static void gen_jalr(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
>          if (rd != 0) {
>              tcg_gen_movi_tl(cpu_gpr[rd], ctx->pc_succ_insn);
>          }
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>  
>          if (misaligned) {
>              gen_set_label(misaligned);
> @@ -1303,12 +1303,12 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
>          case 0x0: /* ECALL */
>              /* always generates U-level ECALL, fixed in do_interrupt handler */
>              generate_exception(ctx, RISCV_EXCP_U_ECALL);
> -            tcg_gen_exit_tb(0); /* no chaining */
> +            tcg_gen_exit_tb(NULL, 0); /* no chaining */
>              ctx->base.is_jmp = DISAS_NORETURN;
>              break;
>          case 0x1: /* EBREAK */
>              generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
> -            tcg_gen_exit_tb(0); /* no chaining */
> +            tcg_gen_exit_tb(NULL, 0); /* no chaining */
>              ctx->base.is_jmp = DISAS_NORETURN;
>              break;
>  #ifndef CONFIG_USER_ONLY
> @@ -1318,7 +1318,7 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
>          case 0x102: /* SRET */
>              if (riscv_has_ext(env, RVS)) {
>                  gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
> -                tcg_gen_exit_tb(0); /* no chaining */
> +                tcg_gen_exit_tb(NULL, 0); /* no chaining */
>                  ctx->base.is_jmp = DISAS_NORETURN;
>              } else {
>                  gen_exception_illegal(ctx);
> @@ -1329,7 +1329,7 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
>              break;
>          case 0x302: /* MRET */
>              gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
> -            tcg_gen_exit_tb(0); /* no chaining */
> +            tcg_gen_exit_tb(NULL, 0); /* no chaining */
>              ctx->base.is_jmp = DISAS_NORETURN;
>              break;
>          case 0x7b2: /* DRET */
> @@ -1378,7 +1378,7 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
>          gen_set_gpr(rd, dest);
>          /* end tb since we may be changing priv modes, to get mmu_index right */
>          tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
> -        tcg_gen_exit_tb(0); /* no chaining */
> +        tcg_gen_exit_tb(NULL, 0); /* no chaining */
>          ctx->base.is_jmp = DISAS_NORETURN;
>          break;
>      }
> @@ -1771,7 +1771,7 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
>              /* FENCE_I is a no-op in QEMU,
>               * however we need to end the translation block */
>              tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              ctx->base.is_jmp = DISAS_NORETURN;
>          } else {
>              /* FENCE is a full memory barrier. */
> @@ -1872,7 +1872,7 @@ static void riscv_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>          if (ctx->base.singlestep_enabled) {
>              gen_exception_debug();
>          } else {
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>          }
>          break;
>      case DISAS_NORETURN:
> diff --git a/target/s390x/translate.c b/target/s390x/translate.c
> index 82309faa11..fdfec7feba 100644
> --- a/target/s390x/translate.c
> +++ b/target/s390x/translate.c
> @@ -1159,7 +1159,7 @@ static DisasJumpType help_goto_direct(DisasContext *s, uint64_t dest)
>          per_breaking_event(s);
>          tcg_gen_goto_tb(0);
>          tcg_gen_movi_i64(psw_addr, dest);
> -        tcg_gen_exit_tb((uintptr_t)s->base.tb);
> +        tcg_gen_exit_tb(s->base.tb, 0);
>          return DISAS_GOTO_TB;
>      } else {
>          tcg_gen_movi_i64(psw_addr, dest);
> @@ -1220,14 +1220,14 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
>              /* Branch not taken.  */
>              tcg_gen_goto_tb(0);
>              tcg_gen_movi_i64(psw_addr, s->pc_tmp);
> -            tcg_gen_exit_tb((uintptr_t)s->base.tb + 0);
> +            tcg_gen_exit_tb(s->base.tb, 0);
>  
>              /* Branch taken.  */
>              gen_set_label(lab);
>              per_breaking_event(s);
>              tcg_gen_goto_tb(1);
>              tcg_gen_movi_i64(psw_addr, dest);
> -            tcg_gen_exit_tb((uintptr_t)s->base.tb + 1);
> +            tcg_gen_exit_tb(s->base.tb, 1);
>  
>              ret = DISAS_GOTO_TB;
>          } else {
> @@ -1250,7 +1250,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
>              update_cc_op(s);
>              tcg_gen_goto_tb(0);
>              tcg_gen_movi_i64(psw_addr, s->pc_tmp);
> -            tcg_gen_exit_tb((uintptr_t)s->base.tb + 0);
> +            tcg_gen_exit_tb(s->base.tb, 0);
>  
>              gen_set_label(lab);
>              if (is_imm) {
> @@ -6240,7 +6240,7 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>              gen_exception(EXCP_DEBUG);
>          } else if (use_exit_tb(dc) ||
>                     dc->base.is_jmp == DISAS_PC_STALE_NOCHAIN) {
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>          } else {
>              tcg_gen_lookup_and_goto_ptr();
>          }
> diff --git a/target/sh4/translate.c b/target/sh4/translate.c
> index 58bdfeb4fb..c716b74a0f 100644
> --- a/target/sh4/translate.c
> +++ b/target/sh4/translate.c
> @@ -242,13 +242,13 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>      if (use_goto_tb(ctx, dest)) {
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_i32(cpu_pc, dest);
> -        tcg_gen_exit_tb((uintptr_t)ctx->base.tb + n);
> +        tcg_gen_exit_tb(ctx->base.tb, n);
>      } else {
>          tcg_gen_movi_i32(cpu_pc, dest);
>          if (ctx->base.singlestep_enabled) {
>              gen_helper_debug(cpu_env);
>          } else if (use_exit_tb(ctx)) {
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>          } else {
>              tcg_gen_lookup_and_goto_ptr();
>          }
> @@ -266,7 +266,7 @@ static void gen_jump(DisasContext * ctx)
>          if (ctx->base.singlestep_enabled) {
>              gen_helper_debug(cpu_env);
>          } else if (use_exit_tb(ctx)) {
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>          } else {
>              tcg_gen_lookup_and_goto_ptr();
>          }
> @@ -2343,7 +2343,7 @@ static void sh4_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>          if (ctx->base.singlestep_enabled) {
>              gen_helper_debug(cpu_env);
>          } else {
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>          }
>          break;
>      case DISAS_NEXT:
> diff --git a/target/sparc/translate.c b/target/sparc/translate.c
> index 40b2eaad39..f3d430c1b2 100644
> --- a/target/sparc/translate.c
> +++ b/target/sparc/translate.c
> @@ -360,12 +360,12 @@ static inline void gen_goto_tb(DisasContext *s, int tb_num,
>          tcg_gen_goto_tb(tb_num);
>          tcg_gen_movi_tl(cpu_pc, pc);
>          tcg_gen_movi_tl(cpu_npc, npc);
> -        tcg_gen_exit_tb((uintptr_t)s->base.tb + tb_num);
> +        tcg_gen_exit_tb(s->base.tb, tb_num);
>      } else {
>          /* jump to another page: currently not optimized */
>          tcg_gen_movi_tl(cpu_pc, pc);
>          tcg_gen_movi_tl(cpu_npc, npc);
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>      }
>  }
>  
> @@ -4329,7 +4329,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                                  /* End TB to notice changed ASI.  */
>                                  save_state(dc);
>                                  gen_op_next_insn();
> -                                tcg_gen_exit_tb(0);
> +                                tcg_gen_exit_tb(NULL, 0);
>                                  dc->base.is_jmp = DISAS_NORETURN;
>                                  break;
>                              case 0x6: /* V9 wrfprs */
> @@ -4338,7 +4338,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                                  dc->fprs_dirty = 0;
>                                  save_state(dc);
>                                  gen_op_next_insn();
> -                                tcg_gen_exit_tb(0);
> +                                tcg_gen_exit_tb(NULL, 0);
>                                  dc->base.is_jmp = DISAS_NORETURN;
>                                  break;
>                              case 0xf: /* V9 sir, nop if user */
> @@ -4466,7 +4466,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                              dc->cc_op = CC_OP_FLAGS;
>                              save_state(dc);
>                              gen_op_next_insn();
> -                            tcg_gen_exit_tb(0);
> +                            tcg_gen_exit_tb(NULL, 0);
>                              dc->base.is_jmp = DISAS_NORETURN;
>  #endif
>                          }
> @@ -4622,7 +4622,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>                                                          hpstate));
>                                  save_state(dc);
>                                  gen_op_next_insn();
> -                                tcg_gen_exit_tb(0);
> +                                tcg_gen_exit_tb(NULL, 0);
>                                  dc->base.is_jmp = DISAS_NORETURN;
>                                  break;
>                              case 1: // htstate
> @@ -5793,7 +5793,7 @@ static bool sparc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
>          save_state(dc);
>      }
>      gen_helper_debug(cpu_env);
> -    tcg_gen_exit_tb(0);
> +    tcg_gen_exit_tb(NULL, 0);
>      dc->base.is_jmp = DISAS_NORETURN;
>      /* update pc_next so that the current instruction is included in tb->size */
>      dc->base.pc_next += 4;
> @@ -5832,7 +5832,7 @@ static void sparc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>                  tcg_gen_movi_tl(cpu_pc, dc->pc);
>              }
>              save_npc(dc);
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>          }
>      }
>  }
> diff --git a/target/tilegx/translate.c b/target/tilegx/translate.c
> index 6c53c5e767..f201150fc7 100644
> --- a/target/tilegx/translate.c
> +++ b/target/tilegx/translate.c
> @@ -2362,7 +2362,7 @@ static void translate_one_bundle(DisasContext *dc, uint64_t bundle)
>              tcg_temp_free_i64(next);
>          }
>          tcg_temp_free_i64(dc->jmp.dest);
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>          dc->exit_tb = true;
>      } else if (dc->atomic_excp != TILEGX_EXCP_NONE) {
>          gen_exception(dc, dc->atomic_excp);
> @@ -2419,7 +2419,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
>              || tcg_op_buf_full()) {
>              /* Ending the TB due to TB size or page boundary.  Set PC.  */
>              tcg_gen_movi_tl(cpu_pc, dc->pc);
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              break;
>          }
>      }
> diff --git a/target/tricore/translate.c b/target/tricore/translate.c
> index aef0d9cf06..b5ab40d4a2 100644
> --- a/target/tricore/translate.c
> +++ b/target/tricore/translate.c
> @@ -3253,13 +3253,13 @@ static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>      if (use_goto_tb(ctx, dest)) {
>          tcg_gen_goto_tb(n);
>          gen_save_pc(dest);
> -        tcg_gen_exit_tb((uintptr_t)ctx->tb + n);
> +        tcg_gen_exit_tb(ctx->tb, n);
>      } else {
>          gen_save_pc(dest);
>          if (ctx->singlestep_enabled) {
>              /* raise exception debug */
>          }
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>      }
>  }
>  
> @@ -3327,7 +3327,7 @@ static void gen_fret(DisasContext *ctx)
>      tcg_gen_qemu_ld_tl(cpu_gpr_a[11], cpu_gpr_a[10], ctx->mem_idx, MO_LESL);
>      tcg_gen_addi_tl(cpu_gpr_a[10], cpu_gpr_a[10], 4);
>      tcg_gen_mov_tl(cpu_PC, temp);
> -    tcg_gen_exit_tb(0);
> +    tcg_gen_exit_tb(NULL, 0);
>      ctx->bstate = BS_BRANCH;
>  
>      tcg_temp_free(temp);
> @@ -3431,12 +3431,12 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc, int r1,
>  /* SR-format jumps */
>      case OPC1_16_SR_JI:
>          tcg_gen_andi_tl(cpu_PC, cpu_gpr_a[r1], 0xfffffffe);
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>          break;
>      case OPC2_32_SYS_RET:
>      case OPC2_16_SR_RET:
>          gen_helper_ret(cpu_env);
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>          break;
>  /* B-format */
>      case OPC1_32_B_CALLA:
> @@ -3939,7 +3939,7 @@ static void decode_sr_system(CPUTriCoreState *env, DisasContext *ctx)
>          break;
>      case OPC2_16_SR_RFE:
>          gen_helper_rfe(cpu_env);
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>          ctx->bstate = BS_BRANCH;
>          break;
>      case OPC2_16_SR_DEBUG:
> @@ -6578,7 +6578,7 @@ static void decode_rr_idirect(CPUTriCoreState *env, DisasContext *ctx)
>      default:
>          generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
>      }
> -    tcg_gen_exit_tb(0);
> +    tcg_gen_exit_tb(NULL, 0);
>      ctx->bstate = BS_BRANCH;
>  }
>  
> @@ -8398,7 +8398,7 @@ static void decode_sys_interrupts(CPUTriCoreState *env, DisasContext *ctx)
>          break;
>      case OPC2_32_SYS_RFE:
>          gen_helper_rfe(cpu_env);
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>          ctx->bstate = BS_BRANCH;
>          break;
>      case OPC2_32_SYS_RFM:
> @@ -8411,7 +8411,7 @@ static void decode_sys_interrupts(CPUTriCoreState *env, DisasContext *ctx)
>              tcg_gen_brcondi_tl(TCG_COND_NE, tmp, 1, l1);
>              gen_helper_rfm(cpu_env);
>              gen_set_label(l1);
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              ctx->bstate = BS_BRANCH;
>              tcg_temp_free(tmp);
>          } else {
> @@ -8845,7 +8845,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
>  
>          if (num_insns >= max_insns || tcg_op_buf_full()) {
>              gen_save_pc(ctx.next_pc);
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              break;
>          }
>          ctx.pc = ctx.next_pc;
> diff --git a/target/unicore32/translate.c b/target/unicore32/translate.c
> index 3cae111955..002569ff3b 100644
> --- a/target/unicore32/translate.c
> +++ b/target/unicore32/translate.c
> @@ -1106,10 +1106,10 @@ static inline void gen_goto_tb(DisasContext *s, int n, uint32_t dest)
>      if (use_goto_tb(s, dest)) {
>          tcg_gen_goto_tb(n);
>          gen_set_pc_im(dest);
> -        tcg_gen_exit_tb((uintptr_t)s->tb + n);
> +        tcg_gen_exit_tb(s->tb, n);
>      } else {
>          gen_set_pc_im(dest);
> -        tcg_gen_exit_tb(0);
> +        tcg_gen_exit_tb(NULL, 0);
>      }
>  }
>  
> @@ -2002,7 +2002,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
>          case DISAS_JUMP:
>          case DISAS_UPDATE:
>              /* indicate that the hash table must be used to find the next TB */
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>              break;
>          case DISAS_TB_JUMP:
>              /* nothing more to generate */
> diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
> index 720bc592e1..89db23852b 100644
> --- a/target/xtensa/translate.c
> +++ b/target/xtensa/translate.c
> @@ -377,9 +377,9 @@ static void gen_jump_slot(DisasContext *dc, TCGv dest, int slot)
>      } else {
>          if (slot >= 0) {
>              tcg_gen_goto_tb(slot);
> -            tcg_gen_exit_tb((uintptr_t)dc->tb + slot);
> +            tcg_gen_exit_tb(dc->tb, slot);
>          } else {
> -            tcg_gen_exit_tb(0);
> +            tcg_gen_exit_tb(NULL, 0);
>          }
>      }
>      dc->is_jmp = DISAS_UPDATE;
> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
> index 6a914654f5..4f5f35fb04 100644
> --- a/tcg/tcg-op.c
> +++ b/tcg/tcg-op.c
> @@ -2574,6 +2574,24 @@ void tcg_gen_extr32_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg)
>  
>  /* QEMU specific operations.  */
>  
> +void tcg_gen_exit_tb(TranslationBlock *tb, unsigned idx)
> +{
> +    uintptr_t val = (uintptr_t)tb + idx;
> +
> +    if (tb == NULL) {
> +        tcg_debug_assert(idx == 0);
> +    } else if (idx <= 1) {

The "1" meaning is not obvious,
perhaps you can add the same comment as in tcg_gen_goto_tb():

           /* We only support two chained exits.  */

or you can use "TB_EXIT_IDX1" or define a "TB_EXIT_MAX_IDX"?

With the "#ifdef CONFIG_DEBUG_TCG",

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Thanks,
Laurent
