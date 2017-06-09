Received: by 10.25.0.23 with SMTP id 23csp2900045lfa;
        Thu, 8 Jun 2017 22:54:01 -0700 (PDT)
X-Received: by 10.55.89.4 with SMTP id n4mr51373167qkb.194.1496987640924;
        Thu, 08 Jun 2017 22:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496987640; cv=none;
        d=google.com; s=arc-20160816;
        b=j0VAYXnZsa4U9e0NzRPXaW+nSxeBQsmKkg4EtNVf+kZyIeaVaEpmcMA4tpVfhXZtUS
         /mYk4gSaG9McJ4nxiEzP4CjWj0/ZMEnE95rAEh0573dpsi1Rr1n3TcGRJkziOtKccP+Y
         S8swYOr/BhqtIqYWRy6eK0rdw5V53l+3xQP7pDGMCHDMOKtU2UYKrxq+CpdVjGfMfLZk
         r5inBz08lhQtHVwfVbBxYiwMDmHW8GCyNd3ly7kR8Otc6WpwlPqZI4SPCyAUHLAqSk34
         aL91Ip1pkIbrX88HXOoT3I1nBc3IDD2rWL60jfxKZBkF8GrVOwPXFYV3mSKqZuYu/cPb
         ubOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=T1gq78zDE8mfuUeM9qeIAezSJZYoKlUKt6ToxgF1R8c=;
        b=eU30GwtOUhTCwRatiUaJsmbH2qCImTzrj2g5BUYhye+ynbuIbNSyfC8OJPDNfK+BV4
         z5oxyppD4KrKrXaBibTZN1C5W2MKeFgGA7p5GDMjHFV/JNyk0bFxRzsX9XkPkC2QF7hf
         7YwbpdrlI4rOwpMC7jDT+lxxiLCVdvf3Cry8F+1stY8w/fy1ApNg42QRFU6IGa3JmroJ
         d1/+Lzav+ioqUtYLt8clpraQFC2R+N5lhNfgFq34BRUmHcyPXFu4KddIc6n+4ukUE1bR
         rxBIuTGuQIqJFa7ntLMEred0yMgEPGCPv6kGr/9S2rvaSMsJf7JxcSoxSMp8DMS7v3sJ
         G1jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a20si121442qth.97.2017.06.08.22.54.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Jun 2017 22:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52805 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dJCru-0003di-DQ
	for alex.bennee@linaro.org; Fri, 09 Jun 2017 01:53:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dJCew-0000ad-Db
	for qemu-devel@nongnu.org; Fri, 09 Jun 2017 01:40:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dJCet-0002zp-7x
	for qemu-devel@nongnu.org; Fri, 09 Jun 2017 01:40:34 -0400
Received: from 10.mo6.mail-out.ovh.net ([87.98.157.236]:37530)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1dJCet-0002zZ-0w
	for qemu-devel@nongnu.org; Fri, 09 Jun 2017 01:40:31 -0400
Received: from player787.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id E62B9E2DD4
	for <qemu-devel@nongnu.org>; Fri,  9 Jun 2017 07:40:27 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
	[90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
	by player787.ha.ovh.net (Postfix) with ESMTPSA id 5E2B2600072;
	Fri,  9 Jun 2017 07:40:24 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1496739312-32304-1-git-send-email-clg@kaod.org>
	<1496975205.23335.9.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <bc98777b-e99d-3b55-3904-8f752a350b6c@kaod.org>
Date: Fri, 9 Jun 2017 07:40:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1496975205.23335.9.camel@aj.id.au>
Content-Type: text/plain; charset=windows-1252
X-Ovh-Tracer-Id: 3804134311477873472
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrieeggddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.157.236
Subject: Re: [Qemu-devel] [PATCH] timer/aspeed: fix timer enablement when a
 reload is not set
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 33oHooAmUUY1

On 06/09/2017 04:26 AM, Andrew Jeffery wrote:
> On Tue, 2017-06-06 at 10:55 +0200, C=E9dric Le Goater wrote:
>> When a timer is enabled before a reload value is set, the controller
>> waits for a reload value to be set before starting decrementing. This
>> fix tries to cover that case by changing the timer expiry only when
>> a reload value is valid.
>>
>>> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/timer/aspeed_timer.c | 37 +++++++++++++++++++++++++++++--------
>>  1 file changed, 29 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
>> index 9b70ee09b07f..50acbf530a3a 100644
>> --- a/hw/timer/aspeed_timer.c
>> +++ b/hw/timer/aspeed_timer.c
>> @@ -130,15 +130,26 @@ static uint64_t calculate_next(struct AspeedTime=
r *t)
>>              next =3D seq[1];
>>          } else if (now < seq[2]) {
>>              next =3D seq[2];
>> -        } else {
>> +        } else if (t->reload) {
>>              reload_ns =3D muldiv64(t->reload, NANOSECONDS_PER_SECOND,=
 rate);
>>              t->start =3D now - ((now - t->start) % reload_ns);
>> +        } else {
>> +            /* no reload value, return 0 */
>> +            break;
>>          }
>>      }
>> =20
>>      return next;
>>  }
>> =20
>> +static void aspeed_timer_mod(AspeedTimer *t)
>> +{
>> +    uint64_t next =3D calculate_next(t);
>> +    if (next) {
>> +        timer_mod(&t->timer, next);
>> +    }
>> +}
>> +
>>  static void aspeed_timer_expire(void *opaque)
>>  {
>>      AspeedTimer *t =3D opaque;
>> @@ -164,7 +175,7 @@ static void aspeed_timer_expire(void *opaque)
>>          qemu_set_irq(t->irq, t->level);
>>      }
>> =20
>> -    timer_mod(&t->timer, calculate_next(t));
>> +    aspeed_timer_mod(t);
>>  }
>> =20
>>  static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
>> @@ -227,10 +238,23 @@ static void aspeed_timer_set_value(AspeedTimerCt=
rlState *s, int timer, int reg,
>>                                     uint32_t value)
>>  {
>>      AspeedTimer *t;
>> +    uint32_t old_reload;
>> =20
>>      trace_aspeed_timer_set_value(timer, reg, value);
>>      t =3D &s->timers[timer];
>>      switch (reg) {
>> +    case TIMER_REG_RELOAD:
>> +        old_reload =3D t->reload;
>> +        t->reload =3D value;
>> +
>> +        /* If the reload value was not previously set, or zero, and
>> +         * the current value is valid, try to start the timer if it i=
s
>> +         * enabled.
>> +         */
>> +        if (old_reload || !t->reload) {
>> +            break;
>> +        }
>=20
> Maybe I need more caffeine, but I initially struggled to reconcile the
> condition with the comment, as the condition checks the inverse in
> order to break while the comment discusses the non-breaking case.=20

I agree. The reload "value" is used in a hidden way to the activate the=20
timer.

> However, after trying for several minutes, I'm not sure there's an easy
> way to improve it.

I tried a few things. May be, we could move the following code in=20
its own routine and call it twice ?=20
=20
>> +
>>      case TIMER_REG_STATUS:
>>          if (timer_enabled(t)) {
>>              uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> @@ -238,17 +262,14 @@ static void aspeed_timer_set_value(AspeedTimerCt=
rlState *s, int timer, int reg,
>>              uint32_t rate =3D calculate_rate(t);
>> =20
>>              t->start +=3D muldiv64(delta, NANOSECONDS_PER_SECOND, rat=
e);
>> -            timer_mod(&t->timer, calculate_next(t));
>> +            aspeed_timer_mod(t);
>>          }
>>          break;
>> -    case TIMER_REG_RELOAD:
>> -        t->reload =3D value;
>> -        break;
>>      case TIMER_REG_MATCH_FIRST:
>>      case TIMER_REG_MATCH_SECOND:
>>          t->match[reg - 2] =3D value;
>>          if (timer_enabled(t)) {
>> -            timer_mod(&t->timer, calculate_next(t));
>> +            aspeed_timer_mod(t);
>>          }
>>          break;
>>      default:
>> @@ -268,7 +289,7 @@ static void aspeed_timer_ctrl_enable(AspeedTimer *=
t, bool enable)
>>      trace_aspeed_timer_ctrl_enable(t->id, enable);
>>      if (enable) {
>>          t->start =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> -        timer_mod(&t->timer, calculate_next(t));
>> +        aspeed_timer_mod(t);
>>      } else {
>>          timer_del(&t->timer);
>>      }
>=20
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks,

C.
