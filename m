Received: by 10.25.208.211 with SMTP id h202csp2957350lfg;
        Thu, 25 Feb 2016 10:27:05 -0800 (PST)
X-Received: by 10.31.192.147 with SMTP id q141mr38738915vkf.96.1456424825690;
        Thu, 25 Feb 2016 10:27:05 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x230.google.com (mail-vk0-x230.google.com. [2607:f8b0:400c:c05::230])
        by mx.google.com with ESMTPS id o196si6098026vke.72.2016.02.25.10.27.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Feb 2016 10:27:05 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::230 as permitted sender) client-ip=2607:f8b0:400c:c05::230;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::230 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x230.google.com with SMTP id k196so56264878vka.0
        for <alex.bennee@linaro.org>; Thu, 25 Feb 2016 10:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=Zk2UgM8OMt/K24RjGglTTvczgEkCaOYmNsthFGoyH7g=;
        b=TpNQSBl+o6cQ0R55GoGZCtbd8iLoSKZLbkUF0ghYG9SXflc9BgCN8fhc4kjUT9Z6tx
         rWqcxKSxqFOv3el3WJadOKdyHKRdmLdHCrn9ohvgrQp1RXnFvaWp9AfT+fBILi/+u6Bp
         JRoqfTIycvDzQhaS0IXxCKQI0CpRxxNjnJVfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=Zk2UgM8OMt/K24RjGglTTvczgEkCaOYmNsthFGoyH7g=;
        b=chGy25ARBMaiLfCrqoz7XYIssY/7ysMQ4d05dIMTkCnaAqmuNphucIVX05zIBJmg97
         BlMGMiOOhRRoHGwwLHTh5niI9qAzI/2y6IgoPIBnsxcJC3wWGzYJkP2V2gyYMfL18S5T
         fwa4Dbhix6pPOiHzVoyHjZjE/AccUqDa3yEKMJG88L67Q6/zVpaQyzf09rLaVShy5Y0D
         1+uoTyUNY2XPqk1wW5e32hS7cFH/CTzzWB8wQubjUKdGKqXdnjQobZRX9KD7sXFMOUay
         dP911WsifApljnhEQEAH+w12dEIb7qnb4RKCooYMSXKcd1JmJvf6inVQda0ljg1/0kCd
         RMEw==
X-Gm-Message-State: AG10YORXBPxB6Y9mZIvFX8TGRnIn/IUwb26JU0qDUDO3vwFjWIW+8iYn0cOlWqjPqjmgcnw2WS9gwgkHY+Rfn39Qtpw=
X-Received: by 10.31.141.2 with SMTP id p2mr38559765vkd.37.1456424825339; Thu,
 25 Feb 2016 10:27:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 10:26:45 -0800 (PST)
In-Reply-To: <1455912292-23807-8-git-send-email-edgar.iglesias@gmail.com>
References: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com> <1455912292-23807-8-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 18:26:45 +0000
Message-ID: <CAFEAcA_OWzNOcUPdQiSUfa_feJKUpNEx8JMC12CxvNnO-imCpw@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] target-arm: A64: Create Instruction Syndromes for
 Data Aborts
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Sergey Fedorov <serge.fdrv@gmail.com>, Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: qBy8AZgKiLeq

On 19 February 2016 at 20:04, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
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
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target-arm/cpu.h           |  2 +-
>  target-arm/op_helper.c     | 47 +++++++++++++++++++++++-------
>  target-arm/translate-a64.c | 72 +++++++++++++++++++++++++++++++++++++++++++++-
>  target-arm/translate.c     |  5 +++-
>  target-arm/translate.h     | 14 +++++++++
>  5 files changed, 127 insertions(+), 13 deletions(-)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 1623821..c3ade8d 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -95,7 +95,7 @@
>  struct arm_boot_info;
>
>  #define NB_MMU_MODES 7
> -#define TARGET_INSN_START_EXTRA_WORDS 1
> +#define TARGET_INSN_START_EXTRA_WORDS 2

A comment saying what our two extra words are would probably be helpful.

>
>  /* We currently assume float and double are IEEE single and double
>     precision respectively.

> +static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
> +                                            unsigned int target_el,
> +                                            bool same_el,
> +                                            bool s1ptw, int is_write,
> +                                            int fsc)
> +{
> +   uint32_t syn;
> +
> +    if (target_el != 2 || s1ptw) {
> +        /* ISV is only set for data aborts routed to EL2 and
> +         * never for stage-1 page table walks faulting on stage 2.
> +         *
> +         * See ARMv8 specs, D7-1974:
> +         * ISS encoding for an exception from a Data Abort, the
> +         * ISV field.
> +         */
> +        template_syn = 0;

IL should be set if ISV is clear, but this template_syn value doesn't
have that. It might be simpler to just
   return syn_data_abort_no_isv(stuff);
here rather than using the OR-fields-together code path.

+    }
+    /* Fields: IL, ISV, SAS, SSE, SRT, SF and AR come from the template
+     * syndrome created at translation time.
+     * Now we create the runtime syndrome with the remaining fields.
+     */
+    syn = syn_data_abort(same_el,
+                         0, 0, 0, 0, 0, 0,
+                         0, 0, s1ptw, is_write == 1, fsc,
+                         0);

Since you pass in 0 for isv here, the IL bit will always be set
in syn and thus in the returned value, even if the template_syn value
from translate time said it should be clear.

+    /* Merge runtime syndrome with the template syndrome.  */
+    syn |= template_syn;
+    return syn;
+}

> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
> index 9e26d5e..5250c08 100644
> --- a/target-arm/translate-a64.c
> +++ b/target-arm/translate-a64.c
> @@ -1803,6 +1803,24 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
>  }
>  #endif
>
> +static void disas_ldr_update_isyn_sse_sf(DisasContext *s, int size,
> +                                        bool is_signed, int opc)
> +{
> +    int opc0 = extract32(opc, 0, 1);
> +    int regsize;
> +
> +    s->isyn.dabt.sse = is_signed;
> +    /* Update the Sixty-Four bit (SF) registersize. This logic is derived
> +     * from the ARMv8 specs for LDR (Shared decode for all encodings).
> +     */
> +    if (is_signed) {
> +        regsize = opc0 ? 32 : 64;
> +    } else {
> +        regsize = size == 3 ? 64 : 32;
> +    }
> +    s->isyn.dabt.sf = regsize == 64;
> +}
> +
>  /* C3.3.6 Load/store exclusive
>   *
>   *  31 30 29         24  23  22   21  20  16  15  14   10 9    5 4    0
> @@ -1859,6 +1877,12 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
>          } else {
>              do_gpr_ld(s, tcg_rt, tcg_addr, size, false, false);
>          }
> +
> +        /* Generate ISV for non-exclusive accesses including LASR.  */

The comment says "for non-exclusive accesses" but aren't we going to
end up generating one for all accesses given where we are in the code ?

> +        s->isyn.dabt.valid = true;
> +        s->isyn.dabt.sse = false;
> +        s->isyn.dabt.sf = size == 3 ? 64 : 32;
> +        s->isyn.dabt.ar = is_lasr;
>      }
>  }
>
> @@ -1901,6 +1925,11 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
>          }
>          size = 2 + extract32(opc, 0, 1);
>          is_signed = extract32(opc, 1, 1);
> +
> +        /* Enable ISV generation.  */
> +        s->isyn.dabt.valid = true;
> +        s->isyn.dabt.sse = is_signed;
> +        s->isyn.dabt.sf = size == 3 ? 64 : 32;

This code to update syndrome values ought to work, but it feels
a little fragile in the face of future changes which might introduce
code paths which add new guest load/store ops but don't set the syndrome
info right.

How would it look if we instead set the syndrome information in
the lower level functions which directly call the tcg_gen_qemu_ld/st
functions? You'd need to pass more arguments into those functions,
of course, but I think that would make it easier to review and be
confident that we set the syndrome correctly for all the cases that
we need to.


> @@ -2685,6 +2737,23 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
>          unallocated_encoding(s);
>          break;
>      }
> +
> +    /* The saved insn syndrome state in insn_start is already zero (invalid).
> +     * We only update it if we have a valid insn syndrome to save.
> +     */
> +    if (s->isyn.dabt.valid) {
> +        isyn32 = syn_data_abort(0,
> +                                s->isyn.dabt.valid,
> +                                s->isyn.dabt.sas,
> +                                s->isyn.dabt.sse,
> +                                s->isyn.dabt.srt,
> +                                s->isyn.dabt.sf,
> +                                s->isyn.dabt.ar,
> +                                0, 0, 0, 0, 0, false);
> +        /* We don't use the lower 14 bits.  */
> +        isyn32 >>= 14;
> +        tcg_set_insn_param(s->insn_start_idx, 2, isyn32);
> +    }
>  }
>
>  /* C3.4.6 PC-rel. addressing
> @@ -11087,7 +11156,8 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
>      tcg_clear_temp_count();
>
>      do {
> -        tcg_gen_insn_start(dc->pc, 0);
> +        dc->insn_start_idx = tcg_op_buf_count();
> +        tcg_gen_insn_start(dc->pc, 0, 0);
>          num_insns++;
>
>          if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index e69145d..7d83c94 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -11406,7 +11406,8 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>        }
>      do {
>          tcg_gen_insn_start(dc->pc,
> -                           (dc->condexec_cond << 4) | (dc->condexec_mask >> 1));
> +                           (dc->condexec_cond << 4) | (dc->condexec_mask >> 1),
> +                           0);
>          num_insns++;
>
>  #ifdef CONFIG_USER_ONLY
> @@ -11722,8 +11723,10 @@ void restore_state_to_opc(CPUARMState *env, TranslationBlock *tb,
>      if (is_a64(env)) {
>          env->pc = data[0];
>          env->condexec_bits = 0;
> +        env->exception.syndrome = data[2] << 14;
>      } else {
>          env->regs[15] = data[0];
>          env->condexec_bits = data[1];
> +        env->exception.syndrome = data[2] << 14;

We should have a symbolic constant rather than this hardcoded 14
(here and where we put the word into the insn stream).

>      }
>  }
> diff --git a/target-arm/translate.h b/target-arm/translate.h
> index 53ef971..e002c90 100644
> --- a/target-arm/translate.h
> +++ b/target-arm/translate.h
> @@ -58,6 +58,20 @@ typedef struct DisasContext {
>      bool ss_same_el;
>      /* Bottom two bits of XScale c15_cpar coprocessor access control reg */
>      int c15_cpar;
> +    /* State needed to create the Data Abort template syndrome.  */
> +    struct {
> +        /* Data Abort section.  */
> +        struct {
> +            bool valid;
> +            unsigned int sas;
> +            bool sse;
> +            unsigned int srt;
> +            bool sf;
> +            bool ar;
> +        } dabt;
> +    } isyn;
> +    /* TCG op index of the current insn_start.  */
> +    int insn_start_idx;
>  #define TMP_A64_MAX 16
>      int tmp_a64_count;
>      TCGv_i64 tmp_a64[TMP_A64_MAX];
> --
> 1.9.1

thanks
-- PMM
