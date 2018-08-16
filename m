Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1811142wru;
        Thu, 16 Aug 2018 05:49:15 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyldJy4v7+Se5lZGS7nQXM1S2WMvW/E4yKDpNYOaztKuOizOd05cbc1hQzGdrg7nx1TCOCG
X-Received: by 2002:a37:c204:: with SMTP id i4-v6mr27249835qkm.438.1534423755086;
        Thu, 16 Aug 2018 05:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534423755; cv=none;
        d=google.com; s=arc-20160816;
        b=XjpQaZYOyJCJho1pVK1fzic4qgGWf6ZbQE1qgs6xSJ0TkB7EtMsTRB8Cnh6ea+HzIK
         TCWqUWDK/ynMRyMxakpURt0wEceqTTtfi6r0BrkWCqlQbkFr6wbByfTfDG0rk8W04oSG
         jM8Wgq9eDH8RW5q2QhXEv6ouoL6+fGKkZ06PrB3BFWeUBpBXMgHOmWWvi98lgh4+Q6VF
         ivCx4cx0jmymPYZDjkk4TWFyAGEAhW0dRtnnVrtLU8A6/BH7ac/DL3gexR2pAo1YamjH
         oaHgkoe9VlrM12zAFUciXyv891chMnA7/O/XRxSkJ7gH/mxcgei0zVgu5hNJu3QZWerZ
         WQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=WALXsGyWC3He2z7V8ENXvQN6F7PSWR3yhtTvwO6HVJE=;
        b=Zk+p6FdXtX2duE/YKJ9X4D9zFmewrEEfwssHuxG90fdvKK/XVCCbKI5Vgt/J5sIBoP
         bRzj+tUYnZXkEKoCzDaUQe8rfntc9wvcldCuUBl7awiQRKBEL4ByeekqBSOSHIIi0503
         h1NHK3MRAybmyEX4MXRwt6jEMyPLYotx5/WW6hlOG+J+vanGlKZVDnXO54uK/eoeNj7y
         JIEsmSRDcVMlcevYnrnRQH02xwJ7csVAidq1w7DL8S8aDf0XRDAT/5xo0Kg3eA4Ye1Qa
         ZTBJhj/bCUvcv/qCzZenwLFXvD7XxKxky3e2XguKyonvZatXSStgJE8VqlGRZWKXApPA
         qp0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RjUJ4LBh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n29-v6si59549qtf.91.2018.08.16.05.49.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 05:49:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RjUJ4LBh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqHiE-0000sQ-KD
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 08:49:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqHhv-0000oS-C5
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:48:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqHhu-0003Ak-EH
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:48:55 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:42402)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqHht-0003A8-OP
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 08:48:54 -0400
Received: by mail-oi0-x244.google.com with SMTP id b16-v6so7739947oic.9
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 05:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WALXsGyWC3He2z7V8ENXvQN6F7PSWR3yhtTvwO6HVJE=;
	b=RjUJ4LBhntqC3e0/GInJJWOdevQcHOQ3gUhRqrx6pdTeBqVvFWV4+TvuoYGnnWCSdB
	i1NcA5pG2aSFUZx+cKqFwuCEavofSU79SY6bchFrk9jqUQW0aC/nGIdO8fQAJDnjQ+mm
	tWqVKdhotVQsRyLxeTLSGE+rzkuekKpKUWNBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WALXsGyWC3He2z7V8ENXvQN6F7PSWR3yhtTvwO6HVJE=;
	b=f4E+J4AanH8rgP9EQ3St4jl7gCF4+EMzMoH3gAodzuVSaq8c/54OxHuqkAQ3Z2Yous
	7y1UYkr6v+3rATMoc4IXGu8DesQGiZEVjPYZIWTIG2CJjKAN7UH36Yxtn44DVV5Cmx/X
	3Ruf3U47iukZOmqkfUSCJjK1SUQACp50LH5DbRFGG42EzuKF5mQgSS9pUveZSPAbyRnK
	9fdVNci/YytkwyXxGQaz4gn6kYiyq80HYPA78W0YX27B4I/KvTDCN7nbQkaJONB0e4jL
	1zLFhSRv0z5KQSFG0zogZv0zIrHZcjkOQWbG3p/8x+7NEwTGpPc4y5owyHiNZ/wR9q03
	xzJA==
X-Gm-Message-State: AOUpUlH3cXSJugcBuN33Y0p0I5bM7zGx4BYuBq1T8XkV3b6AKKKQOZ4x
	xr+/kZ3DoNbwmRV0eQDC2/nfNgLBNTl3n+jykQZBvGKPN6Mg+Q==
X-Received: by 2002:aca:ac54:: with SMTP id
	v81-v6mr29345920oie.1.1534423732880; 
	Thu, 16 Aug 2018 05:48:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 05:48:32
	-0700 (PDT)
In-Reply-To: <fd6f2874-d73e-f0b4-83a2-cbac5c9b3f19@kaod.org>
References: <20180807075757.7242-1-joel@jms.id.au>
	<fd6f2874-d73e-f0b4-83a2-cbac5c9b3f19@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 13:48:32 +0100
Message-ID: <CAFEAcA-0KsKeYcP8u2creCmpSvAb3oqWL9E_m7SVRSzJAphN3w@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 0/7] arm: aspeed: Extend SDRAM controller
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
	Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oHqegKa8nk/i

On 7 August 2018 at 13:30, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 08/07/2018 09:57 AM, Joel Stanley wrote:
>> This series allow us to run upstream u-boot on the ast2500-evb model.
>> They have been tested with upstream u-boot, as well as openbmc's ast2500
>> and ast2500 images.
>
> For all patches,
>
> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Patch [1-6] are good to merge.

I've applied 1-6 to target-arm.next.

thanks
-- PMM
