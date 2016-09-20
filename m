Received: by 10.80.163.71 with SMTP id 65csp1137897edn;
        Tue, 20 Sep 2016 10:28:21 -0700 (PDT)
X-Received: by 10.200.47.89 with SMTP id k25mr36629315qta.75.1474392501254;
        Tue, 20 Sep 2016 10:28:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p130si24886726qke.61.2016.09.20.10.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Sep 2016 10:28:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bmOqC-0000e8-Bk
	for alex.bennee@linaro.org; Tue, 20 Sep 2016 13:28:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmOjH-00035d-4H
	for qemu-arm@nongnu.org; Tue, 20 Sep 2016 13:21:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmOjF-00042g-MD
	for qemu-arm@nongnu.org; Tue, 20 Sep 2016 13:21:10 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:34863)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bmOjF-00042V-HI
	for qemu-arm@nongnu.org; Tue, 20 Sep 2016 13:21:09 -0400
Received: by mail-vk0-x230.google.com with SMTP id g9so34849160vkg.2
	for <qemu-arm@nongnu.org>; Tue, 20 Sep 2016 10:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LyOiP/7PSepTxMcShVvhmX1y+LiSr5ovvqMEvvJZNOs=;
	b=Qu/5RuXRkkTfKzqp/gcHiau+1TveUwg1qJun2mMUz91Mtsl7DQUiS9owevUQq4Sqgk
	itWyT1PoiMGA9uenErXmL7hc2EjWKIZNhP/PsSELCDFidACARDJGk9bxETACyxwpHaDz
	/meRWfdnZJDAYvrMoKMIs8KnhO1B2bL8HJ4Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LyOiP/7PSepTxMcShVvhmX1y+LiSr5ovvqMEvvJZNOs=;
	b=K8NPqau8V8bVBzihTITVZ/IDzRPqiht3Dnrd56mDH7tQGxbEaGO/zCypczukg/dmXl
	YiaCmeREg09yE1RSeejfMzEFM2yXsUY0Mwa0h0myMAqnPn7cHgo+0m0o4HKwRa0exjMF
	+5LiPNtGWyLa1st4ldxq7ioNf4kRK2A/+xFvCvG/qHMQb3CBFqCfJdkE349BQDvj4Es7
	L8igQVFqINOoAqZnag0cwb7uy/7+FsCq83XBSfun+nwuBwx/eWRbQkS/wcL73hl2XseM
	tdFFxoc5DbM/5X+buQb9TuKQpErAfs7rfw5nI85JP9vRUkIhXOya+oUraeEtwX0ITL5m
	ryuQ==
X-Gm-Message-State: AE9vXwN0bqtXfjvsg7f4aKs20/7Fr5G3eoqd+Be683PBojx5ef47RiV6NasOidBq328N+XVuA9rc7IVSFubPQuRX
X-Received: by 10.31.94.142 with SMTP id s136mr4489731vkb.3.1474392064924;
	Tue, 20 Sep 2016 10:21:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Tue, 20 Sep 2016 10:20:44 -0700 (PDT)
In-Reply-To: <586d1643bf90bab81322ae34b9b68c10458249a9.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
	<586d1643bf90bab81322ae34b9b68c10458249a9.1473252818.git.digetx@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2016 18:20:44 +0100
Message-ID: <CAFEAcA_4xVH0PzytZpvyCTCgxm2TORg20C=UKHVApeVdkMvneA@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [PATCH v16 05/16] hw/ptimer: Add "wraparound after
 one period" policy
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Itn1KbLKrAWh

On 7 September 2016 at 14:22, Dmitry Osipenko <digetx@gmail.com> wrote:
> Currently, periodic counter wraps around immediately once counter reaches
> "0", this is wrong behaviour for some of the timers, resulting in one period
> being lost. Add new ptimer policy that provides correct behaviour for such
> timers, so that counter stays with "0" for a one period before wrapping
> around.

This says it's just adding a new policy...

> @@ -91,7 +96,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
>  {
>      uint64_t counter;
>
> -    if (s->enabled) {
> +    if (s->enabled && s->delta != 0) {
>          int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>          int64_t next = s->next_event;
>          bool expired = (now - next >= 0);
> @@ -145,6 +150,14 @@ uint64_t ptimer_get_count(ptimer_state *s)
>                      div += 1;
>              }
>              counter = rem / div;
> +
> +            if (!oneshot && s->delta == s->limit) {
> +                /* Before wrapping around, timer should stay with counter = 0
> +                   for a one period.  The delta has been adjusted by +1 for
> +                   the wrapped around counter, so taking a modulo of limit + 1
> +                   gives that period.  */
> +                counter %= s->limit + 1;
> +            }
>          }
>      } else {
>          counter = s->delta;

...but the changes in this function look like they affect
behaviour even if that policy flag isn't set.

thanks
-- PMM
