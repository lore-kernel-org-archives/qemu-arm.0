Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1836718wrq;
        Thu, 7 Jun 2018 01:55:14 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJG674/ZRwISqgorH7kMsLslg4guB219uhI96boMqfs1ueVbzM6fNAJESKPB88rlL6cUh7C
X-Received: by 2002:a37:1bc9:: with SMTP id m70-v6mr697268qkh.152.1528361714413;
        Thu, 07 Jun 2018 01:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528361714; cv=none;
        d=google.com; s=arc-20160816;
        b=CS+Kj6ZktVb1BqocXxAxd/bVh/WF9FXTIW8BG3coJDj2vbL6MGLLkrTy9YXcIWcpq1
         h8dwfOdtIKnWvGUzge/z4Pcx9a2+ICzHT8MObYsz2tMCofClMMUsbr5K7SEXHR2pXxLP
         DOjDhYgD1nLQdkP5SlQZxdcEGH1HwIdUlgIwOC2UdFkZsRHth5rZ2MTrIBj3xToAYGrR
         mSF3zZovYrp/f3PpIxeAcOmyz9qnNFR/1vfe8hpaxieyXaymiXqIt2EKEvcC1cslU/hY
         L58A25/w9dTxst0oJxG/3J8nEYmxLvNdREFpQuDLVDSvvMDXGNO/8exf3LvZti+52GuR
         N9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=4TLJAAxvAdi/8eVjyqgUuZrwwke9NS+6vbOtM9lFflY=;
        b=Wc6h6ZDH2Ap5ie1KYWOx+cb5CSJgMo/Q12Tak/Fdj9kdm/qubeLty5/YCjWWD5yZ4e
         bDBMpmWvD25fD9jr9me/cgpWMw46Suk11l+EZkifXvpmNdOwkqkl8qADE1/foEBacyxP
         Cw5Kc6ZA9aNvFkp6iTJx8reMRDYYGP6aPZVxouxcQtORkPs7a1VHUQestt8bOymQAeIv
         3d6go/l084gQNyFu2yMpCniYM0jMVIcUKWpf/hK9/dN9LPlmFyHXqj9Ih7VOG8vfHN6q
         F6JV4/PzC4JZ98uCDCBrUxuJaU9nZyCZEYan2b/QpERT54ymfROZL6K/7K3HLHbG0QwE
         qylg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G5FR8d1H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x20-v6si1033qkx.316.2018.06.07.01.55.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 01:55:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G5FR8d1H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56416 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQqhN-0004Z0-O6
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 04:55:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQqh8-0004Rf-Bt
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 04:55:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQqh7-0006KU-NH
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 04:54:58 -0400
Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b]:44902)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fQqh7-0006K7-Ha
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 04:54:57 -0400
Received: by mail-oi0-x22b.google.com with SMTP id c128-v6so7884362oig.11
	for <qemu-arm@nongnu.org>; Thu, 07 Jun 2018 01:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4TLJAAxvAdi/8eVjyqgUuZrwwke9NS+6vbOtM9lFflY=;
	b=G5FR8d1Ht60LRGFkdyH0q9DTjza7Nleb7vNi1c+oGuHTMfJPji/VREXJXA1Bo+wMHM
	xFWCRkBzjcGatbZVYJiH1gEUEOOttGzF5YxYR+pCGbizlWzhABInEalnZMaB2Kpo8hqT
	zMA4GO4GpYZd9rWx3Hi73m9T3Y9xjViSB5UjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4TLJAAxvAdi/8eVjyqgUuZrwwke9NS+6vbOtM9lFflY=;
	b=E9HtJJIfy1i4O8njB4YAMTX4yNZZ+rTdt8Ua5E0Ycs5w9GhwEHHlUBOlCrmx5nBEQc
	F7+/JpY+Ra0Q5J2bqhAGJxyGXkHySJcMXtIpOd3TkWtrHg08hh3oZyPiaLG5IBmeBpLY
	FXV6lo8Xojq3MM4LKHNubj3dG35X9rurLqufiSSUSJLWc7EMMUcab5KvVQir2trz5w3O
	1+qAguY1CTUk6CVmanI7Q1PYGHxoUEJzqTCjCO9AVZGPXyQtRgFuVYM5PMD+HQDqtNvG
	NddDDIXhlS0xNkyAXDG/89s5Bzhju1wZH3PrWjyBUYnfsWpozTMlwGavR86P7lzqd7Zt
	68DA==
X-Gm-Message-State: APt69E06dadZJouaq9/qlDQEs1FZYIVzdhK+g/U8jpcQvEJingO9MXKl
	qDKmf6/Us6y8Q6aLzIRLB/b5x0COPDJ6EYteNRbCQQ==
X-Received: by 2002:aca:f141:: with SMTP id p62-v6mr458609oih.80.1528361696789;
	Thu, 07 Jun 2018 01:54:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 01:54:36 -0700 (PDT)
In-Reply-To: <20180530180120.13355-18-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jun 2018 09:54:36 +0100
Message-ID: <CAFEAcA_vvK2M3LZ9vdcbDX5qFfeRAnbAnSoyWencVAXygJq1rQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22b
Subject: Re: [Qemu-arm] [PATCH v3b 17/18] target/arm: Implement SVE Integer
 Wide Immediate - Unpredicated Group
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
X-TUID: lru8/0HN8P71

On 30 May 2018 at 19:01, Richard Henderson <richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  25 +++++++
>  target/arm/sve_helper.c    |  41 +++++++++++
>  target/arm/translate-sve.c | 144 +++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  26 +++++++
>  4 files changed, 236 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
