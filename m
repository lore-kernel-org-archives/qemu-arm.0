Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2240169lff;
        Thu, 5 Dec 2019 08:14:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqy1+33NcPcKyJh389jbAVyOiJKO2liZ2yHgazoOYIbYlUS85p/uXN8C4SGikl/S5UvWA46R
X-Received: by 2002:a05:620a:102e:: with SMTP id a14mr8760223qkk.159.1575562450586;
        Thu, 05 Dec 2019 08:14:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575562450; cv=none;
        d=google.com; s=arc-20160816;
        b=s/c37SxpQa9C+j8DmV39OBYrYrOq0SfDb6DJ6FdMv5pehW8B1aNjLQzLdCzawkF8eL
         7Bnnmbo3SWL4ry8XGC6Tz+DE0eZ2jsQ+XE2Rsa/gTxLG6dJFAY1xM6SC2LyNb/A7AZ53
         s4EgDy3kh8aZsDrXo9Ldftxj+JexNWhuEXYChM7+c23qU1UD97a0kUC/gSHk1H9PswFW
         zpx08D3bhAS9JLTDnpI6uXWrPUIzaIFjiVX0LIfKEY+2IHUfbYRsueqe6PhuXB25GSnx
         QFZe/8fkhvuhtNIbTSO8oLq6btB64fzuXBRn/K7nkSDpnVYC4gXRE2iDMnJIkHhHeIvI
         +dMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O7zxnns45g/PqlaLvC0zluFyeYIq9ueCzPawLjJ2Kw0=;
        b=mtSfMoE9OteVdqpnRQavH/F3MD3QXswYYCL6mOwvo8Vs1jhzyahs+MEgL56XPmiAFA
         /fa7I7WBa4nWfN75tPykDecpIqxqrytfGT6cFTlWcEUVqjInkefFGQ6rRlyVuBic8Q1l
         kniy7FrtjQHaEb6e3FNAM0mEq4Ssa8lAAtYeVCHnTJ/ncJxi+078TZy9Jetkx4xtcmie
         IWuw4CfrhHCrxBuJ94dCfLtVXDmUjY4CFVfnKVgdR6CPzVz08n2/KZ9nZV6IIT/Gk5Sk
         0hcpwZIelGibl5sRKuxv0Twv4M3XwuPX/m47b1NkxcJpsOCnZU6mfqAfyYuBUsq9lywu
         m3YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wd7KtQBZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19si6929137qtb.110.2019.12.05.08.14.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 08:14:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wd7KtQBZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ictlZ-0000DO-Nw
	for alex.bennee@linaro.org; Thu, 05 Dec 2019 11:14:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48440)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ictjt-0006zY-20
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 11:12:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ictjr-0006Cg-NQ
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 11:12:24 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:43977)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ictjq-0006A3-CQ
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 11:12:23 -0500
Received: by mail-oi1-x241.google.com with SMTP id t25so3198281oij.10
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2019 08:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O7zxnns45g/PqlaLvC0zluFyeYIq9ueCzPawLjJ2Kw0=;
 b=wd7KtQBZUXWCXoFLpeVmPM2yG03Y/cbrTiubxSkOvykVU0kCdjP+vbXSe7T7i302pV
 tJHo9TTZJAxjYblLJ8L4WSBdWaNSP8+pkogVaK6DmtjW5rGn+If2IqWZwnfz/fwy81y7
 7OOqLPYDjdPu0HyvQ3e2ljXGevOGYAFwCLDZs/SYrWihVv2DfoI5rplZkpb4psUOKUAB
 fwmdLZWc9/TahUKfSfR4Py2YafwxFEqC6sW9A5v6SXnOdE7MZDUvf9ejOapZG6C4xElQ
 LuDstYmScARwTOkPCUeAz+4Ut3OH7xv8xghIuLkxVbP8HJAbkCsE00Q0Bb9uAiZQac9U
 U9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O7zxnns45g/PqlaLvC0zluFyeYIq9ueCzPawLjJ2Kw0=;
 b=JLovvx9mXPYJzLLlMR6XlwLYN24Ps6dvUZRE+YW85PY5NnWQO4+T12FvPul2DxeKYT
 bNPQUS2XcXoLGuvqjoFKGBtKs4R63HXJgSC5oZ9tXb2A+4LrnLs4Ekcdr9XPcHHo/O1k
 +RKZ8IdTDmFMoq65NDzzZQDonfWP0KzjYfHYhozOvpMKP215QL9wn1dAzUgPg9btMYFW
 TVvwL0EfqV+kH1AKlsbBoWh0HtjrzQZPauZaWhYxFIDEZoflzDrFSN76EL9uj7gGKO6Y
 SqcLP8oFV1dJVjGOm746H8IZwaYPC+i1odp5noKTolNF6eXUFdHdmcmOTsDEqiX/5X+/
 GaMw==
X-Gm-Message-State: APjAAAUDnUad8nQK1Fm+vRRralIWN3gX68ZE6P9PlFenwkPH17vdc3ac
 V/xlfubVxSvg5ibneSoPHECnJIBIykedX8lfvfNrjw==
X-Received: by 2002:aca:f484:: with SMTP id s126mr7442804oih.48.1575562340754; 
 Thu, 05 Dec 2019 08:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-11-richard.henderson@linaro.org>
In-Reply-To: <20191011134744.2477-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2019 16:12:09 +0000
Message-ID: <CAFEAcA-MKN5vJYTwF5fbQVvgC_QpfezG_S4Z1gF1Qxtc5NSNoA@mail.gmail.com>
Subject: Re: [PATCH v5 10/22] target/arm: Define arm_cpu_do_unaligned_access
 for CONFIG_USER_ONLY
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-TUID: pw34q2h+CTwK

On Fri, 11 Oct 2019 at 14:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will need this to raise unaligned exceptions from user mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tlb_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 5feb312941..29b92a1149 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -10,8 +10,6 @@
>  #include "internals.h"
>  #include "exec/exec-all.h"
>
> -#if !defined(CONFIG_USER_ONLY)
> -
>  static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
>                                              unsigned int target_el,
>                                              bool same_el, bool ea,
> @@ -122,6 +120,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>      arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
>  }
>
> +#ifndef CONFIG_USER_ONLY
>  /*
>   * arm_cpu_do_transaction_failed: handle a memory system error response
>   * (eg "no device/memory present at address") by raising an external abort
> --
> 2.17.1

Isn't this just enabling compilation of the softmmu
arm_cpu_do_unaligned_access() on linux-user? That codepath
does a lot of softmmu stuff including calling arm_deliver_fault()
(which implicitly does somewhat more looking at EL1 system
register state than we necessarily have set up correctly
for the user-mode code).

For arm_cpu_tlb_fill() which handles prefetch/data aborts
we just have a separate much simpler codepath for
CONFIG_USER_ONLY which doesn't call arm_deliver_fault().
I think being consistent here about how we handle the
CONFIG_USER_ONLY case would help avoid having a codepath
that isn't very well tested because it's only used in
the odd special case of unaligned-address exceptions.

thanks
-- PMM
