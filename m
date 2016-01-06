Received: by 10.182.158.201 with SMTP id ww9csp11766158obb;
        Wed, 6 Jan 2016 05:12:37 -0800 (PST)
X-Received: by 10.140.27.139 with SMTP id 11mr125365061qgx.62.1452085956549;
        Wed, 06 Jan 2016 05:12:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s105si8407841qgs.72.2016.01.06.05.12.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 05:12:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54182 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGntE-00024C-0l
	for alex.bennee@linaro.org; Wed, 06 Jan 2016 08:12:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGntA-000242-OG
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 08:12:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGnt6-0008Nd-EP
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 08:12:32 -0500
Received: from mail-lb0-x22e.google.com ([2a00:1450:4010:c04::22e]:36090)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aGnt6-0008NM-2m; Wed, 06 Jan 2016 08:12:28 -0500
Received: by mail-lb0-x22e.google.com with SMTP id oh2so190704930lbb.3;
	Wed, 06 Jan 2016 05:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=WL8/k68r0TXGatKpRUNgdLAzIG2y5KC6Yyit6OppyYE=;
	b=aR/M1o3KDotDW0hNDhRzyzOI1JEN+pX+E2XCluP6GS96zdlw5GWcNTteUonuf+lSEc
	dJ3Myjqu1ocOPjQ/RpnGF5OZGgSaPUx7duAXxGRJkGjMqbPveskPnaV6eLCEwNebFRNj
	fYbzcmzJEWnr81WdOGzMZFSPZMw8aaVSDwQhw5C4SEUggwqZ7oar589IWKsaE5zr2QWo
	ckX3K6LjFRWHQY9DQbaYwxfIym8dPUwaxHZpHGoYwB+PIZ9YkmNkNbLO/zGYRicRG1lO
	LHeCZeVlWBgphmisKHVK346dr/W384C1x/GHcz6LYliEPyKwEyxJDermelBiLeA0Xjwz
	I88w==
X-Received: by 10.112.63.68 with SMTP id e4mr35164576lbs.130.1452085947167;
	Wed, 06 Jan 2016 05:12:27 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	v189sm6921932lfd.4.2016.01.06.05.12.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jan 2016 05:12:26 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1451960508.git.digetx@gmail.com>
	<004073b3af0a56899f9a07e3f6b00167359322e6.1451960508.git.digetx@gmail.com>
	<20160106121711.GC4227@pcrost-box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <568D12A7.3010304@gmail.com>
Date: Wed, 6 Jan 2016 16:12:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160106121711.GC4227@pcrost-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::22e
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v8 2/4] hw/ptimer: Perform tick and counter
 wrap around if timer already expired
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
X-TUID: pPjqo8t5FS6Y

06.01.2016 15:17, Peter Crosthwaite пишет:
> On Tue, Jan 05, 2016 at 05:33:27AM +0300, Dmitry Osipenko wrote:
>> ptimer_get_count() might be called while QEMU timer already been expired.
>> In that case ptimer would return counter = 0, which might be undesirable
>> in case of polled timer. Do counter wrap around for periodic timer to keep
>> it distributed.
>>
>> In addition, there is no reason to keep expired timer tick deferred, so
>> just perform the tick from ptimer_get_count().
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>   hw/core/ptimer.c | 35 +++++++++++++++++++++++++++++------
>>   1 file changed, 29 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
>> index 035af97..96a6c7a 100644
>> --- a/hw/core/ptimer.c
>> +++ b/hw/core/ptimer.c
>> @@ -85,15 +85,21 @@ static void ptimer_tick(void *opaque)
>>
>>   uint64_t ptimer_get_count(ptimer_state *s)
>>   {
>> +    int enabled = s->enabled;
>
> Variable localisation not needed.
>
>>       int64_t now;
>> +    int64_t next;
>>       uint64_t counter;
>> +    int expired;
>> +    int oneshot;
>
> Variable defs can be localised to the if (enabled) (even though now
> in original code doesn't do that).
>

Yeah, I just tried to keep original style here.

>>
>> -    if (s->enabled) {
>> +    if (enabled) {
>>           now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +        next = s->next_event;
>> +        expired = (now - next >= 0);
>> +        oneshot = (enabled == 2);
>>           /* Figure out the current counter value.  */
>
> This comment is now out of place.
>

Okay, will fix it.

>> -        if (now - s->next_event > 0
>> -            || s->period == 0) {
>> -            /* Prevent timer underflowing if it should already have
>> +        if (s->period == 0 || (expired && oneshot)) {
>> +            /* Prevent one-shot timer underflowing if it should already have
>>                  triggered.  */
>>               counter = 0;
>>           } else {
>> @@ -114,12 +120,12 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>                  backwards.
>>               */
>>
>> -            if ((s->enabled == 1) && (s->limit * period < 10000)) {
>> +            if (!oneshot && (s->limit * period < 10000)) {
>>                   period = 10000 / s->limit;
>>                   period_frac = 0;
>>               }
>>
>> -            rem = s->next_event - now;
>> +            rem = expired ? now - next : next - now;
>>               div = period;
>>
>>               clz1 = clz64(rem);
>> @@ -139,6 +145,23 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>                       div += 1;
>>               }
>>               counter = rem / div;
>> +
>> +            if (expired) {
>> +                /* Wrap around periodic counter.  */
>> +                counter = s->delta = s->limit - counter % s->limit;
>
> Why do you update the delta here?
>

Because we would want to schedule next tick based on current wrapped around 
counter value and not some arbitrary delta.

> Also can you just get ptimer_reload to do the modulo math for you? If the
> timer is !oneshot and expired, then you call ptimer_reload anyway,
> which will update next_event. When the expired test returns false
> you can just reliably use the original logic involving now and next.
>

Yes, that's what I changed in V9. Have you received it?

https://lists.nongnu.org/archive/html/qemu-devel/2016-01/msg00272.html

>> +            }
>> +        }
>> +
>> +        if (expired) {
>> +            if (oneshot) {
>
> This if-else has a lot of common structure with the one above. I think
> they could be merged.
>

That's a good suggestion, will do it in V10. Thanks.

> Regards,
> Peter
>
>> +                ptimer_tick(s);
>> +            } else {
>> +                /* Don't use ptimer_tick() for the periodic timer since it
>> +                 * would reset the delta value.
>> +                 */
>> +                ptimer_trigger(s);
>> +                ptimer_reload(s);
>> +            }
>>           }
>>       } else {
>>           counter = s->delta;
>> --
>> 2.6.4
>>


-- 
Dmitry
