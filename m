Received: by 10.25.205.13 with SMTP id d13csp9785959lfg;
        Thu, 5 Jan 2017 06:44:01 -0800 (PST)
X-Received: by 10.237.56.40 with SMTP id j37mr72002396qte.134.1483627440980;
        Thu, 05 Jan 2017 06:44:00 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i17si2156973qta.94.2017.01.05.06.44.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jan 2017 06:44:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cP9Gm-0006A6-Gw
	for alex.bennee@linaro.org; Thu, 05 Jan 2017 09:43:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cP9Fs-0005rh-Uk
	for qemu-devel@nongnu.org; Thu, 05 Jan 2017 09:43:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cP9Fr-0004XW-Ua
	for qemu-devel@nongnu.org; Thu, 05 Jan 2017 09:43:01 -0500
Received: from mail-ua0-x22b.google.com ([2607:f8b0:400c:c08::22b]:36105)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cP9Fr-0004XO-Q3
	for qemu-devel@nongnu.org; Thu, 05 Jan 2017 09:42:59 -0500
Received: by mail-ua0-x22b.google.com with SMTP id 88so374389492uaq.3
	for <qemu-devel@nongnu.org>; Thu, 05 Jan 2017 06:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3ksPm5+h54G5jXSmiTS9zjUE5TpZxHe2PictiYm3AzE=;
	b=Xni1G4QnBdS9KoNu8JYM/efeOfVR0kmD+I5Nc7IlgV0mf6y+a9ZZZwJy55u/A5FrFs
	AWXYpLXHYI43aKuT7ZwvDf5vvPmVoNiCKqRFMYY4iwe0wkiSn3gNrz+IodSDiw0zkYvg
	5it6Zlgpngz5lVD1pepSfcyiE1j5LbGAaFr0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3ksPm5+h54G5jXSmiTS9zjUE5TpZxHe2PictiYm3AzE=;
	b=ELhNrGbQpsS3Ey5mh6WssNItoT6A2x1xMwqZ9+d6Tu+TWKXnv2cf5KLZU+BbQRzW+2
	46YcQT6bAM+PSKLpfLT1fIipZFJ5XpY4Y5pqmn6ITEP4iyaAqWG+X4+QGCgrhtDnjc7T
	ndYutyukYf+8YvQWenuVSDGyQH/TmA8+bun3KUbdsG5+O7xXY/ZiMftLoT1gg7g/D+p8
	pYlx5LhkL9LioqCxjSJsS8ocrY8LuLb67jbpsPLhRwgUJajINHo5Wn9pwsSe7Apo5udO
	tXRs23bf98YK0cvYNW/8n9K+vdwvsjcyqpyqTHX3gX633OKDnjGvUtJo5W8tJztQL5ZV
	psnA==
X-Gm-Message-State: AIkVDXJbp3heJT2UspTzGYS2WaSpvDvlcuRmL+6s+X5m05YM/DAs2TKbC67ZlZLFBtoOtq+r/mcUVfb2IuVw9I2o
X-Received: by 10.176.67.132 with SMTP id l4mr46159986ual.164.1483627379058;
	Thu, 05 Jan 2017 06:42:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Thu, 5 Jan 2017 06:42:38 -0800 (PST)
In-Reply-To: <20170102124424.1031-1-kirkseraph@gmail.com>
References: <20170102124424.1031-1-kirkseraph@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2017 14:42:38 +0000
Message-ID: <CAFEAcA-9aYRHcn1dAD0xuR9H8sJ__HOK9ayWmsK7H-Cr2rj4SQ@mail.gmail.com>
To: Seraphime Kirkovski <kirkseraph@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22b
Subject: Re: [Qemu-devel] [RESEND PATCH] target-arm/abi32: check for
 segfault in do_kernel_trap
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gH+E5pIlj52G

On 2 January 2017 at 12:44, Seraphime Kirkovski <kirkseraph@gmail.com> wrote:
> Currently, the cmpxchg implementation tests whether the destination address
> is readable:
>   - if it is, we read the value and continue with the comparison
>   - if isn't, i.e. access to addr would segfault, we assume that src != dest
>     rather than queuing a SIGSEGV.
>
> The same problem exists in the case where src == dest: the code doesn't
> check whether put_user_u32 succeeds.
>
> This fixes both problems by sending a SIGSEGV when the destination address
> is inaccessible.
>
> Signed-off-by: Seraphime Kirkovski <kirkseraph@gmail.com>
> ---
>  linux-user/main.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 75b199f..376b0c3 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -503,6 +503,7 @@ do_kernel_trap(CPUARMState *env)
>      uint32_t addr;
>      uint32_t cpsr;
>      uint32_t val;
> +    target_siginfo_t info;
>
>      switch (env->regs[15]) {
>      case 0xffff0fa0: /* __kernel_memory_barrier */
> @@ -516,13 +517,16 @@ do_kernel_trap(CPUARMState *env)
>          start_exclusive();
>          cpsr = cpsr_read(env);
>          addr = env->regs[2];
> -        /* FIXME: This should SEGV if the access fails.  */
> -        if (get_user_u32(val, addr))
> -            val = ~env->regs[0];
> +        if (get_user_u32(val, addr)) {
> +            env->exception.vaddress = addr;
> +            goto segv;
> +        }
>          if (val == env->regs[0]) {
>              val = env->regs[1];
> -            /* FIXME: Check for segfaults.  */
> -            put_user_u32(val, addr);
> +            if (put_user_u32(val, addr)) {
> +                env->exception.vaddress = addr;
> +                goto segv;
> +            }
>              env->regs[0] = 0;
>              cpsr |= CPSR_C;
>          } else {
> @@ -551,6 +555,16 @@ do_kernel_trap(CPUARMState *env)
>      env->regs[15] = addr;
>
>      return 0;
> +
> +segv:
> +    end_exclusive();
> +    info.si_signo = TARGET_SIGSEGV;
> +    info.si_errno = 0;
> +    /* XXX: check env->error_code */
> +    info.si_code = TARGET_SEGV_MAPERR;
> +    info._sifields._sigfault._addr = env->exception.vaddress;
> +    queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> +    return 0;

If you compare what happens with this segv code with
what happens for the segvs detected inside
arm_kernel_cmpxchg64_helper(), there's a difference.
With this code we will queue the signal and then return,
skipping the code which updates env->regs[15] and env->thumb.
The existing codepath for cmpxchg64 doesn't skip that code.
The effect is that for cmpxchg64 the SEGV signal handler
will see a PC pointing at the call into the kernel commpage,
whereas for this code it will see the PC actually in the
kernel commpage.

I'm not sure which of these options is the best choice,
but I do think we should be consistent.

>  }
>
>  void cpu_loop(CPUARMState *env)
> --
> 2.10.2

thanks
-- PMM
