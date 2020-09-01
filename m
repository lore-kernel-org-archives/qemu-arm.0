Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4540416lfc;
        Tue, 1 Sep 2020 05:30:34 -0700 (PDT)
X-Received: by 2002:a2e:545:: with SMTP id 66mr482437ljf.469.1598963433777;
        Tue, 01 Sep 2020 05:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598963433; cv=none;
        d=google.com; s=arc-20160816;
        b=fDW/O36lBqwyfro9X9kwBCiu+G7w40qkFfPDbuZEGsJyBoqLRFUxeyT107bheZsXw+
         Lk61v7aQ0jblkdftoCnIrKlAhHJD6nTMRyCyM375ra7gD94cZ15U3Y3yF47M1Xq/9uQr
         4psQeMkQXgZy8ZjANZpKOhCuqxSluu07YJc/o5ccPZWCqkAPQBiB9hXJHnTckNHteeUT
         OOFmHAwZ0Q5B9vq1JzuuMgPb7lTi2pbWY8tYtpMGu8pED6gV9c/F7YcAEj9jN+Pc3QUr
         hh9hJhWMIHm3cEkx1Y1YkrPzn21ZLBBsoA1PzzH3gUUDIYiucvHwwby80jduIRxxHzzo
         XzuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=VeCtmxpyBD1wTUB21dJqQwaQwI0C9E+xzkYIKwce00Q=;
        b=JTGjgaUeT19I7YvGnWvVDH5F/mTfnL4Oo4ZPUnws0jb8maPAqVtu7EHu73eZIg08NS
         zsDe1azE84JU0mGDgsrA341XmL2XdZ6xgDX6ZZXAVrcXqYvM+AZ8VuaKgwA61cE8/FNN
         rWaJNqvQZwwDUQbKVPpg9zuQlh7HeX4kTR9mw1Gl2OfiZXlF16jV5//YyHXWvfH8QNcT
         uGNMQwrM0DjEVt6bJhuIDUaaNEWy8oAh9dKcNwTlPQEgk6177f+SdpZ62+DEG7LRKPwX
         dKfTR7XkJBy++kBN/1mwQ3eV/jf3gMgs9EehlBCvtaJSdBO4yVZR5fQ2UXAQUvA26D5N
         0AmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hMZPpvWs;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k4sor558977ljg.1.2020.09.01.05.30.33
        (Google Transport Security);
        Tue, 01 Sep 2020 05:30:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hMZPpvWs;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VeCtmxpyBD1wTUB21dJqQwaQwI0C9E+xzkYIKwce00Q=;
        b=hMZPpvWsxablVEvok4y2WH2cHKr5K+bzrh0CPeb5M9iYlesk4J5xtnrM/B38cDpJ0r
         hmadmWkxe9VVtVYVLKUcNux9eZwuhmASJgDCLZswDZrSvLqveDqm5zkfz/ylW9AN+0Tg
         ivqsxDi/UDvVjep5w0AURkmZCIAj87s1uLJJLvBzMBCYjCJ1x3YFG6D/9zB4k+5l0wYG
         PJGg/7iRx5NxsCHS/mvQioU/Cw5M6ODUuf6BjlUV61//t5Hy5374A72EXXFmfqeLx54v
         etux0Pws6TW3Rc1PFhS/4XmQQes/g6fW0HpHcM0uxl1LF4OUW8LX9a2Tv7Pg/ATFFBAQ
         zMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VeCtmxpyBD1wTUB21dJqQwaQwI0C9E+xzkYIKwce00Q=;
        b=Q3lXDsHf1TS+IyjWjZTbYY3J5Vy7roFLsNR2LHpf/LydLS9CvvE0HfH6RppqBbs1Z3
         Z7a+fFpzEwl9AmstxISMAJfMnMwlY3l2ltaun4zLykbfwfhtpeK5nTDkhnnUu8Xj31LH
         /EsqaM8EBKX0ii0EGmwS9jSrNWbL8LrK//uueRhWocF1eCiIPU/Zo4+1sQR843Uo9DPd
         JgEDqHKrdcVFT6JSMX0ljGAhyEUEedcJ0JZ0/jbJ14s4wzhaG6cY+0BA0YgmoymjE1Va
         ZvYG2dcCXODKLG/q4DS6L2ikKYkxEaFaUb4mmXKDIF4EJVhRYxoYSHwB6R0SBAZ5ulnQ
         Rlsw==
X-Gm-Message-State: AOAM532MdxawLwB4YJ3pujIE7ULbm5/IbFKaNTxU3jXsIvXP7+hMpv2v
	FWqAWNbU2f0t4OvHDDcYXt5XvySgHQpOzg==
X-Google-Smtp-Source: ABdhPJylqv1ezUaaqJkC1saUZmUSZjB0OIx1qVbd34Nt57ckzIuZZ6oByAubGci4orkK3hzwhGowmg==
X-Received: by 2002:a2e:9810:: with SMTP id a16mr425270ljj.157.1598963433336;
        Tue, 01 Sep 2020 05:30:33 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
        by smtp.gmail.com with ESMTPSA id d17sm245811ljl.133.2020.09.01.05.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 05:30:32 -0700 (PDT)
Date: Tue, 1 Sep 2020 14:30:30 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	'Philippe =?iso-8859-1?Q?Mathieu-Daud=E9'?= <philmd@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	'Alex =?iso-8859-1?Q?Benn=E9e'?= <alex.bennee@linaro.org>,
	Eric Auger <eric.auger@redhat.com>,
	"'Edgar E . Iglesias'" <edgar.iglesias@xilinx.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] target/arm: Configure number of pmu counters
Message-ID: <20200901123030.GV2954729@toto>
References: <1598874522-5186-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598874522-5186-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-TUID: ijvYXKMpXMrA

On Mon, Aug 31, 2020 at 05:18:42PM +0530, Sai Pavan Boddu wrote:
> Default the pmu counters to 4 and configure it a 6 for a53 cores.

Your commit message looks like it needs a little rewording.

I would probably split this into two patches, one that adds pmcrn
and another that modifies the A53.

> 
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  target/arm/cpu.c    | 3 +++
>  target/arm/cpu.h    | 3 +++
>  target/arm/cpu64.c  | 1 +
>  target/arm/helper.c | 2 +-
>  4 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 6b382fc..805a692 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1051,6 +1051,9 @@ static void arm_cpu_initfn(Object *obj)
>      cpu->psci_version = 1; /* By default assume PSCI v0.1 */
>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
>  
> +    /* set number of pmu counters to 4 */

/* Set default number of PMU counters */

That way if the default changes you don't need to edit both code and comment.

With those changes:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> +    cpu->pmcrn = 4;
> +
>      if (tcg_enabled()) {
>          cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
>      }
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index ac857bd..3b47ba8 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -879,6 +879,9 @@ struct ARMCPU {
>       */
>      int32_t core_count;
>  
> +    /* Number of pmu counters */
> +    uint8_t pmcrn;
> +
>      /* The instance init functions for implementation-specific subclasses
>       * set these fields to specify the implementation-dependent values of
>       * various constant registers and reset values of non-constant
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index dd69618..76c879a 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -190,6 +190,7 @@ static void aarch64_a53_initfn(Object *obj)
>      cpu->gic_vpribits = 5;
>      cpu->gic_vprebits = 5;
>      define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
> +    cpu->pmcrn = 6;
>  }
>  
>  static void aarch64_a72_initfn(Object *obj)
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 44d6666..4afbefb 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6534,7 +6534,7 @@ static void define_pmu_regs(ARMCPU *cpu)
>       * field as main ID register, and we implement four counters in
>       * addition to the cycle count register.
>       */
> -    unsigned int i, pmcrn = 4;
> +    unsigned int i, pmcrn = cpu->pmcrn;
>      ARMCPRegInfo pmcr = {
>          .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
>          .access = PL0_RW,
> -- 
> 2.7.4
> 
> 
