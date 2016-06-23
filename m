Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p76sm1455037wmd.10.2016.06.23.09.18.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jun 2016 09:18:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 919F03E0108;
	Thu, 23 Jun 2016 17:18:11 +0100 (BST)
User-agent: mu4e 0.9.17; emacs 25.0.95.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pranith Kumar <bobby.prani@gmail.com>
Cc: Claudio Fontana <claudio.fontana@huawei.com>, Richard Henderson <rth@twiddle.net>, "open list\:AArch64 target" <qemu-arm@nongnu.org>, "open list\:All patches CC here" <qemu-devel@nongnu.org>, serge.fdrv@gmail.com, Claudio Fontana <claudio.fontana@gmail.com>
Subject: Re: [RFC v3 PATCH 03/14] tcg/aarch64: Add support for fence
In-reply-to: <20160618040343.19517-4-bobby.prani@gmail.com>
Date: Thu, 23 Jun 2016 17:18:11 +0100
Message-ID: <87inwzri9o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: V2X9Cg4Bzpgx


Pranith Kumar <bobby.prani@gmail.com> writes:

> Cc: Claudio Fontana <claudio.fontana@gmail.com>
> Signed-off-by: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
> ---
>  tcg/aarch64/tcg-target.inc.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
> index 1447f7c..bc8ac9c 100644
> --- a/tcg/aarch64/tcg-target.inc.c
> +++ b/tcg/aarch64/tcg-target.inc.c
> @@ -372,6 +372,11 @@ typedef enum {
>      I3510_EOR       = 0x4a000000,
>      I3510_EON       = 0x4a200000,
>      I3510_ANDS      = 0x6a000000,
> +
> +    /* System instructions.  */
> +    DMB_ISH         = 0xd50338bf,

As ISH is part of the CRm encoding I wonder if this should be split into
the main DMB encoding (0xd50330bf) and a separate set of CRm defines.

In fact the documentation of the struct above implies you should
probably have:

       I6260_DMB       = 0xd50330bf,

And then:

static void tcg_out_insn_6260(TCGContext *s, AArch64Insn insn, int crm);
{
    tcg_out32(s, insn | (crm & 0xf) << 8);
}


Claudio,

Does this actually gain anything over doing a direct tcg_out? I guess it
makes a bit more sense for more complex instruction encodings.

> +    DMB_LD          = 0x00000100,
> +    DMB_ST          = 0x00000200,
>  } AArch64Insn;
>
>  static inline uint32_t tcg_in32(TCGContext *s)
> @@ -971,6 +976,21 @@ static inline void tcg_out_addsub2(TCGContext *s, int ext, TCGReg rl,
>      tcg_out_mov(s, ext, orig_rl, rl);
>  }
>
> +static inline void tcg_out_mb(TCGContext *s, TCGArg a0)
> +{
> +    switch (a0 & TCG_MO_ALL) {
> +    case TCG_MO_LD_LD:
> +        tcg_out32(s, DMB_ISH | DMB_LD);

This would then become:

    tcg_out_insn(s, 6260, DMB, R_LD)

> +        break;
> +    case TCG_MO_ST_ST:
> +        tcg_out32(s, DMB_ISH | DMB_ST);

    tcg_out_insn(s, 6260, DMB, R_ST)

> +        break;
> +    default:
> +        tcg_out32(s, DMB_ISH | DMB_LD | DMB_ST);

    tcg_out_insn(s, 6260, DMB, R_LD|R_ST)

> +        break;
> +    }
> +}
> +
>  #ifdef CONFIG_SOFTMMU
>  /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
>   *                                     TCGMemOpIdx oi, uintptr_t ra)
> @@ -1637,6 +1657,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>          tcg_out_insn(s, 3508, SMULH, TCG_TYPE_I64, a0, a1, a2);
>          break;
>
> +    case INDEX_op_mb:
> +        tcg_out_mb(s, a0);
> +        break;
> +
>      case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
>      case INDEX_op_mov_i64:
>      case INDEX_op_movi_i32: /* Always emitted via tcg_out_movi.  */
> @@ -1761,6 +1785,7 @@ static const TCGTargetOpDef aarch64_op_defs[] = {
>      { INDEX_op_muluh_i64, { "r", "r", "r" } },
>      { INDEX_op_mulsh_i64, { "r", "r", "r" } },
>
> +    { INDEX_op_mb, { } },
>      { -1 },
>  };


--
Alex Bennée
