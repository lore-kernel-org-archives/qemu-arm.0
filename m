Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2736622wro;
        Mon, 5 Nov 2018 07:47:48 -0800 (PST)
X-Google-Smtp-Source: AJdET5cRo4xn+Rp+RfU2gD0R9D6b59LjiXfemwcHI31QpAfs+k+ydi8C0zkfGzUsB1THDZklJ7Gy
X-Received: by 2002:a37:24c9:: with SMTP id k70mr20986183qkk.281.1541432868251;
        Mon, 05 Nov 2018 07:47:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541432868; cv=none;
        d=google.com; s=arc-20160816;
        b=fQJzOt2Tmsy/aW5PaPTb9NKi2SWp7eJbSuGPGSZeUQRvnEp8Uh6a/X3rAKkH3WGgRw
         vHuSQVOimdzwzGGfTaK/KB2yRF/wutGzMotpGEdHy5MOBRC0X59IIfZwLqr29qY38kOx
         N1sRJC2vhVgU9M0CwQ6miFqwL1jHJ/DOoINiQTj/1xyATwXWJn/ntTiObvknDv8t8PBL
         nCP3VW+pIxgpj2VzOn+JwaXfh9tXiECJWE6wo1sDzZ6vLJO57vGg7823kUsR0XWlNDdE
         A9YOryGHyEYvvzrAQrER0XZH/p/p1j5asljKw9gLXiy/m2r6szzJMvUkreP99e/LaasB
         wBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=NLqmKq9Aym/Y5yhC2Vfs486vRQQ32SpPk2rluXbjY0M=;
        b=bGRS4T8gChKOKltsNLu8+0Z6z0kCPUjo7rh7lQvaP3NqrLufAoCQ1F3yNL0EYG3Two
         bQtO/mVvN6t7O4bL2gYQa18D35ZH5palnsPuqNEGiM/dZuZQ1O5+uqG86+k16qnzdMxR
         5Oaf2gN1CcAH+CRUHybc5Tgjt2oWEPAMxtoHCt44puz8w0AqqPRCehA/PRSK55nUmuoL
         sHDDU/Q4R0G4h2zqtrZiY+6ZzlUNA+k6I0ZsWV6ZvoN8NfFamBT9NiCX2vySJ0Qtn/Iy
         k/8RtrOiUwchvkqpQqlrEoZmlil8Q1Hzomi7bPHFP62v2m3lX3TTMre29n5fiwQCUZOG
         XLGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wxh7t7eC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a13si1013365qtp.35.2018.11.05.07.47.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 07:47:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Wxh7t7eC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJh6R-0004z1-4B
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 10:47:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJh5u-0004G0-V3
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:47:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJgzG-0003gW-AU
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:40:26 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43413)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJgzD-0003Vq-I3
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:40:19 -0500
Received: by mail-ot1-x344.google.com with SMTP id k9so8319398otl.10
	for <qemu-arm@nongnu.org>; Mon, 05 Nov 2018 07:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NLqmKq9Aym/Y5yhC2Vfs486vRQQ32SpPk2rluXbjY0M=;
	b=Wxh7t7eCqwcq6hDYYJ8ssX92ZumqkwwDtSLF1Q/C0jfUeuJoGyyxuI6DpAcds6Udlp
	7Ud7PXGTmgcFpWqOrvVZ6jlAZvb//uSJ5parvs+Cygwlm/dI7nqS2rcekEOYyc3DUkZy
	DCxvbbIg2O88yftnJrFSDxLEp9qnj0PzckNzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NLqmKq9Aym/Y5yhC2Vfs486vRQQ32SpPk2rluXbjY0M=;
	b=pU+rWbATLM3nAZ+qJqRoNJZvuoU3WSriu8yruFOW87kHz/w3o7x6Ec7cczfs/ElkGR
	7kcxBtAvpccNDTxIfycVIWt023mtcmZPHNdLKuoIcS7otFSskRia/JQkzJWELX4Jlixp
	icBlIAfq4QPrx+xQNSr7xduHYnGb3eoSNImdrUohA2qck+107a5NjYoZZICwb2xThTQk
	K6Lyb6oEobQv6fyJ7hk7a38B69UaPqyTrut67PjOjn1F8w7UZvw03Md3ZCK7KCmzKoUu
	9gn0sem+Z5FKVG6VlxUYgMFw1C3catXdkZmRUU39BabcZaA5ekKZUIiHfaiYVJ0YRdbd
	5Ehg==
X-Gm-Message-State: AGRZ1gJAVy/Ouo+dCgsaC4BYRs7gxQP+L4FuPcOolOG+BKpR7LZ15XI7
	sNrRgcqgdBGPAawocPJYRdAQgN+JumHwA4KXy7T2UQ==
X-Received: by 2002:a9d:582e:: with SMTP id r46mr9058118oth.238.1541432416464; 
	Mon, 05 Nov 2018 07:40:16 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Mon, 5 Nov 2018 07:39:55 -0800 (PST)
In-Reply-To: <20181102001303.32640-5-f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
	<20181102001303.32640-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 15:39:55 +0000
Message-ID: <CAFEAcA_QcFwahwXYi-GCGdbdsOO+e7gExQbYNYWzL2V6274bdA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH for 3.2 v2 4/7] hw/arm/bcm2835: Rename some
 definitions
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XM7/hYPn81Up

On 2 November 2018 at 00:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> The UART1 is part of the AUX peripheral,
> the PCM_CLOCK (yet unimplemented) is part of the CPRMAN.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/bcm2835_peripherals.c    | 2 +-
>  include/hw/arm/raspi_platform.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
