Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1746615wrd;
        Sun, 23 Sep 2018 11:05:26 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY2GerAWQjvtNY3v+BPwaRy8Iyfv/nh7bUzNzqt0x3RwS+Y5/qqjv4abljMAm5MNlP7DbQ1
X-Received: by 2002:ac8:3316:: with SMTP id t22-v6mr4808245qta.43.1537725925919;
        Sun, 23 Sep 2018 11:05:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537725925; cv=none;
        d=google.com; s=arc-20160816;
        b=FMBFgbyiamnNcR/8XShASIbny3w9OefIFSGTeXleltOW+WaDireNQdIe56b8Ig9Vfa
         fcmpYHHXpGJPbqRZC6h76ujYwKCweBA1SdGnVjZLr4d1lSCgVesTn+jDBPVVUQR+69BV
         8y++P+192PXfldFALXZqA5A/8pSC6OE5CD46hnHi1+/XhtjxSnBvrmm03JZ9bh6FkG4Q
         +R9/oJGivcdRgj1IDSZ3tv4gUIrFHjvwRTaGuNXB5W/NeDDX2LE6uSKTbJKzjBn3pltP
         /wwhTuMcY5/ug5oqQyhZB9iDJ8XCraWWMfAZbJ0lSCIeemNwVRwZOYF93h3OUIB6qz3s
         vEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+52MMBPItUSrq0r2dkGkLE+BtKzUkww7qZDNkjoUwKk=;
        b=NmI0vMP0qmkFChnyXihtuFSss7aEjvCEgtBBRC95Nf6WbnDUtrWhfOTo9ZIZg5eueE
         XR9Y0cz6OfenQGCbP0fDjiAdbNfE1O4FWm7YbLkTh9umZy1xG61K0zQL0+po+vHccaIk
         f+Xmbv5qmA0kzlXVc/gpzTgu0Bul/bygvUV3NIht/K7JuRyyS3mYmoA/+9moQlzjBFIQ
         Nf2iDcoi4AnmhzjpiqI+RnqV3nV6i0rtERmEE9o4nAeqsIMBxc+RzikBpMvbzc+4zirh
         wv5FUSD28XXwQbsGKMuubGlI4fBx2pSIgH+a7VRizc3gPtcOuFbzb2/zOyYldvJwStyz
         bCnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lh8SKZ1B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l47-v6si8565504qvc.189.2018.09.23.11.05.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 23 Sep 2018 11:05:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lh8SKZ1B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g48l3-0005zb-GH
	for alex.bennee@linaro.org; Sun, 23 Sep 2018 14:05:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <karthimohanraj.in@gmail.com>) id 1g48kv-0005zH-Of
	for qemu-arm@nongnu.org; Sun, 23 Sep 2018 14:05:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <karthimohanraj.in@gmail.com>) id 1g48kt-0001Ot-9B
	for qemu-arm@nongnu.org; Sun, 23 Sep 2018 14:05:17 -0400
Received: from mail-it1-x12f.google.com ([2607:f8b0:4864:20::12f]:34973)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <karthimohanraj.in@gmail.com>)
	id 1g48kp-00014Z-Oq
	for qemu-arm@nongnu.org; Sun, 23 Sep 2018 14:05:13 -0400
Received: by mail-it1-x12f.google.com with SMTP id 139-v6so7813870itf.0
	for <qemu-arm@nongnu.org>; Sun, 23 Sep 2018 11:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+52MMBPItUSrq0r2dkGkLE+BtKzUkww7qZDNkjoUwKk=;
	b=Lh8SKZ1BA/vyajwn9kHpqUZOJ7VZhrpa37H7AeSS8ynXlG+buHTP+BUeYVa2SUuU6c
	2HULVGtGRwnt8YIqFK1oFh7R0AxYBmJKZF1Go1nZAA2RpBC4jDqXzXa2vfK/1DUFDNks
	Y1PE0w71qAOS7GH/0pY1n30vB4ygKewVKIJ34ZVMdwd/OWSFN0ypwUMcYF+4jtdflADn
	quEy8neGW/NMML3Ovnc6dwWIC/FBSw+regIEDyT9fCwKNKaJHVA87CiQFO81dq1dAuyd
	RT92RXWAR+N8KXm9fPILG+B7Ms7j1EiJ2D13k4iNK5eTTizcCQIzkfK1mJSqDlHDZJWu
	rVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+52MMBPItUSrq0r2dkGkLE+BtKzUkww7qZDNkjoUwKk=;
	b=WAkB+3ajxtuQA7VlZbZEszQFv+654WCmJMWXNnShgsuveAeMZPGk/9WvFI/OTt8Xll
	mYDS69pPzxNtRlL7obtCaI8quWqE7h9665DPzj769+qJhzDfI6RE61+8jIvitC+vVxIw
	wz69+HwntPhnZUcCJY626VjWyq6MxjGVFfcOdPt6M6lHDsXidiRqChoJytWuY/hOXQ26
	/vXX68mkB9rlTZCllLPJMmarGo+9NFigeplzrauRBdUYGmL7KVyZLs3XLfMR3mMcAp59
	4BTzu1XMwe43MNzQTZ4zQ8/BH+p3MHcjiQAnvubpaS0dvNvzMw7GnUeVqHye+M5BWAJJ
	URng==
X-Gm-Message-State: APzg51ARPChi8RAvxjPnV5AIpCopW9XfVb/RZQe7jp18bIHNz64Mfhk4
	d7JdScdwpzQEtN2yNLqgbbENn73lF8WTDBwzm1E=
X-Received: by 2002:a24:36c9:: with SMTP id
	l192-v6mr5109959itl.62.1537725910922; 
	Sun, 23 Sep 2018 11:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <F594E1D2-CAB1-48DF-9A78-66C3DC66F41E@gmail.com>
	<CAFEAcA-QWubs8FWWYuD9KjDnkjuVodtx++8DtHvsCC2AbDZSKg@mail.gmail.com>
	<9DF52029-EEB1-4ECA-B1B0-0F7B1ACAE83A@gmail.com>
	<CAFEAcA9KwO=U99wKi-7pMJB5wwUAs1yEX98XR=RY0YTPZSvXKg@mail.gmail.com>
	<7FECCB75-9B28-4AB7-8ED1-B37FEC14C644@gmail.com>
	<CAFEAcA97va60jAsiKC4h0O6yP-BjMZoh98TGEnVU73AnKVKN0A@mail.gmail.com>
In-Reply-To: <CAFEAcA97va60jAsiKC4h0O6yP-BjMZoh98TGEnVU73AnKVKN0A@mail.gmail.com>
From: karthi mohanraj <karthimohanraj.in@gmail.com>
Date: Sun, 23 Sep 2018 23:34:57 +0530
Message-ID: <CADDzEDKMdzSn0xdRcPYAdBq_F714q5oTwYf2JKxutN9f7QknBQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000aeb9d905768db636"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::12f
Subject: Re: [Qemu-arm] Arm Cortex A-72 Emulator not able to configure
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y/mb7fTovjju

--000000000000aeb9d905768db636
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks for the clarification. let me check this out and try it.


Thanks,
Karthi

On Sun 23 Sep, 2018, 11:32 PM Peter Maydell, <peter.maydell@linaro.org>
wrote:

> On Sun, 23 Sep 2018 at 17:20, karthi mohanraj
> <karthimohanraj.in@gmail.com> wrote:
> >
> > Hi Peter,
> >
> > As i have gone through CentOS documentation qemu-system-arm is the only
> binary which is used for 64 bit and 32 bit arm emulation. There is no
> separate qemu-system-aarch64 binary in CentOS. Please correct me if i=E2=
=80=99m
> wrong.
>
> I'm pretty sure you're wrong. In particular the error
> message you quote is saying there's no support for
> the 64-bit cortex-a53 CPU in the binary you're using,
> which means it's the wrong binary. Either it's too
> old a version of QEMU, or Centos is like every other
> distro and you want qemu-system-aarch64.
>
> thanks
> -- PMM
>

--000000000000aeb9d905768db636
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok, thanks for the clarification. let me check this out a=
nd try it.<div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks,</div><div dir=3D"auto">Karthi</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Sun 23 Sep, 2018, 11:32 PM Peter Mayde=
ll, &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, 23 Sep 201=
8 at 17:20, karthi mohanraj<br>
&lt;<a href=3D"mailto:karthimohanraj.in@gmail.com" target=3D"_blank" rel=3D=
"noreferrer">karthimohanraj.in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Peter,<br>
&gt;<br>
&gt; As i have gone through CentOS documentation qemu-system-arm is the onl=
y binary which is used for 64 bit and 32 bit arm emulation. There is no sep=
arate qemu-system-aarch64 binary in CentOS. Please correct me if i=E2=80=99=
m wrong.<br>
<br>
I&#39;m pretty sure you&#39;re wrong. In particular the error<br>
message you quote is saying there&#39;s no support for<br>
the 64-bit cortex-a53 CPU in the binary you&#39;re using,<br>
which means it&#39;s the wrong binary. Either it&#39;s too<br>
old a version of QEMU, or Centos is like every other<br>
distro and you want qemu-system-aarch64.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000aeb9d905768db636--
