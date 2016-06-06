Received: by 10.25.27.66 with SMTP id b63csp1404722lfb;
        Mon, 6 Jun 2016 03:10:19 -0700 (PDT)
X-Received: by 10.55.195.193 with SMTP id r62mr14525627qkl.23.1465207819610;
        Mon, 06 Jun 2016 03:10:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s18si11608555qts.66.2016.06.06.03.10.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 03:10:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9rUB-0000bd-20
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 06:10:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9rU7-0000bT-VK
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 06:10:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9rU5-0004ZT-6V
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 06:10:14 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:34954)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9rU3-0004ZD-TX
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 06:10:13 -0400
Received: by mail-vk0-x22b.google.com with SMTP id d127so192677897vkh.2
	for <qemu-arm@nongnu.org>; Mon, 06 Jun 2016 03:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QZVs0DT2C6US6PP0zzN4PrRS2w+2yscuhfhvvqUWc78=;
	b=Dcr4N0ogtR16VQmaeu1ATn8K/sgpz8RDLoniPb5Xytm9S8WfYCIiYP6+ynA1WOq6DM
	XDXkR9OMSDKJWDy0WFluCfT6VcBDPtBTMh1+48Ek8ProtLyN6RAaGkKR6W/wEQOL5r57
	tRmRNQUw9YRmEkbQZ4ij8mNeBSoO3t/N2sHMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QZVs0DT2C6US6PP0zzN4PrRS2w+2yscuhfhvvqUWc78=;
	b=KI5TacG/945XfTBZCZHmcwCKmZaDK3KgitVea/Tdsds2vw+2MOCINDUFQXcZyyJk3Q
	d7T56GNdou/9UGQcN8eB7Ou1Lu4mE7foJ5sw7o2h2tmUrO5gTi25fbmi2uW1QicrTfzg
	BKmFwVGu+8G0rp8OwyDWzQgA17PsWUKg6+ZDuXXegpnpIcN2s9GppZ5Ao6v6BTy6fH9n
	9HXWBez1Rh9wAqFeED94B5ISYLzhR4weukrMAshSaxlFgwaMFBjxvMWOrDGy9udilLEk
	ml4Uq1DKHDTh+I7bF53e9NuNEQJBzghRMgS2rsdpz6DZysEt+QXTrG5WFUyjbtpftVS7
	oLzA==
X-Gm-Message-State: ALyK8tLruMnvVtjw3HLrp/5uUkjZ1jIlzOcVunPZAJDedIdiVWWWR8KwEo5wyFlVYbrO8qd4VpXyxWrGomB3azwD
X-Received: by 10.31.89.196 with SMTP id n187mr6214149vkb.83.1465207811372;
	Mon, 06 Jun 2016 03:10:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.67.65 with HTTP; Mon, 6 Jun 2016 03:09:51 -0700 (PDT)
In-Reply-To: <97318fe5bbe95202ca2d96e72a31c597a148ea77.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
	<97318fe5bbe95202ca2d96e72a31c597a148ea77.1464367869.git.digetx@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2016 11:09:51 +0100
Message-ID: <CAFEAcA_Y29-mxShvHqZrQC-g4Ve5X+yE18SWaCKumb40FaSmeQ@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [PATCH v13 6/8] hw/ptimer: Support running with
 counter = 0 by introducing new policy feature
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VncYfnWxC6FM

On 27 May 2016 at 18:03, Dmitry Osipenko <digetx@gmail.com> wrote:
> Currently ptimer prints error message and clears enable flag for an arming
> timer that has delta = load = 0. That actually is a valid case for most
> of the timers, like instant IRQ trigger for oneshot timer or continuous in
> periodic mode. There are different possible policies of how particular timer
> could interpret setting counter to 0, like:
>
> 1) Immediate stop with triggering the interrupt in oneshot mode. Immediate
>    wraparound with triggering the interrupt in continuous mode.
>
> 2) Immediate stop without triggering the interrupt in oneshot mode. Immediate
>    wraparound without triggering the interrupt in continuous mode.
>
> 3) Stopping with triggering the interrupt after one period in oneshot mode.
>    Wraparound with triggering the interrupt in continuous mode after one
>    period.
>
> 4) Stopping without triggering the interrupt after one period in oneshot mode.
>    Wraparound without triggering the interrupt in continuous mode after one
>    period.
>
> As well as handling oneshot/continuous modes differently.
>
> Given that, currently, running the timer with counter/period equal to 0 is
> treated as a error case, it's not obvious what policies should be supported
> by ptimer. Let's implement the third policy for now, as it is known to be
> used by the ARM MPTimer.
>
> Explicitly forbid running with counter/period == 0 in all cases by aborting
> QEMU execution instead of printing the error message.
>
> Bump VMSD version since a new VMState member is added.

I'm afraid you can't do that -- the ptimer code is used by a lot of
platforms including some which do not permit migration compatibility
breaks (at least sparc, for instance).

If you want to add this feature you need to at least make it seamlessly
support migration from the old version using a vmstate subsection.

Better would be to make the policy a QOM property -- then it is
constant for the lifetime of the timer and doesn't need to be migrated
at all. (There's no reason to support timers which change policy at
runtime, I hope). The default property value should be "same behaviour
as previously".

This whole change would be more solidly supported if it came with
a clear description of the bug being fixed (ie what device is currently
using the default-but-wrong behaviour and is going to be fixed by
setting a different policy).

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  hw/core/ptimer.c    | 53 +++++++++++++++++++++++++++++++----------------------
>  include/hw/ptimer.h |  6 ++++++
>  2 files changed, 37 insertions(+), 22 deletions(-)
>
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index 05b0c27..9bc70f5 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -21,6 +21,7 @@ struct ptimer_state
>      int64_t period;
>      int64_t last_event;
>      int64_t next_event;
> +    uint8_t policy;
>      QEMUBH *bh;
>      QEMUTimer *timer;
>  };
> @@ -37,15 +38,16 @@ static void ptimer_reload(ptimer_state *s)
>  {
>      uint32_t period_frac = s->period_frac;
>      uint64_t period = s->period;
> +    uint64_t delta = MAX(1, s->delta);
>
> -    if (s->delta == 0) {
> -        ptimer_trigger(s);
> -        s->delta = s->limit;
> +    if (s->delta == 0 && s->policy == UNIMPLEMENTED) {
> +        hw_error("ptimer: Running with counter=0 is unimplemented by " \
> +                 "this timer, fix it!\n");

hw_error() is effectively a verbose assert. Have you checked that
all the users of ptimer do the right thing? If not, we can't
assert() until we've fixed them all. Similarly below.
Note that what we had previously was just a warning-and-continue

>      }
> -    if (s->delta == 0 || s->period == 0) {
> -        fprintf(stderr, "Timer with period zero, disabling\n");
> -        s->enabled = 0;
> -        return;
> +
> +    if (period == 0) {
> +        hw_error("ptimer: Timer tries to run with period=0, behaviour is " \
> +                 "undefined, fix it!\n");
>      }
>
>      /*
> @@ -57,15 +59,15 @@ static void ptimer_reload(ptimer_state *s)
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
> @@ -73,27 +75,30 @@ static void ptimer_reload(ptimer_state *s)
>  static void ptimer_tick(void *opaque)
>  {
>      ptimer_state *s = (ptimer_state *)opaque;
> -    ptimer_trigger(s);
> -    s->delta = 0;
> -    if (s->enabled == 2) {
> +
> +    s->delta = (s->enabled == 1) ? s->limit : 0;
> +
> +    if (s->delta == 0) {
>          s->enabled = 0;
>      } else {
>          ptimer_reload(s);
>      }
> +
> +    ptimer_trigger(s);
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
> @@ -165,11 +170,8 @@ void ptimer_run(ptimer_state *s, int oneshot)
>  {
>      bool was_disabled = !s->enabled;
>
> -    if (was_disabled && s->period == 0) {
> -        fprintf(stderr, "Timer with period zero, disabling\n");
> -        return;
> -    }
>      s->enabled = oneshot ? 2 : 1;
> +

Stray extra blank line.

>      if (was_disabled) {
>          s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>          ptimer_reload(s);
> @@ -203,6 +205,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
>  /* Set counter frequency in Hz.  */
>  void ptimer_set_freq(ptimer_state *s, uint32_t freq)
>  {
> +    g_assert(freq != 0 && freq <= 1000000000);

This probably needs an LL suffix like the others below.

>      s->delta = ptimer_get_count(s);
>      s->period = 1000000000ll / freq;
>      s->period_frac = (1000000000ll << 32) / freq;
> @@ -230,10 +233,15 @@ uint64_t ptimer_get_limit(ptimer_state *s)
>      return s->limit;
>  }
>
> +void ptimer_set_policy(ptimer_state *s, enum ptimer_policy policy)
> +{
> +    s->policy = policy;
> +}
> +
>  const VMStateDescription vmstate_ptimer = {
>      .name = "ptimer",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT8(enabled, ptimer_state),
>          VMSTATE_UINT64(limit, ptimer_state),
> @@ -243,6 +251,7 @@ const VMStateDescription vmstate_ptimer = {
>          VMSTATE_INT64(last_event, ptimer_state),
>          VMSTATE_INT64(next_event, ptimer_state),
>          VMSTATE_TIMER_PTR(timer, ptimer_state),
> +        VMSTATE_UINT8(policy, ptimer_state),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
> index e397db5..221f591 100644
> --- a/include/hw/ptimer.h
> +++ b/include/hw/ptimer.h
> @@ -12,6 +12,11 @@
>  #include "qemu/timer.h"
>  #include "migration/vmstate.h"
>
> +enum ptimer_policy {
> +    UNIMPLEMENTED,
> +    SET_CNT_TO_0_TRIGGERS_IRQ_AFTER_ONE_PERIOD,

Given that enums aren't namespaced, "UNIMPLEMENTED" is too broad;
you need some PTIMER_ prefixes. Also the second one of these is
too long a name.

> +};
> +
>  /* ptimer.c */
>  typedef struct ptimer_state ptimer_state;
>  typedef void (*ptimer_cb)(void *opaque);
> @@ -25,6 +30,7 @@ uint64_t ptimer_get_count(ptimer_state *s);
>  void ptimer_set_count(ptimer_state *s, uint64_t count);
>  void ptimer_run(ptimer_state *s, int oneshot);
>  void ptimer_stop(ptimer_state *s);
> +void ptimer_set_policy(ptimer_state *s, enum ptimer_policy policy);

Documentation comment headers for new global functions, please.

>  extern const VMStateDescription vmstate_ptimer;

thanks
-- PMM
