Received: by 10.25.0.147 with SMTP id 141csp441184lfa;
        Tue, 21 Feb 2017 03:01:49 -0800 (PST)
X-Received: by 10.55.93.131 with SMTP id r125mr26941241qkb.208.1487674909795;
        Tue, 21 Feb 2017 03:01:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l7si14853667qkf.131.2017.02.21.03.01.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 03:01:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cg8Cb-0002U3-5l
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 06:01:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cg8B2-0001jt-05
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 06:00:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cg8Ay-0006kE-QI
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 06:00:11 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:38112)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cg8Ay-0006iC-Gs
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 06:00:08 -0500
Received: by mail-wm0-x22c.google.com with SMTP id r141so72380520wmg.1
	for <qemu-devel@nongnu.org>; Tue, 21 Feb 2017 03:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/CJWFiaQMeNQ3TtWOnM/ZvXnQ0AYse5V1glmX3IYf2U=;
	b=XvLe5DoeB7hwMrOvuBuN7H9jTNy/EAxt1xigdESTEnEDfJ9dbKK/H8BvB9wYwi9GZb
	v+lVlxqDtYspkWpt0WsXmLEWLUgmGN/qGOJt7W1KrDSW9N2pm7HTDvfMOQ2Wtlo2WXC0
	vIb7VYCf3h5xXrndO4yz2Z23i4XXBRR1Dsjqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/CJWFiaQMeNQ3TtWOnM/ZvXnQ0AYse5V1glmX3IYf2U=;
	b=Xd4tHzl2cCGXRxnm8lRddyBBKxlLzIA3n+LkyiypHfXiRo6wRnijcrvcs1q7LbPhze
	xQVA5pYBub43jMBwYW4HeIoD+xag/fIpRoTbcH82BxM2sXduec5T8BOdjCcx2HQ/ygV7
	Lx1EjFysxIojkxyhn94qnsarEAufAsHEPHgSmjKSYWllg9zKSub5kkuSkTBF4ZKkOolq
	jXAU8m4dz/kd7aSfPmtLbsmEUQfA10IBq1/TQI6tQ8emqyE2sf9WV/P2B0eFPIhz/4Yf
	Kf12taccYHOsS5gOIq9PpqL+DfXBMNxOxtCV2v7ogHiGI9c23dRLt5VPoaUhnoGhQojd
	IwsA==
X-Gm-Message-State: AMke39k70ZGJ2eB0UpIW5HDzG0//iGSQTpjRQf5is7JCCa11P8QRd8x3V5vtlF7TAws8STUd/ZRoVjwOcIthrPqK
X-Received: by 10.28.55.199 with SMTP id e190mr23183804wma.92.1487674807276;
	Tue, 21 Feb 2017 03:00:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 21 Feb 2017 02:59:46 -0800 (PST)
In-Reply-To: <20170220173430.31630-1-clement.deschamps@antfield.fr>
References: <20170220173430.31630-1-clement.deschamps@antfield.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2017 10:59:46 +0000
Message-ID: <CAFEAcA-XkD3RRswf97Zg2phEdJScSYHnTjLmt__xe=+pLedvcw@mail.gmail.com>
To: Clement Deschamps <clement.deschamps@antfield.fr>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-devel] [PATCH 0/2] add bcm2835 sdhost controller to
 bcm2835 platform
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <andrew.baumann@microsoft.com>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nnFv7MXkYiNY

On 20 February 2017 at 17:34, Clement Deschamps
<clement.deschamps@antfield.fr> wrote:
> This patches add the Arasan SD controller to the BCM2835/36 platforms.

Cool!

> On the real hardware, both SD controllers are wired to the same SD card.
> Selection is done via multi-function pins through the GPIO controller.  I'm not
> sure what would be the good solution to emulate this in QEMU.  For now on we
> pass two sd cards on the command line which is not ideal.

That's unfortunate. I think we definitely need to fix this before we
can take the controller support into QEMU, because of the user-visible
effects on the required QEMU command line syntax.

I wonder if we can model this by effectively ejecting the card from
one SDBus and inserting it into the other when the GPIO controller
setting is configured. I think the way we want to do this is to
remove the SDState object from one SDBus qbus and insert it into
the other -- the functions in hw/sd/core.c all already cope with
"there's no card on this bus".

This might be a bit awkward because we effectively want to do a
hotplug/hot-unplug from our code but we don't want to expose to
the user that the device is hotpluggable. It may just be a matter
of doing an object_unparent() and then qdev_set_parent_bus() to move
the card object from one bus to the other... or it could get more
complicated.

thanks
-- PMM
