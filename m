Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7316498wrx;
        Thu, 7 Mar 2019 08:11:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqyWRe6sg34l4pErQMcVu5Wo6ol5TYGeYwr1LP2NaIaG+dyQew/nLmnUeYScCP3/9Zg+OX/y
X-Received: by 2002:a0d:eb42:: with SMTP id u63mr10627521ywe.162.1551975071729;
        Thu, 07 Mar 2019 08:11:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551975071; cv=none;
        d=google.com; s=arc-20160816;
        b=Bghqkn2LVibT5yxdqNZiMsWOu1aLg6eJEYrCltQuvhTLzsiO0MYbURx7CGDu0rzq5A
         c4ZnVFnvik5lpOoBZZ2WsS6BGcB16AR+zfxtqB/vDghKDDtPtHCK+tu1t5kgDl/5SVL/
         XROvLtBcSf/RxrFBaEpfndwLIidoPo/Oct/os3NcAs5mo6xKHiAw0Dd8tYFDQidAVD/Z
         gWTNZZoFNjqJBrtL0YXvEmKz9FU4W+vFoM7+D2TKA+ihwt6SEI1G/5xSz4hRUYhUAkzI
         B3znqrPozCOFGunkllwl8c6EgTNVflgqZW71AO0VaWp+BMBd4VB3yjskM18CMM79rptF
         lYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z5doX+fi+4wfzdPqQX0RJ7hSMkj/WjtGzp/D7ne9GEw=;
        b=t0A3eTiLDR1sXAn1qBiVs+sw3dNpFnGD31rPc9FXPBQVCNrIo3dH/I0oT8elPrUnm6
         IxLRw6iw7sgoz1hhOfn3I2GEvSi21hP+D8dec1jo0BnKUMKKgJrDMCA4tOLzLSUTCXFY
         Eo0V3beMsu1YsgF8qBY7rbq5vzAGv9O8OyetHV6OskrJGyVSUy7V2p+KAu0h0HHEvhJ4
         rwZtGU44hIDVui/FzJHUKXEKLC6kdBBQgoAdmu0QHYMVmggZYKwJS+rMaucThXIewha+
         EEMHWcWBLiULqyh7lkhC3LOJn5M0LPfoopeHTka3X8tGQpaKHTnfJqNtOBPyN3d+I1qw
         XnLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NLRuMg5U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s31si2974197ybe.106.2019.03.07.08.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 08:11:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NLRuMg5U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54607 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1vbw-0007MC-8k
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 11:11:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h1vZH-0005Ue-4J
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 11:08:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h1vZG-00080V-BS
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 11:08:23 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:32912)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h1vZG-0007zb-3W
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 11:08:22 -0500
Received: by mail-ot1-x342.google.com with SMTP id q24so14607501otk.0
	for <qemu-devel@nongnu.org>; Thu, 07 Mar 2019 08:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z5doX+fi+4wfzdPqQX0RJ7hSMkj/WjtGzp/D7ne9GEw=;
	b=NLRuMg5UxHq6kyNwCwEjMPnvXrxG61vxnnUgrBYOeEdQfD6v7mrzmy7K1xdbGE/kH6
	sLPf3t8Pqgb2K/IBHPx+5Jmrl0D3WXihhGb0lyFeVExTJnjHEwc9DfP4f7M4U5J2GgcK
	H0eeHBQsieJmHCyx+ISf3iooXwL39v59pM5Kw2oUtIE6lH1rPrqjI81T6iQxinJOoCe0
	AzPjxZzUuxLJVbehFdbjWOtTSwpE57495FYL3+xFxWbREZlbkFz3V4d2HlB8/aUlxDCH
	qmOvaYECTji5bxzUNiSjbIYzmsyEXAsk3itwz5vh49+g5qvgBoEKJaHVdDbxHYPn45a/
	XxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z5doX+fi+4wfzdPqQX0RJ7hSMkj/WjtGzp/D7ne9GEw=;
	b=rG2cez7miCdAiqMqwNq0IUm2t9ySfmviPa3089729NYnOQvmBhmHACBveFpSlifSB8
	hw7msXKG+LMtVYidORwGLZLCoYhIvyLGvt+93vLr7Xvb03XW/j4t0GV7gVUi5Fjj3c2N
	IjZtdty3NO4cV0NBnP3m56NmfqGKF++Y4a8jgJJVR/ggXFttH2+VJUM/ekvzd5cOKPLi
	O1crrnEx/MCxFPMLvKsOYuSMx6Q971Ri0Fg1q84Xm2DPv5/lHaeZzIH1NhC10+LbkQNO
	0SABdMRFYrJplg05HFJFziDLofO1rVPyRJWXyvWJmw/Lt1LTBBwLAcRuP5ZhwWyyUKB5
	qwvw==
X-Gm-Message-State: APjAAAXjrdLJ2AJAPE2oFhnM7c6ElbnhqAe4EF16RqSW2r5YuicyRAfS
	Cf1CdiFVbSO4qoSakY8ZV+OoCi0JVcBioPRZfOwePw==
X-Received: by 2002:a9d:61c7:: with SMTP id h7mr7871917otk.363.1551974900850; 
	Thu, 07 Mar 2019 08:08:20 -0800 (PST)
MIME-Version: 1.0
References: <CADYoBw1HTzqTjfyDgDbP042AH1EkS1DD7Sf4um8eO7d22t4CDA@mail.gmail.com>
	<CAFEAcA9UzFdyAFkAuWzcV5x1JDBCTVr=okdLN-MpiduvACt4tw@mail.gmail.com>
	<CADYoBw3yj9yuxUSFuwCqKbTZNFFDF7Je4Kgxt-Rvd71x3JusQA@mail.gmail.com>
	<CAFEAcA_N83yo8xV3hCpVPFOhQj+R95+8fVePjEXgxKZtQPUP3w@mail.gmail.com>
	<CADYoBw00Li2G4srfLvtG4pvBMfyEuDh0AU47wj5BcKOUkfWhKw@mail.gmail.com>
	<CAFEAcA9Ycm43h8ekoc1uP_K7eLT98Qg+EFqE3Lvu66cjU5c5_A@mail.gmail.com>
	<CADYoBw1QFQxicJJ9tQa2Ok7PAdWvgtD4MQncdJ0zi4E2vktVhQ@mail.gmail.com>
In-Reply-To: <CADYoBw1QFQxicJJ9tQa2Ok7PAdWvgtD4MQncdJ0zi4E2vktVhQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Mar 2019 16:08:09 +0000
Message-ID: <CAFEAcA-+U75+EQzcpV4kZHw+4xMSbMv3UJ0CV_Q3DVbNx5RbNg@mail.gmail.com>
To: bzt <bztemail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH] Added periodic IRQ support for
 bcm2836_control local timer
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N/1dlDNddXD6

On Thu, 7 Mar 2019 at 15:57, bzt <bztemail@gmail.com> wrote:
>
> Nope. I meant the second patch, sent on 4th Mar, which had all the
> things fixed you listed in your review.
>
> But here's the modification for your latest query. This one controls
> the timer depending on ENABLE bit. It sets the INTFLAG even if
> INTENABLE is not set, and only raises the IRQ if both are set.

Thanks. I've listed a couple of minor things below
which I think are not quite handling the flags right,
but the rest looks good.

> @@ -78,6 +94,17 @@ static void bcm2836_control_update(BCM2836ControlState *s)
>          s->fiqsrc[s->route_gpu_fiq] |= (uint32_t)1 << IRQ_GPU;
>      }
>
> +    /* handle THE local timer interrupt for one of the cores' IRQ/FIQ */
> +    if ((s->local_timer_control & LOCALTIMER_INTENABLE) &&
> +        (s->local_timer_control & LOCALTIMER_INTFLAG)) {
> +        if (s->route_localtimer & 4) {
> +            s->fiqsrc[(s->route_localtimer & 3)] |= (uint32_t)1 << IRQ_TIMER;
> +        } else {
> +            s->irqsrc[(s->route_localtimer & 3)] |= (uint32_t)1 << IRQ_TIMER;
> +        }
> +        s->local_timer_control &= ~LOCALTIMER_INTENABLE;

This shouldn't clear the INTENABLE flag.

> +    }
> +
>      for (i = 0; i < BCM2836_NCORES; i++) {
>          /* handle local timer interrupts for this core */
>          if (s->timerirqs[i]) {
> @@ -162,6 +189,55 @@ static void bcm2836_control_set_gpu_fiq(void
> *opaque, int irq, int level)
>      bcm2836_control_update(s);
>  }

> +static void bcm2836_control_local_timer_control(void *opaque, uint32_t val)
> +{
> +    BCM2836ControlState *s = opaque;
> +
> +    s->local_timer_control = val & ~LOCALTIMER_INTFLAG;

This will clear the LOCALTIMER_INTFLAG if it was already
set -- you want to preserve it, something like
   s->local_timer_control = (s->local_timer_control & LOCALTIMER_INTFLAG) |
     (val & ~LOCALTIMER_INTFLAG);

> +    if (val & LOCALTIMER_ENABLE) {
> +        bcm2836_control_local_timer_set_next(s);
> +    } else {
> +        timer_del(&s->timer);
> +    }
> +}
> +
> +static void bcm2836_control_local_timer_ack(void *opaque, uint32_t val)
> +{
> +    BCM2836ControlState *s = opaque;
> +
> +    if (val & LOCALTIMER_INTFLAG) {
> +        s->local_timer_control |= LOCALTIMER_INTENABLE;
> +        s->local_timer_control &= ~LOCALTIMER_INTFLAG;

This should just clear the INTFLAG, it doesn't affect INTENABLE.

> +    }
> +    if ((val & LOCALTIMER_RELOAD) &&
> +        (s->local_timer_control & LOCALTIMER_ENABLE)) {
> +            bcm2836_control_local_timer_set_next(s);
> +    }
> +}

thanks
-- PMM
