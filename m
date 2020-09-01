Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4553154lfc;
        Tue, 1 Sep 2020 05:48:24 -0700 (PDT)
X-Received: by 2002:a17:906:a206:: with SMTP id r6mr1285579ejy.70.1598964504385;
        Tue, 01 Sep 2020 05:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598964504; cv=none;
        d=google.com; s=arc-20160816;
        b=CK3ooHFE95wZraN679a35tnAMt6YGST1tPeXJDl1ugnDOi5Qj7gUy17b2z/xv+7Hso
         jiPZqr3VuZnnH8dMY/2epel7JM3HcbT/bRxWc8vYYaGvBgy5k5q+crmh3gtfEnITCDzv
         IPlZzWuW8f0WrxpvDVUjH6tt0NFt6cocXQAeHy7UGS09Q1D6keCuQWUzL/g8IG/AH25F
         C3vutL07abv0Vxk85AT3oQgTayWZn++AfoM/anJX6SDecq8MtKqezUSW5tqKkRAWe1Ff
         GveaookxfqmOOqa4wRPj4hclI3fvJ4nlubWA+IbvKqD1t8hg6mSp4GzaficLxRA1NgZe
         rdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3IDprVzykahK+tCmIeyfF2J+Gnyg29LO9RV2SD1EOXs=;
        b=MhBvfvGA8ytPhznNufxn43w5b6MDlqa8u86nrwgxE7ThlAtrMFHaS124wYAbEn6zEw
         JVBQkbUHbi3VtEOV2RGWLQvBRCCdEf6bkBTTqW2ivtR/kxY0Qovxc2dPO8jg6fnVSSzk
         nvaZWrsjDumCMnbqPZAg3FVEzfplPLoyQ9T0kEJv4Llg5xjYWd2kTnIcnKtTyWHIJ8hG
         jPfRkn8vSbq5IHN7bIARMUyXRmyZUmigBtqE9RlL81zTNfVJsjHc/0bj/3jSDna+I48w
         XCRA2JL5KvT8+LXwXDMHz0OeNt1uOiwtqrhQhgC3rt/jwbL3suHnoeNNDwP27VUiRj8m
         a7UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oCbGZSz/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id ce24sor735951ejc.7.2020.09.01.05.48.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Sep 2020 05:48:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oCbGZSz/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3IDprVzykahK+tCmIeyfF2J+Gnyg29LO9RV2SD1EOXs=;
        b=oCbGZSz/JiAdN0Dp+x7MG7Kmhbig7an+nCuIjSCHtLEsDsoCph5jR2JFDnAtyt7Zsm
         AzAs6x+9kfLb5JDIG50ezLmEO+jHAPL95Uj/OkS2XW+VzBu5wEfBz1Jvt9/X09rU+ld+
         tUrY+6Fr677wjyDuUgmnllCX7y5bDbb8WOlD29XtGzzemDOTaeIaPkwUtL0CqdwvQA2f
         OHqNGHrYhO7c2OJ/Ouu+SCK9lKOyGQQlBEiQQhcgsOn3FO2iKfTjQGL04lqDg1Ki9vEp
         XOhYsR6qSVJDzk/zYG6QExiUELuYeUgZ1DG/bk6sBC/y4BA8RMuJTBh4oFyhujLYeUL7
         s8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3IDprVzykahK+tCmIeyfF2J+Gnyg29LO9RV2SD1EOXs=;
        b=ZcAiTrh22sGjpm9hGVZi5qsBtkxy4eF/adTUCHUOr6NKf1uelyG0Tg7EPtW8d8EvH+
         6CFs6ijZHm1xlk0CnP1CQI8qGBMlZMlJvFJJTbf3xsApR9PWOMDJxHQah/4dqThpc+PM
         t9BUwnjTnv1HV4vRonOFaraamdCaZtzFtED7XoBHgAO37Q/6VREVy0v3AkzLwOPx+ICq
         o4FeSP/zqQWTrSLpOQq/FMX0FK9eDOPKAwpSeTeOvgr0/xnm2FCEYxIraj3iBgLfZ6rT
         1NtLAzFuHyuad46P+6HQNeIVgXaqUDBxfBzaUGTB7nfiqHwkV9u9+5cB6xhg2QAvOVb5
         4iKA==
X-Gm-Message-State: AOAM532xItyTQ8+8cgNmNgxubV4nXTeRWWgi6Qw6dF4mgUsbq5m9fNHQ
	vDgmLHQAz2rrhhpJD9T3ZRvBImlJ0DBEuzGrZOPic1LC
X-Google-Smtp-Source: ABdhPJz0bvXVdTL9Zyd7+OuuAVs7TDyvHFTRC9fuynYbAT4QDVUf3c+Vw3sUdJsnUbHPrQPOps4DsOjI6Mm4uIDozDE=
X-Received: by 2002:a17:907:728e:: with SMTP id dt14mr1330828ejc.4.1598964504082;
 Tue, 01 Sep 2020 05:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <1598874522-5186-1-git-send-email-sai.pavan.boddu@xilinx.com>
In-Reply-To: <1598874522-5186-1-git-send-email-sai.pavan.boddu@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2020 13:48:13 +0100
Message-ID: <CAFEAcA_GvSnK0LSxyT0jsFz2yRufrg+Zjs=h7XJtJSp4dGzquw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Configure number of pmu counters
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Andrew Jones <drjones@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>, "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: U6mesG4mHHXP

On Mon, 31 Aug 2020 at 12:44, Sai Pavan Boddu
<sai.pavan.boddu@xilinx.com> wrote:
>
> Default the pmu counters to 4 and configure it a 6 for a53 cores.
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

Rather than doing this, I think the better approach would be to
switch to treating PMCR_EL0 as an ID register in the same way
we do for other varies-per-CPU ID registers:

 * new field uint64_t pmcr_el0 in the ARMISARegisters sub-struct of ARMCPU
 * each CPU's initfn needs to set this (sorry, this is going to mean
   a fair amount of digging through TRMs to find the right values)
 * define_pmu_regs() just uses the isar.pmcr_el0 field as the resetvalue
   for PMCR_EL0
 * define_pmu_regs() needs to use pmu_num_counters() to get the number
   of counters for its loops

Side note: looking at the code I see we don't implement the effect
that MDCR_EL2.HPMN has on this register... (and probably we don't
in general get the EL2 handling of the PMU right in other places too).

thanks
-- PMM
