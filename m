Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp813297wro;
        Thu, 14 Mar 2019 05:58:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBJgxUcYAKeedHkLgAbAzXc5EjG6A2+jWrmZOKajhI4g/hlelBqFVkWQaYhtbsdAPsnunx
X-Received: by 2002:a25:aa6e:: with SMTP id s101mr11467238ybi.18.1552568284414;
        Thu, 14 Mar 2019 05:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552568284; cv=none;
        d=google.com; s=arc-20160816;
        b=bJ5Yf+5rABgYbHqBJLvnlOVhUj9y7r0GKAj1QIfZT3HA2rTH9LLgEcIIRrOXVSSeuQ
         aSZaSx03wVVw+4539rMt8UWzB6diL72ESsSJBUfl9gQWFkIhswCUGjiolONuHPrfjqXy
         Kl/+5chWzzrOIDJpgx24Vn6d5y3EGp2wUdqsWEiyoXMGaXPGuppLEtpBUhqV1oUcqMf2
         ed9pKqSssKxr2d4aPmsoAuXEM69hxDPod5mROlV3eWUlxDUCsroSfp/J89eUO4K2C3iM
         d3R6RnjGiJ0MtxTWvcx3xMXN/0K8mwR+3/cokRiMVdSHjKN6hGhWK5r+CFE8pmfJJwej
         zujA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MWL+d3A3Ph2GZ4HPqSSdEuD4WZHmS8ibXYWluEu5kFk=;
        b=ArblQsrydbo1LMEmoPpzzdXsYb60wHxKm71qGL9PrV3xXad+i+6/ZlQgUFjrVNIJQ3
         UuAQ63sRexDSRsVzgeDtELW/UndNoAkH2HOoL7Yb3YqEacuODm3bXMY635Sk2p70vPi5
         9tKJ6BBHcTP3V/Doygvs6sv7OP7mlZnsKaljrWyGhnSDu80MMFesQIyXXIR6n/YeDuAc
         VZAyvx37h+lbg6qwwinBVZWS7oiIujrQmVsl8ejiSJ4ZMJp0VhOgxHXq0/iikMUZ+QI8
         LFJLS9amvzHSe0jR0/ACBnwJsJxkKYbamCTYUThQpI8BTkjZ6dMBtUhMTBumzF1nykEE
         U2jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@google.com header.s=20161025 header.b="L9hFAvw/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n128si7160166ywe.367.2019.03.14.05.58.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 05:58:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@google.com header.s=20161025 header.b="L9hFAvw/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:36436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4Pvv-0007k1-To
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 08:58:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bluecmd@google.com>) id 1h4NtZ-0006fb-9g
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 06:47:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bluecmd@google.com>) id 1h4NtY-0001kA-8Z
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 06:47:29 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37327)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bluecmd@google.com>) id 1h4NtX-0001iG-Pj
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 06:47:28 -0400
Received: by mail-oi1-x242.google.com with SMTP id n7so3831379oic.4
	for <qemu-devel@nongnu.org>; Thu, 14 Mar 2019 03:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gE49fa2RfGieFU57CkY0E5Z/nCQTqzyEeM6S1K2l1Wc=;
	b=L9hFAvw/4REd9VuKHUqPzNtzwN/767pl6J/Z26TQ8rOfqigY0IdE0B/vVoRAKG/oVk
	X5M5KstRyo5Sw02IG+MwVF5t9VbVH6sHeDj8nmvvy4DQ/4AvY2v8ocHn+0AV3e+ObZ2V
	FUyf/9L7u29UYwCUrEM8O/Ub8YJtUePOVk+vTRSoTFbinV5alM41FbKYql6MqQKkyfry
	ES2UwGbts5uC1jKlbsGg+iIZ+O0V4Jd8xLmuY6dhXOpYkjiR71YY+G4CjraQSy9d81Nu
	dTlGi9YxlZJqFUomxvbjf1qSpcGg0Okrqz8MimvbRyFn0XUghtgLkRuXd9SYrdxagK5k
	8xRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gE49fa2RfGieFU57CkY0E5Z/nCQTqzyEeM6S1K2l1Wc=;
	b=tGXZBUEo0rmogL/BctUguDNt7u7SZcQ04vURmx0OfAKiXx3ZXqSDn3mB3JDH26xs9W
	ugFV+geZgsXD7lJ4e0cU088KtoHxB0qhPv6v9nVwxem49So+vfx/ulW4gCYH3f7XzzPO
	CzjB1sNtnSrsDdZDtFq5iRJgs4H0XkUR1SlBsay5xcVSOUOfVB7Y11S8HL6ep+pt9FNH
	mBAlhKr/gsixv89PCTE//j8NXfDvOMagjGUukVya58IyN1Uo1D0U/S4wxkX7DRXECjoM
	+vVcHzSuB/y1oSzdn8q5qhS4vT2EKVlRD8qn+1KZ5aE0NaIZCQQ2lBWZGEj3cWL3bZt2
	hzzA==
X-Gm-Message-State: APjAAAU8lKMpD0rZCSQZSbBdCsQcbi15gZ/6Arr2s6YdJSScZ065qPDC
	Yspi8DXSgOsPxT/4U7BZwK9+F8ZVdez0l8vAu9Jfcg==
X-Received: by 2002:aca:bc0b:: with SMTP id m11mr1567510oif.41.1552560446301; 
	Thu, 14 Mar 2019 03:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190314084235.9887-1-clg@kaod.org>
	<20190314084235.9887-6-clg@kaod.org>
	<3876e39f-ed28-3b86-91e1-8bc1fc99be60@kaod.org>
In-Reply-To: <3876e39f-ed28-3b86-91e1-8bc1fc99be60@kaod.org>
Date: Thu, 14 Mar 2019 11:47:15 +0100
Message-ID: <CAEfeXvaB_YHJ+p=iSaywuJm0nAaxOyHzOTGgHb6SVauY-F3sag@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
X-Mailman-Approved-At: Thu, 14 Mar 2019 08:50:23 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH 5/5] aspeed/timer: Use signed muldiv for
 timer resets
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
From: Christian Svensson via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Christian Svensson <bluecmd@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hDD6XyZGzz+g

Hi all,

I have a new patch but I'm not sure how you want me to post it.
Should I do a "PATCH v2" with a single patch and this thread as the thread
ID?

Thanks,
- Chris


On Thu, Mar 14, 2019 at 10:05 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:

> Christian,
>
> Could you please provide a fix for this patch ? patchew complains, see
> attached log.
>
> Thanks,
>
> C.
>
> On 3/14/19 9:42 AM, C=C3=A9dric Le Goater wrote:
> > From: Christian Svensson <bluecmd@google.com>
> >
> > If the host decrements the counter register that results in a negative
> > delta. This is then passed to muldiv64 which only handles unsigned
> > numbers resulting in bogus results.
> >
> > This fix ensures the data being operated on is signed before it is
> > ultimately casted to the final unsigned value.
> >
> > Test case: kexec a kernel using aspeed_timer and it will freeze on the
> > second bootup when the kernel initializes the timer. With this patch
> > that no longer happens and the timer appears to run OK.
> >
> > Signed-off-by: Christian Svensson <bluecmd@google.com>
> > [clg: - checkpatch fixes ]
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > ---
> >  hw/timer/aspeed_timer.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> > index 9988b8fbbf17..0b16eac8970c 100644
> > --- a/hw/timer/aspeed_timer.c
> > +++ b/hw/timer/aspeed_timer.c
> > @@ -275,7 +275,8 @@ static void
> aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
> >              int64_t delta =3D (int64_t) value - (int64_t)
> calculate_ticks(t, now);
> >              uint32_t rate =3D calculate_rate(t);
> >
> > -            t->start +=3D muldiv64(delta, NANOSECONDS_PER_SECOND, rate=
);
> > +            t->start =3D (int64_t)t->start +
> > +                ((__int128_t)delta * NANOSECONDS_PER_SECOND / rate);
> >              aspeed_timer_mod(t);
> >          }
> >          break;
> >
>
>
