Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp1449711njl;
        Thu, 10 Oct 2024 04:54:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVKasPMVEaO9ygF+WOXZhBNHDuJTK2VZ7UaZMz53cwzgY2i6RtZrUQhY0Ux74JcPCzWdPkvYkcATEF+A==@linaro.org
X-Received: by 2002:a05:6402:d05:b0:5c9:4022:872d with SMTP id 4fb4d7f45d1cf-5c9402289e2mr788384a12.32.1728561279010;
        Thu, 10 Oct 2024 04:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728561278; cv=none;
        d=google.com; s=arc-20240605;
        b=kLr0WnDzZuve+320vAlU86W815UhR0R0LjG9elH/p3y70p9oCmI3nUcKAo9iXiMnKg
         Yvr2Suz98alEqN14tUc4fOP59fZZoVEu52l0lnuSOROlIglC+5rZQcvuEoPpNZnC8oL9
         r42KmNIgK5x9KjGLPbvo+f+SR6nJonom428Fq6gUvWQH2WLncL29Rnu/Y7CxvBFtEhQb
         g1w9xaGecMwauRcLXllYNNv+kgK7UkQFdWaiyiVsd2q2esr4hClHw9WSiIetUqgfXd8D
         UkJMUM+M+6oGCf3KolPGYTqaEiwqA6vQnRAvOIWa5Z28zYUPkAA1RekYONZVKXXmOmHA
         1pXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8Sns7xsmeqPOQZ2N1m+ivw76fAsG/Ttx25YK//ondvE=;
        fh=Hbd7v3F/RLI3ON46NgCPJgprRLCSlCPp3HZ9srV2XGo=;
        b=SSTlDlZI6/y7BOIuagsxYPgHH05a4ILL1A7hBD236/eV72OEfjzAC3VAdG+za4rHVB
         5u+LIf6xQU6Fwet8MzbktJ3fzmrMWl2DGIBaP7bYVpRynGDhaHBpx40E2ManDzVlzJFj
         RdCZZR4tuHJwuWCl+QJvYUaTONidhaTwDU4gEnZiZPLbqhQJERQskaxjYiChuvKqgNAx
         1qt1ui0OvjdzjNllDEV1FwQZ2SRztym7Vjbv1NxBBGBLXF9n+bUQoFruHODfeX9Sxrkz
         SLTieiguDmKwAl0wVLHpWm9ZQsUOI3Mf1MWuw2akRMwuppHAQJuFrvg5EiuQRy04dgr8
         +pXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cNoAA5nj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c93728de60sor347324a12.12.2024.10.10.04.54.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Oct 2024 04:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cNoAA5nj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728561278; x=1729166078; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8Sns7xsmeqPOQZ2N1m+ivw76fAsG/Ttx25YK//ondvE=;
        b=cNoAA5njTZxa8kbaTgsVtAyd/+1slQgHMTSiRtnqN5PrLaxHpxh3jovudgHW6U/wIe
         JOqp3hJhGJB5Y42Yx8i3XAfVQTVgVlPIijY2e+fKCaHrpcxZhVxUap9sKTcF4mqwZu66
         Ls9QuVSl1i+BXHbkpNgSMyv8X+F1kfaXrEXmFrUmW7Aeqk7IXiVN/TE2hk2rAs+Z6Foe
         x9yLM43dpFlQUnBXDDzqXDA3JQH3aKfWLVw4Fxj1ZCGVJ0w7E1Tvl7srF8XDwiR7ObZ2
         3sdrT1IuSewbE8qL3KCFOy1He0XixjEaxv78VtJBETwjigQCOzYFIP84AP6ZrU11qfcN
         CVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728561278; x=1729166078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Sns7xsmeqPOQZ2N1m+ivw76fAsG/Ttx25YK//ondvE=;
        b=p2Z/weTX+8wjSSEqH3I143UigMEa27wNpOrsoAYtmZJIhveG56iSw9ixPk7yh7C1lk
         FtCJQP4Ocqg2WHh4Unl0saGTCQQBuHb2FpORzv5QL478iWhu9UF75dnrMYG8h7Ndddt9
         mM3jC5uZ35RCIUJ0IFZBiDg2rIqRBaYnhu7rrqYUyQMt4DA2LFaTn7izrPBnuMrHaM4J
         BkbOuZc0oCstKMXrYlC61dxACJdd5l7MafmyNOz7Rp9D7IfqtSWV/GdzDKXOh09ccE00
         b1KYn4MisEFV+OvfDAf263ijN468snGB5fBENwssWrId1cqEdVvY9bC1heQuDU7i+TG0
         0qoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZfALFPk2SB7VaLkGUOiwWR3hnFfdF6WTcDPWgYLxx6y382K6+4fcFBdvD28pu4fHF7jHsZfl+/YZVHw==@linaro.org
X-Gm-Message-State: AOJu0Yx7Gu+fZM9h04A/2EwXrQ9qE2vUD3LK1zHVVvDIqnsZ2INMnvpL
	3Q40fA4JMNo6PZQYhJNW6ySfE7Z7A9NbxH0yrP0MJIR843HJXI53BSyTssmhDOloTi2vgZNv86a
	HVfKI+mCQYQl9I4L1ZZYtPrGAP7j3phZ6s0VKyXuT
X-Google-Smtp-Source: AGHT+IHlzPdpIM+xZafDveyx5hFZBh1GFLt91YGTshVGwJuewegfJ0kE6/lX8niCegw6R1ub6TjBDm7VFgL5A3dgYr4=
X-Received: by 2002:a05:6402:3513:b0:5c8:79fa:2e3e with SMTP id
 4fb4d7f45d1cf-5c91d6fc258mr5034904a12.28.1728561278443; Thu, 10 Oct 2024
 04:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241009000453.315652-1-richard.henderson@linaro.org> <20241009000453.315652-20-richard.henderson@linaro.org>
In-Reply-To: <20241009000453.315652-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Oct 2024 12:54:27 +0100
Message-ID: <CAFEAcA-azLR3SdjR6_+aJ0EkWW97mQukacHABHxWj+b7mQ0OxQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/20] target/arm: Implement TCGCPUOps.tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: +mutn/3zC0Ja

On Wed, 9 Oct 2024 at 01:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fill in the tlb_fill_align hook.  Handle alignment not due to
> memory type, since that's no longer handled by generic code.
> Pass memop to get_phys_addr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h      |  6 ++---
>  target/arm/cpu.c            |  2 +-
>  target/arm/tcg/cpu-v7m.c    |  2 +-
>  target/arm/tcg/tlb_helper.c | 49 ++++++++++++++-----------------------
>  4 files changed, 24 insertions(+), 35 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
