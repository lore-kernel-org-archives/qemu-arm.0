Received: by 10.25.21.96 with SMTP id l93csp613715lfi;
        Thu, 23 Jun 2016 09:34:45 -0700 (PDT)
X-Received: by 10.200.44.136 with SMTP id 8mr46967488qtw.18.1466699685493;
        Thu, 23 Jun 2016 09:34:45 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u62si867084qkb.188.2016.06.23.09.34.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 09:34:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG7aW-0004pB-N2
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 12:34:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bG7YQ-0001nb-9t
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 12:32:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bG7YP-0001EF-0Z
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 12:32:34 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:34208)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bG7YJ-0001D7-Qi; Thu, 23 Jun 2016 12:32:28 -0400
Received: by mail-lf0-x243.google.com with SMTP id l184so18876480lfl.1;
	Thu, 23 Jun 2016 09:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=AKGQ2+pDfWlQvJw8geX9dnw8hq5oOL55/Zl7XWy2sCM=;
	b=Es5K0oQfKGITOZ4BwyU+HYo3Las9tv77IKXpe8JcBCZ0JByRSfF4IQqeEsF0/wlonw
	+AolhYkPxNNzBZt3v2oChoP+PxhvqV0lupMVGVuHFDfDL3XPgaf5Np4Fo4uR335v1aw/
	fTQJMwnXHU8z50Xpd+/G29+EssQGKtw+xRtRIcviL+J2tuXDoMRjhNXD/kKMgS/nnMk3
	M9UXo2BgiLWm+ZvawV4u7LD7/h2KQWOKL9xzVQk/gu4xj9DJ6y39w2KuAaJVSae9h7iT
	t2NkueZRrqgc8aVcImie3BE0WmcyRlwXO75QJiV8CWoeKxNR89LUHs+xeBA4n0i6uvW3
	w0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=AKGQ2+pDfWlQvJw8geX9dnw8hq5oOL55/Zl7XWy2sCM=;
	b=BkCD8NAgeItZW+xkAt6uNWufV+PBqPQ/u7dm6umXHryXLZB0wjttyGcJiewKDaPJ7e
	clcMSH+l95eLdQfRe24h+Mor65W4yXXS4IqVli9d2KaZkZAvQm6dJPpT9X/HtAJqKrHf
	sEaU96VG/ta4qOwgJptaTPzGFw/aXh/1O9NEnDVanKuj1aVz+ZRREwAeMs8bkbGfmuW5
	m74417Tk2htk1DCjUJN/mabbCT8A4rrryfDBa7xDkDARldfnaLn5OvTnjXIl2SV6F5G6
	JfQOIcu/txVC3xPak5jMVXF6Ncv+JE4KDoizquF5OC70xJgEfuybTHx4AYAGnfXkfqiQ
	MVpA==
X-Gm-Message-State: ALyK8tIoHBAYpQseRz6GEEA2ptkOzMX0wgCJne46Ha6FKKJ2/xaKlMkMvsdsrJ6VyAgyrg==
X-Received: by 10.46.9.13 with SMTP id 13mr11642079ljj.2.1466699546559;
	Thu, 23 Jun 2016 09:32:26 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.googlemail.com with ESMTPSA id
	76sm164052lfu.26.2016.06.23.09.32.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jun 2016 09:32:26 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1466167530.git.digetx@gmail.com>
	<2bbc3737669523d9483f27276f929a6c4772fd48.1466167530.git.digetx@gmail.com>
	<CAFEAcA-v0pBZ2Thxiv38qHJcbeyrgCBvB_EeaCi2OJwGxFyyuA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d86d652a-8fd5-7383-36d4-68f4e8d23627@gmail.com>
Date: Thu, 23 Jun 2016 19:32:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-v0pBZ2Thxiv38qHJcbeyrgCBvB_EeaCi2OJwGxFyyuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
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
X-TUID: Y3UNf/0dgrfD

On 23.06.2016 16:49, Peter Maydell wrote:
> On 17 June 2016 at 14:17, Dmitry Osipenko <digetx@gmail.com> wrote:
>> Currently ptimer prints error message and stops the running timer that has
>> delta (counter) = 0, this is an incorrect behaviour for some of the ptimer
>> users. There are different variants of how particular timer could handle that
>> case besides stopping the timer, like immediate or deferred IRQ trigger.
>> Introduce policy feature that provides ptimer with an information about the
>> correct behaviour.
>>
>> Implement the "counter = 0 triggers IRQ after one period" policy, as it is
>> known to be used by the ARM MPTimer and set "default" policy to all ptimer
>> users, maintaining old behaviour till they get fixed.
> 
> Could you split this into:
>  (1) a patch which just adds the new argument to ptimer_init() and
>      updates all its callers
>  (2) a patch which adds support for setting the policy option to
>      something other than the default value
> 
> and also make sure that we only do one change per patch -- there
> seem to be several different behaviour changes tangled up in
> one patch here.
> 
> I think that will be easier to review.
> 

This patch isn't supposed to change behaviour for any of the current timers. I
think it is clearly expressed in the last sentence of the commit message. There
is one unintended behaviour change in this patch, it's my overlook [see below].

>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
>> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
>> index 05b0c27..289e23e 100644
>> --- a/hw/core/ptimer.c
>> +++ b/hw/core/ptimer.c
>> @@ -21,6 +21,7 @@ struct ptimer_state
>>      int64_t period;
>>      int64_t last_event;
>>      int64_t next_event;
>> +    uint8_t policy_mask;
>>      QEMUBH *bh;
>>      QEMUTimer *timer;
>>  };
>> @@ -35,14 +36,15 @@ static void ptimer_trigger(ptimer_state *s)
>>
>>  static void ptimer_reload(ptimer_state *s)
>>  {
>> -    uint32_t period_frac = s->period_frac;
>> +    int64_t period_frac = s->period_frac;
> 
> Why does this variable change type?
> 

I removed the in-place type conversion further:
>>      if (period_frac) {
>> -        s->next_event += ((int64_t)period_frac * s->delta) >> 32;
>> +        s->next_event += (period_frac * delta) >> 32;
>>      }
>>      timer_mod(s->timer, s->next_event);
>>  }
>> @@ -73,27 +75,30 @@ static void ptimer_reload(ptimer_state *s)
>>  static void ptimer_tick(void *opaque)
>>  {
>>      ptimer_state *s = (ptimer_state *)opaque;
>> -    ptimer_trigger(s);
>> -    s->delta = 0;
>> -    if (s->enabled == 2) {
>> +
>> +    s->delta = (s->enabled == 1) ? s->limit : 0;
>> +
>> +    if (s->delta == 0) {
> 
> This seems to be a change not guarded by a check of a policy bit?
> 

That's a good question. In the current ARM MPTimer conversion patch, I assume
that delta = 0 would stop the timer regardless of it's mode and ptimer user
would itself re-arm timer in a tick() handler if needed. However, after your
question, I think it's a bit unintuitive and needs to be changed to continuous
*ptimer* trigger in periodic mode in case of the deferred trigger policy.

>>          s->enabled = 0;
>>      } else {
>>          ptimer_reload(s);
>>      }
>> +
>> +    ptimer_trigger(s);
>>  }
>>
>>  uint64_t ptimer_get_count(ptimer_state *s)
>>  {
>>      uint64_t counter;
>>
>> -    if (s->enabled) {
>> +    if (s->enabled && s->delta != 0) {
>>          int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>          int64_t next = s->next_event;
>>          bool expired = (now - next >= 0);
>>          bool oneshot = (s->enabled == 2);
>>
>>          /* Figure out the current counter value.  */
>> -        if (s->period == 0 || (expired && (oneshot || use_icount))) {
>> +        if (expired && (oneshot || use_icount)) {
>>              /* Prevent timer underflowing if it should already have
>>                 triggered.  */
>>              counter = 0;
>> @@ -165,10 +170,6 @@ void ptimer_run(ptimer_state *s, int oneshot)
>>  {
>>      bool was_disabled = !s->enabled;
>>
>> -    if (was_disabled && s->period == 0) {
>> -        fprintf(stderr, "Timer with period zero, disabling\n");
>> -        return;
>> -    }
> 
> If the default policy value was provided, we shouldn't change behaviour.
> 

Right, now I see that ptimer_trigger() is missed in case of running timer with a
default policy and delta = 0. Thanks for the note, will fix it. I'll craft
QTests for the ptimer, shouldn't take a lot of effort.

>>      s->enabled = oneshot ? 2 : 1;
>>      if (was_disabled) {
>>          s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> @@ -203,6 +204,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
>>  /* Set counter frequency in Hz.  */
>>  void ptimer_set_freq(ptimer_state *s, uint32_t freq)
>>  {
>> +    g_assert(freq != 0 && freq <= 1000000000ll);
> 
> This seems to be an unrelated change.
> 

Agree :) I have hit it couple times during the work on the ARM MPTimer patch in
the past, decided that it may not worth a whole patch for a such simple one-liner.

>>      s->delta = ptimer_get_count(s);
>>      s->period = 1000000000ll / freq;
>>      s->period_frac = (1000000000ll << 32) / freq;
>> @@ -232,8 +234,8 @@ uint64_t ptimer_get_limit(ptimer_state *s)
>>
>>  const VMStateDescription vmstate_ptimer = {
>>      .name = "ptimer",
>> -    .version_id = 1,
>> -    .minimum_version_id = 1,
>> +    .version_id = 2,
>> +    .minimum_version_id = 2,
> 
> Why are we bumping the version ID here?
> 

Ooops, good catch!

Thanks for the review!

-- 
Dmitry
