Received: by 10.80.163.71 with SMTP id 65csp346840edn;
        Fri, 30 Sep 2016 10:31:18 -0700 (PDT)
X-Received: by 10.237.59.51 with SMTP id p48mr8481332qte.53.1475256678366;
        Fri, 30 Sep 2016 10:31:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g23si12649048qte.114.2016.09.30.10.31.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Sep 2016 10:31:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bq1eX-0000yR-Pc
	for alex.bennee@linaro.org; Fri, 30 Sep 2016 13:31:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bq1eQ-0000xF-Jt
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 13:31:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bq1eP-0004dh-5H
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 13:31:10 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:36656)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bq1eO-0004cg-51
	for qemu-arm@nongnu.org; Fri, 30 Sep 2016 13:31:09 -0400
Received: by mail-vk0-x22b.google.com with SMTP id y190so78727893vkd.3
	for <qemu-arm@nongnu.org>; Fri, 30 Sep 2016 10:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=spvy3lkfnvyplexpAWAoa4JIYPnNmXDTPhGfsp4aAsg=;
	b=O+0aR8sMowQrb7AVqvVmwsIoL29nvBBd+lKIkNjuYnKFRyDEegjAZIfmrQWwyhD1d2
	E82x8PUm6fFy41/YRXQz8OFhTRLs/JHRmd19yk2Q05gA1mm1dKImQNGKmVWtmd60ZSCE
	oGdjFequ1sQCJ3RQ4tle4KE+n7yHni4Ot1icc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=spvy3lkfnvyplexpAWAoa4JIYPnNmXDTPhGfsp4aAsg=;
	b=iRN7XILybFoIMat4gwVvyBUbovhkcuMyfsN8f4x94CqBSE82N57j29GVgSKf0M+5hC
	mgffR1xDVT9CBh/JNHhbYI+dWn64V6DJWr31nK3MsDL6/+XXfuOAE6pMlPN1pmtv/D7X
	2gtI+lqGGMnjxoL2oB9AAMANJP3M3Yhlm0dfQcIG2yT53MRWsD+seGt0bhgGYrp15viH
	TnxNKNX4OmsC/E0XYbcMjktUpyOFioHv71a72Wf2+ZRDw3/iDqXT7YFx774ZPnV9838t
	NssZ7B1EbODSoKnwAFqtpfw11dx97j6zHk5AEysXX/j4V61EgaOOkxJZVFSfMtphd52l
	N0Og==
X-Gm-Message-State: AA6/9RkyfJnYXe+352S9KCKb6cDv4FOlUHUe0/H0zhpcE67EPlLvIzhDA07/6pMtauVHkT1aiSPuHDwawYkgyvLZ
X-Received: by 10.31.165.83 with SMTP id o80mr6138425vke.95.1475256667684;
	Fri, 30 Sep 2016 10:31:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Fri, 30 Sep 2016 10:30:47 -0700 (PDT)
In-Reply-To: <1475054208-20288-1-git-send-email-ppandit@redhat.com>
References: <1475054208-20288-1-git-send-email-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Sep 2016 10:30:47 -0700
Message-ID: <CAFEAcA-zru_S2GeLNDYb4uTkOsEN7TyT_kb5kw0f+fftqOvKXA@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [PATCH v2] timer: a9gtimer: check auto-increment
 register value
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Li Qiang <liqiang6-s@360.cn>,
	Qemu Developers <qemu-devel@nongnu.org>,
	Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: svvPxfLgCiJo

On 28 September 2016 at 02:16, P J P <ppandit@redhat.com> wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> ARM A9MP processor has a peripheral timer with an auto-increment
> register, which holds an increment step value. A user could set
> this value to zero, when auto-increment control bit is enabled.
> This leads to an infinite loop in 'a9_gtimer_update' while
> updating comparator value. Remove the loop incrementing the
> comparator value; Add check to avoid value zero.
>
> Reported-by: Li Qiang <liqiang6-s@360.cn>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/timer/a9gtimer.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>
> Update per
>   -> https://lists.gnu.org/archive/html/qemu-devel/2016-09/msg05682.html
>
> diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
> index 772f85f..021ae59 100644
> --- a/hw/timer/a9gtimer.c
> +++ b/hw/timer/a9gtimer.c
> @@ -72,7 +72,7 @@ static void a9_gtimer_update(A9GTimerState *s, bool sync)
>  {
>
>      A9GTimerUpdate update = a9_gtimer_get_update(s);
> -    int i;
> +    uint32_t i, inc;

Why have you changed the type of i when you haven't changed
any of the code that works with it?

Since the gtb->compare field is 64 bit your inc variable should
probably be uint64_t.

>      int64_t next_cdiff = 0;
>
>      for (i = 0; i < s->num_cpu; ++i) {
> @@ -82,16 +82,14 @@ static void a9_gtimer_update(A9GTimerState *s, bool sync)
>          if ((s->control & R_CONTROL_TIMER_ENABLE) &&
>                  (gtb->control & R_CONTROL_COMP_ENABLE)) {
>              /* R2p0+, where the compare function is >= */
> -            while (gtb->compare < update.new) {
> -                DB_PRINT("Compare event happened for CPU %d\n", i);
> -                gtb->status = 1;
> -                if (gtb->control & R_CONTROL_AUTO_INCREMENT) {
> -                    DB_PRINT("Auto incrementing timer compare by %" PRId32 "\n",
> -                             gtb->inc);
> -                    gtb->compare += gtb->inc;
> -                } else {
> -                    break;
> -                }
> +            DB_PRINT("Compare event happened for CPU %d\n", i);

This is wrong -- this debug print should only happen when the
comparator matches (ie when gtb->compare is less than update.new),
not every time.

> +            gtb->status = 1;

Similarly the status flag should only be set when the comparator
matches.

> +            if (gtb->control & R_CONTROL_AUTO_INCREMENT
> +                && gtb->compare < update.new) {
> +                inc = ((update.new - gtb->compare - 1) / gtb->inc) * gtb->inc;

I suggest using either QEMU_ALIGN_UP or QEMU_ALIGN_DOWN here,
depending on which way round you're trying for.

Also this will divide by zero if gtb->inc is 0 (as for instance
it will be on reset).

> +                DB_PRINT("Auto incrementing timer compare by %"
> +                                                            PRId32 "\n", inc);
> +                gtb->compare += inc;
>              }
>              cdiff = (int64_t)gtb->compare - (int64_t)update.new + 1;
>              if (cdiff > 0 && (cdiff < next_cdiff || !next_cdiff)) {
> @@ -210,7 +208,7 @@ static void a9_gtimer_write(void *opaque, hwaddr addr, uint64_t value,
>          gtb->compare = deposit64(gtb->compare, shift, 32, value);
>          break;
>      case R_AUTO_INCREMENT:
> -        gtb->inc = value;
> +        gtb->inc = value ? value : 1;

Where has this change come from ??

>          return;
>      default:
>          return;
> --
> 2.5.5
>

thanks
-- PMM
