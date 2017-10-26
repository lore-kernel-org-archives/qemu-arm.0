Received: by 10.223.161.27 with SMTP id o27csp780047wro;
        Thu, 26 Oct 2017 07:36:46 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Tmsx4bUbmPSYI8qC+OJvzJShAirep3JqZKkD3ItJ9rFbSVw6VpZ01ZobmwKnDpPlvaPhdz
X-Received: by 10.37.170.113 with SMTP id s104mr1189410ybi.66.1509028606542;
        Thu, 26 Oct 2017 07:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509028606; cv=none;
        d=google.com; s=arc-20160816;
        b=GwamvsftPvjfj3fw3PHUxklwj/OzHqv76Vh3iiUuOXVAjynft4norGh6doHFGebMYD
         5MQES8oh/nxSM5QYebs5yM6hbJNyjiCP8kGR+g0Hq7ER8SvveJ1eXObUyVvWOzId5DH0
         v1G2sqcPi4/Bwu1gOWRGSiHyKo5EvXO8azk1Yiwb1HVroYyodC1dhdA63aJsXiQRsZ9y
         HOeqXoYTdbzxJ26nF47ENx5sE7zZ0NUW9oYx1dehGI9hmtjKlJvRagNV2YrFSD+OUo2a
         gu2NZ5eh9e5ESsRRSexJ4Xd9sPTRg/sPPIyo4gO0piCjgXjcT1UcZ2WsXEy8Jg8m/nVm
         U4lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=C2icBD95VSE0AkV/yv+bqJ83vktnQw4oNTXhuQkrhsQ=;
        b=epm/sebYs2x29dyh4C/Lp5Jz+TXm3nSRyV4/tJS/QcR9S2B7tCJ3DwlCrqVzR2PenC
         rhnEaHqQTFwjqjD9A/OukI5EB1SnTPAwpwnHLviOHvv9O6Q0TsWuiB8motr7C5GYzb3i
         +mkqUgEsX+IU6P8Hj3QIdSCnsucoZfiKkPSM70Ir78L3cSonUijsNVOxO3rbZVt28SvF
         Ry1qAv5n7HhOQyV+y8xEODVJF8ZLW89yhWw6cXlwTM30jRZbvw6Exp9lR1WK++zYDtoY
         R0T+DUd5uwcEhybPkXnh70pSRSql+zf3Ba5SYGTSrxpqgBstANsXsvf7EiT6wSe19td2
         UFbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fY4uQTy1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d6si813780ybd.570.2017.10.26.07.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Oct 2017 07:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fY4uQTy1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7jH4-0005XD-0m
	for alex.bennee@linaro.org; Thu, 26 Oct 2017 10:36:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e7jGp-0005V8-3v
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 10:36:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e7jGm-0006Ng-HV
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 10:36:29 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:46443)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e7jGm-0006Mt-AA
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 10:36:28 -0400
Received: by mail-wm0-x244.google.com with SMTP id m72so8442436wmc.1
	for <qemu-arm@nongnu.org>; Thu, 26 Oct 2017 07:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C2icBD95VSE0AkV/yv+bqJ83vktnQw4oNTXhuQkrhsQ=;
	b=fY4uQTy1my9lFBK+cFol52txssro7V+RgAKAHYWV6jIbnNLVHEGsGnKdD+Tm0+3IuC
	Uw6o2aKChOF6shBETSl8YHdeN+yZ9UPP9Ozhd7RojyeJcDDI1orGjbQQeWTVSPsyk0H8
	/l4o0rExX8bCcX/3keru7qF7wXB0Xf7gmUdYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C2icBD95VSE0AkV/yv+bqJ83vktnQw4oNTXhuQkrhsQ=;
	b=K+SUZtAxk35PnKFHalEKL8DBgs+oYSmfqg3/hR8r5SsPUkzUz6cLeviKmzq57wn6dz
	2qpSIZTQNhq/0YXcxESPxHXTt1FTWyAPcD269eTLkJ1kO7aTjhhDtoHAydN3u8IhqErR
	Jyu6ChWoBD+mNRVdRJ/5vcxu9EqQJ4tbFjwfDwtFNPmc5ZSFsHak4PmAlSZfJRnkGTqg
	BmNNrnSnV75ZmHAIljsbFGFX9l12xcE0ftqEO2lgbpBrkANMYUkmsADqDpVIczAR3orI
	7pxf0u4p3pLZDJ19BX1b5ehIALVy5oRm6hZU5ev4ajFtouyToXAFcVPIYOtaQfp57Ewl
	PzOg==
X-Gm-Message-State: AMCzsaX28D0RxyJsD/2sjIX0laXgop9JPijjoHSgG+eIxhTMMbFEq54M
	+s7gX9+xVllkck9NuJAr+VT+RV/qfkbp+Yj0AJdLWQ==
X-Received: by 10.28.92.136 with SMTP id q130mr1693085wmb.35.1509028587128;
	Thu, 26 Oct 2017 07:36:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 26 Oct 2017 07:36:06 -0700 (PDT)
In-Reply-To: <CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
	<20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
	<CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Oct 2017 15:36:06 +0100
Message-ID: <CAFEAcA8O6YyS1tSzaydckFpsqpb8HXgW5PJe-VTWud_5YGdW5A@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: support 4 serial
 ports
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9zFSgOLUPNrV

On 26 October 2017 at 15:13, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> The problem with this approach is that then different architectures
> need different fancy options, which makes things a hassle. With the
> old guarantee of each machine providing four serial ports

This has *never* been guaranteed or indeed true. It's just happened
to be true for the x86 PC machine and perhaps for some others that
you've been using. For instance, the MIPS boston board only has
one uart. highbank has one. integratorcp has 2. The microblaze
boards only have one uart. And so on. In cases where we're
modelling real hardware, if the real board only has one UART
then we're only going to provide one UART, so in some cases you
just have to deal with that and have some way in your communication
protocol to multiplex across a single communications channel.

> Could we just do the simple patch of adding four pl011s in there?

I'm still thinking about this. (You definitely can't have four,
though, because we already have 2 in the trustzone-enabled
config, so we can only add another 2.)

thanks
-- PMM
