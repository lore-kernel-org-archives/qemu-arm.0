Received: by 2002:ad4:4a74:0:0:0:0:0 with SMTP id cn20csp1495464qvb;
        Thu, 7 Jan 2021 13:43:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwO/sqg1pFXq7GOq19Am6lSEyTetEEj4W9k87hTxxPfDGQskk/4kwtw20nU5sJDDHyBxsWM
X-Received: by 2002:a25:3812:: with SMTP id f18mr1161438yba.327.1610055809382;
        Thu, 07 Jan 2021 13:43:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610055809; cv=none;
        d=google.com; s=arc-20160816;
        b=iovQQwjx6CYj95D6mfw6TTt8UbHjMFqBBmA9VqDfNBstZ/1pG4rLtk7/33isd5i2IB
         aFCV+5oAE06xxav8CZTHhh+wWn2vtwFxDb+OMGYOcROt96qHuRuNIkvwekhDJtQ5aZNA
         a0uNZ+ZLfnrL6EsU8jl+o/tQ8uR9eJ+uGvVMYZTXXWlXpVLIrccl0cxhkA3RJWl9svu0
         bH6HObZCZTUFtziVduJIW5FvZ9m2gP/L7pVRS8Jq+xqvaGYa7kyc6Rfef1t7miaeM5QZ
         qBHiTRldok6QXzU2ZGk9SvPrGTV+n7YkJ5kqJMLG8TXbPF5Vy1KHtq7OugAvLhWdk4j3
         WA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:message-id:date:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1JT21Ksn1nsFZ4DghxP3AoXJYW1SnYHBOVRlgQU7MUM=;
        b=g+OURw2Ubf/Ci2P/HkjTbh3LHltmNTwb8QhluqxM2byKseSHCS8eHkXmRVhHqftLhl
         TaEQXYQu43Do69e0GRmiXhRKUdqzBrd0wgb6BKtABlvVnClN2cVV264E4gbCBy7ZmBHy
         t/mPb8yDWhVtY0pZ8AFzsaJm6mqvCPNYW0Cgi8nhWT1a7LjuPTNUensJzSUvLgW0iaqY
         qtSPxNS1s6aEpGXSDlfXGE4hNT2oZX2xOtcjK3w+6fzlSEQbmiron9iMzOkOt2gy7iNv
         Bcz3MXwzEPwfhsEvcj1T56l3tSEmuMQUZaGntxTBa/uZr6qH2A0hWoiV0ohrCIvkmXx0
         8vIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b="Km/BQSKu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si7564057ybo.478.2021.01.07.13.43.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 13:43:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b="Km/BQSKu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:47442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxd44-0001kX-TU
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 16:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kxd3w-0001k2-57
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 16:43:20 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:44658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kxd3t-0006lk-JW
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 16:43:19 -0500
Received: by mail-lf1-x12a.google.com with SMTP id m25so18003783lfc.11
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 13:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1JT21Ksn1nsFZ4DghxP3AoXJYW1SnYHBOVRlgQU7MUM=;
 b=Km/BQSKuzBOZTlgvydjgbBUwESiai4bRFItpsb5P+IntSnyZOVXE8epw97J1p2Or/l
 ybjToe+IoZL0eRt9YEBDDFbYw99aRnPOFnsOnX32KwQpoOjM+P1gdlG6rZMxYUD94jzW
 Kco5U3yuuPpz5Ky0fzEFkTFmGpHvUAdNnEvWzXgSJlj+xzz5V0cX8iEcJYkTqdL98zc3
 7xIwJUSW9jCfiD/6mW4Xhuw2NvuemLpq7Asr/ArQp2lWKSmKet1PJk8yQ1dT/SDZ7xpN
 +S4mgEBPgWzN/hP1CsB9DvUjOPw6rQPC07xMaCb/XXgbk+MaUx89OUnmM5tNveZneQNd
 CWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1JT21Ksn1nsFZ4DghxP3AoXJYW1SnYHBOVRlgQU7MUM=;
 b=iak933GBtO51l1hQZP3pQBW2sP11uL1z1dkcGrSDT2xeLA+HjwZXaujnsB9Xgv18dS
 8xYjibA98IwPPm5OjGKaArD6W17tGtJShxEIE6CqTxzy311456EPTM82wQiSl4NU8p5J
 Hm9XUav/ZBd6LXKUk0pDegX8wPhegg+xBmaBUDUdT8wgCquvYhj9FFLHQqfbt0WdhwEk
 umb9q64rPaFbgRyLmEGIFXbTDuafy0EEj8Llb+BssGste35bHPVN+kKfoS40cfngawtm
 oEOG23wt0bBF1tIw/r/uCiVgf4DOk/DM+wH2BQM3BF8r39M1k2UUeLqsxue/x2KKzHgD
 8X7Q==
X-Gm-Message-State: AOAM530EB/l1C81ws5I5M5KoqVR/GacFHQsrjp5tLim7uqQR5YGrW3H7
 5AwE8wJxGAeyLzbKC9RFgsIdxG4WTR0eo2LWsK5/rA==
X-Received: by 2002:a05:651c:217:: with SMTP id
 y23mr175289ljn.247.1610055792309; 
 Thu, 07 Jan 2021 13:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
 <20201217004349.3740927-3-wuhaotsh@google.com>
 <CAFEAcA_jEYK_e7uoJCKn=+om8c6cCRW0Xt5TKi6mzto+zE44Fg@mail.gmail.com>
In-Reply-To: <CAFEAcA_jEYK_e7uoJCKn=+om8c6cCRW0Xt5TKi6mzto+zE44Fg@mail.gmail.com>
Date: Thu, 7 Jan 2021 13:43:01 -0800
Message-ID: <CAGcCb12=joJd4GDgLu249HfN6FrzJ-a+OQz=a5c0t4Upd_W+eA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000924a2905b8565325"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -179
X-Spam_score: -18.0
X-Spam_bar: ------------------
X-Spam_report: (-18.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.382,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-arm@nongnu.org>
X-TUID: ygYfiOBVOzFo

--000000000000924a2905b8565325
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 7, 2021 at 12:51 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 17 Dec 2020 at 00:45, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > This patch makes NPCM7XX Timer to use a the timer clock generated by the
> > CLK module instead of the magic number TIMER_REF_HZ.
> >
> > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > ---
> >  hw/arm/npcm7xx.c                 |  5 +++++
> >  hw/timer/npcm7xx_timer.c         | 25 ++++++++++++++-----------
> >  include/hw/misc/npcm7xx_clk.h    |  6 ------
> >  include/hw/timer/npcm7xx_timer.h |  1 +
> >  4 files changed, 20 insertions(+), 17 deletions(-)
>
> > @@ -130,7 +130,7 @@ static int64_t
> npcm7xx_timer_count_to_ns(NPCM7xxTimer *t, uint32_t count)
> >  {
> >      int64_t ns = count;
> >
> > -    ns *= NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ;
> > +    ns *= clock_get_ns(t->ctrl->clock);
> >      ns *= npcm7xx_tcsr_prescaler(t->tcsr);
>
> I'm afraid that since you wrote and sent this we've updated the
> clock API (in commits 554d523785ef868 and de6a65f11d7e5a2a93f),
> so clock_get_ns() doesn't exist any more. Instead there is
> a new function clock_ticks_to_ns().
>
> The idea of the new function is that clocks don't necessarily
> have a period which is a whole number of nanoseconds, so
> doing arithmetic on the return value from clock_get_ns()
> introduces rounding errors, especially in the case of
> "multiply clock_get_ns() by a tick count to get a duration".
> (The worst case for this is "clock frequency >1GHz", at which
> point the rounding means that clock_get_ns() returns 0...)
>
> There is as yet no function for "convert duration to
> tick count", so code like:
>    count = ns / clock_get_ns(t->ctrl->clock);
>
> should probably for the moment call clock_ticks_to_ns()
> passing a tick count of 1. But I plan to write a patchset
> soon which will avoid the need to do that.
>
> Strictly speaking, even "call clock_ticks_to_ns() and
> then multiply by the prescaler value" can introduce
> rounding error; to deal with that I think you'd need to
> either have an internal Clock object whose period you
> adjusted as the prescalar value was updated by the guest,
> or else do arithmetic with the return value of clock_get()
> (which is in units of 2^-32 ns); I'm not sure either is
> worth it.
>
In this particular case, rounding error is less of a concern since the
clock should be ~25MHz (in the old implementation it was a fixed value.)

Since the prescaler is always an integer, a possible alternative might be
ns = clock_ticks_to_ns(t->ctrl->clock, count *
npcm7xx_tcsr_prescaler(t->tcsr))

and for code to convert ns to count can go
count = ns / clock_ticks_to_ns(t->ctrl->clock,
npcm7xx_tcsr_prescaler(t->tcsr))
or use the new API you proposed.

We'll also need to apply similar changes to other places in the patchset
(ADC and/or PWM) that need to compute clock value.

>
> thanks
> -- PMM
>

--000000000000924a2905b8565325
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 7, 2021 at 12:51 PM Peter May=
dell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Thu, 17 Dec 2020 at 00:45, Hao Wu &lt;<a href=3D"mailto:wuhaotsh@googl=
e.com" target=3D"_blank">wuhaotsh@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This patch makes NPCM7XX Timer to use a the timer clock generated by t=
he<br>
&gt; CLK module instead of the magic number TIMER_REF_HZ.<br>
&gt;<br>
&gt; Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@googl=
e.com" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
&gt; Reviewed-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" tar=
get=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/arm/npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 5 +++++<br>
&gt;=C2=A0 hw/timer/npcm7xx_timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 25 +=
+++++++++++++-----------<br>
&gt;=C2=A0 include/hw/misc/npcm7xx_clk.h=C2=A0 =C2=A0 |=C2=A0 6 ------<br>
&gt;=C2=A0 include/hw/timer/npcm7xx_timer.h |=C2=A0 1 +<br>
&gt;=C2=A0 4 files changed, 20 insertions(+), 17 deletions(-)<br>
<br>
&gt; @@ -130,7 +130,7 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTi=
mer *t, uint32_t count)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int64_t ns =3D count;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 ns *=3D NANOSECONDS_PER_SECOND / NPCM7XX_TIMER_REF_HZ;<=
br>
&gt; +=C2=A0 =C2=A0 ns *=3D clock_get_ns(t-&gt;ctrl-&gt;clock);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ns *=3D npcm7xx_tcsr_prescaler(t-&gt;tcsr);<br>
<br>
I&#39;m afraid that since you wrote and sent this we&#39;ve updated the<br>
clock API (in commits 554d523785ef868 and de6a65f11d7e5a2a93f),<br>
so clock_get_ns() doesn&#39;t exist any more. Instead there is<br>
a new function clock_ticks_to_ns().<br>
<br>
The idea of the new function is that clocks don&#39;t necessarily<br>
have a period which is a whole number of nanoseconds, so<br>
doing arithmetic on the return value from clock_get_ns()<br>
introduces rounding errors, especially in the case of<br>
&quot;multiply clock_get_ns() by a tick count to get a duration&quot;.<br>
(The worst case for this is &quot;clock frequency &gt;1GHz&quot;, at which<=
br>
point the rounding means that clock_get_ns() returns 0...)<br>
<br>
There is as yet no function for &quot;convert duration to<br>
tick count&quot;, so code like:<br>
=C2=A0 =C2=A0count =3D ns / clock_get_ns(t-&gt;ctrl-&gt;clock);<br>
<br>
should probably for the moment call clock_ticks_to_ns()<br>
passing a tick count of 1. But I plan to write a patchset<br>
soon which will avoid the need to do that.<br>
<br>
Strictly speaking, even &quot;call clock_ticks_to_ns() and<br>
then multiply by the prescaler value&quot; can introduce<br>
rounding error; to deal with that I think you&#39;d need to<br>
either have an internal Clock object whose period you<br>
adjusted as the prescalar value was updated by the guest,<br>
or else do arithmetic with the return value of clock_get()<br>
(which is in units of 2^-32 ns); I&#39;m not sure either is<br>
worth it.<br></blockquote><div>In this particular case, rounding error is l=
ess of a concern since the clock should be ~25MHz (in the old implementatio=
n it was a fixed value.)</div><div><br></div><div>Since the prescaler is al=
ways an integer, a possible alternative might be</div><div>ns =3D clock_tic=
ks_to_ns(t-&gt;ctrl-&gt;clock, count * npcm7xx_tcsr_prescaler(t-&gt;tcsr))<=
/div><div><br></div><div>and for code to convert ns to count can go</div><d=
iv>count =3D ns / clock_ticks_to_ns(t-&gt;ctrl-&gt;clock, npcm7xx_tcsr_pres=
caler(t-&gt;tcsr))<br></div><div>or use the new API you proposed.</div><div=
><br></div><div>We&#39;ll also need to apply similar changes to other place=
s in the patchset (ADC and/or PWM) that need=C2=A0to compute clock value.</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--000000000000924a2905b8565325--
