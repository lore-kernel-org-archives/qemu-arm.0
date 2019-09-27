Received: by 2002:a17:90a:1a54:0:0:0:0 with SMTP id 20csp3510061pjl;
        Fri, 27 Sep 2019 06:33:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxabcCvYwHneCMmUhNboqlqSSxs9O8mfVE9MXGeJmBGtbtw4gAiJRaKeV26IgJ55jlVdbWY
X-Received: by 2002:a05:6402:1699:: with SMTP id a25mr4550412edv.91.1569591205029;
        Fri, 27 Sep 2019 06:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569591205; cv=none;
        d=google.com; s=arc-20160816;
        b=y7Gcg7tnCHOKBHs33emoM6JQC0WJViB9W6ZefhNt+kKlM6yLSrda2Z7L+IIjrrbuFL
         UeiNP1D2mPYELDDp5dzeyUTjg2P0+Man1+Z2f3Aii9wHxBdHSnZJBocYXqedHfDzgnhj
         T85DhIB0e6BEiLY1zChheGQamv5aSwFCHmruGyTXT6vJqM01lH1My5dtCECv8OOlO5a6
         HCWb6dzZWWdUJAC9O86ERPYiGkCk2FEb6bziyfsjLiqMJ15LdTZJkm8dez+AtolMZeeH
         FWW//DZQRiqbhtsmAvcCdkR2zF9hWZnVKAPs/gHyCej5nNnGLDk07ByJoQWJYhYz1p1M
         mIwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XpRff2jEEJjun5C2nBwnEy0mpg4KSV3BL/CHwT484IE=;
        b=gz/LHcEulx5eE7CuP06Vd0C0ljW2iLEymu4Pto68GAHiAxBSA4uKkmhZ7E5UI6zQJj
         ivwLf2HjA3Lv65pXLoJW13R6k4PotPDonp6yN/K1EgVYJJb/0lxyyTKqR68C+f55eoP/
         3tp5yDvViBZ4OQ2Bw/XO1BzZ9cm3nkPTLwu9naZtZmMZpGGRLTlx3QGEpFTtrJlQLjHT
         CvXJ2ZIe/IAVwe57pQiOjhSzOehBTVADZ3VDiILyF4uh1HRYuRplb0oIYeo8Br+PF9yH
         DAPYgB04QS4RiwYoiDUFfYq0UZimtXIfHypMHLmOs4hXOqXwWxs2Wu3CRY1TP5Iz8H6L
         WeQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qcFWW4Gw;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id l48si1645072edc.276.2019.09.27.06.33.24;
        Fri, 27 Sep 2019 06:33:25 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qcFWW4Gw;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfI0NdV (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 27 Sep 2019 09:33:21 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43771 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbfI0NdU (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 27 Sep 2019 09:33:20 -0400
Received: by mail-oi1-f196.google.com with SMTP id t84so5177707oih.10
        for <kvm@vger.kernel.org>; Fri, 27 Sep 2019 06:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XpRff2jEEJjun5C2nBwnEy0mpg4KSV3BL/CHwT484IE=;
        b=qcFWW4Gw2Z1hHz2R8mU/7PNImqDSLwQyb9YokkDvkIFBQGNra8ryGJ0Mu/u0rqwqLc
         9NMqnwwG/iPr9oGSWsYCfiQOvZoZOLQcIx37TenROPvMxcIlNLsszFebmz/ISrP1I002
         nNKTwl7k6+zZBC90PoaDCvyHQ5jsc8CZImfI/O+2g6UWFgnUHjMBN9edyv10srOnB0aB
         zWVJKjFkmhJ7UTofs8uuCyw7EBlDbXtoflkBUeseFk0Qp/QkuOJsFy6S2GmeIhPT50fR
         Imoh+XTDM1Uf1uKnWGcunaRpKbyBqhJWOUtLXAK8/mbTyTnfmhOR3Xdn1DX+1qi6udvt
         1+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XpRff2jEEJjun5C2nBwnEy0mpg4KSV3BL/CHwT484IE=;
        b=mrcq8zptfgzP8tkhdYj9V/J7FN4FhiGB/RPdem+9FlDclG/Z3oXdhiJxZyySppM2Fi
         McysP47Ur5HFT2wN1BzSjxnViO6uB6XAmWaqG3t02gpLJfGReR5I9idUB4CLbIbRNUJi
         5cIfFcDjJILdokmopaDNTK2iB9HZQfUskyOcyjcIH82e8mwbf+RnLp3YIbfgDHNWXKAy
         F4xSRhWhGVYeUyZak82jP36OGRvg12Nci1T4Rk63RP1rJnysyTsaS5c3v7VgfnSzqDcJ
         nB7TNz4I9UQ8d/tK2r6kUE5WoDu+aQ3yqjyumEKdZENbREOchqZcZ3JSI0mRVwI3lVZ+
         a3zw==
X-Gm-Message-State: APjAAAV1E1uX6Z3ImbNT368iqKHefq2+Xi0SzDTNJFmXOVaDFafWKZOv
        kXFZZRD8jZ4+MosReiGG+Bzbd+0i2Y7UWOXrXnf+vA==
X-Received: by 2002:aca:b48a:: with SMTP id d132mr7301167oif.98.1569591198389;
 Fri, 27 Sep 2019 06:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190906083152.25716-1-zhengxiang9@huawei.com> <20190906083152.25716-6-zhengxiang9@huawei.com>
In-Reply-To: <20190906083152.25716-6-zhengxiang9@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 27 Sep 2019 14:33:07 +0100
Message-ID: <CAFEAcA-xc2XUq2Kwa1cK=4sAMq8B-2jUFAmxiGOQbmRCp-+UmQ@mail.gmail.com>
Subject: Re: [PATCH v18 5/6] target-arm: kvm64: inject synchronous External Abort
To:     Xiang Zheng <zhengxiang9@huawei.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Laszlo Ersek <lersek@redhat.com>,
        James Morse <james.morse@arm.com>,
        gengdongjiu <gengdongjiu@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        "xuwei (O)" <xuwei5@huawei.com>, kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, Linuxarm <linuxarm@huawei.com>,
        wanghaibin.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 3T/lbvo1SxSJ

On Fri, 6 Sep 2019 at 09:33, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>
> From: Dongjiu Geng <gengdongjiu@huawei.com>
>
> Introduce kvm_inject_arm_sea() function in which we will setup the type
> of exception and the syndrome information in order to inject a virtual
> synchronous external abort. When switching to guest, it will jump to the
> synchronous external abort vector table entry.
>
> The ESR_ELx.DFSC is set to synchronous external abort(0x10), and
> ESR_ELx.FnV is set to not valid(0x1), which will tell guest that FAR is
> not valid and hold an UNKNOWN value. These values will be set to KVM
> register structures through KVM_SET_ONE_REG IOCTL.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>

> +/* Inject synchronous external abort */
> +static void kvm_inject_arm_sea(CPUState *c)

This will cause a compilation failure at this point in
the patch series, because the compiler will complain about
a static function which is defined but never used.
To avoid breaking bisection, we need to put the definition
of the function in the same patch where it's used.

> +{
> +    ARMCPU *cpu = ARM_CPU(c);
> +    CPUARMState *env = &cpu->env;
> +    CPUClass *cc = CPU_GET_CLASS(c);
> +    uint32_t esr;
> +    bool same_el;
> +
> +    /**
> +     * Set the exception type to synchronous data abort
> +     * and the target exception Level to EL1.
> +     */

This comment doesn't really tell us anything that's not obvious
from the two lines of code that it's commenting on:

> +    c->exception_index = EXCP_DATA_ABORT;
> +    env->exception.target_el = 1;
> +
> +    /*
> +     * Set the DFSC to synchronous external abort and set FnV to not valid,
> +     * this will tell guest the FAR_ELx is UNKNOWN for this abort.
> +     */
> +
> +    /* This exception comes from lower or current exception level. */

This comment too is stating the obvious I think.

> +    same_el = arm_current_el(env) == env->exception.target_el;
> +    esr = syn_data_abort_no_iss(same_el, 1, 0, 0, 0, 0, 0x10);
> +
> +    env->exception.syndrome = esr;
> +
> +    /**

There's a stray second '*' in this comment-start.


> +     * The vcpu thread already hold BQL, so no need hold again when
> +     * calling do_interrupt

I think this requirement would be better placed as a
comment at the top of the function noting that callers
must hold the iothread lock.

> +     */
> +    cc->do_interrupt(c);
> +}
> +
>  #define AARCH64_CORE_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
>                   KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
>
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 5feb312941..499672ebbc 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -33,7 +33,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
>       * ISV field.
>       */
>      if (!(template_syn & ARM_EL_ISV) || target_el != 2 || s1ptw) {
> -        syn = syn_data_abort_no_iss(same_el,
> +        syn = syn_data_abort_no_iss(same_el, 0,
>                                      ea, 0, s1ptw, is_write, fsc);
>      } else {
>          /*
> --
> 2.19.1

thanks
-- PMM
