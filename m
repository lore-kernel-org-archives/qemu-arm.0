Received: by 10.25.159.19 with SMTP id i19csp279199lfe;
        Mon, 11 Jan 2016 19:59:10 -0800 (PST)
X-Received: by 10.140.220.207 with SMTP id q198mr40095547qhb.24.1452571150810;
        Mon, 11 Jan 2016 19:59:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 130si115330015qhw.52.2016.01.11.19.59.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 19:59:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIq6w-00016T-Gd
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 22:59:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aIq6u-00013r-EE
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 22:59:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aIq6t-0001aa-Bx
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 22:59:08 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:36150)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aIq6o-0001Zx-5L; Mon, 11 Jan 2016 22:59:02 -0500
Received: by mail-pf0-x241.google.com with SMTP id n128so4332659pfn.3;
	Mon, 11 Jan 2016 19:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vefJcMlUV8wVn6iEZQOcEoey0Po9vXo+tkXgiIXL21M=;
	b=UETwF1EGWCAUmBP2k0qPzZP10N8UkTetBeW07hEilWf90KaxXlECSQvYbYs7+Ln39a
	9yL8OLZjjF9vNRG3Ife03PgU7fGhHLZhKJ8j76IKmJh2pAtVoxyRiVv4sFoHpeyliOYC
	DC0bBoJ1VgyxyZrquanH/+3/LQ5IuJnhhhFSw8FpJe8Z+iCi+589wo5TjlHdIyfeghih
	GW4ks1i0AyIscmX6k5lBJAnEMu34zYiFX927tu0NiLsHJmGIqGzA0M1t4Szw8VHdfkwV
	hkQWCGNvRnkF/fyNlts4OisLo7omjkikvdiw1H+bKw2JBkNC4T/YHrBgDpHqcIDQHOZe
	OFaw==
X-Received: by 10.98.7.79 with SMTP id b76mr31869434pfd.40.1452571141460;
	Mon, 11 Jan 2016 19:59:01 -0800 (PST)
Received: from pcrost-box (c-73-70-184-119.hsd1.ca.comcast.net.
	[73.70.184.119]) by smtp.gmail.com with ESMTPSA id
	cl3sm84861303pad.11.2016.01.11.19.59.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 19:59:00 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon, 11 Jan 2016 19:58:58 -0800
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20160112035858.GG3308@pcrost-box>
References: <cover.1452359845.git.digetx@gmail.com>
	<5c18054d536f3f940d3059235f0ac4aad42c835c.1452359845.git.digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c18054d536f3f940d3059235f0ac4aad42c835c.1452359845.git.digetx@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v10 5/7] hw/ptimer: Legalize running with
	delta = load = 0
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
X-TUID: yDiT4c9LIFe/

On Sat, Jan 09, 2016 at 08:39:53PM +0300, Dmitry Osipenko wrote:
> Currently ptimer would print error message and clear enable flag for an
> arming timer that has delta = load = 0. That actually could be a valid case
> for some hardware, like instant IRQ trigger for oneshot timer or continuous
> in periodic mode. Support those cases by printing error message only when
> period = 0.
> 

Isn't the continuous-periodic the same as period = 0, so if we were to really
support this, there should be no error message. This would simplify as we
can remove the conditionals of 0 period completely and rely only on the
too-fast clamps you add in previous patches.

Regards,
Peter

> In addition, don't load one-shot timer when delta = 0 and actually stop the
> timer by timer_del().
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  hw/core/ptimer.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index 6960738..42e44f9 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -36,13 +36,20 @@ static void ptimer_reload(ptimer_state *s)
>  {
>      uint32_t period_frac = s->period_frac;
>      uint64_t period = s->period;
> +    int periodic = (s->enabled == 1);
>  
> -    if (s->delta == 0) {
> +    if (s->delta == 0 && period != 0) {
>          ptimer_trigger(s);
> -        s->delta = s->limit;
> +        if (periodic) {
> +            s->delta = s->limit;
> +        }
>      }
> -    if (s->delta == 0 || s->period == 0) {
> -        fprintf(stderr, "Timer with period zero, disabling\n");
> +    if (s->delta == 0 || period == 0) {
> +        if (period == 0) {
> +            fprintf(stderr, "Timer with period zero, disabling\n");
> +            s->delta = 0;
> +        }
> +        timer_del(s->timer);
>          s->enabled = 0;
>          return;
>      }
> @@ -56,7 +63,7 @@ static void ptimer_reload(ptimer_state *s)
>       * on the current generation of host machines.
>       */
>  
> -    if ((s->enabled == 1) && !use_icount && (s->delta * period < 10000)) {
> +    if (periodic && !use_icount && (s->delta * period < 10000)) {
>          period = 10000 / s->delta;
>          period_frac = 0;
>      }
> @@ -86,14 +93,14 @@ uint64_t ptimer_get_count(ptimer_state *s)
>      int enabled = s->enabled;
>      uint64_t counter;
>  
> -    if (enabled) {
> +    if (enabled && s->delta != 0) {
>          int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>          int64_t next = s->next_event;
>          int expired = (now - next >= 0);
>          int oneshot = (enabled == 2);
>  
>          /* Figure out the current counter value.  */
> -        if (s->period == 0 || (expired && (use_icount || oneshot))) {
> +        if (expired && (use_icount || oneshot)) {
>              /* Prevent timer underflowing if it should already have
>                 triggered.  */
>              counter = 0;
> -- 
> 2.6.4
> 
