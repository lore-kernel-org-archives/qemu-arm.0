Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z90sm11289403wrc.36.2017.04.26.03.29.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 03:29:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 55BA23E0126;
	Wed, 26 Apr 2017 11:29:29 +0100 (BST)
References: <1493187803-4510-1-git-send-email-cota@braap.org> <1493187803-4510-2-git-send-email-cota@braap.org>
User-agent: mu4e 0.9.19; emacs 25.2.17
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>, Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>, Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org, Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: Re: [PATCH v3 01/10] tcg-runtime: add lookup_tb_ptr helper
In-reply-to: <1493187803-4510-2-git-send-email-cota@braap.org>
Date: Wed, 26 Apr 2017 11:29:29 +0100
Message-ID: <87efwf8nsm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: RK9aL4BPd47X


Emilio G. Cota <cota@braap.org> writes:

> This paves the way for upcoming work.
>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  tcg-runtime.c     | 21 +++++++++++++++++++++
>  tcg/tcg-runtime.h |  2 ++
>  tcg/tcg.h         |  1 +
>  3 files changed, 24 insertions(+)
>
> diff --git a/tcg-runtime.c b/tcg-runtime.c
> index 4c60c96..90d2d4b 100644
> --- a/tcg-runtime.c
> +++ b/tcg-runtime.c
> @@ -27,6 +27,7 @@
>  #include "exec/helper-proto.h"
>  #include "exec/cpu_ldst.h"
>  #include "exec/exec-all.h"
> +#include "exec/tb-hash.h"
>
>  /* 32-bit helpers */
>
> @@ -141,6 +142,26 @@ uint64_t HELPER(ctpop_i64)(uint64_t arg)
>      return ctpop64(arg);
>  }
>
> +void *HELPER(lookup_tb_ptr)(CPUArchState *env, target_ulong addr)
> +{
> +    CPUState *cpu = ENV_GET_CPU(env);
> +    TranslationBlock *tb;
> +    target_ulong cs_base, pc;
> +    uint32_t flags;
> +
> +    if (unlikely(atomic_read(&cpu->exit_request))) {
> +        goto out_epilogue;
> +    }
> +    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
> +    tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(addr)]);
> +    if (likely(tb && tb->pc == addr && tb->cs_base == cs_base &&
> +               tb->flags == flags)) {

Should we also not be checking the TB hasn't been invalidated: tb->invalid?

> +        return tb->tc_ptr;
> +    }
> + out_epilogue:
> +    return tcg_ctx.code_gen_epilogue;
> +}
> +
>  void HELPER(exit_atomic)(CPUArchState *env)
>  {
>      cpu_loop_exit_atomic(ENV_GET_CPU(env), GETPC());
> diff --git a/tcg/tcg-runtime.h b/tcg/tcg-runtime.h
> index 114ea6f..c41d38a 100644
> --- a/tcg/tcg-runtime.h
> +++ b/tcg/tcg-runtime.h
> @@ -24,6 +24,8 @@ DEF_HELPER_FLAGS_1(clrsb_i64, TCG_CALL_NO_RWG_SE, i64, i64)
>  DEF_HELPER_FLAGS_1(ctpop_i32, TCG_CALL_NO_RWG_SE, i32, i32)
>  DEF_HELPER_FLAGS_1(ctpop_i64, TCG_CALL_NO_RWG_SE, i64, i64)
>
> +DEF_HELPER_FLAGS_2(lookup_tb_ptr, TCG_CALL_NO_WG_SE, ptr, env, tl)
> +
>  DEF_HELPER_FLAGS_1(exit_atomic, TCG_CALL_NO_WG, noreturn, env)
>
>  #ifdef CONFIG_SOFTMMU
> diff --git a/tcg/tcg.h b/tcg/tcg.h
> index 6c216bb..5ec48d1 100644
> --- a/tcg/tcg.h
> +++ b/tcg/tcg.h
> @@ -699,6 +699,7 @@ struct TCGContext {
>         extension that allows arithmetic on void*.  */
>      int code_gen_max_blocks;
>      void *code_gen_prologue;
> +    void *code_gen_epilogue;
>      void *code_gen_buffer;
>      size_t code_gen_buffer_size;
>      void *code_gen_ptr;


--
Alex Bennée
