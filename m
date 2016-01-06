Received: by 10.182.158.201 with SMTP id ww9csp11773314obb;
        Wed, 6 Jan 2016 05:26:14 -0800 (PST)
X-Received: by 10.55.15.228 with SMTP id 97mr129488271qkp.98.1452086774711;
        Wed, 06 Jan 2016 05:26:14 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b74si55268451qhc.16.2016.01.06.05.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 05:26:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54213 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGo6Q-00050J-A7
	for alex.bennee@linaro.org; Wed, 06 Jan 2016 08:26:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGo6O-00050C-DP
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 08:26:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGo6L-0003Zi-7I
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 08:26:12 -0500
Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231]:33427)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aGo6K-0003ZX-Qz; Wed, 06 Jan 2016 08:26:09 -0500
Received: by mail-lb0-x231.google.com with SMTP id sv6so183435073lbb.0;
	Wed, 06 Jan 2016 05:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=/TDR0x7WnAhan+T6iNadSW7SsD5ptIRVjQhtkprLdOE=;
	b=vXb1Ya+7f0wL0LZi20AmHKM7DNAEprETLS4y1uGt5PyhTbkI+TP9N9KY80ZHxVgERs
	VlxRucuIgUyKxywJTJnpW7pXgCXhAlx2kJ2T1E9yh0Aax/twF5beI6VU163LwT54+p7h
	fsB4kq1Qy0TVuM7lTgKswkY+TL+G52hWTRFCrVEuXIk1crDjXC8fQcgvCXYttVk5bohM
	5d2aGIoI6fUtTc3AR34A3ufEyPhxuvlbd3qdOnPIurBhg66tmZLVLKn9L+bbN3FANimY
	Wp9TzHDDGTqOIKoLq+a0TlFQye8QNc48PxZyD1GqDQ1jLOw1ybWatCAznw5COwNxY8PS
	OgMA==
X-Received: by 10.112.202.66 with SMTP id kg2mr34000841lbc.50.1452086768026;
	Wed, 06 Jan 2016 05:26:08 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	n62sm13516107lfn.5.2016.01.06.05.26.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jan 2016 05:26:07 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1451960508.git.digetx@gmail.com>
	<32ced3aba243ebfac3f1db6e9f8bc820c2302cfa.1451960508.git.digetx@gmail.com>
	<20160106121535.GB4227@pcrost-box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <568D15DC.2020003@gmail.com>
Date: Wed, 6 Jan 2016 16:25:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160106121535.GB4227@pcrost-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::231
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
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
X-TUID: /qZQxgaI6QVs

06.01.2016 15:15, Peter Crosthwaite пишет:
>> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
>> index edf077c..035af97 100644
>> --- a/hw/core/ptimer.c
>> +++ b/hw/core/ptimer.c
>> @@ -34,20 +34,39 @@ static void ptimer_trigger(ptimer_state *s)
>>
>>   static void ptimer_reload(ptimer_state *s)
>>   {
>> -    if (s->delta == 0) {
>> +    uint32_t period_frac = s->period_frac;
>> +    uint64_t period = s->period;
>> +    uint64_t delta = s->delta;
>> +    uint64_t limit = s->limit;
>> +
>
> Localising these variables is out of scope of the change. I think you can
> just use s->foo and if you want to cleanup, it should be a separate
> patch.
>

Okay

>> +    if (delta == 0) {
>>           ptimer_trigger(s);
>> -        s->delta = s->limit;
>> +        delta = limit;
>>       }
>> -    if (s->delta == 0 || s->period == 0) {
>> +    if (delta == 0 || period == 0) {
>>           fprintf(stderr, "Timer with period zero, disabling\n");
>>           s->enabled = 0;
>>           return;
>>       }
>>
>> +    /*
>> +     * Artificially limit timeout rate to something
>> +     * achievable under QEMU.  Otherwise, QEMU spends all
>> +     * its time generating timer interrupts, and there
>> +     * is no forward progress.
>> +     * About ten microseconds is the fastest that really works
>> +     * on the current generation of host machines.
>> +     */
>> +
>> +    if ((s->enabled == 1) && (limit * period < 10000)) {
>> +        period = 10000 / limit;
>> +        period_frac = 0;
>> +    }
>> +
>
> I think it should be ok to just update s->period and s->period_frac ...
>

No, then it would be irreversibly lost. What if'd decide to change the limit to 
some large value?

>>       s->last_event = s->next_event;
>> -    s->next_event = s->last_event + s->delta * s->period;
>> -    if (s->period_frac) {
>> -        s->next_event += ((int64_t)s->period_frac * s->delta) >> 32;
>> +    s->next_event = s->last_event + delta * period;
>> +    if (period_frac) {
>> +        s->next_event += ((int64_t)period_frac * delta) >> 32;
>>       }
>>       timer_mod(s->timer, s->next_event);
>>   }
>> @@ -82,6 +101,8 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>               uint64_t div;
>>               int clz1, clz2;
>>               int shift;
>> +            uint32_t period_frac = s->period_frac;
>> +            uint64_t period = s->period;
>>
>>               /* We need to divide time by period, where time is stored in
>>                  rem (64-bit integer) and period is stored in period/period_frac
>> @@ -93,8 +114,13 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>                  backwards.
>>               */
>>
>> +            if ((s->enabled == 1) && (s->limit * period < 10000)) {
>> +                period = 10000 / s->limit;
>> +                period_frac = 0;
>> +            }
>> +
>
> ... and then this (and the local variables) become obsolete. Can get_count()
> blindly use the period and period_frac as used by ptimer_reload?
>
>>               rem = s->next_event - now;
>> -            div = s->period;
>> +            div = period;
>>
>>               clz1 = clz64(rem);
>>               clz2 = clz64(div);
>> @@ -103,13 +129,13 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>               rem <<= shift;
>>               div <<= shift;
>>               if (shift >= 32) {
>> -                div |= ((uint64_t)s->period_frac << (shift - 32));
>> +                div |= ((uint64_t)period_frac << (shift - 32));
>>               } else {
>>                   if (shift != 0)
>> -                    div |= (s->period_frac >> (32 - shift));
>> +                    div |= (period_frac >> (32 - shift));
>>                   /* Look at remaining bits of period_frac and round div up if
>>                      necessary.  */
>> -                if ((uint32_t)(s->period_frac << shift))
>> +                if ((uint32_t)(period_frac << shift))
>>                       div += 1;
>>               }
>>               counter = rem / div;
>> @@ -181,19 +207,6 @@ void ptimer_set_freq(ptimer_state *s, uint32_t freq)
>>      count = limit.  */
>>   void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
>>   {
>> -    /*
>> -     * Artificially limit timeout rate to something
>> -     * achievable under QEMU.  Otherwise, QEMU spends all
>> -     * its time generating timer interrupts, and there
>> -     * is no forward progress.
>> -     * About ten microseconds is the fastest that really works
>> -     * on the current generation of host machines.
>> -     */
>> -
>> -    if (!use_icount && limit * s->period < 10000 && s->period) {
>
> This original rate limiting code is gated on icount, so I think then
> new way should be the same.
>

Shoot :) That's second time I'm missing it. Good catch!

> Regards,
> Peter
>
>> -        limit = 10000 / s->period;
>> -    }
>> -
>>       s->limit = limit;
>>       if (reload)
>>           s->delta = limit;
>> --
>> 2.6.4
>>


-- 
Dmitry
