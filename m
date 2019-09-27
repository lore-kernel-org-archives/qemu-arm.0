Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3579856wrp;
        Fri, 27 Sep 2019 07:36:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwLlbjEL9FqTwgY6TU3+Q2nS5PA9X6gB/Tfa68JdJDkTp4y5CKvkLHZfv0+TTbn3v7AYOxR
X-Received: by 2002:a0c:b24c:: with SMTP id k12mr8070153qve.7.1569595009575;
        Fri, 27 Sep 2019 07:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569595009; cv=none;
        d=google.com; s=arc-20160816;
        b=vISCR7GjMrR/3Wo5ZW0Agq9qgO2pnjnAZ3jQCY/yhz76T0poUgH/haAKIMctpLFFNr
         Y1VPO+eFcfqVJe1g6uoUVAHf63NaFUSrGAqlGr11Fmjg9tQGW3oj/S7rljChvbb6r/mP
         YmwcoevfWXOHoIVLqqaQiPqwPjOpG2xIny6ad0zY+U3J1VO5iYbVh257SlpI50dNp9I8
         3Uui/p0VpsPogaz8PiO9Wb3BcxjtJtDir936Oxc5g2p/0fQk+unNGz2Ufo1rTyTNBAGZ
         UXomn56ORS6WyuoqAbzmcogSZ7aPHblPJj2NPLT7NopgoG/DOzUczrW+O4fNHkB9U4Td
         Ydiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=de4z7S5G5ywrflGEuHK1OtY+IITfylTTQb5PJNGEdBU=;
        b=lR2dfiq9ci0E8kKDAkaVsO4k8TUiqp1zjSI0+wK5B1IK7vdqoNc3dA5+RYOLAzmJ68
         fP/P9YpYSzhlrMeEiiCB6/lREX3sLrYCcpVd3Zzq+xyIdKj+mZ0oAxf1chC/yjEydZdX
         StNUu8se919oLSBkIS2jEc8Zz/ceAXiwvSMr8gQ2sztcd3CocqKMquuqRq+hvYnEKaGR
         c4qk6w+cn1hAM6OYbySmAjlGyLyjkkfByzuOmE1zYifStEyufLH1bW6FhyfWfn6xukWG
         aNIwqnhmc1gwqutBAe06D1TlCPFGy5kGCcpeOdjUIofcZO+G5afpdwDekcoNr48hSim6
         6Nqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lbeMf565;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si4813582qve.209.2019.09.27.07.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2019 07:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lbeMf565;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDrMW-0004Vc-2m
	for alex.bennee@linaro.org; Fri, 27 Sep 2019 10:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iDqQ5-0000D1-SM
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 09:36:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iDqQ4-0002WE-M2
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 09:36:25 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41866)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iDqQ4-0002Vk-G6
 for qemu-arm@nongnu.org; Fri, 27 Sep 2019 09:36:24 -0400
Received: by mail-oi1-x244.google.com with SMTP id w17so5192375oiw.8
 for <qemu-arm@nongnu.org>; Fri, 27 Sep 2019 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=de4z7S5G5ywrflGEuHK1OtY+IITfylTTQb5PJNGEdBU=;
 b=lbeMf565pLoufeNuekBKI9IMx2xyAR/3x6uARDrd7eVvc1NwmOsWqWHZorEpGiVwe5
 AcJXpmvG4ZjaDOEYfqAOE7oq2eWnJrfKnwjQ9xI7k+3mqJA+9aoWDvrriwcCgUlTw/XK
 Lpzz2mttxF9RtdeDgpKIBqeLknSoy85uzuD+R2y5Hg513AKnNPoHPFP43aKSnYIPm1mB
 hOVV+Fo3vPA5seKsJ3yXFmxKIItwZygumQqTY2MlhvIodTdJxpjJrZasNNeobAQ/X3B3
 J3Hd6RqzFT2UceRnYCFQvfgNt//8hrRkT6/yd4+htc4u5cNPQsGZvF9C4UQQc+C8NH+k
 vbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=de4z7S5G5ywrflGEuHK1OtY+IITfylTTQb5PJNGEdBU=;
 b=Ke0PiXXIcoxfJvZGZaXyUmmomN5HpcAqOCeOE8rV2/J+aalZ+qI/6qKWVzinYl4EPC
 3ze4WoP90npEKgSz6B3dgAirK3ZGN99RwqI/nk5FvBbTb4tD/OTbIhN/XWXrXr73CquA
 fiDZAQglon38opT0KXx+p25XM6aRXa+mrE4zzZunHb3YTwcWJWTdqlvJWy5ZEwiVHPZn
 CixdwfFXSXB+9u8hZCS/ZY4UijA7YMXvsyvoJHrgjOdYJA6vFu6XCGjbLkz4hCcRu65n
 pVhGi//kQnSqjXuMjuI3fDLklYGi7fwJQ6wjvmC/TzA/OPama/N+y+tsESdS6LYn0xQn
 LYdw==
X-Gm-Message-State: APjAAAXdoms68HHu3xeWHPXmAFgXVKba5uqnej7j2MuWJEsx3dSmWfu9
 zNDmpLsr6/1QZq2pjWzCguCXpLb0BCZZP6FE+tO/EQ==
X-Received: by 2002:aca:50d8:: with SMTP id e207mr6686737oib.48.1569591383575; 
 Fri, 27 Sep 2019 06:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-15-f4bug@amsat.org>
 <CADYoBw11iiK=+O-mGYS5Xp85zVhezOXXXr-wKV_xCg07ZYuzVw@mail.gmail.com>
 <20190927132602.GA19931@roeck-us.net>
In-Reply-To: <20190927132602.GA19931@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Sep 2019 14:36:12 +0100
Message-ID: <CAFEAcA8KcJzCNU1iLjiteEKhLsw9jeDyyqXurv0fuvSmLAEF0A@mail.gmail.com>
Subject: Re: [PATCH 14/19] python/qemu/machine: Allow to use other serial
 consoles than default
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Cheng Xiang <ext-cheng.xiang@here.com>, bzt <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kRqfMgq4oehk

On Fri, 27 Sep 2019 at 14:26, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Sep 27, 2019 at 02:54:10PM +0200, bzt wrote:
> > Hi,
> >
> > On 9/26/19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> > > Currently we are limited to use the first serial console available.
> >
> > I'm not so sure. Right now it works like this:
> >
> > qemu -serial stdio
> > Connects the VM's UART0 (PL011) serial console to the host terminal
> >
> > qemu -serial null -serial stdio
> > Connects the VM's UART1 (AUX) serial console to the host terminal
> >
> > I think this is simple and good, please don't remove this option. If
> > your commit does not influence these cli args, I'm not against it.
> >
> Agreed. I am using that mechanism (raspi3 uses the second console,
> not pl011) in my scripts. Please don't take it away.

This patch is changing our python infrastructure that invokes
QEMU, not QEMU itself. What Philippe's message means is
"currently our code for running QEMU as part of tests like
this is limited to using the first serial console; this doesn't
work for raspi because we want to use the second (aux) console;
so make the test infrastructure able to handle machines like this."

thanks
-- PMM
