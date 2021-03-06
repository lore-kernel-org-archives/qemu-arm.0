Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp353413lfg;
        Sat, 6 Mar 2021 06:07:25 -0800 (PST)
X-Received: by 2002:a17:906:3916:: with SMTP id f22mr7096198eje.328.1615039644977;
        Sat, 06 Mar 2021 06:07:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615039644; cv=none;
        d=google.com; s=arc-20160816;
        b=ptsaFrVcONUenTQenGTwI21bUnNIa79Q9k9OjhCD7XQsvNAwSLf9Q7WRZCWLgG2xmC
         3EMIBZNaXfuWFoIMZRvh1KFfrvoeq/2wcLqnpvUQQxt1lx8pVDHVReECJmax8wVhEP+z
         juiRK9kGupUyUcZ4s/BA3krjhKqZL534dEgfPUhKmS+fJ4NAu6q3sFkdoTdKeyTQBed2
         7Z6BUtNI/iz9tkj3Oyj38eZEp7Gt2qXXnQ6c1glsjsxQ+hOMCd06YI4gxUNeJY+p1JxU
         FhxnHIiMfAot3s9hnxFi04ZtB4ZlQl1dxtB/8f46SNA0UJK50Nw6WKZEujYhggj8HCqb
         YYsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J4QN4hD69UaunxWNgbz6h/bF43tggDTuiIXPMwMmLQw=;
        b=SIlrqvKD8/Ti5C5TiiFPcYOc418VAJ8iwxbRi7F1WPmD3mC7DjoK3pd90Nk9geU9dQ
         FMqeaUYffmgHVpREq8h8/YxlBzIkLr1QiM8caZFANEqxFgE8XNiXQNzKmnTOOfQCIV3l
         gUDbZaOSJB5PyIxwYR699DcEA8DGKLCQvqmZv8+zfoVxyDlqH/1JcPuIzXjiBuY6fbn+
         fo3quao1d2+FzI1bUQMStV4hojYhPG0ouaUbsbpFU+dTsCUHnZ9WnCU8uuCTBhNm6PQx
         A/FQIFKtztVj6CpzCsnJEHoTBdbqvKLAknPbRdj6PBJU8q7c8DFls+oj/Gj98QMkmF8d
         RDmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ThrAPl4L;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u9sor5672696edb.13.2021.03.06.06.07.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 06 Mar 2021 06:07:24 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ThrAPl4L;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J4QN4hD69UaunxWNgbz6h/bF43tggDTuiIXPMwMmLQw=;
        b=ThrAPl4LVZ4tumEaRQwllFN7ZIF/0cdBnV5jPqStGNCVwi2pspRcinAYZhrx6UcO/V
         ov7zKXRxaMAZ4CKLoXFEV0jniMVFeX20Q59wXuqAHFnIogWQ/iWh4SSP5gE9vefOWJqC
         J/usChfgLVTQFM7uHj2+UkG2uz7ZZo7T+9LVodkm/c+W8/fZJSC4EnOuyj7YTzsAlKqE
         kYjzwLV8ouyFNeWGGzr+gzH79/sZv+2/dVnPNQfji8i1XaIMX3RbiNZjqxWHqSxHyLx5
         xgdlhPM4E7a/kDyJeSEDdQ4/wDW+x0hDTJKtToRBNvVlH4wROqEHjEj7SsToT0nkcjzg
         SlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J4QN4hD69UaunxWNgbz6h/bF43tggDTuiIXPMwMmLQw=;
        b=k9V5WLeFbo3WaRTedGdkZXCpll6Bc3Iq8uwcaGaEhQyRb1lSNPvJHIB4qohwyjFjaB
         AwcGpNAnvICSklvmy15htqLcCR3JRkZ5Y2PT7yFAtwU7zW3RztXdTDwfrOOY+qdgieAF
         tC88quRN8SBaomdLanJl3QtguR+Y7PN1F9tBFK9xFQy8IVGzAQaCQWa5bzGYFhvVu2l3
         hdlUOMKhFSYzmEu804SPVOPU7sNEs/ML31RyqeS0tkAPVKBmn+3/srd0zVsyGKgL5cNv
         7wdDLMOBkGqOIu0388aIz7Vcw064Cde/cHQFAqlVJNBpS++P24ZnmlN8ERv/fK7O2ZZ/
         KxtQ==
X-Gm-Message-State: AOAM532k1bk9ZNh4A2dPBMfKSeEHGz7RzwbR7VJg0o2lQTt81Yvkc7IN
	rjmeSVi80yFRA1+ktFelZ+gK1syyqf7w/QxgsvqKhm1iZhax5A==
X-Google-Smtp-Source: ABdhPJzeFxbTs+vOkh0k20vQsJsV8sBRPSQtebjt+Sa3ZOQd+7Mnw9dLFLnmxag+HGHyONGH4fxzAsiLYN/w+Bq+IHg=
X-Received: by 2002:a50:d307:: with SMTP id g7mr13983845edh.204.1615039644655;
 Sat, 06 Mar 2021 06:07:24 -0800 (PST)
MIME-Version: 1.0
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org> <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
 <87im65gxla.fsf@keithp.com> <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
 <877dmlgnrf.fsf@keithp.com>
In-Reply-To: <877dmlgnrf.fsf@keithp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 6 Mar 2021 14:07:07 +0000
Message-ID: <CAFEAcA8t9eQf7nD2Ea7z1qO-Tf5xthTvzODS3XsxX+0ns3ttQg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of SYS_HEAPINFO
To: Keith Packard <keithp@keithp.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Bug 1915925 <1915925@bugs.launchpad.net>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: r1+d0aCObreh

On Fri, 5 Mar 2021 at 23:54, Keith Packard <keithp@keithp.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > For semihosting for Arm what matters is "what state is the core
> > in at the point where it makes the semihosting SVC/HLT/etc insn?".
>
> Ok, that means we *aren't* talking about -mabi=ilp32, which is good --
> in my current picolibc implementation, the semihosting code uses a pure
> 64-bit interface for aarch64 targets, even when using ilp32 ABI.

ILP32 for AArch64 is a zombie target -- it is kinda-sorta
supported in some toolchains but has no support in eg
the Linux syscall ABI. The semihosting ABI does not implement
any kind of ILP32 variant -- you can have A32/T32 (AArch32)
semihosting, where register and field sizes are 32 bit, or
you can have A64 (AArch64) semihosting, where register and
field sizes are 64 bit.

> > How does RISCV specify it?
>
> Because the ISA is identical between 64- and 32- bit (and 128-bit)
> execution modes, the only difference between the two is the Machine XLEN
> value which encodes the native base integer ISA width. You switch modes
> by modifying this value.

I meant, how does the RISCV semihosting ABI specify what
the field size is? To answer my own question, I just looked at
the spec doc and it says "depends on whether the caller is
32-bit or 64-bit", which implies that we need to look at the
current state of the CPU in some way.

> I don't know of any implementation in hardware or software that supports
> modifying this value. I'm not sure we need to support this in the
> semihosting code for qemu as I'm pretty sure getting qemu to support
> dynamic XLEN values would be a large project (a project which I don't
> personally feel would offer much value).

Part of why I asked is that the current RISCV implementation
is just looking at sizeof(target_ulong); but the qemu-system-riscv64
executable AIUI now supports emulating both "this is a 64 bit
guest CPU" and "this is a 32 bit host CPU", and so looking at
a QEMU-compile-time value like "sizeof(target_ulong)" will
produce the wrong answer for 32-bit CPUs emulated in
the qemu-system-riscv64 binary. My guess is maybe
it should be looking at the result of riscv_cpu_is_32bit() instead.

thanks
-- PMM
