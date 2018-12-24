Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3919508wrt;
        Mon, 24 Dec 2018 06:48:48 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7j3JBjOgKVT9D7jy0y5Ya//Z7bFSHPzcvENSM1n4oWC01JVQav3X5ty5c8tOW4ZytvRYq3
X-Received: by 2002:aed:32a5:: with SMTP id z34mr9717179qtd.311.1545662928343;
        Mon, 24 Dec 2018 06:48:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545662928; cv=none;
        d=google.com; s=arc-20160816;
        b=OPRuE0fSu3aNvXomeLQOpLf3TZJqCnnq7Oavt+Zt0duFvlL3xWu5Og+BTU1qp1PTyq
         NNzcYwHU6ajPAZkATVzNZWdL1ydvv8/1r+VOxQohZj5fDU8nbuKBgNtSNbNnv214AwWx
         hMLRj7frX5dfoOiUwNb8NUyWJL1lOlSc64yhq/MHZMmO+TJ454lzUGnuRq1ttByTzTd1
         bU8bI69SMFw8uuOkX8jxb8Uoa+pw7WfjzeCQ9eh1m/vcqZYWnVlh9B4SGsacQB/slRe7
         YmswFO76YQCeQdgooKplxRdqQ9IVBj1ORPebz/X1eWcdrTX9AkJYSYPctiOCzA2CkMou
         jPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=C6XEM44f2Y5kD5nTMeYD9JBGcbaOjEiXg7HEuPzrdLM=;
        b=Ajv/gna9P57m8oubnbLC8OZ+PQT1i2plXXGFUIm0Trm9NC6FJDNpsglvJCWzCSqVZr
         +jqdqQu983t97/ZOo9asoI2rA7eVAwXjOvLcQKpPWy3HekEZz48/b9oS/+3Nu+fJKkSj
         ed/MDp7USXIMB+64GHeiDGO0Eckm7qF0BdVyZhY+zeWN3qOGYOanUjK3YRNaY8KyyWCd
         K71e2unDnKUIWxnFavrmhy/rJKXxPattu1BCQsiiJeFKzkwJ5VWA9+JVu/PgyXTVynjd
         ZYHPMZhlETv51DPR/AVC2YCXuODP7jj6snXGYeI+rJMU1eBHG4BKqMlWD84dDU6hk5oK
         i6ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NdZna0Vq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id k3si4206837qvh.178.2018.12.24.06.48.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Dec 2018 06:48:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NdZna0Vq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gbRXD-00021M-TG
	for alex.bennee@linaro.org; Mon, 24 Dec 2018 09:48:47 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gbRX6-000213-Ny
	for qemu-arm@nongnu.org; Mon, 24 Dec 2018 09:48:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gbRX5-0006Jv-SK
	for qemu-arm@nongnu.org; Mon, 24 Dec 2018 09:48:40 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:32810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gbRX5-0006IV-NQ
	for qemu-arm@nongnu.org; Mon, 24 Dec 2018 09:48:39 -0500
Received: by mail-oi1-x22d.google.com with SMTP id c206so10087517oib.0
	for <qemu-arm@nongnu.org>; Mon, 24 Dec 2018 06:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=C6XEM44f2Y5kD5nTMeYD9JBGcbaOjEiXg7HEuPzrdLM=;
	b=NdZna0VqJ4H+yo0cHmCJkjlWViNV2HPy5VXd9jwBzhWDGToBEbCi0jZsTqn8Ammi7z
	q2aquggP8p2IO3u8B3wCWJTDqY3hwjQKdGcY3oFnVy3PkQTGwiHgc7eOGOQryb+oLF1x
	3QbA5YlGN8Wo1xW1inikHS50yyTt5QfD8gUPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=C6XEM44f2Y5kD5nTMeYD9JBGcbaOjEiXg7HEuPzrdLM=;
	b=q69WzpOfEsMEExHhBzZUchr63Ay+G9XvZYJtrpWLPfQYou2J5FBZzUCpMTqLn3/Jxt
	OFGDQPSBapI/OQ0cx2igOMku+F9q9dgfaUxsCvmb4js2mo2J4y0PgQdg0MR4w56vI0LU
	gtl1j1c6FxJrtTn9S7m/KxuccKBxVNGAS60DF/4A+Dpc9EXdiDk+0U0FW6a8pYTEp8tP
	VML0H4OwwPE3fypBrrw4bMAjSpk6XRZeWE8rEx8aXn0P2b7C9F2JtcxZdrXebIoHdkSR
	k+pKd9dt6ALSgO9uJLh3TWBOLhai6n/Cw2MeOVJ0UoKaMMRyreLWg/I9BCfGL+B1pQru
	G7Sg==
X-Gm-Message-State: AA+aEWZ8iYGRGQEoKCHq979iDeP6Nf2BAiVPD0+3gMuMKXHBT78FkZL1
	abwvvMJVZzWuMhGTWbHozm5WGap5vYPxLpsV8Nql5Q==
X-Received: by 2002:aca:5c05:: with SMTP id q5mr7852184oib.146.1545662919034; 
	Mon, 24 Dec 2018 06:48:39 -0800 (PST)
MIME-Version: 1.0
References: <CAC-7+Cg5EX1qb11kwRprSE8_E2SMtEm1Cgh0OzFMCuiBhh+3BQ@mail.gmail.com>
In-Reply-To: <CAC-7+Cg5EX1qb11kwRprSE8_E2SMtEm1Cgh0OzFMCuiBhh+3BQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Dec 2018 14:48:27 +0000
Message-ID: <CAFEAcA8qqzPxwYmjGG1Y940RFyuf0AccNy+N51HODnoKEuYSfQ@mail.gmail.com>
To: =?UTF-8?B?0KHRgtCw0L3QuNGB0LvQsNCyINCi0YPQvNCw0YHQvtCy?=
	<stast.3vium@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22d
Subject: Re: [Qemu-arm] Run Kernel+rootfs for ARM Cortex-A72 on QEMU
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
X-TUID: 0+MQYhs0rmtS

On Mon, 24 Dec 2018 at 14:17, =D0=A1=D1=82=D0=B0=D0=BD=D0=B8=D1=81=D0=BB=D0=
=B0=D0=B2 =D0=A2=D1=83=D0=BC=D0=B0=D1=81=D0=BE=D0=B2 <stast.3vium@gmail.com=
> wrote:
>
> Hello, dear developers. I use Yocto to build Kernel and rootfs for ARM Co=
rtex-A72. Kernel and rootfs are in separate files The kernel has an Image t=
ype (extension .bin). Rootfs has ext4 type(extension .ext4). I did not find=
 this processor in the support list in QEMU 3.1.0 Dec 11th 2018. But this p=
rocessor is on the support list in QEMU 3.1.0-rc3, but I could not run the =
kernel and rootfs.
> Is there any possibility to run QUEMU for this processor?

cortex-a72 is supported in 3.1.0. What are you doing that
makes you think that it is not ?

More important than the CPU type, you should make sure
that the kernel and rootfs that you have built are for
the correct board model (you probably want to be using
the "virt" board). The differences between board
models are much more important than the differences
between different 64-bit Arm CPU types.

thanks
-- PMM
