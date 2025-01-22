Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp590943njc;
        Tue, 21 Jan 2025 22:35:30 -0800 (PST)
X-Received: by 2002:ac2:4541:0:b0:542:91f3:1514 with SMTP id 2adb3069b0e04-5439bf5f5a0mr5474539e87.1.1737527730654;
        Tue, 21 Jan 2025 22:35:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737527730; cv=none;
        d=google.com; s=arc-20240605;
        b=MUHlyyGmqCOu64JVbsZ1rfL98oQCu/lqH0Q5SYfTbxx+e59riYu8d10oVhPYFhaJGj
         xEa7TC4/aB/aWMzxm0z3pDx+Te+mFJvpkwqwG5BkF55JRzuJSsnxD0QH8U0Cw9pAGQJn
         /+PJkjjsmck9/P7eXbTn9NkRvfWRUBaTQfaaTpvT+cZc9e1ITPk7xUTQaUB6r4N2aOc5
         GhyFBhGt2Zf4N9L3Rrpj2t+/MToPKsrPmqwKxvo8Z7iRYKgpUu3N8uKGjyaxBQyYB4Oc
         eMeQsv3Rmt25Qap2TQEwSsPC9lSYqiDr9xBzCQJ6BQB/BKckHYL0P5SoYke/H/0EoH5A
         83sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gdxYfllRzhoneMx3pMfJf8yMHFmAxAok/ncwrQ6oC3Y=;
        fh=xDb5JU30SbBq30TIkvO66RKTcYGQUbKPbuQbH68yP7Y=;
        b=b+VF0BzddkjhhQbl8UJsFhEHfVR77ZX1fF/WQgHgq9Dz22dPX3K4BWSrRnMxByRaI/
         gK5RmaSAtV4tB1/KKkwYflGlwRSRAQJRC3hWv7IoxGZlVTgO55J2QcaNzoO5Zp/E2VuZ
         OjYCxMMaSlJ1s7PGRz0OmOPbKx3vISogIGA5bsKeLB038vIybySgu8oRaLIjdGBHTyd0
         cggCJI8+pPKBwKprWef8ycUqGw9XPG7370xDmS+/H2HMRTFONdp99+IECo73LcUvMpfV
         FrwebsXkeiwUoRT6DK3nOqDUHJzquk8pTQUhUBfnKRzSn2knXt+mvFf4qc5hBMqvi/qt
         ALbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=wam+sJGo;
       spf=pass (google.com: domain of wuhaotsh@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=wuhaotsh@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <wuhaotsh@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-543bb299927sor120833e87.4.2025.01.21.22.35.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 22:35:30 -0800 (PST)
Received-SPF: pass (google.com: domain of wuhaotsh@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=wam+sJGo;
       spf=pass (google.com: domain of wuhaotsh@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=wuhaotsh@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737527730; x=1738132530; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gdxYfllRzhoneMx3pMfJf8yMHFmAxAok/ncwrQ6oC3Y=;
        b=wam+sJGoZZwvkg4EqltTCdoJ4rLQlrotYnTbOaHe/UmGc3Ft53pfrewbRarc9tPJ3Q
         CKHO6E5Stz/+neaDNvcrxzcvBEVaLgftJj8woU6qkoSESZWZMDdKcC0kxXCvJmK7KP2+
         nJkLe+UfuEpl1qjS1Wni8b6Mnmp6scuErQSxKcpMB0hKT2NljHvhmhYf7QKsk4E8ee2e
         5nputz1bDPH7M0xTUCYN/bnrnShEmPScLsyDpAhbiymHrOGXrzODY95QkYHasY0vCDsf
         ZU3XOGmoDhe6vdyPO/X8+tvu65bFtfoxjP9e2uK368eGS5mx6UHUHuNlteWCdQWiscUh
         21Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737527730; x=1738132530;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdxYfllRzhoneMx3pMfJf8yMHFmAxAok/ncwrQ6oC3Y=;
        b=hHTzpit8q8yKz6R1p42fdfqQmaL43IanNqyNCNyNCclclfZ61m/909nMCgWyEi5Wud
         zTz8feFLmdVnf8YDAoVsrCmgIcA3fPIxJw2Uzk/ZWgWcnO8mhgphuUC2UgttBTRsNO1a
         hEFsD2iWBXApThYr5cnkPZ1yk1JX4xpw4eozStGN6FuqRHJWtBVQ6BLMSgz0Z/MfIo5t
         m1ESycwbVvBgpt20nsJuOJZWMH2BBQa109EVhmC7ko5q8SK+h2DzJ+B+GYf7rHhktX5l
         HvO7i5McZm+cv1pMOVko1wEfY61m8DaKdKsIYZdcu8IzfYM2QLDKRFih3mg1/F2R01/Z
         kbsw==
X-Gm-Message-State: AOJu0YzYpPASgaqRe93i/4MHSM+ra9kBoqT38h3gCCGK+FH3GvQf0JOd
	Z4rAnYbzI2HP3ZEaCfoltO4p/9gn8m+bK5MQhNPUUX86bO6fhuIqKjGEzTNFzw2dhBuh738kGPa
	bek6OZpqGxqy5O/U/yrKJryyiWsF4aVbUcNmXwcUF6H9fAGkuWQ==
X-Gm-Gg: ASbGncvaTdDBKgpBGs1Im8Ski354GWMvTOxsQXHI32A+w6YSMz1THzkG9A1NC8Jr7Ka
	Wj8ljHTR4wE4XSXcrVDDHOCoISfyPVDXTjtV1yzSekyw1RJDEdrC5WD2qxjpzBsxb8x85
X-Google-Smtp-Source: AGHT+IGao4YF2WyoJUrdgcw+zGQfyv1+kwDcVjXcjFm0DFIYu9O3lYMlkuIrPJFU8SaVXLAP3sXucQwZmUsH2Aibnas=
X-Received: by 2002:ac2:434b:0:b0:543:a58f:f06a with SMTP id
 2adb3069b0e04-543bcc9400amr99813e87.5.1737527729526; Tue, 21 Jan 2025
 22:35:29 -0800 (PST)
MIME-Version: 1.0
References: <20250120150049.3611864-1-alex.bennee@linaro.org>
 <CAGcCb10gHVZdN6CbUm02w7jTaUUoBH4-VTohmy+yiP1OLWFBxg@mail.gmail.com> <87ed0wpiy9.fsf@draig.linaro.org>
In-Reply-To: <87ed0wpiy9.fsf@draig.linaro.org>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 22 Jan 2025 14:35:18 +0800
X-Gm-Features: AbW1kvYtqbZ7BetA7sI30RVxVrU0EKcBgCUNU4oK5YnFhy30iLuf46rdTtk89N4
Message-ID: <CAGcCb10qKaXQJCyBBs9mPWKM+zLUSWSVV63BRV7d=Qa1hB8oGQ@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/qtest: don't step clock at start of npcm7xx
 periodic IRQ test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Tyrone Ting <kfting@nuvoton.com>, 
	Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "open list:Nuvoton NPCM7xx" <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000001b9e51062c45b377"
X-TUID: YKWUhpYsqvi9

--0000000000001b9e51062c45b377
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 6:20=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:

> Hao Wu <wuhaotsh@google.com> writes:
>
> > Have you tried that the test can pass with this? If I remember
> correctly, interrupt won't trigger properly if not advancing the
> > timer
>
> Yes but the IRQ has yet to be enabled at this point.
>
I believe that's the case,  so we should be able to remove this line in the
test.

>
> >
> > If the test passes it's probably fine to remove that.
>
> Of course.
>
> >
> > On Mon, Jan 20, 2025 at 11:00=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@=
linaro.org>
> wrote:
> >
> >  Until there are timers enabled the semantics of clock_step_next() will
> >  fail. Since d524441a36 (system/qtest: properly feedback results of
> >  clock_[step|set]) we will signal a FAIL if time doesn't advance.
> >
> >  Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> >  ---
> >   tests/qtest/npcm7xx_timer-test.c | 1 -
> >   1 file changed, 1 deletion(-)
> >
> >  diff --git a/tests/qtest/npcm7xx_timer-test.c
> b/tests/qtest/npcm7xx_timer-test.c
> >  index 58f58c2f71..43711049ca 100644
> >  --- a/tests/qtest/npcm7xx_timer-test.c
> >  +++ b/tests/qtest/npcm7xx_timer-test.c
> >  @@ -465,7 +465,6 @@ static void test_periodic_interrupt(gconstpointer
> test_data)
> >       int i;
> >
> >       tim_reset(td);
> >  -    clock_step_next();
> >
> >       tim_write_ticr(td, count);
> >       tim_write_tcsr(td, CEN | IE | MODE_PERIODIC | PRESCALE(ps));
> >  --
> >  2.39.5
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

--0000000000001b9e51062c45b377
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 21,=
 2025 at 6:20=E2=80=AFPM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee=
@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hao Wu &lt;<a href=3D"mailto:wuhaotsh@go=
ogle.com" target=3D"_blank">wuhaotsh@google.com</a>&gt; writes:<br>
<br>
&gt; Have you tried that the test can pass with this? If I remember correct=
ly, interrupt won&#39;t trigger properly if not advancing the<br>
&gt; timer<br>
<br>
Yes but the IRQ has yet to be enabled at this point.<br></blockquote><div>I=
 believe that&#39;s the case,=C2=A0 so we should be able to remove this lin=
e in the test.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; If the test passes it&#39;s probably fine to remove that.<br>
<br>
Of course.<br>
<br>
&gt;<br>
&gt; On Mon, Jan 20, 2025 at 11:00=E2=80=AFPM Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org=
</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 Until there are timers enabled the semantics of clock_step_next(=
) will<br>
&gt;=C2=A0 fail. Since d524441a36 (system/qtest: properly feedback results =
of<br>
&gt;=C2=A0 clock_[step|set]) we will signal a FAIL if time doesn&#39;t adva=
nce.<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.benne=
e@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br></blockqu=
ote><div>Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuh=
aotsh@google.com</a>&gt;=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0tests/qtest/npcm7xx_timer-test.c | 1 -<br>
&gt;=C2=A0 =C2=A01 file changed, 1 deletion(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/tests/qtest/npcm7xx_timer-test.c b/tests/qtest/npcm=
7xx_timer-test.c<br>
&gt;=C2=A0 index 58f58c2f71..43711049ca 100644<br>
&gt;=C2=A0 --- a/tests/qtest/npcm7xx_timer-test.c<br>
&gt;=C2=A0 +++ b/tests/qtest/npcm7xx_timer-test.c<br>
&gt;=C2=A0 @@ -465,7 +465,6 @@ static void test_periodic_interrupt(gconstpo=
inter test_data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tim_reset(td);<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 clock_step_next();<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tim_write_ticr(td, count);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tim_write_tcsr(td, CEN | IE | MODE_PERIODIC =
| PRESCALE(ps));<br>
&gt;=C2=A0 -- <br>
&gt;=C2=A0 2.39.5<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
</blockquote></div></div>

--0000000000001b9e51062c45b377--
