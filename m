Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp753640lfg;
        Fri, 5 Mar 2021 14:54:34 -0800 (PST)
X-Received: by 2002:a17:906:58c9:: with SMTP id e9mr4335117ejs.26.1614984874573;
        Fri, 05 Mar 2021 14:54:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614984874; cv=none;
        d=google.com; s=arc-20160816;
        b=aXTvf/lGV0wjbUn91Tay/uOqOJHbrkQVZz88874xKr+UYQUfn3si9z7GAeyqVIsXqT
         kEXq7v7P7QWa21sZJHnsmDeq6ibQu3oZNB986qwYrIst6+OU4ZUkeYu/SSkcLOseW0zF
         L7mixnUlV2bGTBZPT0YLczW6/C1ohfV6j1VhYDW4dIaBtpItyBQzOA5fbZ/UHPJfasqJ
         xP82SxHiFTq1/mry0o/aHWKESFxybpwOs5Zm0q314CPbp0vJs+PhHc93KOBCfvNRW4Et
         N1hMLrylhL/Ir2OTPNNVU6AOfVA6WDfEXYClKnEKk3XVbsWaOOS/dHoDMKSdDwfxloCB
         tSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OhDzm4pHloCI7PgBmv97B3kI3ArMztNJTPc5uSxw1LQ=;
        b=Vij0T72pYIvptJgLIDjvDPVEVo0A3a2L52VVzWnzrPH0XTzf0udgPVpjsaPUCeDB7x
         b8+zk0KSmVN/Jh9ZBcrkmLabJZcj5x5e70h7c4I0ZHyjcY2aXxuyoIVZWqDc1weKwZ3p
         Rqd1N+dbm2HYxwrEPuooe/xwovUGsDJkzy+aWRYsWC+ZyhCThoGbynOliZiwNRE47KQV
         fCkCarq9fvjjCI0lQ/S0AW5VvwGlYG22RjUvC6WwFq63rPWx/htbG4rDLs4w64mbs7FS
         eQgwiGgHs+nJoIRCeoJ4hsMKxkZe0U90gvuOWDn0MdxTmH3Mdd6gYN6NvWTxeF3bQp0m
         lbXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GeduCRBP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a17sor4183752edj.6.2021.03.05.14.54.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Mar 2021 14:54:34 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GeduCRBP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OhDzm4pHloCI7PgBmv97B3kI3ArMztNJTPc5uSxw1LQ=;
        b=GeduCRBP3i5HZbMXwHf6PKS+KhtAotz0vIuaKz8Wf1PMrba+dYddrTwyi7P2Wh76dn
         BJQatV+iSgXnXcV8dBRa1s/0hv5oMw9dlNsmjr0D8vjNIAf8t0ZpjOcMdSBHOic+IszY
         hXEjp5K6EsPC7JR1H/M06kJOoeWqsBzIPyBQjhzMmUz+Mj0bMsVPcRlO2Eh20buk7Jj7
         l45C7whhteG64jGXcOd7vzG8HpyJp4bbgdvv7JIL7SqrJnLe9utNXzMGgezDCLOryoeN
         s78kBK6vOcSgzxeAx0s35OQHYiD7wOXFYRJRWLUXnJ4UccrBWEV4857N3TEzMdx5V4Lb
         eVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OhDzm4pHloCI7PgBmv97B3kI3ArMztNJTPc5uSxw1LQ=;
        b=c7+tuyZ1AWSCKcrZdELLBsJoBM/qdQEpbhGTrMzJpUxW4qU1+a1P4+8Mof6t/Muq4f
         ULCetyKPRVIyru6ph4bTlS2hr6fdtjliPJ3uLjJjsefUh7soBAqNwC71yj9l1F3JOqGX
         LSipnQv2hbTEs1VcBt5u0ZlHbRWlWtffjaQ1UT0Z4TgCNSxrfphjS9sk44cqdTQA3lxf
         s00J2z66OA4NOMRR72rr6JyRpikZ//imI/2zDfcOGce9O8H7AU6N8KxaY4Odqz463LoE
         GURv+3QbJ5+qddYcC25NKZCMnQhqJ4Wjloc3BwnNJbRdm0SOA2meo2XHLglDD5KUu/9O
         qExg==
X-Gm-Message-State: AOAM5319xXXOtuF7eowk4TtxJKF90eFwEJcGI02GFrSbENxleWYDWkSc
	jb8/HcewpZaijHtxXucB3GaFwFRx4pFTO5OGUdnHrG9r
X-Google-Smtp-Source: ABdhPJz9v0k0UWBnVRYpvF4mDAN3mDsc0GgXDAhN7LVgrk4sgIbMr9rnVWw0NkfjOkDJrMcbWlRjKfBeLamsYHtNaa0=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr11349809edr.52.1614984874405;
 Fri, 05 Mar 2021 14:54:34 -0800 (PST)
MIME-Version: 1.0
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org> <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
 <87im65gxla.fsf@keithp.com>
In-Reply-To: <87im65gxla.fsf@keithp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 22:54:18 +0000
Message-ID: <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of SYS_HEAPINFO
To: Keith Packard <keithp@keithp.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Bug 1915925 <1915925@bugs.launchpad.net>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: oRnDNEzloC2+

On Fri, 5 Mar 2021 at 20:22, Keith Packard <keithp@keithp.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > Also, you don't seem to have the correct "is the CPU in
> > 32-bit or 64-bit mode" test here: you cannot rely on target_ulong
> > being the right size, you must make a runtime check.
>
> Do you mean whether a dual aarch64/arm core is in arm or aarch64 mode,
> or whether an aarch64 is running a 32-bit ABI?

For semihosting for Arm what matters is "what state is the core
in at the point where it makes the semihosting SVC/HLT/etc insn?".

How does RISCV specify it?

thanks
-- PMM
