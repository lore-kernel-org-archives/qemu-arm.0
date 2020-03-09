Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1509802lfc;
        Mon, 9 Mar 2020 12:38:43 -0700 (PDT)
X-Received: by 2002:a92:d183:: with SMTP id z3mr16361795ilz.214.1583782723200;
        Mon, 09 Mar 2020 12:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583782723; cv=none;
        d=google.com; s=arc-20160816;
        b=xfgsAu9alvbhIP45W5qXA1kWnu23j6OSTTi9iI1uk6op4+7EmpxjN9evoTQTSKhrV7
         gdYmSW8eo/z6BlXtgqDTFvjew1YDIQBpLj5ENeD8A2ZxtVvufDsrLffuKpt1eTqH1/9Y
         xKeXbhQ/J0HMaJnQ3ot10j2ZKaicmUoOGuyqhB8gJB8evNk4QVoRvm/ie9O8mXoa3yGF
         OwIHpaC45g/wzJ7eTL8jJ5OFQXNKxaKLZ4FD0wDKBD+3AdK/zy2alzjqx4ywXfiFyOdF
         YTFTuqWNRMUcFylHcWZn+Br4hRAKO8AS0+62KqLRhrrJwYgAEV82nPwaJIYC1qQo/E+7
         ueRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZN45wNhpGZsLu7yaSFSio7NjmK67W30L5fYUGshtYQU=;
        b=VIxXPqrIRIvtC3p7F4QgUovJcKaP/aUxkyhDZElIF4lPlepeYqG4ryBduqIfQ7jxCn
         i0veWxLY/cIBN0kQjZPCPoI6FISmesgHZTLo8SAhUxIdvB2IK+pNudfrqnCYEaaueGoa
         TNL9Qny5TXZjk+TdulMbLdLUwaSjOwW2AgJRUcSw+jO/9mCvsswSHdp1NOm8Y3eh3LsF
         v8/dTQzo4xy8ucZe9aDsKGKnj/8HcjzJxRqryXlwVXAH5sHxsHx8qEClDxSsOhg0we0Y
         0Dhqai3aIpcDhVdammX0UOxQ/RQTpx5BLwlO3z/bbL1Nu2KhqBFXc0yEfpYJqQ1kSmiQ
         sW1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=E+Sb2EOb;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r184sor4302846ior.2.2020.03.09.12.38.43
        (Google Transport Security);
        Mon, 09 Mar 2020 12:38:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=E+Sb2EOb;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZN45wNhpGZsLu7yaSFSio7NjmK67W30L5fYUGshtYQU=;
        b=E+Sb2EObhjdU8Mv/v6Koh5i195OCrC/xS7TKXbHjTT0jLk4b3yb+WxC6K+jXVW2oqC
         0Dm5I/UWsRanHFywrbAKtVJz4/vgqO3RXurtj8JDwG5ZuCHqzMRyxTARJnlAuR3a7xQS
         OY3WDqIiCt+tBJKJac627NACCCg08d6Ehh+aPI3xwm9VfCvRubXfhXtL7CNZf26zq/TQ
         HOTu/LASVA7TI1hj02aCJ434jdeYORf3MHcilUut8ohkInXIvSVvt94Gylay2b/bOZml
         4IlS6Y8nOlw9ntAAcmOiwV+Zw+7iDvAnpby0NF0X/xtgLVVW1GZYTMdx1e1Les71eFP8
         0FIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZN45wNhpGZsLu7yaSFSio7NjmK67W30L5fYUGshtYQU=;
        b=RmjwW6LD/RIobBUgkJ/WDmAcvxv9nJy1x45KEBWTf57A8YEfMYzLby+Tzt2Xr9avzR
         ZDf4+xaxr7teVkoBQuas9j9goOvwA2Q7Bz7gjEtZs9QKZ7Pza02kwXQb1AiMzswDP/7k
         inW83B45P1xN+p1obR6qJuRyg0/MmViAf3zYwU7IVZuO//YZyxKj+GzWVTx+OmRNx4m4
         axnI/zbhFDTEUZ/urGmiV6C7gsWmX+dI9p5kf3h+yGmAYf+/hH/dd6PPxynGejUXVznY
         jph718f/x+vO7v7TVyJ8L3FcV4BKDRdGhdO3rbg0AdU0XI+mIwP3N02I9RkRecN5j1bq
         /knw==
X-Gm-Message-State: ANhLgQ1xZFhgvPWKRpjbRmHKaz2xXcZ4rdPtFUcqUbk/K7TtVIgH4TKY
	AstpstgQg5dPHwZW5TA3BGQAC5jF5pqPQjPPEA09lw==
X-Google-Smtp-Source: ADFU+vt/SHSmS2iDs430K9sESUkRn+bB0LEKWrDZpDzXbeKXCrgGyfozpa+pexrLv9DTSQR5eqzKjFXOw3BNbJjYWUQ=
X-Received: by 2002:a02:caa8:: with SMTP id e8mr17026121jap.126.1583782722587;
 Mon, 09 Mar 2020 12:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-19-nieklinnenbank@gmail.com> <871rq876h3.fsf@linaro.org>
 <CAPan3WrNnrnngwE4pGeYpR9HS7Vr936-ojPZZovNo8ZdoAA0sg@mail.gmail.com> <CAFEAcA_6Lm-JwbXFLWeetc7+fhnrc5m2+YU28ymFw0MSoKOhwg@mail.gmail.com>
In-Reply-To: <CAFEAcA_6Lm-JwbXFLWeetc7+fhnrc5m2+YU28ymFw0MSoKOhwg@mail.gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Mon, 9 Mar 2020 20:38:31 +0100
Message-ID: <CAPan3Wo2Nf_d4AxsV5=sfOxv66rmQNfN==rpMn9=FtM5cZG9rw@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] docs: add Orange Pi PC document
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000094d1db05a071269a"
X-TUID: 0Qq5CnnGYwA/

--00000000000094d1db05a071269a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,


On Mon, Mar 9, 2020 at 12:22 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 4 Mar 2020 at 20:55, Niek Linnenbank <nieklinnenbank@gmail.com>
> wrote:
> >
> > Hello Alex,
> >
> > On Wed, Mar 4, 2020 at 11:35 AM Alex Benn=C3=A9e <alex.bennee@linaro.or=
g>
> wrote:
> >>
> >>
> >> Niek Linnenbank <nieklinnenbank@gmail.com> writes:
> >> > ---
> >> >  docs/orangepi.rst | 226
> >> > ++++++++++++++++++++++++++++++++++++++++++++++
> >>
> >> I suspect there is a better place to put this is than the top level. I
> >> wonder if it should be docs/specs?
> >
> >
> > Yeah I'm fine to move it to a different subdirectory if needed. Right
> now its placed in docs,
> > as it seems that documents for machines are also placed there, for
> example docs/microvm.rst
>
> The only things in the top level docs/ are a handful of
> legacy-ish files that went there because we didn't yet have
> a better place to put them. We should avoid increasing the
> number of orphan files in the top level (and indeed should
> try to move the existing orphans elsewhere).
>
> >> When Peter's document PR goes in later this week there will also be a:
> >>
> >>   docs/system/target-arm.rst
> >>
> >> which would benefit from a section for the Orange Pi in it.
>
> Yes, this is now the right place to put arm board-specific
> documentation (the rearranging and conversion from texinfo
> is now in master). I should move microvm.rst's contents there
> I guess.
>

OK, I'll move orangepi.rst to docs/system/orangepi.rst and add a short
section
about the Orange Pi PC machine to docs/system/target-arm.rst as well.

Regards,
Niek



>
> thanks
> -- PMM
>


--=20
Niek Linnenbank

--00000000000094d1db05a071269a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Peter,</div><div><br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
, Mar 9, 2020 at 12:22 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell=
@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Wed, 4 Mar 2020 at 20:55, Niek Linn=
enbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" target=3D"_blank">ni=
eklinnenbank@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello Alex,<br>
&gt;<br>
&gt; On Wed, Mar 4, 2020 at 11:35 AM Alex Benn=C3=A9e &lt;<a href=3D"mailto=
:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" ta=
rget=3D"_blank">nieklinnenbank@gmail.com</a>&gt; writes:<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 docs/orangepi.rst | 226<br>
&gt;&gt; &gt; ++++++++++++++++++++++++++++++++++++++++++++++<br>
&gt;&gt;<br>
&gt;&gt; I suspect there is a better place to put this is than the top leve=
l. I<br>
&gt;&gt; wonder if it should be docs/specs?<br>
&gt;<br>
&gt;<br>
&gt; Yeah I&#39;m fine to move it to a different subdirectory if needed. Ri=
ght now its placed in docs,<br>
&gt; as it seems that documents for machines are also placed there, for exa=
mple docs/microvm.rst<br>
<br>
The only things in the top level docs/ are a handful of<br>
legacy-ish files that went there because we didn&#39;t yet have<br>
a better place to put them. We should avoid increasing the<br>
number of orphan files in the top level (and indeed should<br>
try to move the existing orphans elsewhere).<br>
<br>
&gt;&gt; When Peter&#39;s document PR goes in later this week there will al=
so be a:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0docs/system/target-arm.rst<br>
&gt;&gt;<br>
&gt;&gt; which would benefit from a section for the Orange Pi in it.<br>
<br>
Yes, this is now the right place to put arm board-specific<br>
documentation (the rearranging and conversion from texinfo<br>
is now in master). I should move microvm.rst&#39;s contents there<br>
I guess.<br></blockquote><div><br></div><div>OK, I&#39;ll move orangepi.rst=
 to docs/system/orangepi.rst and add a short section</div><div>about the Or=
ange Pi PC machine to docs/system/target-arm.rst as well.</div><div><br></d=
iv><div>Regards,</div><div>Niek<br></div><div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--00000000000094d1db05a071269a--
