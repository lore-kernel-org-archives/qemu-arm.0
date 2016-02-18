Received: by 10.25.208.211 with SMTP id h202csp508799lfg;
        Thu, 18 Feb 2016 01:49:02 -0800 (PST)
X-Received: by 10.66.251.162 with SMTP id zl2mr8799235pac.116.1455788942101;
        Thu, 18 Feb 2016 01:49:02 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com. [2607:f8b0:400e:c00::22f])
        by mx.google.com with ESMTPS id sf6si8436978pac.76.2016.02.18.01.49.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2016 01:49:02 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::22f as permitted sender) client-ip=2607:f8b0:400e:c00::22f;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::22f as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x22f.google.com with SMTP id c10so29413178pfc.2;
        Thu, 18 Feb 2016 01:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=umbQTI0mbtYR+9MeysSleeq2J/yigQ4EpUG1bd/4pgg=;
        b=cJBJzaW5MO7VQMtc64bfpjRkTJMl2VOjKTeCxPmqwc8PRscIg3lBtx28o7v4pgcAnR
         G9nciJuzFIRZdXjmfFu6ndU+pj3hgtP+rxYV/evkt2IYxkk3xlENTZ2PBcAL4/DwWxMR
         pPnNNSVagXd4exlTeGt77KddRgihfCG/4pZbTZZN7PlzHyaZKHAuUYhfzlf03rIx6opE
         YUfK5SevcObULrw00aqTxLZMFzbhc7/wxA+IXiTn0GEKOCFwn5CQ3nlZAVIZtJXQQf8w
         ZjiNULoDrkFODUPqzZmlRFpUsj491F8iIhxeS3N18Hy+OW5UX9aUgR0xb/qfU5zqN0J1
         knHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=umbQTI0mbtYR+9MeysSleeq2J/yigQ4EpUG1bd/4pgg=;
        b=ZGxRBa5Gjm4Imi9zjgBN6TULcgXvZldz7yEmD9rlxFFx+AelFoWpCrI0vRpsX5Q4zQ
         Z+ZAlarwSC6scemOMfdFYweIPzkbSpYFvKwvyX7QSDLQZ4l2gKX9/S7Qz+Au5mGijlEH
         2UZ6LLwK9ypE8kURrM0B8x1mdngZieUlWH7/9ISA+RZnCW+bqklPP4cbrWv8pc0K5hio
         5NWmYNyWe9IRe2qAbopyTKimdDTCpA8QcAkJZ0izic4IjWOaaVZGer58K7RKNXTijaq0
         ywBegSu5KL3QihizqcZB2rpRr5wBmExyyKDADAJbJeDODgWzsE6Zmk824N4O2hQfQkW5
         yh8g==
X-Gm-Message-State: AG10YOSJ2V6Xz8j5zY0sQoONuXBvxNtujk9lXOtn90pj3bN9H83Qe5I89NCKo7+T+Wp0Ag==
X-Received: by 10.98.13.68 with SMTP id v65mr8627830pfi.150.1455788941639;
        Thu, 18 Feb 2016 01:49:01 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id u90sm8771620pfa.60.2016.02.18.01.48.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 01:48:59 -0800 (PST)
Date: Thu, 18 Feb 2016 10:48:54 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
	rth@twiddle.net, qemu-arm@nongnu.org, edgar.iglesias@xilinx.com
Subject: Re: [PATCH v1 3/9] target-arm: Add the thumb/IL flag to
 syn_data_abort
Message-ID: <20160218094854.GC4403@toto>
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
 <1455287642-28166-4-git-send-email-edgar.iglesias@gmail.com>
 <56C372C6.4080909@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56C372C6.4080909@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: +M+w4gLHJDLZ

On Tue, Feb 16, 2016 at 10:04:38PM +0300, Sergey Fedorov wrote:
> On 12.02.2016 17:33, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  target-arm/internals.h | 4 +++-
> >  target-arm/op_helper.c | 6 ++++--
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/target-arm/internals.h b/target-arm/internals.h
> > index 70bec4a..b1c483b 100644
> > --- a/target-arm/internals.h
> > +++ b/target-arm/internals.h
> > @@ -360,9 +360,11 @@ static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
> >  }
> >  
> >  static inline uint32_t syn_data_abort(int same_el, int ea, int cm, int s1ptw,
> > -                                      int wnr, int fsc)
> > +                                      int wnr, int fsc,
> > +                                      bool is_thumb)
> >  {
> >      return (EC_DATAABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
> > +        | (is_thumb ? 0 : ARM_EL_IL)
> >          | (ea << 9) | (cm << 8) | (s1ptw << 7) | (wnr << 6) | fsc;
> >  }
> >  
> > diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> > index bd48549..4e629e1 100644
> > --- a/target-arm/op_helper.c
> > +++ b/target-arm/op_helper.c
> > @@ -115,7 +115,8 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
> >              syn = syn_insn_abort(same_el, 0, fi.s1ptw, syn);
> >              exc = EXCP_PREFETCH_ABORT;
> >          } else {
> > -            syn = syn_data_abort(same_el, 0, 0, fi.s1ptw, is_write == 1, syn);
> > +            syn = syn_data_abort(same_el, 0, 0, fi.s1ptw, is_write == 1, syn,
> > +                                 env->thumb);
> >              if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
> >                  fsr |= (1 << 11);
> >              }
> > @@ -161,7 +162,8 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
> >      }
> >  
> >      raise_exception(env, EXCP_DATA_ABORT,
> > -                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21),
> > +                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21,
> > +                                   env->thumb),
> >                      target_el);
> >  }
> >  
> 
> ESR_ELx.IL is about instruction length. Thumb instructions can be
> 32-bit-long. In such case, IL should be set to 1 even if env->thumb is
> set. Additionally, a data abort exception for which the value of the ISV
> bit is 0, should also set IL to 1, no matter what was the instruction
> length. See ARM ARMv8 A.i, section D7.2.27 ESR_ELx, Exception Syndrome
> Register (ELx).

Yes, I'll fix this for the next version.

Thanks,
Edgar
