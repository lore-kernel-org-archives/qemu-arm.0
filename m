Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp475574wrt;
        Fri, 4 Jan 2019 02:55:03 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5rtTJxlh38CSPTQ2FBFVAk7fCEouK7zTrT5doLf/T2E6PYgN4i55XfdaVq351DGPrQeoYW
X-Received: by 2002:a0c:8aa8:: with SMTP id 37mr49907181qvv.23.1546599303249;
        Fri, 04 Jan 2019 02:55:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546599303; cv=none;
        d=google.com; s=arc-20160816;
        b=eRuKgkonCUXPPRFVb/pU95gmgzWy78SThoIYd5S/6xJHSei1urZ06XXP1rGDvWcckn
         1mITwiD38auhnv8OZcBlY6vUwBqzfcjPqPmesf0zDs2HIPpUVP3lwucEPjdJYaZhvqWV
         bFWF2iKG3rzLDVMXzs6QJjr0+5r4W0TN8vhLLqOCTtYwmujVQfrO/wXUu1O1jBBB4gIL
         kt92CzDrFM2bEu/vMJL1FDPfDXz7wIJhAgwZLOMFPZKWMtiT7orpD0Biz3fB1S8wVrgr
         Fw79jETwiCF5rgswi2zRbNdWHQAE+Afd5Q49x1FLpwL1OFZiRjSKUwfiS7v64jO8BhXi
         kNgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-signature;
        bh=rctncTEZDw3YTSIrQTerOBdm6qlYrDTwHTD/ZCM4/OQ=;
        b=DCRENCYe8dEP9jFZw/lFSXjsYuBURLdVhI+S1RYoQkVA2qJ4o8DT9mXhGoeUciYtZR
         GpLwqGrMavHkzhj0TToJ1Y3CRWUcEzkOWJcpCz4WIYZIfE+Veia32MaWeSEd+sejGQlC
         1w7nmIk9c9XxJPhgMmODrFvhggCNhgk1vXVahKRE6w3k1cx+rHRr7xbRlvazq4BDFeMr
         uGaY3dlS1Y9pVjqXP26nZ0kjBKU7Wo8xuC8knfOQu1a0138FGlWdkWInepz1b0cJ70Qu
         dI+Qp1MfGYiPc+glY2pYcSPCworLdo8ufIHoHsNmZkRqKXzsg8Pow0bCJJlwECCOWfyC
         o3Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qiq1ms40;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q12si280150qvd.64.2019.01.04.02.55.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 02:55:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qiq1ms40;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:34053 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfN82-0007fX-Qc
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 05:55:02 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1gfN7t-0007e8-Bo
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 05:54:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1gfN7s-0005EM-BW
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 05:54:53 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:46609)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <antonynpavlov@gmail.com>)
	id 1gfN7n-0005BZ-UP; Fri, 04 Jan 2019 05:54:48 -0500
Received: by mail-lf1-x142.google.com with SMTP id y14so6187542lfg.13;
	Fri, 04 Jan 2019 02:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rctncTEZDw3YTSIrQTerOBdm6qlYrDTwHTD/ZCM4/OQ=;
	b=qiq1ms403UI6BduXKW6douxi3dxD9uMmiMayMY0qvjp/24zEHYFXDlZm6cidyKy64K
	CjmjQbHiQ9UzGK1/cpZw8zrIopOZSk7qXzQBBhg/1DlJZLZqDB8PSucICPD6gcvtcdr1
	kmS2rNn816hUUnynUed2cQf5J9UPKLOdUKGWNxsjKndSQZYnIk0t5ejde/QVkKl3znIv
	TSctNgzhTvFd1Em8+nE7Tu7lZo2by8wVVCGX/bKs2si3nzOWHVuCOGdVKCX822y44bHS
	VgGdIbA1aiv+0xNbANSnr/ZuyurMY6RbTyxFjqU4su9bd7lrYIElHpfitUQksIDOmpRV
	3nVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rctncTEZDw3YTSIrQTerOBdm6qlYrDTwHTD/ZCM4/OQ=;
	b=ToeNw5OAmZDy7ju5MzRlKQGGg+a+29N5TPTXmtD+xBYfJJB/OS4ErGFQIcTGv+zTsK
	WcfSPJevhPpc81pZz9e0vKEkqwoy9qH3Wd5SzuqA5sJGfcTwknsbUXnA9K875Lvv0iJH
	rUQPttzguCcJX3YZ3zp/hehKRSYE4kq2Dw7FL2m1qeI2b5Mu+CynELWRm7fYnTd+nXXJ
	SHTnqm0ePJK8J/2Mwfi75QCiUhLQE4moh8P55iJM03gWeYZ9LvqTBmqHpVDqi4VdcdXZ
	dTPMY/6PXG2D6LAZPxuJxGnNUCow4UIFrRAAJ/A/aCmzuEmRgYAZbFHXfF4FU9uRPqMW
	Md4A==
X-Gm-Message-State: AA+aEWZF5yf3xaig5uosPkHDt/Jd7UEugzvM11HBqOxCB5w7P0c1abph
	V4MMZjZvHB7kV6bwkFxf7Ug=
X-Received: by 2002:a19:c396:: with SMTP id
	t144mr24684321lff.110.1546599286456; 
	Fri, 04 Jan 2019 02:54:46 -0800 (PST)
Received: from flare (t35.niisi.ras.ru. [193.232.173.35])
	by smtp.gmail.com with ESMTPSA id
	v17-v6sm12138550ljg.32.2019.01.04.02.54.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 Jan 2019 02:54:45 -0800 (PST)
Date: Fri, 4 Jan 2019 13:54:44 +0300
From: Antony Pavlov <antonynpavlov@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Message-Id: <20190104135444.01b4689b768453fa22fca68a@gmail.com>
In-Reply-To: <20190104081741.mxdgg4dwm4l5s4ki@pengutronix.de>
References: <20190104015641.e6d525f098c5e272694faa62@gmail.com>
	<20190104081741.mxdgg4dwm4l5s4ki@pengutronix.de>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; i686-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-arm] barebox on Canon A1100
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
Cc: Barebox List <barebox@lists.infradead.org>, Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VYxgs8oTJUYq

On Fri, 4 Jan 2019 09:17:41 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> On Fri, Jan 04, 2019 at 01:56:41AM +0300, Antony Pavlov wrote:
> > Hi Sascha!
> >=20
> > I have some good news and some bad news.
> >=20
> > First the good news.
> >=20
> > Barebox was used for Day 18 of QEMU 2018 advent (https://www.qemu-adven=
t-calendar.org/2018/).
> >=20
> > Here is a quote:
> >=20
> >   > This is an image for QEMU's emulated Canon A1100 Arm machine:
> >   > Play 2048 in the Barebox firmware environment.
>=20
> Hey nice :)
>=20
> >=20
> > The bad news.
> >=20
> > Current master branch barebox for Canon A1100 does not work under qemu,
> > barebox v2017.02.0 was used for qemu advent.
> >=20
> > Thomas Huth reported the problem in the qemu-devel mailing
> > list two months ago. Please see https://www.mail-archive.com/qemu-devel=
@nongnu.org/msg571887.html
> > for details.
> >=20
> > The commit a43e2bbc468a71 breaks barebox for Canon A1100:
> >=20
> >   > commit a43e2bbc468a71fb8825e8acafb7fac7ad7c6dad
> >   > Author: Sascha Hauer <s.hauer@pengutronix.de>
> >   > Date:   Wed Mar 7 10:04:07 2018 +0100
> >   >
> >   >    ARM: return positive offset in get_runtime_offset()
> >=20
> > Any suggestion?
>=20
> Yes, try again with a recent barebox. There was a bug in this commit that
> should be fixed with the following:
>
> | commit 0230365df6601cd561c9e3e368c96222076ec9f5
> | Author: Sascha Hauer <s.hauer@pengutronix.de>
> | Date:   Wed Dec 12 08:55:31 2018 +0100
> |=20
> |     ARM: fix setup_c when runtime offset is !=3D 0
> |    =20
> |     The runtime offset has to be added to the memcpy source address and
> |     substracted from the return address. This should have been changed =
in
> |     a43e2bbc46 which changed from returning the negative runtime offset
> |     into changing the positive runtime offset. Instead a43e2bbc46 only
> |     changed a zero substraction ("subs r4, r0, #0") into a zero addition
> |     ("adds r4, r0, #0") which was used as a equal to zero test and chan=
ged
> |     nothing. This part is reverted here.
> |    =20
> |     Fixes wrong copy / return locations when setup_c is called with
> |     different runtime and link addresses.
> |    =20
> |     fixes: a43e2bbc46 ("ARM: return positive offset in get_runtime_offs=
et()")
> |    =20
> |     Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Thanks for noting!

I have just tested recent master branch barebox with qemu-3.1.0 from Debian=
 unstable.
It works!

Here is the log:

$ qemu-system-arm --version
QEMU emulator version 3.1.0 (Debian 1:3.1+dfsg-2)
Copyright (c) 2003-2018 Fabrice Bellard and the QEMU Project developers
$ qemu-system-arm -M canon-a1100 -display none -serial stdio -bios barebox.=
canon-a1100.bin
Switch to console [cs0]


barebox 2018.12.0-00140-g64fc4ac1b5 #1 Fri Jan 4 13:36:42 MSK 2019


Board: Canon PowerShot A1100 IS
digic-gpio c0220000.gpio.of: probed gpiochip-1 with base 0
cfi_flash f8000000.flash@f8000000.of: found cfi flash at 0xf8000000, size 4=
 MiB
malloc space: 0x00100000 -> 0x002fffff (size 2 MiB)
running /env/bin/init...
/env/bin/init not found
canon-a1100 > /


--=20
Best regards,
=A0 Antony Pavlov
