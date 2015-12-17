Received: by 10.182.158.201 with SMTP id ww9csp425541obb;
        Thu, 17 Dec 2015 06:37:22 -0800 (PST)
X-Received: by 10.140.250.70 with SMTP id v67mr64867364qhc.43.1450363042281;
        Thu, 17 Dec 2015 06:37:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l76si11558345qgd.86.2015.12.17.06.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 06:37:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:54072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9ZgI-0005eP-12
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 09:37:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9ZgG-0005cC-He
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 09:37:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9ZgF-0006gk-HY
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 09:37:20 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9ZgF-0006gb-AM
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 09:37:19 -0500
Received: by mail-vk0-x236.google.com with SMTP id j66so47354663vkg.1
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 06:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=lJf0uI1U3PI4Qs5SpaUP6DmDT0gcYSoLGWru9riTXrs=;
	b=gh1Gzjrj9lI5l/FSxPlWCKZdkCHQUG/oXJTK84+n+weOwKQH5aeRu7khmAkpVPMul4
	QLfNnw40Tdw87OrhXjesCt9WtCxsJdOfFcsx9UfqluiTkJNKSES5YGBwsb9mcQJjas7X
	82YOBxJJBtM/NgmP7ODyrC+nw05XELmilmwxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lJf0uI1U3PI4Qs5SpaUP6DmDT0gcYSoLGWru9riTXrs=;
	b=GHzQOWSyEDsmUZg/N+Kgm9YUg4NM6sCiSvubw/xFSMmmTVYeuKpOiHTNJN5JATJSkb
	FBc7i/GERsGFjG6uYMI6nKr2GgVzx0qbhvWorL/Yp3ddv5KOB+gXKW1eVPBym7JuL89h
	7rbAEpMpS/Hwt6W6cNDazUbxixOjKJq2o6d3jNXu3a/BScUuM77egmDfV9G48/f34yEb
	zFKb2/PlBuAKcrRH7ztHL8RDcWaIfY+jNMhmzYnt5hrKAH+f4vgaRlZ6d/gfAKg1PeWg
	X5j1v0Mm9oCYj6/HHZOMMpqRO4KnVfNMgLKmmauozTgNc/5r6K+CPkmDSZBui/itVJXm
	yF/g==
X-Gm-Message-State: ALoCoQlHwwE/hyqyr+u44QBReglrrwOmJ+XL9ipsG91TXHUsM1clDCGf0qazScszzGBLBwzZIxZT2YnYK2rwroC1JhoMn+1D+9xUcKmC5XGRSfcFY0PoPZc=
X-Received: by 10.31.52.211 with SMTP id b202mr38812465vka.82.1450363038923;
	Thu, 17 Dec 2015 06:37:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 06:36:59 -0800 (PST)
In-Reply-To: <1449101933-24928-6-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-6-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 14:36:59 +0000
Message-ID: <CAFEAcA-0Z=rhtvO0o=WoAE4pBQ0Zqrj1n_OtcdW+2FAOd0FH9A@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 05/26] armv7m: add
	armv7m_excp_running_prio()
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
X-TUID: UxqNi7ozE0zI

On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> Implements v7m exception priority algorithm
> using FAULTMASK, PRIMASK, BASEPRI, and the highest
> priority active exception.
>
> The number returned is the current execution priority
> which may be in the range [-2,0x7f] when an exception is active
> or 0x100 when no exception is active.
> ---
>  hw/intc/armv7m_nvic.c | 25 +++++++++++++++++++++++++
>  target-arm/cpu.h      |  1 +
>  2 files changed, 26 insertions(+)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 6fc167e..0145ca7 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -18,6 +18,8 @@
>
>  typedef struct {
>      GICState gic;
> +    uint8_t prigroup;
> +
>      struct {
>          uint32_t control;
>          uint32_t reload;
> @@ -116,6 +118,29 @@ static void systick_reset(nvic_state *s)
>      timer_del(s->systick.timer);
>  }
>
> +/* @returns the active (running) exception priority.
> + *    only a higher (numerically lower) priority can preempt.
> + */
> +int armv7m_excp_running_prio(ARMCPU *cpu)
> +{
> +    CPUARMState *env = &cpu->env;
> +    nvic_state *s = env->nvic;
> +    int running;
> +
> +    if (env->daif & PSTATE_F) { /* FAULTMASK */
> +        running = -1;
> +    } else if (env->daif & PSTATE_I) { /* PRIMASK */
> +        running = 0;
> +    } else if (env->v7m.basepri > 0) {
> +        /* BASEPRI==1 -> masks [1,255] (not same as PRIMASK==1) */
> +        running = env->v7m.basepri >> (s->prigroup+1);

This isn't right -- the effect of PRIGROUP is that we mask
out the lower (subgroup) bits, but the upper group bits stay
where they are rather than shifting down.

So you want env->v7m.basepri & ~((1 << (s->prigroup + 1)) - 1);

(the same mask you need to get the group priority for
an interrupt).

> +    } else {
> +        running = 0x100; /* lower than any possible priority */
> +    }
> +    /* consider priority of active handler */
> +    return MIN(running, env->v7m.exception_prio);
> +}
> +

thanks
-- PMM
