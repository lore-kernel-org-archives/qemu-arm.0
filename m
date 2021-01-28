Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp106565lfo;
        Thu, 28 Jan 2021 02:44:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQGJhlPVCL3mleCiYzLmqOLdwVuRCUoSfhcmpw+fO7rCK56OXCifQ7zxIxk9ydlzEEtIIR
X-Received: by 2002:a25:511:: with SMTP id 17mr15163339ybf.166.1611830683887;
        Thu, 28 Jan 2021 02:44:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611830683; cv=none;
        d=google.com; s=arc-20160816;
        b=y4QildXu8YUWcva8tpKr1DUx2SybWrtrLFobEB7AAtaMsQgeLzT3xVWPYepjjXD5Jk
         XtUcTYX/046kG1CVqv8kuDIH/FXSvRadiyMw59/3Y/vzUeAxivCO0gNOgpLClFxng/e7
         pOk35zbN693RJbQYGZWv4IOefmojo/Vzq6hPCI9ZpvBNTUzqhJ1KbPEb/CtaYKiMUdN5
         1leOQlaW2zaFBTuI09K2uUEsdyk5XC4e3DKpzd1esQoeqCBg8XzCP0WNH5JLAGNNAT8l
         U9oeKuNpZnnlvMIcx/mUOglcWWd7TOEocaPdmJYTjhmdHr9UGB3Noeg/X6uzWElrZqkr
         S6xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hwxWhuPAeBOGG7cxyNlAbfsJe23zd190HfsFXc5SNv0=;
        b=rzzdab+QCjeUrpsVho17EZA8Ceojgm6Ua+GMOf3bcFo6DpyKzBFc1dHIfFkB9V0avj
         CMnqrMyhDB2V0jXB0f+BBxxlfBFQ3EX0YVmSnuMz8cvozG2OXeJZnNMXl9roCFIPJCrM
         33LBlAukozOFP9kHSOGtqiUQW0OIeYnGVYN8/pzT7eUBLlfG+2E+upUhIeMsqVzMtFye
         Myjd+ii5b7J/8yTE87U8/dS+QYofWZwHhk1A+P7CnXqVrLF/kr3T6lSQGr8PVC7QmFC/
         iS5/zXF51/SijxCgD4lg6DczIJDEu5iolD0oMZSFihJhikOvJHkTmpSZVVXFuqB2R9Ny
         160A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TT+1b72x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y126si5565385yba.489.2021.01.28.02.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 02:44:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TT+1b72x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l54n5-0001LM-9o
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 05:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l54mp-0001K1-Uf
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 05:44:27 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l54mo-0002uP-2J
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 05:44:27 -0500
Received: by mail-ej1-x636.google.com with SMTP id gx5so7006951ejb.7
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 02:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hwxWhuPAeBOGG7cxyNlAbfsJe23zd190HfsFXc5SNv0=;
 b=TT+1b72xpvG43lT3FgHLt1u44+bwNkKZyv7VGVRiYe3vkd+5wEyAr2Hl6IMqJQ/21d
 P0q+z12TwsxsYsMNSj2p5lUs+dxw6tqgAYKVyK3gFtmzrNtKQIe4kHPoCUBuSFo8wQ83
 ljEjCxiEVHMHmspItr7qV7aCFsmOyCVwWwuiBmXWsxLLRhyFfdhQDpTOxmAUm73fqQzd
 QYZAYpry0GuqhFDKoK+6Ooef2ErvcbRnqYQQJuuaueaglAzehsBJAJQxIOv0WoKQ9NFr
 lTFlOW0WVJRtooRfYwJMmEgn+davoNwnEccdw1bMS/TWUa75jv7XQqXqHh0HL/W61G+c
 jsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hwxWhuPAeBOGG7cxyNlAbfsJe23zd190HfsFXc5SNv0=;
 b=uXc8tc8H5t8V0bZJEXVQsjsjXdwzOKRvxFK+t9YC2t3VL/4BAbNI4SBBr3BRAKQRp1
 U8m+SJYxgJJFGzdqWLwgxjhbM0dKgNJ+3bTWk7IdfKuUO7TWTUbzW95Mc369j1cozu//
 SE4ikNVIdNZiP8i+kzek0SqyXPKC+EwUXxV2eiUKNSKZlPBlstF0gKAG+ZC3MJUklLLK
 6q+ygcBn0G0P4QS2Cvzae4jYHdtyfc9sDOY/JKY+nIecWRQqhaVIMNeciFrXwy/n0DQh
 hVPFVc6d2MOAo5fKjYRJST+zTJH/Ia3wZOz2P8DyjiIRMzEYSFivz6eHdNTUv/lR+h+j
 OfJA==
X-Gm-Message-State: AOAM533ou+j+r4jca6kSDw+T6u1txTHYMo5wmCKl0ohYra/SFQ19CaDI
 itxPlkSPs+TCBPaIY19iHJpdpT9HjgD1CpxGwEmAFQ==
X-Received: by 2002:a17:906:4002:: with SMTP id
 v2mr6504423ejj.85.1611830664023; 
 Thu, 28 Jan 2021 02:44:24 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-19-richard.henderson@linaro.org>
 <CAFEAcA8rXQ76AVpqHwum_XGh13u+vwkZw_yOxRKvfyqbV3_GBQ@mail.gmail.com>
 <b81f168c-dfe3-5d59-b1a2-1c3df97f7105@linaro.org>
In-Reply-To: <b81f168c-dfe3-5d59-b1a2-1c3df97f7105@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 10:44:13 +0000
Message-ID: <CAFEAcA9tS7eWDoa7Wu3p6Be4Jce9oaPyHh_8ijJJbjZpmgL+Cg@mail.gmail.com>
Subject: Re: [PATCH v3 18/21] linux-user/aarch64: Signal SEGV_MTEAERR for
 async tag check error
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AxTZHjfz9O3V

On Thu, 28 Jan 2021 at 08:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/22/21 3:59 AM, Peter Maydell wrote:
> > Does it work if we just always queue the SEGV on exit from cpu_exec()
> > and let the signal handling machinery prioritize if we also pend
> > some other signal because this was an EXCP_UDEF or whatever?
> > It would be neater if we could keep the fault-check outside the
> > switch (trapnr) somehow.
>
> I would think so.  I'll try that.

In particular it seems worth testing whether 'singlestep in gdbstub
over an insn that takes an async MTE fault' has reasonable user-facing
behaviour.

thanks
-- PMM
