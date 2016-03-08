Received: by 10.25.208.211 with SMTP id h202csp1726633lfg;
        Mon, 7 Mar 2016 20:36:55 -0800 (PST)
X-Received: by 10.55.77.17 with SMTP id a17mr32763798qkb.40.1457411815385;
        Mon, 07 Mar 2016 20:36:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j201si1184030qhc.131.2016.03.07.20.36.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 20:36:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:60171 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ad9OA-0005GA-QP
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 23:36:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ad9O8-0005Fo-2X
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 23:36:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ad9O7-0001Cn-7J
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 23:36:52 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:33360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ad9O7-0001Cg-2q
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 23:36:51 -0500
Received: by mail-vk0-x231.google.com with SMTP id k1so4400915vkb.0
	for <qemu-arm@nongnu.org>; Mon, 07 Mar 2016 20:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J3RkYXeip91Ymoo1b2hWJ+WFQQ29T4MyFb6IQ5FB9+Q=;
	b=OrX7kF9/9ANq19jzwXT/3Q1InJUqH3pi43MtjKTowvoD29WsFKyeGaE/qXbjutSI+J
	ydGM2HNAmu7g45qsa2zljQRW4/RCG1axF3F0u+3L+OdNYmjCOPDZbBddtecI5P5Iz7nf
	xxLwjrlOjRKzQq5r0sQVPtxa9Lt+Q3HAkeYiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J3RkYXeip91Ymoo1b2hWJ+WFQQ29T4MyFb6IQ5FB9+Q=;
	b=ZqOUaTq6Tzc+zkb4mBY6c6+z7n4uuXgwoQepMQGDg/DEd5Sy3owuMTERe+KMMz1HGC
	I2F4btTQiZ6Q3UJ3PdjLHqnzItvfpK/KlhfjHoMG8xbJG14W3wT3nE5hYnEywWuJS0oP
	VaXXGllR28qAqSmfoxcvvBUjbVYcaPJLuYyi9HTlsLcdnDBMtFAWaHgvHgfNK0poV6bn
	pqywc2pShstQbEiqxFcCs8hI2sLRwE7rSJM8GIzIc7Dq5SyIooHq966gimELsi5W5aPF
	KgXmVomU8hY/h1aD3H1YV+MIIlbim7SGFAwL7VZ+1L1YyRTl52e5IqAtSi2ygu/M1Jed
	7sCQ==
X-Gm-Message-State: AD7BkJIMho6YkJigwcKVS8cDR7p2k4uPiSbWKxDmvLSsn2N7ySdr4Sq17iplgqeqC1W3r+77SM7qQeReaOA0SYvP
X-Received: by 10.31.47.207 with SMTP id v198mr24408843vkv.6.1457411810761;
	Mon, 07 Mar 2016 20:36:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 7 Mar 2016 20:36:31 -0800 (PST)
In-Reply-To: <1457029479-11312-6-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457029479-11312-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1457029479-11312-6-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2016 11:36:31 +0700
Message-ID: <CAFEAcA_PVUJwc0t3a68wt2HC9xs6SVt5qN4uCTXPz6yzXi9E1w@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 5/5] bcm2835_dma: add emulation of
	Raspberry Pi DMA controller
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
X-TUID: 96ucCAM4ME/s

On 4 March 2016 at 01:24, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
> At present, all DMA transfers complete inline (so a looping descriptor
> queue will lock up the device). We also do not model pause/abort,
> arbitrarion/priority, or debug features.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Can you add Gregory's Signed-off-by (and authorship from?) to whichever
patches are appropriate when you resend (as per discussion on the
earlier version of this patch)?

thanks
-- PMM
