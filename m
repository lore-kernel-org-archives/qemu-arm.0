Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10533406wrv;
        Sat, 10 Aug 2019 08:02:38 -0700 (PDT)
X-Received: by 2002:a50:a48a:: with SMTP id w10mr28038933edb.1.1565449358864;
        Sat, 10 Aug 2019 08:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565449358; cv=none;
        d=google.com; s=arc-20160816;
        b=I0XlKJmOmTzx67NhjGyR3yS3nG2szOaMY4TojjFygtvKfXGlv96qEUijdCPKmuCK2h
         InKW5rHXwl2E0CrycMy1bM4Zwu2XNBaxhNBGRavPDC3A4nW8DpuVanMDoGKedUeTkhxS
         Un505iDAjogTjRNRa0Tna8VFxBLuzZ+Wc04lw2qrzXtY1fY7CJI5DPNQTtxDpDnnxPhJ
         MmQn3xYMzhy6Bb2LTGy+I0ldwUuC2CtFBbgvJsmFSWVKXxuLF5EORMe2Kd08v4b++KTi
         p+RW754mHzt4VtOMQpVorA4/JTkygAignEIwVbim69/8SvuIkKKsIIQ0+exiR/498W0k
         lFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fDnsth2h1POiujYrGxb25pD2xpHYZG7FBZyBA3aoEiU=;
        b=rgGgY8VKFBie/PMALJIqPuJopas/kmd81zuGgEVNdHU+IQAceJoTZ36eyAbzocXKlJ
         iGhroQM3m3b4jDjt+rUlAqtog4lT58xXAfX7U4vkAs588rT4o/BWPrBy1moSXxNlDoQL
         UDgA7s2TINURizVliJHnzLN0rtCvWdiYe50aEdQPnVRUHBmsJSc67djv3fi4EI7LuDgJ
         yPnF+VOUR951hKXYm1tKjsZK59MB9Z/cDKcstwysJivgJ678CyP+zQes0ymjC3tVqCtQ
         IT45bZYLQ0wrZMvGoNvCEF15DC8lGTQJ8o4YBKTnmaU4l/BtkzA1Nf3V4LA1jTifkcYK
         2WqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OLhSs9pa;
       spf=pass (google.com: domain of estebanbosse@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=estebanbosse@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <estebanbosse@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m20sor37928345ejk.32.2019.08.10.08.02.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 10 Aug 2019 08:02:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of estebanbosse@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=OLhSs9pa;
       spf=pass (google.com: domain of estebanbosse@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=estebanbosse@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fDnsth2h1POiujYrGxb25pD2xpHYZG7FBZyBA3aoEiU=;
        b=OLhSs9paRV1N7GfdzkeMUKnw6D7oJbJx4mfacmRkzcKj2DDUfczONCgHmyTSOTQkKm
         pRKJ1T59dpYohd47hpJj6RkW/frZjjNn5RKL/jWADnkt4t4UBtDM0JJZHJN8uL74+NTP
         l4FFHIi//1Gt3qOIx6Dcb5dLjm2xvxWf0MI/nTIX978Pn2cdvtk0+YO1phfy+Z22yIPW
         rNn/KhKYMYYzRJb/pk+WI23KhoFDr+rRjo8g1n3GvyA8EwyhNr4ZL0YIpjqhJHkHeGS6
         7MISB5wPnjaAH0PYvWOD4+RykUFz63C2c7NROXd/n21lgm5NJI5eSKsp+6AaT4rg9xZi
         n+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fDnsth2h1POiujYrGxb25pD2xpHYZG7FBZyBA3aoEiU=;
        b=QZJxgu8m7+MZX1lDwEaK5AJaYItv/I8PK0hMQmjOK8We5YfwnYc60MVQsxvVxXyY+T
         mA7A1Sef8lfVJQwPC/yQqPigXCdW1L/2gxnFkKk0/TzbZWuKd3XzhO8Q4V0g0Q4E1XQU
         fSVZN555qUaoeOKHCzpG169n6EmsZTAuHuyeRtiiIEM/93aqMYnpGFsPzqYs2GxL4OJe
         KWkGMxloX7bkFuNaUC1CwoSFqHaDqFNcWR9tpStu6eVrUPje4paYHS1TeayHUSkRDhM8
         RTZESMeUeb9tkgk1rN/O33ZxScggmJDkvLhQGIbbdwcZrx6Hw31k3IEE7VJxZA1oaOSH
         +MfA==
X-Gm-Message-State: APjAAAWQj4vr/23bg/DQxvGAdPf0Lqel3qxh6NWI3tcTfHHS/Vt258TL
	0LEykd1KfoXznrX8GOxcnma8I5mTVt8ID7aSb+qJjg==
X-Google-Smtp-Source: APXvYqwnLqTUdhD/zCPsL2ZpID0cRT+wS+tqbiMaTYT3Gx0DF6ryPJ/sgwluqhLH+yCAZT0SRQ3AbXK3E5euCyshAXw=
X-Received: by 2002:a17:906:838a:: with SMTP id p10mr22692985ejx.237.1565449358384;
 Sat, 10 Aug 2019 08:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAGbAg_ANKR9zyAp3+pNRo6eVydQPaWrny62xk5NWr0DOD-7Jxg@mail.gmail.com>
 <87imr5uydx.fsf@linaro.org>
In-Reply-To: <87imr5uydx.fsf@linaro.org>
From: Esteban Bosse <estebanbosse@gmail.com>
Date: Sun, 11 Aug 2019 00:02:31 +0900
Message-ID: <CAGbAg_A5sWjJrOPniuUycY5cM+35D5qijCDNkhj90weWNyfKxQ@mail.gmail.com>
Subject: Re: [Qemu-arm] Beagle Board support
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000eba260058fc49445"
X-TUID: s8OE4LInt95j

--000000000000eba260058fc49445
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El s=C3=A1b., 10 ago. 2019 19:07, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 escribi=C3=B3:

>
> Esteban Bosse <estebanbosse@gmail.com> writes:
>
> > Hi,
> >
> > I am new in this world, but I want to port the old beagle support for
> > qemu-linaro to mainstream.
>
> I think the main problem is the chip is no longer supported by TI and I
> guess less likely to be supported in upstream OSes in the future.
>
:/

>
> > Someone is actually working on it or is interested?
>
> Not that I'm aware of. If you want to do the port and are willing to be
> a maintainer of it going forward then I guess it would be doable. Is
> there any particular reason you want it in upstream rather than just
> using the old qemu-linaro branch for your use case?
>
There is no big reason, I just want to learn and I believe that is a good
project  to start beacouse it "works" (with the old api) and I can use it
as base.

>
> --
> Alex Benn=C3=A9e
>
>

--000000000000eba260058fc49445
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">El s=C3=A1b., 10 ago. 2019 19:07, Alex Benn=C3=A9e &lt=
;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; e=
scribi=C3=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Esteban Bosse &lt;<a href=3D"mailto:estebanbosse@gmail.com" target=3D"_blan=
k" rel=3D"noreferrer">estebanbosse@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am new in this world, but I want to port the old beagle support for<=
br>
&gt; qemu-linaro to mainstream.<br>
<br>
I think the main problem is the chip is no longer supported by TI and I<br>
guess less likely to be supported in upstream OSes in the future.<br></bloc=
kquote></div></div><div dir=3D"auto">:/</div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; Someone is actually working on it or is interested?<br>
<br>
Not that I&#39;m aware of. If you want to do the port and are willing to be=
<br>
a maintainer of it going forward then I guess it would be doable. Is<br>
there any particular reason you want it in upstream rather than just<br>
using the old qemu-linaro branch for your use case?<br></blockquote></div><=
/div><div dir=3D"auto">There is no big reason, I just want to learn and I b=
elieve that is a good project=C2=A0 to start beacouse it &quot;works&quot; =
(with the old api) and I can use it as base.=C2=A0</div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
--<br>
Alex Benn=C3=A9e<br>
<br>
</blockquote></div></div></div>

--000000000000eba260058fc49445--
