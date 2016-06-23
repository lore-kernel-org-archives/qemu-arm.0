Received: by 10.25.21.96 with SMTP id l93csp534849lfi;
        Thu, 23 Jun 2016 06:51:55 -0700 (PDT)
X-Received: by 10.55.141.134 with SMTP id p128mr41205068qkd.102.1466689914974;
        Thu, 23 Jun 2016 06:51:54 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o68si222921qkd.50.2016.06.23.06.51.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 06:51:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG52w-0001sh-BE
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 09:51:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG51R-0001Ew-MJ
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 09:50:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG51P-0005mN-CU
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 09:50:20 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:36548)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG51P-0005m3-72
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 09:50:19 -0400
Received: by mail-vk0-x22c.google.com with SMTP id u64so106748150vkf.3
	for <qemu-devel@nongnu.org>; Thu, 23 Jun 2016 06:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UctZBRKETPEtsQNH6byE0KbJE41eThlnpuMIkOuXeIw=;
	b=KbGqowQ3gxRb7pUeYEpJS74PvNcSMgccWDzY2ShsfM3PuoTAm7t9BhBtiFtfvyYUHP
	EFNiFBQ+6YMIW/2NXkNPKlmLzKwcG27rbZUN1uPuad0dP9+QYpZkUJVZ08yv9U+XVM76
	P59qn3LB0lYKzjqRtmPmNBgAK4YV2QNVIFuP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UctZBRKETPEtsQNH6byE0KbJE41eThlnpuMIkOuXeIw=;
	b=MMEnWk2T6d2+mJO76kkfldKr27F3bNB+w7EeDD56LzSqbl28zc0A0ReFtBPUYDUEqn
	gcEupOhUn+c3yBurft0xCcEH0CVs6+UPunOQpCuH0xoXyoyhu1l9HjWQQdCj3Y/zdMMG
	WacN6nXQqR97UG+bv0dlkSmeUgl1PwHmIpPMfF8y+W2tyrPkNmMm8fvZOAPEy2FWelq8
	MAIwGfhqgr6sNSpAebW+X7PJsFjjhgUoZdGvFBrfWexySqpYt5bErqz7yo/dxm88ZenA
	WP6NEU3DSOyZT8sDp6lRwyv40GTkRn6XVIFRaBLhU3zW1VULIHMA7hrhzk/tRJPtc7Bj
	Mzqg==
X-Gm-Message-State: ALyK8tJelcoNSYJ28rYK1B7pKZZLWF40iTjqInfvN+KQSaI2/ghm6MwVbndvFOeRRML8tLoOoNB2EQeBXlotJQ0r
X-Received: by 10.31.188.80 with SMTP id m77mr15597959vkf.30.1466689818485;
	Thu, 23 Jun 2016 06:50:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 23 Jun 2016 06:49:59 -0700 (PDT)
In-Reply-To: <2bbc3737669523d9483f27276f929a6c4772fd48.1466167530.git.digetx@gmail.com>
References: <cover.1466167530.git.digetx@gmail.com>
	<2bbc3737669523d9483f27276f929a6c4772fd48.1466167530.git.digetx@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 14:49:59 +0100
Message-ID: <CAFEAcA-v0pBZ2Thxiv38qHJcbeyrgCBvB_EeaCi2OJwGxFyyuA@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-devel] [PATCH v14 1/3] hw/ptimer: Support running with
 counter = 0 by introducing new policy feature
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1O47rtJ81yt2

On 17 June 2016 at 14:17, Dmitry Osipenko <digetx@gmail.com> wrote:
> Currently ptimer prints error message and stops the running timer that has
> delta (counter) = 0, this is an incorrect behaviour for some of the ptimer
> users. There are different variants of how particular timer could handle that
> case besides stopping the timer, like immediate or deferred IRQ trigger.
> Introduce policy feature that provides ptimer with an information about the
> correct behaviour.
>
> Implement the "counter = 0 triggers IRQ after one period" policy, as it is
> known to be used by the ARM MPTimer and set "default" policy to all ptimer
> users, maintaining old behaviour till they get fixed.

Could you split this into:
 (1) a patch which just adds the new argument to ptimer_init() and
     updates all its callers
 (2) a patch which adds support for setting the policy option to
     something other than the default value

and also make sure that we only do one change per patch -- there
seem to be several different behaviour changes tangled up in
one patch here.

I think that will be easier to review.

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index 05b0c27..289e23e 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -21,6 +21,7 @@ struct ptimer_state
>      int64_t period;
>      int64_t last_event;
>      int64_t next_event;
> +    uint8_t policy_mask;
>      QEMUBH *bh;
>      QEMUTimer *timer;
>  };
> @@ -35,14 +36,15 @@ static void ptimer_trigger(ptimer_state *s)
>
>  static void ptimer_reload(ptimer_state *s)
>  {
> -    uint32_t period_frac = s->period_frac;
> +    int64_t period_frac = s->period_frac;

Why does this variable change type?

>      uint64_t period = s->period;
> +    uint64_t delta = s->delta;
>
> -    if (s->delta == 0) {
> -        ptimer_trigger(s);
> -        s->delta = s->limit;
> +    if (delta == 0 && (s->policy_mask & PTIMER_POLICY_CNT_0_DEFERRED_TRIG)) {
> +        delta = 1;
>      }
> -    if (s->delta == 0 || s->period == 0) {
> +
> +    if (delta == 0 || period == 0) {
>          fprintf(stderr, "Timer with period zero, disabling\n");
>          s->enabled = 0;
>          return;
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
> +        s->next_event += (period_frac * delta) >> 32;
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

This seems to be a change not guarded by a check of a policy bit?

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
> @@ -165,10 +170,6 @@ void ptimer_run(ptimer_state *s, int oneshot)
>  {
>      bool was_disabled = !s->enabled;
>
> -    if (was_disabled && s->period == 0) {
> -        fprintf(stderr, "Timer with period zero, disabling\n");
> -        return;
> -    }

If the default policy value was provided, we shouldn't change behaviour.

>      s->enabled = oneshot ? 2 : 1;
>      if (was_disabled) {
>          s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> @@ -203,6 +204,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
>  /* Set counter frequency in Hz.  */
>  void ptimer_set_freq(ptimer_state *s, uint32_t freq)
>  {
> +    g_assert(freq != 0 && freq <= 1000000000ll);

This seems to be an unrelated change.

>      s->delta = ptimer_get_count(s);
>      s->period = 1000000000ll / freq;
>      s->period_frac = (1000000000ll << 32) / freq;
> @@ -232,8 +234,8 @@ uint64_t ptimer_get_limit(ptimer_state *s)
>
>  const VMStateDescription vmstate_ptimer = {
>      .name = "ptimer",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,

Why are we bumping the version ID here?

>      .fields = (VMStateField[]) {
>          VMSTATE_UINT8(enabled, ptimer_state),
>          VMSTATE_UINT64(limit, ptimer_state),
> @@ -247,12 +249,13 @@ const VMStateDescription vmstate_ptimer = {
>      }
>  };
>
> -ptimer_state *ptimer_init(QEMUBH *bh)
> +ptimer_state *ptimer_init(QEMUBH *bh, uint8_t policy_mask)
>  {
>      ptimer_state *s;
>
>      s = (ptimer_state *)g_malloc0(sizeof(ptimer_state));
>      s->bh = bh;
>      s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, ptimer_tick, s);
> +    s->policy_mask = policy_mask;
>      return s;
>  }

thanks
-- PMM
