Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp680354wrq;
        Fri, 15 Jun 2018 03:36:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJq5SHlme0dVBkmKwdP6h5uMXIINjCo4vgvxWm5Xi7FDVemHcJcEottJ0tdMuI1zy4lvuhJ
X-Received: by 2002:a0c:b2ca:: with SMTP id d10-v6mr842372qvf.16.1529058960044;
        Fri, 15 Jun 2018 03:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529058960; cv=none;
        d=google.com; s=arc-20160816;
        b=JSj3rGSmu5beA8tkLqWz38RFX1l3vZ/N8s7GBHAbG9RYNx6lMT06VoDBCPfYXKNRR8
         lc9e4Q8mY6LEfOwB989qmARPax2+QkXLs/9xKBY54pUfJwbJxTkL0a7hI8G2b6PjdJtq
         sfKbRS0CsRxDHWcSoq5mQfp4WcG3zqibL+QZ2NaV009t/8WAOryJM7p6gbEBnDrmfuwF
         C4V02N202l/90sYbEvLG6ej28M3Dvh24nzr8XqlvxKbkDBxUGL894jSVwNjC6cy3koaQ
         BaD4sx0VNtWDdyXXc+jgFnLSJ344pGoZB601rnzjLmqsrb3cv6cWovBI0awTa5SencJO
         LLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=F4uBFim3WKMdlu5kMoCrPeeUELJZ+EnorbUcMGRibBo=;
        b=OO0G1yPjOKWkESxsE/LNiXmx6c92N4qpDSontpEPnb9MQDxmTyx+cAueaSsaAQGu7X
         CSXLTavtT8S2BuDTMCngs3Y/p/Tb1UgL2XiCNcVtyhJ7rtZDJCc4xdh5uzR0E0sFeDuK
         k+0tCAyYKtALoOPpkvDGByup5Fe5mXOH2bEvmYkUD9uWeqfTfC8JtVzl/Yj7I3kkOWJM
         21BHgsOjYcEDksZlt6KpXTRFBC9Fp6OyiAabuD+SkXAKDJS+FOV1VlV89H4/1MYxbVS8
         nz+f/ChoZH0T9zcF++Sy8eVhZlohjVZ1p/84Ro0HT420EqBxFkxT1Ir+KeWCGQUGJhe+
         2mkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Iw48Y7kI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m31-v6si5175635qva.9.2018.06.15.03.35.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 03:36:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Iw48Y7kI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45728 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTm5H-0006qJ-JP
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 06:35:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTm55-0006o4-K5
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 06:35:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTm54-0006ID-Ag
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 06:35:47 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:32900)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fTm54-0006GT-5O
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 06:35:46 -0400
Received: by mail-ot0-x244.google.com with SMTP id h6-v6so10495779otj.0
	for <qemu-arm@nongnu.org>; Fri, 15 Jun 2018 03:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=F4uBFim3WKMdlu5kMoCrPeeUELJZ+EnorbUcMGRibBo=;
	b=Iw48Y7kIqTIQ5J6Y3fB0g1M8pns2D7klMbPbHDaVBXFd7BxX6aBvHtVpFrBrDkwtiX
	igmCPbQYmm3tL+hnA6Lq+ixnUxKtQlQUldD4BeN4+FcJa7CFbAkFIvGoiFf4AnQr6LBk
	L9RPzercs3jw2kSkoZxvSdgCWck5SAvqFoZ/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=F4uBFim3WKMdlu5kMoCrPeeUELJZ+EnorbUcMGRibBo=;
	b=WxRPsQyAnQ74cNtMUeBTCwPPRn6wdDgqMrSeJhr6xWZx9S115cNMkVWPHHv5mRe7Dz
	2iaDfe419oiMA/2lkIPKlhrro4MkSTFz+tRPnkKuNBYmxpDOVg+b2tIhOnpfTsqjRI5L
	exoHnfu8eiAH7ggeBd77fpV5g6VJ+7gp9VwIBNl65tjC1ZOdU9ugiqoJjng3rxUhvXNn
	ofglyEcg1vqj2E/InyfD5stvZrftwraPpQqIxqEEvRhtHbkhRFa7Mjebs8rX7zilCf+b
	OjCBPgquKEtY0DqymKgeB3zKf4vi41Xx8JLQQyr0ngnt+qNjiV4NMaYptH82x29ROFQa
	kp/A==
X-Gm-Message-State: APt69E1kRqmYUozIpNCJX+C5BicmyP8CmEPOohve9U0LZs50/i87Ww1t
	g6n6/FyZNPaVpi64oR6ucZ0ePOAlgQHdPIzpm3xv/Q==
X-Received: by 2002:a9d:1a0b:: with SMTP id
	a11-v6mr561641ote.205.1529058945366; 
	Fri, 15 Jun 2018 03:35:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 03:35:25
	-0700 (PDT)
In-Reply-To: <20180613114836.9265-1-joel@jms.id.au>
References: <20180613114836.9265-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 11:35:25 +0100
Message-ID: <CAFEAcA9zpvd2Ztmc9pAiSkv3g1m3H=udqtek2gv0oA+2dvFZtQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v4] aspeed_scu: Implement RNG register
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
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +b2dwn4D/8BE

On 13 June 2018 at 12:48, Joel Stanley <joel@jms.id.au> wrote:
> The ASPEED SoCs contain a single register that returns random data when
> read. This models that register so that guests can use it.
>
> The random number data register has a corresponding control register,
> however it returns data regardless of the state of the enabled bit, so
> the model follows this behaviour.
>
> When the qcrypto call fails we exit as the guest uses the random number
> device to feed it's entropy pool, which is used for cryptographic
> purposes.
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---



Applied to target-arm.next, thanks.

-- PMM
