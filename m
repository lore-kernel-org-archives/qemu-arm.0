Received: by 10.25.208.137 with SMTP id h131csp813452lfg;
        Fri, 29 Apr 2016 04:58:44 -0700 (PDT)
X-Received: by 10.28.227.138 with SMTP id a132mr3447583wmh.35.1461931124088;
        Fri, 29 Apr 2016 04:58:44 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com. [2a00:1450:400c:c09::241])
        by mx.google.com with ESMTPS id 189si3795483wmc.86.2016.04.29.04.58.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 04:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::241 as permitted sender) client-ip=2a00:1450:400c:c09::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::241 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x241.google.com with SMTP id w143so4427756wmw.3;
        Fri, 29 Apr 2016 04:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RdCNKitfylw/TDUNgyxw2P9citjaShIIcyn0uaV6VXc=;
        b=LJBQ+Jcy7P+lNVQ/n5NBTDOSoXfU6igAL6XizWvKSGLsCte3Z7pI4DY4gPyO5CJbi6
         60nhTqZxaHVYsNpKxGfsCwLzlgAPo1XGTL4kI6ZJjK4hoX0WgW/W72a6AtbSswJKL8Cj
         P5hC2M+87KTm45oWjTi69YjeGd4X22UDHpJ+FIMJv69P+BTynD4AZT4ThUm/fFKg++Y6
         9G1vS7D6d9CA9NVYrMQ5RJcAlpoPgbDaHFz+HZBow7trRVVoUBnsMefLfe+XV/v9SnRw
         7UJAKjDA/ug7nJoYgCwKGlv03U7OCESPvz05cMWdynIi6e6Ym7S2a4vNwZVPrIl9+085
         qPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RdCNKitfylw/TDUNgyxw2P9citjaShIIcyn0uaV6VXc=;
        b=iiJcwytWv4mT7F+3MKu2pdwf1yhwBWL3YblDadgL6r7+vvZL19aNs0dSdDOMpST2/C
         M8itqyYpvvpzLqtb30+jjGqsTfRtwTsnCZP76KEsuiVBsQU0Ex0gMkFraDTqiM9p9a/m
         eAyrm7ndKwfc+M88t+UqRgtRcdx0aEJX9emDgEEUtOVd8u8hTyGnEKtN2mZlynAa5D8O
         5LXEAHosalgUIDFjLlf8xd4OvydOSq/wv4I/cOV0EA+xczpTvSeInhRIYmS/ah36jlXg
         No2Qup6DCuc4ChBTK1fu/OAO0oX+WkbBTR5aqtOv0XRkt6Hfy1ebF+8S0s8v5m9S3nkR
         ywZA==
X-Gm-Message-State: AOPr4FWeQMx+e+SOYX9llSPiXpxxto1WZSpAP55eAmZd0IAnjSSBVevB31gl4XSE+imE6w==
X-Received: by 10.28.214.137 with SMTP id n131mr3554550wmg.33.1461931123789;
        Fri, 29 Apr 2016 04:58:43 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id kz1sm14445533wjc.46.2016.04.29.04.58.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 04:58:43 -0700 (PDT)
Date: Fri, 29 Apr 2016 13:58:42 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH v2 7/8] target-arm: A64: Create Instruction Syndromes for
 Data Aborts
Message-ID: <20160429115842.GX16305@toto>
References: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
 <1455912292-23807-8-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA_OWzNOcUPdQiSUfa_feJKUpNEx8JMC12CxvNnO-imCpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_OWzNOcUPdQiSUfa_feJKUpNEx8JMC12CxvNnO-imCpw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: D7PpoEs3Nq3o

On Thu, Feb 25, 2016 at 06:26:45PM +0000, Peter Maydell wrote:
> On 19 February 2016 at 20:04, Edgar E. Iglesias
> <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Add support for generating the instruction syndrome for Data Aborts.
> > These syndromes are used by hypervisors for example to trap and emulate
> > memory accesses.
> >
> > We save the decoded data out-of-band with the TBs at translation time.
> > When exceptions hit, the extra data attached to the TB is used to
> > recreate the state needed to encode instruction syndromes.
> > This avoids the need to emit moves with every load/store.
> >
> > Based on a suggestion from Peter Maydell.
> >
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  target-arm/cpu.h           |  2 +-
> >  target-arm/op_helper.c     | 47 +++++++++++++++++++++++-------
> >  target-arm/translate-a64.c | 72 +++++++++++++++++++++++++++++++++++++++++++++-
> >  target-arm/translate.c     |  5 +++-
> >  target-arm/translate.h     | 14 +++++++++
> >  5 files changed, 127 insertions(+), 13 deletions(-)
> >
> > diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> > index 1623821..c3ade8d 100644
> > --- a/target-arm/cpu.h
> > +++ b/target-arm/cpu.h
> > @@ -95,7 +95,7 @@
> >  struct arm_boot_info;
> >
> >  #define NB_MMU_MODES 7
> > -#define TARGET_INSN_START_EXTRA_WORDS 1
> > +#define TARGET_INSN_START_EXTRA_WORDS 2
> 
> A comment saying what our two extra words are would probably be helpful.

Yes, I've added a comment.

> 
> >
> >  /* We currently assume float and double are IEEE single and double
> >     precision respectively.
> 
> > +static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
> > +                                            unsigned int target_el,
> > +                                            bool same_el,
> > +                                            bool s1ptw, int is_write,
> > +                                            int fsc)
> > +{
> > +   uint32_t syn;
> > +
> > +    if (target_el != 2 || s1ptw) {
> > +        /* ISV is only set for data aborts routed to EL2 and
> > +         * never for stage-1 page table walks faulting on stage 2.
> > +         *
> > +         * See ARMv8 specs, D7-1974:
> > +         * ISS encoding for an exception from a Data Abort, the
> > +         * ISV field.
> > +         */
> > +        template_syn = 0;
> 
> IL should be set if ISV is clear, but this template_syn value doesn't
> have that. It might be simpler to just
>    return syn_data_abort_no_isv(stuff);
> here rather than using the OR-fields-together code path.
> 
> +    }
> +    /* Fields: IL, ISV, SAS, SSE, SRT, SF and AR come from the template
> +     * syndrome created at translation time.
> +     * Now we create the runtime syndrome with the remaining fields.
> +     */
> +    syn = syn_data_abort(same_el,
> +                         0, 0, 0, 0, 0, 0,
> +                         0, 0, s1ptw, is_write == 1, fsc,
> +                         0);
> 
> Since you pass in 0 for isv here, the IL bit will always be set
> in syn and thus in the returned value, even if the template_syn value
> from translate time said it should be clear.

Thanks, I've reworked this code. Hopefully fixing this issues.


> 
> +    /* Merge runtime syndrome with the template syndrome.  */
> +    syn |= template_syn;
> +    return syn;
> +}
> 
> > diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
> > index 9e26d5e..5250c08 100644
> > --- a/target-arm/translate-a64.c
> > +++ b/target-arm/translate-a64.c
> > @@ -1803,6 +1803,24 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
> >  }
> >  #endif
> >
> > +static void disas_ldr_update_isyn_sse_sf(DisasContext *s, int size,
> > +                                        bool is_signed, int opc)
> > +{
> > +    int opc0 = extract32(opc, 0, 1);
> > +    int regsize;
> > +
> > +    s->isyn.dabt.sse = is_signed;
> > +    /* Update the Sixty-Four bit (SF) registersize. This logic is derived
> > +     * from the ARMv8 specs for LDR (Shared decode for all encodings).
> > +     */
> > +    if (is_signed) {
> > +        regsize = opc0 ? 32 : 64;
> > +    } else {
> > +        regsize = size == 3 ? 64 : 32;
> > +    }
> > +    s->isyn.dabt.sf = regsize == 64;
> > +}
> > +
> >  /* C3.3.6 Load/store exclusive
> >   *
> >   *  31 30 29         24  23  22   21  20  16  15  14   10 9    5 4    0
> > @@ -1859,6 +1877,12 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
> >          } else {
> >              do_gpr_ld(s, tcg_rt, tcg_addr, size, false, false);
> >          }
> > +
> > +        /* Generate ISV for non-exclusive accesses including LASR.  */
> 
> The comment says "for non-exclusive accesses" but aren't we going to
> end up generating one for all accesses given where we are in the code ?

My understanding is that it's only for the case where is_excl gets set and
we end up calling gen_load/store_exclusive that we shouldn't create the ISS.
For other loads/stores, including load acquires, we should create one I think.


> 
> > +        s->isyn.dabt.valid = true;
> > +        s->isyn.dabt.sse = false;
> > +        s->isyn.dabt.sf = size == 3 ? 64 : 32;
> > +        s->isyn.dabt.ar = is_lasr;
> >      }
> >  }
> >
> > @@ -1901,6 +1925,11 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
> >          }
> >          size = 2 + extract32(opc, 0, 1);
> >          is_signed = extract32(opc, 1, 1);
> > +
> > +        /* Enable ISV generation.  */
> > +        s->isyn.dabt.valid = true;
> > +        s->isyn.dabt.sse = is_signed;
> > +        s->isyn.dabt.sf = size == 3 ? 64 : 32;
> 
> This code to update syndrome values ought to work, but it feels
> a little fragile in the face of future changes which might introduce
> code paths which add new guest load/store ops but don't set the syndrome
> info right.
> 
> How would it look if we instead set the syndrome information in
> the lower level functions which directly call the tcg_gen_qemu_ld/st
> functions? You'd need to pass more arguments into those functions,
> of course, but I think that would make it easier to review and be
> confident that we set the syndrome correctly for all the cases that
> we need to.

I've massaged the code to be more explicit about ISS generation, moving
the setup closer to tcg_gen_qemu_ld/st as you suggest. It looks OK, I'll
include the new version in v3.


> 
> 
> > @@ -2685,6 +2737,23 @@ static void disas_ldst(DisasContext *s, uint32_t insn)
> >          unallocated_encoding(s);
> >          break;
> >      }
> > +
> > +    /* The saved insn syndrome state in insn_start is already zero (invalid).
> > +     * We only update it if we have a valid insn syndrome to save.
> > +     */
> > +    if (s->isyn.dabt.valid) {
> > +        isyn32 = syn_data_abort(0,
> > +                                s->isyn.dabt.valid,
> > +                                s->isyn.dabt.sas,
> > +                                s->isyn.dabt.sse,
> > +                                s->isyn.dabt.srt,
> > +                                s->isyn.dabt.sf,
> > +                                s->isyn.dabt.ar,
> > +                                0, 0, 0, 0, 0, false);
> > +        /* We don't use the lower 14 bits.  */
> > +        isyn32 >>= 14;
> > +        tcg_set_insn_param(s->insn_start_idx, 2, isyn32);
> > +    }
> >  }
> >
> >  /* C3.4.6 PC-rel. addressing
> > @@ -11087,7 +11156,8 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
> >      tcg_clear_temp_count();
> >
> >      do {
> > -        tcg_gen_insn_start(dc->pc, 0);
> > +        dc->insn_start_idx = tcg_op_buf_count();
> > +        tcg_gen_insn_start(dc->pc, 0, 0);
> >          num_insns++;
> >
> >          if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
> > diff --git a/target-arm/translate.c b/target-arm/translate.c
> > index e69145d..7d83c94 100644
> > --- a/target-arm/translate.c
> > +++ b/target-arm/translate.c
> > @@ -11406,7 +11406,8 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
> >        }
> >      do {
> >          tcg_gen_insn_start(dc->pc,
> > -                           (dc->condexec_cond << 4) | (dc->condexec_mask >> 1));
> > +                           (dc->condexec_cond << 4) | (dc->condexec_mask >> 1),
> > +                           0);
> >          num_insns++;
> >
> >  #ifdef CONFIG_USER_ONLY
> > @@ -11722,8 +11723,10 @@ void restore_state_to_opc(CPUARMState *env, TranslationBlock *tb,
> >      if (is_a64(env)) {
> >          env->pc = data[0];
> >          env->condexec_bits = 0;
> > +        env->exception.syndrome = data[2] << 14;
> >      } else {
> >          env->regs[15] = data[0];
> >          env->condexec_bits = data[1];
> > +        env->exception.syndrome = data[2] << 14;
> 
> We should have a symbolic constant rather than this hardcoded 14
> (here and where we put the word into the insn stream).

Added one.

Cheers,
Edgar


> 
> >      }
> >  }
> > diff --git a/target-arm/translate.h b/target-arm/translate.h
> > index 53ef971..e002c90 100644
> > --- a/target-arm/translate.h
> > +++ b/target-arm/translate.h
> > @@ -58,6 +58,20 @@ typedef struct DisasContext {
> >      bool ss_same_el;
> >      /* Bottom two bits of XScale c15_cpar coprocessor access control reg */
> >      int c15_cpar;
> > +    /* State needed to create the Data Abort template syndrome.  */
> > +    struct {
> > +        /* Data Abort section.  */
> > +        struct {
> > +            bool valid;
> > +            unsigned int sas;
> > +            bool sse;
> > +            unsigned int srt;
> > +            bool sf;
> > +            bool ar;
> > +        } dabt;
> > +    } isyn;
> > +    /* TCG op index of the current insn_start.  */
> > +    int insn_start_idx;
> >  #define TMP_A64_MAX 16
> >      int tmp_a64_count;
> >      TCGv_i64 tmp_a64[TMP_A64_MAX];
> > --
> > 1.9.1
> 
> thanks
> -- PMM
