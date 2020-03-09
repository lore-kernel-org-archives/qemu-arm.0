Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1534637lfc;
        Mon, 9 Mar 2020 13:05:37 -0700 (PDT)
X-Received: by 2002:a92:d191:: with SMTP id z17mr17254995ilz.287.1583784337619;
        Mon, 09 Mar 2020 13:05:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583784337; cv=none;
        d=google.com; s=arc-20160816;
        b=R9aNF2VpOSWLbU2EmEYikvGbqxPhAJ5ah/8OiNCL1tcYfn/seW1qvJ5qROwqvO0+n1
         k25/3xvMFmSa5dfavluxmK70wNUx5m7ZcnDdl6hcrJ2gO3EdgHin9KJlVvwRSpjftVDa
         G+hzUMu4NSh+Hl8xgfS6s3QTUYWWKIsDoeOmWQph+hYfi2BcFp4sOULAGycAheGjO/LZ
         0Xsb6Rig4HrlLS/W84UGJRMhOlyobBWVjRl4VDMw9HrGKDTrZzkldL1XzzWvoyoDTcID
         ndu5MZS8SyA8deRgvI+2ReJ+vuODEENKUzELfti9Xh5h7Z+BHZ3C6qcbesN4GHrO+lvs
         kixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bCYjf/nlzsguEkQ3fBcBcG1cf7H0czOyrYB+Vo3sjRk=;
        b=qdeAV/PDdIbIiD5r/b6qNv5T3qcmgdkLuFtFeZvLjdBZVEsTy54C9YRjmF/6xB5cyS
         O5ZjXO/YZpDT6il5cFTcnGWZtERcKqW8MiaES9vRlItDQm5yP+wRqtYGCOvpUiRUyIBF
         bDpv8qu9AwM2IgRh0qzveI+odV85rrRwYTAknFu9f18GfCfmuX6mtEIdebF/o9xp6i4R
         A5raGvlEgOeFPK/C2ZlXAoCHP/09lB8auRba4LkdqtipLRVknYDYiKQEJJ7wN1ztvCpt
         KQrLXhjGBNyIIyCr7uEFahv3AQFcczZTq+IqXLnCsohTzvt3ZcS2xUj81iuA9bN5vUAB
         KOdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=EPlgBjCm;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i11sor8502255ils.89.2020.03.09.13.05.37
        (Google Transport Security);
        Mon, 09 Mar 2020 13:05:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=EPlgBjCm;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bCYjf/nlzsguEkQ3fBcBcG1cf7H0czOyrYB+Vo3sjRk=;
        b=EPlgBjCmOk44QDTFZu9P8HU05uklFnrxiT0sygEUZDUmWPKjzrRmgEcoviXhpxXkxu
         3gzEzbCpnU33Z8u4x2M9wZ1T901+TZK6T9w7E8wd7GPH1gLVq15CkYSM03CvbFzMLbe1
         bRjPAFY4sN8UBOCZv5V1BN0/b8rRbD95MQVCLfofc4fuw7UWIireAufbLMQIU7dGnx2/
         i8kcgtsH2vs3w+6GEOg3ECBYeV0TPzExLzvWLWdEqKDGF8YPPejBjU5kSeAyb5MK/IGL
         uWglFq1O4mn05eiVQOVdhdv4JhTJnFveta8FO49fRQM5RLZEeDRpDE0uPpx6GKEilb5C
         4dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bCYjf/nlzsguEkQ3fBcBcG1cf7H0czOyrYB+Vo3sjRk=;
        b=QdWfaFeghmKQOzVd1xuPwmh7nwrWLhGgIDPS9Rbtt7CrMXh+Pn2Zc5bPi9QS3nh0kp
         o2gXOVNTqUoXiYYJ+PZIzlB8+8m3kyXoJDfr18mJSuortys595vEBMycbqQwa8R4kTde
         jboEZh3TmdsF/oGARqSiNZVYBVGuwPMcgN78x5MwffrK51p96C8sb/glDmLo5P/XJZQi
         WtIKG9QxQTAW07urnm5ul5wcAehsROujTt6dAtER63TEh4kupHdlv5+ZOQtWbwbcrjUP
         XJlG2wSb0fp87c/MaoJfforPIDBeMqHootWuWAGWkzFLo1RfN+aern4OLnrN9hIvmEIA
         Gpcg==
X-Gm-Message-State: ANhLgQ3i3GQiuvGdVEohWkXSC1O0YxcfqTaACaCAT1Z+hd5q3/Qddb/Z
	1/9NL0DkrFRcrONS6T7Vi5CkiNVRyfjpjzL3a2zkzI6M
X-Google-Smtp-Source: ADFU+vuL2w+fj5uxwgVGvT0yw4jfqLtY4PekeokxsqS0iYfanr5JdvYeg1Y8txU9HoAjqUZJdhY9wXIOeyHUHqOeERs=
X-Received: by 2002:a92:d3c7:: with SMTP id c7mr2609319ilh.265.1583784336853;
 Mon, 09 Mar 2020 13:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-19-nieklinnenbank@gmail.com> <871rq876h3.fsf@linaro.org>
 <CAPan3WrNnrnngwE4pGeYpR9HS7Vr936-ojPZZovNo8ZdoAA0sg@mail.gmail.com>
 <CAFEAcA_6Lm-JwbXFLWeetc7+fhnrc5m2+YU28ymFw0MSoKOhwg@mail.gmail.com>
 <CAPan3Wo2Nf_d4AxsV5=sfOxv66rmQNfN==rpMn9=FtM5cZG9rw@mail.gmail.com> <CAFEAcA-2-tz7F1vmbggpLnc1SSX+_W5pij-w8Vgjx+vqr-LRUA@mail.gmail.com>
In-Reply-To: <CAFEAcA-2-tz7F1vmbggpLnc1SSX+_W5pij-w8Vgjx+vqr-LRUA@mail.gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Mon, 9 Mar 2020 21:05:25 +0100
Message-ID: <CAPan3Wr-oS-QRxmCDPXLRBG81yqjnp56B2WNuxtBMOxr2b9D6A@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] docs: add Orange Pi PC document
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cc916e05a071866c"
X-TUID: yW9JOii77bRv

--000000000000cc916e05a071866c
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 9, 2020 at 8:43 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 9 Mar 2020 at 19:38, Niek Linnenbank <nieklinnenbank@gmail.com>
> wrote:
> > On Mon, Mar 9, 2020 at 12:22 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >> Yes, this is now the right place to put arm board-specific
> >> documentation (the rearranging and conversion from texinfo
> >> is now in master). I should move microvm.rst's contents there
> >> I guess.
> >
> >
> > OK, I'll move orangepi.rst to docs/system/orangepi.rst and add a short
> section
> > about the Orange Pi PC machine to docs/system/target-arm.rst as well.
>
> You should include/reference the orangepi.rst from target-arm.rst, I think
> --
> that's where the per-board docs would belong in the structure we have.
> If you just drop a .rst file into the docs directory somewhere it won't
> actually go into the documentation and instead Sphinx will error
> out about it not being in the table of contents anywhere.
>

Ah now I see what is going on here. So the new rst files are ment to
automatically generate
documentation in various formats using the Python sphinx tool, correct?
I played around a bit with running 'make html' and using the include
directive you suggested in
the target-arm.rst file like:

  .. include:: orangepi.rst

That seems to work. And, now I also see that the orangepi.rst file contains
rst syntax errors which
I need to resolve. I'll make sure those are resolved in the next version.


>
> (I'll have a look at microvm.rst to see how best to make the structure
> work -- at the moment it kind of assumes there board documentation
> is always quite short so they're all in one file.)
>

Yeah that is fine Peter. If you have any update on that later, I'll adjust
the orangepi.rst file to fit in as well.

Regards,
Niek


>
> thanks
> -- PMM
>


-- 
Niek Linnenbank

--000000000000cc916e05a071866c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 9, 2020 at 8:43 PM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Mon, 9 Mar 2020 at 19:38, Niek Linnenbank &lt;<a href=3D"mailto:nie=
klinnenbank@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt; w=
rote:<br>
&gt; On Mon, Mar 9, 2020 at 12:22 PM Peter Maydell &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; =
wrote:<br>
&gt;&gt; Yes, this is now the right place to put arm board-specific<br>
&gt;&gt; documentation (the rearranging and conversion from texinfo<br>
&gt;&gt; is now in master). I should move microvm.rst&#39;s contents there<=
br>
&gt;&gt; I guess.<br>
&gt;<br>
&gt;<br>
&gt; OK, I&#39;ll move orangepi.rst to docs/system/orangepi.rst and add a s=
hort section<br>
&gt; about the Orange Pi PC machine to docs/system/target-arm.rst as well.<=
br>
<br>
You should include/reference the orangepi.rst from target-arm.rst, I think =
--<br>
that&#39;s where the per-board docs would belong in the structure we have.<=
br>
If you just drop a .rst file into the docs directory somewhere it won&#39;t=
<br>
actually go into the documentation and instead Sphinx will error<br>
out about it not being in the table of contents anywhere.<br></blockquote><=
div><br></div><div>Ah now I see what is going on here. So the new rst files=
 are ment to automatically generate</div><div>documentation in various form=
ats using the Python sphinx tool, correct?</div><div>I played around a bit =
with running &#39;make html&#39; and using the include directive you sugges=
ted in</div><div>the target-arm.rst file like:</div><div><br></div><div>=C2=
=A0 .. include:: orangepi.rst</div><div><br></div><div>That seems to work. =
And, now I also see that the orangepi.rst file contains rst syntax errors w=
hich</div><div>I need to resolve. I&#39;ll make sure those are resolved in =
the next version.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
(I&#39;ll have a look at microvm.rst to see how best to make the structure<=
br>
work -- at the moment it kind of assumes there board documentation<br>
is always quite short so they&#39;re all in one file.)<br></blockquote><div=
><br></div><div>Yeah that is fine Peter. If you have any update on that lat=
er, I&#39;ll adjust the orangepi.rst file to fit in as well.</div><div><br>=
</div><div>Regards,</div><div>Niek<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000cc916e05a071866c--
