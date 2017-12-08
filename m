Received: by 10.223.159.74 with SMTP id f10csp519294wrg;
        Fri, 8 Dec 2017 03:49:39 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYus82GwXH4A0MyS3LutK+VuyhtVAb2jXpopB6VnfBqKcgoqBnWR4N7etJaEo3Oi+ZST9xI
X-Received: by 10.37.59.2 with SMTP id i2mr19512834yba.489.1512733779477;
        Fri, 08 Dec 2017 03:49:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512733779; cv=none;
        d=google.com; s=arc-20160816;
        b=nySp2ttbr3fAR1qQjQxaxZLmnPbKH2KTMNqyxyDPyuolkUsaaFHOeQgVDp9AJGKxQZ
         tcToTEGTaMBwmPg8Xe8D1adEhwki/aU88CAl5pDXg6v22RzrC1PxFIvH4cNzhWRfSxQp
         CIYFlY64DYVreRW7ZVn3IweMZcLvmCuY3wLL2fLQi3cuhjRQPMhgQJDl50EhK301v7jE
         DeHAPgNkXMyNhzsy+qCa50NAI1o3FZcDg7gDCT1br+CjZgy+jwkerqI/aWK/79iFeHCL
         8hfH9fmlRKXdamAGaxUCxiCOlhsP4fAXkpQxHQeNBcUc/SdWrwgBaIeGok5O9hMSm+/l
         4qcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=i34iCx8wVKW3DpP/aSf7ZG+3YcW+HIk2RckyVWswt4M=;
        b=ga8NULJoAEOTsl7l1A73joA7mhogq0w/r5+8aw1CObqPIA4lUruifArFO0K+yXUPI2
         0rUECO5xWKAA0na7LeJ0MuqsnOcobxTJTTMSihtzRrKoAO2QgWJM0J2QJvH/1ZA5BoJ+
         Fvjz1UkHmjRAVVYIdZjmxwFDUeiQrj+C/pnjyqbdY9/avd7QNyEiHcFuMbR4gl3n0C6W
         6ec4ZMcl0CDe55OEPjK9tV26JaOuHnVa2q6580hzMTta1kdGeWKSNTamF2JswnVOUuOC
         MH1oQKdQhIP/6+FH1cPC35JmxB2FT30G6ATH9qsqpaBH7WLOHvtG3e/1zYtNViQeQAmC
         rPtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B8Y1zPu5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a65si1610352ybi.347.2017.12.08.03.49.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Dec 2017 03:49:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B8Y1zPu5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36705 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eNH9u-0002j3-V5
	for alex.bennee@linaro.org; Fri, 08 Dec 2017 06:49:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eNH9m-0002im-Ai
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 06:49:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eNH9l-0005DZ-DQ
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 06:49:30 -0500
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:46560)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eNH9l-0005DD-8M
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 06:49:29 -0500
Received: by mail-oi0-x243.google.com with SMTP id t81so7010718oih.13
	for <qemu-arm@nongnu.org>; Fri, 08 Dec 2017 03:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i34iCx8wVKW3DpP/aSf7ZG+3YcW+HIk2RckyVWswt4M=;
	b=B8Y1zPu5ABPWf0oYZND4kJTJDmI8Xt+CwS4tydS2cTUIR5LQYx5lu09eliFdHRobeO
	avCMhhZsdaW8mKZN/Qlk3PPWmmmUZDoRcxwIOG9AL8Cksv+SNwuoJ4NijS1orc14lwcT
	Yj+AxUqGyKP486aRD2IhW2+8nVBHq+3fAxUkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i34iCx8wVKW3DpP/aSf7ZG+3YcW+HIk2RckyVWswt4M=;
	b=Qladw4vLC0beqchr6l3YTsKWQbQ5X0YnrSVrxgZq+8ss+VCttLOPi1hL2gHAFvlZfB
	ImOfIaqZVD0c7KAQEIi1ZxhvcTymy3eI0MLK18yyjA/cz89M5bmxpE9USdzuVYizAcFl
	4B3+VC3G8CLaVCtiVXUjVeBvbixqxa9E80/NESFTyAeGPa3KEzlIcN7tR/CV5ginmwTK
	SoyqsNmItyRrEq1gr5intKxa11KLG6PL2kuO5l5ea28A2RHZjLBqtyzhlqlM7WRdyx1M
	BTpDotIzqZW10nYOCC54rM+pGh3jUNFa1EvMwojjQ2flZXwSSEU1sZCvQxfPXEvpiUCg
	e0aA==
X-Gm-Message-State: AJaThX523bxxPnGR9+88PEAwpFwDJ8J0Rndo0M0a2/J0bQp9S1MefMG0
	C1PMYbB9xeR03iLGXpCDgSov+zSp7q477h6j5Ep31A==
X-Received: by 10.202.199.134 with SMTP id x128mr25946088oif.63.1512733768274; 
	Fri, 08 Dec 2017 03:49:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Fri, 8 Dec 2017 03:49:07 -0800 (PST)
In-Reply-To: <CAHmME9qNnqYEbW_m8LG0E0HBKUE38YjUodbBihnSi2k0FrZJtw@mail.gmail.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
	<20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
	<CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
	<CAFEAcA8O6YyS1tSzaydckFpsqpb8HXgW5PJe-VTWud_5YGdW5A@mail.gmail.com>
	<CAHmME9pE79krWx-zD=VGiScT4c=4TZ1wVxYFiF3m+8wsx9Fqeg@mail.gmail.com>
	<CAFEAcA9XoeXDCQCmRBehntWSo0WGRBsaMDmC8QCqgU1K8jAF_A@mail.gmail.com>
	<CAHmME9qSJSPjANce_cWN6nm=qJsncfczgk7PoPa0xkOHmZjLUA@mail.gmail.com>
	<CAFEAcA-bKPNwJpcny=1azScO8bzHsi0Ou+m3rYPq-=v52Gf26g@mail.gmail.com>
	<CAHmME9qNnqYEbW_m8LG0E0HBKUE38YjUodbBihnSi2k0FrZJtw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Dec 2017 11:49:07 +0000
Message-ID: <CAFEAcA-5F2GMx9UNoH=LJAa-m1DXg2HW8PJZ47kurjx5x3NhWA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
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
X-TUID: Ek5RfDyL3DR0

On 26 October 2017 at 18:31, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Thu, Oct 26, 2017 at 6:41 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Those are primarily about migration compatibility -- you should
>> be able to live migrate a guest from QEMU 2.6's virt-2.6 machine to
>> QEMU 2.7's virt-2.6 machine. That's a stricter requirement than
>> the compatibility we want to keep for non-versioned machines,
>> where generally we don't want to break command lines but are OK
>> to make changes if they don't break those existing uses.
>>
>> Command lines get baked into all sorts of scripts and so they're
>> effectively part of QEMU's "ABI". People don't like it when we
>> break their previously working flows :-)
>
> Fair enough. So in that case, secure=no means serials 1-4 are for
> kernel. With secure=yes, serials 1,3-5 are for kernel, with serial 2
> being for trustzone. Seems like that's the best of all worlds.

Now that the 2.11 release is mostly out of the way, I've been
working through some of my other todo list items so I've
come back to this thread.

My suggestion is that we should add a second non-secure UART
to the virt board, so if you're using secure=no then you
get serial 1 and 2, and for secure=yes serial 1 is the first
NS uart, serial 2 is the secure uart and serial 3 is the
2nd NS uart. (I don't really want to add a 4th uart unless
there's some good reason to -- maybe we would turn out to
want it for the secure side, for instance.)

I'll probably write a patch for this next week, unless you
want to do it.

thanks
-- PMM
