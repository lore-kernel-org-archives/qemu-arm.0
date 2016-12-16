Received: by 10.25.205.13 with SMTP id d13csp691650lfg;
        Fri, 16 Dec 2016 05:38:06 -0800 (PST)
X-Received: by 10.237.53.119 with SMTP id b52mr3035663qte.74.1481895486325;
        Fri, 16 Dec 2016 05:38:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b55si3163229qta.277.2016.12.16.05.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Dec 2016 05:38:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@dgtlrift-com.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHsi3-0002kB-Je
	for alex.bennee@linaro.org; Fri, 16 Dec 2016 08:38:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1cHshy-0002gb-7O
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 08:37:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1cHsht-0005by-8j
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 08:37:58 -0500
Received: from mail-yb0-x242.google.com ([2607:f8b0:4002:c09::242]:33701)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jhanley@dgtlrift.com>)
	id 1cHsht-0005al-30
	for qemu-arm@nongnu.org; Fri, 16 Dec 2016 08:37:53 -0500
Received: by mail-yb0-x242.google.com with SMTP id v78so4881332ybe.0
	for <qemu-arm@nongnu.org>; Fri, 16 Dec 2016 05:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dgtlrift-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=zveVIvuvk2L9LK0yZomf+J5+SxGx1h9+CwU5zIcULOs=;
	b=HYcOLbc5rSfVnqWriWqC7bZZBB3rTJSMlO40DtkL+c7nnkC+vTDRFs7xpHTGCx2F/N
	ty0R4OxJL56je10/9qpk/SLk5mD5kKh4sdFAfbZS/ZQedQr3+YEWyjlpjpfMZG+vKJ0r
	pm++Yv1KRM/KPEAKALigEHim+GNSkrcFpJC8YN8v+e3CajhWeaY/aPD76adOHL9SvBZQ
	ET3dRmIK9eeWsh3TYZJEvrjGISNLU6VLMjVjBfBJzZoKI4H55U+NExjfb2VjYikHyqaN
	Fic//huB3bpixQ1Jz69m6jkSgMiKlECOeLp1atsbbOjzzSKTeDpy/xuU90V6c4QhQKxH
	CpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=zveVIvuvk2L9LK0yZomf+J5+SxGx1h9+CwU5zIcULOs=;
	b=Mguizc1ndmj0ZfXibaNd6AP1LZPPueYhRZEMYW8JS0wFktQAwmxWd4+XZVqN1Jpz/R
	abADxr5wGNeF+8CwmlMaEsqUT6Q0rlH83/teN5DHnuSjc7TdqmXNmyoRjFHKgyOcC7lp
	66EsPKhreyAvmwO7/v7LSZ1mp0hQqXbQrqDqYYW3xMzi75E4qnBuIEO4xDaluTpZja/1
	k5g4ISia39SR7nWOP7d/a7VxBW2Sta6QYlZwT6OQcNfNJHOgH8PxvzuU+vijPtciulTN
	Rhxev6qcqhmVCmnG3EcrQeJAr2OG7a+eX9hr8Z+ng5ZUFxycfcdSzQe9hpKm9tvUSzBS
	IokQ==
X-Gm-Message-State: AIkVDXLN4dxtb8TmNauupiaOZRnURPCorTUNCMaH7hRdAT8ZRvMikZKfrCoG/503tLN3Ww==
X-Received: by 10.37.47.85 with SMTP id v82mr2316577ybv.96.1481895470741;
	Fri, 16 Dec 2016 05:37:50 -0800 (PST)
Received: from [10.1.216.219] ([148.80.255.216])
	by smtp.gmail.com with ESMTPSA id
	c203sm2255219ywa.42.2016.12.16.05.37.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Dec 2016 05:37:50 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (1.0)
From: James Hanley <jhanley@dgtlrift.com>
X-Mailer: iPhone Mail (14C92)
In-Reply-To: <CAJy91CZtQuBMs_r19miomuZE76ktyY=3cADSBotqhUstpZZ4aA@mail.gmail.com>
Date: Fri, 16 Dec 2016 08:37:50 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <CDC758AB-D8BE-451B-A55D-648417211588@dgtlrift.com>
References: <CAJy91CZtQuBMs_r19miomuZE76ktyY=3cADSBotqhUstpZZ4aA@mail.gmail.com>
To: Jiahuan Zhang <jiahuanzhang90@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c09::242
Subject: Re: [Qemu-arm] Emulation AT91sam9261
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
X-TUID: OKHFxVDqGOJX

I'm working on emulation of the ATSAM4C series - the peripherals should be t=
he same, but the ram bus will obviously be different, but I'm a long way fro=
m this being prime time.

You could try pinging an FAE at Atmel/Microchip to see if they can assist yo=
u.

-Jim

> On Dec 16, 2016, at 7:20 AM, Jiahuan Zhang <jiahuanzhang90@gmail.com> wrot=
e:
>=20
> Dear All,
>=20
> This is my first email to you.
>=20
> I am a student doing an internship about emulating a board based on the mi=
croprocessor AT91SAM9261. I chose QEMU to be the software emulator since it d=
evelops quickly, emulates fast, and is open.
>=20
> The emulation is very hard since no existing device emulation in QEMU can b=
e reused to emulate atmel boards. Only the processor, ARM926EJ-S, is availab=
le.=20
>=20
> I am looking for people also working on the emulation of atmel boards. I n=
eed the company badly. We can discuss and you can undersand my specific prob=
lems.
>=20
> Best regards,
> Jiahuan
