Received: by 10.25.208.211 with SMTP id h202csp2109193lfg;
        Tue, 8 Mar 2016 11:11:45 -0800 (PST)
X-Received: by 10.140.225.6 with SMTP id v6mr40707164qhb.0.1457464303813;
        Tue, 08 Mar 2016 11:11:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j7si4348528qgf.83.2016.03.08.11.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 11:11:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adN2k-00083R-SI
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 14:11:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1adN2f-00082T-5z
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 14:11:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1adN2a-0006SP-TV
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 14:11:37 -0500
Received: from mail-lb0-x241.google.com ([2a00:1450:4010:c04::241]:33667)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1adN2a-0006Rs-GQ; Tue, 08 Mar 2016 14:11:32 -0500
Received: by mail-lb0-x241.google.com with SMTP id bc4so2699546lbc.0;
	Tue, 08 Mar 2016 11:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=k1FEljxNtIgcPwpw08pqvsuRjOn2RaFp6blxuqMF6bw=;
	b=txbzdols29epU5av0VyAkWqatM1z6/Wl6uNrz+l3M3/eJjeIHAcvnVRfUqLCvmfM3V
	WrCJWfYA13GMhIj4adaf5SYvcDXNFOi+KHb984QCg+he+0MkogdW3voXoMb4YrADwouA
	gdN7buPxmAwrK5WmNDhVCTAL5heOu9pYiSVjsM+5c5OoeWiEij+JLg94i4I7LmiCfXES
	9eJ3yHCpz3neWZ3984jfrFD6RcDanEnegA2OurywuyXYlIHrtBtq/l//7+LcNPFUu9AP
	fXfHlkUHniSx+e0A/T+fVZJs8/DSX4QPQsIR6JmwK3zHBMPManAKIxeYj8p+I7g0km09
	bPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=k1FEljxNtIgcPwpw08pqvsuRjOn2RaFp6blxuqMF6bw=;
	b=hYoaBIyBf9KnUCjB5Zgb0uFaaCQ98E88971RdMF033Nmthd//I1aqeWYBiFzM3e3Lq
	iJFfUyT7uzMfaZeQe4FsWzrEjT09NKS61syS+QGlcCAX7NtpM99XePqoYDBl9f46lKYR
	E7GRU8Zbz7ElI+87mvv/9+Cs2KETZtqZtxl3/b1KZw/j0RizAo6ffJHUXEE41JjuRqDw
	Ssm+8dDNZ11FZKVooY7eDfb+/mrpZ2U5OL4WBM3eEk+rbXjjmFYx+zDhl0vnktNDLqYA
	meqgvk2ZAAU71yGgQJ8VYCLFLoJHWe45ohWWi6Ue4iw0qM03cQvUjVCfvRfWN0dqdUX+
	vIUg==
X-Gm-Message-State: AD7BkJIRrcgfRRRTTpLs8kNNT2/ENRxcsLkB/i7R5JKeMoa+GU7S9NW2RqtLcw5XNHIgYA==
X-Received: by 10.25.81.148 with SMTP id f142mr8552444lfb.95.1457464291478;
	Tue, 08 Mar 2016 11:11:31 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	ze8sm705528lbb.45.2016.03.08.11.11.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Mar 2016 11:11:30 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
	<77d17ad13f7b20deb433ca7a7b3d7cf40429665e.1454169735.git.digetx@gmail.com>
	<56B0C90B.7000300@gmail.com>
	<CAPokK=qDSsbvdPtqL42EiEOE-R0RguGegMj-Pj9j7ktEP_zD2A@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56DF23E1.9080901@gmail.com>
Date: Tue, 8 Mar 2016 22:11:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=qDSsbvdPtqL42EiEOE-R0RguGegMj-Pj9j7ktEP_zD2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::241
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v12 7/9] hw/ptimer: Fix counter - 1 returned
 by ptimer_get_count for the active timer
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
X-TUID: vi9MmAuyjYfp

08.03.2016 06:43, Peter Crosthwaite пишет:
> On Tue, Feb 2, 2016 at 7:19 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
>> 30.01.2016 19:43, Dmitry Osipenko пишет:
>>>
>>> Due to rounding down performed by ptimer_get_count, it returns counter - 1
>>> for
>>> the active timer. That's incorrect because counter should decrement only
>>> after
>>> period been expired, not before. I.e. if running timer has been loaded
>>> with
>>> value X, then timer counter should stay with X until period expired and
>>> decrement after. Fix this by adding 1 to the counter value for the active
>>> and
>>> unexpired timer.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>    hw/core/ptimer.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
>>> index 62f8cb1..b2044fb 100644
>>> --- a/hw/core/ptimer.c
>>> +++ b/hw/core/ptimer.c
>>> @@ -136,7 +136,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>>                    if ((uint32_t)(period_frac << shift))
>>>                        div += 1;
>>>                }
>>> -            counter = rem / div;
>>> +            counter = rem / div + (expired ? 0 : 1);
>>>
>>>                if (expired && counter != 0) {
>>>                    /* Wrap around periodic counter.  */
>>>
>>
>> Noticed one nit here:
>>
>> There is possibility to return timer counter = limit + 1, if the following
>> ptimer calls execute in less than 1ns.
>>
>>          ptimer_run(t, 1);
>>          // counter = 91, if set() count executed in less than 1ns
>>          ptimer_set_count(t, 90);
>>          counter = ptimer_get_count(t);
>>
>> Likely, it would be impossible to trigger that issue on a real current
>> machine.
>> But the fix is trivial, I'll incorporate it in V13 if it looks fine:
>>
>> ---
>> @@ -76,20 +76,20 @@ static void ptimer_tick(void *opaque)
>>   {
>>       ptimer_state *s = (ptimer_state *)opaque;
>>       s->delta = 0;
>>       ptimer_reload(s);
>>   }
>>
>>   uint64_t ptimer_get_count(ptimer_state *s)
>>   {
>> +    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>       uint64_t counter;
>>
>> -    if (s->enabled && s->delta != 0) {
>> -        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +    if (s->enabled && s->delta != 0 && now != s->last_event) {
>>           int64_t next = s->next_event;
>>           bool expired = (now - next >= 0);
>>           bool oneshot = (s->enabled == 2);
>>
>>           /* Figure out the current counter value.  */
>>           if (expired && (oneshot || use_icount)) {
>>               /* Prevent timer underflowing if it should already have
>>                  triggered.  */
>> @@ -131,17 +131,17 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>               } else {
>>                   if (shift != 0)
>>                       div |= (period_frac >> (32 - shift));
>>                   /* Look at remaining bits of period_frac and round div up
>> if
>>                      necessary.  */
>>                   if ((uint32_t)(period_frac << shift))
>>                       div += 1;
>>               }
>> -            counter = rem / div;
>> +            counter = rem / div + (expired ? 0 : 1);
>>
>
> Sorry about the long delays. Im wondering what this has to do with
> expiration though? the commit message suggests you want to change the
> rounding scheme, so can that be done directly with DIV_ROUND_UP?
>
> Regards,
> Peter
>
>>               if (expired && counter != 0) {
>>                   /* Wrap around periodic counter.  */
>>                   counter = s->limit - (counter - 1) % s->limit;
>>               }
>>           }
>>       } else {
>>           counter = s->delta;
>>
>>
>> --
>> Dmitry

Hi Peter,

The expiration check is needed because timer should stay with 0 for a one period 
before doing wrap around. Using DIV_ROUND_UP directly, timer would wrap around 
immediately once now > next (i.e. after 1 ns) regardless of the period value, 
and DIV_ROUND_UP can't be used because it would cause integer overflow of (n) + 
(d) due to the left shifting of the "rem" and "div".

#define DIV_ROUND_UP(n,d) (((n) + (d) - 1) / (d))


No worries, I can wait as much as needed :)

-- 
Dmitry
