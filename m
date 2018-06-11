Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4088946wrq;
        Mon, 11 Jun 2018 07:05:36 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKUZcfZFB1ySaIOiez4Dj4D/xB+eftDoXjJ0mdLpxRhMRwz6x5ORIAV16T7btCgoIQeam/L
X-Received: by 2002:a0c:92f4:: with SMTP id c49-v6mr8759134qvc.101.1528725936200;
        Mon, 11 Jun 2018 07:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528725936; cv=none;
        d=google.com; s=arc-20160816;
        b=aIpt38uZ9DzBaBgJRI5OP4RaOQGxc0yRGOaI/7cFcwVkKIRugYJlEZEboX11VuKGFr
         iBRYwCGYRRs6DDl1OG5JmP8Le3m3J0ESS9QgxHXBH+Yb8lCEb0UR3Cy3hspSznqnykXX
         XUtZy6+62T5pt+/Ekdt1lgYwROGEj3yYD5EHFbUQ5NPnmkNBMGTLSoFRPcxalL0mtfVM
         ndOpVSWjKOkEetPKQfMKhOcIv3AA8rLYSmW2w42b5KWPgI/wiNVHwop5Gz3lfcjfx9MN
         j8SEi4IV4JQhrlgfhSjGRSn4xv8Y5jyc4iYNnxDqRglEvswpUQnCZgz59B+Y6220oaWS
         ULBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=c5gh7v6Qcn8BTmvQmZ3Y2WimhX/WPpE/01VE1cCoRsI=;
        b=ps3P9d1x66r+N23SgYQsOCC2R7YrY38GwJo0F2lFaCM0SCHmwPB2zh3uuDvjmrCxkV
         mG17XqLpKyIeyS/Bz/D7Uz+8oxJobk744Ey6oZUf/IKGDn28+irjPW7bSUMLCPyIaoRa
         BB4xK9xCwCvQZYhiR/yi0BYgLCpMR4YLOeHlt55rsrUj/kN7FORWHYzcQHH9Rr7jTHfv
         D5fORSRNmG8Ikykvu6EI5TexqZKl2y7kDj7eiYzxh1EM5wadj4Qy46gx4QxEFjHlCaeV
         02PeKIb2b06ba4slKmSi5qmdBtcek2mqieYdVF74ndmzl8wKHiZDGYmPMneS1nof9K7I
         RiUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MoRUdQMH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c6-v6si5877388qvo.55.2018.06.11.07.05.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 07:05:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MoRUdQMH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSNRv-0002Ax-O8
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 10:05:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSNRh-00029Y-Vy
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 10:05:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSNRh-00012A-22
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 10:05:21 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:41707)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fSNRg-00011f-Tq
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 10:05:20 -0400
Received: by mail-oi0-x242.google.com with SMTP id a141-v6so17953066oii.8
	for <qemu-arm@nongnu.org>; Mon, 11 Jun 2018 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c5gh7v6Qcn8BTmvQmZ3Y2WimhX/WPpE/01VE1cCoRsI=;
	b=MoRUdQMHs4Ze3RTlhstQiI4PHARJyPGb4HJ7yLiAelr7CnAMmiMHtLdrlux/T5rTDU
	rB/SWjYWsRWpbZN1Z6LEHYVcriOPnK0kvW1QTtDqzHFx/oNzQIfRpqPARZPDCcip/7fV
	N50IYepBNZUuVxF/nKJ8bnZboopH3rpSRYep4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c5gh7v6Qcn8BTmvQmZ3Y2WimhX/WPpE/01VE1cCoRsI=;
	b=ghHnCMvM2yqjfWPAwB8QILqkcFWRWRGlOgns0eY6BzPNuP/81ontfCx9pWJbCqURyj
	Gc9sZyWrhh2/iCB4mxlUV9PAJQFiXHRntN2qPTSnZelX0UNixxx+S9B+P8F82ai5KGYr
	lodM3lEvV8j5ZbCpD3truDNAHlxUmy2JSZ1URezCgNIwMx/zoE10umZlSiL1MT43cMDo
	mRC0DHF7A1XFxIBAgAEXdXubKQFL7B35PuYl/tVhIveeBbvXROUuqPE4pXZz8RZpktbU
	ipAMLsJXqLqGbBTS+Hr0bfAd/JZ0gN2bJ6Uq2tBUevH0tdKG7m1ytq+1ttvYl1iscZSs
	qhZQ==
X-Gm-Message-State: APt69E1bNz7Lok48cM0/LF5bikO2fHHPINmGfo1ajCZLYTs+SutInO1E
	P9VvFRYX389VBQUQoGf82B8M6gc7IPfUMup3LBXydpYe
X-Received: by 2002:aca:5383:: with SMTP id
	h125-v6mr8840495oib.252.1528725920174; 
	Mon, 11 Jun 2018 07:05:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 07:04:59
	-0700 (PDT)
In-Reply-To: <20180601144328.23817-1-peter.maydell@linaro.org>
References: <20180601144328.23817-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jun 2018 15:04:59 +0100
Message-ID: <CAFEAcA__A1a3xwdP+_6vzraNafTu3NPY+mj=5vhEAJpEcAY=3Q@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH 0/2] armv7m: Remove armv7m_init() function
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	"patches@linaro.org" <patches@linaro.org>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4q/n+jhnFL2h

Ping for code review?

thanks
-- PMM

On 1 June 2018 at 15:43, Peter Maydell <peter.maydell@linaro.org> wrote:
> The armv7m_init() function is a legacy from before we properly QOMified
> ARMv7M, and it has some flaws:
>
>  * it combines work that needs to be done by an SoC object (creating
>    and initializing the TYPE_ARMV7M object) with work that needs to
>    be done by the board model (setting the system up to load the ELF
>    file specified with -kernel)
>  * TYPE_ARMV7M creation failure is fatal, but an SoC object wants to
>    arrange to propagate the failure outward
>  * it uses allocate-and-create via qdev_create() whereas the current
>    preferred style for SoC objects is to do creation in-place
>
> This patchset fixes the only current caller (the stellaris board)
> to not use it, and then removes the function.
>
> New board and SoC models should do the two jobs this function
> was doing themselves, in the right places and with whatever their
> preferred style/error handling is.
>
> (I've cc'd the people working on the nRF51 SoC model, as a heads-up
> that they'll need to update their code so it compiles once this
> hits master.)
>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   stellaris: Stop using armv7m_init()
>   hw/arm/armv7m: Remove unused armv7m_init() function
>
>  include/hw/arm/arm.h |  8 ++------
>  hw/arm/armv7m.c      | 21 ---------------------
>  hw/arm/stellaris.c   | 12 ++++++++++--
>  3 files changed, 12 insertions(+), 29 deletions(-)
