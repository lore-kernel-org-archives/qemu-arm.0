Received: by 10.25.159.19 with SMTP id i19csp631992lfe;
        Sat, 23 Jan 2016 20:28:32 -0800 (PST)
X-Received: by 10.140.23.81 with SMTP id 75mr13488213qgo.35.1453609712447;
        Sat, 23 Jan 2016 20:28:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g73si16768182qge.55.2016.01.23.20.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jan 2016 20:28:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59172 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aNCHv-0002od-U5
	for alex.bennee@linaro.org; Sat, 23 Jan 2016 23:28:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aNCHt-0002kR-AO
	for qemu-arm@nongnu.org; Sat, 23 Jan 2016 23:28:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aNCHs-0005LC-8R
	for qemu-arm@nongnu.org; Sat, 23 Jan 2016 23:28:29 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:38776)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aNCHo-0005Jn-F8; Sat, 23 Jan 2016 23:28:24 -0500
Received: by mail-wm0-x235.google.com with SMTP id b14so34365500wmb.1;
	Sat, 23 Jan 2016 20:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hg8SgZJlibTb+0cyA9GKloD2qjejS8tl+MGs+bIwOAs=;
	b=ldR0CO6rlob6MoBMzq3nx6GaMX5SOyBNOHstYkk9GSuhEk6hYNXG82m1NkHABs2sqm
	p5ImrgMqW19gyxpP730PAPNI3fs/umvKBx+1zyGK1Ii2+KkTUdXRHcrSakulY7x5SLHs
	qaGLQ7kfQGqGxQfpb4594U2GrJjReucRhN0a1tuM5Ak3I69JYTSZ22/BHrfW9u47L/3y
	DlsRr+sAvD+yA5TTA+dw/VhpY/zxBcArLjZRj58lvG1v8LkTCLZgGrC64Mq3FR4CwVMV
	8YjpDRQrLHkiEuoSyrTbWNlRpp5Jno+e04e+9O+UhLYH2gNlgLss+x22q1qFodWGDoCX
	wRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=hg8SgZJlibTb+0cyA9GKloD2qjejS8tl+MGs+bIwOAs=;
	b=DvxMTQ4M4kKU+03/0tdcYUGyJ+lCys7bQVslQWugb1xxdaR3/TRLh85HPxSMCPEUtm
	qaC8QiHnTSghaUSF3jXuFjoj382LagJquDlJOGFDlFTVErFS8WpdA50KVEppFx/WpRCk
	DJE73PdK+wEyOLUKvv2pFdOo4o5/SojjFtfMmCMNgJCzkqhKKIJ2T9G/I1+1UllMmFkT
	i/FZYor4oyd1B8Uh/xcB/W7o0r1/jbclDJTL5ujWxI82zMN6VIf3ng7UkcCeDbY5CQ5T
	kXqZDYmUtt4aanz7GfqdpEfyKvVyPtpfb0i+JKs1YessK2rrCz7yU8WFumF24iBZ5wiA
	GiDw==
X-Gm-Message-State: AG10YOQMMjlUOVhwBEQgZoRi4kIWfAm+Sv6rp7N5+l8kuwQNpHO8ZygcUxJdY+e13idP4kDQTVx+IuknoRbhXA==
MIME-Version: 1.0
X-Received: by 10.194.120.226 with SMTP id lf2mr10498779wjb.108.1453609703383; 
	Sat, 23 Jan 2016 20:28:23 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Sat, 23 Jan 2016 20:28:23 -0800 (PST)
In-Reply-To: <3ceca99fa19a5251a9ed121a4645c59fdad61150.1453402860.git.digetx@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
	<3ceca99fa19a5251a9ed121a4645c59fdad61150.1453402860.git.digetx@gmail.com>
Date: Sat, 23 Jan 2016 20:28:23 -0800
Message-ID: <CAPokK=pOV7_uaumcbbJ0OZoSrYPz=iggCAG91U7Pcad6tKTOCg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v11 6/7] hw/ptimer: Legalize running with
 delta = load = 0 and abort on period = 0
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
X-TUID: qMx7i2ZWWV2e

On Thu, Jan 21, 2016 at 11:03 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
> Currently ptimer would print error message and clear enable flag for an
> arming timer that has delta = load = 0. That actually could be a valid case
> for some hardware, like instant IRQ trigger for oneshot timer or continuous
> in periodic mode. Support those cases by removing the error message and
> stopping the timer when delta = 0. Abort execution when period = 0 instead
> of printing the error message, otherwise there is a chance to miss that error.
>
> In addition, don't re-load oneshot timer when delta = 0 and remove duplicated
> code from ptimer_tick(), since ptimer_reload would invoke trigger and stop
> the timer.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

> ---
>  hw/core/ptimer.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
>
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index 142cc64..cec59e1 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -39,11 +39,14 @@ static void ptimer_reload(ptimer_state *s)
>
>      if (s->delta == 0) {
>          ptimer_trigger(s);
> +    }
> +
> +    if (s->delta == 0 && s->enabled == 1) {
>          s->delta = s->limit;
>      }
> -    if (s->delta == 0 || s->period == 0) {
> -        fprintf(stderr, "Timer with period zero, disabling\n");
> -        s->enabled = 0;
> +
> +    if (s->delta == 0) {
> +        ptimer_stop(s);
>          return;
>      }
>
> @@ -72,27 +75,22 @@ static void ptimer_reload(ptimer_state *s)
>  static void ptimer_tick(void *opaque)
>  {
>      ptimer_state *s = (ptimer_state *)opaque;
> -    ptimer_trigger(s);
>      s->delta = 0;
> -    if (s->enabled == 2) {
> -        s->enabled = 0;
> -    } else {
> -        ptimer_reload(s);
> -    }
> +    ptimer_reload(s);
>  }
>
>  uint64_t ptimer_get_count(ptimer_state *s)
>  {
>      uint64_t counter;
>
> -    if (s->enabled) {
> +    if (s->enabled && s->delta != 0) {
>          int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>          int64_t next = s->next_event;
>          bool expired = (now - next >= 0);
>          bool oneshot = (s->enabled == 2);
>
>          /* Figure out the current counter value.  */
> -        if (s->period == 0 || (expired && (oneshot || use_icount))) {
> +        if (expired && (oneshot || use_icount)) {
>              /* Prevent timer underflowing if it should already have
>                 triggered.  */
>              counter = 0;
> @@ -164,10 +162,7 @@ void ptimer_run(ptimer_state *s, int oneshot)
>  {
>      bool was_disabled = !s->enabled;
>
> -    if (was_disabled && s->period == 0) {
> -        fprintf(stderr, "Timer with period zero, disabling\n");
> -        return;
> -    }
> +    g_assert(s->period != 0);
>      s->enabled = oneshot ? 2 : 1;
>      if (was_disabled) {
>          s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> @@ -190,6 +185,7 @@ void ptimer_stop(ptimer_state *s)
>  /* Set counter increment interval in nanoseconds.  */
>  void ptimer_set_period(ptimer_state *s, int64_t period)
>  {
> +    g_assert(period != 0);
>      s->delta = ptimer_get_count(s);
>      s->period = period;
>      s->period_frac = 0;
> @@ -202,6 +198,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
>  /* Set counter frequency in Hz.  */
>  void ptimer_set_freq(ptimer_state *s, uint32_t freq)
>  {
> +    g_assert(freq != 0);
>      s->delta = ptimer_get_count(s);
>      s->period = 1000000000ll / freq;
>      s->period_frac = (1000000000ll << 32) / freq;
> --
> 2.7.0
>
