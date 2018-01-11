Received: by 10.28.173.206 with SMTP id w197csp508518wme;
        Thu, 11 Jan 2018 05:21:21 -0800 (PST)
X-Google-Smtp-Source: ACJfBov38hXWUq+iDXmIP7+UEzW4fzglJP0GlNlXQ1qWeWstpxUESsNj7b6xh7LHWUwox+osC1sT
X-Received: by 10.37.199.11 with SMTP id w11mr14168297ybe.285.1515676881197;
        Thu, 11 Jan 2018 05:21:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515676881; cv=none;
        d=google.com; s=arc-20160816;
        b=oSVDiZUoQ87u+TeB5jV3NCLsv91b2n3fL/mg/OiVO3IQjs/2Zqd2qFgJOHY8pGrll2
         EN8jiYoFNyCC1/+xOIYkgMfs4sHjfPrGrpOtc/haBw7//M3a+63LpPJIhuOCbs6U+C29
         q66qSLBKI+BqZowFiy7uWy3mLyCkdCwyjtKkAsyjzRuQ9hfynrWbG6ntxzR6a+WyMwCg
         cfTPAmyo5Hi0qT9YB80DCDdy2UDrXWJYTjTBhsjTbT6zfTbg8azAhZTp7hIdw3i7g498
         rVwFp268xHMibFl5u2cfaeD+DUHgRG4Wps49+EQFX09rU3an1BtS5t5QM55Ytcdj2K92
         l3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:references
         :message-id:content-transfer-encoding:date:in-reply-to:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=ycU2CRCf4L6lM+oxLKPJux8ROerGPGpr2KN8sBs4CTU=;
        b=UU0BkuJ45zYmads87IPJh1iMfxd9/ODQPDeRHVd4LtQ2dlW6Dt24fbd/iAuY1OhrYV
         m7EAD8lQ+/6aCCYSWVmGyYPLMbNj5yb/I7LjTE39z8nAI+3xChxVvVATQHVyQewPPFZ2
         qLCbILXsLYu7CBV4pbtTNULWhLVtdGFOmwVnajxSvRVY6DwA0UqLWVQ2LZeVmBfYmIHf
         AxRkc75FMAsoZJmyRBoGN1giJDmhY1OQXfkPP0Td3YvG+MLdKQbNSfo3IzAMwD77yX2X
         wEJ2W6HjbDUdnhsOhWX/Z9qgoGHRSvTCJm92SHSTSH4lMVU7H8fjXRuEtCN7evbdWWDH
         4F4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@dgtlrift-com.20150623.gappssmtp.com header.s=20150623 header.b=CasDmObs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f8si1846531ywb.774.2018.01.11.05.21.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 05:21:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@dgtlrift-com.20150623.gappssmtp.com header.s=20150623 header.b=CasDmObs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZcnI-0006sr-JS
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 08:21:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1eZcmi-0006W6-Q9
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 08:20:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1eZcmf-0000tt-LS
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 08:20:44 -0500
Received: from mail-yb0-x235.google.com ([2607:f8b0:4002:c09::235]:39721)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jhanley@dgtlrift.com>)
	id 1eZcmf-0000tJ-CW
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 08:20:41 -0500
Received: by mail-yb0-x235.google.com with SMTP id 65so1051732ybz.6
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 05:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dgtlrift-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ycU2CRCf4L6lM+oxLKPJux8ROerGPGpr2KN8sBs4CTU=;
	b=CasDmObsIgSEWAXdmoAfsj0WKLIzJdyscjQeox5ZHci7o9Dv8cxoXHPtv9HKw4Z+KC
	++6B4rvCKl9VXQAISkOupip/gKS/VEv5VCn46oWyNEcpSerLDD5msQv/yt/0K4krYYCV
	hOugquH5mBSes7N4v6fJdKq8kckKkGKYRP+ePJV+XVzGoifKKMWzrBk5wO4P1b7Ub8ib
	G0wE4mE0ca9CdYw8zAFmeoet9T5wHiAIP87SwHWa9HVrsBUwCLJM5HlFUvi+etwTg33G
	Gk6ijgDGUd9si/VbW8Vpxi1G3cpG8XKC81mhZPiQGk2Mr5lRAd2ZLZCyOe6b80mqL9Ne
	5wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ycU2CRCf4L6lM+oxLKPJux8ROerGPGpr2KN8sBs4CTU=;
	b=QlZE0sMONi0pgorjaPlqxNqxJIoQV8cWEK1KFleOLbUks6eKvO9kcCYdohm5rXxtek
	81sF+WEc5qeO3GkxEZtuQCEYeP2Dnnc9xUeECIPBtWMKxtANWiHz8ht7DGXD0iSER4v9
	e1sNhMwXOSCU6ewq4B6e6qbzm8dBQyGGIsB4ICfpzoAxb70M47nNOuWQkVFHfjJaOSzu
	SDgoPpHtrLGiuN8ohpdmTy0LUDiztKg2IB1LpRifYbuRO/hvQJRXsK6y6eVAF+UolsON
	o+jecDFYvhAtlpaVm7hn1TB1MiIupFK5zXG37aE0+wjM9rIKILFD3SYIlNCQObkJzAZN
	Dtrw==
X-Gm-Message-State: AKGB3mJpez41zF1TpZvD4lZ/h8SYVHJkznJzBOv33r+gyc4QQfe6tjZv
	A6o2/2enO5Z8NSangz7NOahUlBx3/2U=
X-Received: by 10.37.33.2 with SMTP id h2mr20864721ybh.157.1515676840382;
	Thu, 11 Jan 2018 05:20:40 -0800 (PST)
Received: from [10.1.219.115] ([148.80.255.216])
	by smtp.gmail.com with ESMTPSA id
	l21sm7949051ywc.34.2018.01.11.05.20.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 05:20:39 -0800 (PST)
Content-Type: multipart/alternative;
	boundary=Apple-Mail-91CA7B49-03FE-420F-A0A4-EE8A8B8495A4
Mime-Version: 1.0 (1.0)
From: James Hanley <jhanley@dgtlrift.com>
X-Mailer: iPhone Mail (15C202)
In-Reply-To: <CANN23NnJWS-dT8yDZnZW_wf-L88rMU7n5fzfsgEE3b61Zoa-Rg@mail.gmail.com>
Date: Thu, 11 Jan 2018 08:20:36 -0500
Content-Transfer-Encoding: 7bit
Message-Id: <9A747A1E-E503-48C6-9A28-82F2753FA2D9@dgtlrift.com>
References: <CANN23NnJWS-dT8yDZnZW_wf-L88rMU7n5fzfsgEE3b61Zoa-Rg@mail.gmail.com>
To: patrickelectric@gmail.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::235
Subject: Re: [Qemu-arm] Running qemu-system-arm with stm32f303
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IWactk9X08Lr


--Apple-Mail-91CA7B49-03FE-420F-A0A4-EE8A8B8495A4
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I=E2=80=99m not sure you can specify a pipe (executable) argument to -serial=
, but you can specify a tcp listener (or even client) and then have the pyth=
on script connect to it (or wait for connection)
-Jim

> On Jan 10, 2018, at 7:07 PM, patrick JP <patrickelectric@gmail.com> wrote:=

>=20
> Hello,
>=20
> I am running QEMU v2.11.0 to run my .elf, a bare metal code.
> The .elf runs in my stm32f303 board, flashed via stm32flash.
> My objective is to run the .elf in my machine to do testes over the serial=
 communication, running socat PTY,link to create a bridge between /dev/devic=
eIn and /dev/deviceOut, where /dev/deviceIn would be qemu -serial argument a=
nd /dev/deviceOut the path for my python script.
>=20
> Right now, I am running:
>=20
> qemu-system-arm -machine versatilepb -cpu cortex-m3 -nographic -monitor nu=
ll -serial null -semihosting -device loader,file=3Dfile.elf
> output: segmentation fault (core dumped)  qemu-system-arm -d cpu,in_asm -m=
achine versatilepb -cpu cortex-m3 -nographi
>=20
> qemu-arm -d cpu,in_asm -cpu cortex-m3 -B 0x08000000 file.elf
> log: https://pastebin.com/FyA1pc8m
>=20
> qemu-system-arm with .elf return the same error with .elf.
> qemu-arm with .elf return Error while loading file.hex: Permission denied.=

>=20
> Someone know how can I solve or debug problem ?
>=20
> My best regards.
>=20

--Apple-Mail-91CA7B49-03FE-420F-A0A4-EE8A8B8495A4
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">I=E2=80=99m not sure you can specify a pipe=
 (executable) argument to -serial, but you can specify a tcp listener (or ev=
en client) and then have the python script connect to it (or wait for connec=
tion)<br><div id=3D"AppleMailSignature">-Jim</div><div><br>On Jan 10, 2018, a=
t 7:07 PM, patrick JP &lt;<a href=3D"mailto:patrickelectric@gmail.com">patri=
ckelectric@gmail.com</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"><=
div><div dir=3D"ltr">Hello,<br><br>I am running QEMU v2.11.0 to run my .elf,=
 a bare metal code.<div>The .elf runs in my stm32f303 board, flashed via stm=
32flash.</div><div>My objective is to run the .elf in my machine to do teste=
s over the serial communication, running&nbsp;socat PTY,link to create a bri=
dge between /dev/deviceIn and /dev/deviceOut, where /dev/deviceIn would be q=
emu -serial argument and /dev/deviceOut the path for my python script.</div>=
<div><br></div><div>Right now, I am running:</div><div><br></div>qemu-system=
-arm -machine versatilepb -cpu cortex-m3 -nographic -monitor null -serial nu=
ll -semihosting -device loader,file=3Dfile.elf<div>output: segmentation faul=
t (core dumped) &nbsp;qemu-system-arm -d cpu,in_asm -machine versatilepb -cp=
u cortex-m3 -nographi<br><br><div><div>qemu-arm -d cpu,in_asm -cpu cortex-m3=
 -B 0x08000000 file.elf</div></div><div>log: <a href=3D"https://pastebin.com=
/FyA1pc8m">https://pastebin.com/FyA1pc8m</a></div><div><br></div><div>qemu-s=
ystem-arm with .elf return the same error with .elf.<br></div><div>qemu-arm w=
ith .elf return&nbsp;Error while loading file.hex: Permission denied.<br><br=
>Someone know how can I solve or debug problem ?<br><br>My best regards.</di=
v><div><br></div></div></div>
</div></blockquote></body></html>=

--Apple-Mail-91CA7B49-03FE-420F-A0A4-EE8A8B8495A4--
