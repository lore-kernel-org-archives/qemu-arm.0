Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5405424lfp;
        Mon, 17 Feb 2020 12:27:15 -0800 (PST)
X-Received: by 2002:a6b:3a03:: with SMTP id h3mr13591330ioa.241.1581971235127;
        Mon, 17 Feb 2020 12:27:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581971235; cv=none;
        d=google.com; s=arc-20160816;
        b=AvOIjs5uu4DY68jOJWpYftirmG7vmLFk3H34NumP6kMUftz0iDlODOvICBNXr0Uszu
         uQmmQcNWXY5mQc+HKAK9lu9BKyz7yvcizgybIgfQNZCVnE7YPR2wfaA4sPQFTlgoxz5l
         dQSuUbE57oQ0c9nR14v5rVTRILLYDnUB1uHRZggCrvh8pIEVf6Iunqt7koispsJa0AmW
         HJRHTM4yxQA7vjao8C1MRRX+zlXZ2nNk+c9E4GjTJeIF/G0cx6UJKNgATcCOhOxtRMeN
         9AUTqJCLxDWYoQR/VAekfbpBiNbtLuHu8fkrsyOyeeGd7HgYTKx1IuxJE1ucwlJCLSlS
         OUsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WGVGJR17GkdVB9ljDQdhlnTm1kjSiWcfZ0HqZbiRloA=;
        b=s+Jd1gdIXGz6VisIryJSSEQQptn060r83XtaAVl59R8+5ytBJzk1U7Y4IVMPG+6TO+
         z3wcZIuR5mw2nHJvPdeuJhOqrTMzTiDIv9Qhi3j0e4HLecnANd6uDuoCTy2lYjUTUBgY
         jvy0CB8wS3QU2oHM5JZJhzIjuXYVKHNzzRif4Fkl4ieGoJLCiFHlsi7BM0hGFYdFl0Z6
         kEnqleJZ1hoZxs0YT5Ij+E5ui3ENd0sePqMmJA1hf1cFMwLE9IFc//U9aXFAyq2QYrU9
         M3aw9FJH/By7zuHpFzDpIBk/vdb9fMjF/QjK05zAyhhXB19gQnQXdLxdRVxs1Kto22ix
         kahw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IvygvMhB;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u24sor1348627iot.86.2020.02.17.12.27.14
        (Google Transport Security);
        Mon, 17 Feb 2020 12:27:15 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IvygvMhB;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WGVGJR17GkdVB9ljDQdhlnTm1kjSiWcfZ0HqZbiRloA=;
        b=IvygvMhBaNhgfXbBp6NGtil/Xbzq7wsYwENi/f0OjI05vAUCGN7FhYlqPLz/PU7crF
         QdqfoHvAV+vNYNLvv3UTqiVNteKu7gwoGMF7sANoCR6HgtthbfbGan8NxEM8R1peIjLr
         n17kDwywPlzGjY1cX7As4+Nzoi0J2O3pHFpWkOrf4m5hwA+BF7b3m5LSvMuUPpymQ5aY
         auqaRuGagLYtuNn8oZza4m+AkOjl/TAbhaJ9l/u/6cWQtAvQigbPHYbv+/e6m95o6LRM
         ZcJdduWO4sf1c8MtB+fZVk1gOPduXAzqQv+wcBoSOK2oIlIR95IH/i+tPbbW3y5x1B+7
         QXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WGVGJR17GkdVB9ljDQdhlnTm1kjSiWcfZ0HqZbiRloA=;
        b=BwmXzPyY2D2LqO84rDXneZGoPC/J05lSiWWNHS0+izaS47yV98EKzrSx4QQte+ZC9R
         7YhDJw7jEjriEq+/rfoECS7tjj6SQirvMiDB9gZhtJrV/bEKE8nDfV4I54SA0W31BCYJ
         KlzOSkRCLk+R8vkFfjDILmhjOq+d1uwSi5G51v6c9J2SqpQMCVWI252E8sguB/epdrDo
         JSelTByAs68JQhBR0WVs45UzFHsjujiiNfusqQbj8+7l+Uk1Y4blo5KDcCws9nPdp6Ld
         k7IRs1jahCP5vwX9ov/t9XcLrQIbmc4Y8ex/9rT13Krk6As0XDi63ZAifNffEzmT7kNE
         gT1A==
X-Gm-Message-State: APjAAAWJBigE3whRZNx/ubv8AnWqMsc5/VDxmLMmtvmS933JWjYSJ0G2
	+eo2sGavSh8kQZhzYAXVHr1Yu2fT4nBjvJ95nsY=
X-Google-Smtp-Source: APXvYqwAlxkmUsBoeo1q6NlMIv4rrmAW6qM5cGN6Ze7uBu4VSwpaG9H/IcQQtm8EOG222B+TgYHcDRaul0AImZyjLM8=
X-Received: by 2002:a5d:8f17:: with SMTP id f23mr13468253iof.265.1581971234763;
 Mon, 17 Feb 2020 12:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <CAPan3WpV2m9HXLXZDopKUb2EfX2KE9y530m2pJG4-D96==ggCg@mail.gmail.com> <ee95179f-c15f-9615-e241-80199e6948b7@redhat.com>
In-Reply-To: <ee95179f-c15f-9615-e241-80199e6948b7@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Mon, 17 Feb 2020 21:27:03 +0100
Message-ID: <CAPan3WpG0yPu5sbS=mpHk=xNVGaqwWFrBcDBcovLLRit==5dwg@mail.gmail.com>
Subject: Re: [PATCH v4 00/20] Add Allwinner H3 SoC and Orange Pi PC Machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, Beniamino Galvani <b.galvani@gmail.com>, jasowang@redhat.com, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007e35b1059ecb615e"
X-TUID: rxGZ9fNyIFOY

--0000000000007e35b1059ecb615e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Wed, Feb 12, 2020 at 11:12 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
wrote:

> On 2/12/20 10:47 PM, Niek Linnenbank wrote:
> > Hi all,
> >
> > Short status update regarding this series.
> >
> > Currently I am debugging booting NetBSD 9.0-RC2, which is recently
> > released [1]
> > The problem is that, apparently, RC2 can't mount the rootfs properly:
> >
> > [   3.1871510] vfs_mountroot: can't open root device
> > [   3.2141370] cannot mount root, error =3D 6
> >
> > This only happens using the RC2 filesystem image. However, the RC2
> > kernel can
> > properly load & boot the RC1 filesystem image, and the RC1 kernel gives
> > the same error
> > on the RC2 filesystem.  But I dont think its a NetBSD-RC2 issue, becaus=
e
> > on a real
> > Orange Pi PC hardware board, this problem does not show.
>
> Linux shows:
>    console: mmc0: Problem switching card into high-speed mode!
>
> QEMU MMC support is not in good shape, and high-speed SD card support is
> limited. I keep procrastinating at reviewing your SDHCI patch hmmmmm.
>
> So you added:
>
>   * DMA transfers
>   * Direct FIFO I/O
>   * Short/Long format command responses
>
> I'd start diffing the trace output of the following events:
>
> allwinner_sdhost*
> sdcard*
>
> with both kernels.
>
> Thanks for the kind suggestions Philippe.
Indeed, comparing the trace files of both the RC1 and RC2 kernels is one of
the things I did, and many more.

After extensive low-level debugging, I discovered that the issue is much
more simple than I thought.
In particular, when using -sd <file>, the emulated device gets the same
physical size as the file.
Normally this is not a problem, but for the NetBSD RC2 image, the kernel
reads the MBR partition table,
compares it with the device size and concludes that the NetBSD partition in
the image is larger than the actual device.

Unfortunately, this root cause is not printed on the NetBSD console, only
the final  'can't open root device' message.
Also, when running on hardware, obviously the SD card will be larger, e.g.
4GB or more, so that is why this issue does not show.

So the fix is to extend the input image by a few megabytes before booting
it.
And on the positive side, with this search we now have more confidence that
the
emulated SD/MMC device in Qemu works as expected.

Kind regards,
Niek


> >
> > I'm comparing traces and adding more low-level debug output to NetBSD
> > and QEMU to find the issue.
> >
> > Also I processed the review remarks which were send so far.
> >
> > Kind regards,
> > Niek
> >
> > [1] https://www.netbsd.org/releases/formal-9/NetBSD-9.0.html
>
>

--=20
Niek Linnenbank

--0000000000007e35b1059ecb615e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Philippe,<br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 12, 2020 at 11:12 PM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 2/12/20 10:47 PM, Niek Linnenbank wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; Short status update regarding this series.<br>
&gt; <br>
&gt; Currently I am debugging booting NetBSD 9.0-RC2, which is recently <br=
>
&gt; released [1]<br>
&gt; The problem is that, apparently, RC2 can&#39;t mount the rootfs proper=
ly:<br>
&gt; <br>
&gt; [ =C2=A0 3.1871510] vfs_mountroot: can&#39;t open root device<br>
&gt; [ =C2=A0 3.2141370] cannot mount root, error =3D 6<br>
&gt; <br>
&gt; This only happens using the RC2 filesystem image. However, the RC2 <br=
>
&gt; kernel can<br>
&gt; properly load &amp; boot the RC1 filesystem image, and the RC1 kernel =
gives <br>
&gt; the same error<br>
&gt; on the RC2 filesystem.=C2=A0 But I dont think its a NetBSD-RC2 issue, =
because <br>
&gt; on a real<br>
&gt; Orange Pi PC hardware board, this problem does not show.<br>
<br>
Linux shows:<br>
=C2=A0 =C2=A0console: mmc0: Problem switching card into high-speed mode!<br=
>
<br>
QEMU MMC support is not in good shape, and high-speed SD card support is <b=
r>
limited. I keep procrastinating at reviewing your SDHCI patch hmmmmm.<br>
<br>
So you added:<br>
<br>
=C2=A0 * DMA transfers<br>
=C2=A0 * Direct FIFO I/O<br>
=C2=A0 * Short/Long format command responses<br>
<br>
I&#39;d start diffing the trace output of the following events:<br>
<br>
allwinner_sdhost*<br>
sdcard*<br>
<br>
with both kernels.<br>
<br></blockquote><div>Thanks for the kind suggestions Philippe. <br></div><=
div>Indeed, comparing the trace files of both the RC1 and RC2 kernels is on=
e of the things I did, and many more.</div><div><br></div><div>After extens=
ive low-level debugging, I discovered that the issue is much more simple th=
an I thought.</div><div>In particular, when using -sd &lt;file&gt;, the emu=
lated device gets the same physical size as the file.</div><div>Normally th=
is is not a problem, but for the NetBSD RC2 image, the kernel reads the MBR=
 partition table,</div><div>compares it with the device size and concludes =
that the NetBSD partition in the image is larger than the actual device.</d=
iv><div><br></div><div>Unfortunately, this root cause is not printed on the=
 NetBSD console, only the final=C2=A0 &#39;can&#39;t open root device&#39; =
message.</div><div> Also, when running on hardware, obviously the SD card w=
ill be larger, e.g. 4GB or more, so that is why this issue does not show.</=
div><div><br></div><div>So the fix is to extend the input image by a few me=
gabytes before booting it.<br></div><div><div>And on the positive side, wit=
h this search we now have more confidence that the</div><div>emulated SD/MM=
C device in Qemu works as expected.</div></div><div><br></div><div>Kind reg=
ards,</div><div>Niek<br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
&gt; <br>
&gt; I&#39;m comparing traces and adding more low-level debug output to Net=
BSD <br>
&gt; and QEMU to find the issue.<br>
&gt; <br>
&gt; Also I processed the review remarks which were send so far.<br>
&gt; <br>
&gt; Kind regards,<br>
&gt; Niek<br>
&gt; <br>
&gt; [1] <a href=3D"https://www.netbsd.org/releases/formal-9/NetBSD-9.0.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://www.netbsd.org/releases/for=
mal-9/NetBSD-9.0.html</a><br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--0000000000007e35b1059ecb615e--
