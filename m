Received: by 10.25.208.211 with SMTP id h202csp53432lfg;
        Wed, 9 Mar 2016 11:56:43 -0800 (PST)
X-Received: by 10.55.207.82 with SMTP id e79mr41443qkj.102.1457553402955;
        Wed, 09 Mar 2016 11:56:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j189si198648qhj.81.2016.03.09.11.56.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Mar 2016 11:56:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adkDq-0001dq-GG
	for alex.bennee@linaro.org; Wed, 09 Mar 2016 14:56:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1adkDe-0001LT-UE
	for qemu-arm@nongnu.org; Wed, 09 Mar 2016 14:56:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1adkDM-0000lh-WF
	for qemu-arm@nongnu.org; Wed, 09 Mar 2016 14:56:30 -0500
Received: from mail-lb0-x241.google.com ([2a00:1450:4010:c04::241]:35423)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1adkDM-0000kI-HQ; Wed, 09 Mar 2016 14:56:12 -0500
Received: by mail-lb0-x241.google.com with SMTP id h2so6246326lbs.2;
	Wed, 09 Mar 2016 11:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=OhJTIkUquVhOxXSerrUS8Mlpj9gJ9F5B8V77eXun9Ys=;
	b=Uk2t+fxO1zszJ+eaiVKdeBWg20uLbK5oMGcJc1Hsc0DdF0BM2hs7MJMGeM+q68G+Rs
	JvaY6e6b0ZQEkly18jqfXNRRA+jp1Zc+PxCAV1/7J4zeTgCjNgUd2RqR4CsmI+toH64H
	YsaEsKdnfWf0Jhk/FhH7mvHPrdcjEvxMLnxdyilDyiikvhBNiR7+5rMra9CN2Z61U3WU
	KtnnLYX7X/EaCB0gGXyWh/5ZPVCFor/bJEd4pvdDJj/Zd3pyY76zQXuVcfBf9cAmLp/6
	bDUlRpfQevGEZj1/lano92ZdwatRfvJm2l7uB4lWoaFGr8kemtIT0W2hwPa+pty+y/GP
	q7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=OhJTIkUquVhOxXSerrUS8Mlpj9gJ9F5B8V77eXun9Ys=;
	b=LBGt+A5FpL/JhX0utDSWtoxNCs0qz+9JbGyHMi/vtpcU8m59QSWcoqRJip0yQJr0xl
	hPEvreYTz0LZl+cPq2Gq/HqpOamu3PgnT9pYrLK5v5gcIyW2pNIndeQuL0zGQKRFsuC1
	iTsZziCwUZRlZ1gWM8T+he6Tc/wdj0HBlqtRgI+yy5arY4geqJTHFASRGy/hgnn1ulZT
	vHVw5d5tLBgaxHh+we+XYneY3aVgQBFAXxDWXz9IhdceqSNAmwALf3RMTta48CN4X8cm
	t/JHhFu9zSoQm5Ic1gDitgQIZ/huX2A18+FrZuLek3Zh54Xe7SWRZNV1Vs/EHXD2ftkw
	TCtg==
X-Gm-Message-State: AD7BkJIL6V6CLDgA7BZ9YUtFzfKeH4TE9BRLy5lTCub5QTt1npR/thD5AOi6D3emvEZi2A==
X-Received: by 10.112.46.136 with SMTP id v8mr17989lbm.38.1457553371028;
	Wed, 09 Mar 2016 11:56:11 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	zr6sm26601lbb.19.2016.03.09.11.56.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Mar 2016 11:56:10 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
	<0eb543c0917bac416a18fc9daf97f5ba4e61ce1f.1454169735.git.digetx@gmail.com>
	<CAPokK=reD-sN1525osBbcxjFDzyJKvaoEf69C7wb6oHco4N=Lw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56E07FD4.70209@gmail.com>
Date: Wed, 9 Mar 2016 22:56:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=reD-sN1525osBbcxjFDzyJKvaoEf69C7wb6oHco4N=Lw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::241
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
X-TUID: ZTX6zGIQmH4b

09.03.2016 00:08, Peter Crosthwaite пишет:
> On Sat, Jan 30, 2016 at 8:43 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
>> It might be necessary by some emulated HW to perform the tick after one
>> period if delta = 0. Given that it is much less churny to implement immediate
>> tick by the ptimer user itself, let's make ptimer do the delayed tick.
>>
>
> Isn't this related to previous patch? It is kind of a rounding problem
> that will vary from timer to timer. Some timers may interpret the
> "tick" as the wrap-around back to the load value (even if that is 0)
> while others interpret the tick as the transition to zero (makes more
> sense for a one-shot). It's hard to set a universal policy here.

If by previous patch you are meaning "Fix counter - 1 ...", then no, it's a 
distinct issue/feature. I endeavored to add some sort of "flags" to ptimer in 
order to support various policies, but quickly realized that it doesn't really 
worth an effort since there are no users of those policies (currently "delta = 
0" is a forbidden case) and ptimer VMSD version would be bumped.

It's not possible (doesn't make sense) for ptimer user to implement policy 
provided by this patch by itself. Other policies could be easily supported in 
future if desired (or implemented by ptimer user).

>
> But is this a non-issue when we consider that event latency (usually
> interrupt latency) is undefined anyway?
>

It's not an issue for a timer that has quite short period. Some of the 
arm_mptimer tests would fail (in icount mode) if that policy not implemented.

BTW, I think "deferred" might be better than "delayed", however not sure :)

> Regards,
> Peter

>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>   hw/core/ptimer.c | 34 +++++++++++++++-------------------
>>   1 file changed, 15 insertions(+), 19 deletions(-)
>>
>> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
>> index b2044fb..bcd090c 100644
>> --- a/hw/core/ptimer.c
>> +++ b/hw/core/ptimer.c
>> @@ -36,19 +36,7 @@ static void ptimer_reload(ptimer_state *s)
>>   {
>>       uint32_t period_frac = s->period_frac;
>>       uint64_t period = s->period;
>> -
>> -    if (s->delta == 0) {
>> -        ptimer_trigger(s);
>> -    }
>> -
>> -    if (s->delta == 0 && s->enabled == 1) {
>> -        s->delta = s->limit;
>> -    }
>> -
>> -    if (s->delta == 0) {
>> -        ptimer_stop(s);
>> -        return;
>> -    }
>> +    uint64_t delta = MAX(1, s->delta);
>>
>>       /*
>>        * Artificially limit timeout rate to something
>> @@ -59,15 +47,15 @@ static void ptimer_reload(ptimer_state *s)
>>        * on the current generation of host machines.
>>        */
>>
>> -    if (s->enabled == 1 && (s->delta * period < 10000) && !use_icount) {
>> -        period = 10000 / s->delta;
>> +    if (s->enabled == 1 && (delta * period < 10000) && !use_icount) {
>> +        period = 10000 / delta;
>>           period_frac = 0;
>>       }
>>
>>       s->last_event = s->next_event;
>> -    s->next_event = s->last_event + s->delta * period;
>> +    s->next_event = s->last_event + delta * period;
>>       if (period_frac) {
>> -        s->next_event += ((int64_t)period_frac * s->delta) >> 32;
>> +        s->next_event += ((int64_t)period_frac * delta) >> 32;
>>       }
>>       timer_mod(s->timer, s->next_event);
>>   }
>> @@ -75,8 +63,16 @@ static void ptimer_reload(ptimer_state *s)
>>   static void ptimer_tick(void *opaque)
>>   {
>>       ptimer_state *s = (ptimer_state *)opaque;
>> -    s->delta = 0;
>> -    ptimer_reload(s);
>> +
>> +    s->delta = (s->enabled == 1) ? s->limit : 0;
>> +
>> +    if (s->delta == 0) {
>> +        s->enabled = 0;
>> +    } else {
>> +        ptimer_reload(s);
>> +    }
>> +
>> +    ptimer_trigger(s);
>>   }
>>
>>   uint64_t ptimer_get_count(ptimer_state *s)
>> --
>> 2.7.0
>>


-- 
Dmitry
