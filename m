Received: by 10.80.166.35 with SMTP id d32csp510480edc;
        Wed, 12 Oct 2016 05:41:36 -0700 (PDT)
X-Received: by 10.55.209.26 with SMTP id s26mr804132qki.24.1476276096659;
        Wed, 12 Oct 2016 05:41:36 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n132si3733625qka.92.2016.10.12.05.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Oct 2016 05:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buIql-0001tz-OU
	for alex.bennee@linaro.org; Wed, 12 Oct 2016 08:41:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buIhn-0003Cr-4E
	for qemu-devel@nongnu.org; Wed, 12 Oct 2016 08:32:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buIhk-0003np-JD
	for qemu-devel@nongnu.org; Wed, 12 Oct 2016 08:32:18 -0400
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231]:34741)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buIhk-0003nh-Fv
	for qemu-devel@nongnu.org; Wed, 12 Oct 2016 08:32:16 -0400
Received: by mail-ua0-x231.google.com with SMTP id m26so5289351uaa.1
	for <qemu-devel@nongnu.org>; Wed, 12 Oct 2016 05:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jhAbOvD1PJEW+/W404axLVBHeR81ybwt1/x3M2L4qFA=;
	b=AXHbSPqzH7atwQDlaHEmd8GXYhlNGs/o8hPqiURiHb1TvgsSe6OiPEOQS33hpb9LXP
	7Cn931+UYfTESG9sfCQ7hHXR/wGQP5a/E7t2WTWFwGo4DwvCgkiZaF3cqoh8hIrdNE6x
	fb+Z8lEEiomLlfVADOO8l7g9b04KsxRkGk1BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jhAbOvD1PJEW+/W404axLVBHeR81ybwt1/x3M2L4qFA=;
	b=cTlE8xI92/ECIqpTe29vz6KuNqpbSL0qfEVIFa3Daw/GbF92rmHNSZPNGEfFvtvUTY
	66MvkM+G83fgQhqUCFlXOPfbM0cFM/sbhq1jwX9hc2YrFhPgx/h1bYYk0ADznAEOSWWm
	uPdc5cggRjdrrgLmTJFnOLtIfuHlS8ni4WrjBeV0zlRbUZU6wyqmKG0YaZrDSnON66kR
	2W8HqLZ+gngVwMyVKNf8Yy01jmPETvKJ2w9INbR9QyWRz8t9kqjHTzm4qshxOmh236qs
	wmDzrxstSBn4JUFzuEpE9a1ms4mF/h+1CedcOTwK6nm0seDsRk+npcdwi263ve5+ieiA
	AhUw==
X-Gm-Message-State: AA6/9RkCtV83nKhBtMbgK1jzbsDfD83pWpu/ZWTmxJfcQGunHIgcrfxTDS/xqdNYDiE3lev+WbvZBbORUuuXm+3z
X-Received: by 10.176.83.50 with SMTP id x47mr390112uax.140.1476275536075;
	Wed, 12 Oct 2016 05:32:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 12 Oct 2016 05:31:55 -0700 (PDT)
In-Reply-To: <1475903058-729-1-git-send-email-ppandit@redhat.com>
References: <1475903058-729-1-git-send-email-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Oct 2016 13:31:55 +0100
Message-ID: <CAFEAcA8LfjDEMtbT5GRryLvAEu9kzbEzykKXF9DP+dDLajT8BQ@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::231
Subject: Re: [Qemu-devel] [PATCH v4] timer: a9gtimer: remove loop to
 auto-increment comparator
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Li Qiang <liqiang6-s@360.cn>,
	Qemu Developers <qemu-devel@nongnu.org>,
	Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MoF0MJ8V6XIV

On 8 October 2016 at 06:04, P J P <ppandit@redhat.com> wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> ARM A9MP processor has a peripheral timer with an auto-increment
> register, which holds an increment step value. A user could set
> this value to zero. When auto-increment control bit is enabled,
> it leads to an infinite loop in 'a9_gtimer_update' while
> updating comparator value. Remove this loop incrementing the
> comparator value.
>
> Reported-by: Li Qiang <liqiang6-s@360.cn>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/timer/a9gtimer.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> Update per
>   -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg01393.html
>
> diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
> index 772f85f..02092dd 100644
> --- a/hw/timer/a9gtimer.c
> +++ b/hw/timer/a9gtimer.c
> @@ -73,6 +73,7 @@ static void a9_gtimer_update(A9GTimerState *s, bool sync)
>
>      A9GTimerUpdate update = a9_gtimer_get_update(s);
>      int i;
> +    uint64_t inc;
>      int64_t next_cdiff = 0;
>
>      for (i = 0; i < s->num_cpu; ++i) {
> @@ -82,15 +83,15 @@ static void a9_gtimer_update(A9GTimerState *s, bool sync)
>          if ((s->control & R_CONTROL_TIMER_ENABLE) &&
>                  (gtb->control & R_CONTROL_COMP_ENABLE)) {
>              /* R2p0+, where the compare function is >= */
> -            while (gtb->compare < update.new) {
> +            if (gtb->compare < update.new) {
>                  DB_PRINT("Compare event happened for CPU %d\n", i);
>                  gtb->status = 1;
> -                if (gtb->control & R_CONTROL_AUTO_INCREMENT) {
> -                    DB_PRINT("Auto incrementing timer compare by %" PRId32 "\n",
> -                             gtb->inc);
> -                    gtb->compare += gtb->inc;
> -                } else {
> -                    break;
> +                if (gtb->control & R_CONTROL_AUTO_INCREMENT && gtb->inc) {
> +                    inc = update.new - gtb->compare - 1;

Can you explain why the '- 1' here ?

> +                    inc = QEMU_ALIGN_DOWN(inc, gtb->inc);
> +                    DB_PRINT("Auto incrementing timer compare by %"
> +                                                        PRId64 "\n", inc);
> +                    gtb->compare += inc;

Something still doesn't look right here. Consider the case where
update.new is only just bigger than gtb->compare (actually the
usual case, I think). In this case 'update.new - gtb->compare - 1'
is smaller than gtb->inc and so the QEMU_ALIGN_DOWN will produce
an inc value of 0. That would be wrong, because we should definitely
have done an auto-increment.

>                  }
>              }
>              cdiff = (int64_t)gtb->compare - (int64_t)update.new + 1;
> --
> 2.5.5

thanks
-- PMM
