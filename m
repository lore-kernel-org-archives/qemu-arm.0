Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp799219wru;
        Fri, 27 Jul 2018 08:00:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdToaGSp7d8ppU0LNAse7zTdtnQzMnckNRk907cC9Of/FLpHLmY3NHqbSQUZZTSXSY6KjGK
X-Received: by 2002:a37:a310:: with SMTP id m16-v6mr6391685qke.254.1532703600281;
        Fri, 27 Jul 2018 08:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532703600; cv=none;
        d=google.com; s=arc-20160816;
        b=At5R4Q9oZJf+fYdOLlvCrGP9TvPb6pnHsILJHziU0Yh8G2mvq9rYQ66nqQe+MG56TO
         K9FyffXrPvWJQ/A4I46Cz5xpJHH+6oTNWi+xiRTlB4MDpPCkz6HeXivGn7eicCj6acEI
         TWcFwpnuGI8vTHhM+sdVW9AhBwEKck4aFRexDU6EIX7q9KG8A4iP8VnPh4CEi/tQCiKj
         jOtp6b/mKydjCRdxvf7mfxXpwsM9x7wSroMREKByXpJ+UZWxl+xrLi26x/minkMy/TGb
         ekNtoIyJ6x/li+zSOSUkB4K8JiP7uKab/uXD17mRY2wbe8dz1ZJ0Brtd2kz8NUbTNvMH
         AUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=DRmcw/QFqyPNYEtGW/3271hV9HlgjuQQWPGMdlUYrLk=;
        b=jNTz/A9bdgrnwKGmFRgv8zEkjwD4IV3B2eSlaIO/U4crtwKWeF/BUiQiQMorEhNlD+
         oe8xdwMiHQuWqQL5XbWTZRqtIlUzBwd+8X7zyjER7XtqZRYpXm0UwSffzF8k5ucspzjq
         WTjtu7m4DqGpwvY1/vvq+BmiBwi041gA3XQ6oceVzCAbxWeWSq7T/WQubmbsZs69kaFj
         I/al8QysHdIIzc/G+bx3oRjNFYpm2PfkWkbcDqL8wJU6mA7C9WmOUAVU0MWC3OoxJKv6
         uCyv+8yAbB0v5tQStkDc2a6Aiu+2TLGOr0fU2q2H/L1G9ek2LCLTHPIqYBaVDu0qaa4t
         4L7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IRv+J7fz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j41-v6si1589404qtk.138.2018.07.27.08.00.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 08:00:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IRv+J7fz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj4Dn-0007CL-Qu
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 10:59:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fj4Dg-0007Bz-Us
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 10:59:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fj4Dg-0004zO-8C
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 10:59:53 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:46787)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fj4Df-0004yU-W8
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 10:59:52 -0400
Received: by mail-oi0-x242.google.com with SMTP id y207-v6so9552526oie.13
	for <qemu-arm@nongnu.org>; Fri, 27 Jul 2018 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DRmcw/QFqyPNYEtGW/3271hV9HlgjuQQWPGMdlUYrLk=;
	b=IRv+J7fzhkl5uFlQfPzJ1sOKtoy7+AqjRgojo250aZfLzop+oMi55ZHau376mACwga
	maM9z0vbrDrzwUPmAPeDC3NL9iXKQPBIheDELwhx0NqE8D6ROza15JwfSH+y/pMOVYHZ
	fFXnTEtj6+pQKkd7sxuGXuViFhs10vRFLwY8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DRmcw/QFqyPNYEtGW/3271hV9HlgjuQQWPGMdlUYrLk=;
	b=k2c/Mbk6wWM1ZBeVk5E2FG41JWFrNQXKQoRpHC2McwnX7n0wl135HFXEitH4f5/OGm
	lblIaYXzZmPCu+put3AwdHvIfKtjfeBwA/FCXKpmv7DOXJf7OzhL/On1p/B6ggnphkSS
	qdflF04S9CZuBbvWn19Ad7yAlVzF89wdhw5MBfEV8Pl8z2H7ZUXbxfx65BWs7sjAaLdc
	/pLSqyvNyHmFEI6HdZhF26UtANpUKPyXkU5bu7irbLA6EgPcSik7niEsDihrxV33O6P7
	jHa787XclVW8aiTXBpyeEgo40SHLJjlKouGt9hpZRoCfLhlh5gDbq8xoG1KteA3u7rXq
	2muw==
X-Gm-Message-State: AOUpUlG8AeWUiIqBQPvF110GvDBUWqKuNrW6LCRjAbXNuCkI7GNpPnQo
	njLjsbGQS6uOgRosvjGhgf6NQNBENUD81Vr8m4fhZA==
X-Received: by 2002:aca:5f0a:: with SMTP id
	t10-v6mr6495152oib.337.1532703590865; 
	Fri, 27 Jul 2018 07:59:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 27 Jul 2018 07:59:30
	-0700 (PDT)
In-Reply-To: <cover.1532701430.git.damien.hedde@greensocs.com>
References: <cover.1532701430.git.damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Jul 2018 15:59:30 +0100
Message-ID: <CAFEAcA-X=eziUHurc0SEcGEeM25t4YgkTczsVeF8myWHjfp3MQ@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [RFC PATCH 0/6] Clock and power gating support
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OMRnYq3u9Ipl

On 27 July 2018 at 15:37, Damien Hedde <damien.hedde@greensocs.com> wrote:
> This set of patches add support for power and clock gating in device objects.
> It adds two booleans to the state, one for power state and one of clock state.
>
> The state is controlled trough 2 functions, one for power and one for clock.
> Two new methods *power_update* and *clock_update* is added to the device class
> which are called on state change and can be overriden.

So, you folks at Greensocs had a series a couple of years ago to try
to add clocktree support (which included handling things like guests
configuring clock rates, some clocks being "downstream" of others, and
so on). It didn't make it into mainline, though it did get a fair amount
of design/code review. How does this approach fit into / compare with
that ?

thanks
-- PMM
