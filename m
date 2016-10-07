Received: by 10.80.163.71 with SMTP id 65csp3801726edn;
        Fri, 7 Oct 2016 07:31:24 -0700 (PDT)
X-Received: by 10.55.26.168 with SMTP id l40mr18720833qkh.212.1475850683923;
        Fri, 07 Oct 2016 07:31:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h20si3604769qtb.151.2016.10.07.07.31.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Oct 2016 07:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsWBH-0001kZ-D6
	for alex.bennee@linaro.org; Fri, 07 Oct 2016 10:31:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51532)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsWBD-0001kK-HZ
	for qemu-arm@nongnu.org; Fri, 07 Oct 2016 10:31:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsWBC-0006AM-5S
	for qemu-arm@nongnu.org; Fri, 07 Oct 2016 10:31:19 -0400
Received: from mail-ua0-x233.google.com ([2607:f8b0:400c:c08::233]:36622)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsWBC-0006A4-0n
	for qemu-arm@nongnu.org; Fri, 07 Oct 2016 10:31:18 -0400
Received: by mail-ua0-x233.google.com with SMTP id r64so46311482uar.3
	for <qemu-arm@nongnu.org>; Fri, 07 Oct 2016 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n7STPJQZSN+BbbF+cGhyvjxKcxZA9ZIu5p6h8w8RTww=;
	b=P6kChii+srumQn/zI6iy3f82EfT5ca9klyV9N1bjYNXlCX5W02jWFYwQ298kvi82MZ
	Sv0FQtF5J9b0/EM2OW6D4V0benvE4tY/uC9Lhvp7oN859xSlCIxkgj3ucV6izOUW7XMp
	3DQoLMgRQfMDPhpnTAEkHLIejAaGiNqDAcJUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n7STPJQZSN+BbbF+cGhyvjxKcxZA9ZIu5p6h8w8RTww=;
	b=HJCuqr5uhkkJbFL9mmu4i3SZiOQHXR2VteffTRYUxJPYWR2l0YG2TINYKoyqC4uadW
	zSnrTVlRDrY/ueebLIr4uAsoeFotduptGINQ1fZ5oeHiXkxNDTa9voUqhgiPymuw3aXZ
	BWgifm6lNPKqryLw2DPhuluwUqQ2IXrAHPM4PV8dGF/FweXlZYEh/sBZDqcw+gvDJX1c
	Vz6CgoCkPcm6LjuCoqHT5dbLIpbSPj1FghttLDY08mAAghbeLda8fQknUMNR5OyvYKyt
	/CyiMKVgN9+fIf+rWEhHJxcstrdBg6LNZgKvI4lT6lgpAt+CXkpeatu5MKz7xg2KhImR
	ESbg==
X-Gm-Message-State: AA6/9RkW+odyF74DwEjkDgg/Ty3LrrFc8qgfflV9qBO/ctmEDqQESYSH7U0DqjMoocHACGYzUHKrcz0vmmIa0bif
X-Received: by 10.176.69.238 with SMTP id u101mr14918302uau.175.1475850677600; 
	Fri, 07 Oct 2016 07:31:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Fri, 7 Oct 2016 07:30:57 -0700 (PDT)
In-Reply-To: <1475485496-21168-1-git-send-email-ppandit@redhat.com>
References: <1475485496-21168-1-git-send-email-ppandit@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2016 15:30:57 +0100
Message-ID: <CAFEAcA8GFqj4S7NE+b=zcqoPBTq+KZU4AGSTW0sfVH8iD=RyFQ@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::233
Subject: Re: [Qemu-arm] [PATCH v3] timer: a9gtimer: remove loop to
 auto-increment comparator
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
X-TUID: zT0SE2fSkII2

On 3 October 2016 at 10:04, P J P <ppandit@redhat.com> wrote:
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
>  hw/timer/a9gtimer.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> Update per:
>   -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg00079.html
>
> diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
> index 772f85f..add2f31 100644
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
> @@ -82,16 +83,15 @@ static void a9_gtimer_update(A9GTimerState *s, bool sync)
>          if ((s->control & R_CONTROL_TIMER_ENABLE) &&
>                  (gtb->control & R_CONTROL_COMP_ENABLE)) {
>              /* R2p0+, where the compare function is >= */
> -            while (gtb->compare < update.new) {
> +            if (gtb->compare < update.new
> +                && gtb->control & R_CONTROL_AUTO_INCREMENT) {
>                  DB_PRINT("Compare event happened for CPU %d\n", i);
>                  gtb->status = 1;
> -                if (gtb->control & R_CONTROL_AUTO_INCREMENT) {
> -                    DB_PRINT("Auto incrementing timer compare by %" PRId32 "\n",
> -                             gtb->inc);
> -                    gtb->compare += gtb->inc;
> -                } else {
> -                    break;
> -                }
> +                inc = update.new - gtb->compare - 1;
> +                inc = gtb->inc ? QEMU_ALIGN_DOWN(inc, gtb->inc) : 0;
> +                DB_PRINT("Auto incrementing timer compare by %"
> +                                                    PRId64 "\n", inc);
> +                gtb->compare += inc;
>              }
>              cdiff = (int64_t)gtb->compare - (int64_t)update.new + 1;
>              if (cdiff > 0 && (cdiff < next_cdiff || !next_cdiff)) {

This is still losing the setting of gtb->status in the
case where the auto-increment bit is not set.

thanks
-- PMM
