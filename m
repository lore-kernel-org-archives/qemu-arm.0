Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1930039wrp;
        Thu, 19 Sep 2019 21:36:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwgiReujQsTWwFkTjNuQMbs5b5sBbHn9tmJ1nK2C2kuio2rXhqV679L1fYff8I5W96MNO74
X-Received: by 2002:aed:3576:: with SMTP id b51mr1218084qte.378.1568954186353;
        Thu, 19 Sep 2019 21:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568954186; cv=none;
        d=google.com; s=arc-20160816;
        b=bAq7E0qqDKCl0Ro9a/QSnzNgEjNp0OS051xjbP/CJ3cd3+dTPWqwX00A6GI14G/9dB
         fkfu1Hs9rdVJrSzRiuQmW1hTa1dqG+GYUTROfuQN6wZiHtkYC6f9psEH6/TR3yRlHEfN
         W0ZlE0OZC9g2EqN9qOU58CfBG1+xl3AS7conlm5B0+fXLo8NnHaCRvgE43IvXoiGPRh+
         s/1chKUpmFbSKW2TKGRwjnmtPMG1076tUMgjgwn7yl4/DsE9G6xHrlOmiJpaxLf/icyO
         EvktEPJDU7UUNazvVJYc5B5cHNsXEZKSU2QkfTMJmswN5/cG6SuY0KutqSH/xMMAtGJO
         UxOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=P0HGbdxrmbTwLhsFf8fVFclc5uy3emLEDmnjj7AIK8M=;
        b=Dk8lIzdqPcjEfVHLx9x0Mo32OK8xdojKeqIUO9o+gZwlmf3RBVXQju3z3PfxFK0E26
         J8cusKno9w5pHR1kD1MGPbGwZgbdrQ/7UnHW/U8JRd7SxOM7jy/7ZyTARPQnBRku+uhS
         JRC1oEXfqpw4ZZIk2QLBZqP+YsOmOqGMrIF9ZpsLzBChPbl3LgZosrP8QKXo2KZy/8aW
         H5Y4CMu1V11ty+UCtas4g+Ppu824KpMlYzuNlpig4N1GtRv9pETxqFtq7aCpOlZM2hcd
         Fxi88aiyMVLi0TdBK2ugeikGkJnhvAunOXZPAtH6ag0tTbd3Db5ZiL3035F42QOCESw3
         3IQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=g2U9nS2V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si1001896qve.6.2019.09.19.21.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 21:36:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=g2U9nS2V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBAef-0008KX-N2
	for alex.bennee@linaro.org; Fri, 20 Sep 2019 00:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35123)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iBAeE-0008Jz-Rz
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:36:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iBAeD-00044d-Pm
 for qemu-arm@nongnu.org; Fri, 20 Sep 2019 00:35:58 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:45438)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iBAeC-00043y-3i; Fri, 20 Sep 2019 00:35:57 -0400
Received: by mail-qt1-x843.google.com with SMTP id c21so7141506qtj.12;
 Thu, 19 Sep 2019 21:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P0HGbdxrmbTwLhsFf8fVFclc5uy3emLEDmnjj7AIK8M=;
 b=g2U9nS2VednVRdiFMpV7J7Ba9Qm6fFmjdBb9Pp8+kg/7QygSNe+nebT3LpG21D7W0w
 RIz2h4Wkg/14fOFEOFcytNSGAMIt1Xg98RpKKtxA01dKKTpN8adLxBt0Qdfm355Qc1i2
 7cgR7IvyEfU+IX5O2Atw/qUyQn0mQCHWV5pno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P0HGbdxrmbTwLhsFf8fVFclc5uy3emLEDmnjj7AIK8M=;
 b=fFLoa1l69VW3c8TxbQ4rkyuApSI12Bhn1+ztTDE2qRx2p6joHJsEgrU4tKjX0UlCGW
 ONkhUJQj0Ez4/k9zMG9QIWy9K6k/jYmomW6YBlNfgyTUyfnHXI9tr+NUMGS/4+0x5f02
 cIr3mODB9mdzDg4HMaoBqXgldQTuTrDJgO3KJp7idLUN0iYh3hqvijw5E+7+s9COMDKu
 lxnSJr46w+/8jLJSiXjV+BGcblWbdAgJjROSkb+xH8iDrgFAnNOUAOGaL1XMIRHLyJfY
 MJSpm/HlEtRV/DxATf1GfttsVnB7zJsUe0ZY5YhhWbZHu5/JBabOA1r9dfJ13SARyFzi
 nVSg==
X-Gm-Message-State: APjAAAXhcZaclQ/7yGPnRpB+ZKGJAvZrz3sLJt/Tih2LzMWWtVOmxBUP
 +HgyynoiSkVHovh1qWKHLAMRrLkxrq6y3I5jiqM=
X-Received: by 2002:ac8:2d8b:: with SMTP id p11mr1218945qta.220.1568954154594; 
 Thu, 19 Sep 2019 21:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-18-clg@kaod.org>
In-Reply-To: <20190919055002.6729-18-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 20 Sep 2019 04:35:43 +0000
Message-ID: <CACPK8XffSK65RAc-kgbZrvxbr9cEF3uYEu6_tpN=9oDwrNgs-w@mail.gmail.com>
Subject: Re: [PATCH 17/21] aspeed/soc: Add AST2600 support
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
X-TUID: dTQ8YAXRppN7

On Thu, 19 Sep 2019 at 05:52, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Initial definitions for a simple machine using an AST2600 SoC (Cortex
> CPU).
>
> The Cortex CPU and its interrupt controller are too complex to handle
> in the common Aspeed SoC framework. We introduce a new Aspeed SoC
> class with instance_init and realize handlers to handle the differences
> with the AST2400 and the AST2500 SoCs. This will add extra work to
> keep in sync both models with future extensions but it makes the code
> clearer.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

One small addition below. If you don't resend I can do a follow up patch fo=
r it:

> +
> +static const int aspeed_soc_ast2600_irqmap[] =3D {

> +    [ASPEED_ETH1]      =3D 2,
> +    [ASPEED_ETH2]      =3D 3,

We need to add ETH3 and ETH4 here. They look like this:

    [ASPEED_ETH3]      =3D 32,
    [ASPEED_ETH4]      =3D 33,
