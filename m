Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp742538lfb;
        Fri, 15 May 2020 11:34:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2T60aEtKuDrlyrQtW1Xj6VYu4vJYfez1jbtUHtHKDkq0dGfScm2GgiKD706n5QyFmB0RM
X-Received: by 2002:ac8:2aa6:: with SMTP id b35mr4766393qta.153.1589567661997;
        Fri, 15 May 2020 11:34:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589567661; cv=none;
        d=google.com; s=arc-20160816;
        b=qIkX+r3mZCaR8tpVgkPztSzmPRt4cQdKNtbpN+9UnGGl7vhXBVfvmSV5U2NmyzCxSP
         O7fWNJYzL1hLT0JJznpcpqzcm5SNm4FBtX6UGQ7JvKsGJCu1HEGivEOkSJU8ZCwM11rL
         rEFj+yXZmXxI3X/QJidi0gtoFUJeOoFdhRM0V2kXMZ2UzvEiccnKiLMcogH3rMGFC0lv
         eA6BAO7mfv8EPG4y/zxxjX0o6vpT2rrjABhxyj44W5BfbdYNu/xdnSffQaqloIGqVBHx
         5G7y91zcwnzRjohqIbLwuNidGvcO0J6SPsPrLtIHFdxQhqUC87cW7NejQ4OctZXUuWvS
         iiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7+R0wGR0TzyHt4PaQaWcOlFGkbI1G+AYd/eUIw65yUM=;
        b=HNR5lf0gHrZIsZRrHLIoH2s/K+IpkZEWuvr4g9vaM+UMgBkwk3yA9gu1MxXt5cmsCv
         lfbUybd9MGy/LcP0e0ZJrrq+mDoRktkd+c9N9hgv7Kb71tgxGSphmZg5Cd/6Exu8Ij6l
         wkMmbYaHq82G8+joGUNAFfpyl0ABkK+lr5fmlrVewcemysG0flmeNEgW5n2G3j6P4s8n
         U9VYWHom5JSZ7U+MR6IVx6SBsJ3yRUqY3n2fgwldr2xAX5f+tM0HDTZ5dPmLr16r+g1t
         13aXexg/uuSp2s6k1p85e7XaCaUWnL/8cI32YH1j1g0q372gUt2zRTToxpGjxmSgHiXb
         dZPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eGImXlU2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11si1713111qtb.341.2020.05.15.11.34.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 11:34:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eGImXlU2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZfA5-0000Bo-F5
	for alex.bennee@linaro.org; Fri, 15 May 2020 14:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZf9x-0000BX-SZ
 for qemu-arm@nongnu.org; Fri, 15 May 2020 14:34:13 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:32786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZf9w-0002TC-MS
 for qemu-arm@nongnu.org; Fri, 15 May 2020 14:34:13 -0400
Received: by mail-ot1-x344.google.com with SMTP id v17so2710137ote.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 11:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7+R0wGR0TzyHt4PaQaWcOlFGkbI1G+AYd/eUIw65yUM=;
 b=eGImXlU2A26C+bPwa98eyGtniLme8ZjnRn0kZ1W8usP7u9w8IUKv4DIovclz+FHhZP
 QoYlUGD+FEXeEfdsI6EcSIIkyp5biiEZ+NZ2Gi2ee6DTTxa5x8lplzf4VYHp15P+V8vL
 z6pSlZgvx+DBloTsbjLRGGEZFlG+fJzCN/+p+JTIklb3PZlzS+NVOND2vKafvgg5Axsp
 Dl1x0OJkvAaa2tu6dwtiTLeYpBhIpTCnOZm2EQdIePkNsOaal9UeazBx6dSQK0EBGqzq
 gBAijNFMjKhWpZog1ZTaWzFlo0X+Sr+p3nlW8Sy21rWsGKqc9iaSZ6p05kqGHRlacRsR
 uoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7+R0wGR0TzyHt4PaQaWcOlFGkbI1G+AYd/eUIw65yUM=;
 b=UCxy33IHdrAeCQhiQ/SngZY0STVMSIhFUdpsaCHtPb+M/RD4qTG/j7JXx1uVik5Zgb
 sJMVPnFqILdd4xdVGpAYNEgz2wF533Zf6Xg788Z63q7KHG/zRQwaayEosInPQR3TgI0H
 1r0ulu2f9qEPOfMpa6kGL5CTVD3KW6alZKs22VJELpzWhjv+9hr+IgDTpVCzszQYTaud
 QT+DeLVcsa6yv3HOQFsvIAjuU5lJKCwZRiRD1zg7I4d/OYeDzThCaKKAmihbRzPsboP1
 BwW0h9lDdDty6Lnv3XlJEDevjP2/UMEWA0UpLIeWnfOVjTrhSeuVHfZZZn+ucNI5MObG
 hQqw==
X-Gm-Message-State: AOAM531DUcRyXkCu2qh0oaZBa+7NMu7Eb77vLvG+MMC3yAtyWESwbnrJ
 g9GPFP/S5ZlLQWzgiBVmOV49l65ubZUxhpjSpEXFiA==
X-Received: by 2002:a9d:b82:: with SMTP id 2mr3114800oth.221.1589567651259;
 Fri, 15 May 2020 11:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200507202429.1643202-1-amanieu@gmail.com>
In-Reply-To: <20200507202429.1643202-1-amanieu@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2020 19:33:59 +0100
Message-ID: <CAFEAcA-n8-pOcwovsS1Z3T4AMa1Nueo2yik9zX5H16QAHeE05A@mail.gmail.com>
Subject: Re: [PATCH] linux-user/arm: Reset CPSR_E when entering a signal
 handler
To: "Amanieu d'Antras" <amanieu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PwJKqKB6TTdW

On Thu, 7 May 2020 at 21:25, Amanieu d'Antras <amanieu@gmail.com> wrote:
>
> This fixes signal handlers running with the wrong endianness if the
> interrupted code used SETEND to dynamically switch endianness.
>
> Signed-off-by: Amanieu d'Antras <amanieu@gmail.com>
> ---
>  linux-user/arm/signal.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
> index d96fc27ce1..8aca5f61b7 100644
> --- a/linux-user/arm/signal.c
> +++ b/linux-user/arm/signal.c
> @@ -244,6 +244,12 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
>      } else {
>          cpsr &= ~CPSR_T;
>      }
> +    cpsr &= ~CPSR_E;
> +#ifdef TARGET_WORDS_BIGENDIAN
> +    if (env->cp15.sctlr_el[1] & SCTLR_E0E) {
> +        cpsr |= CPSR_E;
> +    }
> +#endif
>
>      if (ka->sa_flags & TARGET_SA_RESTORER) {
>          if (is_fdpic) {
> @@ -287,7 +293,8 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
>      env->regs[13] = frame_addr;
>      env->regs[14] = retcode;
>      env->regs[15] = handler & (thumb ? ~1 : ~3);
> -    cpsr_write(env, cpsr, CPSR_IT | CPSR_T, CPSRWriteByInstr);
> +    cpsr_write(env, cpsr, CPSR_IT | CPSR_T | CPSR_E, CPSRWriteByInstr);
> +    arm_rebuild_hflags(env);

I was just looking at the signal code's handling of CPSR for a different
reason, and I noticed that at the moment we don't allow CPSR.E to be
updated from the signal frame when the signal handler returns
(because CPSR_USER doesn't contain CPSR_E and that's what we
use in restore_sigcontext() to define what bits from the frame we
allow updating). Don't you find that when the interrupted code
returns from the signal handler that it ends up running with the
wrong endianness (ie the endianness the handler used) ?

I'm going to fix this by putting CPSR_E in CPSR_USER, anyway.

thanks
-- PMM
