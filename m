Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1181837lfc;
        Wed, 11 Mar 2020 13:09:10 -0700 (PDT)
X-Received: by 2002:a92:d3cd:: with SMTP id c13mr4466579ilh.21.1583957350694;
        Wed, 11 Mar 2020 13:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583957350; cv=none;
        d=google.com; s=arc-20160816;
        b=hMTnTgy9IFSpKYHPjg7vUrH4cbtaPwUt07sasKssvwn5qgnX0bEEG5WtfHR2bklqWf
         UgDIgGDevxPJx55/AGOBCJJkgZ+O382v61dsI0jmpEIgW3l2W5MlyHd2IokXn7ZVDKRw
         /nmyJCsQQ0aS+IRzFLX01VcFi6sxJHA5CnQrHVE7jNraOYV/KM3+x54WNVRjbKU3n6ZN
         e5nRR1CVDmxSB9a1ydS3gNvDW1/+JDxj08nvW43a83361MGmgg3I3nZKMNA5GK1duPs7
         WwiZboo4bj2XToxkAJLHQD6VubO7ae+JLPLuUFdPs6d87OWjcBp+sNR+7+O/WTA2vGsV
         IxWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xYixRV7RXTViLl4bYR0dE+r+Ag/o16cbB/kb4gO+nQI=;
        b=ouQahdpKLrLWhI9HQ2tKSuCs2NchZRV+yOV5ELGcsx64Igtnn1kd6+W88Ur8IAIT59
         nB8ZmaRAhYaOXFR0AnBx/KV9mkdp6rWbPvgWKcYyqCuyouuwCd3jhYLYhCSrAgeoAgYG
         +/IEfZ6llbDhZUvHW8HcyfXlsx/Sxc6lD2+kTp+UnMApHpKSllyEUMZCGBgVbuxTZx0Y
         iiA1ou0vYhHXYN9+PcGQLZFP7XTXIL8lfAEe+O53UTc8uF5Rmn806J3LbhTsyC1tSmzs
         QY6lmdSlCLQrmqpA2yFqj97goQqAUKX1x+QOgFNU2dIer19Z+mDgmNpUDsc3U1ZT2szj
         6vCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PZ8dXA4M;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 185sor2711396iow.62.2020.03.11.13.09.10
        (Google Transport Security);
        Wed, 11 Mar 2020 13:09:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PZ8dXA4M;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xYixRV7RXTViLl4bYR0dE+r+Ag/o16cbB/kb4gO+nQI=;
        b=PZ8dXA4MfuGDz0LR5YAHgUcCp9lA5bxwQf3Fm7Zo+MQiJNYDLpMO+l6DwTmIctayHZ
         bPyvxbhn+qRQIQ4ZpIemVrPlHg6dGn816jIvUfnYbWasQc3JisZ4ZWWzXzjPlrYAB2+w
         t120roErPbpgNagFeqTQY2iwlyIIODW4nnuxvvEZNz/8Wi9HPfhzccf2s9YQ6RiCX3Al
         Zix3MaU6NIVb2RLKIhNDipSzBo0FtY6DOhGqoUbk0q6HHaKie5QWMipSZOsibcFC2NSP
         fgVYsj7xniq98GuEk33pW0taLXySW2FJojAbD/R0AMN31Lhj9Schhgwfgfz/+aFrXfe9
         q05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xYixRV7RXTViLl4bYR0dE+r+Ag/o16cbB/kb4gO+nQI=;
        b=r6BL5w6xrVzsQgR993659CLgz6m0vIBkLYSbxegNtbzAUlGafZos7Fhu2ngKtuStSW
         ezwPk5GyUACBTL5NVOzAJ9AgX8tEaUg/4ljmXw4xqu+38czS/1l38tYoHknGT0KJZKZa
         /mPGHALxGKp15B7GrtCCDSRCyI56Lr2fc5AFIFpHwnvjMTP3DX+WcrGuS53pKMCv4iLD
         zVYBKiu/NHsj+lvLVAeG97Kxa4fbXntSAIyysv9MCGKSFwSCCeVTGwiCbu4jI0INm+MM
         hjBY5OwSF9EsBXd+kik/Cz3UAfNU1ZkjSp+syKCZRdv4H7j3ntJ618SSUzoWe4CxCH2q
         NCkw==
X-Gm-Message-State: ANhLgQ3sMQHUBJGeJcfW8hJq4f0CHuDBSM3Yn6/MPaCZpC7Vz11QsmGb
	OIw7Ol9rVi3dncLyPCMBvMmDmY/QE8qYOz89Mot8Zw==
X-Google-Smtp-Source: ADFU+vswfkhML4C2hPad1aB99trCLMlVY5V6Q+ymfGkLMJijUWhSLcd2xGHvu0yA4I1xdJU9Kpk5RXB+j2SYiOBbVL4=
X-Received: by 2002:a6b:5103:: with SMTP id f3mr4415840iob.181.1583957350042;
 Wed, 11 Mar 2020 13:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200310213203.18730-1-nieklinnenbank@gmail.com> <87o8t3f0o9.fsf@linaro.org>
In-Reply-To: <87o8t3f0o9.fsf@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 11 Mar 2020 21:08:59 +0100
Message-ID: <CAPan3Wr+_W0S_TzFVf_TX2gej7gkdfMdpFmfoPafU5LFr+p6cA@mail.gmail.com>
Subject: Re: [PATCH v7 00/18] Add Allwinner H3 SoC and Orange Pi PC Machine
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000304f8305a099cfba"
X-TUID: G2Dx2Za5tGXs

--000000000000304f8305a099cfba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 3:04 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Niek Linnenbank <nieklinnenbank@gmail.com> writes:
>
> > Dear QEMU developers,
> >
> > Hereby I would like to contribute the following set of patches to QEMU
> > which add support for the Allwinner H3 System on Chip and the
> > Orange Pi PC machine. The following features and devices are supported:
> <snip>
>
> I've finished my pass through and I think everything has a review tag
> now. As there are some small fixes needed you can you do a v8 respin
> which Peter can apply to target-arm/next.
>

Thanks for taking the time to review Alex. I'm including the small fixes
you suggested and adding the tags and then I'll send v8 to the list.

Regards,
Niek


>
> --
> Alex Benn=C3=A9e
>


--=20
Niek Linnenbank

--000000000000304f8305a099cfba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 11, 2020 at 3:04 PM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" target=3D"_=
blank">nieklinnenbank@gmail.com</a>&gt; writes:<br>
<br>
&gt; Dear QEMU developers,<br>
&gt;<br>
&gt; Hereby I would like to contribute the following set of patches to QEMU=
<br>
&gt; which add support for the Allwinner H3 System on Chip and the<br>
&gt; Orange Pi PC machine. The following features and devices are supported=
:<br>
&lt;snip&gt;<br>
<br>
I&#39;ve finished my pass through and I think everything has a review tag<b=
r>
now. As there are some small fixes needed you can you do a v8 respin<br>
which Peter can apply to target-arm/next.<br></blockquote><div><br></div><d=
iv>Thanks for taking the time to review Alex. I&#39;m including the small f=
ixes</div><div>you suggested and adding the tags and then I&#39;ll send v8 =
to the list.</div><div><br></div><div>Regards,</div><div>Niek<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000304f8305a099cfba--
