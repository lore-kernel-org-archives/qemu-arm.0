Received: by 10.80.166.35 with SMTP id d32csp587356edc;
        Mon, 17 Oct 2016 10:44:48 -0700 (PDT)
X-Received: by 10.55.19.164 with SMTP id 36mr24570382qkt.219.1476726288878;
        Mon, 17 Oct 2016 10:44:48 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p29si18499775qta.7.2016.10.17.10.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 10:44:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwBxw-0004ig-5c
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 13:44:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwBvO-00036u-1S
	for qemu-devel@nongnu.org; Mon, 17 Oct 2016 13:42:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwBvM-0008Vd-RV
	for qemu-devel@nongnu.org; Mon, 17 Oct 2016 13:42:10 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:34571)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bwBvM-0008VL-Ft
	for qemu-devel@nongnu.org; Mon, 17 Oct 2016 13:42:08 -0400
Received: by mail-vk0-x232.google.com with SMTP id b186so186026501vkb.1
	for <qemu-devel@nongnu.org>; Mon, 17 Oct 2016 10:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Eksx2UO5/p/Rw1PV4sBS98swCp/o7wlUDAV3Kc8JXDw=;
	b=Y0cqc5zHWdxqCIYAfztXxO/GHr9A9W3ihlnGV0wC4a9DL0+wNdhxtvUWi3HRE5jGPX
	x5r1jbe5tp5b709/XvCjTF/IxCEPCllyulFaJfdEAC632SNLMGH52U9Waofqry07gaTd
	1XQBIUQ5+oPkuN4FC4pDf4zsVJzFnuKD1mo88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Eksx2UO5/p/Rw1PV4sBS98swCp/o7wlUDAV3Kc8JXDw=;
	b=e8XGHZ+AIvoofMZoL9H/isT6uAzbd/Nkj1XytxIgn6FJ6DdLhyp4bLED/12Y0SR4j/
	5OjhH3MfKuA8/DMpvR4J3li5M7O0f/OADx6sA+7TisyxOcWtA3+uCiiTd+nOQG9H77nU
	UqV3l6sPPCmXSUUzjq2WOq4JdwQ6t/Y/dtKZ32T1Eft38GE51G758BvzM00QOsHlMuc2
	AmPx1BDTYo4TC3eLOremBDjThDuFajnQQwUriUj6B6+Wn/rCYzXcenVzR71OeEccFNpG
	q74WiBXvX5ZdBHBZnw9QyKe8UJe/PiBuR5WeFa/+itQCwcTpYALWlO0byXojnLGkX4pM
	aERA==
X-Gm-Message-State: AA6/9Rnpn8wGkFajgpBnvbtpCb1FD3Jpw+6G60aHY1b+X0dzW6NPQc5tR7KkkQ0GtiAuTjoknQP2wmFG00R9rych
X-Received: by 10.31.64.75 with SMTP id n72mr15825138vka.170.1476726127844;
	Mon, 17 Oct 2016 10:42:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 17 Oct 2016 10:41:47 -0700 (PDT)
In-Reply-To: <1476416631-2870-1-git-send-email-ppandit@redhat.com>
References: <1476416631-2870-1-git-send-email-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2016 18:41:47 +0100
Message-ID: <CAFEAcA8ALpL_rdgPL7dQbhx6prVV+ipXSoQ7LGu4ue_ReL9O-A@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-devel] [PATCH v6] timer: a9gtimer: remove loop to
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
X-TUID: BqtmSJyiWoP+

On 14 October 2016 at 04:43, P J P <ppandit@redhat.com> wrote:
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
>   -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg02891.html
>
> diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
> index 772f85f..03dfaf2 100644
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
> +                    inc = update.new + gtb->inc - gtb->compare - 1;
> +                    inc = QEMU_ALIGN_DOWN(inc, gtb->inc);

Isn't this pair of lines equivalent to
  uint64_t inc = QEMU_ALIGN_UP(update.new - gtb->compare, gtb->inc);

?

I think using that macro makes it clearer that the code is correct.

If you replace the above two lines (and the unnecessarily widely
scoped declaration of inc) with that line then you can have
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

> +                    DB_PRINT("Auto incrementing timer compare by %"
> +                                                        PRId64 "\n", inc);
> +                    gtb->compare += inc;
>                  }
>              }
>              cdiff = (int64_t)gtb->compare - (int64_t)update.new + 1;
> --
> 2.5.5

thanks
-- PMM
