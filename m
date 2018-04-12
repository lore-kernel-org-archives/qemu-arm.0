Received: by 10.28.71.155 with SMTP id m27csp2165452wmi;
        Thu, 12 Apr 2018 10:28:56 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+iBJjLX+uBt4wcrHpsxiMwA31A7Rg58LjmNal8JdJDmJKej3vSSU7vtEzorN/5rxKAVGZU
X-Received: by 10.200.57.117 with SMTP id t50mr2535338qtb.22.1523554136761;
        Thu, 12 Apr 2018 10:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523554136; cv=none;
        d=google.com; s=arc-20160816;
        b=x7p26kVvg1v5aZRLeKefGJ6zN9RdF1U1ajxSMNHgxHYxFLMbWMexlG+p+eV1Soz9tN
         L11/hRBWFJFn5/ixqsg6R0qIl8eUz/gadw5I/EtQx+/zy9tMyCkVAB+Bxhyu3EoG6DQU
         Twm6a1iLpDtSwXiUAfUUegtNfwAQD0BuiMWNga2FYHuEUULZiMWeWmKu2XrsKndb7xVE
         7+47rBg37nYV0tPPmjK49lmF5hK/CZ9G2qwMTSwCocXbMO4odxlmtBLwx4T7LC6+/ErU
         JM8Yk6m+vOXazjW1Kqi9C5uom91RwxtZhA6jfVKeTjnkM9R2dibd0LcqBSLtD3IrGAtM
         nkiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=pK9TagOiT6Mx9vzVK8NdIlB2wvaRmW5UqTx0xgcngvU=;
        b=zAIT4aH/zGLJ77RVxDsR9Wn1SoAVh76rYTTp7WgJs8VFCziyZd01v4mSiQOSpFnK9J
         5/SZZeH4K1M7TMe0GADw2daA9va+F8gy7wV748l8pCl5S6sPwmKxgoQlRbXiX1KPMIw7
         +2DO8f8cHh7h3PC5KQLUKv7V3HNyx/Xp/GxPHntya0H/vLEQXFh8m+ObGrmA5ZY73cFx
         IJGKJ1EbV9ViR0RKasywwDW6Vg/6TFgF14aqID2RmMZS1Zh2tNSl8hPDaQ6lRRc0/xIk
         9sK/1fVFwFJqN4LL8uVYQYtQ9k472g5HHglcpyX21ibVXhOmL9iIB6RSUjT8O6pf8+bZ
         5x5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=glk3up+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t10si290857qki.254.2018.04.12.10.28.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 10:28:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=glk3up+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6g1o-0004uM-6j
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 13:28:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6g1b-0004sY-0x
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:28:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6g1a-0007si-4o
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:28:43 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:41361)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6g1Z-0007sQ-Up
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:28:42 -0400
Received: by mail-oi0-x241.google.com with SMTP id 188-v6so5912707oih.8
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 10:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pK9TagOiT6Mx9vzVK8NdIlB2wvaRmW5UqTx0xgcngvU=;
	b=glk3up+1eYm7WdiNPGBHWq5MLfvgVrhQjP7zr2yWfaS07IoZhufigFiqGfYrWR5nJC
	H8yWZUW7u1uJSCyznVKZKeX8xCKNM1SIsfqfqBtB6gW2wxbEI1VFCaymIfUUQoXyTDix
	rRaM3TXjMhQ5zEmSVhaokSdhGsj10BkdnhkFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pK9TagOiT6Mx9vzVK8NdIlB2wvaRmW5UqTx0xgcngvU=;
	b=dDKvXxxPBgUtUwl+MJ562uyEXv2RO5AIh5UfwEjfkA0KDP2m+wmdyu+YjLxSRjU8LQ
	CdS2sLKtHL3ivGLGANXgr1Z7zvPDPVeA6YmhD/jyiINQ2L12dALp0vphOePe1UVMKVLk
	KggiZFQzVYFHoxDMfmRJBUQNrFmfqzHTffbic89LFSM+MepNmmJRtzW+D6K5eJh0snGP
	7BUPK6wurgaZng+Ly/Uot8DCYDovS6Nt0y7w6ZxcSNmmQ/OxUwAQ4pL6UyUURsvPV2ef
	MyDOe3wzfeSRhDoBOvKZ2peCi0DaUc+wIStbtgaE9VL7e2c7w6Ra5NcPuks5BafjAvnD
	NoaQ==
X-Gm-Message-State: ALQs6tBA2wfGzmWvHInO8tYxpZE2AfxC5eVYacm+f0PbXB1P6JSt4vZY
	Ym/ork3Eswg6iSfgxJVjfNdF9vnVRhTffjmvJdQx4A==
X-Received: by 2002:aca:d455:: with SMTP id
	l82-v6mr6652513oig.102.1523554121264; 
	Thu, 12 Apr 2018 10:28:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 10:28:20
	-0700 (PDT)
In-Reply-To: <1521232280-13089-17-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-17-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 18:28:20 +0100
Message-ID: <CAFEAcA8Z0hiFD+VZpvje_76rG+W4NKuEJhNp6cUxUK9eA6+=1Q@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v3 16/22] target/arm: Implement PMOVSSET
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +v5Yi5y7WqU3

On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Adding an array for v7VE+ CP registers was necessary so that PMOVSSET
> wasn't defined for all v7 processors.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d4f06e6..f5e800e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1241,9 +1241,17 @@ static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                           uint64_t value)
>  {
> +    value &= PMU_COUNTER_MASK(env);
>      env->cp15.c9_pmovsr &= ~value;
>  }
>
> +static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                         uint64_t value)
> +{
> +    value &= PMU_COUNTER_MASK(env);
> +    env->cp15.c9_pmovsr |= value;
> +}
> +
>  static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                               uint64_t value)
>  {
> @@ -1406,7 +1414,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>        .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
>        .writefn = pmcntenclr_write },
>      { .name = "PMOVSR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 3,
> -      .access = PL0_RW, .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
> +      .access = PL0_RW, .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
>        .accessfn = pmreg_access,
>        .writefn = pmovsr_write,
>        .raw_writefn = raw_write },

This change is half of a bug fix (the other half being to make the
field in the CPU struct be uint64_t rather than uint32_t). That
bug fix should be in a patch of its own.

pmuserenr has the same bug (uint32_t state field accessed by
a STATE_AA64 sysreg).

thanks
-- PMM
