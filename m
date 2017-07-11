Received: by 10.25.44.15 with SMTP id s15csp4613749lfs;
        Tue, 11 Jul 2017 03:14:26 -0700 (PDT)
X-Received: by 10.223.179.13 with SMTP id j13mr9713831wrd.108.1499768065792;
        Tue, 11 Jul 2017 03:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499768065; cv=none;
        d=google.com; s=arc-20160816;
        b=Sa0qL8k+L39o04VZr9uvb66QnM9gT4KpRSB5k2uzMbSV4BlAWPbL2FFrIuAP28ekQV
         ZbSlperPxm9KCHrg14hZPKepmQbvaWS5nYoZ1sJtPegU2FWf4kQYQrVuHRIdCw6G4ujB
         QlBfEaXXAA3ylrdA3DGlpsRYRK+IgX/4cYnffIStC7DtJZh7w2RpRBjACeYypXkLNzd2
         T9oaRPJPrBlXaFl+G7a6H+a6Z2FZfryAVDnpgntz847x04Ct4dX8CygadWQItQpW3JBt
         ut1XGjMzgX1bUS2qj0pViHdDb0/XbS0aXdRW1YQLQYIkV19G32G3r6NxQ4fF1WafDJ34
         P55w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=suZbE1rohSynDHg8uV6FcE6+M6yyjTabv1R1d71E02E=;
        b=VVr7uNykxgRdqUrfL4Q8hL/e9QgqgD9lSygBMe59f3Te+RJep5HlMf1DZ5zMv+zXen
         cnpfomnzKT8pEdVOZ7I4OHqnCaCDnreaGJbv5knSWcaF03VQc7CLM6aJHbCrWVInutMA
         jan/oJ57Zziw9yMh4+Hv1JWfF/85UmKwviobkDhglf/0z5uZJpueVDaBA/1cuJaqtjiK
         7cu9LYtwAMpHwjrq5K+jv/h75cl4b8nkgb7X0/Dp+b0f8GcMBeSo54qR1WzQULREr/mD
         V6Ob8GmWVT8TJikQhIHriFXF/9PQB2WxJHDCd7Rjx2ZVV8ir1e2c49keZhwcS7nKObtC
         MQ2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=KhR2PRy5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::232 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x232.google.com (mail-wr0-x232.google.com. [2a00:1450:400c:c0c::232])
        by mx.google.com with ESMTPS id b82si8908340wmb.98.2017.07.11.03.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 03:14:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::232 as permitted sender) client-ip=2a00:1450:400c:c0c::232;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=KhR2PRy5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::232 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x232.google.com with SMTP id 77so176443367wrb.1
        for <alex.bennee@linaro.org>; Tue, 11 Jul 2017 03:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=suZbE1rohSynDHg8uV6FcE6+M6yyjTabv1R1d71E02E=;
        b=KhR2PRy53VetpdDjxAHR+VYfZR05DzdFXD6Becv3wGlLkvs2y6/mnnNHP2RJ3vCjKW
         jMgQ/EmRHG4UFA14xImhxQ+lDa0nDJ3v2sZqHkXNbvAD7sIA0/brk83mWvE87RIf3nFY
         yprMesGj0Lt7WCa49etyJAMDNvtl8/EcIcV9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=suZbE1rohSynDHg8uV6FcE6+M6yyjTabv1R1d71E02E=;
        b=GUu8/FHpEEf7kKUWs2DbOdDUEOa7Ad/LxiJzuhO7/m5g59SqPrqdFASKaTPqoOBd9C
         5J4JznNX6yTm8xJq4JbHhotVcXZRg4Jp9ziTnfyxXSwNMm2deGPfe1lfYftSt8mopLVC
         VYy+QVZ3rDPf+v0KZjzdQHABHE5kxXwzZ4boh6PqAFjzgq3LjJ2TqXJd01OutTrjrt26
         R4gehbj70UIL01J6LrxiKa3vWDn6y2JN35okbRhAQ0UeOSTiDFuQjbFxDeWXZey8YWSz
         SFs1aYxDWMeuzwxGCQugajbfYJEGuGKtUJb0M4fuOnhjqkh/0TIhO+4nfs1eBqZu3ROF
         TbtA==
X-Gm-Message-State: AIVw113fp6BPuDOqqj0OCFFV825khsy5Drjg7AzmRX4dOHzxnUBEGtEy
	xKaX+nNCqironkkEQr0tQlK1q1zRB5iflcA=
X-Received: by 10.223.133.239 with SMTP id 44mr10266813wru.177.1499768065506;
 Tue, 11 Jul 2017 03:14:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 11 Jul 2017 03:14:04 -0700 (PDT)
In-Reply-To: <20170711100334.GA25504@toto>
References: <1498830302-19274-1-git-send-email-edgar.iglesias@gmail.com>
 <1498830302-19274-3-git-send-email-edgar.iglesias@gmail.com>
 <CAFEAcA-dssYnbZjuWTjBta1aK3iL3pyRKh5Qs4hFh=bPONgnTA@mail.gmail.com> <20170711100334.GA25504@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jul 2017 11:14:04 +0100
Message-ID: <CAFEAcA_XTrkAN1ATpp6DLZqGh4aL1gECzQGyubJmoGjtw_pPbA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] target-arm: Extend PAR format determination
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: puMtfzxbzYsQ

On 11 July 2017 at 11:03, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
> On Mon, Jul 10, 2017 at 04:11:29PM +0100, Peter Maydell wrote:
>> So this kind of worries me, because what it's coded as is "determine
>> whether architecturally we should be returning a 64-bit or 32-bit
>> PAR format", but what the code below it uses the format64 flag for is
>> "manipulate whatever PAR we got handed back by get_phys_addr()".
>> So we have two separate bits of code that are both choosing
>> 32 vs 64 bit PAR (the code in this patch, and the logic inside
>> get_phys_addr()), and they have to come to the same conclusion
>> or we'll silently mangle the PAR. It seems like it would be
>> better to either have get_phys_addr() explicitly tell us what kind
>> of format it is returning to us, or to have the caller tell it
>> what kind of PAR it needs.
>
> Yes, I see your point and that's exactly what's happenning before the patch.
> Some of these new checks are generic in the sense that they check for LPAE/64bitness
> but others are I guess ATS specific for lack of a better term.
> It feels a bit weird to put the ATS specific PAR format logic into get_phys_addr.
>
> The basic idea here is that we never downgrade to the 32bit format, we only uprgade.
> The following line was meant to get the initial format I think you are requesting:
> format64 = regime_using_lpae_format(env, mmu_idx);
>
> After that, we apply possible ATS specfic upgrades to 64bit PAR format if needed.
>
> For clarity, perhaps we could make get_phys_addr return this same initial format, and then
> we can follow up with the ATS specific upgrades. E.g:
>
>     ret = get_phys_addr(env, value, access_type, mmu_idx,
>                         &phys_addr, &attrs, &prot, &page_size, &fsr, &fi,
>                         &format64);
>
>     /* Apply possible ATS/PAR 64bit upgrades if format64 is false.  */
>     if (is_a64(env)) {
>         format64 = true;
>     } else if (arm_feature(env, ARM_FEATURE_LPAE)) {
>         if (arm_feature(env, ARM_FEATURE_EL2)) {
>             if (mmu_idx == ARMMMUIdx_S12NSE0 || mmu_idx == ARMMMUIdx_S12NSE1) {
>                 format64 |= env->cp15.hcr_el2 & HCR_VM;
>             } else {
>                 format64 |= arm_current_el(env) == 2;
>             }
>         }
>     }

This still has the same problem, doesn't it? If get_phys_addr()
has given you back a short-descriptor format PAR then you cannot
simply "upgrade" it to a long-descriptor format PAR -- the
fault status codes are all different. I think the "short desc
vs long desc" condition used to be simple but the various
upgrades to get_phys_addr() to handle EL2 have made it much
more complicated, and so we'll be much better off just handing
get_phys_addr() a flag to say how we want the status reported,
if it's really dependent on ATS vs not-ATS.

thanks
-- PMM
