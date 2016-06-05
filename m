Received: by 10.25.27.66 with SMTP id b63csp1139215lfb;
        Sun, 5 Jun 2016 10:22:54 -0700 (PDT)
X-Received: by 10.140.20.241 with SMTP id 104mr12055247qgj.32.1465147374280;
        Sun, 05 Jun 2016 10:22:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i65si8644004qkf.224.2016.06.05.10.22.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 Jun 2016 10:22:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9blF-0007jo-MY
	for alex.bennee@linaro.org; Sun, 05 Jun 2016 13:22:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1b9blB-0007gS-Ab
	for qemu-arm@nongnu.org; Sun, 05 Jun 2016 13:22:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1b9bl6-0006c5-7F
	for qemu-arm@nongnu.org; Sun, 05 Jun 2016 13:22:48 -0400
Received: from mo68.mail-out.ovh.net ([178.32.228.68]:57824)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1b9bl5-0006aM-TC
	for qemu-arm@nongnu.org; Sun, 05 Jun 2016 13:22:44 -0400
Received: from player695.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 96D991000CB1
	for <qemu-arm@nongnu.org>; Sun,  5 Jun 2016 19:22:39 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player695.ha.ovh.net (Postfix) with ESMTPSA id A5BEC460082;
	Sun,  5 Jun 2016 19:22:34 +0200 (CEST)
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <1464325706-11221-1-git-send-email-andrew@aj.id.au>
	<CACPK8Xc+RiHa44sS7jSA=4JTWWmO0iTqb-Q4MEqk-5u6iWfXug@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <57545FDA.4020402@kaod.org>
Date: Sun, 5 Jun 2016 19:22:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xc+RiHa44sS7jSA=4JTWWmO0iTqb-Q4MEqk-5u6iWfXug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 6908240355063532464
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrieejgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.228.68
Subject: Re: [Qemu-arm] [PATCH] hw/timer: Add value matching support to
 aspeed_timer
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ViQ4D7yeF/3r

On 06/05/2016 06:20 PM, Joel Stanley wrote:
> On Fri, May 27, 2016 at 12:08 AM, Andrew Jeffery <andrew@aj.id.au> wrot=
e:
>> Value matching allows Linux to boot with CONFIG_NO_HZ_IDLE=3Dy on the
>> palmetto-bmc machine. Two match registers are provided for each timer.
>=20
> Thanks for doing this. We now boot faster in my testing.
>=20
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>=20
> Acked-by: Joel Stanley <joel@jms.id.au>

Yes. I should have mentioned it also. This is a must have for the SMC=20
patches (soon to come) which let us boot directly for the OpenBMC flash=20
images.

Acked-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks

C.
=20
>> ---
>>
>> The change pulls out ptimer in favour of the regular timer infrastruct=
ure. As a
>> consequence it implements the conversions between ticks and time which=
 feels a
>> little tedious. Any comments there would be appreciated.
>>
>>  hw/timer/aspeed_timer.c         | 135 ++++++++++++++++++++++++++++++-=
---------
>>  include/hw/timer/aspeed_timer.h |   6 +-
>>  2 files changed, 105 insertions(+), 36 deletions(-)
>>
>> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
>> index 4b94808821b4..905de0f788b2 100644
>> --- a/hw/timer/aspeed_timer.c
>> +++ b/hw/timer/aspeed_timer.c
>> @@ -9,13 +9,12 @@
>>   * the COPYING file in the top-level directory.
>>   */
>>
>> +#include <math.h>
>>  #include "qemu/osdep.h"
>> -#include "hw/ptimer.h"
>>  #include "hw/sysbus.h"
>>  #include "hw/timer/aspeed_timer.h"
>>  #include "qemu-common.h"
>>  #include "qemu/bitops.h"
>> -#include "qemu/main-loop.h"
>>  #include "qemu/timer.h"
>>  #include "qemu/log.h"
>>  #include "trace.h"
>> @@ -77,21 +76,99 @@ static inline bool timer_can_pulse(AspeedTimer *t)
>>      return t->id >=3D TIMER_FIRST_CAP_PULSE;
>>  }
>>
>> +static inline bool timer_external_clock(AspeedTimer *t)
>> +{
>> +    return timer_ctrl_status(t, op_external_clock);
>> +}
>> +
>> +static double clock_rates[] =3D { TIMER_CLOCK_APB_HZ, TIMER_CLOCK_EXT=
_HZ };
>> +
>> +static inline double calculate_rate(struct AspeedTimer *t)
>> +{
>> +    return clock_rates[timer_external_clock(t)];
>> +}
>> +
>> +static inline double calculate_period(struct AspeedTimer *t)
>> +{
>> +    return NANOSECONDS_PER_SECOND / calculate_rate(t);
>> +}
>> +
>> +static inline uint32_t calculate_ticks(struct AspeedTimer *t, uint64_=
t now_ns)
>> +{
>> +    uint64_t delta_ns =3D now_ns - MIN(now_ns, t->start);
>> +    uint32_t ticks =3D (uint32_t) floor(delta_ns / calculate_period(t=
));
>> +
>> +    return t->reload - MIN(t->reload, ticks);
>> +}
>> +
>> +static inline uint64_t calculate_time(struct AspeedTimer *t, uint32_t=
 ticks)
>> +{
>> +    uint64_t delta_ns;
>> +
>> +    ticks =3D MIN(t->reload, ticks);
>> +    delta_ns =3D (uint64_t) floor((t->reload - ticks) * calculate_per=
iod(t));
>> +
>> +    return t->start + delta_ns;
>> +}
>> +
>> +static uint64_t calculate_next(struct AspeedTimer *t)
>> +{
>> +    uint64_t now;
>> +    uint64_t next;
>> +    int i;
>> +    /* We don't know the relationship between the values in the match
>> +     * registers, so sort using MAX/MIN/zero. We sort in that order a=
s the
>> +     * timer counts down to zero. */
>> +    uint64_t seq[] =3D {
>> +        MAX(t->match[0], t->match[1]),
>> +        MIN(t->match[0], t->match[1]),
>> +        0,
>> +    };
>> +
>> +    now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +    for (i =3D 0; i < ARRAY_SIZE(seq); i++) {
>> +        next =3D calculate_time(t, seq[i]);
>> +        if (now < next) {
>> +            return next;
>> +        }
>> +    }
>> +
>> +    {
>> +        uint64_t reload_ns;
>> +
>> +        reload_ns =3D (uint64_t) floor(t->reload * calculate_period(t=
));
>> +        t->start =3D now - ((now - t->start) % reload_ns);
>> +    }
>> +
>> +    return calculate_next(t);
>> +}
>> +
>>  static void aspeed_timer_expire(void *opaque)
>>  {
>>      AspeedTimer *t =3D opaque;
>> +    bool interrupt =3D false;
>> +    uint32_t ticks;
>>
>> -    /* Only support interrupts on match values of zero for the moment=
 - this is
>> -     * sufficient to boot an aspeed_defconfig Linux kernel.
>> -     *
>> -     * TODO: matching on arbitrary values (see e.g. hw/timer/a9gtimer=
.c)
>> -     */
>> -    bool match =3D !(t->match[0] && t->match[1]);
>> -    bool interrupt =3D timer_overflow_interrupt(t) || match;
>> -    if (timer_enabled(t) && interrupt) {
>> +    if (!timer_enabled(t)) {
>> +        return;
>> +    }
>> +
>> +    ticks =3D calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL=
));
>> +
>> +    if (!ticks) {
>> +        interrupt =3D timer_overflow_interrupt(t) || !t->match[0] || =
!t->match[1];
>> +    } else if (ticks <=3D MIN(t->match[0], t->match[1])) {
>> +        interrupt =3D true;
>> +    } else if (ticks <=3D MAX(t->match[0], t->match[1])) {
>> +        interrupt =3D true;
>> +    }
>> +
>> +    if (interrupt) {
>>          t->level =3D !t->level;
>>          qemu_set_irq(t->irq, t->level);
>>      }
>> +
>> +    timer_mod(&t->timer, calculate_next(t));
>>  }
>>
>>  static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
>> @@ -100,7 +177,7 @@ static uint64_t aspeed_timer_get_value(AspeedTimer=
 *t, int reg)
>>
>>      switch (reg) {
>>      case TIMER_REG_STATUS:
>> -        value =3D ptimer_get_count(t->timer);
>> +        value =3D calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIR=
TUAL));
>>          break;
>>      case TIMER_REG_RELOAD:
>>          value =3D t->reload;
>> @@ -160,24 +237,21 @@ static void aspeed_timer_set_value(AspeedTimerCt=
rlState *s, int timer, int reg,
>>      switch (reg) {
>>      case TIMER_REG_STATUS:
>>          if (timer_enabled(t)) {
>> -            ptimer_set_count(t->timer, value);
>> +            uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +            int64_t delta =3D (int64_t) value - (int64_t) calculate_t=
icks(t, now);
>> +
>> +            t->start +=3D delta * calculate_period(t);
>> +            timer_mod(&t->timer, calculate_next(t));
>>          }
>>          break;
>>      case TIMER_REG_RELOAD:
>>          t->reload =3D value;
>> -        ptimer_set_limit(t->timer, value, 1);
>>          break;
>>      case TIMER_REG_MATCH_FIRST:
>>      case TIMER_REG_MATCH_SECOND:
>> -        if (value) {
>> -            /* Non-zero match values are unsupported. As such an inte=
rrupt will
>> -             * always be triggered when the timer reaches zero even i=
f the
>> -             * overflow interrupt control bit is clear.
>> -             */
>> -            qemu_log_mask(LOG_UNIMP, "%s: Match value unsupported by =
device: "
>> -                    "0x%" PRIx32 "\n", __func__, value);
>> -        } else {
>> -            t->match[reg - 2] =3D value;
>> +        t->match[reg - 2] =3D value;
>> +        if (timer_enabled(t)) {
>> +            timer_mod(&t->timer, calculate_next(t));
>>          }
>>          break;
>>      default:
>> @@ -196,21 +270,16 @@ static void aspeed_timer_ctrl_enable(AspeedTimer=
 *t, bool enable)
>>  {
>>      trace_aspeed_timer_ctrl_enable(t->id, enable);
>>      if (enable) {
>> -        ptimer_run(t->timer, 0);
>> +        t->start =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> +        timer_mod(&t->timer, calculate_next(t));
>>      } else {
>> -        ptimer_stop(t->timer);
>> -        ptimer_set_limit(t->timer, t->reload, 1);
>> +        timer_del(&t->timer);
>>      }
>>  }
>>
>>  static void aspeed_timer_ctrl_external_clock(AspeedTimer *t, bool ena=
ble)
>>  {
>>      trace_aspeed_timer_ctrl_external_clock(t->id, enable);
>> -    if (enable) {
>> -        ptimer_set_freq(t->timer, TIMER_CLOCK_EXT_HZ);
>> -    } else {
>> -        ptimer_set_freq(t->timer, TIMER_CLOCK_APB_HZ);
>> -    }
>>  }
>>
>>  static void aspeed_timer_ctrl_overflow_interrupt(AspeedTimer *t, bool=
 enable)
>> @@ -351,12 +420,10 @@ static const MemoryRegionOps aspeed_timer_ops =3D=
 {
>>
>>  static void aspeed_init_one_timer(AspeedTimerCtrlState *s, uint8_t id=
)
>>  {
>> -    QEMUBH *bh;
>>      AspeedTimer *t =3D &s->timers[id];
>>
>>      t->id =3D id;
>> -    bh =3D qemu_bh_new(aspeed_timer_expire, t);
>> -    t->timer =3D ptimer_init(bh);
>> +    timer_init_ns(&t->timer, QEMU_CLOCK_VIRTUAL, aspeed_timer_expire,=
 t);
>>  }
>>
>>  static void aspeed_timer_realize(DeviceState *dev, Error **errp)
>> @@ -404,7 +471,7 @@ static const VMStateDescription vmstate_aspeed_tim=
er =3D {
>>      .fields =3D (VMStateField[]) {
>>          VMSTATE_UINT8(id, AspeedTimer),
>>          VMSTATE_INT32(level, AspeedTimer),
>> -        VMSTATE_PTIMER(timer, AspeedTimer),
>> +        VMSTATE_TIMER(timer, AspeedTimer),
>>          VMSTATE_UINT32(reload, AspeedTimer),
>>          VMSTATE_UINT32_ARRAY(match, AspeedTimer, 2),
>>          VMSTATE_END_OF_LIST()
>> diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed=
_timer.h
>> index 44dc2f89d5c6..970fea83143c 100644
>> --- a/include/hw/timer/aspeed_timer.h
>> +++ b/include/hw/timer/aspeed_timer.h
>> @@ -22,7 +22,8 @@
>>  #ifndef ASPEED_TIMER_H
>>  #define ASPEED_TIMER_H
>>
>> -#include "hw/ptimer.h"
>> +#include "qemu/typedefs.h"
>> +#include "qemu/timer.h"
>>
>>  #define ASPEED_TIMER(obj) \
>>      OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
>> @@ -33,15 +34,16 @@ typedef struct AspeedTimer {
>>      qemu_irq irq;
>>
>>      uint8_t id;
>> +    QEMUTimer timer;
>>
>>      /**
>>       * Track the line level as the ASPEED timers implement edge trigg=
ered
>>       * interrupts, signalling with both the rising and falling edge.
>>       */
>>      int32_t level;
>> -    ptimer_state *timer;
>>      uint32_t reload;
>>      uint32_t match[2];
>> +    uint64_t start;
>>  } AspeedTimer;
>>
>>  typedef struct AspeedTimerCtrlState {
>> --
>> 2.7.4
>>

