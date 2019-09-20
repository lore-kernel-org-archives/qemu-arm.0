Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1947163wrp;
        Thu, 19 Sep 2019 21:56:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyiiP/qb8uP3qc6Vh1lfLmeQFW6S6jf2Sx1vdFwjgu+bT/zV2Y4VfFL16TjnIl8Y/uzOIlx
X-Received: by 2002:ae9:d807:: with SMTP id u7mr1722188qkf.492.1568955396760;
        Thu, 19 Sep 2019 21:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568955396; cv=none;
        d=google.com; s=arc-20160816;
        b=PkajeUJ201BoMAFpFoKyMH/t5S27zfqqaUrB2ikyG9nAlIuMgDbHUSiQn712izEghj
         rEyegk2AL6Fyu6VqTnqJAPVp10Q6P/kHJojFEcpNdAJkFqT/48vhlfXJShfX0zpCcKlP
         Kx9RbVRWwnf1azmplzSkRT8SKEQ0JHem0Ief+7neux8wwiTf+ZGSFTEUuySO5VGXbu2U
         /4lV2xRNuf1caGLZZAI/AMaKuEYDiaGCK7gTBm46ySFOeJgq/IFiZuCkRxkESPXk6nLC
         v+5+34TMURQtMaOBjOisYbopVgzHJPZfT/C7EXagqyztHKdDAbZUGkFan9mG42xLtW+5
         lJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=SBXBgq7k+0blPWtx+vOMmXRogds3kQRYSgQ9OrBjYNQ=;
        b=hJwZPfQTDbf3Pf5TNyKKAnO2Kxk1N9qgzI7k61Rkbqcc/sKTuAPr+OC1Z4Ys65Rxpl
         XCs1TrEZyw3iF4efMOswvPwboBaprkbXx1WJF1p0c01irCkyQTm/s6tQDNAuoDx3u0hb
         +0+T2utsAZ+NKXd3FZwHJTh4lxZZ1ShQK4ptZkA49200Sue620GfYBWPslSjE9nF+mWN
         P1dLaPTGC6W18TathWpSv2y5MtHVQlcd8pqCtpi5UPcX24epZPXuP6B+Vlcmy8CL7WwD
         NvCNCzk03Mykg7ZOZ8CTcvgvfFWn2fob7MY9EXEgzedi80iLPwPGwdb6vuPrNmEw6yiH
         8PKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=g6U1VwNZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y66si1281146qke.145.2019.09.19.21.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 21:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=g6U1VwNZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBAyB-0007pD-Eu
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 00:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iBAwm-0006pC-50
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:55:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iBAmu-0006Py-Ie
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:44:57 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:43863)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iBAmu-0006Pa-De; Fri, 20 Sep 2019 00:44:56 -0400
Received: by mail-qt1-x843.google.com with SMTP id c3so7177069qtv.10;
 Thu, 19 Sep 2019 21:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SBXBgq7k+0blPWtx+vOMmXRogds3kQRYSgQ9OrBjYNQ=;
 b=g6U1VwNZEa9h+qMbypfUFpvOAET3injZXn2mcfW+RGIoAT7ths3m9cCeR521mRjjdG
 6WWuSV/gOEqa2guttePlG2MhAfjGoxcfb5WgyioLSwIPNQ2uyaYG2FHL7fRtXqatTkrc
 tSyoXCuOSbP8mvbObIOACUNc0PqPzZMMx8X6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SBXBgq7k+0blPWtx+vOMmXRogds3kQRYSgQ9OrBjYNQ=;
 b=jtlgfCjh2HcoZ3uD4tEFZchXPFNugE/AqU80+pe+DMf35hXgHURImTmEGD2glMkiGm
 0i89nGY+kNFsMtD9NH0t9rZOoVJAusUDa8y+scr9G/ZLF5eVntCXraszqWPMMF5VUHN0
 P2WCtreNw8VFuc50k0vlT7hpEO3/kr45vUsz4F1DfLS0sFLVOQdfitO0b2YFihHJHHfS
 796b4nWmo5ZUpNNWS/9nDk2i1HR8Qy4Ks9/oVxiYbJ9mnUfZJGh2GF6A2nzp9ehwQjVo
 gyltL9xluEkSa1Q6zqDuodQaQyfoZce4bmnkpIyFVmXAnE2sk1iIK2N3lovUT1OHJRdY
 XM1Q==
X-Gm-Message-State: APjAAAVSBR7S/nNeiLBkWIHH9KElvz+yuAohu0mgo5LizogpWGB4p6VR
 BbMuFJQ5yNiLNOiqVmT9Wa34q6mZyGV1C1Gk/SU=
X-Received: by 2002:aed:2ce7:: with SMTP id g94mr1197084qtd.255.1568954695792; 
 Thu, 19 Sep 2019 21:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-11-clg@kaod.org>
In-Reply-To: <20190919055002.6729-11-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Sep 2019 04:44:44 +0000
Message-ID: <CACPK8Xe3HNbHj76o+=hujNQFvdU418+xG-gWcmUi8ouh82DGnA@mail.gmail.com>
Subject: Re: [PATCH 10/21] watchdog/aspeed: Introduce an object class per SoC
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rw6ncqYyfS8x

On Thu, 19 Sep 2019 at 05:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> It cleanups the current models for the Aspeed AST2400 and AST2500 SoCs
> and prepares ground for future SoCs. It removes the need of the
> 'silicon_rev' property.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
