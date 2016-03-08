Received: by 10.25.208.211 with SMTP id h202csp1711831lfg;
        Mon, 7 Mar 2016 19:43:25 -0800 (PST)
X-Received: by 10.140.171.7 with SMTP id r7mr34499728qhr.79.1457408605655;
        Mon, 07 Mar 2016 19:43:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c184si1004794qha.100.2016.03.07.19.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 19:43:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ad8YP-0002XB-0Q
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 22:43:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ad8YM-0002Wf-PV
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 22:43:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ad8YL-0004Gy-Of
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 22:43:22 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:36065)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ad8YL-0004Gq-Du; Mon, 07 Mar 2016 22:43:21 -0500
Received: by mail-wm0-x241.google.com with SMTP id l68so1723428wml.3;
	Mon, 07 Mar 2016 19:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=ZJXINqDtWRFuPWQrMuCNrBVBYkadveH4PAVldK6BaQU=;
	b=Zf6SPtwG+lj4b3eEB8IRBSF7HEbZKNcDydB9qjPgJivjDacF//4hbV97rfBamM/04p
	HUBm3A+hH0aBngANUvS9ZEAk8vQV173pDHTh+lZrwywcFEX1gFxrgHU0ATsGTQjjXtvD
	U45xq/DOmbxGYDBawIDlf6B7493/9uBCeSocTqgkl3+4lZX8Qsr3DDwblOwDue7+He0/
	yh+fDxkL9vo8xk70c0jIgv4cYrsqd8bI88CW6uBIQfj/CSt2dLvj27sLbBpF7ZmsHJSr
	OCBdaWmjjUpS2jFIv/jaRASMeeIGGrEors7UrKRnaLOCwf8SVk/E/DevDD3ocxqtxx4R
	a8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=ZJXINqDtWRFuPWQrMuCNrBVBYkadveH4PAVldK6BaQU=;
	b=Q2xFKiY8OR1usTYJpUm0W3SsCRMjqIgXv5NE4Ds8HAUha4Zhp1n58R+evJ+Cd9Kw/K
	PQSrzbKmEoL+uZZaDKUXiuuSvUC67bRdOXe0bP0Lb5ThJWKY4z13sTl0S7kubDOBjFI2
	mwy01LNG3BWSGFh6ihnb+XWKBX6b7hZ1zIABMNgJvQdBChsOQ/DxoUaOUQnfC4XQP1Xy
	9NPyTCwnGTKnbzU7qctdHHo37+kwL8AFBwDrkxA6cVajyBJQ4grxEd0SEvWsWQh5nQXw
	+sGqC/gtjMpudXs+Tw+YZtYy17t1Mu1nK7EhxweDSaxwgl7KNvEfJew2Krc3GxcrEldY
	NzWw==
X-Gm-Message-State: AD7BkJIADtXfkQQAPZI4UhLkSWKPcmSXUdOSsNWWAbByeJdE0xpay5aN0tQO/1aJezsHpUnASt0Bhd3S6g2w5w==
MIME-Version: 1.0
X-Received: by 10.194.58.234 with SMTP id u10mr26321933wjq.174.1457408600609; 
	Mon, 07 Mar 2016 19:43:20 -0800 (PST)
Received: by 10.28.157.21 with HTTP; Mon, 7 Mar 2016 19:43:20 -0800 (PST)
In-Reply-To: <56B0C90B.7000300@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
	<77d17ad13f7b20deb433ca7a7b3d7cf40429665e.1454169735.git.digetx@gmail.com>
	<56B0C90B.7000300@gmail.com>
Date: Mon, 7 Mar 2016 19:43:20 -0800
Message-ID: <CAPokK=qDSsbvdPtqL42EiEOE-R0RguGegMj-Pj9j7ktEP_zD2A@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v12 7/9] hw/ptimer: Fix counter - 1 returned
 by ptimer_get_count for the active timer
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
X-TUID: rSaBmx6WV3lv

On Tue, Feb 2, 2016 at 7:19 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
> 30.01.2016 19:43, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> Due to rounding down performed by ptimer_get_count, it returns counter -=
 1
>> for
>> the active timer. That's incorrect because counter should decrement only
>> after
>> period been expired, not before. I.e. if running timer has been loaded
>> with
>> value X, then timer counter should stay with X until period expired and
>> decrement after. Fix this by adding 1 to the counter value for the activ=
e
>> and
>> unexpired timer.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>   hw/core/ptimer.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
>> index 62f8cb1..b2044fb 100644
>> --- a/hw/core/ptimer.c
>> +++ b/hw/core/ptimer.c
>> @@ -136,7 +136,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
>>                   if ((uint32_t)(period_frac << shift))
>>                       div +=3D 1;
>>               }
>> -            counter =3D rem / div;
>> +            counter =3D rem / div + (expired ? 0 : 1);
>>
>>               if (expired && counter !=3D 0) {
>>                   /* Wrap around periodic counter.  */
>>
>
> Noticed one nit here:
>
> There is possibility to return timer counter =3D limit + 1, if the follow=
ing
> ptimer calls execute in less than 1ns.
>
>         ptimer_run(t, 1);
>         // counter =3D 91, if set() count executed in less than 1ns
>         ptimer_set_count(t, 90);
>         counter =3D ptimer_get_count(t);
>
> Likely, it would be impossible to trigger that issue on a real current
> machine.
> But the fix is trivial, I'll incorporate it in V13 if it looks fine:
>
> ---
> @@ -76,20 +76,20 @@ static void ptimer_tick(void *opaque)
>  {
>      ptimer_state *s =3D (ptimer_state *)opaque;
>      s->delta =3D 0;
>      ptimer_reload(s);
>  }
>
>  uint64_t ptimer_get_count(ptimer_state *s)
>  {
> +    int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      uint64_t counter;
>
> -    if (s->enabled && s->delta !=3D 0) {
> -        int64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    if (s->enabled && s->delta !=3D 0 && now !=3D s->last_event) {
>          int64_t next =3D s->next_event;
>          bool expired =3D (now - next >=3D 0);
>          bool oneshot =3D (s->enabled =3D=3D 2);
>
>          /* Figure out the current counter value.  */
>          if (expired && (oneshot || use_icount)) {
>              /* Prevent timer underflowing if it should already have
>                 triggered.  */
> @@ -131,17 +131,17 @@ uint64_t ptimer_get_count(ptimer_state *s)
>              } else {
>                  if (shift !=3D 0)
>                      div |=3D (period_frac >> (32 - shift));
>                  /* Look at remaining bits of period_frac and round div u=
p
> if
>                     necessary.  */
>                  if ((uint32_t)(period_frac << shift))
>                      div +=3D 1;
>              }
> -            counter =3D rem / div;
> +            counter =3D rem / div + (expired ? 0 : 1);
>

Sorry about the long delays. Im wondering what this has to do with
expiration though? the commit message suggests you want to change the
rounding scheme, so can that be done directly with DIV_ROUND_UP?

Regards,
Peter

>              if (expired && counter !=3D 0) {
>                  /* Wrap around periodic counter.  */
>                  counter =3D s->limit - (counter - 1) % s->limit;
>              }
>          }
>      } else {
>          counter =3D s->delta;
>
>
> --
> Dmitry
