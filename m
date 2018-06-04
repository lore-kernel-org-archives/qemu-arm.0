Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp885028wrq;
        Mon, 4 Jun 2018 10:44:05 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLPq3GuEfqM+8wM83PuTSGpkEawVhFip409zKt7BSa9ueSo0Zl/runy6w306mjhztF1ll3P
X-Received: by 2002:ac8:31d9:: with SMTP id i25-v6mr20588484qte.247.1528134245557;
        Mon, 04 Jun 2018 10:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528134245; cv=none;
        d=google.com; s=arc-20160816;
        b=Z7ihMO2LKI/yXURx1pnVplNB1EeNUAo1DL8/uU5LNA1bpxFW2SSWrmPx5kDU7d/VYB
         etKA878em0WRTU5phY23imQ1aGrvesVD0veTCLT0cobNgSUyrxI1yXpTbL95tKBRmZXN
         K4ag4Hbsj8eO4seA//0aiwSquEU4CMKLgH4wJiL58gxy4OR/9Jb6ypjMjnxgJhDKEOcA
         26qyt5XmmKHs5lUho4nhsyHIydSwmOpEjyhVBBQZSNY1bCK8FIfhGUpY8aDHTS4/CVgo
         aH3eSfWMZvrnt0vKvOE556waIvqPknyeOHKYC15olujdaXOtTj90bSewXYwU+8hB4gTE
         /vuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=d2cP1ee3fx2GWlZnVkXC/rABsCATnjmaU5PUucsetgs=;
        b=elCFBkC6avkMR85089ry8PlKCOpFwqTzvEbezCryqjD8kK2o1Q5PtVIrmHuz0s/7/S
         9KSk+e38OdcbsxiOt77vG49gMG7m5iCQAH+gJ3t/8qd04hdEwYAJUAj+IBGWd7pjRaDc
         Oo3nbXm/CJ4UO1p1f15EBJxH1mPYDa9xYwJb6d85kbIXekQQsV+1TykfMLZ+qdPqDdxB
         y8XEUxDR1SIgmhoNCgUknOLwk4h1h9GqqyWaQWhjozr/J3W/irX29UH4WFiP/f6QzyKX
         7BdGMWUv9R7gJlMJVsO5h+7fKEc15E1FalsmxIv1vn1ikv2KUfa/qU9Rk28lySz5tuER
         7ISQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JQCZDWBe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v26-v6si6271293qtk.351.2018.06.04.10.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 10:44:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JQCZDWBe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPtWX-0002XU-4m
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 13:44:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPtWD-0002WJ-IE
	for qemu-devel@nongnu.org; Mon, 04 Jun 2018 13:43:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPtWC-0003AY-Ql
	for qemu-devel@nongnu.org; Mon, 04 Jun 2018 13:43:45 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:41646)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fPtWC-00039c-C4
	for qemu-devel@nongnu.org; Mon, 04 Jun 2018 13:43:44 -0400
Received: by mail-oi0-x243.google.com with SMTP id a141-v6so5292815oii.8
	for <qemu-devel@nongnu.org>; Mon, 04 Jun 2018 10:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=d2cP1ee3fx2GWlZnVkXC/rABsCATnjmaU5PUucsetgs=;
	b=JQCZDWBeUFHVatPQzA6199WyBwkaE84vp1h4eD1/+rm7nPevQOSCq92ZKqimM+m5Oz
	qtJpCsgIWsZbfcVLLmB+uVHaW0qbAq0d21nAmIl2W11+pZcslO+S+p334gnVCk2PQJn1
	bgPQ8xN60tRfOQJ7bli/bYXiIbLe5St6ToXaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=d2cP1ee3fx2GWlZnVkXC/rABsCATnjmaU5PUucsetgs=;
	b=C0SnN19fruu3HoTXjU5HLqNloGy7v/NjUjuy1JqGc6Gpr+2FW9QqORZYUQ/iI42GHy
	d99agVu6/aJgXnZbUQcNTr7yOMupFdBz+3BB3gcFbuD/P9ec0ZjJIRi2zx/A4GMY9naY
	wWJGvanGU+hUQ4y+IwRXVs4z6hT82WEXlTIx2N8poZrUR0TvMwGFzgI3oMUjvZrbrijC
	IQuegPayJbpCT9f21TgIDoghdaPxoWBBKeznZdbr9wsQ5JW8pMXFJF/DMlRNU1Ujwy5C
	k058brdWJe0kI+DSvii536PXIIlgYiSlgc2lfO+4U0ZI7yWikDuAeHPX4Ez4m9g5R5u4
	A/+g==
X-Gm-Message-State: ALKqPweLSee3XtwwtcQPuva04sGTY3tyw3gs4qruoyHv03vaW1Uvfg56
	DEEalRwqI4jjJCssAt9DvpI2IDpQbjSxqIy/KNJdQg==
X-Received: by 2002:aca:a846:: with SMTP id
	r67-v6mr12580617oie.12.1528134223662; 
	Mon, 04 Jun 2018 10:43:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 10:43:23 -0700 (PDT)
In-Reply-To: <20180530064049.27976-1-clg@kaod.org>
References: <20180530064049.27976-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jun 2018 18:43:23 +0100
Message-ID: <CAFEAcA9B5sW35+LX=_fCWF8SOODJNNZD1dx-XTAUQHg=86w+ig@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH v7 0/7] aspeed: add a witherspoon-bmc
 machine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ueuRfBh2lRYt

On 30 May 2018 at 07:40, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello
>
> This series adds a new Aspeed machine to emulate the BMC of a
> Witherspoon system. It also extends the other Aspeed machines with I2C
> devices and adds a simple model for the pca9552 LED blinker present on
> the Witherspoon board.
>
> Thanks,
>
> C.



Applied to target-arm.next, thanks.

-- PMM
