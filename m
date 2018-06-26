Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5193813wrq;
        Tue, 26 Jun 2018 09:06:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpejEN0OPugi+WtVGUr4l2ocLEXXBT9rtMN1yyHuNb6mKlgNJdi9IlBaDK+CgsUlht+Cfp9t
X-Received: by 2002:ae9:e607:: with SMTP id z7-v6mr1795122qkf.114.1530029181929;
        Tue, 26 Jun 2018 09:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530029181; cv=none;
        d=google.com; s=arc-20160816;
        b=FubdvE59dOdCI8nujzOjGoRRD4rvIrXIo7oJ8e9lFJAnid8CR9UXc4tcjbmXIO3/Do
         TV58D+FNw0rapWhbmSheTXpHaYFovXhkymByEIZDMziDc+w7y3Pv1Pjd204++bGg1IOI
         o4YpcH5/n2w/aA6PHWxTQh3J1ac0bR0mxzag9zzqWJjAyK3/vjP2Cxbz6e/RiZRFnf9P
         Mx2Tld/PDQPeRhJr/7TosDvCyK7FtdK6nfdYOruNsiqA7e6GWlHXlFiP2J5/GWTfe7no
         UbwrIO+Z4+Tcm78RRsmcTDQYXeN7Z6+95zjPTXe3vC2sle82kI6n+EGpSgyVjQng9nfJ
         cwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=c4NPWQU+/jQStVErOHVdtti7WrZBVVLiqWCzNBjb6pY=;
        b=wZYQyVphURE22GY/ieyR8/oSFjDuNQvQdCyAVQuPrvEe+drRyIB6ya8x8ymosf8lBD
         he5IsJb6X2BUEdFEL8MvTGyUkJgDnTuGVTlZJQRivNb1Z+bwSPqEgbB6LiycEbDTqBzV
         q5NzyetV94ZygQprM5yrgeR/y0ktwkw5hdTw62GolYUkvm46DedItrY20dAuXRPvMYaN
         zuyN8yZyPGoWrEO83Vp1+utuLCq6v9DfZwY6AJpKVZeUvLNuh+R4AIx2JxwGpqxwWO2J
         DKwwVgiFDoLY4v3lpU/gd0V6KmuD8J59puMZTCXfvSmZxKIv181bHFJCvjCBZtedVycp
         3lUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FBg0nMQc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j37-v6si1873022qtc.35.2018.06.26.09.06.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 09:06:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FBg0nMQc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53689 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXqU1-0003YJ-FQ
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 12:06:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39477)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXqTc-0003Wp-Lv
	for qemu-devel@nongnu.org; Tue, 26 Jun 2018 12:05:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXqTb-0007g2-Sr
	for qemu-devel@nongnu.org; Tue, 26 Jun 2018 12:05:56 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:37173)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXqTb-0007fd-FU
	for qemu-devel@nongnu.org; Tue, 26 Jun 2018 12:05:55 -0400
Received: by mail-oi0-x241.google.com with SMTP id k81-v6so2463176oib.4
	for <qemu-devel@nongnu.org>; Tue, 26 Jun 2018 09:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=c4NPWQU+/jQStVErOHVdtti7WrZBVVLiqWCzNBjb6pY=;
	b=FBg0nMQcYwsCwyb/F73AYqp8oQyMdmYi6QhuxpgN3K0g6dU5WsIaLG6Xwa+oSU67eQ
	Qr5Kr9zv29xiV5XzU7SCosTafMVFq9MX8W4DuWZlmyDm7erzrYCad6mgSV5g2RoXhJo+
	5DETsrAQNuZJALP2Sh4NPc2gmiLfqU64ec30Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=c4NPWQU+/jQStVErOHVdtti7WrZBVVLiqWCzNBjb6pY=;
	b=EY68keTdjkAM6gitTPJhPvMP0JcBjEqmpKrD63dbRsb9txBmk3b/O897TzgASnQ+yC
	o5883XTDjtDvLYG5XW8P9pXeLEY4D0lYzUSfkdwu508cmzOHyDYHU8d7tZdgc9SzlTPj
	+I3MVohv3SEd36HX1PUGL4MXAcQHqZ7XXhQk9L161VapeCMqyxV2WrhQr92nJVf3bxqC
	aec7WoHAA8kAJr0sYa8BbneL3uTrFHmOTHWsZL229vvvSiERjkowWA9lhb6Sc4K/fhFk
	8uWkCLZzV2Biw37SPBFxFMceoPhxdKQBJZOMBMyl9J4hRQh8+pdMT9pYK/7loCVt/48M
	sleQ==
X-Gm-Message-State: APt69E1Tf5oVmeuG/wFne2C7HIA5BL9AxHAPsk+LE25RIQlR8+IEotN0
	rkWigCrAo9F0ECnhTJGc+omtAJxTqLPOXqBVZm7tBQ==
X-Received: by 2002:aca:a846:: with SMTP id
	r67-v6mr1252858oie.12.1530029154814; 
	Tue, 26 Jun 2018 09:05:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Tue, 26 Jun 2018 09:05:33 -0700 (PDT)
In-Reply-To: <20180622075700.5923-1-clg@kaod.org>
References: <20180622075700.5923-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jun 2018 17:05:33 +0100
Message-ID: <CAFEAcA9-rg_W9AyqDDMVgMR=r2hyEHsJawjrDn6PgJ2tvXErig@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH v2 0/3] aspeed: introduce the APB clock
 settings
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MgzMbzc2yNNM

On 22 June 2018 at 08:56, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> The Aspeed SoC clocks are driven by an input source clock which can
> have different frequencies : 24MHz or 25MHz, and also, on the Aspeed
> AST2400 SoC, 48MHz. The H-PLL (CPU) clock is defined from a calculation
> using parameters in the H-PLL Parameter register or from a predefined
> set of frequencies if the setting is strapped by hardware (Aspeed
> AST2400 SoC). The other clocks of the SoC are then defined from the
> H-PLL using dividers.
>
> We first introduce the APB clock because it drives the timer model.
> This fixes a slowdown issue on the palmetto machine (AST2400) when
> running Linux. The latest Linux versions take into account more
> precisely the SoC settings for the clocks and the APB freq is set to
> 48MHz but modeled at 24MHz by QEMU.
>
> Thanks,
>



Applied to target-arm.next, thanks.

-- PMM
