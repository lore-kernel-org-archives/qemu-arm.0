Received: by 10.25.208.211 with SMTP id h202csp1117038lfg;
        Wed, 16 Mar 2016 04:27:40 -0700 (PDT)
X-Received: by 10.140.201.130 with SMTP id w124mr4540279qha.57.1458127660479;
        Wed, 16 Mar 2016 04:27:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q67si2848465qgd.110.2016.03.16.04.27.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 04:27:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:55331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag9c4-0000a1-1v
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 07:27:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9c0-0000ZD-RZ
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:27:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9c0-00077c-0k
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:27:36 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35316)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9bz-00077J-SS
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:27:35 -0400
Received: by mail-vk0-x235.google.com with SMTP id e6so57420546vkh.2
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 04:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6sAhxS+34o5UZ5hp3jNGs3aJ5Wbe4TMv1DRLXP6wBs8=;
	b=UpabWHsAQo2e28kBgWSogqVe0fzZ06w9oOtyJ+sSL02l0oEZ04UwGUcIdM11VX803o
	XpFKlR8rfCtuFEiPKiJQ6So3pc2FkvtguwSZqVpKLVCd1/oFRkzh1Do0ijon7WfZbsUz
	1xmY5r9Bz8czRGm8tylGlqm7soMKQg2Nujn4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6sAhxS+34o5UZ5hp3jNGs3aJ5Wbe4TMv1DRLXP6wBs8=;
	b=iCwgbFMLxjfZ2bK5SNTA1ZLTCiKF2oPhvVAt87dYI/s2blrt8VTw48bgJ8fiKRjC/X
	hTTXj8trVSfOaLge9BQF4lKN/6RULcGJ92ciOl6//AAu8t2HTlXNImknInm5Mj3pl71v
	mYnFlHUXAeDUXEROhLqi/9hjbZHdRGOzeqnkOKSHpU4w1579AU4zsiBoIHiSdknCtOW+
	sFW9rhTVxghU6oY/zMZSHPqldC/8FWkxKiLhnVHYnJo1OUo6jkAaYB7t5rTi5teuGK1b
	ifNg9fFF+ExzSnpJA30w+GTEu7sR4V+WKpnr+S75uENplesZCqsMGVsU/bZ3lodFiaLD
	EGUA==
X-Gm-Message-State: AD7BkJJpYz2x8o0mJ4rhb/SNwp0Vwy6tcQOX6XgM9VbQkFHGVQr7guK+kwlGlZ9vQ+MaU91XjfGb3xECGRZ3sPMR
X-Received: by 10.31.141.2 with SMTP id p2mr3667959vkd.37.1458127655178; Wed,
	16 Mar 2016 04:27:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 04:27:15 -0700 (PDT)
In-Reply-To: <1458096317-25223-1-git-send-email-andrew@aj.id.au>
References: <1458096317-25223-1-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 11:27:15 +0000
Message-ID: <CAFEAcA-Vo1o5Kse0iHLu3YKF3avnd0A-swiy30m1XGu5v-0WgA@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Dmitry Osipenko <digetx@gmail.com>, Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [Qemu-arm] [PATCH v5 0/4] Add ASPEED AST2400 SoC and Palmetto
	BMC machine
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xXKbJeMU4w4/

On 16 March 2016 at 02:45, Andrew Jeffery <andrew@aj.id.au> wrote:
> This patch series models enough of the ASPEED AST2400 ARM9 SoC[0] to boot an
> aspeed_defconfig Linux kernel[1][2]. Specifically, the series implements the
> ASPEED timer and VIC devices, integrates them into an AST2400 SoC and exposes
> it all through a new palmetto-bmc machine. The device model patches only
> partially implement the hardware features of the timer and VIC, again mostly
> just enough to boot Linux.
>
> Unfortunately the datasheet describing the devices is not generally available,
> but I'll try to add comments to any unclear areas.
>
> The addition of the AST2400 to QEMU is motivated by use of the SoC as a BMC in
> OpenPOWER[2][3] machines and the ongoing development of OpenBMC[4]. The
> presence of a machine model utilising the AST2400 will help with development
> and testing of the OpenBMC stack.

Thanks, applied to target-arm.next.

-- PMM
