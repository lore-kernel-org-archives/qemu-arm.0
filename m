Received: by 10.25.77.65 with SMTP id a62csp157872lfb;
        Fri, 17 Feb 2017 04:56:05 -0800 (PST)
X-Received: by 10.55.154.7 with SMTP id c7mr957630qke.285.1487336165059;
        Fri, 17 Feb 2017 04:56:05 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j123si7415202qke.147.2017.02.17.04.56.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 04:56:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cei4y-0005bN-Ic
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 07:56:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cei4A-0005JJ-9p
	for qemu-devel@nongnu.org; Fri, 17 Feb 2017 07:55:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cei49-0004KD-Is
	for qemu-devel@nongnu.org; Fri, 17 Feb 2017 07:55:14 -0500
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:33138)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cei49-0004K1-D8
	for qemu-devel@nongnu.org; Fri, 17 Feb 2017 07:55:13 -0500
Received: by mail-wr0-x22d.google.com with SMTP id i10so29439640wrb.0
	for <qemu-devel@nongnu.org>; Fri, 17 Feb 2017 04:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SQ1eQb4/IzJKTQe9at1FU3oZupYrLQZSVd6Op8QKvWE=;
	b=Rps5uJ+mH4JDsScIa3Rxj7iEoAWVKXwn1/NZNCHoK7klOAAu2Y+M4Yi2sgpiNG8xrM
	zonFli8/QoUQhcZe/ZTnm+ZUvlcatV8odOASrKTK3nz5NA1xUoPQSMX4AXPdyg3jG1qW
	miCIIZxjpr89h8IODuoOVoqMWkOIWEyr4Tw4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SQ1eQb4/IzJKTQe9at1FU3oZupYrLQZSVd6Op8QKvWE=;
	b=YTfIXL8jPiDtgw8mEp94kZrVsnwDs6zX3KmIG6wTv66f/O5TEdxMoAf01ECqV4Esaa
	hsV635zltLeF4FZ/NjpDZRpsU5QvXcvxlQYkmNDyIhoNkEqnl8NFSa34wbOFfIKzf5Hm
	YQxwbN5NdxAv3sF9qwZls5Es6ZQzeErl+0rd3Ji31+nOt4SPz2zXY7jhG+ckGFa4VmqB
	A35+DTTl0myoOpxJ/+JxtPdnoZCarwJT+7T/noYxJp/1aGZELMVU3yz1LamL0HpMUhC3
	KIestQXBjg0oNyaA8QKS5K/ZtC4BSOA3qedy12YZ3lw7R/ViYX2ySardsYJaP9Ea+Xt2
	ys5Q==
X-Gm-Message-State: AMke39lWHSN8GsnEn+yYsSxdkzFclBD93b8hUO53GCpXhJkgXUhPFQlnQLYOujtBAUFYVJ1nDyXcX1sT94hnc3rL
X-Received: by 10.223.133.68 with SMTP id 62mr6415614wrh.195.1487336112119;
	Fri, 17 Feb 2017 04:55:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 04:54:51 -0800 (PST)
In-Reply-To: <20170210210857.47893-1-marcinch7@gmail.com>
References: <20170210210857.47893-1-marcinch7@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 12:54:51 +0000
Message-ID: <CAFEAcA-i6xqsik1=hMk9N0w-rCa8JxZD9VF7h==hjYJokx1fCw@mail.gmail.com>
To: Marcin Chojnacki <marcinch7@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-devel] [PATCH v2] target-arm: Implement BCM2835 hardware
 RNG
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: chCVaEx0lozI

On 10 February 2017 at 21:08, Marcin Chojnacki <marcinch7@gmail.com> wrote:
> Recent vanilla Raspberry Pi kernels started to make use of
> the hardware random number generator in BCM2835 SoC. As a
> result, those kernels wouldn't work anymore under QEMU
> but rather just freeze during the boot process.
>
> This patch implements a trivial BCM2835 compatible RNG,
> and adds it as a peripheral to BCM2835 platform, which
> allows to boot a vanilla Raspberry Pi kernel under Qemu.

So this looks good to me (other than the rand issue which
I just posted a patch for). My testing shows that it
definitely helps for the raspbian image I just downloaded.
However although the kernel boots OK it hangs indefinitely
because it can't find a root filesystem -- presumably
it doesn't see the sd card. Do you see that, or does it
work for you?

thanks
-- PMM
