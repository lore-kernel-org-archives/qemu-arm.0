Received: by 10.25.159.19 with SMTP id i19csp2624681lfe;
        Tue, 19 Jan 2016 09:27:18 -0800 (PST)
X-Received: by 10.140.180.80 with SMTP id b77mr21234350qha.67.1453224438233;
        Tue, 19 Jan 2016 09:27:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a80si38461714qge.39.2016.01.19.09.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jan 2016 09:27:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLa3p-000629-M6
	for alex.bennee@linaro.org; Tue, 19 Jan 2016 12:27:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLa3k-0005sr-GT
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:27:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLa3j-0006S8-I4
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:27:12 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:35763)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aLa3j-0006Rr-C9
	for qemu-arm@nongnu.org; Tue, 19 Jan 2016 12:27:11 -0500
Received: by mail-vk0-x22d.google.com with SMTP id k1so352215863vkb.2
	for <qemu-arm@nongnu.org>; Tue, 19 Jan 2016 09:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=caDGsM7z1hkctd7DCHN1xqD8LwUeTo/pqqaDP+UoDXs=;
	b=aan1t/AtAHw2X1KUzNroJvZkbViBuay+YMous9IPw9zZaK3ZxbjY+FG42mNZPGqnff
	kpOqbcCRIhDRVK9MCszHqHZdvHILk3XnQZ5ZYVMjQEWLd+hYlSBF0hwlsprcEZXqm6dp
	rnoX3DGZc+OsgDFVqYzbGQaNjr1HyQWaPmToc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=caDGsM7z1hkctd7DCHN1xqD8LwUeTo/pqqaDP+UoDXs=;
	b=A3UDLJBzA1lUG+mipDmEnPkGgRznX23KJ5RTq+TMtHcZtRrGCaVtcBKRyBszXj/glI
	Pf1YRroKP5vUbuv+eDczG8WAqwgWy0hKim6WVHeTRbNVvtllUH89ndVpFjXNbLhPAE6v
	4uEjZGOX9fY0fJUKSqG6XFDHsUlTHVUgH3mGSCpkeIKebMIPoPeRb7bBVzH23EjRMc7W
	bgs5Qfr7Btskfehf7zkb4VlV2EKGDDbF8SfrxBOrqAYr1mpcCJKYS4zgdQYVbOA+QWKX
	Yjf4lJTabuvRYzyCa/Fy6iyLyFqDLi/WlhHLk7IfuMCoJzP6invAdQuCe9MuTHOS3sF1
	Xg1Q==
X-Gm-Message-State: AG10YOQx32EEIPJGQHRiUc89h17dNuAcXW3oGB7B8Tq+uw89fCoVgnCEOrHvxayN+h27EkI+bZlcXSwcaUcW2YqZ
X-Received: by 10.31.2.200 with SMTP id 191mr6148830vkc.6.1453224430963; Tue,
	19 Jan 2016 09:27:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 19 Jan 2016 09:26:51 -0800 (PST)
In-Reply-To: <cc12cc9e952dc74183cf875c1ae44446067f3236.1453100525.git.crosthwaite.peter@gmail.com>
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
	<cc12cc9e952dc74183cf875c1ae44446067f3236.1453100525.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2016 17:26:51 +0000
Message-ID: <CAFEAcA9QCbp7WQUqpn+OQAeD+TYe5mLv9FZq02b2oov9hLG1bw@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v1 13/17] arm: linux-user: don't set CPSR.E
	in BE32 mode
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ib+tVgzerkwu

On 18 January 2016 at 07:12, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> Don't set CPSR.E for BE32 linux-user mode. As linux-user mode models
> BE32, using normal BE (and system mode will not), a special case is
> needed for user-mode where if sctlr.b is set, the CPU identifies as BE.
>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
>
>  linux-user/main.c |  2 --
>  target-arm/cpu.h  | 12 +++++++++++-
>  2 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/linux-user/main.c b/linux-user/main.c
> index d481458..60375fb 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -4496,8 +4496,6 @@ int main(int argc, char **argv, char **envp)
>              env->uncached_cpsr |= CPSR_E;
>          } else {
>              env->cp15.sctlr_el[1] |= SCTLR_B;
> -            /* We model BE32 as regular BE, so set CPSR_E */
> -            env->uncached_cpsr |= CPSR_E;

...this is undoing what we just did in the previous patch and
which I reviewed as being the wrong thing there...

>          }
>  #endif
>      }
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 3edd56b..96b1e99 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1812,7 +1812,17 @@ static bool arm_cpu_is_big_endian(CPUARMState *env)
>
>      /* In 32bit endianness is determined by looking at CPSR's E bit */
>      if (!is_a64(env)) {
> -        return (env->uncached_cpsr & CPSR_E) ? 1 : 0;
> +        return
> +#ifdef CONFIG_USER_ONLY
> +            /* In user mode, BE32 data accesses are just modelled as
> +             * regular BE access. In system mode, BE32 is modelled as
> +             * little endian, with the appropriate address translations on
> +             * non-word accesses. So sctlr.b only affects overall
> +             * endianness in user mode
> +             */
> +            arm_sctlr_b(env) ||
> +#endif
> +                ((env->uncached_cpsr & CPSR_E) ? 1 : 0);
>      }

This doesn't seem quite right -- for system emulation we currently
pick MO_BE or MO_LE based on the TB flag which is set according
to (arm_cpu_is_big_endian(env). So if we ignore SCTLR.B in
system mode then we'll still try to do LE accesses.

>      cur_el = arm_current_el(env);

thanks
-- PMM
