Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp147637lfc;
        Mon, 2 Dec 2019 08:16:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqzDncFrOenWOjB/tQKz3zvBVL6UDw1wNPyeehHyu/LsQQ8UlXCkd4EHVOA/EgRxkzbdAd0H
X-Received: by 2002:ac8:2770:: with SMTP id h45mr33526qth.21.1575303362242;
        Mon, 02 Dec 2019 08:16:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575303362; cv=none;
        d=google.com; s=arc-20160816;
        b=Enjh3XX4wN+BoN1vXsiNBlIerchzcFagNQX9Bwh8dp7NO4jynxueF19ppEEbdrBlVb
         i4fIWjQ8MKflRf/BON0+Snfw06io9MXid90XwnIgk3OMlCQYrthsO3JIoP74EU2RQzu3
         7pLhExivkjvMD5rVZ0vLtBGA0CqV+aOE00YL7lHlFU99BdMwvF1KWSutnM17VfFty6Qh
         VvMnMBSkB+kwxIqYjJ2yr3StXvUsbrMnLksE8nHTqrBEwBvgOcGatapWd14HS80ksq00
         juHxs7VMRBC2yG7iG6MIuiglESXHlo//jAQgjfnaKj6/HuNZlpj5Y7stVC2LQYPwEThH
         GcIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2AOcNssktF6gqXIaJlj3n809rn2H9KnsBb75pdyNby8=;
        b=d5PiU+P0woDBFkfpA6ESIr7VtYvZuupJO/YSHjLWUDbjwBy9d6y4VL6t6+dKTatM9s
         4OapY1WjF/puB5KpdILJ4CahXLACAE1v8Eo0ecIXtzbgsmXeoM8VQ2Meg9ZCyUZ1xOYp
         DrZO33bws5y5ygBYEVYJ2LvUAXwLlG8uePP76ChFuF492IzI/57bQjWJe34+mUPDHwl1
         KJXwylEceJxHBtF182CNHJ8QDTwck2SLmCpQQ22sl2HP8dtoB+gYRWyxAyvYU72HgtYr
         5WpvJG9A95stePyH+dPS0o4m+F0jd7SThXFbOSB2rbqmmbzEz88IdoVCmTwPw0lmBqTr
         c/tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ocOh/xxR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n63si6617620qtd.217.2019.12.02.08.16.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 08:16:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ocOh/xxR";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iboMj-0005Ox-1F
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 11:16:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54081)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iboMT-0005NB-QT
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 11:15:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iboMR-000751-LZ
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 11:15:45 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40766)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iboMR-00074e-Fj
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 11:15:43 -0500
Received: by mail-ot1-x344.google.com with SMTP id i15so2164599oto.7
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2019 08:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2AOcNssktF6gqXIaJlj3n809rn2H9KnsBb75pdyNby8=;
 b=ocOh/xxRNzw6zKBgd02/XoLOKsbxhHZ5tT8Ut+vEoZPVBs+ZEXOVhITid5vNQCTnRP
 xNtYagt0E3VAlYf+ZMZ3rSUtBZpq74xQK9qZYMDC7uP5f8/zklCeSnIqmr1966DtQK2E
 o38GKC+euhBuz7F7Pb1qKmhaAz5F9FQN5CPyGUADiGGTNStNhNSfYGMrUWAs/sU7xadj
 SulcHUHvyRVGlhbhcIN0v3/VQGFQ1Rv/poXe4y8TgwJP5ACyGBaukoaRJr+WOgIKVGDK
 GK5BL4Du5S9/QuwhbOptqXCLnuR9vMS4zwr3yFBgm3dV87Ok9/sYBRha5zW4vtg2Hgcy
 GIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2AOcNssktF6gqXIaJlj3n809rn2H9KnsBb75pdyNby8=;
 b=WUw7q7EMu1UOj4iArLTGBj9EAmYzjlYeuHTca6Vjy1eFuDkdtXcVZ5CTq6yCYEQbEm
 BT6bH+jF8sLtXtdIRlUH3bQcj1UWtHtFuZulVkHCuqO98g8ggufHXSGQhRXqay2+agLP
 tbVqan6F2aOEH0mO8aCeTYqPllDnVBEEmjCE/hYv6eogp/cSHwBCiV7zRv4ngARsRQ/a
 g4tvPacWSpBXZVObWrvyHW09yGnDWXnwR1OYTock9da1+neM6gz6KaxEsWNwYevJoqKe
 ZFluh8T2uQuEHGiao9iXiip/TIkmEpc4jZ0ybJnj/f27NW7vkAh1ffIdYL6ycfSm88V4
 F72Q==
X-Gm-Message-State: APjAAAVAWMjRMrU63CIvmMvwmVokA3+JvNlgn0lvZIypQEITUbAgo0n5
 y45fuyvJtusG/pIl4NLeojtxje1Wsx+IM8W0FKvA3A==
X-Received: by 2002:a9d:6357:: with SMTP id y23mr22242219otk.91.1575303342083; 
 Mon, 02 Dec 2019 08:15:42 -0800 (PST)
MIME-Version: 1.0
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
In-Reply-To: <20190904125531.27545-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2019 16:15:30 +0000
Message-ID: <CAFEAcA98rt6nRDSrwk8XRbaBT67LZXvF=XEV13dtJBp4fPUscw@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] Clock framework API
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s5sUAQAV6Vya

On Wed, 4 Sep 2019 at 13:56, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> This series aims to add a way to model clock distribution in qemu. This allows
> to model the clock tree of a platform allowing us to inspect clock
> configuration and detect problems such as disabled clock or bad configured
> pll.
>
> The added clock api is very similar the the gpio api for devices. We can add
> input and output and connect them together.
>
> Very few changes since v5 in the core patches: we were waiting for multi phase
> ability to allow proper initialization of the clock tree. So this is almost a
> simple rebase on top of the current "Multi-phase reset mechanism" series.
> Based-on: <20190821163341.16309-1-damien.hedde@greensocs.com>

I've now gone through and given review comments on the patchset.
I don't think there was anything particularly major -- overall
I like the structure and API (and also the documentation!).

The one topic I think we could do with discussing is whether
a simple uint64_t giving the frequency of the clock in Hz is
the right representation. In particular in your patch 9 the
board has a clock frequency that's not a nice integer number
of Hz. I think Philippe also mentioned on irc some board where
the UART clock ends up at a weird frequency. Since the
representation of the frequency is baked into the migration
format it's going to be easier to get it right first rather
than trying to change it later.

So what should the representation be? Some random thoughts:

1) ptimer internally uses a 'period plus fraction' representation:
 int64_t period is the integer part of the period in nanoseconds,
 uint32_t period_frac is the fractional part of the period
(if you like you can think of this as "96-bit integer
period measured in units of one-2^32nd of a nanosecond").
However its only public interfaces for setting the frequency
are (a) set the frequency in Hz (uint32_t) or (b) set
the period in nanoseconds (int64_t); the period_frac part
is used to handle frequencies which don't work out to
a nice whole number of nanoseconds per cycle.

2) I hear that SystemC uses "value plus a time unit", with
the smallest unit being a picosecond. (I think SystemC
also lets you specify the duty cycle, but we definitely
don't want to get into that!)

3) QEMUTimers are basically just nanosecond timers

4) The MAME emulator seems to work with periods of
96-bit attoseconds (represented internally by a
32-bit count of seconds plus a 64-bit count of
attoseconds). One attosecond is 1e-18 seconds.

Does anybody else have experience with other modelling
or emulator technology and how it represents clocks ?

I feel we should at least be able to represent clocks
with the same accuracy that ptimer has.

thanks
-- PMM
