Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1217501lff;
        Fri, 6 Dec 2019 12:03:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqyOQjQX9Ci1aT6lQIP72Ed+6T0wMBBkNkvMWQNAUF1NXMbrCIY//Kzgj9QAPdnb3Vzx2k6y
X-Received: by 2002:a9d:6315:: with SMTP id q21mr11918096otk.15.1575662580625;
        Fri, 06 Dec 2019 12:03:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575662580; cv=none;
        d=google.com; s=arc-20160816;
        b=L6hxNDD0YrOlGOqAubDSXwl89zMfN5zMQo7h2tJ6eGNLS4i04ZxETOnHo8HevQf2Hk
         pC1blvvEcWgR0BYd+Nlb9I1O3Dz+TwEkTiPE/idU2lG32G4uAJ2SKWtHJKBQNQbBFPsQ
         dTTj2WYj9pn7vnGQ7MnbNkNv3oimG99eZoDZxB3dpYIx0z1h6085Q8R8cTnvRTSL110s
         /eRaKncO76tY+PkqSd4egyRuJ1W4XMUI+9znT1qAra+EO02Kc/X5YF1hTRA7bH18oqdN
         odlQ1Jzx7w1tU55VgpYLKhZ2d8vBKuIqPstUspqGdcBNCgitgKTv5qwIyAOkK3I+jlUD
         wT7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ciqFUU5MY4QIDiBl5osr7K35WjCbFJa6f4x6hN3vQ3g=;
        b=BZSPLZQM4xOz0K2Y9bz2HQGTEej/6ECKMRbLt3iWGR6iarcTC2hn0supW9xLfnGtS8
         ksJvI0thSvx7MgQ00aNTrx+uOiGdjVtILIJo+BqEw45ueMOGnND4uqAPdno6vzpFkkPC
         UN1tYXAczbbs7KoBWe7uCP3ErnOP1oDBoUuSO18Mkm+32lywEPU/PjJifJGqf70BDtXt
         fjG2B9vCfleEDcKWmmZqL9GgfX3PZTYDzXHqfIlhYA7n6F6KRXDlihYRIeUvdY9r2erv
         blEFunAdotOmwZnmaWw+Evx3Gwm507zyTbUnUl/ix8Vsyb2bwxvAzELe9uUdR2IBTZ6J
         6c0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PjLKwI+x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c131si7981580oib.267.2019.12.06.12.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 12:03:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PjLKwI+x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idJoY-0005sd-Jt
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 15:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49410)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1idJnr-0005mc-8h
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 15:02:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1idJnp-0003o9-Vp
 for qemu-arm@nongnu.org; Fri, 06 Dec 2019 15:02:15 -0500
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:44508)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1idJnk-0003fO-1T; Fri, 06 Dec 2019 15:02:08 -0500
Received: by mail-il1-x144.google.com with SMTP id z12so7259646iln.11;
 Fri, 06 Dec 2019 12:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ciqFUU5MY4QIDiBl5osr7K35WjCbFJa6f4x6hN3vQ3g=;
 b=PjLKwI+xL3+9lLuoQfj6Q4CB+J4ufMl4/gyXeyNsGYIn0H9lH4cjIuqupR5J8Bt/r4
 j3CUjzZYd3hY/DnEIkLGtxcPvWAL0fh6cLOgaoN+OY0gfeRGM6mZ7XDyAaiTJw9o7AUR
 Y0tMUgZBK3bDEWpEXH4/HZon30FnRDaSWal33AtuUgaMFrMOEsZz3NGYOFZDwQ+Ro9IJ
 HRQTOHJMIsml3qtIOG3m2nX2XofyvSlu0L1jQrrqoVyrmnf7eD0qm1LE/r0KqxZwFiKO
 yQpxlOGF6f9YGmSMv626QFAPCyKHxhhirNHq2eMWXdtPYyk9FBw/Qlm6NaU8x6cx08ry
 MQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ciqFUU5MY4QIDiBl5osr7K35WjCbFJa6f4x6hN3vQ3g=;
 b=WI9VQKggClc128DZaGOP81ZXPkZEaDHlVswC/NYVoDNP3zOzCXr/BFN9Mxzbch77wI
 ptQHRCyFmjn1MfxRowN7DRV6YFLD/T6ckMJPJetQcvaBX2HkViQxpeyz2LBRjoSeKkJb
 cLD3s40wiX/TlQvjaMxli2i1DRCGIGZg+gbmsUZnn6CmhuSU5DDCvDZpz/SVXpLQpGGl
 fZHtRO7oYSJwPlbB5/V3hmynvrN+aKLEor1weETnF89AKKArX5eZ2y51vAERVGunhC2n
 2+S1qi/o9GdxMQEd8/UH4XjgGG90T7sx3gQ+Rg3Icrc/b47Ek1j3G/WWuHeh8zzYpFFN
 RJLQ==
X-Gm-Message-State: APjAAAVSXA40Q0naWTTiY/m4DKi1ig1YaQuD94lqfa12eY7Nqi5W/T6X
 i5jkA6OdWOVlXWDGSBSwYw2mWu55CiZ7Hmp/v8k=
X-Received: by 2002:a92:af08:: with SMTP id n8mr15431530ili.217.1575662520840; 
 Fri, 06 Dec 2019 12:02:00 -0800 (PST)
MIME-Version: 1.0
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-7-nieklinnenbank@gmail.com>
 <CAFEAcA9XxH7zSmm6=KR-2ttfuqdauXxq05SWw++WgGEWw06NEQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9XxH7zSmm6=KR-2ttfuqdauXxq05SWw++WgGEWw06NEQ@mail.gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Fri, 6 Dec 2019 21:01:49 +0100
Message-ID: <CAPan3WrYWpa2ymBjy5zCWAEdeVXVRYo7arNVOXWsbFeTAi0ucA@mail.gmail.com>
Subject: Re: [PATCH 06/10] arm/arm-powerctl: set NSACR.{CP11,
 CP10} bits in arm_set_cpu_on()
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d736f805990e8492"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::144
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +/heqg/kuaUU

--000000000000d736f805990e8492
Content-Type: text/plain; charset="UTF-8"

Hey Peter,

On Fri, Dec 6, 2019 at 3:25 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 2 Dec 2019 at 21:10, Niek Linnenbank <nieklinnenbank@gmail.com>
> wrote:
> >
> > This change ensures that the FPU can be accessed in Non-Secure mode
> > when the CPU core is reset using the arm_set_cpu_on() function call.
> > The NSACR.{CP11,CP10} bits define the exception level required to
> > access the FPU in Non-Secure mode. Without these bits set, the CPU
> > will give an undefined exception trap on the first FPU access for the
> > secondary cores under Linux.
> >
> > Fixes: fc1120a7f5
> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > ---
>
> Oops, another place where we failed to realise the ramifications
> of making NSACR actually do something.
>
> Since this is a bugfix I'm going to fish it out of this patchset
> and apply it to target-arm.next with a cc: stable.
>
> Thanks for the catch!
>

Sure, I'm happy to help. Note that I only tested this fix with
the Allwinner H3 SoC patches that I'm working on.

OK, I'll keep an eye out for it. Once it is solved in master, I'll remove
this patch from the patch series.

Regards,
Niek

>
> -- PMM
>


-- 
Niek Linnenbank

--000000000000d736f805990e8492
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey Peter,<br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 6, 2019 at 3:25 PM Peter Ma=
ydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Mon, 2 Dec 2019 at 21:10, Niek Linnenbank &lt;<a href=3D"mailto:niekl=
innenbank@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; This change ensures that the FPU can be accessed in Non-Secure mode<br=
>
&gt; when the CPU core is reset using the arm_set_cpu_on() function call.<b=
r>
&gt; The NSACR.{CP11,CP10} bits define the exception level required to<br>
&gt; access the FPU in Non-Secure mode. Without these bits set, the CPU<br>
&gt; will give an undefined exception trap on the first FPU access for the<=
br>
&gt; secondary cores under Linux.<br>
&gt;<br>
&gt; Fixes: fc1120a7f5<br>
&gt; Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gm=
ail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Oops, another place where we failed to realise the ramifications<br>
of making NSACR actually do something.<br>
<br></blockquote><div></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
Since this is a bugfix I&#39;m going to fish it out of this patchset<br>
and apply it to target-arm.next with a cc: stable.<br>
<br>
Thanks for the catch!<br></blockquote><div>=C2=A0</div><div><div>Sure, I&#3=
9;m happy to help. Note that I only tested this fix with</div><div>the Allw=
inner H3 SoC patches that I&#39;m working on.</div></div><div><br></div><di=
v> OK, I&#39;ll keep an eye out for it. Once it is solved in master, I&#39;=
ll remove this patch from the patch series.<br></div><div>=C2=A0</div><div>=
Regards,</div><div>Niek<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000d736f805990e8492--
