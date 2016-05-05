Received: by 10.25.208.137 with SMTP id h131csp806135lfg;
        Thu, 5 May 2016 08:56:08 -0700 (PDT)
X-Received: by 10.194.92.237 with SMTP id cp13mr15065936wjb.168.1462463768646;
        Thu, 05 May 2016 08:56:08 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-wm0-x22c.google.com (mail-wm0-x22c.google.com. [2a00:1450:400c:c09::22c])
        by mx.google.com with ESMTPS id hp7si12343966wjb.145.2016.05.05.08.56.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 May 2016 08:56:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::22c as permitted sender) client-ip=2a00:1450:400c:c09::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::22c as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x22c.google.com with SMTP id n129so26113384wmn.1;
        Thu, 05 May 2016 08:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CQMXmWUb3mH+V9IkrjzDf5EGmiKNoNAEwIpKk6Lnyd0=;
        b=u9naVUAZU3nmQQ2F76pMkrDnnia2K2GAQVUkxruKRgjqIyMMQrBg0T0JncknPBL+ud
         2EaBTh+AsSy58gAFK+uFc72kho36tqoyDYtqCffBj/iMqXccUa2Gkbqx0NS2L9cmPs9k
         20u33oBo+nkXxn4EVCitoUS2cnd2VkWEsn6IeqCwO1xcPkQa3vUvbD1I5fbeguKX7KD9
         26boBP0hl7lObJUIbgLmx2i9a8Wibbf7xTHpBMHSqrJqnEWIO9dxoomD2NWOBtf6IMRu
         FY3SURIWuZgO2NizWEqUfvUU7JI8+Xk32juGJyKHQD0Hdhxg6H4YVNzDna1iQG8TZJxs
         UwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CQMXmWUb3mH+V9IkrjzDf5EGmiKNoNAEwIpKk6Lnyd0=;
        b=eiu7IaHPzJr7j8SR5KEmIITGCAbAbQdjFbh9PWR5gtuoV3N7/feRjVr/2ENqNZbwf7
         BMyZwYZQjMC6SaiaHeu7Rvrv2vALrHKeKELuLc7xd7L9KOG27gbFeufGeT2ZbePQf8Lu
         FpQ8SgC+aDqe/B1PvfGOjiyOm9epWHHEFZiF5Q107lCozLzgrA5w0EATNsXymRXOo+nm
         Fq9bOBazcQV4oyVkKKUaeBREbeusc1DGMoKEbOMv6a+Srqm+ZZE9xni3onRZeyJ46atr
         NuNi5ap4lxJME4xVNA8HIb+4JEjzvjdM7u48qTTlrjaX0WuNjHPleQbxoX91NSc4hk+Q
         7YXQ==
X-Gm-Message-State: AOPr4FUgYxkyYgv5G6V1Yl5ljbHLaYf1+LpkGfW0+SEFXywE2RjiDH/hIcPYezlHPGL1OA==
X-Received: by 10.194.133.135 with SMTP id pc7mr15225677wjb.49.1462463768300;
        Thu, 05 May 2016 08:56:08 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id q77sm3809899wmd.12.2016.05.05.08.56.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 May 2016 08:56:07 -0700 (PDT)
Date: Thu, 5 May 2016 17:56:06 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH v3 7/7] target-arm: A64: Create Instruction Syndromes for
 Data Aborts
Message-ID: <20160505155606.GB16305@toto>
References: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
 <1461931684-1867-8-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA97rxkuGwY5ahSVXfBe8Y8XzWDZd143NBhVgFhLAKLi9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA97rxkuGwY5ahSVXfBe8Y8XzWDZd143NBhVgFhLAKLi9A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: 5omc23SRON6u

On Wed, May 04, 2016 at 06:38:49PM +0100, Peter Maydell wrote:
> On 29 April 2016 at 13:08, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
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
> 
> Worth mentioning in the commit message that we don't currently generate
> ISV information for exceptions from AArch32?

Yes, I've changed the first part of the commit message to:

target-arm: A64: Create Instruction Syndromes for Data Aborts

Add support for generating the ISS (Instruction Specific Syndrome) for
Data Abort exceptions taken from AArch64.

...



> 
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  target-arm/cpu.h           |  12 ++++-
> >  target-arm/op_helper.c     |  49 ++++++++++++++---
> >  target-arm/translate-a64.c | 130 +++++++++++++++++++++++++++++++++++++++------
> >  target-arm/translate.c     |   5 +-
> >  target-arm/translate.h     |   2 +
> >  5 files changed, 173 insertions(+), 25 deletions(-)
> >
> > diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> > index 066ff67..256fbec 100644
> > --- a/target-arm/cpu.h
> > +++ b/target-arm/cpu.h
> > @@ -94,7 +94,17 @@
> >  struct arm_boot_info;
> >
> >  #define NB_MMU_MODES 7
> > -#define TARGET_INSN_START_EXTRA_WORDS 1
> > +/* ARM-specific extra insn start words:
> > + * 1: Conditional execution bits
> > + * 2: Partial exception syndrome for data aborts
> > + */
> > +#define TARGET_INSN_START_EXTRA_WORDS 2
> > +
> > +/* The 2nd extra word holding syndrome info for data aborts does not use
> > + * the lower 14 bits. We shift it down to help the sleb128 encoder do a
> > + * better job. When restoring the CPU state, we shift it back up.
> > + */
> > +#define ARM_INSN_START_WORD2_SHIFT 14
> 
> We could also not bother putting bits 25..31 (ie the field that always reads
> EC_DATAABORT) in the insn start word.

Yes, good point. I'll mask them out for v4.


> 
> > @@ -720,23 +720,55 @@ static void gen_adc_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
> >   * Store from GPR register to memory.
> >   */
> >  static void do_gpr_st_memidx(DisasContext *s, TCGv_i64 source,
> > -                             TCGv_i64 tcg_addr, int size, int memidx)
> > +                             TCGv_i64 tcg_addr, int size, int memidx,
> > +                             bool iss_valid,
> > +                             unsigned int iss_srt,
> > +                             bool iss_sf, bool iss_ar)
> >  {
> >      g_assert(size <= 3);
> >      tcg_gen_qemu_st_i64(source, tcg_addr, memidx, s->be_data + size);
> > +
> > +    if (iss_valid) {
> > +        uint32_t isyn32;
> > +
> > +        isyn32 = syn_data_abort_with_iss(0,
> > +                                         size,
> > +                                         false,
> > +                                         iss_srt,
> > +                                         iss_sf,
> > +                                         iss_ar,
> > +                                         0, 0, 0, 0, 0, false);
> > +        isyn32 >>= ARM_INSN_START_WORD2_SHIFT;
> > +        tcg_set_insn_param(s->insn_start_idx, 2, isyn32);
> 
> Is it worth doing
>       assert(s->insn_start_idx);
>       tcg_set_insn_param(...);
>       s->insn_start_idx = 0;
> 
> as a way to catch accidentally trying to set the syndrome info twice ?

Yes, why not. I've done that in v4.



> 
> > +    }
> > +}
> > +
> > +static void do_gpr_st_with_isv(DisasContext *s, TCGv_i64 source,
> > +                               TCGv_i64 tcg_addr, int size,
> > +                               bool iss_valid,
> > +                               unsigned int iss_srt,
> > +                               bool iss_sf, bool iss_ar)
> > +{
> > +    do_gpr_st_memidx(s, source, tcg_addr, size, get_mem_index(s),
> > +                     iss_valid, iss_srt, iss_sf, iss_ar);
> >  }
> >
> >  static void do_gpr_st(DisasContext *s, TCGv_i64 source,
> >                        TCGv_i64 tcg_addr, int size)
> >  {
> > -    do_gpr_st_memidx(s, source, tcg_addr, size, get_mem_index(s));
> > +    do_gpr_st_with_isv(s, source, tcg_addr, size,
> > +                       false, 0, false, false);
> >  }
> 
> There's only two places where we use do_gpr_st() rather than the
> _with_isv() version (both in the load/store pair function), and
> similarly for do_gpr_ld(); so I think it would be better just to
> have do_gpr_ld/st always take the iss arguments and not have a
> separate do_gpr_st_with_isv(). (This also makes it harder to make
> the mistake of using the plain do_gpr_st() &c in future code and
> forgetting that you need to think about whether to set syndrome info.)

I've removed the _with_isv versions for v4.


> Not in this patch series but something we need to fix:
> 
> (1) currently in arm_cpu_do_interrupt_aarch64() there is some
> code which does
>         if (!env->thumb) {
>             env->cp15.esr_el[new_el] |= 1 << 25;
>         }
> if we take an exception from 32 bit to 64 bit. This is completely
> bogus because that's not what the IL bit in the syndrome is for.
> This code should just be deleted, and rely on exception.syndrome
> having a correct IL bit (which it didn't for data aborts before
> your series but will afterwards).
> 
> (2) syn_insn_abort(), syn_swstep(), syn_watchpoint()
> should all create syndromes with the IL bit set, but don't.


Sounds good!

Thanks,
Edgar
