Received: by 10.182.158.201 with SMTP id ww9csp11737051obb;
        Wed, 6 Jan 2016 04:15:58 -0800 (PST)
X-Received: by 10.55.197.195 with SMTP id k64mr132880063qkl.25.1452082558726;
        Wed, 06 Jan 2016 04:15:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g131si83137330qkb.102.2016.01.06.04.15.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 04:15:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53875 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGn0Q-00032g-Bx
	for alex.bennee@linaro.org; Wed, 06 Jan 2016 07:15:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGn0N-000303-Qh
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 07:15:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGn0M-0002pP-Hb
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 07:15:55 -0500
Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229]:33087)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aGn0F-0002f1-IA; Wed, 06 Jan 2016 07:15:47 -0500
Received: by mail-pa0-x229.google.com with SMTP id cy9so232908605pac.0;
	Wed, 06 Jan 2016 04:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BXHwzF+bIXgZkBsTS8kC/lRnLfcss59ra6f/nXamoZ0=;
	b=c0oyBzPTvOkB8mbjzhjZMrrk1SX2ufJtjCf7zCZHxSHnBqC6hEUQp+pqstrzRi7luq
	C6GKccjarYa/lcFqpDDr9W9fGXEfaxggwZloTlHkzb67p1hPnFG1s9mk6bF+61kZTAs9
	pkhkSBg8ozJQmFuUlAGSLSCeUAQ5sOtG6a+RGx9Aics+y7v/hNvIiZzd1h04pRnQk7DA
	+dgLqn5vcri5L9oivCsjaY7Ze9V0jKzs9Q7sOevzu665j8MjdHecM7OkPc6ZgIkw8Pnm
	AXciD0zUPTNpSXmOF6cGeg0xt834e5hIckMXK94wO2NwwmpZme6yHbcVO3znjQRlqM1o
	V8ww==
X-Received: by 10.66.55.72 with SMTP id q8mr141363320pap.136.1452082546782;
	Wed, 06 Jan 2016 04:15:46 -0800 (PST)
Received: from pcrost-box (pa49-197-174-152.pa.qld.optusnet.com.au.
	[49.197.174.152]) by smtp.gmail.com with ESMTPSA id
	sm8sm140462474pac.43.2016.01.06.04.15.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jan 2016 04:15:45 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 6 Jan 2016 04:15:35 -0800
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20160106121535.GB4227@pcrost-box>
References: <cover.1451960508.git.digetx@gmail.com>
	<32ced3aba243ebfac3f1db6e9f8bc820c2302cfa.1451960508.git.digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32ced3aba243ebfac3f1db6e9f8bc820c2302cfa.1451960508.git.digetx@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::229
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v8 1/4] hw/ptimer: Fix issues caused by the
 adjusted timer limit value
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
X-TUID: Vpa+uxpE6PMi

On Tue, Jan 05, 2016 at 05:33:26AM +0300, Dmitry Osipenko wrote:
> Multiple issues here related to the timer with a adjusted .limit value:
> 
> 1) ptimer_get_count() returns incorrect counter value for the disabled
> timer after loading the counter with a small value, because adjusted limit
> value is used instead of the original.
> 
> For instance:
>     1) ptimer_stop(t)
>     2) ptimer_set_period(t, 1)
>     3) ptimer_set_limit(t, 0, 1)
>     4) ptimer_get_count(t) <-- would return 10000 instead of 0
> 
> 2) ptimer_get_count() might return incorrect value for the timer running
> with a adjusted limit value.
> 
> For instance:
>     1) ptimer_stop(t)
>     2) ptimer_set_period(t, 1)
>     3) ptimer_set_limit(t, 10, 1)
>     4) ptimer_run(t)
>     5) ptimer_get_count(t) <-- might return value > 10
> 
> 3) Neither ptimer_set_period() nor ptimer_set_freq() are adjusting the
> limit value, so it is still possible to make timer timeout value
> arbitrary small.
> 
> For instance:
>     1) ptimer_set_period(t, 10000)
>     2) ptimer_set_limit(t, 1, 0)
>     3) ptimer_set_period(t, 1) <-- bypass limit correction
> 
> Fix all of the above issues by adjusting timer period instead of the limit.
> Do the adjust for periodic timer only.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  hw/core/ptimer.c | 59 ++++++++++++++++++++++++++++++++++----------------------
>  1 file changed, 36 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index edf077c..035af97 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -34,20 +34,39 @@ static void ptimer_trigger(ptimer_state *s)
>  
>  static void ptimer_reload(ptimer_state *s)
>  {
> -    if (s->delta == 0) {
> +    uint32_t period_frac = s->period_frac;
> +    uint64_t period = s->period;
> +    uint64_t delta = s->delta;
> +    uint64_t limit = s->limit;
> +

Localising these variables is out of scope of the change. I think you can
just use s->foo and if you want to cleanup, it should be a separate
patch.

> +    if (delta == 0) {
>          ptimer_trigger(s);
> -        s->delta = s->limit;
> +        delta = limit;
>      }
> -    if (s->delta == 0 || s->period == 0) {
> +    if (delta == 0 || period == 0) {
>          fprintf(stderr, "Timer with period zero, disabling\n");
>          s->enabled = 0;
>          return;
>      }
>  
> +    /*
> +     * Artificially limit timeout rate to something
> +     * achievable under QEMU.  Otherwise, QEMU spends all
> +     * its time generating timer interrupts, and there
> +     * is no forward progress.
> +     * About ten microseconds is the fastest that really works
> +     * on the current generation of host machines.
> +     */
> +
> +    if ((s->enabled == 1) && (limit * period < 10000)) {
> +        period = 10000 / limit;
> +        period_frac = 0;
> +    }
> +

I think it should be ok to just update s->period and s->period_frac ...

>      s->last_event = s->next_event;
> -    s->next_event = s->last_event + s->delta * s->period;
> -    if (s->period_frac) {
> -        s->next_event += ((int64_t)s->period_frac * s->delta) >> 32;
> +    s->next_event = s->last_event + delta * period;
> +    if (period_frac) {
> +        s->next_event += ((int64_t)period_frac * delta) >> 32;
>      }
>      timer_mod(s->timer, s->next_event);
>  }
> @@ -82,6 +101,8 @@ uint64_t ptimer_get_count(ptimer_state *s)
>              uint64_t div;
>              int clz1, clz2;
>              int shift;
> +            uint32_t period_frac = s->period_frac;
> +            uint64_t period = s->period;
>  
>              /* We need to divide time by period, where time is stored in
>                 rem (64-bit integer) and period is stored in period/period_frac
> @@ -93,8 +114,13 @@ uint64_t ptimer_get_count(ptimer_state *s)
>                 backwards.
>              */
>  
> +            if ((s->enabled == 1) && (s->limit * period < 10000)) {
> +                period = 10000 / s->limit;
> +                period_frac = 0;
> +            }
> +

... and then this (and the local variables) become obsolete. Can get_count()
blindly use the period and period_frac as used by ptimer_reload?

>              rem = s->next_event - now;
> -            div = s->period;
> +            div = period;
>  
>              clz1 = clz64(rem);
>              clz2 = clz64(div);
> @@ -103,13 +129,13 @@ uint64_t ptimer_get_count(ptimer_state *s)
>              rem <<= shift;
>              div <<= shift;
>              if (shift >= 32) {
> -                div |= ((uint64_t)s->period_frac << (shift - 32));
> +                div |= ((uint64_t)period_frac << (shift - 32));
>              } else {
>                  if (shift != 0)
> -                    div |= (s->period_frac >> (32 - shift));
> +                    div |= (period_frac >> (32 - shift));
>                  /* Look at remaining bits of period_frac and round div up if 
>                     necessary.  */
> -                if ((uint32_t)(s->period_frac << shift))
> +                if ((uint32_t)(period_frac << shift))
>                      div += 1;
>              }
>              counter = rem / div;
> @@ -181,19 +207,6 @@ void ptimer_set_freq(ptimer_state *s, uint32_t freq)
>     count = limit.  */
>  void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
>  {
> -    /*
> -     * Artificially limit timeout rate to something
> -     * achievable under QEMU.  Otherwise, QEMU spends all
> -     * its time generating timer interrupts, and there
> -     * is no forward progress.
> -     * About ten microseconds is the fastest that really works
> -     * on the current generation of host machines.
> -     */
> -
> -    if (!use_icount && limit * s->period < 10000 && s->period) {

This original rate limiting code is gated on icount, so I think then
new way should be the same.

Regards,
Peter

> -        limit = 10000 / s->period;
> -    }
> -
>      s->limit = limit;
>      if (reload)
>          s->delta = limit;
> -- 
> 2.6.4
> 
