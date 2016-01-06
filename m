Received: by 10.182.158.201 with SMTP id ww9csp11790440obb;
        Wed, 6 Jan 2016 05:59:47 -0800 (PST)
X-Received: by 10.140.43.199 with SMTP id e65mr128321383qga.102.1452088787494;
        Wed, 06 Jan 2016 05:59:47 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v140si41273170qka.56.2016.01.06.05.59.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 05:59:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGoct-0000eH-6U
	for alex.bennee@linaro.org; Wed, 06 Jan 2016 08:59:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGocO-0000Cf-1a
	for qemu-devel@nongnu.org; Wed, 06 Jan 2016 08:59:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGocM-00031r-Rw
	for qemu-devel@nongnu.org; Wed, 06 Jan 2016 08:59:15 -0500
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:38504)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aGocM-00031n-Is; Wed, 06 Jan 2016 08:59:14 -0500
Received: by mail-wm0-x230.google.com with SMTP id b14so76617940wmb.1;
	Wed, 06 Jan 2016 05:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=qUncrKLEGqgoJPyEKDyAtGyYTPtiYh0JQxYRAV3NZxI=;
	b=D2+RRk18gy9ms0kJeic6PRo1bjTGPOyWUY8rGw/iwifdHr/yvHvzSxZPLH+mFpI+k0
	rNw1BsYdIGTS9hdpHLl67tr3rtxvcloltAbxo0r3Wii+f+n95NpAbr4mnEBMTH3ug46q
	FgNivtkuGpWFP1xi2uyr2QJtaX3NsLGJ+MxbKLj/nbKwm7EFxSfUuMdVfm2XrNI1yAJ2
	idGPfccY2F73gwjmOx0EMtJvG3ae59/CrqbgtBeoXEugmxt5REPTUkTE/RV/v0ixsV+5
	5NNXM+42L7B/LLZXXRP2N6t+T1cFkYF6ozqVi80MrQ8woTwevdAbtfGuYl6QpF9Ey+TL
	S1Nw==
MIME-Version: 1.0
X-Received: by 10.194.112.130 with SMTP id iq2mr94690557wjb.102.1452088753964; 
	Wed, 06 Jan 2016 05:59:13 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Wed, 6 Jan 2016 05:59:13 -0800 (PST)
In-Reply-To: <568D12A7.3010304@gmail.com>
References: <cover.1451960508.git.digetx@gmail.com>
	<004073b3af0a56899f9a07e3f6b00167359322e6.1451960508.git.digetx@gmail.com>
	<20160106121711.GC4227@pcrost-box> <568D12A7.3010304@gmail.com>
Date: Wed, 6 Jan 2016 05:59:13 -0800
Message-ID: <CAPokK=pSmKDdZuinYKiHur=b2hV8WFuN5AO+mB_jQByyQLSgGw@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::230
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v8 2/4] hw/ptimer: Perform tick and counter
 wrap around if timer already expired
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
X-TUID: nGqXvEuDYnSL

On Wed, Jan 6, 2016 at 5:12 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
> 06.01.2016 15:17, Peter Crosthwaite =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>
>> On Tue, Jan 05, 2016 at 05:33:27AM +0300, Dmitry Osipenko wrote:
>>>
>>> ptimer_get_count() might be called while QEMU timer already been expire=
d.
>>> In that case ptimer would return counter =3D 0, which might be undesira=
ble
>>> in case of polled timer. Do counter wrap around for periodic timer to
>>> keep
>>> it distributed.
>>>
>>> In addition, there is no reason to keep expired timer tick deferred, so
>>> just perform the tick from ptimer_get_count().
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>   hw/core/ptimer.c | 35 +++++++++++++++++++++++++++++------
>>>   1 file changed, 29 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
>>> index 035af97..96a6c7a 100644
>>> --- a/hw/core/ptimer.c
>>> +++ b/hw/core/ptimer.c
>>> @@ -85,15 +85,21 @@ static void ptimer_tick(void *opaque)
>>>
>>>   uint64_t ptimer_get_count(ptimer_state *s)
>>>   {
>>> +    int enabled =3D s->enabled;
>>
>>
>> Variable localisation not needed.
>>
>>>       int64_t now;
>>> +    int64_t next;
>>>       uint64_t counter;
>>> +    int expired;
>>> +    int oneshot;
>>
>>
>> Variable defs can be localised to the if (enabled) (even though now
>> in original code doesn't do that).
>>
>
> Yeah, I just tried to keep original style here.
>
>>>
>>> -    if (s->enabled) {
>>> +    if (enabled) {
>>>           now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>> +        next =3D s->next_event;
>>> +        expired =3D (now - next >=3D 0);
>>> +        oneshot =3D (enabled =3D=3D 2);
>>>           /* Figure out the current counter value.  */
>>
>>
>> This comment is now out of place.
>>
>
> Okay, will fix it.
>
>
>>> -        if (now - s->next_event > 0
>>> -            || s->period =3D=3D 0) {
>>> -            /* Prevent timer underflowing if it should already have
>>> +        if (s->period =3D=3D 0 || (expired && oneshot)) {
>>> +            /* Prevent one-shot timer underflowing if it should alread=
y
>>> have
>>>                  triggered.  */
>>>               counter =3D 0;
>>>           } else {
>>> @@ -114,12 +120,12 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>>                  backwards.
>>>               */
>>>
>>> -            if ((s->enabled =3D=3D 1) && (s->limit * period < 10000)) =
{
>>> +            if (!oneshot && (s->limit * period < 10000)) {
>>>                   period =3D 10000 / s->limit;
>>>                   period_frac =3D 0;
>>>               }
>>>
>>> -            rem =3D s->next_event - now;
>>> +            rem =3D expired ? now - next : next - now;
>>>               div =3D period;
>>>
>>>               clz1 =3D clz64(rem);
>>> @@ -139,6 +145,23 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>>                       div +=3D 1;
>>>               }
>>>               counter =3D rem / div;
>>> +
>>> +            if (expired) {
>>> +                /* Wrap around periodic counter.  */
>>> +                counter =3D s->delta =3D s->limit - counter % s->limit=
;
>>
>>
>> Why do you update the delta here?
>>
>
> Because we would want to schedule next tick based on current wrapped arou=
nd
> counter value and not some arbitrary delta.
>

So looking at ptimer_reload(), the new schedule is done relative to
the VM clock of the when the tick was expected to hit, not the current
time. But this new delta is going to be relative to the now time and
then used to update the next tick which will happen relative to
next_event. Unless you stop or scale the timer, I don't think you need
to do delta manipulation?

>> Also can you just get ptimer_reload to do the modulo math for you? If th=
e
>> timer is !oneshot and expired, then you call ptimer_reload anyway,
>> which will update next_event. When the expired test returns false
>> you can just reliably use the original logic involving now and next.
>>
>
> Yes, that's what I changed in V9. Have you received it?
>
> https://lists.nongnu.org/archive/html/qemu-devel/2016-01/msg00272.html
>

Just had a look.

V9 still has the modulo I think?:

+            if (expired && (counter !=3D 0)) {
+                /* Wrap around periodic counter.  */
+                counter =3D s->delta =3D s->limit - counter % s->limit;
+            }

Regards,
Peter

>>> +            }
>>> +        }
>>> +
>>> +        if (expired) {
>>> +            if (oneshot) {
>>
>>
>> This if-else has a lot of common structure with the one above. I think
>> they could be merged.
>>
>
> That's a good suggestion, will do it in V10. Thanks.
>
>
>> Regards,
>> Peter
>>
>>> +                ptimer_tick(s);
>>> +            } else {
>>> +                /* Don't use ptimer_tick() for the periodic timer sinc=
e
>>> it
>>> +                 * would reset the delta value.
>>> +                 */
>>> +                ptimer_trigger(s);
>>> +                ptimer_reload(s);
>>> +            }
>>>           }
>>>       } else {
>>>           counter =3D s->delta;
>>> --
>>> 2.6.4
>>>
>
>
> --
> Dmitry
