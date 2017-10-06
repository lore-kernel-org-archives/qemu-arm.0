Received: by 10.223.197.9 with SMTP id q9csp1757010wrf;
        Fri, 6 Oct 2017 08:15:17 -0700 (PDT)
X-Received: by 10.55.154.146 with SMTP id c140mr27295698qke.131.1507302917426;
        Fri, 06 Oct 2017 08:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507302917; cv=none;
        d=google.com; s=arc-20160816;
        b=DJdy4hBmTvo33vCbv+closY2ZpsszdxjEFP5xI+m1R2dUwuKoekQBSdboAKlmKvDDg
         9OC4VnFBQIwZDnOTPYonWlidAEkxPqH+DN/ecMak/QfudGnShoqd1ku5xBQ7mwbGJq+8
         +upFLlFvewO1QZIp3DQHJiasDii1G+5k98pptfjpFOKtfsxYKQP2PMLSXqVRrdNpzwio
         VMWK1aFWZ6N7uyZKY+/JaFUrDZVGIfab7b/gozn66+TMPkTPY6xrGd4gE2uagyFC3bLv
         Qvq60c6gt8hTapHT82VzWKH+N3R82QJHpeuIORAxcJJWj/STURdledjIXfpn5HcxFJuA
         HUEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=QNOPe2B7IUQItxU5UtV36Cq19+TuouDWT/GncXywSqY=;
        b=e2jbhieaY40eBGaBuTItiRiPiZp+zB7SnTp7TuqnzkjaHLzwtb5r10xx/FvjfQ+b98
         gbo/uoacwf150R0eGIFx55EoDAhRaoWH0OTGHplvmyEVn81bXWXzjDAhUlIHoAr+JKGB
         jTtrrTlLPqsn/HammI38Acj7iGgbaDTioAHByk5rSpQLnp5PfuVQ+6zPeDkZVqZkIejG
         v5mZcfp3Wa5BlwNpQI1dI5SFzK5uSfiNo726OCHJc6uNiGOfmY7BE+xTMi/2fC+B6koD
         O/ly/RInSYyzh9xAD59kLWInEoqJdFZrShspY5zTjLWq4Ure4bbldZWbR/a5KbWiQ+sQ
         i1Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f2civAyO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i2si1393747qkf.196.2017.10.06.08.15.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 08:15:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f2civAyO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0ULM-000336-Vi
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 11:15:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0UKU-0002SK-62
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 11:14:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e0UKT-0006zk-CS
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 11:14:22 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:48322)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e0UKT-0006yX-5n
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 11:14:21 -0400
Received: by mail-wm0-x22b.google.com with SMTP id i124so8165060wmf.3
	for <qemu-arm@nongnu.org>; Fri, 06 Oct 2017 08:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=QNOPe2B7IUQItxU5UtV36Cq19+TuouDWT/GncXywSqY=;
	b=f2civAyOD5INLeMuWo3Axk2LFf2B84H0hW+z3wsEBi9Ri1uV9tnEmNEYB+6Rx9X/2W
	fpMbEJ02Q+cGu+nLX5qwR/j0R6Rhtw3ckqLMebaxm8/Vl0JzrEcaWPi/spAfruiuvgDd
	MiPLHWrij8xldUKVVF9U+qeW/DhfH5UZ8Jw4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=QNOPe2B7IUQItxU5UtV36Cq19+TuouDWT/GncXywSqY=;
	b=Sw2bfof18EMtzZJCTDD7LNGNZQsEWVse7oJriIPtGL7A7d46F+1JxwZTB7JLob2Wu+
	J/C0m1u79DaxiyZvHBMUqj5+ktSnAa9P9htCarJv2nAHFuh9hdxhnmo913jSDBw14S7+
	bbHrM8x3admBfOFDFgTw4MHAq57zWFM88/mDhQ/asMPN1V/Exf6gR+Y9VSfF7UEkcfIt
	cMKI0WqqDuLBP/shnrbXwJBK4RfY2d48XmBd2GYLDhxm4XY9I8a39/d4iy9BIkR7llDz
	piCubq8SYnmHtYtTpx6DY1tfljVPqye3hTVz84uo3Epra64SaHfT+ko77HCH4hwmyMR4
	VKRA==
X-Gm-Message-State: AMCzsaVD50q5J1y+x3B1iESpSXmof/O4Oz9PU189a4FamAiBQG7VY7bG
	sB5OgbL347yz/Z93/k3N7DSaMRHIiWyMF3DpLscGgw==
X-Google-Smtp-Source: AOwi7QB3sj4fGG7tu47V9EBOuBe7ZSis7cWHi4SEqpaQnsQ5RbeHh2L8PSlV0fvubWpdbesF8bs02u86+JQjWijAnfI=
X-Received: by 10.28.54.89 with SMTP id d86mr2004423wma.101.1507302860094;
	Fri, 06 Oct 2017 08:14:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Fri, 6 Oct 2017 08:13:59 -0700 (PDT)
In-Reply-To: <20170920070135.31379-1-clg@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Oct 2017 16:13:59 +0100
Message-ID: <CAFEAcA9Avqgbm7sZTKuex9dOp-1wzw0Moa8XVvXw5GZjSeC5Xw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-arm] [PATCH v2 0/6] aspeed: add a witherspoon-bmc machine
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fHks47lHS5PZ

On 20 September 2017 at 08:01, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> This series adds a new Aspeed machine to emulate the BMC of a
> Witherspoon system. It also extends the other Aspeed machines with I2C
> devices and adds a simple model for the pca9552 LED blinker present on
> the witherspoon board.
>
> Thanks,
>
> C.
>
> Changes since v1:
>
>  - introduced smbus_eeprom_init_one()
>
> C=C3=A9dric Le Goater (6):
>   aspeed: add support for the witherspoon-bmc board
>   aspeed: add an I2C RTC device to all machines
>   smbus: add a smbus_eeprom_init_one() routine
>   aspeed: Add EEPROM I2C devices
>   misc: add pca9552 LED blinker model
>   aspeed: add the pc9552 chips to the witherspoon machine

Hi -- I've made a couple of review comments and nothing else
leapt out as obviously wrong, but I'm hoping that somebody more
familiar with the aspeed devices will do review...

thanks
-- PMM
