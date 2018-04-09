Received: by 10.28.71.155 with SMTP id m27csp2827956wmi;
        Mon, 9 Apr 2018 10:48:35 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49STB/XSCn19UF7lDZiCMQAu0vOdhJr3OPPEkS0KjxR4KUWAK6sq+8Ir0ZK3Di9x/cVaHBX
X-Received: by 10.237.58.131 with SMTP id o3mr26255629qte.4.1523296114942;
        Mon, 09 Apr 2018 10:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523296114; cv=none;
        d=google.com; s=arc-20160816;
        b=BWpj4EZJ7U6XHQd0KtlwlHxbPePbUjs9WARqCxeJdD8kfwr4DU834cbjZwx9DDmtFV
         z3V032LTBLmgslTJvaSPLrTaUk6w3iwBqy4mjMH55zPijGFDvtDXWfiy48AMYTqorLiM
         1gTxXtl179c0XCuZJxn6GEwWyF9Ye9xBIoZFCW8zMtpIBn6LOu8xZitGfozSJqnL9bt5
         +mZIbzfCG9SjWYJHdqiIBY1Bk2F5IA/iXkc32eh/m3VM2tIwZHlM5AuXB1gstz3fXKLk
         Q6zuFlJhGruhlknbc2nwui959aLz6yED5JpOqen6luGmlimSm+HMQwJVu95rtlEFDEZN
         752w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=S5pQrGkONxBJFQjUYYRCs9XaaxrBfwOmIgM1eU/dBJo=;
        b=VmSWVARowyYdXjtFcxd6Iyo3ekINdLoNjdhDHkY2CSo8qe2xwSB4xJpCrJChBLj2A0
         +cjxCG8Lnl+p7dWqpLrUVVe00BYqkD26pNXH3CSz4YL5EkgUXpaOxxLbAloy4sy7rJtJ
         9nhNp1/wpRvgHnO30svXq2kqmmj5QRpC8GexA9tv6gkXaeJTlK7L/7Ck6U2TOy8i5b/j
         QaSYdHGw1uDnr9MlgJQK6SeCLPhT5VSNtEirVz8PArxSHo/GhZQNnX09rrB6wWsbg9zC
         Pr6ROkxMQo2CyhKQq/rp3kH8Iju8Y8Udbc1hDIOokIEPtH5tysol3q6CLRjI2Ah3770A
         Suyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ShVs7P/x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g186si980529qkd.8.2018.04.09.10.48.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 10:48:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ShVs7P/x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55210 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5auA-0002JT-Dd
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 13:48:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5atu-0002Im-UT
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 13:48:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f5atu-0001vV-4W
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 13:48:18 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:45249)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f5att-0001v7-Vt
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 13:48:18 -0400
Received: by mail-oi0-x241.google.com with SMTP id 71-v6so8471893oie.12
	for <qemu-arm@nongnu.org>; Mon, 09 Apr 2018 10:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S5pQrGkONxBJFQjUYYRCs9XaaxrBfwOmIgM1eU/dBJo=;
	b=ShVs7P/x22Psf7mgPDHZEiyCWMVWeVysyZFH803Lt1OS+AFg1Lkk2rkSpvvs1d1nYE
	U1p2alEUDrZN+l5fZIADFCFS3B7nBPHGmtJdqRbMrR9DSukfAtBieN4wVRI9YxuN6uoK
	1jAP40gCF0msHMKBvjwCMQjBilFSzth3MrEpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S5pQrGkONxBJFQjUYYRCs9XaaxrBfwOmIgM1eU/dBJo=;
	b=Zq46UdZV4A0YXQ0xKkeLGn9FDGuY6SYqCjamsxvRD18hcw5EloCTac5AKF6kYA32oU
	lQkvkPAByGpOyF/9vgqOu0BXHm4v56qKlO6dQ1QCUmyNSD0/1oyu7smOR/WwVW2b3AJi
	w/GJ48LR46RB6eseqIc9/T5N0aYMhONHJR8mKqxkVhafm6xI5rJTPmydRu9E7tWwci0o
	syp6JwIvJYDzY4w0yECe9oXB+06l/LU4b8ROIeP5//Bx+7APrQpOGxDgMVIgX/+cI6it
	0M72pirUFsSvK5j8Kx/qaDUT9VFr67JQB+Z/P1xdcitqM6EVMsuhR4xrue2XC76Tzu2A
	W8Tw==
X-Gm-Message-State: ALQs6tDHroy82w57kJHaRy8wxfz+fm9tlqeCmW9oRWQJbAd0At07K73+
	BTbP5/D9ypWjNRx4F8SYHzogbMwyUjsf7bd81/kbDbz9
X-Received: by 2002:aca:d455:: with SMTP id
	l82-v6mr23722365oig.102.1523296097096; 
	Mon, 09 Apr 2018 10:48:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP;
	Mon, 9 Apr 2018 10:47:56 -0700 (PDT)
In-Reply-To: <CAHP4M8WUd9QKTCETaKNa+VQ6hMLcND8dfdDAZ3QutieDaE1WKQ@mail.gmail.com>
References: <CAHP4M8VVWyNqi4yLS3S0GXaDz3j8QvUiC=aoJ_DfZLtZBaFwqg@mail.gmail.com>
	<CAFEAcA9stTjg3Wpq5x_vj63jm1DrxAQREk4XPeFWb5rff-Uofg@mail.gmail.com>
	<CAHP4M8X-Dus1Z8UegDTaab5LvaiDAgQa8upsx_KdnPO+A-XoTQ@mail.gmail.com>
	<CAFEAcA_1X1AQ6j9pZQ8fEHmQCxRNK7EhGkohuLbTMpoPONe5PA@mail.gmail.com>
	<CAHP4M8WUd9QKTCETaKNa+VQ6hMLcND8dfdDAZ3QutieDaE1WKQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Apr 2018 18:47:56 +0100
Message-ID: <CAFEAcA_WOvTLnyOTWdO-PhoXsOWkUbayutxLr0jthowOfNgaVw@mail.gmail.com>
To: Ajay Garg <ajaygargnsit@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] Use of -machine when running via qemu-system-arm
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RgbuZLjj7oH+

On 9 April 2018 at 18:41, Ajay Garg <ajaygargnsit@gmail.com> wrote:
> Hi Peter.
>
> The link is pretty good, just that I am a complete noob.
>
> Maybe a more concrete example on the following, clearly specifying why
> things work on x86 without the need of -machine flag, will make things
> crystal clear :
>
> Because ARM systems differ so much and in fundamental ways, typically
> operating system or firmware images intended to run on one machine
> will not run at all on any other. This is often surprising for new
> users who are used to the x86 world where every system looks like a
> standard PC. (Once the kernel has booted, most userspace software
> cares much less about the detail of the hardware.)

For instance, on x86 you can always find the UART for serial
output at IO port 0x3f8, and it's always an 8250 or compatible.
On Arm, the memory address where the UART is will be likely
different for every board. And once you know the address of the
UART, each SoC likely may well have its own implementation,
which has different registers that do different things.
And there's no way to probe for what's there -- you have to
know in advance. So you can't even usefully print bootup
messages without knowing what you're running on.

thanks
-- PMM
