Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp160568ejx;
        Wed, 9 Nov 2022 02:58:14 -0800 (PST)
X-Received: by 2002:a17:903:247:b0:188:88be:4fb1 with SMTP id j7-20020a170903024700b0018888be4fb1mr9968862plh.34.1667991494363;
        Wed, 09 Nov 2022 02:58:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667991494; cv=none;
        d=google.com; s=arc-20160816;
        b=eLWJUdIle6RV0dyt9pj/ZsgOTsTZdTNJTIrm1H//ibeGvQUdxh6STKPhjLIj9NwcZC
         IYb0NTfYZllQB2U6CUQOh9Gy/ySaWhWfcRnilZBqtVJDL/VgLxHgmfA9/VofZrnn5UV+
         Llp7t9xlZVim7vrcIhSSZ9Nsy85FcMZy0k4NuhnS6s6U98kub/AN0nwSIvpWBBU4pgpw
         LYRt0pgeCpl2AdxgS8nB4Z1xdfUYzUNgFu7pPo6WGhvIZmqQLhkFooKDZ8HCmDmaB6nY
         fxHnFzROaggGwa00qSt6jvn1wiW0Gi2ziGsnEtPYL0N57KC62pvcAcXs/Tc10zpJNcsm
         TwGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pbY438MvfbCAMLXbRRmVzpwHbmCAEqbkhtDF7/Uydi4=;
        b=DwcVwn/LJqx5EamrkQgwu4vjPEChu10ybzzBxPSp93usvLMGo1/Dkm1vJgvL8Eb19K
         +9QA9dorcTxk3jN7/0WPeVBXI42/rOMpAbVgFqs5Ru/GZ3HItCR71ABSBasVEw0FLbhS
         aIeE4X6vj/d7k7biqJF54XYyvvAjqCKmmprU/6RRlZ3ta0JcM5jHHFgvkRRFFWQoZACI
         pB2mBa6YkzE7qbeXg1K/stC8WqYJulS36ymGKCKD4E1thpjhHJ1jyDi4Jo7JgPyH4XqW
         1F2LZt0S19STWsjqN6S3St5lgKkI8SpSgmWtk0fdBm+MjQ+9IM5jp6JHiwcYg3kE9NFh
         QldQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wkwohFmB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c16-20020aa78810000000b00562e8e07b68sor6909472pfo.82.2022.11.09.02.58.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Nov 2022 02:58:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wkwohFmB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pbY438MvfbCAMLXbRRmVzpwHbmCAEqbkhtDF7/Uydi4=;
        b=wkwohFmBnl4Hq4HOIn2ttnnGAEl0XbuJN3nqjeub1txPSc5ppUx+ArndMoLJ0d1POt
         uZrnJ722uprVqBXnwaO2s1+Pwq+oaWQb7wB9gQ9FuMPrzn506N7JkXbbWlsy+OMCi2mg
         SW7fIj6Jh/5W1ov0aYRbVM89ilmbekKyuFKGj38yJ1QeKpa0rAMVMinu7G3d0+3QVJ3E
         U9+vrhvYEv8d+P2NlY60NAtXuuMNDCpfYfLGue5y+jK18GI5dcXuA1KRgO5jeC//Oiz5
         l4+LJ//aklQqb1fQAMUk8oZOMMDIkiVwZNwNdtj4VRlhgxPEEn5pS9HwbJ+ysaNkchfN
         v9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pbY438MvfbCAMLXbRRmVzpwHbmCAEqbkhtDF7/Uydi4=;
        b=xrEkrQ/6IvlZ26oLDQBHEuvP5DQBorMtcL0731TKL7UnYZUXAXY9cdw2EmvQ8tgCrp
         y5AMqAnagUzdIRxEKa5XWsB/Xf9JXqrHmpWUCmYEtvx3GVoRCsRvunxZDGm3CU8L7iYg
         FDCIVSoyxD8kSAUv7dHF2wK2Q0ayuTMkd/S2aXuI/zTzQiHCQg3xEygJk2VcsxFu8Rdn
         Op5hbP0Cv6847APSzCFmoSIyLC9XxuyPls4cHJgmxaPZnrNTd1S+dk9ElrE0PZUAZV1f
         o67GvijwYdPl1pKjcxBdhqA8BNAZtnxT3KacpI43XrY2t4NB+kLIHXYjHnf/QMSkX7xV
         oDmw==
X-Gm-Message-State: ACrzQf1NtFCNT9lsRrxDE643QTzE0iXX4/XYaMdkJC47RnOGPCp9dekb
	1ifEXHo42IUR95PQ/IhDkreiWdWMcAZGc9RnrFWyxcwL
X-Google-Smtp-Source: AMsMyM6kKhGeo25KJF0+2eCnkSO94JCaM9VWYNFG+EJD1ui5B7tq1/mKLL9Dhv5W3dwuNkwdiDA7R4kG4JrJV/w7jbk=
X-Received: by 2002:a05:6a00:1595:b0:56d:e04d:e0ab with SMTP id
 u21-20020a056a00159500b0056de04de0abmr41857633pfk.51.1667991493786; Wed, 09
 Nov 2022 02:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20221104184101.6923-1-fcagnin@quarkslab.com> <20221104184101.6923-3-fcagnin@quarkslab.com>
 <2B918171-9464-40DC-AE11-D25E60858370@ynddal.dk> <CAF8_6KmwMCiNcC-romHoGZhcpPph71b3qv7yn9RHQArV3Q+nDA@mail.gmail.com>
 <D86C8F4E-517E-4ECC-A66D-E57F551FFECF@ynddal.dk>
In-Reply-To: <D86C8F4E-517E-4ECC-A66D-E57F551FFECF@ynddal.dk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Nov 2022 10:58:01 +0000
Message-ID: <CAFEAcA9jVVQhouS7uhmh+gMs328M_0r9Nz3npzrbmBoVhS+=TA@mail.gmail.com>
Subject: Re: [PATCH 2/3] hvf: implement guest debugging on Apple Silicon hosts
To: Mads Ynddal <mads@ynddal.dk>
Cc: Francesco Cagnin <francesco.cagnin@gmail.com>, qemu-devel@nongnu.org, dirty@apple.com, 
	r.bolshakov@yadro.com, "open list:ARM cores" <qemu-arm@nongnu.org>, 
	Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>, 
	Francesco Cagnin <fcagnin@quarkslab.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: BEdYTibJ0dQF

On Tue, 8 Nov 2022 at 11:51, Mads Ynddal <mads@ynddal.dk> wrote:
> I also noticed you are adding 1 to the WRPs and BRPs. As I interpret the
> documentation, you should subtract 1 instead, given the value 0 is reserved:
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index dbc3605f6d..80a583cbd1 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -39,11 +39,11 @@ static void hvf_arm_init_debug(CPUState *cpu)
>  {
>      ARMCPU *arm_cpu = ARM_CPU(cpu);
>
> -    max_hw_bps = 1 + extract64(arm_cpu->isar.id_aa64dfr0, 12, 4);
> +    max_hw_bps = extract64(arm_cpu->isar.id_aa64dfr0, 12, 4) - 1;
>      hw_breakpoints =
>          g_array_sized_new(true, true, sizeof(HWBreakpoint), max_hw_bps);
>
> -    max_hw_wps = 1 + extract64(arm_cpu->isar.id_aa64dfr0, 20, 4);
> +    max_hw_wps = extract64(arm_cpu->isar.id_aa64dfr0, 20, 4) - 1;
>      hw_watchpoints =
>          g_array_sized_new(true, true, sizeof(HWWatchpoint), max_hw_wps);
>      return;
>
> But the documentation is a bit ambiguous on that. Maybe we can test it?

Adding 1 is correct -- the field definition is "number of breakpoints - 1",
so the number of bps is "field value + 1". You don't need to open-code this,
though -- there are functions arm_num_brps() and arm_num_wrps()
in target/arm/internals.h that extract the fields from the ID registers
and adjust them to give the actual number.

thanks
-- PMM
