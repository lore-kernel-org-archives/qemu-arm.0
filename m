Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l124sm9674646wmf.11.2016.04.20.06.33.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Apr 2016 06:33:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D6CD83E0323;
	Wed, 20 Apr 2016 14:33:16 +0100 (BST)
References: <1460044433-19282-1-git-send-email-sergey.fedorov@linaro.org> <1460044433-19282-8-git-send-email-sergey.fedorov@linaro.org>
User-agent: mu4e 0.9.17; emacs 25.0.92.6
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sergey Fedorov <sergey.fedorov@linaro.org>
Cc: qemu-devel@nongnu.org, Sergey Fedorov <serge.fdrv@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 07/11] tcg/arm: Make direct jump patching thread-safe
In-reply-to: <1460044433-19282-8-git-send-email-sergey.fedorov@linaro.org>
Date: Wed, 20 Apr 2016 14:33:16 +0100
Message-ID: <87lh48v203.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: qk74PAohM2sk


Sergey Fedorov <sergey.fedorov@linaro.org> writes:

> From: Sergey Fedorov <serge.fdrv@gmail.com>
>
> Ensure direct jump patching in ARM is atomic by using
> atomic_read()/atomic_set() for code patching.
>
> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
> Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
> ---
>  include/exec/exec-all.h  | 25 ++-----------------------
>  tcg/arm/tcg-target.inc.c | 17 +++++++++++++++++
>  2 files changed, 19 insertions(+), 23 deletions(-)
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index e18cc24e50f0..6a054ee720a8 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -327,29 +327,8 @@ static inline void tb_set_jmp_target1(uintptr_t jmp_addr, uintptr_t addr)
>  void aarch64_tb_set_jmp_target(uintptr_t jmp_addr, uintptr_t addr);
>  #define tb_set_jmp_target1 aarch64_tb_set_jmp_target
>  #elif defined(__arm__)
> -static inline void tb_set_jmp_target1(uintptr_t jmp_addr, uintptr_t addr)
> -{
> -#if !QEMU_GNUC_PREREQ(4, 1)
> -    register unsigned long _beg __asm ("a1");
> -    register unsigned long _end __asm ("a2");
> -    register unsigned long _flg __asm ("a3");
> -#endif
> -
> -    /* we could use a ldr pc, [pc, #-4] kind of branch and avoid the flush */
> -    *(uint32_t *)jmp_addr =
> -        (*(uint32_t *)jmp_addr & ~0xffffff)
> -        | (((addr - (jmp_addr + 8)) >> 2) & 0xffffff);
> -
> -#if QEMU_GNUC_PREREQ(4, 1)
> -    __builtin___clear_cache((char *) jmp_addr, (char *) jmp_addr + 4);
> -#else
> -    /* flush icache */
> -    _beg = jmp_addr;
> -    _end = jmp_addr + 4;
> -    _flg = 0;
> -    __asm __volatile__ ("swi 0x9f0002" : : "r" (_beg), "r" (_end), "r" (_flg));
> -#endif
> -}
> +void arm_tb_set_jmp_target(uintptr_t jmp_addr, uintptr_t addr);
> +#define tb_set_jmp_target1 arm_tb_set_jmp_target
>  #elif defined(__sparc__) || defined(__mips__)
>  void tb_set_jmp_target1(uintptr_t jmp_addr, uintptr_t addr);
>  #else
> diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
> index 3edf6a6f971c..5c69de20bc69 100644
> --- a/tcg/arm/tcg-target.inc.c
> +++ b/tcg/arm/tcg-target.inc.c
> @@ -121,6 +121,13 @@ static inline void reloc_pc24(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>      *code_ptr = (*code_ptr & ~0xffffff) | (offset & 0xffffff);
>  }
>
> +static inline void reloc_pc24_atomic(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
> +{
> +    ptrdiff_t offset = (tcg_ptr_byte_diff(target, code_ptr) - 8) >>
> 2;

This seems like something a tcg_debug_assert should be ensuring we don't overflow.

> +    tcg_insn_unit insn = atomic_read(code_ptr);

Don't we already know what the instruction should be or could there be
multiple ones?

> +    atomic_set(code_ptr, (insn & ~0xffffff) | (offset & 0xffffff));

Please use deposit32 to set the offset like the aarch64 code.

> +}
> +
>  static void patch_reloc(tcg_insn_unit *code_ptr, int type,
>                          intptr_t value, intptr_t addend)
>  {
> @@ -1038,6 +1045,16 @@ static void tcg_out_call(TCGContext *s, tcg_insn_unit *addr)
>      }
>  }
>
> +void arm_tb_set_jmp_target(uintptr_t jmp_addr, uintptr_t addr)
> +{
> +    tcg_insn_unit *code_ptr = (tcg_insn_unit *)jmp_addr;
> +    tcg_insn_unit *target = (tcg_insn_unit *)addr;
> +
> +    /* we could use a ldr pc, [pc, #-4] kind of branch and avoid the
> flush */

So why don't we?

> +    reloc_pc24_atomic(code_ptr, target);
> +    flush_icache_range(jmp_addr, jmp_addr + 4);
> +}
> +
>  static inline void tcg_out_goto_label(TCGContext *s, int cond, TCGLabel *l)
>  {
>      if (l->has_value) {


--
Alex Bennée
