Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp316866lfg;
        Wed, 31 Mar 2021 02:43:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytJuxm11wo5atKJQVwrgQJf9qnJQOdDZvuCktqK/pxM/8ru28RcP6RRsD+s3i+eYDaOipt
X-Received: by 2002:a37:a9cf:: with SMTP id s198mr2119573qke.143.1617183823831;
        Wed, 31 Mar 2021 02:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617183823; cv=none;
        d=google.com; s=arc-20160816;
        b=bSfUABdTTrlzXBbioHR+QbuN/+Q1di9fm2WJNdbeOYtFUsHHwygo/ZEKtB50ma2Vxv
         pQWS4nth6MXcedRu6Sj2x6XrPCTYqM+XM5lT411hPA+LzQB8r+e8YWtoHzhXlAFa98gH
         1OHdsYo+oCybieMNI4SZAxQ91lg5DLApBsk4X4Csx3L2Ywp+6VE5WOA4p9XiS8LhFo46
         4nU5eGdLoYpWd3fSGYLf9cmUKzxZYx8sEVdqZa/ikmnypKILn5mtFaUFpfy7/lBaY/AQ
         S7DMdCrS6EcAtk5K6W28kIrs3wdSvrXvKZZRO8tERSJy11XMsI2g4+Z6mhzCaXuGnT7c
         yrHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=TeJZ80USA9+4z8IENXBjdmr09owzKAPnmCDhLA/HD64=;
        b=Bb5T4PU5c3BaFNh5B8bFV8T3OxC1g/eEsT9wkk0pWmSIK30087cRaYFRKLjqgQmFN0
         FNMGZkkT2IKRPIksWWeVZNGPzdB/dwOPo/w5rMO8kFKxOEJST+LlkoHIH/d1uqNiwvOU
         FFKM3F+lxmC7J39M1gDJsKe69xVnaEgGcFAhXAKIyb7x4ITn7PKXgO35o/BzZiQDx9xa
         v0L8Rcd0/PixTjivXeeqVT9cDt17PThWMJ9nhrWSmXx7a2xBJFE55nolwU+BfsWMIs79
         /gdbi+UYlWbiw6Arg3GQTdEV+QRbw3cEjou/gqW9yswK3aRwHd8wd5DRdcR4X3lj5AbJ
         9KAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=lwObbBzU;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id u19si969297qvj.52.2021.03.31.02.43.43;
        Wed, 31 Mar 2021 02:43:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=lwObbBzU;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 55DF74B39C;
	Wed, 31 Mar 2021 05:43:43 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gU+B+qosMfTo; Wed, 31 Mar 2021 05:43:42 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 498C94B39F;
	Wed, 31 Mar 2021 05:43:42 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 943664B39A
 for <kvmarm@lists.cs.columbia.edu>; Wed, 31 Mar 2021 05:43:40 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3nDlaWm1hfJe for <kvmarm@lists.cs.columbia.edu>;
 Wed, 31 Mar 2021 05:43:39 -0400 (EDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 73F2B4B38F
 for <kvmarm@lists.cs.columbia.edu>; Wed, 31 Mar 2021 05:43:39 -0400 (EDT)
Received: by mail-ej1-f50.google.com with SMTP id ce10so29112938ejb.6
 for <kvmarm@lists.cs.columbia.edu>; Wed, 31 Mar 2021 02:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YMiE+kC04pZeOxkIHTZ5n+tBWqrLCoxGcq+JX9IvLEo=;
 b=lwObbBzUMPtuNRTAfP+9LHPHy1w1N5WKNsRnTjJJGrzVo4LVAvJCNgNftqwGzM3PIH
 lIbKDnRu3gq1Nd5T2ch28v4b5Qkn/0b5UzaiiLkYDH1MCoSZ7kthlpc5G6RYMyyEsrQy
 O6Sa4pbZ2CsfpMZVY95ZulHz9ZbNa2cL4KVsXQWER+/xH1Lvr6KGD0tLpeDqkDdx5gKh
 4asJXZS1MvYwi574DOLJELleYJgFVTiYrTqtekDmOuvwHgtDRSGL/3K8eqW/FHipwU2p
 7KFj7xJJ7OfLBLnWkbLyQ8WCaUxXc9WD8zKn6ypNe6DQ/F3GtDUOEPEg3kc4m4ltT3ZF
 zbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YMiE+kC04pZeOxkIHTZ5n+tBWqrLCoxGcq+JX9IvLEo=;
 b=PkrwwTxpbXlELFAf9NYTMbvk85DjbgTxUA0XgkdNRGEKpfnhg7w/c+5D+j9RvYsOEO
 Rk2KgsS+t29TrqkaCoXCJlgDoFmWFGUdNFMpbs5UYwtuuMpMUUM2HyvBLbnWLaWy5NEs
 XDLGjXnBhx3yLuLbsLugvgtb5JT0aqNfjGIcDO+dBEwEZCiH51dGq/Y5dQsxuVcGfI2b
 wZaejkMdsHbcBRylLtDjPGSbZ69B0hsjgxQk6oQFjHDytZU81L5qXi+Gxm9MP+yddSDm
 qHV2KgR9JaiSuhSTGJ5AWlGV2Il/xvgvrOwv0bbj4r38La2/DX/WyzW4g7lW73+Qu4Zz
 KsUg==
X-Gm-Message-State: AOAM532ugohxChMTae3a5FCGWwno8zewQevMI8rh9GzwyQ9ta8DBiCSq
 O9l5j0bZxUzt/k6zTVHfkhYBnLqqcrOHIhQDvVNqiQ==
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr2641138ejc.250.1617183818442; 
 Wed, 31 Mar 2021 02:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210311165947.27470-1-peter.maydell@linaro.org>
 <431943c3-a603-7426-273f-b5a00f10ce41@huawei.com>
In-Reply-To: <431943c3-a603-7426-273f-b5a00f10ce41@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 31 Mar 2021 09:43:06 +0000
Message-ID: <CAFEAcA-tyxfiJ_BXOkm9SOApOnOh-hXi+dvjOP0-SqASjt5bhQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Make number of counters in PMCR follow the CPU
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, Leif Lindholm <leif@nuviainc.com>,
 kvmarm <kvmarm@lists.cs.columbia.edu>
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: YTovMzpOHI1w

On Wed, 31 Mar 2021 at 09:59, Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> [+kvmarm, Marc]
>
> On 2021/3/12 0:59, Peter Maydell wrote:
> > Currently we give all the v7-and-up CPUs a PMU with 4 counters.  This
> > means that we don't provide the 6 counters that are required by the
> > Arm BSA (Base System Architecture) specification if the CPU supports
> > the Virtualization extensions.

> So I've tested it with kvm and I get the following error before
> VM startup:
>
>    "qemu-system-aarch64: Failed to retrieve host CPU features"
>
> > ---
> >   target/arm/cpu.h     |  1 +
> >   target/arm/cpu64.c   |  3 +++
> >   target/arm/cpu_tcg.c |  5 +++++
> >   target/arm/helper.c  | 29 +++++++++++++++++------------
> >   target/arm/kvm64.c   |  2 ++
> >   5 files changed, 28 insertions(+), 12 deletions(-)
>
> [...]
>
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index dff85f6db94..581335e49d3 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -566,6 +566,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> >                                 ARM64_SYS_REG(3, 0, 0, 7, 1));
> >           err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
> >                                 ARM64_SYS_REG(3, 0, 0, 7, 2));
> > +        err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
> > +                              ARM64_SYS_REG(3, 3, 9, 12, 0));
>
> Looks like we tried to access PMCR_EL0 *before* telling kvm that
> KVM_ARM_VCPU_PMU_V3 feature should be supported, which is now
> refused by kvm [*].
>
> [*] https://git.kernel.org/torvalds/c/11663111cd49

Oops, that's embarrassing. I should have tested with KVM, and
I forgot the PMU needs special enablement :-(

I'm on holiday right now so I probably won't have time to
look at a fix for rc2. I might just revert this commit.

thanks
-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
