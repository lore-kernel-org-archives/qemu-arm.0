Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4817279lfg;
        Thu, 27 Feb 2020 11:07:37 -0800 (PST)
X-Received: by 2002:a92:4a08:: with SMTP id m8mr785702ilf.41.1582830457003;
        Thu, 27 Feb 2020 11:07:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582830457; cv=none;
        d=google.com; s=arc-20160816;
        b=rv1L8KyvdQIaz4oRSaHcxwQbYDOIHg1PIbYtudZPF/CaWA16K3Oqs77dtuRACCrQVa
         dIUuA7nIwarAZCJr7bA19fQnralKuB29z014tifk8SY+T6i2W4MXI1PdiyNosrdhWpzt
         aLUPN0o0GNi0tjswtOYgbY9liXaGn0NKatjMfXnsaBzg5QwiCSNSZwsqLNTAYh9NdLJq
         Ms2AGQt5QULd9OTuRHjRVc24SpYXrzIsvZgLSKFYBs76UPQhkCqUmrj0yUFJckNuGlsc
         BDx4qejSIMpDjMIloB8+AcEabcpPRg1U6dE37E5pJ/nefpZ8I3YBiDoQvg+FqkDVVx/t
         9LMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xIaAzOO7CiQeAH4qsbtZ0X6RjIuzPqsDnaVRY+vJMyg=;
        b=rn4z0m1hae9GxytQqaoRcNW08grR+rSfMEb7TiIlJbriMcCyT+mVdtaQPpM4VRZ2oT
         jGSuloja0+OT4ExS2tGaf1+g1DGptqc2axhb9uyU197vew971dflYNrSJuUukOCwoXxx
         G1to1bUfWLjKTxVd/RNl5ixhc9PMSO7vvDzQ6ov8fZTZDnZutGS7yBhlKzs3s3cUwBEk
         L2JR5TVAtgpGXxd0ho9yQzZZIEed8gTU+fuy+Ph/t3ZMDsffsJB76rhLtq0gwxu98lq0
         j/7qsNt8PxfqwcLS8OpRH4QZBfbxWIQVIKt0O8kN7AaE2N3JTmf2t50cLAmgbm0sKYr7
         6rVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NnCBUaR+;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p19sor200562ioh.32.2020.02.27.11.07.36
        (Google Transport Security);
        Thu, 27 Feb 2020 11:07:36 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NnCBUaR+;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xIaAzOO7CiQeAH4qsbtZ0X6RjIuzPqsDnaVRY+vJMyg=;
        b=NnCBUaR+zBYH8eIiTe9Si9RoGFPIRzyCL6SYG0xdClQwmeJgfCgWApXTpjHYs3Xrk/
         p8FnOSG76FfmQVWoOO2yrxuyS/tiDmCwkhumbTIcpnqN+jcgtEmzK9bzfBmb5qcT/AwX
         KIDDuwKVHhV7DFqTsAA01LmE3gWKFM0qbsVy+WDMrn5MLx2zCa3tTCefUqWbR5kMKABN
         W+qsGgyemJNBa3pE+jFnbyjO28Vhd/hW58A5L+kIR5whD74jODaD9ucWoNSJSzp/8rTE
         21PzfBUXv1EblBl6ISlywPLhaJj0zZP2BGm3fd7yYY9pAQPRHOWffVM433IjFdb5oatS
         HOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xIaAzOO7CiQeAH4qsbtZ0X6RjIuzPqsDnaVRY+vJMyg=;
        b=QyR//tq2l/idOTP6mxMpemQb9AbfZleWwvZgNEDegBI/dUd6tPiuivIZm9aNlPSq25
         zzGhFl6+Ko25pwVMFqo/8rOsmA9joKlXWaYFpyX3hwshd3gqfnrNbnjbYuXXExn0cM3G
         h7reqOV4+9MktJqDib9Z5ngosgVDTUyhPORemPOYX2+YR86dF9m49AYpb3aprMynxo+E
         haDboJqIZUeYkUJ/2XlRTdO+/lR613qNunkFJ3FOr8jp0q5QnAmyesBjSvmX25/73Lpm
         Xuf8pVGaU9OPOnPdUUzzMZxD2FjrwQ8sXIcT02YkGn58QbI3+2Ws0SLwfvDbFV9qouvA
         S4sQ==
X-Gm-Message-State: APjAAAUyC2FVhvi3AIg9KSOfk7HcEJi8nQI/cbwRP2c4jdB4IFBcmD5E
	LQQy7UZHlCXKseMjjGt4ZMQRaMAXTPbVmr4cWaPMbMmD
X-Google-Smtp-Source: APXvYqwMmSKe6zMqgVBTvSvaC0BkVyDodskrCdOT/NZO07wSJA6kB0s0wipVEGOz9FzW8fxqBxFjepP4OIMwBcMxAG4=
X-Received: by 2002:a05:6602:158e:: with SMTP id e14mr584466iow.217.1582830455947;
 Thu, 27 Feb 2020 11:07:35 -0800 (PST)
MIME-Version: 1.0
References: <20200226181020.19592-1-alex.bennee@linaro.org>
 <20200226181020.19592-5-alex.bennee@linaro.org> <2ca7b55b-5674-370d-5c4d-dc8b7782ca64@linaro.org>
 <87pne0w6rt.fsf@linaro.org> <56f5e355-9357-e212-e92b-9db1d8424dea@linaro.org>
In-Reply-To: <56f5e355-9357-e212-e92b-9db1d8424dea@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Thu, 27 Feb 2020 20:07:24 +0100
Message-ID: <CAPan3WrSRm986EfwJdXV2MduNLE5BS+QmCv0Bo5-BD+QfT-=dg@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] accel/tcg: increase default code gen buffer size
 for 64 bit
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="00000000000011092f059f936f1b"
X-TUID: t/lfR5VwRxju

--00000000000011092f059f936f1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Thu, Feb 27, 2020 at 1:57 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/27/20 4:31 AM, Alex Benn=C3=A9e wrote:
> >> It does not make sense for a linux-user chroot, running make -jN, on
> just about
> >> any host.  For linux-user, I could be happy with a modest increase, bu=
t
> not all
> >> the way out to 2GiB.
> >>
> >> Discuss.
> >
> > Does it matter that much? Surely for small programs the kernel just
> > never pages in the used portions of the mmap?
>
> That's why I used the example of a build under the chroot, because the
> compiler
> is not a small program.
>
> Consider when the memory *is* used, and N * 2GB implies lots of paging,
> where
> the previous N * 32MB did not.
>
> I agree that a lower default value probably is safer until we have more
proof that a larger value does not give any issues.


> I'm saying that we should consider a setting more like 128MB or so, since
> the
> value cannot be changed from the command-line, or through the environment=
.
>

Proposal: can we then introduce a new command line parameter for this?
Maybe in a new patch?
Since the size of the code generation buffer appears to have an impact on
performance,
in my opinion it would make sense to make it configurable by the user.

Regards,
Niek


>
>
> r~
>
>

--=20
Niek Linnenbank

--00000000000011092f059f936f1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Richard,<br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 27, 2020 at 1:57 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 2/27/20 4:31 AM, Alex Benn=C3=A9e wrote:<br>
&gt;&gt; It does not make sense for a linux-user chroot, running make -jN, =
on just about<br>
&gt;&gt; any host.=C2=A0 For linux-user, I could be happy with a modest inc=
rease, but not all<br>
&gt;&gt; the way out to 2GiB.<br>
&gt;&gt;<br>
&gt;&gt; Discuss.<br>
&gt; <br>
&gt; Does it matter that much? Surely for small programs the kernel just<br=
>
&gt; never pages in the used portions of the mmap?<br>
<br>
That&#39;s why I used the example of a build under the chroot, because the =
compiler<br>
is not a small program.<br>
<br>
Consider when the memory *is* used, and N * 2GB implies lots of paging, whe=
re<br>
the previous N * 32MB did not.<br>
<br></blockquote><div><div>I agree that a lower default value probably is s=
afer until we have more proof that a larger value does not give any issues.=
</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
I&#39;m saying that we should consider a setting more like 128MB or so, sin=
ce the<br>
value cannot be changed from the command-line, or through the environment.<=
br></blockquote><div><br></div><div>Proposal: can we then introduce a new c=
ommand line parameter for this? Maybe in a new patch?</div><div>Since the s=
ize of the code generation buffer appears to have an impact on performance,=
</div><div>in my opinion it would make sense to make it configurable by the=
 user.<br></div><div><br></div><div>Regards,</div><div>Niek<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
r~<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--00000000000011092f059f936f1b--
