Received: by 10.223.197.9 with SMTP id q9csp9019798wrf;
        Sat, 21 Oct 2017 10:13:16 -0700 (PDT)
X-Received: by 10.233.239.140 with SMTP id d134mr12096096qkg.308.1508605996663;
        Sat, 21 Oct 2017 10:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508605996; cv=none;
        d=google.com; s=arc-20160816;
        b=kqCD1WP7Lx50rH4OAerwNa3KxhWRjb3NBwhagzDnyAFTht/Z2e7brmSjJ+Ro80BUT0
         4obBRq8MMN1Ausac4a81RB3/1RKnZ06dCVYHE8cffnuYEZQq34pbpEaA1+XtOZmNTj0h
         IpRQoJXReCT7JGPhLbPMe3hK6LgZwFAVihWDUsoMLaFF4v4YFnnYJ1JtiFUYCb4kdfh4
         PfTXuNgbNH+QMOH7uW13G6VN+sc9+pWSLp2tQOVUX8obYVlw6yeBUMamO0goj0R1DKVY
         i3GFLWs60c9Hgii+8xD0FRPdTVwcHB8amsTOjcJSZHF8CklpV4+k0+q0+zcxiqTfEBbK
         JCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=56hfnTxczrpo99Z8g/ivewBI8tq6zSg+wzoQjdBhrmE=;
        b=FEGSuNEpk8NyvKJrRcV3r3ZcDPutaqIfj25+xXcvnCdIub+B9nl/Os+RluSafdMkHB
         TNjT4ckGSguwzKNdhGurz2Vsvh0IWT/15B6j7suIOZ6J3NYzy8zv/KFX3Goih3hbNJLk
         7572qtI8f7sGzSKGAo01YhOXoIqardWAshPqSsmZX5XX/XV7m4YLkvtybrlKIXXkyl25
         09m1FcbD7k3uMVywxEHFPxLFFCerf4jSTZaILuyu/QArZWstIX50u8KhYrovn0RMvSl+
         hwihN51J3bpN/KsNJVH+qm/blNJhfR1gRDjm5vtD9UWFVUOVm44j6wX0+f2eYayjmv66
         5hwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@aucklanduni.ac.nz header.s=google header.b=XxTXsjTl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4si3007774qtk.318.2017.10.21.10.13.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Oct 2017 10:13:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@aucklanduni.ac.nz header.s=google header.b=XxTXsjTl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5xKk-0007Tj-DC
	for alex.bennee@linaro.org; Sat, 21 Oct 2017 13:13:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hteh703@aucklanduni.ac.nz>) id 1e5xKb-0007SI-HK
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 13:13:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hteh703@aucklanduni.ac.nz>) id 1e5xKa-0007sw-FN
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 13:13:05 -0400
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232]:55666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hteh703@aucklanduni.ac.nz>)
	id 1e5xKa-0007sf-2X
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 13:13:04 -0400
Received: by mail-wr0-x232.google.com with SMTP id l8so835540wre.12
	for <qemu-arm@nongnu.org>; Sat, 21 Oct 2017 10:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=aucklanduni.ac.nz; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=56hfnTxczrpo99Z8g/ivewBI8tq6zSg+wzoQjdBhrmE=;
	b=XxTXsjTlo6HfGuIARhNY+LmbVQSXLxMtP1edoP2WZKP9u30MTyod7F/hr2xqQMjlEE
	OUiIafDzIfguZuqCAgu5MrDGyfOia2lNEn75XG4ruIA66EKNEZQrVztbu3dD87NYVsWm
	koXx1nBLDDoVXVNcgKS71z6oX6pLkkBQ/tAYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=56hfnTxczrpo99Z8g/ivewBI8tq6zSg+wzoQjdBhrmE=;
	b=ertSX4OwcmIv/wcS+3YzVdbo8E+Sx1p0USqPo5khRsttkrcUu4Dz7utZtxNFFTjzsW
	O4xJrpK4nRjC+05v19VnnORFqZF+V/VP58s5fSwSjJ4S2ARB3uHaH1FDBXcqv/1wf/Et
	r923/S7BJ5MmlH6EgApjzOr7mJejIaoFKBDHI91yXUIO6q3SuJa0X8fsLa/qZau01NRW
	tcRSH0aK4m5a5lUKJrQfM4k/Ho1AsXbnT3uJBmAbT54SpUJ/KgegCpg5Dy9k/IgQp/KT
	scIZEpnLycJpJ+GlE1LKVqoPENelEyp/IyNKswSMD0fMTeITYXeSfd2IdYW/uaVJhYzx
	MbaA==
X-Gm-Message-State: AMCzsaVP4/oyeNBd3iLyuu/KOwNrlnqrpVERnzhhi+jZHk0gelPQLmjI
	KRPYR0KgxCuQrFJp172F2glKBCxSkofR/yjLKOlhkg==
X-Google-Smtp-Source: ABhQp+SpohYiTrokahfMAv0EWuhpUgRDZfIIbcMWonqOyw8G13/wQVgqCmz9SNuhmbwd3tVcN6ZJR7d+5Ha1zSZ0WSQ=
X-Received: by 10.223.196.156 with SMTP id m28mr103439wrf.67.1508605982862;
	Sat, 21 Oct 2017 10:13:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.102.214 with HTTP; Sat, 21 Oct 2017 10:13:02 -0700 (PDT)
Received: by 10.28.102.214 with HTTP; Sat, 21 Oct 2017 10:13:02 -0700 (PDT)
In-Reply-To: <CAFEAcA9+3N_7q5-htk3vReuyXf9iio3UO3Tn9rh=5vh3AcMcnQ@mail.gmail.com>
References: <CAPLZ2xMgcbiJr+rbQwZxbP6chMzZ7fBcJ1q35tEbjhccQHPsow@mail.gmail.com>
	<CAFEAcA8TfRzsP2TuK9_MeP=puPV-+3ivL=R8F3LkGcnMCDLEQA@mail.gmail.com>
	<CAPLZ2xM+1MwjYgmLYWo_gWctN_B10zma+X1iUKB-0G4iau_=zQ@mail.gmail.com>
	<CAFEAcA9+3N_7q5-htk3vReuyXf9iio3UO3Tn9rh=5vh3AcMcnQ@mail.gmail.com>
From: Hui Yie Teh <hteh703@aucklanduni.ac.nz>
Date: Sun, 22 Oct 2017 06:13:02 +1300
Message-ID: <CAPLZ2xNTKk311Ehg16bG8pQ6b3sJPP0cr4uwxz4DYDaPP4nkFQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="f403045f5486b70408055c11b356"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::232
Subject: Re: [Qemu-arm] .bss more than LM3S6965evb RAM size
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
X-TUID: XDr5rUOb8Gyc

--f403045f5486b70408055c11b356
Content-Type: text/plain; charset="UTF-8"

I see. Thank you so much for your help!

On 22 Oct 2017 05:45, "Peter Maydell" <peter.maydell@linaro.org> wrote:

> On 21 October 2017 at 12:10, Hui Yie Teh <hteh703@aucklanduni.ac.nz>
> wrote:
> > I see, thanks for your reply Peter!
> >
> > What if I have a stack size of 2048*4 as I'm using 4 threads with that
> stack
> > size? Will that be in the RAM as well?
>
> Your stack certainly should be in RAM. If it gets put
> anywhere else then you will find it doesn't work. (This is
> actually a fairly common mistake with hard-to-recognize
> results: when the program uses the stack the writes go
> into nowhere and the reads come back as zero, so the
> result is weird behaviour as variables stored on the
> stack silently get zeroed...)
>
> > Also, this is the memory map of my linker:
> >
> >> MEMORY {
> >> RAM_INT (AIW) : ORIGIN = 0x20000000, LENGTH = 16M
> >> ROM_INT (RX)  : ORIGIN = 0x00000000, LENGTH = 64M
> >> }
> >
> >
> > I was wondering if it means that I have 16MB of RAM and 64MB of ROM? Or
> does
> > it not affect the original RAM and ROM sizes?
>
> What you tell the linker affects how it tries to place
> things in the executable it produces. You can lie to
> the linker about what the hardware has (or in this
> case about what the QEMU model has). The effect will
> be that the linker will believe you and produce an
> executable that doesn't work. I would recommend fixing
> your linker script.
>
> thanks
> -- PMM
>

--f403045f5486b70408055c11b356
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I see. Thank you so much for your help!</div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 22 Oct 2017 05:45, &quot=
;Peter Maydell&quot; &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.=
maydell@linaro.org</a>&gt; wrote:<br type=3D"attribution"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On 21 October 2017 at 12:10, Hui Yie Teh &lt;<a href=3D"mailt=
o:hteh703@aucklanduni.ac.nz">hteh703@aucklanduni.ac.nz</a>&gt; wrote:<br>
&gt; I see, thanks for your reply Peter!<br>
&gt;<br>
&gt; What if I have a stack size of 2048*4 as I&#39;m using 4 threads with =
that stack<br>
&gt; size? Will that be in the RAM as well?<br>
<br>
Your stack certainly should be in RAM. If it gets put<br>
anywhere else then you will find it doesn&#39;t work. (This is<br>
actually a fairly common mistake with hard-to-recognize<br>
results: when the program uses the stack the writes go<br>
into nowhere and the reads come back as zero, so the<br>
result is weird behaviour as variables stored on the<br>
stack silently get zeroed...)<br>
<br>
&gt; Also, this is the memory map of my linker:<br>
&gt;<br>
&gt;&gt; MEMORY {<br>
&gt;&gt; RAM_INT (AIW) : ORIGIN =3D 0x20000000, LENGTH =3D 16M<br>
&gt;&gt; ROM_INT (RX)=C2=A0 : ORIGIN =3D 0x00000000, LENGTH =3D 64M<br>
&gt;&gt; }<br>
&gt;<br>
&gt;<br>
&gt; I was wondering if it means that I have 16MB of RAM and 64MB of ROM? O=
r does<br>
&gt; it not affect the original RAM and ROM sizes?<br>
<br>
What you tell the linker affects how it tries to place<br>
things in the executable it produces. You can lie to<br>
the linker about what the hardware has (or in this<br>
case about what the QEMU model has). The effect will<br>
be that the linker will believe you and produce an<br>
executable that doesn&#39;t work. I would recommend fixing<br>
your linker script.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--f403045f5486b70408055c11b356--
