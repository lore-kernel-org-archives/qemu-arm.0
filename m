Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6560592lfp;
        Tue, 18 Feb 2020 13:51:03 -0800 (PST)
X-Received: by 2002:a92:5e8b:: with SMTP id f11mr1436079ilg.178.1582062663657;
        Tue, 18 Feb 2020 13:51:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582062663; cv=none;
        d=google.com; s=arc-20160816;
        b=ytuXNe53YURWF/JxlwSYtAW2Dlasf1WvUHxKQ52cGwV6C2eRQyIFj1HMFPg9EDvzp4
         aPS0Rc4HZ4krEBmge+DC3ntUbfRAy8jfjIBWzm2dDRS8hd+rnlARx+UbnYsKI/+0tNLj
         qujgZHLKES5VRizN26eAQHFPYL0EKIV/dfXJ1WDXDwZRSy/3v9D0foEn1Qtq9NQRlTmS
         QyhvSOl286ttNzb+8+fARTz7DgMqF+EzobjExNzfseRipsClgWRWC0BTDwzPmahdnPe8
         RbQL6c2jfMSba7klA5bv2Rt69uxcydODOp6WxU17ubTcKuKzrj3goZi62yS0MPVievZK
         0q0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sLeGUH5OxTikEsToDHR4WZF1TwQ6mWFhg6WtSprZEOs=;
        b=MuH8/SMa9S6EDtSuHx4lK41ra4TPY/2LGqRRGHkBCDo5i9H1KgEH7fh4A0/661B4qn
         bVBMwKOML1BzamZMlZYr8u/0vGkkMRh9aD90SeCRmWQ5ldh/OfMtxVlvY3MPK5oRelPh
         0pZk+iwrg2jPSDWrb6pVSBXaF503WGLih2IkBovcxbRKMfK3S9KCxtWSXcUfEtm5ajt4
         H1R1FPq/oOue/jDwS4ymIa4EtsLpzEiNngmki3OIOZW4n4K+2YxR4MlwNh200+68kvW3
         OXAyhOVPovBha/HIG43f6H0YTYI9N8VJqmaey7ZZbpQg2IJ8QWXB1QJXiBHhSOfQa5rs
         P76Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=FUdNcz1U;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 22sor6453iof.132.2020.02.18.13.51.03
        (Google Transport Security);
        Tue, 18 Feb 2020 13:51:03 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=FUdNcz1U;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sLeGUH5OxTikEsToDHR4WZF1TwQ6mWFhg6WtSprZEOs=;
        b=FUdNcz1U74pIM+a9s1p824eVm6jdT9t6q4mq5BThIcD8lCN3rW+bh+j4t3UOcaYD1n
         O6j9mkqV6nOfAufWEFrHl7Ba6HmA3dDGGM8y/FvKOngC0/9TvpivssKyY2T0Q2ASBSW/
         3z/oFkLeSzoE6pE0VedOakQ9TOPcd+xHpH2eUg+1wCjaelQDLVUkq21Bs+uyH0s/7o7m
         FBmNHGrQF3h+Lz8I4GWaPhLSxYlMsLwReqPQsgcD0rzbYUjPREAsSs5+SurLTx6RUzN4
         Smpr4/x0WYmObFhoIdJP7MG+cmvi/6JJTM5j5IdCdzr49zaj7UDb9/IbwE6UKPHMSYZd
         P21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sLeGUH5OxTikEsToDHR4WZF1TwQ6mWFhg6WtSprZEOs=;
        b=qr4vNbCkQGhqQovnavPbBxTDsAc2LmWqWDQrsuFPRDmy1X5V1X+cmFPF2P6eRXq6oG
         SU664PqGQUGtOEqxIfNzKo/T2iVma1/w2hwK7B8bZT/TQuHnR1ZXI3LA/mfbocT+GYtn
         Uo6/1v+qI3yIMGhfeItCENmHR90qPBXDNJb4KzeGYc6brZK1OuDGljzMuOoj6b7TDyr4
         reYvHlps0FcSH2xDpN1S1tTbHuDomZD6YkFFLFUe3/1dF4UB6zPhKnxp+QqTBOkwmAsq
         m8a75wfHlpySdZ9U7z/QNSCQR96lA2Rt7tHJJuhifMqb5O5sxkaCGNpUreogOMgvqfBe
         xnrg==
X-Gm-Message-State: APjAAAV3jIvcvu+N11IFmwtEmmn4OsSETvEplvnqqTRS3YVHEhKLsMUr
	jycQvEpBfai5upOu7mFlkaar84flyqg8ZQ6XkFQ4Bw==
X-Google-Smtp-Source: APXvYqx2A7Vp1eDnko0Yog2I4SnljG7i2qroy00gwc0P+43U2XutOdHCAKQMpxwGFU2Cd5Cv50FC14LTqFq7gt94IV4=
X-Received: by 2002:a5d:8856:: with SMTP id t22mr16716548ios.217.1582062663091;
 Tue, 18 Feb 2020 13:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <CAPan3WpV2m9HXLXZDopKUb2EfX2KE9y530m2pJG4-D96==ggCg@mail.gmail.com>
 <ee95179f-c15f-9615-e241-80199e6948b7@redhat.com> <CAPan3WpG0yPu5sbS=mpHk=xNVGaqwWFrBcDBcovLLRit==5dwg@mail.gmail.com>
 <3aa04b23-80a8-21d1-7481-d52b6d8f88c1@redhat.com> <CAFEAcA-kNNWgLc8NxWgVJQk29BVr28j-A_d4M+8=7nfpTzhzcQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-kNNWgLc8NxWgVJQk29BVr28j-A_d4M+8=7nfpTzhzcQ@mail.gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Tue, 18 Feb 2020 22:50:52 +0100
Message-ID: <CAPan3WpkFtEe-9TuaCNhW=Dz3VZHE=8qUVhJbhW9BrdiyoMkRQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/20] Add Allwinner H3 SoC and Orange Pi PC Machine
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000bcb51059ee0ab20"
X-TUID: rEt9X9I1Po2H

--0000000000000bcb51059ee0ab20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter & Philippe,

On Tue, Feb 18, 2020 at 11:05 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 18 Feb 2020 at 06:46, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
> wrote:
> > IIRC from the specs, cards are block devices and the only alignment
> > required is the size of a block (512KiB for your 4GiB card).
>
> Isn't there something related to erase blocks too, which impose
> a larger granularity than just a single block?
>
> Anyway, in general the backing image for an SD card device
> needs to be exactly the size of the SD card you're emulating,
> because QEMU needs somewhere it can write back the data
> if the guest decides to write to the last block on the card.
> So short-length images generally don't work (true for all
> block devices, not just SD cards, I think). This often bites users
> if they're using some distro "here's a disk/sd card image file"
> where the expected use with real hardware is "dd the image
> file onto the SD card".
>

Yes, the description you gave here is indeed the issue.
And unfortunately in this particular case, the distro did not give a very
understandable
diagnostic error message.

Kind regards,
Niek


>
> thanks
> -- PMM
>


--=20
Niek Linnenbank

--0000000000000bcb51059ee0ab20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter &amp; Philippe,<br></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 18, 2020 at 1=
1:05 AM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter=
.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Tue, 18 Feb 2020 at 06:46, Philippe Mathieu-Daud=C3=
=A9 &lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redha=
t.com</a>&gt; wrote:<br>
&gt; IIRC from the specs, cards are block devices and the only alignment<br=
>
&gt; required is the size of a block (512KiB for your 4GiB card).<br>
<br>
Isn&#39;t there something related to erase blocks too, which impose<br>
a larger granularity than just a single block?<br>
<br>
Anyway, in general the backing image for an SD card device<br>
needs to be exactly the size of the SD card you&#39;re emulating,<br>
because QEMU needs somewhere it can write back the data<br>
if the guest decides to write to the last block on the card.<br>
So short-length images generally don&#39;t work (true for all<br>
block devices, not just SD cards, I think). This often bites users<br>
if they&#39;re using some distro &quot;here&#39;s a disk/sd card image file=
&quot;<br>
where the expected use with real hardware is &quot;dd the image<br>
file onto the SD card&quot;.<br></blockquote><div><br></div><div>Yes, the d=
escription you gave here is indeed the issue.</div><div>And unfortunately i=
n this particular case, the distro did not give a very understandable</div>=
<div>diagnostic error message.</div><div><br></div><div>Kind regards,</div>=
<div>Niek<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--0000000000000bcb51059ee0ab20--
