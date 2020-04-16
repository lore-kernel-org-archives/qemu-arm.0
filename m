Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1732302lfm;
        Thu, 16 Apr 2020 05:09:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypLllEOVzene17foRFiOdqn+Oi/JQARDlfYq865sJRsswhE7LXufHJ9VZHqrYeWEH5FzepVd
X-Received: by 2002:ae9:edc8:: with SMTP id c191mr24965159qkg.478.1587038940057;
        Thu, 16 Apr 2020 05:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587038940; cv=none;
        d=google.com; s=arc-20160816;
        b=rs4kj6mIqlQB6Q+UFWFLygq06KGAYVjCEQWQYkmIkcnq/q9y39xIjSXshCckShfoIU
         ALLoSD0TcjydWk7KNYOuOVViOJjtUluR3oIwzRrSuYKtjpGwu94aVhS7RH6/k/aurlOc
         smKTDmTSDZOtq3rGSU8wJVYs64KAHJxEi7eAjcfqyPAZcjpuv4CuOCz22VtQ2bj2ZIkN
         oy4Pi9Ca0VlxK2hifbwLA29Ne7DKQaziLv7psSnvRz6aZ7iN9cSjhu7OQijZ8Wu13WWR
         O9nOa2/ZYSFlO1tcbdS+v8cSqZRP42aMfnkSwuuja6H0OnF/Cxny3tIaDQeXKkXS9aEY
         vGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NywJugj7NuJi7HibrnT8U9f5/OVGMNdGm4E4uzj/oyw=;
        b=PwD+EHOQqklHePO6K+3Gohr6385J6PVgXE/Z299HqjmfgbW9x705kXb2CQXRmVCiT+
         8G76uCk78ie4Bz1DI8KS0qFwHshDs3kzTGln6fWiEDhNx+Ak0m16B6Jnq55NBcndTMk6
         uYjNwAr1qM1kiVp8hBwDXnK7DQHoAS8ng/y1HZgVs/f9eA859lTqBUiH27DaXK0o43ox
         q6WotfuTPNqF6YwumXp2n/asOVsOf9iNLgmXLm+M4doVp440Z5tm7USm++BGhwJGB6wt
         UTNGYgogjBeyY2L5svX27oxIzQlaOdNHT7Y56PwXhyFB5n2iu8gRWb5ED49B2GHNux9S
         Jvrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=exqQa5S5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f52si8032605qta.379.2020.04.16.05.08.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 05:09:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=exqQa5S5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP3KF-0003NT-HE
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 08:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51635)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP3K8-0003N2-UM
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 08:08:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP3K7-0006a7-Lm
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 08:08:52 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41039)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP3K7-0006ZX-Db
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 08:08:51 -0400
Received: by mail-oi1-x242.google.com with SMTP id k9so16343819oia.8
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 05:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NywJugj7NuJi7HibrnT8U9f5/OVGMNdGm4E4uzj/oyw=;
 b=exqQa5S5zMSWUHSxgEYAKzc6pslHS1Fv10xbFdKK0q1hCcqoq35edsLVuDzIu/gjn7
 Kb7QLi7hcpzHcrVLcGZuUIP4QKncxFOHZamXdSYqJMVQt6tU3PElX0gfYA4Qu2USfxFP
 zadPywPjvK3g/Cqu3aoYpScb3WD5Z4cPI62UmEuSa40nypViBV1BDPmjDi24MkuDE/wH
 J/9TQlUStr+937I5rbhpAhCRzZ5C+fSzeTXFjsBHeV2bBVYTNe21R33xcUdvq1GD6ypL
 Is+Nm9h9u4bDhpJGNl4d1N1qos2LP9Eo/M44hbOsRAhOqTsfTwap8wSJZctjTzjZ9DFc
 kliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NywJugj7NuJi7HibrnT8U9f5/OVGMNdGm4E4uzj/oyw=;
 b=HtpM6VNETD9zUtG2Vr0weUioIvH799mvhJo4CNMiLLWfCNtux0+M7BtsDLfcEwwBiw
 602pMij+MOsY7bYy9mRlbp0QxgB/ADEwMpevl1QF2dYm/+uJuMTh5z8TlS0mV/t4HZws
 izDiE+wT98IpxLwEpKX/PAA1j/zpIy1WM5mvSnKetdgG+/EUC66advHed7pXclkIMKIq
 vUhFyGecGrr++8W0OX4Dm/7HSZaCVG8o09TAZoolS8jVTakz7M1mog8mDiZGGzyZ/8VW
 84hYHwD7gPu7yhblH6MJlbgS2HW94kX8doBYzrjQTv6/R4g2bozKloHXixSsZgQ+G5+r
 QR8g==
X-Gm-Message-State: AGi0PuZI48a2UZJCUzUgOGA9I0hoYmfvdpQYQHEoFTaSQ/ywfHn4Dsqw
 MLy6xmca52cV99lkGzWU4vTwpRj4odfGtb3VSPQ4AA==
X-Received: by 2002:aca:3a8a:: with SMTP id h132mr2508446oia.146.1587038929881; 
 Thu, 16 Apr 2020 05:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-4-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 13:08:38 +0100
Message-ID: <CAFEAcA97saZB=8qbHxfJiNWXN4F916-ZqjaLt=-fzUzKcNmUFg@mail.gmail.com>
Subject: Re: [PATCH 03/16] exec: Add cpu_probe_watchpoint
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-TUID: 0g/3EDTiQnqm

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Allow probing of a watchpoint *without* raising an exception.
> This is of most use for no-fault loads, which should indicate
> via some architectural means that the load did not occur.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/cpu.h |  7 +++++++
>  exec.c                | 19 +++++++++++++++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 73e9a869a4..8ec44267a4 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -1090,6 +1090,12 @@ static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
>  {
>  }
>
> +static inline bool cpu_probe_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
> +                                        int flags)
> +{
> +    return false;
> +}
> +
>  static inline int cpu_watchpoint_address_matches(CPUState *cpu,
>                                                   vaddr addr, vaddr len)
>  {
> @@ -1104,6 +1110,7 @@ void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint);
>  void cpu_watchpoint_remove_all(CPUState *cpu, int mask);
>  void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
>                            MemTxAttrs attrs, int flags, uintptr_t ra);
> +bool cpu_probe_watchpoint(CPUState *cpu, vaddr addr, vaddr len, int flags);

Could we have a doc comment for the new function?

>  int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
>  #endif
>
> diff --git a/exec.c b/exec.c
> index 0cc500d53a..2b8f601b9e 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2735,6 +2735,25 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
>      }
>  }
>
> +bool cpu_probe_watchpoint(CPUState *cpu, vaddr addr, vaddr len, int flags)
> +{
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +    CPUWatchpoint *wp;
> +
> +    assert(tcg_enabled());
> +
> +    addr = cc->adjust_watchpoint_address(cpu, addr, len);
> +    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
> +        if (watchpoint_address_matches(wp, addr, len) &&
> +            (wp->flags & flags) &&
> +            (!(wp->flags & BP_CPU) ||
> +             !cc->debug_check_watchpoint(cpu, wp))) {
> +            return true;
> +        }
> +    }
> +    return false;
> +}

Clearly the insn emulation needs to do the right thing for
guest architectural watchpoints, but should a gdb watchpoint
also affect no-fault-load behaviour? I suppose making them
both behave the same way is probably the least-surprising choice.

thanks
-- PMM
