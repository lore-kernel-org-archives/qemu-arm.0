Received: by 10.25.0.23 with SMTP id 23csp157462lfa;
        Mon, 12 Jun 2017 22:28:41 -0700 (PDT)
X-Received: by 10.237.34.233 with SMTP id q38mr29569309qtc.39.1497331721194;
        Mon, 12 Jun 2017 22:28:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497331721; cv=none;
        d=google.com; s=arc-20160816;
        b=BO6N1tiNB3Nnj82GU82a2fZGFY5YiRBX6p0VgM1WblAdx5EX5TleCRyYIw1z+cZp54
         /LyYhGtVB944l//r/EIvPkkJ8tL3AIUW+og4hQKhcXfXqaI7QxMSHklKQ8BYUQSU0YkF
         rHn7MsbHo8p04iiHW4pmi5/UajMR8kAorGH3jTZdciRnWnDzoRmHjnkLdjqwWp+oLWoV
         Ag8gUaFVLRpgTtKHyU5M3QDhvxlJYnXMlzlUfY/dtywFjVY0ugAJ50or4Wk7jR0mfuYJ
         G62fLdTnM3qJGBDirCnYGxitb8MOjdOI0CWc+rksGznEiTlZ0p7Fy+0/0h/r65RykirW
         GmQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=tYcpGH5E7t0yQZxSU74Iw3bmhPXOm8lK5jbRPiGV2x0=;
        b=GQSDqp7LDfb1MhM+66Y/aYvXfCHO/+VT4cnr84oacnuIlynz6LA2rdxb9wauWE9H9g
         psF00qZOK1DOsNLeHxf7RokbU1FECL+cKRSEmc/kPrDhAHGe/G5D5Y3GB1HRs1WKtb8F
         lYaaU2OIKkssiqVVUxBHznXMX1+h4iDzAdSJS3MACxdj372XDB4f+TGiubZjJbMHtsi1
         27iOWvA1CQv8ZQ4lyR51r8EWHkQN8dw6xQJVwFjg6dodIZp4xK1vX0OPgl/Oen3ESfRy
         hIfVIHpU2BJVTKBPGQtN8nl8Xmg0VEdtTb+r/ho1cEuRGk6GQGo2+mgApEekA4ZpcZA1
         MEAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m57si10580318qtf.250.2017.06.12.22.28.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Jun 2017 22:28:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41185 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dKeNa-0001Nb-Dq
	for alex.bennee@linaro.org; Tue, 13 Jun 2017 01:28:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dKeNT-0001Kz-3r
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 01:28:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dKeNP-0006SX-UA
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 01:28:31 -0400
Received: from 9.mo179.mail-out.ovh.net ([46.105.76.148]:37650)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1dKeNP-0006Lo-L0
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 01:28:27 -0400
Received: from player716.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 6C75A4B6CA
	for <qemu-arm@nongnu.org>; Tue, 13 Jun 2017 07:28:17 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
	[90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
	by player716.ha.ovh.net (Postfix) with ESMTPSA id 528A3560075;
	Tue, 13 Jun 2017 07:28:14 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1496739312-32304-1-git-send-email-clg@kaod.org>
	<1496975205.23335.9.camel@aj.id.au>
	<bc98777b-e99d-3b55-3904-8f752a350b6c@kaod.org>
	<1497328676.11158.1.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <037b940c-a387-6d2e-b64b-ce22d1fe3d27@kaod.org>
Date: Tue, 13 Jun 2017 07:28:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1497328676.11158.1.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 8642689163142466368
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrjedvgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.76.148
Subject: Re: [Qemu-arm] [PATCH] timer/aspeed: fix timer enablement when a
 reload is not set
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: spyVofcJlyRx

On 06/13/2017 06:37 AM, Andrew Jeffery wrote:
> On Fri, 2017-06-09 at 07:40 +0200, C=C3=A9dric Le Goater wrote:
>> On 06/09/2017 04:26 AM, Andrew Jeffery wrote:
>>> On Tue, 2017-06-06 at 10:55 +0200, C=C3=A9dric Le Goater wrote:
>>>> When a timer is enabled before a reload value is set, the controller
>>>> waits for a reload value to be set before starting decrementing. Thi=
s
>>>> fix tries to cover that case by changing the timer expiry only when
>>>> a reload value is valid.
>>>>
>>>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>>>
>>>> ---
>>>>  hw/timer/aspeed_timer.c | 37 +++++++++++++++++++++++++++++--------
>>>>  1 file changed, 29 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
>>>> index 9b70ee09b07f..50acbf530a3a 100644
>>>> --- a/hw/timer/aspeed_timer.c
>>>> +++ b/hw/timer/aspeed_timer.c
>>>> @@ -130,15 +130,26 @@ static uint64_t calculate_next(struct AspeedTi=
mer *t)
>>>>              next =3D seq[1];
>>>>          } else if (now < seq[2]) {
>>>>              next =3D seq[2];
>>>> -        } else {
>>>> +        } else if (t->reload) {
>>>>              reload_ns =3D muldiv64(t->reload, NANOSECONDS_PER_SECON=
D, rate);
>>>>              t->start =3D now - ((now - t->start) % reload_ns);
>>>> +        } else {
>>>> +            /* no reload value, return 0 */
>>>> +            break;
>>>>          }
>>>>      }
>>>> =20
>>>>      return next;
>>>>  }
>>>> =20
>>>> +static void aspeed_timer_mod(AspeedTimer *t)
>>>> +{
>>>> +    uint64_t next =3D calculate_next(t);
>>>> +    if (next) {
>>>> +        timer_mod(&t->timer, next);
>>>> +    }
>>>> +}
>>>> +
>>>>  static void aspeed_timer_expire(void *opaque)
>>>>  {
>>>>      AspeedTimer *t =3D opaque;
>>>> @@ -164,7 +175,7 @@ static void aspeed_timer_expire(void *opaque)
>>>>          qemu_set_irq(t->irq, t->level);
>>>>      }
>>>> =20
>>>> -    timer_mod(&t->timer, calculate_next(t));
>>>> +    aspeed_timer_mod(t);
>>>>  }
>>>> =20
>>>>  static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
>>>> @@ -227,10 +238,23 @@ static void aspeed_timer_set_value(AspeedTimer=
CtrlState *s, int timer, int reg,
>>>>                                     uint32_t value)
>>>>  {
>>>>      AspeedTimer *t;
>>>> +    uint32_t old_reload;
>>>> =20
>>>>      trace_aspeed_timer_set_value(timer, reg, value);
>>>>      t =3D &s->timers[timer];
>>>>      switch (reg) {
>>>> +    case TIMER_REG_RELOAD:
>>>> +        old_reload =3D t->reload;
>>>> +        t->reload =3D value;
>>>> +
>>>> +        /* If the reload value was not previously set, or zero, and
>>>> +         * the current value is valid, try to start the timer if it=
 is
>>>> +         * enabled.
>>>> +         */
>>>> +        if (old_reload || !t->reload) {
>>>> +            break;
>>>> +        }
>>>
>>> Maybe I need more caffeine, but I initially struggled to reconcile th=
e
>>> condition with the comment, as the condition checks the inverse in
>>> order to break while the comment discusses the non-breaking case.=20
>>
>> I agree. The reload "value" is used in a hidden way to the activate th=
e=20
>> timer.
>>
>>> However, after trying for several minutes, I'm not sure there's an ea=
sy
>>> way to improve it.
>>
>> I tried a few things. May be, we could move the following code in=20
>> its own routine and call it twice ?=20
>=20
> I don't think it's necessary. The comment serves as enough warning - it
> should at least make people think before modifying the code.

OK. Let it be.


Peter,=20

The Moxa Art timer driver was recently merged into the Faraday=20
FTTMR010 driver and the initial setup is slightly different,=20
it enables the timer before setting the reload value, which=20
breaks the current QEMU model.

Thanks,

C.=20


> Cheers,
>=20
> Andrew
>=20
>> =20
>>>> +
>>>>      case TIMER_REG_STATUS:
>>>>          if (timer_enabled(t)) {
>>>>              uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>>> @@ -238,17 +262,14 @@ static void aspeed_timer_set_value(AspeedTimer=
CtrlState *s, int timer, int reg,
>>>>              uint32_t rate =3D calculate_rate(t);
>>>> =20
>>>>              t->start +=3D muldiv64(delta, NANOSECONDS_PER_SECOND, r=
ate);
>>>> -            timer_mod(&t->timer, calculate_next(t));
>>>> +            aspeed_timer_mod(t);
>>>>          }
>>>>          break;
>>>> -    case TIMER_REG_RELOAD:
>>>> -        t->reload =3D value;
>>>> -        break;
>>>>      case TIMER_REG_MATCH_FIRST:
>>>>      case TIMER_REG_MATCH_SECOND:
>>>>          t->match[reg - 2] =3D value;
>>>>          if (timer_enabled(t)) {
>>>> -            timer_mod(&t->timer, calculate_next(t));
>>>> +            aspeed_timer_mod(t);
>>>>          }
>>>>          break;
>>>>      default:
>>>> @@ -268,7 +289,7 @@ static void aspeed_timer_ctrl_enable(AspeedTimer=
 *t, bool enable)
>>>>      trace_aspeed_timer_ctrl_enable(t->id, enable);
>>>>      if (enable) {
>>>>          t->start =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>>> -        timer_mod(&t->timer, calculate_next(t));
>>>> +        aspeed_timer_mod(t);
>>>>      } else {
>>>>          timer_del(&t->timer);
>>>>      }
>>>
>>> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>>
>> Thanks,
>>
>> C.

