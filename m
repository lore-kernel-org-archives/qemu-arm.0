Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1103054lfc;
        Tue, 10 Mar 2020 12:09:31 -0700 (PDT)
X-Received: by 2002:a6b:4e15:: with SMTP id c21mr18974079iob.119.1583867371655;
        Tue, 10 Mar 2020 12:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583867371; cv=none;
        d=google.com; s=arc-20160816;
        b=J1RuM68sKxT+Q4aCK6Y6ALgzqZPCSLy2bOvYJN0jU+0EH1Yk6j2fyRrh7hp3yhM9VG
         +p8l59LXOM+TR73FeDSDPIATaWHR4leaJkkanEhwXzGevc/IguwEanI77EF+S2+oTHZL
         gYXhpXxu1AsMuylfrmQxAreBVHJrRYHAus849hZCN9Bxrmma74JPulkaMOyseDoHbVo1
         4YJ247zHCF8d1PkDWgEDJdN09iV4s7z2PqXqqGgKAMCYWTqHbXaxkJ6aYdzS0eOWvn4p
         umdZqVnIC6t63bEU5rvP8+SZvvo/Ft+jL3k5FGq0lyXPD+7x3ZcLn7xpxBInfEw/Lwio
         nMgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WgUuyKjM3IhQD1E2N+STyZ/xweajPSeBqqEjx/rZUD4=;
        b=uQE7G76a3glEP9yGGor572KHSk4MS+8qQAjuM3iiI9LLE1YZTkW4v0d6RJgWUoA1cT
         dT6nHL22fEI5zzVcoTigV66MuSUQkCTsIISh4yd34TIqRtWoVHJumP4hTTvfYc6CbXpg
         ucCi5RgVIf9l0f8Fy0Hq6qNbPKsSKO3XzJ9tmWYT4wEVvL8c00+vD9lEFxMrrSN1ItW/
         hcUFwv7s8FOyo21EBdlSLQajJcypkvmEZECCyN9rWot7hnoVJUA0tVhghRGGGVYEKEYT
         sqlVagoil02iCound8CZNYsYLiVnctNoFXcgsR72p3iQ89+oR5N4gpvWF33uVp3sGFMh
         s2VA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=s9MKKizK;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t1sor10781096ill.140.2020.03.10.12.09.31
        (Google Transport Security);
        Tue, 10 Mar 2020 12:09:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=s9MKKizK;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WgUuyKjM3IhQD1E2N+STyZ/xweajPSeBqqEjx/rZUD4=;
        b=s9MKKizKrSglBl2D9krtypMPSDhYD2TQY2MRziSG7tCsr7UsbLT0XZAU87+5LhYnpQ
         XalgYtwJDybqvj8cc3uh7fryKpZ0feHHuYa2R92aLx9hZK6dtTe6nRHbhM0vMmFzJ06p
         GlXfmYr2XF++9ABJrVxXMb2Z5inNJlOPGxH5x9mX27sfskSSCab0JyCzx/lCuRLjeqk6
         mvbXRdFQRdDY8X9ohGXd2wz951ya80gZXO6TNjTv5FgjzscvmJYSRTiw/RwYbiBSdQlO
         ejCfiWdR2fVyFpiJB05kfsrB8cpC/rqU/So7dJbW6kIbWimLGRxlhyr+awSgpHHhKvoi
         sbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WgUuyKjM3IhQD1E2N+STyZ/xweajPSeBqqEjx/rZUD4=;
        b=FaaxlrWC18PVUgDnIHJeU1oBOhNbuMpPo5ANiE3hVe3pq/tKKHUvvUFW4LjFLyjngR
         hAsYwMtBdtm8JSgXxCjqanhCCngdpxCJ1Z8n6lwXTrcHvC+lh82PY++nqc2m9k1SLmlq
         RYJHraoaBUc/sVsHe73kEe4h5VGzQro98irm67UyWWlrP9MqGuK20kXsVwbXwGgQjKkK
         XMWls0WS6QNYggwo9TAuycgDy2RhxheCDlfsV3kUEs7K3UqFb/ShyvP7nURFhhULcJkg
         U738iUhOSyXhKgVsNNAHewc9aW/dAsrBXUK+FnTfjsq8QNN/DgcKpmcquQ7Opdj2SOcC
         5PnA==
X-Gm-Message-State: ANhLgQ03vI3c8P1AxTKv1FLZXx6a/zIz283hFVU1yvpq4xyGuCBIvNaI
	gOhzE6Ya5Mcfszs5Q+Iaa7nUTxiOZ8Cv5RPp2FhQ1Q==
X-Google-Smtp-Source: ADFU+vsPIjdzOjLRgB94tHflqQ0OqbbNAqiDdywOxCPT0TaYJjKirsPbxVyAWmLViNd0Tk3CQmYdWWNgkRz9hMzxF2Q=
X-Received: by 2002:a92:9e99:: with SMTP id s25mr6348378ilk.306.1583867371063;
 Tue, 10 Mar 2020 12:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-19-nieklinnenbank@gmail.com> <871rq876h3.fsf@linaro.org>
 <CAPan3WrNnrnngwE4pGeYpR9HS7Vr936-ojPZZovNo8ZdoAA0sg@mail.gmail.com>
 <CAFEAcA_6Lm-JwbXFLWeetc7+fhnrc5m2+YU28ymFw0MSoKOhwg@mail.gmail.com>
 <CAPan3Wo2Nf_d4AxsV5=sfOxv66rmQNfN==rpMn9=FtM5cZG9rw@mail.gmail.com>
 <CAFEAcA-2-tz7F1vmbggpLnc1SSX+_W5pij-w8Vgjx+vqr-LRUA@mail.gmail.com>
 <CAPan3Wr-oS-QRxmCDPXLRBG81yqjnp56B2WNuxtBMOxr2b9D6A@mail.gmail.com>
 <CAFEAcA_rY1hXNbzsj6EJvKzODX_EWdTOK1Gfxi2Jbv+UsYxRtQ@mail.gmail.com> <CAFEAcA-m2GJ01=-aEW0VLrY-nJgOpAMFOBF8+0jXeW+H7wkM-A@mail.gmail.com>
In-Reply-To: <CAFEAcA-m2GJ01=-aEW0VLrY-nJgOpAMFOBF8+0jXeW+H7wkM-A@mail.gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Tue, 10 Mar 2020 20:09:20 +0100
Message-ID: <CAPan3WrWND1w8QfPpemO_6brNuAaPKhns7TkbhBOfqfamPAnhg@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] docs: add Orange Pi PC document
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000060f9e05a084dcc6"
X-TUID: ENjCdvBgJcps

--000000000000060f9e05a084dcc6
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Mon, Mar 9, 2020 at 11:01 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 9 Mar 2020 at 20:12, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> > If you're ready to send out the next version before that,
> > then leave it with the include:: directive and we can
> > fix it up to the new structure later.
>
> PS: in case you weren't aware, softfreeze for the 5.0 release
> is 17th March, so if this series is going to go in for 5.0
> then (a) people interested in reviewing it should hurry up
> and review patches 9..18 and (b) the final version would
> need to be on the list sometime this week so it can go into
> a pull request by the 17th.
>

Ah I was not aware of that date indeed! Yes, ofcourse, if we can get the
remaining parts reviewed as well to include it in 5.0, that would be great.

As a side note, I'm basically doing this project in my spare time in the
(late) evenings (Amsterdam timezone),
so I'll make sure to reserve some extra time the coming days so I can reply
and respin fast if needed.

I'm finalizing & testing the v7 update now and will send it out in a few
hours to the list.

Regards,
Niek


>
> It's no big deal if it goes into 5.1 instead I guess,
> but it feels like the series is nearly ready so I figured
> I'd set out the timeline if people want to push to get it
> into 5.0.
>

> thanks
> -- PMM
>


-- 
Niek Linnenbank

--000000000000060f9e05a084dcc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,<br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 9, 2020 at 11:01 PM Peter Ma=
ydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Mon, 9 Mar 2020 at 20:12, Peter Maydell &lt;<a href=3D"mailto:peter.m=
aydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote=
:<br>
&gt; If you&#39;re ready to send out the next version before that,<br>
&gt; then leave it with the include:: directive and we can<br>
&gt; fix it up to the new structure later.<br>
<br>
PS: in case you weren&#39;t aware, softfreeze for the 5.0 release<br>
is 17th March, so if this series is going to go in for 5.0<br>
then (a) people interested in reviewing it should hurry up<br>
and review patches 9..18 and (b) the final version would<br>
need to be on the list sometime this week so it can go into<br>
a pull request by the 17th.<br></blockquote><div><br></div><div>Ah I was no=
t aware of that date indeed! Yes, ofcourse, if we can get the</div><div>rem=
aining parts reviewed as well to include it in 5.0, that would be great.</d=
iv><div><br></div><div>As a side note, I&#39;m basically doing this project=
 in my spare time in the (late) evenings (Amsterdam timezone),</div><div>so=
 I&#39;ll make sure to reserve some extra time the coming days so I can rep=
ly and respin fast if needed.<br></div><div><br></div><div>I&#39;m finalizi=
ng &amp; testing the v7 update now and will send it out in a few hours to t=
he list.</div><div><br></div><div>Regards,</div><div>Niek<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
It&#39;s no big deal if it goes into 5.1 instead I guess,<br>
but it feels like the series is nearly ready so I figured<br>
I&#39;d set out the timeline if people want to push to get it<br>
into 5.0.<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000060f9e05a084dcc6--
