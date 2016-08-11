Received: by 10.25.21.156 with SMTP id 28csp57638lfv;
        Thu, 11 Aug 2016 03:47:59 -0700 (PDT)
X-Received: by 10.55.217.82 with SMTP id u79mr10288195qki.244.1470912479346;
        Thu, 11 Aug 2016 03:47:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si1200701qkc.162.2016.08.11.03.47.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 03:47:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXnWo-0006Xw-Ot
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 06:47:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnWl-0006WR-FZ
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:47:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnWk-0005pd-JH
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:47:55 -0400
Received: from mail-ua0-x22e.google.com ([2607:f8b0:400c:c08::22e]:35234)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnWk-0005pR-Fh
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 06:47:54 -0400
Received: by mail-ua0-x22e.google.com with SMTP id n59so112357720uan.2
	for <qemu-arm@nongnu.org>; Thu, 11 Aug 2016 03:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2SsDfxai5fJh4ohfX8lmLXkkrf5U86GsNL08yBL12SM=;
	b=jYpzwRbPp4+vEEkaVurPgZi+YVL7GT7wMVbBIGvzK0iSCQ/7n4yUy3hI0KuWYmgflu
	83sA5hN9E3coNjVUhCi4yqQfiD6mPlSwZhriK7uiM6K/SwKYugGRhLv/8v/w66WNIB1L
	c0mXEBhXSdp19dTOJHzn+c2n2R4TVKiMovg28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2SsDfxai5fJh4ohfX8lmLXkkrf5U86GsNL08yBL12SM=;
	b=K9Ef6KeSA/w6kbw3/w54yp3Hxiomm2iBO9jDiqcglb+Ks2hGraoF5DrHak9ypoftOC
	Q8j+cUYmW79agmSk6Lf9Iel19sE5v+Zl8Z3j7zM/2TXbBr3kO6JoVRZZ3sk7UZGcwi7a
	gT6atVNXlA4jFnRNX1bHy+PvnA8VLVNwZBs0JFeGjrZvbML/XvoGRSt/md21RtT9TcHu
	WVakLORhkCnUIYuThSIvVe1u3tBF8xtCZ9Rnje9y+PW6+0HY5vCxqmrrYa//WpE0E4Qf
	x2PqIMiVQDFV61X6KJ9NLXTJbEsP/K0AVsnI3gUFvOOhsTGhjXL1YYUHWLRMy8ggx3sk
	+XZQ==
X-Gm-Message-State: AEkoouumNZQMQda6fsFHO/5WgMLy+bLdyfYqo0qmzqJP4r7O69WLmTtbb/QnuXhokFQm5JHFDhDHb/MxhTsiM0XE
X-Received: by 10.31.92.86 with SMTP id q83mr4244453vkb.92.1470912473705; Thu,
	11 Aug 2016 03:47:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.17 with HTTP; Thu, 11 Aug 2016 03:47:33 -0700 (PDT)
In-Reply-To: <1470158147-16378-1-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2016 11:47:33 +0100
Message-ID: <CAFEAcA_sa3eJx5WtZzkxYKsKkrT3OmyhXH46U+a7VaJJBdODwQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22e
Subject: Re: [Qemu-arm] [PATCH v3 00/10] arm: add ast2500 support
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tXdhatj5qMdw

On 2 August 2016 at 18:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>     On the AST2500, I am still having a little issue under uboot which
>     sets the vbar doing :
>
>         mcr     p15, 0, r0, c12, c0, 0  /* Set VBAR */
>
>     and this is trapped as an undefined instruction by qemu.
>
>     Looking at hw/arm/helper.c, the VBAR register seems to be defined
>     only for feature ARM_FEATURE_V7 (v7_cp_reginfo). The AST2500 SoC
>     uses a arm1176 which defines ARM_FEATURE_EL3 which gives us a
>     VBAR_EL3.  According to th specs, the arm1176jzf-s has a Vector
>     Base Address Register. So am I missing something in the board
>     definition or is uboot being too optimistic on the cpu features ?
>     This is confusing for me, some direction would be welcomed :)

This looks like a bug in helper.c -- we originally added the VBAR
definition as a bit of a hack since it's only supposed to exist
in CPUs with the security extensions and at the time we didn't
implement those at all. It should definitely exist in the 1176
too, so we should move the definition around somewhere so it does.
(The 1176 is the only non-v7 CPU with security extensions support,
which is why it got missed I suspect.)

thanks
-- PMM
