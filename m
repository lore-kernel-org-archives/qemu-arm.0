Received: by 10.25.208.137 with SMTP id h131csp299228lfg;
        Wed, 4 May 2016 10:46:08 -0700 (PDT)
X-Received: by 10.129.70.195 with SMTP id t186mr5664521ywa.34.1462383968664;
        Wed, 04 May 2016 10:46:08 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-yw0-x22e.google.com (mail-yw0-x22e.google.com. [2607:f8b0:4002:c05::22e])
        by mx.google.com with ESMTPS id t131si1770659ywa.314.2016.05.04.10.46.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 May 2016 10:46:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c05::22e as permitted sender) client-ip=2607:f8b0:4002:c05::22e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c05::22e as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-yw0-x22e.google.com with SMTP id o66so108723157ywc.3
        for <alex.bennee@linaro.org>; Wed, 04 May 2016 10:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=F7kQtUUFPcfc9KtjCVyyecaFeSaenFKg6q5icuk9vHw=;
        b=Vx3Sl4i15+fZWUHRnd28nMxXYUKyzMe0DwQXIzSCdIafyP0lNjqIemO5sJFFJNrnXF
         mjYTxVrFZNI9vTvTkqXNV1/Yc8Pm66I85kohWTJa9Cx2E2FvZl6ve+HG0gEHwUlayiHH
         8DlbFRWDXWvSefmsIC3BHAqdWZudY6nUrVPh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=F7kQtUUFPcfc9KtjCVyyecaFeSaenFKg6q5icuk9vHw=;
        b=AAuMJrh164RCJs6yG79o2NqRX7FFACiC+OTdJACTME0JQqeaZ6L5t1fg19i+oF99X3
         Jj+C+BqDAC5zlWen5fHlwrluGyBkYq96AlrX9IRlqH1wqrSRR53GPxRMlYGI6TZ+dxvM
         Etd/RVFdGJ79W9rY1+zaP8gr/7/tb2zjzgwc+3RtoT1yH8U0IkMxJilp092d3nEtbzjH
         qXea3Ko6BgHUkofuX+FNQU4GHcpWCXnh22+fy91N3o8A48tzmzIx424ltkOAfq2XlicT
         LGNb0jK04op24OadyX8uCoWvYxYMiw4rE2wtP3+5ESQq2x5Rrupa9tcFYfVWhviPZAMP
         /KQQ==
X-Gm-Message-State: AOPr4FWcxAvyL6KddqwBvxQZW6VIR3mRgLlZuUk5Zu0S6RvEplmvJ8Z3nmMZ+mI2Zvfvh/wLKh/U9gY46GIh8FDw8rA=
X-Received: by 10.176.6.100 with SMTP id f91mr6357632uaf.38.1462383968235;
 Wed, 04 May 2016 10:46:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 4 May 2016 10:45:48 -0700 (PDT)
In-Reply-To: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
References: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2016 18:45:48 +0100
Message-ID: <CAFEAcA_UZLU1qrA1_BkrYJZ_VhXPoz4qynWK2T53J6X0ZW7QBw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] arm: Steps towards EL2 support round 6
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Sergey Fedorov <serge.fdrv@gmail.com>, Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	Edgar Iglesias <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: 7CuJf6S4dKzf

On 29 April 2016 at 13:07, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Hi,
>
> Another round of patches towards EL2 support. This one adds partial
> Instruction Syndrome generation for Data Aborts while running in AArch64.

> Edgar E. Iglesias (7):
>   tcg: Add tcg_set_insn_param
>   gen-icount: Use tcg_set_insn_param
>   target-arm: Add the IL flag to syn_data_abort
>   target-arm: Split data abort syndrome generator
>   target-arm/translate-a64.c: Use extract32 in disas_ldst_reg_imm9
>   target-arm/translate-a64.c: Unify some of the ldst_reg decoding
>   target-arm: A64: Create Instruction Syndromes for Data Aborts

Most of this series is good, so what I have done is to put
patches 1..6 into target-arm.next (with patches 3 and 4
squashed together).

(https://git.linaro.org/people/peter.maydell/qemu-arm.git target-arm.next
as usual).

thanks
-- PMM
