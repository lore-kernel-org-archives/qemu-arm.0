Received: by 10.37.35.205 with SMTP id j196csp3086862ybj;
        Thu, 22 Sep 2016 07:30:43 -0700 (PDT)
X-Received: by 10.55.42.150 with SMTP id q22mr2232679qkq.187.1474554643622;
        Thu, 22 Sep 2016 07:30:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y84si1284212qka.218.2016.09.22.07.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Sep 2016 07:30:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bn51P-0002PU-4U
	for alex.bennee@linaro.org; Thu, 22 Sep 2016 10:30:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn4X7-00040U-11
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 09:59:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn4X4-0005Ap-UD
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 09:59:24 -0400
Received: from mail-ua0-x236.google.com ([2607:f8b0:400c:c08::236]:34864)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn4X4-0005Ad-Qe
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 09:59:22 -0400
Received: by mail-ua0-x236.google.com with SMTP id 107so576520uah.2
	for <qemu-arm@nongnu.org>; Thu, 22 Sep 2016 06:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bN9/6K5tx6FK3mhQhp1KxzFD4oDPyAzoLVZCci+P9qk=;
	b=OGizy451HXFLKc28aOCxj8L2AnwtBh/v/VBEigpLFuO2g26JmXDFSt62RGOrfEwvzO
	v3zU7weYaDoMAzyNzjSzKL2lBSPR2IJ3l4WKHIqOyqvag4aweqefCtjlp9Zbc9h6SwVJ
	tmGltsD8ihkYm+zR2DZAth/+AqUeWLM/epgUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bN9/6K5tx6FK3mhQhp1KxzFD4oDPyAzoLVZCci+P9qk=;
	b=K0ch49ZjuuGvXk+vnNcrXjvzLsjR8P+a/AVaZsqY1RATE5XseP6f8ReiRgnWKclMH+
	8b81WZm4v4hvubskhDq5y++XsRE+ffQeEpdFHjwmFeCgAROmfR0/xNWRGssj9cI+eLJ1
	2FupiwvEyUBcnjbTAZsgHU1mvsdODXmX+BJhB26VkAdxNqD4OWWFuMWAwgoFeI6iZIKA
	ityM8q9XLtasZNU1DqXYbn8zhZwPL7Qy50vIaueIsUxTcgSTQPyKdyPmqf4V0maAICWg
	gVebqhMZqBgZR8ZttFdAMaxLI1Z73so1PlI43Y6At4+yxxwJwz9Sd7jFdrIpg6EaxkZn
	pamg==
X-Gm-Message-State: AE9vXwN5UAtIo4yLR/6ObFfvFruacHoBpyZjjLAdRyvYUGUA2Y4G66jogfQ9+zU8dsbll8mqnHRK2qmIcL4677hG
X-Received: by 10.159.35.113 with SMTP id 104mr73208uae.134.1474552762276;
	Thu, 22 Sep 2016 06:59:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 22 Sep 2016 06:59:01 -0700 (PDT)
In-Reply-To: <1474488807-451-1-git-send-email-ppandit@redhat.com>
References: <1474488807-451-1-git-send-email-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2016 14:59:01 +0100
Message-ID: <CAFEAcA8uAjbxbARR0PHnzgiTm3x2axAzW8GP7_Z75ejNqK4HKA@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::236
Subject: Re: [Qemu-arm] [PATCH] timer: a9gtimer: check auto-increment
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
X-TUID: VxLCCoES4Zbc

On 21 September 2016 at 21:13, P J P <ppandit@redhat.com> wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> ARM A9MP processor has a peripheral timer with an auto-increment
> register, which holds an increment step value. A user could set
> this value to zero, when auto-increment control bit is enabled.
> This leads to an infinite loop in 'a9_gtimer_update' while
> updating comparator value. Add check to avoid it.
>
> Reported-by: Li Qiang <liqiang6-s@360.cn>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/timer/a9gtimer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
> index 772f85f..3f752ce 100644
> --- a/hw/timer/a9gtimer.c
> +++ b/hw/timer/a9gtimer.c
> @@ -85,7 +85,7 @@ static void a9_gtimer_update(A9GTimerState *s, bool sync)
>              while (gtb->compare < update.new) {
>                  DB_PRINT("Compare event happened for CPU %d\n", i);
>                  gtb->status = 1;
> -                if (gtb->control & R_CONTROL_AUTO_INCREMENT) {
> +                if (gtb->inc && gtb->control & R_CONTROL_AUTO_INCREMENT) {
>                      DB_PRINT("Auto incrementing timer compare by %" PRId32 "\n",
>                               gtb->inc);
>                      gtb->compare += gtb->inc;

The code as it stands is definitely wrong, but it's also rather
weird, because it loops round just incrementing gtb->compare
by gtb->inc each time until it's >= update.new, when we ought
in theory to be able to calculate the new compare value without
having to loop round to do it.

The loop code also introduces some other odd corner cases which
are might loop forever or at least run for a long time before
they terminate. For instance suppose gtb->compare is
0xFFFF_FFFF_FFFF_0000, update.new is slightly larger than that,
and gtb->inc is 0x10000. This will loop forever because
compare will wrap round to 0x10000, then increment steadily
until it hits 0xFFFF_FFFF_FFFF_0000 again, and repeat.

So I think we need to fix this bug by rewriting the code to
not have a loop in it at all. (Something like, take
(update.new - gtb->compare), round it up to a multiple of
gtb->inc, and then add that to gtb->compare.)

thanks
-- PMM
