Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2665500ejq;
        Tue, 9 May 2023 05:05:02 -0700 (PDT)
X-Received: by 2002:a50:eb48:0:b0:50b:c479:fed7 with SMTP id z8-20020a50eb48000000b0050bc479fed7mr11582661edp.21.1683633901911;
        Tue, 09 May 2023 05:05:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683633901; cv=none;
        d=google.com; s=arc-20160816;
        b=EVx3HAE4ZJV73gGlEWYXbxQMUIiM/8h994wLEWsLN0Up1fPYilmspNu6dTHGX7a/O4
         7LKcbyjgvH8LCOPTWZECEsSGepNHayySwH30J4K8rJ1qRG6O5Yg7szhEB1MmGv1YCul2
         nUj91FLsIneY7xSCFbBB1W6GQ8PO4cVk5vPdBxpN0GxGfjh/zc6yF42RfXEHleyET1Q6
         3SPbtxiMTgL16P5vrIwyXfJW0v/Ec8Wgg1+RdwNszvrtiBD9ZTPk2xJsN7TyjRdRyIgU
         ZoBN6tRe3IWBIVc94BoMr/x08rJ+iXO0MuZ6cZpTqrjDXfT4m350mTl3pyNXgv24Tli/
         5YsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FtnmDLDOsU/IlqLkId45Pc72BUE73jMq14qxm6Cd1EE=;
        b=tA5xlMxx5xyhn5qKPXUO64bSDWigV/GfWSqD14rRamSNWmi3cr7OFHPFFpXQr9koaj
         1t9/5u+Rmk+FO1vPmIk+MfRe7cQrpRlKA4D+Sa/dud+xV5Fagnlx/rxAtobIfKCMQxHX
         TrjRsOIIK4/yyDPSyftpdmPmV8940jS8ktNh+8W2ksYlTvTBDStupd77t1FRq2/tFGOZ
         2Wchist0aUYDByJKXLJ99M1ZOJ5b4Jy1w5HoK1M20GaabybH/nUA00eo9+nT+3Pcf1zn
         +9/V5YJW+8s9yZb5281fiAtwjcFnaRYu5bD646ra66vCXbS6qOfgjCLtg7c9OG1G9PaB
         CM/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yR7/qZTB";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t4-20020a508d44000000b004fba4dbf855sor795564edt.7.2023.05.09.05.05.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 May 2023 05:05:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yR7/qZTB";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683633901; x=1686225901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FtnmDLDOsU/IlqLkId45Pc72BUE73jMq14qxm6Cd1EE=;
        b=yR7/qZTB67ODJ0NoKg2I6B/z1+lFfNr2ne62xC3BLLw+ImFoNK+6mycBPsEpg8xdXR
         JW5v1GrL8+aSia4pjVa1HEMnqZviKq/OVB5zN6jwo62DPUyLed8mFGH6OytNbfYcG3Hv
         rW7yvvZ97xi4Ee73aF3adhehUq7vriyPCWXOn9+VD7C4s4/COFR1a05NHTw7Ib1MEJzR
         43tJm5vtuG0gXcTENhzSZS2+qU82MpW8f/4exoBVVRT6wakhzwF309YvyVZ7fXOME3st
         blV6IQW/b9v4oXpfsGqkQxycc38S8s8quy33b8+AK+q03V5JWkAx8Gl6JgErOo9qGXSC
         8aFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683633901; x=1686225901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtnmDLDOsU/IlqLkId45Pc72BUE73jMq14qxm6Cd1EE=;
        b=KfVV0qf645mK8tirZR0gJAlFMNt+mo0rrOi38+GTqJejllvQAG0Ev2COjCXjKKKEBr
         cwLJCMq3cORhk8ijW8+f7lcjAQen5/rrfB3qq4MxlpAusiLvqHwtfxUUIb3yJf3TY/uB
         H7ZfaPIMtj0b4D90FdfH1xgZukkv8l6Ta1gCIp1gVF8rs8mOhb1/rQUby/WCjuh/N+u6
         aeX8z5eE9sKqrKu+5X7Kt5EIqeC1D9tIRnhkmX0rmAvlwtK0ykJqmvzctXL2LatR5gRB
         7FzYND02rifeHVQk+NULbhb85dOlaNDMDPYxtxI7/BQxrDb9EcTsvoawHH2FOPFa3Z5F
         cQnQ==
X-Gm-Message-State: AC+VfDwyNlX/rtT6nRyeU0866Ngsi2TkVwqRo41AqQpCJGS1jJvyoFGq
	TjEsrI16wQx0QpoDRhsIimkxZ5bnJh8UG+W0H0TbvwXS
X-Google-Smtp-Source: ACHHUZ4PXzzo1tBSSpSH16ChRsRSnhs7CS5tMXlene/zGGeZG0tYWK9Po8orbMwLsITROZStog4r5f0KdbWZH9Mn1GA=
X-Received: by 2002:aa7:d64d:0:b0:50c:3dc:2262 with SMTP id
 v13-20020aa7d64d000000b0050c03dc2262mr10014803edr.39.1683633901517; Tue, 09
 May 2023 05:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-7-richard.henderson@linaro.org> <CAFEAcA8muJ84GMqSBuU0P2YhfERM-kftfq07N8BVO2yG9p6jBw@mail.gmail.com>
 <8988fc6b-8f07-1ab7-663d-3392ca19f7f8@linaro.org>
In-Reply-To: <8988fc6b-8f07-1ab7-663d-3392ca19f7f8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 13:04:50 +0100
Message-ID: <CAFEAcA-79iL8=+143w1jxTG1WM-8NODqqgF4droY=avopm4a7g@mail.gmail.com>
Subject: Re: [PATCH v4 06/57] accel/tcg: Honor atomicity of loads
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
	qemu-s390x@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: yruVjpmz9rCI

On Fri, 5 May 2023 at 21:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/4/23 18:17, Peter Maydell wrote:
> >> +    case MO_ATOM_WITHIN16:
> >> +        tmp = p & 15;
> >> +        if (tmp + (1 << size) <= 16) {
> >> +            atmax = size;
> >
> > OK, so this is "whole operation is within 16 bytes,
> > whole operation must be atomic"...
> >
> >> +        } else if (atmax == size) {
> >> +            return MO_8;
> >
> > ...but I don't understand the interaction of WITHIN16
> > and also specifying an ATMAX value that's not ATMAX_SIZE.
>
> I'm trying to describe e.g. LDP, which if not within16 has two 8-byte elements, one or
> both of which must be atomic.  We will have set MO_ATOM_WITHIN16 | MO_ATMAX_8.
>
> If atmax == size, there is only one element, and since it is not within16, there is no
> atomicity.
>
> >> +        } else if (tmp + (1 << atmax) != 16) {
> >
> > Why is this doing an exact inequality check?
> > What if you're asking for a load of 8 bytes at
> > MO_ATMAX_2 from a pointer that's at an offset of
> > 10 bytes from a 16-byte boundary? Then tmp is 10,
> > tmp + (1 << atmax) is 12, but we could still do the
> > loads at atomicity 2. This doesn't seem to me to be
> > any different from the case it does catch where
> > the first ATMAX_2-sized unit happens to be the only
> > thing in this 16-byte block.
>
> If the LDP is aligned mod 8, but not aligned mod 16, then both 8-byte operations must be
> (separately) atomic, and we return MO_64.

So there's an implicit "at most 2 atomic sub-operations
inside a WITHIN16 load" restriction? i.e. you can't
use WITHIN16 to say "do this 8 byte load atomically but
if it's not in a 16-byte region do it with 4 2-byte loads",
even though in theory MO_ATOM_WITHIN16 | MO_ATMAX_2 | MO_8
would describe that ?

thanks
-- PMM
