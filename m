Received: by 10.182.158.201 with SMTP id ww9csp11779722obb;
        Wed, 6 Jan 2016 05:38:41 -0800 (PST)
X-Received: by 10.55.71.195 with SMTP id u186mr129598881qka.38.1452087521018;
        Wed, 06 Jan 2016 05:38:41 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q15si11634462qkh.128.2016.01.06.05.38.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 05:38:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54255 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGoIS-00010A-KF
	for alex.bennee@linaro.org; Wed, 06 Jan 2016 08:38:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGoHv-0000II-2H
	for qemu-devel@nongnu.org; Wed, 06 Jan 2016 08:38:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGoHt-0005h7-TD
	for qemu-devel@nongnu.org; Wed, 06 Jan 2016 08:38:06 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:35261)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aGoHt-0005gy-KH; Wed, 06 Jan 2016 08:38:05 -0500
Received: by mail-wm0-x233.google.com with SMTP id f206so59768270wmf.0;
	Wed, 06 Jan 2016 05:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=OhK5xPRJEZB4kxK707/hijuniCykl8NpKWTzHx6wVvE=;
	b=e27p3HIWa9arkR1FjvbhXHQzNYipYtfpU6sPxBq5CBovmG0bRIWp+AZ54oVyQGoiNp
	fIbIV3tY9vL6pttBDA8KgMUPAG9+X0D4zwNDtpPwJZucgDpRe1XvDX85D4spKXED2oUw
	FxNBHV/zRGeGaYwqet6wTtreL2TvrsU0JEg5Ir9Xm4NAu3hK9gVzN3imDQdF/mqZK09f
	g7k3rZQL+wjxZSF498fY+enM1lbGe8fimwM3huh14aNHhLo1XAXNDPQQl5/YCtLYmyXz
	CT0hbWmfjl5wslIHaiDyKTpOrzwD4YW2aA0SMk4bT2Vvuf66Fkm3aslG8o1e9UYinWsZ
	kZoQ==
MIME-Version: 1.0
X-Received: by 10.194.204.166 with SMTP id kz6mr108830035wjc.174.1452087484902;
	Wed, 06 Jan 2016 05:38:04 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Wed, 6 Jan 2016 05:38:04 -0800 (PST)
In-Reply-To: <568D15DC.2020003@gmail.com>
References: <cover.1451960508.git.digetx@gmail.com>
	<32ced3aba243ebfac3f1db6e9f8bc820c2302cfa.1451960508.git.digetx@gmail.com>
	<20160106121535.GB4227@pcrost-box> <568D15DC.2020003@gmail.com>
Date: Wed, 6 Jan 2016 05:38:04 -0800
Message-ID: <CAPokK=qPrjScNfZ9Q3bw3W9SsVmkz6T+=pQV7Fo49oTNoKnY_A@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v8 1/4] hw/ptimer: Fix issues caused by the
 adjusted timer limit value
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FAAfvNqF5R8N

On Wed, Jan 6, 2016 at 5:25 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
> 06.01.2016 15:15, Peter Crosthwaite =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>
>>> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
>>> index edf077c..035af97 100644
>>> --- a/hw/core/ptimer.c
>>> +++ b/hw/core/ptimer.c
>>> @@ -34,20 +34,39 @@ static void ptimer_trigger(ptimer_state *s)
>>>
>>>   static void ptimer_reload(ptimer_state *s)
>>>   {
>>> -    if (s->delta =3D=3D 0) {
>>> +    uint32_t period_frac =3D s->period_frac;
>>> +    uint64_t period =3D s->period;
>>> +    uint64_t delta =3D s->delta;
>>> +    uint64_t limit =3D s->limit;
>>> +
>>
>>
>> Localising these variables is out of scope of the change. I think you ca=
n
>> just use s->foo and if you want to cleanup, it should be a separate
>> patch.
>>
>
> Okay
>
>>> +    if (delta =3D=3D 0) {
>>>           ptimer_trigger(s);
>>> -        s->delta =3D s->limit;
>>> +        delta =3D limit;
>>>       }
>>> -    if (s->delta =3D=3D 0 || s->period =3D=3D 0) {
>>> +    if (delta =3D=3D 0 || period =3D=3D 0) {
>>>           fprintf(stderr, "Timer with period zero, disabling\n");
>>>           s->enabled =3D 0;
>>>           return;
>>>       }
>>>
>>> +    /*
>>> +     * Artificially limit timeout rate to something
>>> +     * achievable under QEMU.  Otherwise, QEMU spends all
>>> +     * its time generating timer interrupts, and there
>>> +     * is no forward progress.
>>> +     * About ten microseconds is the fastest that really works
>>> +     * on the current generation of host machines.
>>> +     */
>>> +
>>> +    if ((s->enabled =3D=3D 1) && (limit * period < 10000)) {
>>> +        period =3D 10000 / limit;
>>> +        period_frac =3D 0;
>>> +    }
>>> +
>>
>>
>> I think it should be ok to just update s->period and s->period_frac ...
>>
>
> No, then it would be irreversibly lost. What if'd decide to change the li=
mit
> to some large value?
>

Ok makes sense.

>
>>>       s->last_event =3D s->next_event;
>>> -    s->next_event =3D s->last_event + s->delta * s->period;
>>> -    if (s->period_frac) {
>>> -        s->next_event +=3D ((int64_t)s->period_frac * s->delta) >> 32;
>>> +    s->next_event =3D s->last_event + delta * period;
>>> +    if (period_frac) {
>>> +        s->next_event +=3D ((int64_t)period_frac * delta) >> 32;
>>>       }
>>>       timer_mod(s->timer, s->next_event);
>>>   }
>>> @@ -82,6 +101,8 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>>               uint64_t div;
>>>               int clz1, clz2;
>>>               int shift;
>>> +            uint32_t period_frac =3D s->period_frac;
>>> +            uint64_t period =3D s->period;
>>>
>>>               /* We need to divide time by period, where time is stored
>>> in
>>>                  rem (64-bit integer) and period is stored in
>>> period/period_frac
>>> @@ -93,8 +114,13 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>>                  backwards.
>>>               */
>>>
>>> +            if ((s->enabled =3D=3D 1) && (s->limit * period < 10000)) =
{
>>> +                period =3D 10000 / s->limit;
>>> +                period_frac =3D 0;
>>> +            }
>>> +

As this now needs to be kept, another note I had is it should probably
go before the block comment as the comment relates specifically to the
math below.

Regards,
Peter

>>
>>
>> ... and then this (and the local variables) become obsolete. Can
>> get_count()
>> blindly use the period and period_frac as used by ptimer_reload?
>>
>>>               rem =3D s->next_event - now;
>>> -            div =3D s->period;
>>> +            div =3D period;
>>>
>>>               clz1 =3D clz64(rem);
>>>               clz2 =3D clz64(div);
>>> @@ -103,13 +129,13 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>>               rem <<=3D shift;
>>>               div <<=3D shift;
>>>               if (shift >=3D 32) {
>>> -                div |=3D ((uint64_t)s->period_frac << (shift - 32));
>>> +                div |=3D ((uint64_t)period_frac << (shift - 32));
>>>               } else {
>>>                   if (shift !=3D 0)
>>> -                    div |=3D (s->period_frac >> (32 - shift));
>>> +                    div |=3D (period_frac >> (32 - shift));
>>>                   /* Look at remaining bits of period_frac and round di=
v
>>> up if
>>>                      necessary.  */
>>> -                if ((uint32_t)(s->period_frac << shift))
>>> +                if ((uint32_t)(period_frac << shift))
>>>                       div +=3D 1;
>>>               }
>>>               counter =3D rem / div;
>>> @@ -181,19 +207,6 @@ void ptimer_set_freq(ptimer_state *s, uint32_t fre=
q)
>>>      count =3D limit.  */
>>>   void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
>>>   {
>>> -    /*
>>> -     * Artificially limit timeout rate to something
>>> -     * achievable under QEMU.  Otherwise, QEMU spends all
>>> -     * its time generating timer interrupts, and there
>>> -     * is no forward progress.
>>> -     * About ten microseconds is the fastest that really works
>>> -     * on the current generation of host machines.
>>> -     */
>>> -
>>> -    if (!use_icount && limit * s->period < 10000 && s->period) {
>>
>>
>> This original rate limiting code is gated on icount, so I think then
>> new way should be the same.
>>
>
> Shoot :) That's second time I'm missing it. Good catch!
>
>
>> Regards,
>> Peter
>>
>>> -        limit =3D 10000 / s->period;
>>> -    }
>>> -
>>>       s->limit =3D limit;
>>>       if (reload)
>>>           s->delta =3D limit;
>>> --
>>> 2.6.4
>>>
>
>
> --
> Dmitry
