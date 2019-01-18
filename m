Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3100014wrt;
        Fri, 18 Jan 2019 06:29:28 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5Eb2Es4U7wlexuuhhYzbynAMK//C31HvxK+JkY9hhZ2sWoXEs229T/Y4QhSxLyiHKkW1Z9
X-Received: by 2002:a7b:c76b:: with SMTP id x11mr15468852wmk.37.1547821768003;
        Fri, 18 Jan 2019 06:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547821767; cv=none;
        d=google.com; s=arc-20160816;
        b=PjdOZRg0mRIdbAf9rPZ60FR1PhBSVvQgCvxOrEB8umYY+DUPhE0y9Wj5s8VZnXWsNS
         gxagqvsRISx5GD1ctqSq2Mpiudgu5aeUw25KC+KIrAI64hpr6ZU6vebxhq9DBr2F5toc
         aAgZX3KlhhlOSCbnjwpG8rAjwjqhO7cyyxq9Nb1QetgBkipav+sj+KEFwAVdwelOjnnw
         zwe0K1tsxisXm+88JFavSS6dZNGXtnfbckHUt/cH32j30qrn1ygFcAIKOm3A2A+YOEkd
         ZbCl4P1H02k20DQ3GzxaS720606RSFCVRvbMFGSc2G8S7sbczJn1IpETi/UBfl3E1tGL
         T0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=78EA/DzATuPS+n6NMHd3XV/EU4KqQbM3M28ivwifBO0=;
        b=0ZyAd6rUW9fg/sBtiH50FhAejBgjtiM1itVR3pJqkPhk3Y3PK0BvZQ7hsnIJlTrJLf
         HqdlXK0GXGq3yUv+Uq6wLwziPmd0NToZslEA261znbFKwioSjRh01jXTy82LTvn1E9zx
         stCfK4wZDrdsBWbkD2tCIZmoY8hmHBZGnmj+wQ5LEgDaQ4SIc0EZulx5W85GnZZMBcp4
         FNt+wqqEE0e0rpY8LB6/pLvJ8uYWSKpJLj+3vP2abyaTBZd++zcS70Pb5sgb69IFkF/e
         yqdsLaWSJKA6+1n0X19uZ75HWYQ8O+ZX5qw7Y6RDPiYZ+4p4nHtq8N4EyvSiawoC2bM7
         i7uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kqm3lTcU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si57827822wrs.240.2019.01.18.06.29.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Jan 2019 06:29:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Kqm3lTcU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:40479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gkV9D-0005lz-0W
	for alex.bennee@linaro.org; Fri, 18 Jan 2019 09:29:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gkV90-0005kC-1P
	for qemu-arm@nongnu.org; Fri, 18 Jan 2019 09:29:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gkV8z-0004Pd-0T
	for qemu-arm@nongnu.org; Fri, 18 Jan 2019 09:29:14 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41732)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gkV8y-0004Nx-IP
	for qemu-arm@nongnu.org; Fri, 18 Jan 2019 09:29:12 -0500
Received: by mail-ot1-x344.google.com with SMTP id u16so14499027otk.8
	for <qemu-arm@nongnu.org>; Fri, 18 Jan 2019 06:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=78EA/DzATuPS+n6NMHd3XV/EU4KqQbM3M28ivwifBO0=;
	b=Kqm3lTcUskZsCoi+bSslIcie0nxs2dyXfgZkuR8nWGBuBAjk2vwZfTAH/FwopFlNDN
	O5OcjqVsp23hy81O7gcDSVIiP+lRaYhr+oTg0D1R8xIEF6DMbZxn3op9sbJ62jjjSZD7
	W2250IDBl/UQLfB0WZLeacDKSczWR39jk8rII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=78EA/DzATuPS+n6NMHd3XV/EU4KqQbM3M28ivwifBO0=;
	b=CB4HSF/5MnhnE2FS+rTBEitINhoUBEBthQMLWFgF6nUiWxRrewcmQL/QLkgJT9ZT0P
	4Z/PgeHr0RtcZ/r9yFIiwfEs9BUl4bABeFJ6EXod/RM9JIt3mCFH7AT6m0DWT1DU+WbE
	80dkZD/6dbXefv3s7ZgOSih03ZBQfLZMNmRY2nmQbv5B+lox/kXOiPNJZQrs5aaAkkhI
	SwXPAacAFdJCMJ5RolRkxTaEl5hOYaKDNUemQsDsc3bxwpSiWJunT/WiPSBtkIdJnmKP
	1Mw0U/ZXYi7OWF8gXdQ3JoIf7wtsbt5EWB26PVFMR0tvz1KWKgmOKZPV0fivvNi/Ew7k
	aWdQ==
X-Gm-Message-State: AJcUukd+0Mhjm33kb7IXiH4Y9vwMDpoPyefUa8HciFbWT0RHaV4vM06R
	GYcz0MyEnwN1J4DLPn6bew0VorYHkw3Yz1kVeaXpmCA+
X-Received: by 2002:a9d:5617:: with SMTP id e23mr10998704oti.151.1547821751333;
	Fri, 18 Jan 2019 06:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20190108180014.32386-1-peter.maydell@linaro.org>
In-Reply-To: <20190108180014.32386-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Jan 2019 14:29:00 +0000
Message-ID: <CAFEAcA-9otDEjp7Q4xmdRPbCxUiEQjaKuxaZMsC9A0jMLRQu2w@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH] accel/tcg/user-exec: Don't parse aarch64
 insns to test for read vs write
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
	Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ajoL+9ap0qXr

Ping for review?

thanks
-- PMM

On Tue, 8 Jan 2019 at 18:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In cpu_signal_handler() for aarch64 hosts, currently we parse
> the faulting instruction to see if it is a load or a store.
> Since the 3.16 kernel (~2014), the kernel has provided us with
> the syndrome register for a fault, which includes the WnR bit.
> Use this instead if it is present, only falling back to
> instruction parsing if not.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Since I originally asked the kernel folks to add the ESR context
> so we could use it in QEMU, I figured that it was about time
> (five years later...) to write the code to make use of it.
>
> I wanted to say "everybody surely has at least a 3.16
> kernel for aarch64 machines" and delete the fallback code,
> but it turns out that the gcc compile farm box has 3.13.0...
> ---
>  accel/tcg/user-exec.c | 66 ++++++++++++++++++++++++++++++++++---------
>  1 file changed, 52 insertions(+), 14 deletions(-)
>
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 941295ea49b..66cc818e3f3 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -479,28 +479,66 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>
>  #elif defined(__aarch64__)
>
> +#ifndef ESR_MAGIC
> +/* Pre-3.16 kernel headers don't have these, so provide fallback definitions */
> +#define ESR_MAGIC 0x45535201
> +struct esr_context {
> +    struct _aarch64_ctx head;
> +    uint64_t esr;
> +};
> +#endif
> +
> +static inline struct _aarch64_ctx *first_ctx(ucontext_t *uc)
> +{
> +    return (struct _aarch64_ctx *)&uc->uc_mcontext.__reserved;
> +}
> +
> +static inline struct _aarch64_ctx *next_ctx(struct _aarch64_ctx *hdr)
> +{
> +    return (struct _aarch64_ctx *)((char *)hdr + hdr->size);
> +}
> +
>  int cpu_signal_handler(int host_signum, void *pinfo, void *puc)
>  {
>      siginfo_t *info = pinfo;
>      ucontext_t *uc = puc;
>      uintptr_t pc = uc->uc_mcontext.pc;
> -    uint32_t insn = *(uint32_t *)pc;
>      bool is_write;
> +    struct _aarch64_ctx *hdr;
> +    struct esr_context const *esrctx = NULL;
>
> -    /* XXX: need kernel patch to get write flag faster.  */
> -    is_write = (   (insn & 0xbfff0000) == 0x0c000000   /* C3.3.1 */
> -                || (insn & 0xbfe00000) == 0x0c800000   /* C3.3.2 */
> -                || (insn & 0xbfdf0000) == 0x0d000000   /* C3.3.3 */
> -                || (insn & 0xbfc00000) == 0x0d800000   /* C3.3.4 */
> -                || (insn & 0x3f400000) == 0x08000000   /* C3.3.6 */
> -                || (insn & 0x3bc00000) == 0x39000000   /* C3.3.13 */
> -                || (insn & 0x3fc00000) == 0x3d800000   /* ... 128bit */
> -                /* Ingore bits 10, 11 & 21, controlling indexing.  */
> -                || (insn & 0x3bc00000) == 0x38000000   /* C3.3.8-12 */
> -                || (insn & 0x3fe00000) == 0x3c800000   /* ... 128bit */
> -                /* Ignore bits 23 & 24, controlling indexing.  */
> -                || (insn & 0x3a400000) == 0x28000000); /* C3.3.7,14-16 */
> +    /* Find the esr_context, which has the WnR bit in it */
> +    for (hdr = first_ctx(uc); hdr->magic; hdr = next_ctx(hdr)) {
> +        if (hdr->magic == ESR_MAGIC) {
> +            esrctx = (struct esr_context const *)hdr;
> +            break;
> +        }
> +    }
>
> +    if (esrctx) {
> +        /* For data aborts ESR.EC is 0b10010x: then bit 6 is the WnR bit */
> +        uint64_t esr = esrctx->esr;
> +        is_write = extract32(esr, 27, 5) == 0x12 && extract32(esr, 6, 1) == 1;
> +    } else {
> +        /*
> +         * Fall back to parsing instructions; will only be needed
> +         * for really ancient (pre-3.16) kernels.
> +         */
> +        uint32_t insn = *(uint32_t *)pc;
> +
> +        is_write = ((insn & 0xbfff0000) == 0x0c000000   /* C3.3.1 */
> +                    || (insn & 0xbfe00000) == 0x0c800000   /* C3.3.2 */
> +                    || (insn & 0xbfdf0000) == 0x0d000000   /* C3.3.3 */
> +                    || (insn & 0xbfc00000) == 0x0d800000   /* C3.3.4 */
> +                    || (insn & 0x3f400000) == 0x08000000   /* C3.3.6 */
> +                    || (insn & 0x3bc00000) == 0x39000000   /* C3.3.13 */
> +                    || (insn & 0x3fc00000) == 0x3d800000   /* ... 128bit */
> +                    /* Ignore bits 10, 11 & 21, controlling indexing.  */
> +                    || (insn & 0x3bc00000) == 0x38000000   /* C3.3.8-12 */
> +                    || (insn & 0x3fe00000) == 0x3c800000   /* ... 128bit */
> +                    /* Ignore bits 23 & 24, controlling indexing.  */
> +                    || (insn & 0x3a400000) == 0x28000000); /* C3.3.7,14-16 */
> +    }
>      return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
>  }
>
> --
> 2.20.1
>
