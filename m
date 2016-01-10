Received: by 10.25.134.130 with SMTP id i124csp1223737lfd;
        Sat, 9 Jan 2016 16:44:58 -0800 (PST)
X-Received: by 10.55.73.68 with SMTP id w65mr30085400qka.68.1452386698493;
        Sat, 09 Jan 2016 16:44:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i205si95109223qhd.76.2016.01.09.16.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Jan 2016 16:44:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aI47u-000421-54
	for alex.bennee@linaro.org; Sat, 09 Jan 2016 19:44:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aI47r-0003z4-MS
	for qemu-arm@nongnu.org; Sat, 09 Jan 2016 19:44:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aI47q-0004qo-IQ
	for qemu-arm@nongnu.org; Sat, 09 Jan 2016 19:44:55 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:36770)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aI47o-0004mo-6L; Sat, 09 Jan 2016 19:44:52 -0500
Received: by mail-wm0-x242.google.com with SMTP id l65so21120375wmf.3;
	Sat, 09 Jan 2016 16:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=34CRHoavOKjQU8aHKRaEPMZhjrnr3saDUhmmvpE/lWo=;
	b=MimVOJ32jqyS6c/VTQoay/hp/AXnQ2ZO49j4AJVwE3lWb868mAMdcbLMMRK3w/vo5Q
	70i3jhARdm8y2SBTaCJRT9ixYU+e1wUx7nUb5KU+UD9JnIFnSaEJkQk2DHMLvOEgpzLP
	2IrXuU8x696npiW18WTJqisDBimC/ydvIx4/Fv1gdhjT3WVJhd1hu/A2gPR06ZRMca/V
	C3kCfN6K0pHmaMWxnJvWHdGfzEIW/4EyHf7bK6q7YF+bVUTOoNGwkdVX8/Xeq73xjgsj
	6mujRvLuAiRae18afeH3OBj4dPkcufID9hlGoO9zYLZHeBzQB4eHpTMDpWfj6DtJNHlh
	LD6A==
MIME-Version: 1.0
X-Received: by 10.28.216.134 with SMTP id p128mr5629900wmg.59.1452386691494;
	Sat, 09 Jan 2016 16:44:51 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Sat, 9 Jan 2016 16:44:51 -0800 (PST)
In-Reply-To: <9bdf3e1d349c7cfc6d75cc37430fe4f177c20734.1452359845.git.digetx@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
	<9bdf3e1d349c7cfc6d75cc37430fe4f177c20734.1452359845.git.digetx@gmail.com>
Date: Sat, 9 Jan 2016 16:44:51 -0800
Message-ID: <CAPokK=qC77XBkNpHa1y_Dajd9Hv8+a-wx9iqC1dRumeKgvUvaA@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v10 2/7] hw/ptimer: Perform tick and counter
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
X-TUID: d768AETa9voR

On Sat, Jan 9, 2016 at 9:39 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
> ptimer_get_count() might be called while QEMU timer already been expired.
> In that case ptimer would return counter = 0, which might be undesirable
> in case of polled timer. Do counter wrap around for periodic timer to keep
> it distributed. In order to achieve more accurate emulation behaviour of
> certain hardware, don't perform wrap around when in icount mode and return
> counter = 0 in that case (that doesn't affect polled counter distribution).
>
> In addition, there is no reason to keep expired timer tick deferred, so
> just perform the tick from ptimer_get_count().
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  hw/core/ptimer.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index c3d31cb..cf329eb 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -83,14 +83,17 @@ static void ptimer_tick(void *opaque)
>
>  uint64_t ptimer_get_count(ptimer_state *s)
>  {
> -    int64_t now;
> +    int enabled = s->enabled;

You haven't added any additional usages of s->enabled to really
warrant the new local variable, I think it should just stay as
s->enabled to avoid churn.

>      uint64_t counter;
>
> -    if (s->enabled) {
> -        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    if (enabled) {
> +        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        int64_t next = s->next_event;
> +        int expired = (now - next >= 0);

bool.

> +        int oneshot = (enabled == 2);

bool.

Otherwise:

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

> +
>          /* Figure out the current counter value.  */
> -        if (now - s->next_event > 0
> -            || s->period == 0) {
> +        if (s->period == 0 || (expired && (use_icount || oneshot))) {
>              /* Prevent timer underflowing if it should already have
>                 triggered.  */
>              counter = 0;
> @@ -102,7 +105,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
>              uint32_t period_frac = s->period_frac;
>              uint64_t period = s->period;
>
> -            if ((s->enabled == 1) && !use_icount && (s->delta * period < 10000)) {
> +            if (!oneshot && !use_icount && (s->delta * period < 10000)) {
>                  period = 10000 / s->delta;
>                  period_frac = 0;
>              }
> @@ -117,7 +120,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
>                 backwards.
>              */
>
> -            rem = s->next_event - now;
> +            rem = expired ? now - next : next - now;
>              div = period;
>
>              clz1 = clz64(rem);
> @@ -137,6 +140,15 @@ uint64_t ptimer_get_count(ptimer_state *s)
>                      div += 1;
>              }
>              counter = rem / div;
> +
> +            if (expired && (counter != 0)) {
> +                /* Wrap around periodic counter.  */
> +                counter = s->limit - counter % s->limit;
> +            }
> +        }
> +
> +        if (expired) {
> +            ptimer_tick(s);
>          }
>      } else {
>          counter = s->delta;
> --
> 2.6.4
>
