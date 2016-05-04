Received: by 10.25.208.137 with SMTP id h131csp288157lfg;
        Wed, 4 May 2016 10:21:06 -0700 (PDT)
X-Received: by 10.28.35.208 with SMTP id j199mr10648016wmj.22.1462382466696;
        Wed, 04 May 2016 10:21:06 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com. [2a00:1450:400c:c09::230])
        by mx.google.com with ESMTPS id bz1si6201156wjb.84.2016.05.04.10.21.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 May 2016 10:21:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::230 as permitted sender) client-ip=2a00:1450:400c:c09::230;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::230 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x230.google.com with SMTP id e201so197221556wme.0;
        Wed, 04 May 2016 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6cheTlkfolsdJ9xmaIBlE2WNcVaga6Mjuztofj8TuCA=;
        b=B/N5WzN46lrHNuC6uJAh6dqgudZqaBcJjpBG7K2ha6I/Wux4CoiT3tWPhFIa0YPjTR
         Bjjq/KG1TOFTb3wzRz3I58cLn11FS8CU60DUcjyPXIGw0PDUYGSjJDBCCP2koQTDibvR
         zOu9zko3XacaZxcVGAnxX96pO8JJulxa37wZLKyrVVuuGn4xbMfVdklSpXu/uQ5bGy8I
         amA/ZVNIDAsrwkQTZRtrHQpNNnFAlO4Baqzhu2Jg2iDhza9RVWpTa/ISTcYnJOOBjkCB
         YhoPhR9CxLS2mVIYMh8YAfjXbMlOvpBkdMb3f7S1UTHgJS7AJCzftXFND3yrkl/J5+1M
         3gjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6cheTlkfolsdJ9xmaIBlE2WNcVaga6Mjuztofj8TuCA=;
        b=MpP6pOOpp/IryLs69XRE8U5NR7G7DcLGk4Zil3C3pt82C5n88VRulf1WjDJ9kWWwvh
         iTVRDcbrteTf0m9d5poA1LABhsgloy25nzs6h0jOapeVaqIwHOK7osz6ZkgmJ/+8U/BH
         VJTHNggGr+SqYIgUf131D4g//BMOp06a1dTJAvyng9LLSRUQ5CtALxGQCQUdVGDPZNy0
         Q0OH23r8vnrqeB8SRFoGKpI4onJA52p9MpG7oHlVcWfk1FquY9Lg6noMeOg+H+uIebkC
         FaaiW6IL7rD+AV8WIA84PK/1yP73c2Zh90JTG1KKgrGnUh38SyElue2I0mEeKNoRLtPJ
         BLCA==
X-Gm-Message-State: AOPr4FWYqN3f6OoL9RJhf83gsf9YG+RxyvWw8YxBSXbrsEuucadBdkgUSj9zNeu8Ced26A==
X-Received: by 10.194.179.233 with SMTP id dj9mr9844324wjc.115.1462382466350;
        Wed, 04 May 2016 10:21:06 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id g197sm6087172wme.15.2016.05.04.10.21.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 May 2016 10:21:05 -0700 (PDT)
Date: Wed, 4 May 2016 19:21:04 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH v3 3/7] target-arm: Add the IL flag to syn_data_abort
Message-ID: <20160504172104.GZ16305@toto>
References: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
 <1461931684-1867-4-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA_qcsb-QF_QZmO=xx39D_JoNLpPN__LXcHYuwbFkvThug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_qcsb-QF_QZmO=xx39D_JoNLpPN__LXcHYuwbFkvThug@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: RYMFuQ1XcY44

On Wed, May 04, 2016 at 06:06:34PM +0100, Peter Maydell wrote:
> On 29 April 2016 at 13:08, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Add the IL flag to syn_data_abort(). Since we at the moment
> > never set ISV, the IL flag is always set to one.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  target-arm/internals.h | 4 +++-
> >  target-arm/op_helper.c | 6 ++++--
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/target-arm/internals.h b/target-arm/internals.h
> > index 2e70272..34e2688 100644
> > --- a/target-arm/internals.h
> > +++ b/target-arm/internals.h
> > @@ -384,9 +384,11 @@ static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
> >  }
> >
> >  static inline uint32_t syn_data_abort(int same_el, int ea, int cm, int s1ptw,
> > -                                      int wnr, int fsc)
> > +                                      int wnr, int fsc,
> > +                                      bool is_16bit)
> >  {
> >      return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
> > +        | (is_16bit ? 0 : ARM_EL_IL)
> >          | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
> >  }
> >
> > diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> > index d626ff1..e69c1de 100644
> > --- a/target-arm/op_helper.c
> > +++ b/target-arm/op_helper.c
> > @@ -115,7 +115,8 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> >              syn = syn_insn_abort(same_el, 0, fi.s1ptw, syn);
> >              exc = EXCP_PREFETCH_ABORT;
> >          } else {
> > -            syn = syn_data_abort(same_el, 0, 0, fi.s1ptw, is_write == 1, syn);
> > +            syn = syn_data_abort(same_el, 0, 0, fi.s1ptw, is_write == 1, syn,
> > +                                 1);
> >              if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
> >                  fsr |= (1 << 11);
> >              }
> > @@ -161,7 +162,8 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
> >      }
> >
> >      raise_exception(env, EXCP_DATA_ABORT,
> > -                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21),
> > +                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21,
> > +                                   1),
> >                      target_el);
> >  }
> 
> Shouldn't this patch be squashed into patch 4? Pretty much everything it
> does is undone by the next patch...

Yes, sounds good, we can do that.

Thanks,
Edgar
