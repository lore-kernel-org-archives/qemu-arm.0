Received: by 10.182.158.201 with SMTP id ww9csp11737953obb;
        Wed, 6 Jan 2016 04:17:36 -0800 (PST)
X-Received: by 10.55.81.87 with SMTP id f84mr27906127qkb.10.1452082656751;
        Wed, 06 Jan 2016 04:17:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e67si98935597qkb.67.2016.01.06.04.17.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 04:17:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGn20-0003xy-BH
	for alex.bennee@linaro.org; Wed, 06 Jan 2016 07:17:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGn1x-0003wG-VH
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 07:17:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGn1x-00031E-0B
	for qemu-arm@nongnu.org; Wed, 06 Jan 2016 07:17:33 -0500
Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236]:34679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aGn1q-00030c-Ll; Wed, 06 Jan 2016 07:17:26 -0500
Received: by mail-pf0-x236.google.com with SMTP id e65so185188727pfe.1;
	Wed, 06 Jan 2016 04:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qKko3XmiV3XQThOtW+bjzDVOeTpwInoeIeCdaHiX8Q0=;
	b=IUtEL6WyOI5Llv38qzTt1i1QMTdUiTX+VB80ppGbqcCKQyTZ7NoRaTYRLSGKEFNEh6
	bcbl/BVyJiZXadkqTezQ1yTPvXlmLZ4SPEHmgTdLPVWs3sJ1YSlqIh8rtDxhVZhUrTjI
	eC6ZWGNDE669c1DxZw9bnz/hHjN5BoMvsv0uN+AShIHT1tyrN8eIdJDmiYOn1mI8NUhN
	MTqzbrYV2hiEumXSqcQw4vKx1JWCGAMjWWh26XOEFvxIOXl+wDCBkXE92DQVU/uq8Gca
	QIFa4OhVYtYW1HD8cTBCQoH0VyLQA2OMyOvZfbd5SXVwM8jG8M7zsQ04yrKsBMssOmgJ
	L2Iw==
X-Received: by 10.98.0.133 with SMTP id 127mr84866176pfa.76.1452082646053;
	Wed, 06 Jan 2016 04:17:26 -0800 (PST)
Received: from pcrost-box (pa49-197-174-152.pa.qld.optusnet.com.au.
	[49.197.174.152]) by smtp.gmail.com with ESMTPSA id
	w85sm91644491pfi.36.2016.01.06.04.17.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jan 2016 04:17:24 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 6 Jan 2016 04:17:11 -0800
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20160106121711.GC4227@pcrost-box>
References: <cover.1451960508.git.digetx@gmail.com>
	<004073b3af0a56899f9a07e3f6b00167359322e6.1451960508.git.digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <004073b3af0a56899f9a07e3f6b00167359322e6.1451960508.git.digetx@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::236
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
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
X-TUID: 9TU5pZnEE9OY

On Tue, Jan 05, 2016 at 05:33:27AM +0300, Dmitry Osipenko wrote:
> ptimer_get_count() might be called while QEMU timer already been expired.
> In that case ptimer would return counter = 0, which might be undesirable
> in case of polled timer. Do counter wrap around for periodic timer to keep
> it distributed.
> 
> In addition, there is no reason to keep expired timer tick deferred, so
> just perform the tick from ptimer_get_count().
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  hw/core/ptimer.c | 35 +++++++++++++++++++++++++++++------
>  1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index 035af97..96a6c7a 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -85,15 +85,21 @@ static void ptimer_tick(void *opaque)
>  
>  uint64_t ptimer_get_count(ptimer_state *s)
>  {
> +    int enabled = s->enabled;

Variable localisation not needed.

>      int64_t now;
> +    int64_t next;
>      uint64_t counter;
> +    int expired;
> +    int oneshot;

Variable defs can be localised to the if (enabled) (even though now
in original code doesn't do that).

>  
> -    if (s->enabled) {
> +    if (enabled) {
>          now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        next = s->next_event;
> +        expired = (now - next >= 0);
> +        oneshot = (enabled == 2);
>          /* Figure out the current counter value.  */

This comment is now out of place.

> -        if (now - s->next_event > 0
> -            || s->period == 0) {
> -            /* Prevent timer underflowing if it should already have
> +        if (s->period == 0 || (expired && oneshot)) {
> +            /* Prevent one-shot timer underflowing if it should already have
>                 triggered.  */
>              counter = 0;
>          } else {
> @@ -114,12 +120,12 @@ uint64_t ptimer_get_count(ptimer_state *s)
>                 backwards.
>              */
>  
> -            if ((s->enabled == 1) && (s->limit * period < 10000)) {
> +            if (!oneshot && (s->limit * period < 10000)) {
>                  period = 10000 / s->limit;
>                  period_frac = 0;
>              }
>  
> -            rem = s->next_event - now;
> +            rem = expired ? now - next : next - now;
>              div = period;
>  
>              clz1 = clz64(rem);
> @@ -139,6 +145,23 @@ uint64_t ptimer_get_count(ptimer_state *s)
>                      div += 1;
>              }
>              counter = rem / div;
> +
> +            if (expired) {
> +                /* Wrap around periodic counter.  */
> +                counter = s->delta = s->limit - counter % s->limit;

Why do you update the delta here?

Also can you just get ptimer_reload to do the modulo math for you? If the
timer is !oneshot and expired, then you call ptimer_reload anyway,
which will update next_event. When the expired test returns false
you can just reliably use the original logic involving now and next.

> +            }
> +        }
> +
> +        if (expired) {
> +            if (oneshot) {

This if-else has a lot of common structure with the one above. I think
they could be merged.

Regards,
Peter

> +                ptimer_tick(s);
> +            } else {
> +                /* Don't use ptimer_tick() for the periodic timer since it
> +                 * would reset the delta value.
> +                 */
> +                ptimer_trigger(s);
> +                ptimer_reload(s);
> +            }
>          }
>      } else {
>          counter = s->delta;
> -- 
> 2.6.4
> 
