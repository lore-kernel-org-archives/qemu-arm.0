Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4274788wrg;
        Thu, 6 Jun 2019 02:53:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwjIBwVxb1WH7jjXrvJCibKzL5S5Xhh/7DaRyDu4asDB2sm78CINzio1k4tr3qmmg3RXIF4
X-Received: by 2002:ac8:2439:: with SMTP id c54mr6850059qtc.160.1559814834137;
        Thu, 06 Jun 2019 02:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559814834; cv=none;
        d=google.com; s=arc-20160816;
        b=Kbswl3+tn/wWJsZTLnKVheZMyMkhOny7rrgqfcdnjIAINjM8zyQrA1icGOIu+b37Eo
         dYAMJziN0ApxOEzh1PhLPJ9sg9LxSqSCjUkxAZiNsgM4XEQ6p1eEqmMsfLYV+98SFFtW
         1SyM87LUec5hbrY+V9j5X1zV9HwwDqlEMsIrIeiv0W1T/LXXmRObOKOxN/Hf1hcnuglf
         F/Hd7C1/V70Zid7VsUfbCVB5E2FO8Bb4IWLYttGa1tkS8+76bnWpn7eHJUEEzE9Mnbok
         DwurlisGKnsTymmUFatJExZ6/6YKcbNuRwxzNFBmD02GukuQa392xsl2gyvSeJP8ApHh
         7qOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=ZECxG/PcfybXjVIMD7V9uHp2EEIdokSdb2ziGB9PCM0=;
        b=LkddSClJ/aOWIKDGnQeyntnDRr+GlixhjUUDTi0p9nLPRKa5R6Uix9jV0bdIMGMsqx
         PryJDCxHNH5UWl9cXLiBO1L/lrYkmSyEOLU1KqvbLUu/v5nik78FzdNv/zzWPhFyt97J
         NJ1IaDBJibXEchdHwPABD5X+b8TtlCSrmhK83OQripqhJ5fAC2u7Hbx/NiPNkD/zPmH4
         298PfHSQDUWZWOUWiVHZkaahkW75pve2A2wkzPerQpYJ7S7k0UGnHC9rRrP2agyiRjtB
         m/HeA3ga7X9/OS8KWIozDCK099E2D4Vk3dTVGW7pjqkbeJdLeiUG/idiiv5idEyzfkZG
         Ae7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e123si1399244qkd.258.2019.06.06.02.53.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 02:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYp5l-0002UH-Ik
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 05:53:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Dave.Martin@arm.com>) id 1hYp5Y-0002Tn-J1
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 05:53:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Dave.Martin@arm.com>) id 1hYp5X-0005nC-EM
	for qemu-arm@nongnu.org; Thu, 06 Jun 2019 05:53:40 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:40928
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Dave.Martin@arm.com>)
	id 1hYp5X-0005is-5M; Thu, 06 Jun 2019 05:53:39 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16D86341;
	Thu,  6 Jun 2019 02:53:37 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05A823F690;
	Thu,  6 Jun 2019 02:53:35 -0700 (PDT)
Date: Thu, 6 Jun 2019 10:53:33 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	g@e103592.cambridge.arm.com
Message-ID: <20190606095333.GZ28398@e103592.cambridge.arm.com>
References: <20190605205706.569-1-richard.henderson@linaro.org>
	<20190605205706.569-2-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605205706.569-2-richard.henderson@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [PATCH v6 1/6] linux-user/aarch64: Reset btype for
 syscalls and signalsy
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0NoXACnl5WCI

On Wed, Jun 05, 2019 at 09:57:01PM +0100, Richard Henderson wrote:
> The value of btype for syscalls is CONSTRAINED UNPREDICTABLE,
> so we need to make sure that the value is 0 before clone,
> fork, or syscall return.
> 
> The kernel sets btype for the signal handler as if for a call.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/cpu_loop.c |  7 +++++++
>  linux-user/aarch64/signal.c   | 10 ++++++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
> index 2f2f63e3e8..1f68b13168 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -86,6 +86,13 @@ void cpu_loop(CPUARMState *env)
>  
>          switch (trapnr) {
>          case EXCP_SWI:
> +            /*
> +             * The state of BTYPE on syscall entry is CONSTRAINED
> +             * UNPREDICTABLE.  The real kernel will need to tidy this up
> +             * as well.  Do this before syscalls so that the value is
> +             * correct on return from syscall (especially clone & fork).
> +             */
> +            env->btype = 0;

Note, after discussion with the architects, I think Linux won't bother
sanitising this field in my next spin of the patches.

If the SVC (or HVC or SMC) sits in a PROT_BTI page, then it won't
execute anyway unless BTYPE is already 0: otherwise, a branch target
exception would be taken instead.

If the insn isn't in a PROT_BTI page, then BTYPE could be nonzero when
the SVC (etc.) exception is taken, but it also won't matter in that case
what BTYPE is on return, since branch target exceptions are never
generated on insns in non-guarded pages.

For this to make a difference:

 a) the SVC be in a non-PROT_BTI page, just before a page boundary,
    where the next page is a PROT_BTI page, so that the exception return
    goes to the next page.

 b) the SVC must be an mprotect() call or similar that enabled PROT_BTI
    for the patch containing the SVC itself.

These are both silly things to do, and we probably don't care what
happens in such cases.

(Question: does qemu ever mprotect() the page containing PC?  I'd hope
not...)

>              ret = do_syscall(env,
>                               env->xregs[8],
>                               env->xregs[0],
> diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
> index f84a9cf28a..5605d404b3 100644
> --- a/linux-user/aarch64/signal.c
> +++ b/linux-user/aarch64/signal.c
> @@ -506,10 +506,16 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
>              + offsetof(struct target_rt_frame_record, tramp);
>      }
>      env->xregs[0] = usig;
> -    env->xregs[31] = frame_addr;
>      env->xregs[29] = frame_addr + fr_ofs;
> -    env->pc = ka->_sa_handler;
>      env->xregs[30] = return_addr;
> +    env->xregs[31] = frame_addr;
> +    env->pc = ka->_sa_handler;
> +
> +    /* Invoke the signal handler as if by indirect call.  */
> +    if (cpu_isar_feature(aa64_bti, arm_env_get_cpu(env))) {
> +        env->btype = 2;
> +    }
> +

Ack.  I had a simple test for this for native userspace, and it seems to
work as desired -- so I don't expect to change it.

Cheers
---Dave
