Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2777865lfg;
        Wed, 26 Feb 2020 00:46:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqyqJxSxArV6IhBJoroGtyyrXna8dBUpanp2h0G5GjvGMXjEz3U/mnmv+5LvspPhmPdGC2FK
X-Received: by 2002:ac8:7101:: with SMTP id z1mr3501891qto.333.1582706789847;
        Wed, 26 Feb 2020 00:46:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582706789; cv=none;
        d=google.com; s=arc-20160816;
        b=Or3/YS5NreBhrCcYnIayDE4N0CbJk1TFnpj4jelXODivthlsmp72TeYucW3szE4/n2
         FxlkVXoDsF3GgfHB8IC001rV57CWIHBlf3rI9kp5HtrXfXCnC2adpI2Nyk0e2r2RA5u3
         GfJ92KzU6jFvuaj0g4Ux6h1PRWXPAJkPsDRLZY8C7dcoQRvI7svfzxzPg7/wlgWMOr4q
         H67wIbkfEVrSt74W9dKcPNlXO9Qwha4eDDwColX8ZWQj0yMxwCCW/Tt3rot2ja98B7UE
         wC0XrQqqZxpm5Dqcxujn2xS6GOspooYixp6YBTWwQ30oQQa9Lf2Xc45d2uI1HPmAGD/z
         HbmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uf7eKrjH5tJnkd2LL9iCBfM0kHJSVLWm1hQaiUfeqHc=;
        b=K/fpsqdfCng/4wDFD8AStvZThM7DPAjPGuaKZSMSVpJpqfSNUNxyDFj0eZWMm1X6mf
         lSfb0xib7YwDa/X9vM9b2HLYMcm1W58Lx0uNXgs52JKdCVYthy8Lgk12DbRTv018Gbi9
         cRfsz3VWfIyJV0/4KPw+5klpEIWOqek+/aSpuprcivTJ2WgtOpjVWTaO2cgY9nuLWh/w
         KiXwQvdtMjcyZGB7QseCmuxJCvgncxIYGUKsjIFBfSc6W2YrwXjsdOJVIECyTCY5qNiX
         GOUYG9Uld6iE4wcqTgEtaeyg7aZzirj1uGaUrKLQX6gq9sjMxufpvFd/9x49nVp2gc7n
         JD7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Tye/rmIA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x75si587576qka.192.2020.02.26.00.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 00:46:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Tye/rmIA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6sKr-0007pf-BI
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 03:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43065)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hsp.cat7@gmail.com>) id 1j6sKQ-0007oz-6n
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 03:46:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hsp.cat7@gmail.com>) id 1j6sKO-0003zo-MT
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 03:46:02 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:42696)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <hsp.cat7@gmail.com>)
 id 1j6sKO-0003wz-HH; Wed, 26 Feb 2020 03:46:00 -0500
Received: by mail-oi1-x22e.google.com with SMTP id j132so2232194oih.9;
 Wed, 26 Feb 2020 00:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uf7eKrjH5tJnkd2LL9iCBfM0kHJSVLWm1hQaiUfeqHc=;
 b=Tye/rmIApT5KKEgeyHbLpBDSCHNefTa/B/yXNw0osdNetJBbelS1iCQBEIimEc9y2P
 4A9kSDFo0JF4YhAzC2r8uLQ3GcTBNOnsGJxPMhaQQk1BYHL1L1xW20diATS1iz7aMSg0
 LXj5eMTZt5LaqL1q3iZIM+wA/dmxlPrTe/jpXEbeTD1voT6VloptsJG44Qi6DBo8ISnA
 ig0rUggNEbHM2yTPkSPwtn93VvahOJygtBT+o0Zj/wO6tJJZTIwopKloRSzoDlcnzrqI
 9jSJg3GDH3vOB94f/DExcUPMarYJ0B9sjVwMvRY2+Jq2j/qGyvo+Wyt5y7VllWRMTkUJ
 Ty3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uf7eKrjH5tJnkd2LL9iCBfM0kHJSVLWm1hQaiUfeqHc=;
 b=KXDCQx4LMzXXR5DJrdTN739WJDLsOh0fLd1Ur3pi97UMyoJoC4Db7kOzL8y5tQ1y+7
 b3IucbKRBdOoCnRAM1O/kWjSPhUTB16dFRDXh5csQ+71PDO+HNRYPiqrBq2XG4C0ctcS
 R1KRSEhfIaRy2d6WgUqbwmBtazBT7cTYRYzeDOE9ouTU2V+BDY+ymsXvwzUNcQ5kYVkp
 2ZX13cVVnEwkeYA1vigqi7+tcd0MHpyfG6VGWX1E3826mIwGxMZHrpsa34c50XllX2+y
 OgbLbRav0m3R89sGw5ucBon/jPnw/SdQ6Mi3fHCt2+yxYMFHGOsEQ5YDoaIKN9HHNWcd
 YVVw==
X-Gm-Message-State: APjAAAU6GJu7IrAO16nD/0GtZ2x4I76c102bcIyL/L2Nj5o8w+WRwJ5H
 mfV8O706W6lxJL++vSh/OXkg8r1WCQ3RowATPO0=
X-Received: by 2002:a05:6808:487:: with SMTP id
 z7mr2214922oid.59.1582706759659; 
 Wed, 26 Feb 2020 00:45:59 -0800 (PST)
MIME-Version: 1.0
References: <CAPan3Wq-MVwcJQELP8n+g33CR7tsiGXQ698gA177nd2my9hWCw@mail.gmail.com>
 <CAFEAcA_azGqyzbxegpK8ch_bums6Wtd=U7cNxvM=bAJ-Ld2DDA@mail.gmail.com>
In-Reply-To: <CAFEAcA_azGqyzbxegpK8ch_bums6Wtd=U7cNxvM=bAJ-Ld2DDA@mail.gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Wed, 26 Feb 2020 09:45:48 +0100
Message-ID: <CABLmASHCnd-BmdbgyCb+Sjmau5A+nqwWEwjqviabibzjMxe=5w@mail.gmail.com>
Subject: Re: Sudden slowdown of ARM emulation in master
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000317601059f76a2d1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22e
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hd0j4fh/scDk

--000000000000317601059f76a2d1
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 26, 2020 at 9:42 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 25 Feb 2020 at 23:08, Niek Linnenbank <nieklinnenbank@gmail.com>
> wrote:
>
> > Just now I was working on some small fixes for the cubieboard machine
> and rebasing my Allwinner H3 branches.
> > While doing some testing, I noticed that suddenly the machines were much
> slower than before.
> > I only see this happening when I rebase to this commit:
> >    ca6155c0f2bd39b4b4162533be401c98bd960820 ("Merge tag 'patchew/
> 20200219160953.13771-1-imammedo@redhat.com' of
> https://github.com/patchew-project/qemu into HEAD")
>
> Yeah, I noticed a slowdown yesterday as well, but haven't tracked it down
> as yet. The first thing would be to do a git bisect to try to narrow
> down what commit caused it.
>
> thanks
> -- PMM
>


Perhaps related? I noticed a slow down on qemu-system-ppc and tracked it
down here:
https://lists.nongnu.org/archive/html/qemu-devel/2020-02/msg07262.html

Best,
Howard

--000000000000317601059f76a2d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Feb 26, 2020 at 9:42 AM Peter Maydell &lt;<a href=3D"mailto:=
peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue,=
 25 Feb 2020 at 23:08, Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank=
@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Just now I was working on some small fixes for the cubieboard machine =
and rebasing my Allwinner H3 branches.<br>
&gt; While doing some testing, I noticed that suddenly the machines were mu=
ch slower than before.<br>
&gt; I only see this happening when I rebase to this commit:<br>
&gt;=C2=A0 =C2=A0 ca6155c0f2bd39b4b4162533be401c98bd960820 (&quot;Merge tag=
 &#39;patchew/<a href=3D"mailto:20200219160953.13771-1-imammedo@redhat.com"=
 target=3D"_blank">20200219160953.13771-1-imammedo@redhat.com</a>&#39; of <=
a href=3D"https://github.com/patchew-project/qemu" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/patchew-project/qemu</a> into HEAD&quot;)<b=
r>
<br>
Yeah, I noticed a slowdown yesterday as well, but haven&#39;t tracked it do=
wn<br>
as yet. The first thing would be to do a git bisect to try to narrow<br>
down what commit caused it.<br>
<br>
thanks<br>
-- PMM<br></blockquote><div><br></div><div>=C2=A0
<div>Perhaps related? I noticed a slow down on qemu-system-ppc and tracked =
it down here:</div><div> <a href=3D"https://lists.nongnu.org/archive/html/q=
emu-devel/2020-02/msg07262.html" target=3D"_blank">https://lists.nongnu.org=
/archive/html/qemu-devel/2020-02/msg07262.html</a></div><div><br></div><div=
>Best,</div><div>Howard<br></div>

</div><div><br></div></div></div>
</div>

--000000000000317601059f76a2d1--
