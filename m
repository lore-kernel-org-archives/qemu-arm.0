Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp5570730wrd;
        Tue, 18 Sep 2018 11:48:10 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdboF91x0CDPr+ddxAcH6NyybrERzjKvrbsda8u35zFUbqNSIIbwo0aGmsRVPfA+poof8eY1
X-Received: by 2002:aed:3901:: with SMTP id l1-v6mr22656485qte.315.1537296490731;
        Tue, 18 Sep 2018 11:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537296490; cv=none;
        d=google.com; s=arc-20160816;
        b=ECkPzCi/6A+NQQZ9+5WovX9v/wRtaTiv9BzUK4rU3TX3G5IgSKMgD955px75RjUNNS
         vj+gyjEGzKBg8ZeZN20piVtuwp0r6uKtwCtiqC+4fSOlXhSS/TKs8iYaY+mpT7lJfQ5e
         1SP7xKoMjpQCxOw/+CjpEu2GYhpj/4SY6HJRcRDZrJ7JJiGkCrzq42BkSwpn8esltbXY
         wdLjvjamDtOjR+oyU3gWyBwZuQyq9IYkzzccPrIo3F9AvagKHk9CJCMBKAYeIjf/aLsE
         UBY6zlGEdT453n0hhZ2XSCyHZ6uuJhe0oW8IFnZxvj2jtG9XR1l2zgNbJB7UX6DikmS5
         rBiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=QwzhTXZhtFD9mTM9y8kJAmtZdJ3gUb3pJkRLvvxnfFI=;
        b=NwFgIRgl50u3Lw/+iaaK8Xni94BAR+IuhQ52FwjGnXbY1HRCc51Ygm6KWerYXi8Oxz
         mKCzK2EGXmtTgjc7ICxYOfYIeMsASnMV8ezyKoofnuYrHIP+Z8Z/NFUkeg/X0SrbWcQl
         QmDN8j+0ZbgI8N2dsXYYEY6DO1jpPEOuLPFw4TEwPJIBY9BCQr1ew/2phyuVrU0P7WR6
         Xjry5tv24ZSiW9p5ZH5RNEZDQl5NA1XKevjiYA+0pa9UWSXBmHexbFBWkrwtu7pRCb12
         WTRGd2XxRByKZ3vgRkH3Dj3Oa7/yOwu3hE8pvpIVZyEl4e7UFoUl3DHXLDwCtexM/9wR
         sEgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gy7HOYVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v46-v6si10090027qtv.299.2018.09.18.11.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Sep 2018 11:48:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gy7HOYVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42082 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2L2g-0003XY-AM
	for alex.bennee@linaro.org; Tue, 18 Sep 2018 14:48:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g2L2Q-0003TS-D2
	for qemu-arm@nongnu.org; Tue, 18 Sep 2018 14:47:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g2L2M-0002QF-9a
	for qemu-arm@nongnu.org; Tue, 18 Sep 2018 14:47:54 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39623)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g2L2L-0002MR-5k
	for qemu-arm@nongnu.org; Tue, 18 Sep 2018 14:47:50 -0400
Received: by mail-ot1-x342.google.com with SMTP id c12-v6so3073407otl.6
	for <qemu-arm@nongnu.org>; Tue, 18 Sep 2018 11:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=QwzhTXZhtFD9mTM9y8kJAmtZdJ3gUb3pJkRLvvxnfFI=;
	b=gy7HOYVJBV9IYvTqnBnKaroRe1F1nHJLEhp7jmfESf8Y9fIwDPpAZwJzIqvvjSzRGL
	E88ohisiq060jCvPLXmULdB//X32iU8TIb0Va9iKuluFS1izb3hL4Vb0bUxL2Gx9nEO+
	GpiLK4/Qmm338JXZYqYgVLQIsbB950I1svA7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=QwzhTXZhtFD9mTM9y8kJAmtZdJ3gUb3pJkRLvvxnfFI=;
	b=gJECJ2MczeuTIEKEz8EivKjDFbKB99xiVw8ilMBb3SchGsmeH4g0cLUaeaWSFLu0jY
	Cko2Ro1GR1iiAGRgKUk8ebgRyCDNisHcVKWHHtl+pE8zlStrCeT/LG0cwxQm1rySw59c
	bZDJ9ztf6V0gPZjrf0bATKI7g+eXRCTPAt3Kbofl5VxBrH8Cak5dgrX9/JkTn6F3Gp5r
	c/FlZzhhN4S1O9V6d+dQ7HmHo9QGauZQXi9GuLRLNxFWca6zXY2N+07xzqcjifeeVm3O
	MWkXbBlShiPoaxMa4vJ2MWr3OcxKhkm3fh3fMfNCwAqlRgRyHJc0/tUEErYUCHhHGLxs
	wd4w==
X-Gm-Message-State: APzg51ATTTuVHuxC7oky/iDSARpJKoAeSd+PesV5zg6jza16gzS/xbhE
	F4viQECmQgoNFdHHkRUxCwVGqstFtJ5LNPKxLjYS9xbO
X-Received: by 2002:a9d:82f:: with SMTP id
	44-v6mr17209085oty.377.1537296466981; 
	Tue, 18 Sep 2018 11:47:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 18 Sep 2018 11:47:26
	-0700 (PDT)
In-Reply-To: <20180831103816.13479-8-clg@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831103816.13479-8-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Sep 2018 19:47:26 +0100
Message-ID: <CAFEAcA-_p2uCFXfJCQFLBjvUuh_HWvuLFRGMTQvP5=g3XZu3Mw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH 07/11] aspeed/smc: add a 'sdram_base' and
 'max-ram-size' properties
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jwEKqGWeOoJT

On 31 August 2018 at 11:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The setting of the DRAM address of the DMA transaction depends on the
> DRAM base address and the maximun DRAM size of the SoC. Let's add a
> couple of properties to give this information to the SMC controller
> model.

In hardware, does the SMC controller really know the base address
of DRAM, or is it actually emitting transactions that the
bus fabric in the SoC sends to the right place? That is, would
it be more accurate to model it by passing the SMC controller a
MemoryRegion to use for emitting DMA transactions which was an
alias into the right part of the address space ?

thanks
-- PMM
