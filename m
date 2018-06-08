Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp803972wrq;
        Fri, 8 Jun 2018 05:15:06 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLBTraRqW0rTRtsX0u4YUbPXDlgEjKneQd60jUkoSGA/iR7iu4rpiLk96tM1tlITZiEvYIU
X-Received: by 2002:ac8:2c37:: with SMTP id d52-v6mr5625105qta.108.1528460106078;
        Fri, 08 Jun 2018 05:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528460106; cv=none;
        d=google.com; s=arc-20160816;
        b=B5qIokhggiKZDVOAoNWp1geHj+qb+oF74DGyr1/i7zo7SH9uhwNrEeiU5Vqv1KVW0a
         Xvi6dru0XvHPWPCCnuBxX62yut3K1ZyyDVFnmwUuzrCbtpC90SYeC1ocX2BBkahSVmsz
         MatT9igxlp60n7Ex8jAU5yj2VrSMpSHOlt1J/7feRFaiLBpH5hP2mYFrN7lLVXB+CyuB
         E6m9o7ntCc3itbViQUhDG0HYLothLzkgAt5xTiOhrB7O9l7eYhALq4s4azO6h7VT/XCV
         eZhY95P7I7liIoZYsptp6maQ6iQ+hcythfQDRxq53YHrEYhluy7BEkuj8Hlb4y60dfbX
         RGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=KJgLRrfMExIAlM1a0qs1LvH/hpuvI0BMIJJjkp1Bwlo=;
        b=n4CA2Mp74aeL9gIkMBNwxJmqtk3+OjAoLzxax0748hXV+/ZZRhVZKCuSwJDh/QOx+C
         eEd8CQMCJ7Dy6xa2QgBfVNCmLb5nikSm4ntQD9d8FuSt701ExCtpQc69GrIwMotnAPh1
         Wo/CWQnuO61Mx9rEjRtenTugmGp/BGkGt5DOtaRVCHsMm4aOeIB3tZWIHF6BBE6vVlTB
         11ci+EU887pH3DduILFqo9CKD9RAa+rEmW2+OWcn47EoTGT+si6hbJm7MD9Em11djUBG
         FdAu6BepZYiaXGAmaGjMYDM9oN0AnYigIYCiljHd0JuFYOuRIYZTKlesbzmnYByJvbqH
         31JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kT2mXFJn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j3-v6si192998qkm.319.2018.06.08.05.15.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jun 2018 05:15:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kT2mXFJn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRGIL-0003Nh-Jz
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 08:15:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRGIB-0003M3-JE
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 08:14:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRGIA-0007vY-OP
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 08:14:55 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:37862)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fRGIA-0007uu-Ik
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 08:14:54 -0400
Received: by mail-oi0-x244.google.com with SMTP id l22-v6so11632133oib.4
	for <qemu-arm@nongnu.org>; Fri, 08 Jun 2018 05:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KJgLRrfMExIAlM1a0qs1LvH/hpuvI0BMIJJjkp1Bwlo=;
	b=kT2mXFJn6w9Bqybxjy8masD9h+YrX1LKLnmM5JrBrVSjxxWg++LXAJwO6CCETBiXmF
	UQkK7ZniTjM6wuZYrI32+MIaszYGZDQnY/ER9b7uszBt1bjR+YPjEnGm9GhGctDKOuWy
	ppXd4nkNZ9u6iqrt5Y6cweUKcyKAlFcYtXT3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KJgLRrfMExIAlM1a0qs1LvH/hpuvI0BMIJJjkp1Bwlo=;
	b=H2g94+7F12iYe/Yq7QfoharZ3yqfMfHhb70E9VYm4m8llY9/ogTgkKkJ7TFsGRsRa7
	ReSPSstziaSJKxOdSWzJYiPFJxG81Mtj9Ptwx2sYcVwLKcpHIjHz50P3KBesfIeKFyk4
	+jpUKqVQSMcHRKURxilSVnJPe4yk9Hq67y6bhlw0Ih51+EYR9MtxOpxqCr7dEhTckH6g
	ga6Yd5bUI/nqchqOiTvESC7SGfj7aVOlTe9XRiw8lFaPNTaeB6pwj+1FtHfPSALR/uCG
	7zWMCQQpdEl7FKaP9IIoKoSOev8ZnTgoyWTGi71ReGFBqAqsJkVi4IYCVukHpjR/bEXd
	SVcw==
X-Gm-Message-State: APt69E1j86iBs7wJQOx2h3FyCt9QoVGAFBcrALaPoyuRIVgxciw39Nau
	QvOaPB5Pl5xGxrq3jtBX+LXoWQW7p/HznwJsNkF5Ng==
X-Received: by 2002:aca:4384:: with SMTP id
	q126-v6mr2811747oia.164.1528460093878; 
	Fri, 08 Jun 2018 05:14:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Fri, 8 Jun 2018 05:14:33 -0700 (PDT)
In-Reply-To: <20180607180641.874-1-f4bug@amsat.org>
References: <20180607180641.874-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jun 2018 13:14:33 +0100
Message-ID: <CAFEAcA9N9XyQrU9Y1XmgLDU9viUB1+U8iQH5QguAkxzqop4piw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v2 0/7] sdcard: cleanup the SD_SPEC version
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paul Brook <paul@codesourcery.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vIgLf/6eos7t

On 7 June 2018 at 19:06, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> Since v2:
> - heavy documentation improvements
> - squashed previous 3+4 "add spec_version property default to v2" for ato=
micity
> - SSI/SD patch downgraded to RFC
> - added Alistair R-b tags

> Philippe Mathieu-Daud=C3=A9 (7):
>   sdcard: Update the Configuration Register (SCR) to Spec Version 1.10
>   sdcard: Allow commands valid in SPI mode
>   sdcard: Add a 'spec_version' property, default to Spec v2.00
>   sdcard: Disable SEND_IF_COND (CMD8) for Spec v1
>   sdcard: Reflect when the Spec v3 is supported in the Config Register (S=
CR)
>   sdcard: Disable CMD19/CMD23 for Spec v2
>   hw/sd/ssi-sd: Force cards connected in SPI mode to use Spec v1.10

Hi; I've applied patches 1-6 to target-arm.next. 7 I had a
question about.

thanks
-- PMM
