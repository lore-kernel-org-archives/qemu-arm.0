Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l81sm6936908wmi.22.2017.04.26.03.33.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 03:33:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id B2BBE3E0126;
	Wed, 26 Apr 2017 11:33:46 +0100 (BST)
References: <1493187803-4510-1-git-send-email-cota@braap.org> <1493187803-4510-4-git-send-email-cota@braap.org>
User-agent: mu4e 0.9.19; emacs 25.2.17
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>, Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>, Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org, Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: Re: [PATCH v3 03/10] tcg: export tcg_gen_lookup_and_goto_ptr
In-reply-to: <1493187803-4510-4-git-send-email-cota@braap.org>
Date: Wed, 26 Apr 2017 11:33:46 +0100
Message-ID: <87d1bz8nlh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: vBnPoWfTbT5L


Emilio G. Cota <cota@braap.org> writes:

> Instead of exporting goto_ptr directly to TCG frontends, export
> tcg_gen_lookup_and_goto_ptr(), which calls goto_ptr with the pointer
> returned by the lookup_tb_ptr() helper. This is the only use case
> we have for goto_ptr and lookup_tb_ptr, so having this function is
> very convenient. Furthermore, it trivially allows us to avoid calling
> the lookup helper if goto_ptr is not implemented by the backend.
>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  tcg/README   |  8 ++++++++
>  tcg/tcg-op.c | 13 +++++++++++++
>  tcg/tcg-op.h | 11 +++++++++++
>  3 files changed, 32 insertions(+)
>
> diff --git a/tcg/README b/tcg/README
> index a9858c2..bf49e82 100644
> --- a/tcg/README
> +++ b/tcg/README
> @@ -477,6 +477,14 @@ current TB was linked to this TB. Otherwise execute the next
>  instructions. Only indices 0 and 1 are valid and tcg_gen_goto_tb may be issued
>  at most once with each slot index per TB.
>
> +* lookup_and_goto_ptr tb_addr
> +
> +Look up a TB address ('tb_addr') and jump to it if valid. If not valid,
> +jump to the TCG epilogue to go back to the exec loop.
> +
> +This operation is optional. If the TCG backend does not implement the
> +goto_ptr opcode, emitting this op is equivalent to emitting exit_tb(0).
> +
>  * qemu_ld_i32/i64 t0, t1, flags, memidx
>  * qemu_st_i32/i64 t0, t1, flags, memidx
>
> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
> index 95a39b7..8ff1eaf 100644
> --- a/tcg/tcg-op.c
> +++ b/tcg/tcg-op.c
> @@ -2587,6 +2587,19 @@ void tcg_gen_goto_tb(unsigned idx)
>      tcg_gen_op1i(INDEX_op_goto_tb, idx);
>  }
>
> +void tcg_gen_lookup_and_goto_ptr(TCGv addr)
> +{
> +    if (TCG_TARGET_HAS_goto_ptr) {
> +        TCGv_ptr ptr = tcg_temp_new_ptr();
> +
> +        gen_helper_lookup_tb_ptr(ptr, tcg_ctx.tcg_env, addr);
> +        tcg_gen_op1i(INDEX_op_goto_ptr, GET_TCGV_PTR(ptr));
> +        tcg_temp_free_ptr(ptr);
> +    } else {
> +        tcg_gen_exit_tb(0);
> +    }
> +}
> +
>  static inline TCGMemOp tcg_canonicalize_memop(TCGMemOp op, bool is64, bool st)
>  {
>      /* Trigger the asserts within as early as possible.  */
> diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
> index c68e300..5d3278f 100644
> --- a/tcg/tcg-op.h
> +++ b/tcg/tcg-op.h
> @@ -796,6 +796,17 @@ static inline void tcg_gen_exit_tb(uintptr_t val)
>   */
>  void tcg_gen_goto_tb(unsigned idx);
>
> +/**
> + * tcg_gen_lookup_and_goto_ptr() - look up a TB and jump to it if valid
> + * @addr: Guest address of the target TB
> + *
> + * If the TB is not valid, jump to the epilogue.
> + *
> + * This operation is optional. If the TCG backend does not implement goto_ptr,
> + * this op is equivalent to calling tcg_gen_exit_tb() with 0 as the argument.
> + */
> +void tcg_gen_lookup_and_goto_ptr(TCGv addr);
> +
>  #if TARGET_LONG_BITS == 32
>  #define tcg_temp_new() tcg_temp_new_i32()
>  #define tcg_global_reg_new tcg_global_reg_new_i32


--
Alex Bennée
