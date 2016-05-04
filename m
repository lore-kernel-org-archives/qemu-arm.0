Received: by 10.25.208.137 with SMTP id h131csp296195lfg;
        Wed, 4 May 2016 10:39:09 -0700 (PDT)
X-Received: by 10.37.11.216 with SMTP id 207mr5942743ybl.184.1462383549561;
        Wed, 04 May 2016 10:39:09 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-yw0-x22c.google.com (mail-yw0-x22c.google.com. [2607:f8b0:4002:c05::22c])
        by mx.google.com with ESMTPS id c189si1782745ybh.13.2016.05.04.10.39.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 May 2016 10:39:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c05::22c as permitted sender) client-ip=2607:f8b0:4002:c05::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c05::22c as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-yw0-x22c.google.com with SMTP id o66so108246062ywc.3
        for <alex.bennee@linaro.org>; Wed, 04 May 2016 10:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ZIrBwIX7FhwGqzuP5Bh/PkZPAj+CQpc4uAes+/rAfYI=;
        b=JU/v/uB5lfaqNS0Oq90cZDYqg2oJ8+meP3bgaLhRmZBMHHd5vbO3tQ4R5KjnE0DY2M
         WzqmCMEEcsZyTSLgRY6sOKiMOgVrPXf31eoyTwE1AgYjX8YMo1WGL1oJ32uZnGhq/YkI
         0e6l9k/CVuSViQ754iJ75qYK3148hRsde9SQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ZIrBwIX7FhwGqzuP5Bh/PkZPAj+CQpc4uAes+/rAfYI=;
        b=h4DY0UvBFObtjl3qiWeSWEN+mWimCfi9si7fEOxUBOC6tPri9eL26R3Ubcqi2ECTdX
         w7ohiwNTbHNxswa2jkdaizS4C+qYF0xM4aQ8cRIz83f6KdcrZsYU0I0UJ8ABHDEhSSKQ
         2SibMCRvnS68eW0AN0/X8zvFM6Nv3fG0gvu/ca2CZ3SxUHDvidf6rKSwxUKY14UszNuS
         iv6WLmUBn8uGzC1J088Q1E3Tuou6PkXSRJ6EssN1sSDMBssmnYPEd9D/qGYa5qLsvu3o
         Haj1ABwH8/KNhTIdCcQfpGH9CIPlfSCibMZSk/sEKBTESIDGu0WAdpWqFzVu5eNwjDjh
         WfsA==
X-Gm-Message-State: AOPr4FUgDp+Dbd4mpFLvBojLSAsBOV3+Pza9UfhdIveyPCEFtxkT1H5GZLN39cPJRp/aV/rLs0OM8npsg6vFYY7O1Jo=
X-Received: by 10.176.0.204 with SMTP id 70mr6723406uaj.4.1462383549014; Wed,
 04 May 2016 10:39:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 4 May 2016 10:38:49 -0700 (PDT)
In-Reply-To: <1461931684-1867-8-git-send-email-edgar.iglesias@gmail.com>
References: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com> <1461931684-1867-8-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2016 18:38:49 +0100
Message-ID: <CAFEAcA97rxkuGwY5ahSVXfBe8Y8XzWDZd143NBhVgFhLAKLi9A@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] target-arm: A64: Create Instruction Syndromes for
 Data Aborts
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Sergey Fedorov <serge.fdrv@gmail.com>, Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: WH1bzuoxME/g

On 29 April 2016 at 13:08, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add support for generating the instruction syndrome for Data Aborts.
> These syndromes are used by hypervisors for example to trap and emulate
> memory accesses.
>
> We save the decoded data out-of-band with the TBs at translation time.
> When exceptions hit, the extra data attached to the TB is used to
> recreate the state needed to encode instruction syndromes.
> This avoids the need to emit moves with every load/store.
>
> Based on a suggestion from Peter Maydell.

Worth mentioning in the commit message that we don't currently generate
ISV information for exceptions from AArch32?

> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target-arm/cpu.h           |  12 ++++-
>  target-arm/op_helper.c     |  49 ++++++++++++++---
>  target-arm/translate-a64.c | 130 +++++++++++++++++++++++++++++++++++++++------
>  target-arm/translate.c     |   5 +-
>  target-arm/translate.h     |   2 +
>  5 files changed, 173 insertions(+), 25 deletions(-)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 066ff67..256fbec 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -94,7 +94,17 @@
>  struct arm_boot_info;
>
>  #define NB_MMU_MODES 7
> -#define TARGET_INSN_START_EXTRA_WORDS 1
> +/* ARM-specific extra insn start words:
> + * 1: Conditional execution bits
> + * 2: Partial exception syndrome for data aborts
> + */
> +#define TARGET_INSN_START_EXTRA_WORDS 2
> +
> +/* The 2nd extra word holding syndrome info for data aborts does not use
> + * the lower 14 bits. We shift it down to help the sleb128 encoder do a
> + * better job. When restoring the CPU state, we shift it back up.
> + */
> +#define ARM_INSN_START_WORD2_SHIFT 14

We could also not bother putting bits 25..31 (ie the field that always reads
EC_DATAABORT) in the insn start word.

> @@ -720,23 +720,55 @@ static void gen_adc_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
>   * Store from GPR register to memory.
>   */
>  static void do_gpr_st_memidx(DisasContext *s, TCGv_i64 source,
> -                             TCGv_i64 tcg_addr, int size, int memidx)
> +                             TCGv_i64 tcg_addr, int size, int memidx,
> +                             bool iss_valid,
> +                             unsigned int iss_srt,
> +                             bool iss_sf, bool iss_ar)
>  {
>      g_assert(size <= 3);
>      tcg_gen_qemu_st_i64(source, tcg_addr, memidx, s->be_data + size);
> +
> +    if (iss_valid) {
> +        uint32_t isyn32;
> +
> +        isyn32 = syn_data_abort_with_iss(0,
> +                                         size,
> +                                         false,
> +                                         iss_srt,
> +                                         iss_sf,
> +                                         iss_ar,
> +                                         0, 0, 0, 0, 0, false);
> +        isyn32 >>= ARM_INSN_START_WORD2_SHIFT;
> +        tcg_set_insn_param(s->insn_start_idx, 2, isyn32);

Is it worth doing
      assert(s->insn_start_idx);
      tcg_set_insn_param(...);
      s->insn_start_idx = 0;

as a way to catch accidentally trying to set the syndrome info twice ?

> +    }
> +}
> +
> +static void do_gpr_st_with_isv(DisasContext *s, TCGv_i64 source,
> +                               TCGv_i64 tcg_addr, int size,
> +                               bool iss_valid,
> +                               unsigned int iss_srt,
> +                               bool iss_sf, bool iss_ar)
> +{
> +    do_gpr_st_memidx(s, source, tcg_addr, size, get_mem_index(s),
> +                     iss_valid, iss_srt, iss_sf, iss_ar);
>  }
>
>  static void do_gpr_st(DisasContext *s, TCGv_i64 source,
>                        TCGv_i64 tcg_addr, int size)
>  {
> -    do_gpr_st_memidx(s, source, tcg_addr, size, get_mem_index(s));
> +    do_gpr_st_with_isv(s, source, tcg_addr, size,
> +                       false, 0, false, false);
>  }

There's only two places where we use do_gpr_st() rather than the
_with_isv() version (both in the load/store pair function), and
similarly for do_gpr_ld(); so I think it would be better just to
have do_gpr_ld/st always take the iss arguments and not have a
separate do_gpr_st_with_isv(). (This also makes it harder to make
the mistake of using the plain do_gpr_st() &c in future code and
forgetting that you need to think about whether to set syndrome info.)


Not in this patch series but something we need to fix:

(1) currently in arm_cpu_do_interrupt_aarch64() there is some
code which does
        if (!env->thumb) {
            env->cp15.esr_el[new_el] |= 1 << 25;
        }
if we take an exception from 32 bit to 64 bit. This is completely
bogus because that's not what the IL bit in the syndrome is for.
This code should just be deleted, and rely on exception.syndrome
having a correct IL bit (which it didn't for data aborts before
your series but will afterwards).

(2) syn_insn_abort(), syn_swstep(), syn_watchpoint()
should all create syndromes with the IL bit set, but don't.

thanks
-- PMM
