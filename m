Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f73sm6452239wmg.1.2016.06.23.09.30.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jun 2016 09:30:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 2A4353E028B;
	Thu, 23 Jun 2016 17:30:29 +0100 (BST)
User-agent: mu4e 0.9.17; emacs 25.0.95.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pranith Kumar <bobby.prani@gmail.com>
Cc: Andrzej Zaborowski <balrogg@gmail.com>, Richard Henderson <rth@twiddle.net>, "open list\:ARM target" <qemu-arm@nongnu.org>, "open list\:All patches CC here" <qemu-devel@nongnu.org>, serge.fdrv@gmail.com, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC v3 PATCH 04/14] tcg/arm: Add support for fence
In-reply-to: <20160618040343.19517-5-bobby.prani@gmail.com>
Date: Thu, 23 Jun 2016 17:30:29 +0100
Message-ID: <87h9cjrhp6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 1E0jTm2MotfT


Pranith Kumar <bobby.prani@gmail.com> writes:

> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
> Signed-off-by: Richard Henderson <rth@twiddle.net>
> ---
>  tcg/arm/tcg-target.inc.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
> index f9f54c6..1447aa8 100644
> --- a/tcg/arm/tcg-target.inc.c
> +++ b/tcg/arm/tcg-target.inc.c
> @@ -313,6 +313,10 @@ typedef enum {
>      INSN_LDRD_REG  = 0x000000d0,
>      INSN_STRD_IMM  = 0x004000f0,
>      INSN_STRD_REG  = 0x000000f0,
> +
> +    INSN_DMB_ISH   = 0x5bf07ff5,
> +    INSN_DMB_MCR   = 0xba0f07ee,

Again I think you might want to split the instruction encoding. Also
where did you get these encoding from? Is it right the byte-order has
been reversed if it is being written out by endian aware helpers?

> +
>  } ARMInsn;
>
>  #define SHIFT_IMM_LSL(im)	(((im) << 7) | 0x00)
> @@ -1066,6 +1070,15 @@ static inline void tcg_out_goto_label(TCGContext *s, int cond, TCGLabel *l)
>      }
>  }
>
> +static inline void tcg_out_mb(TCGContext *s, TCGArg a0)
> +{
> +    if (use_armv7_instructions) {
> +        tcg_out32(s, INSN_DMB_ISH);
> +    } else if (use_armv6_instructions) {
> +        tcg_out32(s, INSN_DMB_MCR);
> +    }
> +}
> +
>  #ifdef CONFIG_SOFTMMU
>  /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
>   *                                     int mmu_idx, uintptr_t ra)
> @@ -1923,6 +1936,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          tcg_out_udiv(s, COND_AL, args[0], args[1], args[2]);
>          break;
>
> +    case INDEX_op_mb:
> +        tcg_out_mb(s, args[0]);
> +        break;
> +
>      case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
>      case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
>      case INDEX_op_call:     /* Always emitted via tcg_out_call.  */
> @@ -1997,6 +2014,7 @@ static const TCGTargetOpDef arm_op_defs[] = {
>      { INDEX_op_div_i32, { "r", "r", "r" } },
>      { INDEX_op_divu_i32, { "r", "r", "r" } },
>
> +    { INDEX_op_mb, { } },
>      { -1 },
>  };


--
Alex Bennée
