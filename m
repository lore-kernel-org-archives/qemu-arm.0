Received: by 10.25.205.13 with SMTP id d13csp9147026lfg;
        Tue, 3 Jan 2017 23:05:59 -0800 (PST)
X-Received: by 10.55.45.4 with SMTP id t4mr36208313qkh.145.1483513559230;
        Tue, 03 Jan 2017 23:05:59 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j68si44588946qte.13.2017.01.03.23.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jan 2017 23:05:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37663 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cOfe0-0004af-G6
	for alex.bennee@linaro.org; Wed, 04 Jan 2017 02:05:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jiahuanzhang90@gmail.com>) id 1cOfdv-0004aP-P6
	for qemu-arm@nongnu.org; Wed, 04 Jan 2017 02:05:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jiahuanzhang90@gmail.com>) id 1cOfdu-0000PK-Sj
	for qemu-arm@nongnu.org; Wed, 04 Jan 2017 02:05:51 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35261)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jiahuanzhang90@gmail.com>)
	id 1cOfdu-0000P5-OD
	for qemu-arm@nongnu.org; Wed, 04 Jan 2017 02:05:50 -0500
Received: by mail-qk0-x242.google.com with SMTP id u25so52844651qki.2
	for <qemu-arm@nongnu.org>; Tue, 03 Jan 2017 23:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=YayR6uY8HtUM+yYUV0SrSeTGya9cbjirZTfbtn6RxJc=;
	b=LMsXHiNo+r1Rr5f9FZq1uj9ZD4lee9iQnNiCGaZCGJno0BhyfYkq3Ze5vD03NB6l1k
	lV1Q1RkvDYvM7aaORWV2M6+6sqwHYuCPj/d+xKjPLQznKlRrkbIZ9uw/Y/PGsLnHURAu
	45OnA+41c1h1O1kfUOmtkHdxwEyI7/9Jfu7iOk7qkDnKDZuyjZIMBy6ClPpHX/iv1bi1
	RA2jr4k8R2u6PRr4x1Ij9VRJUMY7yBuzJrOxUnbZmXixnfzKKWf4yGgW7JTqPM2NY1IY
	7SGB39Q10XzZIWAHVkGYTwUoA57Fr+XP7inemPJ3Y9QJl1EPmIDx6WYpX/fyQJdFMFqr
	a0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=YayR6uY8HtUM+yYUV0SrSeTGya9cbjirZTfbtn6RxJc=;
	b=jsyAwxwm+R0OJtWClR5hnprhRLM5o5OrMMp7JILA+5fNvProJfhhtsYs5fgYgwjHvY
	t79ouq/pBzjaaMrCfSufrfwJJAAPuAQG4V1CD9EQdN4xretnL2Iw4alP7C91N7K8L0XT
	XHAs1yx8rasKFCLZ1VA9HdExnR+UHovTgEpsUi/vtLxVOlCZkg/SyN8uxjbE8ivW7fwW
	c9zE8Yic29E09fPHhCXQR9s2fIv5tmv8ka1tx0gPG08pkFMiHFuALv8yhKvXG6Unx44L
	2G0UkTTNP9dc5iBRIO2WAFYkgynU781g14lPTvjSGy9Zo2v8NaqaPyitMd+X0MmJY55Q
	V6Cw==
X-Gm-Message-State: AIkVDXKPToKpt2V9sWXmq43OWSdNk5/hPI71yrb1n2MQHryuSxzoeRSW/2RRA3/qh9gJ6HrcqV2FwSMEi/HaTw==
X-Received: by 10.55.160.65 with SMTP id j62mr57160211qke.239.1483513550032;
	Tue, 03 Jan 2017 23:05:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.139 with HTTP; Tue, 3 Jan 2017 23:05:49 -0800 (PST)
From: Jiahuan Zhang <jiahuanzhang90@gmail.com>
Date: Wed, 4 Jan 2017 08:05:49 +0100
Message-ID: <CAJy91CYscXEOQ=cFeDt_NF2ZatL1PBOyYmTJg4xhytpWUtpaRQ@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=94eb2c07053a2b561105453f6abf
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-arm] How to debug peripheral device
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X/8plBU4KJ3v

--94eb2c07053a2b561105453f6abf
Content-Type: text/plain; charset=UTF-8

Hi everyone,

This is my first time to use QEMU. I am emulating the atmel at91sam9261
board. I want to debug the functionalities of the emulated peripherals.

What I am doing now is to *printf* the reading and writing memory offsets
and values for the periperals when running a linux uImage. And according to
the emulated periperals' *read* and *write* behaviours, I rectify their
resigters in terms of their corresponding functions in the board's
datasheet.

However, not all the printed offsets are expected. And some offsets that I
expected to be written are not be  written, so that some functions will
never be enabled and some peripherals are never be driven. Any solution for
this offset missing?

What is the right way for peripheral debugging? Getting stuck for almost
two months, I am really upset now.

Best regards,
Jiahuan

--94eb2c07053a2b561105453f6abf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,</div><div><br></div><div>This is my firs=
t time to use QEMU. I am emulating the atmel at91sam9261 board. I want to d=
ebug the functionalities of the emulated peripherals. </div><div><br></div>=
<div>What I am doing now is to <em>printf</em> the reading and writing memo=
ry <span><span>offsets and values for the periperals when running a linux u=
Image. And according to the emulated=C2=A0periperals&#39; <em>read</em>=C2=
=A0and <em>write</em> behaviours,=C2=A0I rectify their resigters in terms o=
f their corresponding functions in the board&#39;s datasheet. </span></span=
></div><div><br></div><div>However, not all the printed=C2=A0offsets are ex=
pected. And some offsets that I expected to be written are not be=C2=A0 wri=
tten, so that some functions will never be enabled and some peripherals are=
 never be driven. Any solution for this offset missing?</div><div><br></div=
><div>What is the right way for peripheral debugging? Getting stuck for alm=
ost two months,=C2=A0I am really upset now.</div><div><br></div><div>Best r=
egards,</div><div>Jiahuan<span></span></div></div>

--94eb2c07053a2b561105453f6abf--
