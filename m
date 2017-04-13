Received: by 10.25.0.144 with SMTP id 138csp660257lfa;
        Thu, 13 Apr 2017 02:45:26 -0700 (PDT)
X-Received: by 10.200.47.108 with SMTP id k41mr1909994qta.92.1492076726384;
        Thu, 13 Apr 2017 02:45:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t86si22205591qkt.136.2017.04.13.02.45.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Apr 2017 02:45:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48307 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cybJb-0004Sh-UW
	for alex.bennee@linaro.org; Thu, 13 Apr 2017 05:45:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cybJE-00048T-4l
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 05:45:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cybJD-0001Vv-Br
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 05:45:00 -0400
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:37007)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cybJD-0001Vi-5P
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 05:44:59 -0400
Received: by mail-wm0-x229.google.com with SMTP id u2so42510218wmu.0
	for <qemu-arm@nongnu.org>; Thu, 13 Apr 2017 02:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jYd+mkkfElo7O0EWadejZnexvArk30RhZZTmbeIyHTo=;
	b=f2CBB94WC1C6bChV984i1CxQxKvXoWXyr27lTFkS5RiTl9TGj4/jsE9rntIaw4NwH3
	ROE5+mdSvdlr0jqNKw+idwighKLnjuxoeqZtYIP3yPtMghfb45VCNTnbWVqXLE9RnFt2
	o9nx06xM2qqWpwtGdrR7wSmq/C+qwAuPAq+aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jYd+mkkfElo7O0EWadejZnexvArk30RhZZTmbeIyHTo=;
	b=j0Hkaiiz37Cd26FoEc9wRo8i9CwEwCpJWnk8wJyTT5JbTg8rPftorhgDaIFwlij3a3
	g/dwmMZVVS2oGoTQ6DmhEgEJPSq4dXzEFi8i/Z+K73MCuA9wyEjaIaRvpcl0pNIdHeCb
	byct8e8qNZ//z/FRaiQazmx3Qt9vyr8bT0rvGGXSflSD/uAhvSAIcTwSjNGVzYK26QY8
	qRTbz7pyWTJ+YU/DjRFZxDBqPPd2zBEgraHweFj+J/sHZCNx9NWXUBtipzMisIguEFJu
	XPvoWAEjG3YaVPEmxpyJ0zjAyfn/ELgbNhRoyD9jnCl3ngDdrDuuw0sEASjXKgY1hq1/
	DQ5g==
X-Gm-Message-State: AN3rC/5HcxV7lodLvtmyM8BatCut74AxJ92rMVjEUk4PeA88QJ6FdRS3
	b6sufk9IxgDCw9U3xVbVYih63kl2Ex0c
X-Received: by 10.28.236.210 with SMTP id h79mr2342432wmi.92.1492076697965;
	Thu, 13 Apr 2017 02:44:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.35 with HTTP; Thu, 13 Apr 2017 02:44:37 -0700 (PDT)
In-Reply-To: <CALHRZurSfOAt53Sf=aGdGe7cHCxNggjUrt6pPDEQLRcvfX_cDA@mail.gmail.com>
References: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
	<CALHRZurSfOAt53Sf=aGdGe7cHCxNggjUrt6pPDEQLRcvfX_cDA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2017 10:44:37 +0100
Message-ID: <CAFEAcA9V0A9XvjtXHkq4RKmPDwRPuUgqwncy_hXMzv_FyVrD_w@mail.gmail.com>
To: sundeep subbaraya <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::229
Subject: Re: [Qemu-arm] [Qemu-devel RFC v2 0/4] Add support for Smartfusion2
 SoC
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
X-TUID: dnAZRtfn9m43

On 13 April 2017 at 04:21, sundeep subbaraya <sundeep.lkml@gmail.com> wrote:
> Hi Qemu-devel,
>
> This is my first attempt in Qemu.
> Please let me know am doing correct or not.
> SoC is cortex M3 based so no bootrom stuff and unlike other
> SoCs Qemu need not load dtb and kernel in DDR. Hence am using
> u-boot (supplied with -kernel) as bootloader in eNVM and it loads
> kernel from SPI flash to DDR same like real hardware scenario.
> Also let me know any other Maintainers need to be CCed.

Hi -- thanks for the patchset. I've put it onto my queue of
patches to review, but it may be a little while until I
can get to it (especially since it's the Easter holiday
in the UK right now).

-- PMM
