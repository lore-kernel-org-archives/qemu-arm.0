Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1572484lfc;
        Mon, 9 Mar 2020 13:47:58 -0700 (PDT)
X-Received: by 2002:a92:6b03:: with SMTP id g3mr17210920ilc.201.1583786878064;
        Mon, 09 Mar 2020 13:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583786878; cv=none;
        d=google.com; s=arc-20160816;
        b=YEvnwBpFVjElDPuLTIaVrKJIobl5+adm3wHHQAsn6csLrGbhoJYKJAI5K3hTeIECdM
         hNm5vzG0o4UlZztq42WiUonEEKHkX3DCDRrit1cl/v8adCZinzUkU62JGUp15sxG8vze
         quunAkin1+XJuBej+GPgUCNPXSVxFHXInqSRL6IUAcSk5OhxD4pUotjDyFLqt30QGQgp
         AAul29JaNq9dxyJpH5gqXYZ1poBuV7mS3QKpJptFTWigSHVAUc5Kk4oUDo5vzCV7M1X8
         PeybS0rSH5zbD3kEQ29zvO0qx4s3oCRL0EQnurpiPGtCrXc/YdCS+te8nH+ASuHzwhee
         pWgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ClDmCOXkIqwUS0OK+foMTDvWaVdbjsZ1J3i3yHgwa4Y=;
        b=fRGkN3Tnj6SuDgb1aXETWV+Wp95CrFI/+Uy8CxtOGFzM1l7dGBe+aY22Fhl9cPe2xI
         wIoEJtkCNZ9YErPeFVEzK+7MLsQwg3hTPN55d3lNtV3C3kYaLtGMDnoBl/+pMwGHXUVd
         7uRD5waJj+d2nnSRM40fOlOEMbAF0uUh/OhPBU5dHfsC9+bPwf2W+UgHR6NA55H5/GfZ
         Lx7Zd9m/nB2l1BPH0C4vAviwjrU/iUwXr6ShZDgiQwGXfy4+up61ykOo8OQjuH+eg8XG
         OGlLTOYIiTiVW9MLEds7tAsho7lAs9PMlCJ6s1lvYaEMEKvFcLqoVnjYWYWjU/L73D79
         zaLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mgdk4T88;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x6sor8736873ilm.86.2020.03.09.13.47.57
        (Google Transport Security);
        Mon, 09 Mar 2020 13:47:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mgdk4T88;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ClDmCOXkIqwUS0OK+foMTDvWaVdbjsZ1J3i3yHgwa4Y=;
        b=Mgdk4T88XigrkH2+AnADnu4SOCuUfl5/mU4s1Mg1bDbl2A1ZOtGJJ4d2V3wEFwNR85
         mjAYHktatIYlqbaEw54Peh8C/dXfokJ5/VImGWB3wyrooxt9KosIQKJSRt3/6oeUJmIw
         LenvpvthLOVwyZRPjazsncPigLETqNA+sV8Jhg+AXWgcFeK5eihXelUcJykTMnKJp5rA
         00eRuXFh+qrdZ4ujc8GUujymLHw076jbh7eCaDwOldecNHRs6zVQqs9HmtUQ4WzglFI0
         FmfEi2ZL2r4jZJPxyCnuR1cCVCdWLXd1B3PNCU6IepY7afOYaC8G24N5eWCJsSLtOubX
         s1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ClDmCOXkIqwUS0OK+foMTDvWaVdbjsZ1J3i3yHgwa4Y=;
        b=SfefCIVm132XZllB37uYga96nHNrJKWU9XEL9wFSOFUJJcTxpmt7n9f36fTNeh42aQ
         kMKOQDkEfquLh95vvYkvgmTM9JZ7Ly35Cpf9j1e/5oB2RGV+Jh1QhiKporv5ck56sk/C
         hdtwWOXGLY6eYdyHLfxz/tJX1g/ZJcpQktE6Mf140cf9siLgjKR1E4sFo7s9BhZ3xZt/
         ZpsNhK4yEjc2PI3BFqr9LD9rwy3uy9cN7+SgrVkjQ58Hkm9ap/w8wIaH/TLIGSDNmkz4
         Jh0lU7h/Q61c8Zg18TCU6XYhIW8bi9F7M2q+6/7JRE2FjPjbYOzaGNFskFofrykoENO0
         uWaA==
X-Gm-Message-State: ANhLgQ2bUai4Y2SxcNLr0E4k+vJKLmT+IBX1pyzq7awW2/wgTOtkGY6W
	wYtFFFqoSeMEZLPKAcjhbDVf9MIfkHkOacGEmN8FEw==
X-Google-Smtp-Source: ADFU+vvbd4JGzatVFvHKi91xnfeFyS3z8obA05VJncM1wvffC1cqudEVIcxc6jFFBsODveCbcHMal5PfYFwlfyF06FA=
X-Received: by 2002:a92:d3c7:: with SMTP id c7mr2760951ilh.265.1583786877495;
 Mon, 09 Mar 2020 13:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-19-nieklinnenbank@gmail.com> <871rq876h3.fsf@linaro.org>
 <CAPan3WrNnrnngwE4pGeYpR9HS7Vr936-ojPZZovNo8ZdoAA0sg@mail.gmail.com>
 <CAFEAcA_6Lm-JwbXFLWeetc7+fhnrc5m2+YU28ymFw0MSoKOhwg@mail.gmail.com>
 <CAPan3Wo2Nf_d4AxsV5=sfOxv66rmQNfN==rpMn9=FtM5cZG9rw@mail.gmail.com>
 <CAFEAcA-2-tz7F1vmbggpLnc1SSX+_W5pij-w8Vgjx+vqr-LRUA@mail.gmail.com>
 <CAPan3Wr-oS-QRxmCDPXLRBG81yqjnp56B2WNuxtBMOxr2b9D6A@mail.gmail.com> <CAFEAcA_rY1hXNbzsj6EJvKzODX_EWdTOK1Gfxi2Jbv+UsYxRtQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_rY1hXNbzsj6EJvKzODX_EWdTOK1Gfxi2Jbv+UsYxRtQ@mail.gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Mon, 9 Mar 2020 21:47:46 +0100
Message-ID: <CAPan3Wq8GZWRrKo3tBuz+jqttSTg_qeW7AfJEBLMasjBROOF1w@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] docs: add Orange Pi PC document
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003baf6305a0721ea3"
X-TUID: OAgdyaaY4j/u

--0000000000003baf6305a0721ea3
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 9, 2020 at 9:12 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 9 Mar 2020 at 20:05, Niek Linnenbank <nieklinnenbank@gmail.com>
> wrote:
> > Ah now I see what is going on here. So the new rst files are ment to
> automatically generate
> > documentation in various formats using the Python sphinx tool, correct?
>
> Yep. Assuming you have Sphinx installed, "make" should build the
> documentation as well as the executables (ie you don't need
> specifically 'make html').
>
> > I played around a bit with running 'make html' and using the include
> directive you suggested in
> > the target-arm.rst file like:
> >
> >   .. include:: orangepi.rst
>
> I'm currently writing a patchset which splits the existing
> target-arm.rst into a bunch of per-board files in
> docs/system/arm/. If that patchset goes in before you
> roll the next verison of the series then it should
> just be a matter of putting orangepi.rst in the
> docs/system/arm/ directory and adding a line to the
> table-of-contents in docs/system/target-arm.rst.
>

Ah yes, that makes sense indeed. I'll keep an eye out for your new patchset.


> If you're ready to send out the next version before that,
> then leave it with the include:: directive and we can
> fix it up to the new structure later.
>

OK Peter!

Regards,
Niek



> thanks
> -- PMM
>


-- 
Niek Linnenbank

--0000000000003baf6305a0721ea3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 9, 2020 at 9:12 PM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Mon, 9 Mar 2020 at 20:05, Niek Linnenbank &lt;<a href=3D"mailto:nie=
klinnenbank@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt; w=
rote:<br>
&gt; Ah now I see what is going on here. So the new rst files are ment to a=
utomatically generate<br>
&gt; documentation in various formats using the Python sphinx tool, correct=
?<br>
<br>
Yep. Assuming you have Sphinx installed, &quot;make&quot; should build the<=
br>
documentation as well as the executables (ie you don&#39;t need<br>
specifically &#39;make html&#39;).<br>
<br>
&gt; I played around a bit with running &#39;make html&#39; and using the i=
nclude directive you suggested in<br>
&gt; the target-arm.rst file like:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0.. include:: orangepi.rst<br>
<br>
I&#39;m currently writing a patchset which splits the existing<br>
target-arm.rst into a bunch of per-board files in<br>
docs/system/arm/. If that patchset goes in before you<br>
roll the next verison of the series then it should<br>
just be a matter of putting orangepi.rst in the<br>
docs/system/arm/ directory and adding a line to the<br>
table-of-contents in docs/system/target-arm.rst.<br></blockquote><div><br><=
/div><div>Ah yes, that makes sense indeed. I&#39;ll keep an eye out for you=
r new patchset.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
If you&#39;re ready to send out the next version before that,<br>
then leave it with the include:: directive and we can<br>
fix it up to the new structure later.<br></blockquote><div><br></div><div>O=
K Peter!<br></div><div>=C2=A0</div><div>Regards,</div><div>Niek<br></div><d=
iv><br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--0000000000003baf6305a0721ea3--
