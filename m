Received: by 10.25.208.211 with SMTP id h202csp2157044lfg;
        Tue, 8 Mar 2016 13:08:54 -0800 (PST)
X-Received: by 10.55.75.203 with SMTP id y194mr39373285qka.2.1457471334739;
        Tue, 08 Mar 2016 13:08:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org ([2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o10si4830068qhb.108.2016.03.08.13.08.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 13:08:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adOsA-0004bl-2y
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 16:08:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1adOs7-0004bf-U7
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 16:08:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1adOs6-00028G-RP
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 16:08:51 -0500
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:36595)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1adOs6-00025n-Kn; Tue, 08 Mar 2016 16:08:50 -0500
Received: by mail-wm0-x229.google.com with SMTP id n186so150482961wmn.1;
	Tue, 08 Mar 2016 13:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=Xav485N0d5y36UjzmMZFbRf2fn3b7QQK8KaelPllU6U=;
	b=Cn2B3wrApUPWLl+XdHbrYfqwJWDS5ZuCkzTHo5/0FLg2OJIUHaP8CqGIyMYhEmrgQ7
	CQD4BWNg0MJbDDq5g0DKxEqWqq3en7JfIp3dhb4A/ehxd8lteQHsrxHga7pIwhIDwBoh
	IW7vavSo7nRWkaAxtq0jzSn54Pchhi2UOAx2cGnNpIKnLQvzEAMagmwMX0DzSTBrWX5T
	zlYo8f243co5pa5QmO8CtkZu/hpd6fy8wlq3o4YeOC7kochc9bSHCTPcfBjBU5KH+zBn
	ahwujM0lw3LNE7WnDF+pmhn/I37mx5Kd6t444QcRNodV3SxeYhVXmkOpG3hWtv1Q9jP+
	Nivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=Xav485N0d5y36UjzmMZFbRf2fn3b7QQK8KaelPllU6U=;
	b=HCAit4aHC9Tjk9jkgqQzrqm1m0GNTS5AY7UUMIGZD6OjsURYtpPY/9WxUFEdM0UvI4
	GTmXUzGE8X8uvqZf02Zg0mYITG8A209c2n9vAXxgkhifXjNzC3UrQVVM0f+PF/d3PYci
	GfnuRcTNJPSVhz/QtWugchHM7NzYcyh6kUVf/0noDBvTo+mEGfP6A2NfiZs/YuoRPqVg
	E3mnNQPoiFsKyc1lqHVOs5kfdBHHEJ2/H55mGCnncR9QqZy6iP8tBsoaBoIrW4nt5TsV
	M6KJMkaKybfF2+3OKAW6PFzM+JGjP93GMSQhvhWjrnlMp/9UDevQxrisUKkQVtFD5DwV
	GiFQ==
X-Gm-Message-State: AD7BkJL2fLlZL/db+Osd/vXC22SVPYNcA3qiHWx/Dr7UvekHblD0MJYLe/Mqkim+eYcKCmMQh30mz42g045b3w==
MIME-Version: 1.0
X-Received: by 10.28.146.209 with SMTP id u200mr20455637wmd.59.1457471329442; 
	Tue, 08 Mar 2016 13:08:49 -0800 (PST)
Received: by 10.28.157.21 with HTTP; Tue, 8 Mar 2016 13:08:49 -0800 (PST)
In-Reply-To: <0eb543c0917bac416a18fc9daf97f5ba4e61ce1f.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
	<0eb543c0917bac416a18fc9daf97f5ba4e61ce1f.1454169735.git.digetx@gmail.com>
Date: Tue, 8 Mar 2016 13:08:49 -0800
Message-ID: <CAPokK=reD-sN1525osBbcxjFDzyJKvaoEf69C7wb6oHco4N=Lw@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::229
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v12 8/9] hw/ptimer: Perform delayed tick
 instead of immediate if delta = 0
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
X-TUID: N1kyWp12E0Ug

On Sat, Jan 30, 2016 at 8:43 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
> It might be necessary by some emulated HW to perform the tick after one
> period if delta = 0. Given that it is much less churny to implement immediate
> tick by the ptimer user itself, let's make ptimer do the delayed tick.
>

Isn't this related to previous patch? It is kind of a rounding problem
that will vary from timer to timer. Some timers may interpret the
"tick" as the wrap-around back to the load value (even if that is 0)
while others interpret the tick as the transition to zero (makes more
sense for a one-shot). It's hard to set a universal policy here.

But is this a non-issue when we consider that event latency (usually
interrupt latency) is undefined anyway?

Regards,
Peter

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  hw/core/ptimer.c | 34 +++++++++++++++-------------------
>  1 file changed, 15 insertions(+), 19 deletions(-)
>
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index b2044fb..bcd090c 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -36,19 +36,7 @@ static void ptimer_reload(ptimer_state *s)
>  {
>      uint32_t period_frac = s->period_frac;
>      uint64_t period = s->period;
> -
> -    if (s->delta == 0) {
> -        ptimer_trigger(s);
> -    }
> -
> -    if (s->delta == 0 && s->enabled == 1) {
> -        s->delta = s->limit;
> -    }
> -
> -    if (s->delta == 0) {
> -        ptimer_stop(s);
> -        return;
> -    }
> +    uint64_t delta = MAX(1, s->delta);
>
>      /*
>       * Artificially limit timeout rate to something
> @@ -59,15 +47,15 @@ static void ptimer_reload(ptimer_state *s)
>       * on the current generation of host machines.
>       */
>
> -    if (s->enabled == 1 && (s->delta * period < 10000) && !use_icount) {
> -        period = 10000 / s->delta;
> +    if (s->enabled == 1 && (delta * period < 10000) && !use_icount) {
> +        period = 10000 / delta;
>          period_frac = 0;
>      }
>
>      s->last_event = s->next_event;
> -    s->next_event = s->last_event + s->delta * period;
> +    s->next_event = s->last_event + delta * period;
>      if (period_frac) {
> -        s->next_event += ((int64_t)period_frac * s->delta) >> 32;
> +        s->next_event += ((int64_t)period_frac * delta) >> 32;
>      }
>      timer_mod(s->timer, s->next_event);
>  }
> @@ -75,8 +63,16 @@ static void ptimer_reload(ptimer_state *s)
>  static void ptimer_tick(void *opaque)
>  {
>      ptimer_state *s = (ptimer_state *)opaque;
> -    s->delta = 0;
> -    ptimer_reload(s);
> +
> +    s->delta = (s->enabled == 1) ? s->limit : 0;
> +
> +    if (s->delta == 0) {
> +        s->enabled = 0;
> +    } else {
> +        ptimer_reload(s);
> +    }
> +
> +    ptimer_trigger(s);
>  }
>
>  uint64_t ptimer_get_count(ptimer_state *s)
> --
> 2.7.0
>
