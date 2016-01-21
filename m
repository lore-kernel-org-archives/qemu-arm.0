Received: by 10.25.159.19 with SMTP id i19csp3774025lfe;
        Thu, 21 Jan 2016 07:04:57 -0800 (PST)
X-Received: by 10.60.67.166 with SMTP id o6mr32492076oet.77.1453388697762;
        Thu, 21 Jan 2016 07:04:57 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com. [2607:f8b0:4003:c06::242])
        by mx.google.com with ESMTPS id s126si1570146oig.56.2016.01.21.07.04.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2016 07:04:57 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) client-ip=2607:f8b0:4003:c06::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-oi0-x242.google.com with SMTP id e195so2251378oig.2;
        Thu, 21 Jan 2016 07:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=AD/4ChteU94WeHgp02rhKy6ttIgqtWgNowzJP0cMJBI=;
        b=WLkCdWhDFKocpKLMQqGtFDYisBOudC9jSzLm14D5pUtxuXOTNdMcik8MVD6mmH4P2j
         A/V53ThhVag1rOAKxFNkQ+93nH8Np/RoYWtsbp1NoKTAaAIMXsjpzE9ZT2Tfanzb/hz9
         Ijz2nIBHt47zhdFlTpRWur26gbExGXFFWzkQhYHcDiK5kg3YEFspwXkzQ9U0hjRmQY2f
         beCqy8h5Qbrf5vISn96CecEwbL2kDLqc5trj7H5t+swLVZ2mlhXYBdEp/VtWTVwVVZfJ
         t7nTiFOMFCfSqy11R+iaV9NM2H68le1iHetM8/CGYb6U0z4ZQioPplbDEDLVbdjGdMjZ
         YN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=AD/4ChteU94WeHgp02rhKy6ttIgqtWgNowzJP0cMJBI=;
        b=BDJkSuiENcVME3odQ6qfV/eJcNOsisp+QkPSMFZEAOybyEBCcXrRHHcUUNsQnOJiEr
         idbiLaqUD89u60bdLCyzHIiHuKceCIajclfTjDjErE/gIrYgvecnebooKD0Sou7tE9qf
         2O2//dCEPBtnEeYjXDhFph1IKQ3pKKx1sPqlNPi5QKbz5Dyef4nmf1V56ERF0as5PPBg
         588C09Xcl08Ggd+KjIk5LG7QjKNrDL+smRhxum0rnCu11E3ps2OawsxiWAmeUsAQhQge
         qw9EqPB97XLx9KeU4WuNg1hLWsQafel8yq2R5dOUVyZ+GJkBuWlVITYY25P9hIbEVIUI
         neqw==
X-Gm-Message-State: AG10YOSeiXJaBik5Hdmr4AwrakJe40urnO8S9a19CutYKNgUv0a9Z4DCbqS4r1Bf3FfHlg==
X-Received: by 10.202.4.82 with SMTP id 79mr6749361oie.118.1453388697397;
        Thu, 21 Jan 2016 07:04:57 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id a1sm714060obt.0.2016.01.21.07.04.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 07:04:56 -0800 (PST)
Date: Thu, 21 Jan 2016 16:04:31 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: Re: [PATCH v1 2/3] target-arm: Make pamax an argument to
 check_s2_startlevel
Message-ID: <20160121150431.GA25287@toto>
References: <1453297780-12514-1-git-send-email-edgar.iglesias@gmail.com>
 <1453297780-12514-3-git-send-email-edgar.iglesias@gmail.com>
 <878u3jce48.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878u3jce48.fsf@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: j48tQ+Ov9qj4

On Thu, Jan 21, 2016 at 12:26:47PM +0000, Alex Bennée wrote:
> 
> Edgar E. Iglesias <edgar.iglesias@gmail.com> writes:
> 
> > From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >
> > Make pamax an argument to check_s2_startlevel in preparation
> > for future reuse.
> >
> > No functional change.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > ---
> >  target-arm/helper.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/target-arm/helper.c b/target-arm/helper.c
> > index 8aedce9..4abeb4d 100644
> > --- a/target-arm/helper.c
> > +++ b/target-arm/helper.c
> > @@ -6579,7 +6579,8 @@ typedef enum {
> >   * Returns true if the suggested starting level is OK and false otherwise.
> >   */
> >  static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
> > -                                int inputsize, int stride)
> > +                                int inputsize, int stride,
> > +                                unsigned int pamax)
> 
> I'm not convinced about this as we only use pamax in one leg and we can
> get it via *cpu when needed. If it will eventually be used you would
> also have to update the docstring above.

The reusing of pamax comes in the next patch 3/3.
I did it this way to avoid doing the decoding in arm_pamax()
twice for S2 translations...

> 
> >  {
> >      const int grainsize = stride + 3;
> >      int startsizecheck;
> > @@ -6595,8 +6596,6 @@ static bool check_s2_startlevel(ARMCPU *cpu, bool is_aa64, int level,
> >      }
> >
> >      if (is_aa64) {
> > -        unsigned int pamax = arm_pamax(cpu);
> > -
> >          switch (stride) {
> >          case 13: /* 64KB Pages.  */
> >              if (level == 0 || (level == 1 && pamax <= 42)) {
> > @@ -6808,6 +6807,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
> >           * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
> >           */
> >          int startlevel = extract32(tcr->raw_tcr, 6, 2);
> > +        unsigned int pamax = arm_pamax(cpu);
> >          bool ok;
> >
> >          if (va_size == 32 || stride == 9) {
> > @@ -6820,7 +6820,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
> >
> >          /* Check that the starting level is valid. */
> >          ok = check_s2_startlevel(cpu, va_size == 64, level,
> > -                                 inputsize, stride);
> > +                                 inputsize, stride, pamax);
> >          if (!ok) {
> >              /* AArch64 reports these as level 0 faults.
> >               * AArch32 reports these as level 1 faults.
> 
> 
> --
> Alex Bennée
