Received: by 10.25.208.211 with SMTP id h202csp893940lfg;
        Fri, 11 Mar 2016 00:57:22 -0800 (PST)
X-Received: by 10.140.216.212 with SMTP id m203mr10656639qhb.37.1457686642185;
        Fri, 11 Mar 2016 00:57:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f132si7775610qkb.7.2016.03.11.00.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Mar 2016 00:57:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:53461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aeIsr-0005DN-Qz
	for alex.bennee@linaro.org; Fri, 11 Mar 2016 03:57:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aeIsM-0004ad-V0
	for qemu-devel@nongnu.org; Fri, 11 Mar 2016 03:56:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aeIsM-00069X-0j
	for qemu-devel@nongnu.org; Fri, 11 Mar 2016 03:56:50 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:34653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aeIsK-00069C-Pq
	for qemu-devel@nongnu.org; Fri, 11 Mar 2016 03:56:49 -0500
Received: by mail-vk0-x22f.google.com with SMTP id e185so126646816vkb.1
	for <qemu-devel@nongnu.org>; Fri, 11 Mar 2016 00:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x8p66QuSAuV3yLPUUX43bR5y9PVocRKK9sQAhRfNobQ=;
	b=YSirUWFQoB5evWI4PGXAwcBocj8EKhpUO+HRVgGWtzA3CLTpvQbUniKXrP+4t9kKXL
	wpobt3PG4fUluJc2CefZnpmxk7bmlK9kQkXjzSvf51aiAXa+PLSwBmsjI1dmazY6rhzN
	PZigGCQth7eFPiZhLjs9aTwQqC71F3cHL9fys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x8p66QuSAuV3yLPUUX43bR5y9PVocRKK9sQAhRfNobQ=;
	b=hTfIdnvTudGfgGa0qg7OsBCkdjsG69a/6+IDyFu07d8LfOKZlM655UvPdA7dlZ9E2f
	HSuhJhEuUc8zTJxeQRK5jQ4sI6v3aBqWKUDyROF8TpW3wfPuOQot29alJGjGrOfiX35g
	NONJP46oX6JbZ0sAmQ8B9eGufIj2NMegW+YAgvgk4ZafYp5GRCGHyrqadT7hOsHtSKKp
	GE1OreSZWHlzKc7dvQqAKYdChaSmRuh8h+VLMHpgPqbQ71q8Lg7xdfZqRVZ+8BQGfne7
	hubUvdnS7GIA1fK8E4zvl0BRk89r0ovZbVKpzQtnspqJe78w9JUT4Xbf+TVoNP5l5qSz
	trxg==
X-Gm-Message-State: AD7BkJKxmHJlKDX6YlY4bA5jmZD8l0lwAhELAqnMTRTF54C6mkbcmKEhqJPZiwb6Aq1mgymuf0Hsp4U1sCr0Ou6k
X-Received: by 10.31.52.147 with SMTP id b141mr8585495vka.82.1457686608079;
	Fri, 11 Mar 2016 00:56:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 11 Mar 2016 00:56:28 -0800 (PST)
In-Reply-To: <1457152177-19550-2-git-send-email-andrew@aj.id.au>
References: <1457152177-19550-1-git-send-email-andrew@aj.id.au>
	<1457152177-19550-2-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Mar 2016 15:56:28 +0700
Message-ID: <CAFEAcA9PWRYEfTD5TfHJ5aqPgw53Oe145P9B6yDGKGJuSrP_Cg@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v3 1/3] hw/timer: Add ASPEED timer device
	model
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NYz1BhJo54+j

On 5 March 2016 at 11:29, Andrew Jeffery <andrew@aj.id.au> wrote:
> Implement basic AST2400 timer functionality: Up to 8 timers can
> independently be configured, enabled, reset and disabled. A couple of
> hardware features are not implemented, namely clock value matching and
> pulse generation, but the implementation is enough to boot the Linux
> kernel configured with aspeed_defconfig.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> +/**
> + * Avoid mutual references between AspeedTimerCtrlState and AspeedTimer
> + * structs, as it's a waste of memory and it makes implementing
> + * VMStateDescription a little clunky.

Not sure what you have in mind with the reference to VMStateDescription
here. The vmstate struct only has to list the fields which contain
actual volatile state -- things like backreference pointers to other
structs aren't volatile state so don't appear.

> The ptimer BH callback needs to know
> + * whether a specific AspeedTimer is enabled, but this information is held in
> + * AspeedTimerCtrlState. So, provide a helper to hoist ourselves from an
> + * arbitrary AspeedTimer to AspeedTimerCtrlState.
> + */
> +static inline struct AspeedTimerCtrlState *timer_to_ctrl(AspeedTimer *t)
> +{
> +    AspeedTimer (*timers)[] = (void *)t - (t->id * sizeof(*t));
> +    return container_of(timers, AspeedTimerCtrlState, timers);
> +}

> +static void aspeed_timer_expire(void *opaque)
> +{
> +    AspeedTimer *t = opaque;
> +
> +    /* Only support interrupts on match values of zero for the moment - this is
> +     * sufficient to boot an aspeed_defconfig Linux kernel. Non-zero match
> +     * values need some further consideration given the current ptimer API.
> +     * Maybe run multiple ptimers?
> +     */

See hw/timer/a9gtimer.c for an example of a timer with a comparator
that can fire when the timer hits an arbitrary comparator value
(it doesn't use ptimers but the principle is the same -- you set
the timer to fire at the next interesting event, and then in the
timer-fired handler you reset the timer to fire whenever the next
event after that is, if any.) In any case this is probably ok for now.

> +    bool match = !(t->match[0] && t->match[1]);
> +    bool interrupt = timer_overflow_interrupt(t) || match;
> +    if (timer_enabled(t) && interrupt) {
> +        t->level = !t->level;
> +        qemu_set_irq(t->irq, t->level);
> +    }
> +}
> +

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
