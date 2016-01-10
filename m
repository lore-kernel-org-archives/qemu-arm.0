Received: by 10.25.134.130 with SMTP id i124csp1219545lfd;
        Sat, 9 Jan 2016 16:28:35 -0800 (PST)
X-Received: by 10.55.82.193 with SMTP id g184mr156359772qkb.65.1452385715764;
        Sat, 09 Jan 2016 16:28:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u132si21394361qhu.117.2016.01.09.16.28.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Jan 2016 16:28:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aI3s3-0001cZ-8E
	for alex.bennee@linaro.org; Sat, 09 Jan 2016 19:28:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aI3s1-0001b2-OC
	for qemu-arm@nongnu.org; Sat, 09 Jan 2016 19:28:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aI3s0-0000mu-K2
	for qemu-arm@nongnu.org; Sat, 09 Jan 2016 19:28:33 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:33774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aI3rx-0000mN-TC; Sat, 09 Jan 2016 19:28:30 -0500
Received: by mail-wm0-x241.google.com with SMTP id u188so21062933wmu.0;
	Sat, 09 Jan 2016 16:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yaRZlhaOGbIDCGhiiSCtjkK5+O/P3nTKCmCX7two78M=;
	b=EmRd6ckixevSlsUkcUa8X+aDLzDEEpHYh7a8bFeQqKMm/FBRRAX/wKVN3/hp8Irx1p
	nw9OdUvsnG97Sx3eTII9cSzYcXdo5r/tylZBn12TL6gmSOuOgxsw+uS300s2OxJlyu+9
	T3pj5X/mloneo46zzit6ESggASoH2GxovHIdg627YXRvvTzaU94anLMJ0Sbu89ITCfkA
	xNrG0DyxfORksi7D4rr5qdyQIDyxAABxVvHMzZj7KlSqJLS23t7Mi23mH/3lYa4YFfeN
	Ovd8dxf0doLk8CUtzgmFFGUCdSQq8bt0XpBYeMsLzh8TgBnk36JdLMlkye8z78tFXtNu
	qnmw==
MIME-Version: 1.0
X-Received: by 10.28.64.137 with SMTP id n131mr5661106wma.96.1452385708968;
	Sat, 09 Jan 2016 16:28:28 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Sat, 9 Jan 2016 16:28:28 -0800 (PST)
In-Reply-To: <ce1e75505277dc9c11b2e417aea3aac099c428ad.1452359845.git.digetx@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
	<ce1e75505277dc9c11b2e417aea3aac099c428ad.1452359845.git.digetx@gmail.com>
Date: Sat, 9 Jan 2016 16:28:28 -0800
Message-ID: <CAPokK=qjYqNBg9aUMkUp3NZNt_TwJnJJy7z77iZx26kXbuustw@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v10 1/7] hw/ptimer: Fix issues caused by the
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
X-TUID: TQ3EUT6uNrI/

On Sat, Jan 9, 2016 at 9:39 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
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
> Perform the adjustment for periodic timer only. Use the delta value instead
> of the limit to make decision whether adjustment is required, as limit could
> be altered while timer is running, resulting in incorrect value returned by
> ptimer_get_count.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

> ---
>  hw/core/ptimer.c | 51 +++++++++++++++++++++++++++++++--------------------
>  1 file changed, 31 insertions(+), 20 deletions(-)
>
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index edf077c..c3d31cb 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -34,6 +34,9 @@ static void ptimer_trigger(ptimer_state *s)
>
>  static void ptimer_reload(ptimer_state *s)
>  {
> +    uint32_t period_frac = s->period_frac;
> +    uint64_t period = s->period;
> +
>      if (s->delta == 0) {
>          ptimer_trigger(s);
>          s->delta = s->limit;
> @@ -44,10 +47,24 @@ static void ptimer_reload(ptimer_state *s)
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
> +    if ((s->enabled == 1) && !use_icount && (s->delta * period < 10000)) {
> +        period = 10000 / s->delta;
> +        period_frac = 0;
> +    }
> +
>      s->last_event = s->next_event;
> -    s->next_event = s->last_event + s->delta * s->period;
> -    if (s->period_frac) {
> -        s->next_event += ((int64_t)s->period_frac * s->delta) >> 32;
> +    s->next_event = s->last_event + s->delta * period;
> +    if (period_frac) {
> +        s->next_event += ((int64_t)period_frac * s->delta) >> 32;
>      }
>      timer_mod(s->timer, s->next_event);
>  }
> @@ -82,6 +99,13 @@ uint64_t ptimer_get_count(ptimer_state *s)
>              uint64_t div;
>              int clz1, clz2;
>              int shift;
> +            uint32_t period_frac = s->period_frac;
> +            uint64_t period = s->period;
> +
> +            if ((s->enabled == 1) && !use_icount && (s->delta * period < 10000)) {
> +                period = 10000 / s->delta;
> +                period_frac = 0;
> +            }
>
>              /* We need to divide time by period, where time is stored in
>                 rem (64-bit integer) and period is stored in period/period_frac
> @@ -94,7 +118,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
>              */
>
>              rem = s->next_event - now;
> -            div = s->period;
> +            div = period;
>
>              clz1 = clz64(rem);
>              clz2 = clz64(div);
> @@ -103,13 +127,13 @@ uint64_t ptimer_get_count(ptimer_state *s)
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
> @@ -181,19 +205,6 @@ void ptimer_set_freq(ptimer_state *s, uint32_t freq)
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
> -        limit = 10000 / s->period;
> -    }
> -
>      s->limit = limit;
>      if (reload)
>          s->delta = limit;
> --
> 2.6.4
>
