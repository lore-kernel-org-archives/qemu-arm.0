Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10556045wrv;
        Sat, 10 Aug 2019 08:24:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxsUunc8tvhw9+VD47f1Iky2CjwiMr8aL4Rt9c78aOROergebaW6Fh9TOiHNIMvPKuvh+JN
X-Received: by 2002:a17:906:b211:: with SMTP id p17mr23247143ejz.11.1565450652361;
        Sat, 10 Aug 2019 08:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565450652; cv=none;
        d=google.com; s=arc-20160816;
        b=ZA+ITJl+zuHBhPovtL1hBwDe5kcsGYR/Gw+yb/B43OubDcE9QGAk2S9gDFETUtACJr
         mQnEvIKu5TRfRM+908zY3XUwdI1sVaQPjgesXyRwJVSBIQ8oXODj4ThMcA3mL4O+ADNu
         xlKweXmHS8OHdQcm/Wu0FddzbnsyBxeRSw8sTpD2krQVk/pevZWpeO1j0BaQzU8a03wb
         j5Y8RaAjVAtncoCZFEwsJmOTY/rwVdiN/eY2vc9GPjMlPOXqEDg+mVln1L9kN7B6UM4Q
         fc7F1JWbKk8WoTJI7xoVSBHEG0a/aRsOLJA9bkZyNXt/EsJi4yRkgkCGghdlu5433dTL
         tyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pUvlgD/rAn2NA2f9BZ++ceLelMbRk4xjT6RD5kRiGUc=;
        b=dFnh4PKuig4AwJPy7Bi3z5x+o6aTe0wBLyvr4szmMD71SucS+1O7vFv55Hf12ZBaH2
         4tpNx74ldxNxJnK0JvPLo06FY9tHpuO5lY2Xdu5cijIXrg/rQ49pQxccQBi0+6sAKq1r
         wmbTEwmsainbaYH8jU8w22pyzmaC64Mq5u4zpQmioBd/MybIchPrRrBvAd4er7SVs2W2
         BtE/rziIUchaPPKEF3xkXWES58uvHMrVuAUwJZSBcxfY0J9xzBq438Wome+ChrMXC4aP
         mOvESY670VqGJ5a3NJ+Ii8v2wMNOWZAwH5tMrLD+1ToB9q15KhyduRPT+C/S176ymHsA
         POqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z9XzFR8q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si4521057ejq.204.2019.08.10.08.24.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Aug 2019 08:24:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z9XzFR8q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hwTE3-0002hU-Fq
	for alex.bennee@linaro.org; Sat, 10 Aug 2019 11:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44572)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <estebanbosse@gmail.com>) id 1hwTDy-0002bv-6L
 for qemu-arm@nongnu.org; Sat, 10 Aug 2019 11:24:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <estebanbosse@gmail.com>) id 1hwTDx-00056b-2z
 for qemu-arm@nongnu.org; Sat, 10 Aug 2019 11:24:06 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:33899)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <estebanbosse@gmail.com>)
 id 1hwTDw-00055f-Rx
 for qemu-arm@nongnu.org; Sat, 10 Aug 2019 11:24:05 -0400
Received: by mail-ed1-x535.google.com with SMTP id s49so64180300edb.1
 for <qemu-arm@nongnu.org>; Sat, 10 Aug 2019 08:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pUvlgD/rAn2NA2f9BZ++ceLelMbRk4xjT6RD5kRiGUc=;
 b=Z9XzFR8qxAZ85B9W/5zfzSJzZrMOvUWkf0m8RKV8i1XUMob5A5tjvbl5jw5y0fMJAI
 9U95NvLU94dbh9Pj1A0fj9Ws9OviGS0l/ku+mpWT5kF7hNFXCmBt6dXP/P0XOlGMChD7
 Tpehw2k5aIKPoRzIJmzFHVpC4jQTXFPfSu6yv4+K6uSEdZFi6YrgceEQFYKaHrWDvp6C
 lrp5JOGOOIkIpu9kkaei+ab8n6Gh0aPi7gJQjnPfZzJFquTc8GaqmzjNnksUpK/g1ASP
 38MMCp/VbFBufrP/pXAIbIDMEEOAPiB5W17xsLIJy7TTFIB64t0RvgHTLW/qt3EHrPng
 vc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUvlgD/rAn2NA2f9BZ++ceLelMbRk4xjT6RD5kRiGUc=;
 b=entvriaLsHXYitygXwGRoECzrkmtDga8MUdKgV9m6K+dJOc4PXARo+1IVGsDyrU+Ro
 y2t2fJEUJ9Fh0YjMDl5XYEGo+9dPxgRtsHuz+vBLG7teC2JIFUJNbs14dH7XFkYx0ukU
 Qt22wOWa8H+rcjjZkOrtTyZeWpos+Oqmxt5JTWIyE+yaTqyGpGtg6sbqBxH+0qLeqn3d
 GSe37O+J/kSlwHZrJCUmQUEY8ADCGcNnFb3hbEsEZ858E7s7B9rjWDDpoPEKU3XZSUr+
 8qXvILmn3Laz6nqslqYSV6d6evFhZWglJg7n4LrzvEbrd6MedbcV2rdy0mcekFa+Pleh
 k9zQ==
X-Gm-Message-State: APjAAAU4pjuZJrpn4IF7gKaAxvo1+tSxttwwClSEOcVEHTvVL4PFy0cl
 ZhRYURhJkG3tp4ev9BuFcnGzl0019+jjbCoLDQU=
X-Received: by 2002:a50:8752:: with SMTP id 18mr15858617edv.96.1565450643713; 
 Sat, 10 Aug 2019 08:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAGbAg_ANKR9zyAp3+pNRo6eVydQPaWrny62xk5NWr0DOD-7Jxg@mail.gmail.com>
 <CAFEAcA8jh7zxb02Yv-R4h-x99bsGjAg9zQMNgiSc=SQcthnyXw@mail.gmail.com>
In-Reply-To: <CAFEAcA8jh7zxb02Yv-R4h-x99bsGjAg9zQMNgiSc=SQcthnyXw@mail.gmail.com>
From: Esteban Bosse <estebanbosse@gmail.com>
Date: Sun, 11 Aug 2019 00:23:57 +0900
Message-ID: <CAGbAg_C002NyTSesdAj5iqWo07pP03EBbVx7OBkqZgqvRZ8J7Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000088337d058fc4e142"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::535
Subject: Re: [Qemu-arm] Beagle Board support
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5YX4TmJWZbgz

--00000000000088337d058fc4e142
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El s=C3=A1b., 10 ago. 2019 23:01, Peter Maydell <peter.maydell@linaro.org>
escribi=C3=B3:

> On Sat, 10 Aug 2019 at 04:39, Esteban Bosse <estebanbosse@gmail.com>
> wrote:
> > I am new in this world, but I want to port the old beagle support for
> qemu-linaro to mainstream.
>
> That would certainly be nice. The major issue is that the
> patchset in that tree is (a) often in an older style
> of API that would need to be updated to use the current
> recommended-practice APIs to go upstream, and (b) in
> some places still has multiple changes tangled together
> that would need to be disentangled to form a clean
> reviewable patchset.
>
(a) Sounds "not impossible" then for a beginer, hahaha.
I am looking other boards like Musca to use it as example

(b) I don't know yet how to make the patches I have to learn everything.


> I'm happy to provide advice and code review if you're
> interested in doing this work and helping to maintain
> it in the upstream tree.
>

Yes! I am interested, I have a repo where I am doing my firsts trys to
understand how qemu and the beagle are.

How do you recommend to start?
I think that I can understand some things in the old beagle.c file but the
omap3.c it's more heavy.
Maybe I can start with de omap3.c trying to refactor and split it in more
files styled for the new API.

What files do you recommend to read to try to understand more about the CPU
model?


> thanks
> -- PMM
>
Thank you!

>

--00000000000088337d058fc4e142
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">El s=C3=A1b., 10 ago. 2019 23:01, Peter Maydell &lt;<a=
 href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank" rel=3D"noreferr=
er">peter.maydell@linaro.org</a>&gt; escribi=C3=B3:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On Sat, 10 Aug 2019 at 04:39, Esteban Bosse &lt;<a href=3D=
"mailto:estebanbosse@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">estebanbosse@gmail.com</a>&gt; wrote:<br>
&gt; I am new in this world, but I want to port the old beagle support for =
qemu-linaro to mainstream.<br>
<br>
That would certainly be nice. The major issue is that the<br>
patchset in that tree is (a) often in an older style<br>
of API that would need to be updated to use the current<br>
recommended-practice APIs to go upstream, and (b) in<br>
some places still has multiple changes tangled together<br>
that would need to be disentangled to form a clean<br>
reviewable patchset.<br></blockquote></div></div><div dir=3D"auto">(a) Soun=
ds &quot;not impossible&quot; then for a beginer, hahaha.=C2=A0</div><div d=
ir=3D"auto">I am looking other boards like Musca to use it as example</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">(b) I don&#39;t know yet how =
to make the patches I have to learn everything.=C2=A0</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
I&#39;m happy to provide advice and code review if you&#39;re<br>
interested in doing this work and helping to maintain<br>
it in the upstream tree.<br></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"></blockquote></div></div><div dir=3D"auto">Yes! I am interested, I h=
ave a repo where I am doing my firsts trys to understand how qemu and the b=
eagle are.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">How do =
you recommend to start?</div><div dir=3D"auto">I think that I can understan=
d some things in the old beagle.c file but the omap3.c it&#39;s more heavy.=
=C2=A0</div><div dir=3D"auto">Maybe I can start with de omap3.c trying to r=
efactor and split it in more files styled for the new API.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">What files do you recommend to read to t=
ry to understand more about the CPU model?=C2=A0</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
thanks<br>
-- PMM<br></blockquote></div></div><div dir=3D"auto">Thank you!=C2=A0</div>=
<div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
</blockquote></div></div></div>

--00000000000088337d058fc4e142--
