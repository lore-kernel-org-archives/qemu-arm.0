Received: by 10.25.159.19 with SMTP id i19csp646268lfe;
        Sat, 23 Jan 2016 21:29:55 -0800 (PST)
X-Received: by 10.55.80.9 with SMTP id e9mr13422114qkb.94.1453613395654;
        Sat, 23 Jan 2016 21:29:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t67si3589627qkl.123.2016.01.23.21.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jan 2016 21:29:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aNDFL-0007S0-6s
	for alex.bennee@linaro.org; Sun, 24 Jan 2016 00:29:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aNDEz-00079c-UX
	for qemu-devel@nongnu.org; Sun, 24 Jan 2016 00:29:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aNDEy-000074-Uh
	for qemu-devel@nongnu.org; Sun, 24 Jan 2016 00:29:33 -0500
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:37385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aNDEy-00006w-O6; Sun, 24 Jan 2016 00:29:32 -0500
Received: by mail-wm0-x230.google.com with SMTP id n5so35161090wmn.0;
	Sat, 23 Jan 2016 21:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DMgJJF7Kyia0jJpyMUe63sk96peZFtgVHmVcAWl+lCA=;
	b=WTU4pRCRNzswL++IjU5XCLQYM8ZaJYulAv98NRyE7r0XWls9Yqisj1W4hcOk0Xgw9s
	VCiIHHEuOSI2d8LXJ7D2ISEeCpAgWUc3+LDwF9Lk8JrMRbB3nBqRDRvfpPNZCMflJzNB
	sdvHiF/6u5wkG009YnjleSftoI1yW5fjgNxQdPo/3zm6/xAuyGEGbyeDQk75LAE0SPVj
	5PlwzhPTsHzfkvbjxexQ1oM/3rS+iBQo4s+s6mlhpZBLfIU/eTSnOeiLWrknQqId4hWR
	L7RmgxndXTH+hUEySpWc+unDuQIBcm06bLg9AkL06yXPEIGinsz6hBatZxJ6v95Agljf
	vFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=DMgJJF7Kyia0jJpyMUe63sk96peZFtgVHmVcAWl+lCA=;
	b=O3feaZWn9WUfC4ZnVHZHA0gFwgpbHrz8GNpTuDKb22a3Fyg6giNpgsL836FwePDJac
	lY2lTbpF6Ow4haQHuDvtJGDuJ85pj1axjN84OG7DVZzExJFDYQFTje/k/xj0DRIB+XkN
	aAoViZLkcOW1IErXEhsFgCLQKFa+mwpj28px/kAjett0qFrFvF26yeSawvjTwPtLfOO2
	MHM/rgWFDoAEyrnwW7QQFJzB6qnYm+LRd2tDgqt5WjekECfushYSMgeLn/C2Fs1osYcJ
	bhxWcmUKRUhw31fuRriEpQqhc981DE6s+Ktfk/thANwTb9tCEHsOoBPlVa4Kku3+7xa/
	IygQ==
X-Gm-Message-State: AG10YOQ+D9mfuYNZPUwJfg19K1C3MT4xfFSHz8fR+VuAmcMxyd4mE0sEvL8FQ3/VV9GKuAJ03PDr9+wvaghfdg==
MIME-Version: 1.0
X-Received: by 10.194.22.132 with SMTP id d4mr11020889wjf.174.1453613372101;
	Sat, 23 Jan 2016 21:29:32 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Sat, 23 Jan 2016 21:29:32 -0800 (PST)
In-Reply-To: <9fb47bb0f1355221ef074766d5cc49f2de97e79b.1453402860.git.digetx@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
	<9fb47bb0f1355221ef074766d5cc49f2de97e79b.1453402860.git.digetx@gmail.com>
Date: Sat, 23 Jan 2016 21:29:32 -0800
Message-ID: <CAPokK=q0EzXWeAFibVYKXmvwh5=vM6LsEqJB9k5dNGF6AiHeoA@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::230
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v11 2/7] hw/ptimer: Perform counter wrap
 around if timer already expired
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
X-TUID: qx2oVj3ELNsl

On Thu, Jan 21, 2016 at 11:03 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
> ptimer_get_count() might be called while QEMU timer already been expired.
> In that case ptimer would return counter = 0, which might be undesirable
> in case of polled timer. Do counter wrap around for periodic timer to keep
> it distributed. In order to achieve more accurate emulation behaviour of
> certain hardware, don't perform wrap around when in icount mode and return
> counter = 0 in that case (that doesn't affect polled counter distribution).
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

> ---
>  hw/core/ptimer.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index 6dc1677..cb50d30 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -83,14 +83,16 @@ static void ptimer_tick(void *opaque)
>
>  uint64_t ptimer_get_count(ptimer_state *s)
>  {
> -    int64_t now;
>      uint64_t counter;
>
>      if (s->enabled) {
> -        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        int64_t next = s->next_event;
> +        bool expired = (now - next >= 0);
> +        bool oneshot = (s->enabled == 2);
> +
>          /* Figure out the current counter value.  */
> -        if (now - s->next_event > 0
> -            || s->period == 0) {
> +        if (s->period == 0 || (expired && (oneshot || use_icount))) {
>              /* Prevent timer underflowing if it should already have
>                 triggered.  */
>              counter = 0;
> @@ -102,7 +104,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
>              uint32_t period_frac = s->period_frac;
>              uint64_t period = s->period;
>
> -            if ((s->enabled == 1) && !use_icount && (s->delta * period < 10000)) {
> +            if (!oneshot && (s->delta * period < 10000) && !use_icount) {
>                  period = 10000 / s->delta;
>                  period_frac = 0;
>              }
> @@ -117,7 +119,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
>                 backwards.
>              */
>
> -            rem = s->next_event - now;
> +            rem = expired ? now - next : next - now;
>              div = period;
>
>              clz1 = clz64(rem);
> @@ -137,6 +139,11 @@ uint64_t ptimer_get_count(ptimer_state *s)
>                      div += 1;
>              }
>              counter = rem / div;
> +
> +            if (expired && (counter != 0)) {
> +                /* Wrap around periodic counter.  */
> +                counter = s->limit - counter % s->limit;
> +            }
>          }
>      } else {
>          counter = s->delta;
> --
> 2.7.0
>
