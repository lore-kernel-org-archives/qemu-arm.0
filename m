Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g195sm3805212wme.23.2016.06.24.09.17.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jun 2016 09:17:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id F40AF3E00F9;
	Fri, 24 Jun 2016 17:17:18 +0100 (BST)
User-agent: mu4e 0.9.17; emacs 25.0.95.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pranith Kumar <bobby.prani@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, "open list\:ARM" <qemu-arm@nongnu.org>, "open list\:All patches CC here" <qemu-devel@nongnu.org>, serge.fdrv@gmail.com, rth@twiddle.net
Subject: Re: [RFC v3 PATCH 13/14] aarch64: Generate fences for aarch64
In-reply-to: <20160618040343.19517-14-bobby.prani@gmail.com>
Date: Fri, 24 Jun 2016 17:17:18 +0100
Message-ID: <87h9cizhm9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: kLDSI/tVp9OP


Pranith Kumar <bobby.prani@gmail.com> writes:

> Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
> ---
>  target-arm/translate-a64.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
> index ce8141a..fa24bf2 100644
> --- a/target-arm/translate-a64.c
> +++ b/target-arm/translate-a64.c
> @@ -1250,7 +1250,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
>          return;
>      case 4: /* DSB */
>      case 5: /* DMB */
> -        /* We don't emulate caches so barriers are no-ops */
> +        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
>          return;
>      case 6: /* ISB */
>          /* We need to break the TB after this insn to execute
> @@ -1855,23 +1855,31 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
>      }
>      tcg_addr = read_cpu_reg_sp(s, rn, 1);
>
> -    /* Note that since TCG is single threaded load-acquire/store-release
> -     * semantics require no extra if (is_lasr) { ... } handling.
> -     */
> -
>      if (is_excl) {
>          if (!is_store) {
>              s->is_ldex = true;
>              gen_load_exclusive(s, rt, rt2, tcg_addr, size, is_pair);
> +            if (is_lasr) {
> +                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_ACQ);
> +            }
>          } else {
> +            if (is_lasr) {
> +                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_REL);
> +            }
>              gen_store_exclusive(s, rs, rt, rt2, tcg_addr, size, is_pair);
>          }
>      } else {
>          TCGv_i64 tcg_rt = cpu_reg(s, rt);
>          if (is_store) {
> +            if (is_lasr) {
> +                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_REL);
> +            }
>              do_gpr_st(s, tcg_rt, tcg_addr, size);
>          } else {
>              do_gpr_ld(s, tcg_rt, tcg_addr, size, false, false);
> +            if (is_lasr) {
> +                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_ACQ);
> +            }

See the private email I sent you with the litmus tests. I think you'll
need to confirm this is working as expected.

>          }
>      }
>  }


--
Alex Bennée
