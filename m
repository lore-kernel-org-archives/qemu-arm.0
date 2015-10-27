Received: by 10.182.105.169 with SMTP id gn9csp1752482obb;
        Tue, 27 Oct 2015 08:13:00 -0700 (PDT)
X-Received: by 10.194.86.161 with SMTP id q1mr40177168wjz.88.1445958780651;
        Tue, 27 Oct 2015 08:13:00 -0700 (PDT)
Return-Path: <crosthwaitepeter@gmail.com>
Received: from mail-wi0-x22b.google.com (mail-wi0-x22b.google.com. [2a00:1450:400c:c05::22b])
        by mx.google.com with ESMTPS id lz9si50628523wjb.39.2015.10.27.08.13.00
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2015 08:13:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosthwaitepeter@gmail.com designates 2a00:1450:400c:c05::22b as permitted sender) client-ip=2a00:1450:400c:c05::22b;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of crosthwaitepeter@gmail.com designates 2a00:1450:400c:c05::22b as permitted sender) smtp.mailfrom=crosthwaitepeter@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by wicll6 with SMTP id ll6so165086900wic.1;
        Tue, 27 Oct 2015 08:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=PioGG3Sw9W8L1COnunYBLChCpwlTs4OhAcdhF3ncYHA=;
        b=jSxgMJZHXjEeYc1Lq1MeEAz3ymNFHSQ37Z6g2fjRBkyRrTkl2gQNrZSsZBHKpn6Bju
         +bA4/wqZ67L+e1PkHbiZNVIfVmLuY91S3rqVXif/+mlkZsUubYdiFGGeZOAEUZrHR+FF
         2fbyezHu78lCJt87DNL6Fn9FapAF6AQQdRghM5PmqrepMWqTunaaeIayefq8Zy1xKlEv
         JbcCqqtQVO+Xu3hNING48JpxxRWwjr1TuEXMjaUo8Mcv9itsfGhBbg3rihCueK4gp4Tb
         jIbUZNP3IJZkpUCkH4eQhQEYi2vK0JcTb64B+NEEKuKEwzesxKGB+OW+vbEdQW/REAwu
         GxLQ==
MIME-Version: 1.0
X-Received: by 10.180.182.84 with SMTP id ec20mr28172637wic.42.1445958780285;
 Tue, 27 Oct 2015 08:13:00 -0700 (PDT)
Received: by 10.28.88.75 with HTTP; Tue, 27 Oct 2015 08:13:00 -0700 (PDT)
In-Reply-To: <20151027110233.GE18847@toto>
References: <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com>
	<20151027110233.GE18847@toto>
Date: Tue, 27 Oct 2015 08:13:00 -0700
Message-ID: <CAPokK=rjh9tF1tBcmpfU0E7nBP-abasgSv09LUcUd_b291RtTg@mail.gmail.com>
Subject: Re: proposal: new qemu-arm mailing list
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary=047d7b6250a875797d0523178314
X-TUID: YRXD0SKzllRl

--047d7b6250a875797d0523178314
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 27, 2015 at 4:02 AM, Edgar E. Iglesias <edgar.iglesias@gmail.com
> wrote:

> On Tue, Oct 27, 2015 at 10:15:32AM +0000, Peter Maydell wrote:
> > Hi; it's been suggested to me that it would be helpful to have a
> > qemu-arm mailing list, along the lines of the existing qemu-ppc
> > and qemu-block lists. The idea would be to get people to cc the
> > list with their ARM related patches, so it would mostly act as
> > a way for people to filter their mail to separate the ARM stuff
> > out from the qemu-devel firehose. (Everything should still be
> > cc'd to qemu-devel as well.)
> >
> > Any objections/opinions?
> >
>
> Sounds good to me!
>
>
+1.

Regards,
Peter



> Best regards,
> Edgar
>

--047d7b6250a875797d0523178314
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Oct 27, 2015 at 4:02 AM, Edgar E. Iglesias <span dir=3D"ltr">&l=
t;<a href=3D"mailto:edgar.iglesias@gmail.com" target=3D"_blank">edgar.igles=
ias@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span=
 class=3D"">On Tue, Oct 27, 2015 at 10:15:32AM +0000, Peter Maydell wrote:<=
br>
</span><span class=3D"">&gt; Hi; it&#39;s been suggested to me that it woul=
d be helpful to have a<br>
&gt; qemu-arm mailing list, along the lines of the existing qemu-ppc<br>
&gt; and qemu-block lists. The idea would be to get people to cc the<br>
&gt; list with their ARM related patches, so it would mostly act as<br>
&gt; a way for people to filter their mail to separate the ARM stuff<br>
&gt; out from the qemu-devel firehose. (Everything should still be<br>
&gt; cc&#39;d to qemu-devel as well.)<br>
&gt;<br>
&gt; Any objections/opinions?<br>
&gt;<br>
<br>
</span>Sounds good to me!<br>
<br></blockquote><div><br>+1.<br><br></div><div>Regards,<br></div><div>Pete=
r<br></div><div><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Best regards,<br>
Edgar<br>
</blockquote></div><br></div></div>

--047d7b6250a875797d0523178314--
