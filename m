Received: by 10.25.0.144 with SMTP id 138csp1821788lfa;
        Tue, 25 Apr 2017 04:32:21 -0700 (PDT)
X-Received: by 10.55.146.135 with SMTP id u129mr27630468qkd.124.1493119941306;
        Tue, 25 Apr 2017 04:32:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g184si21669707qkc.190.2017.04.25.04.32.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Apr 2017 04:32:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48595 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d2yhg-000366-NC
	for alex.bennee@linaro.org; Tue, 25 Apr 2017 07:32:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d2yhb-00034O-2X
	for qemu-arm@nongnu.org; Tue, 25 Apr 2017 07:32:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d2yha-0005TK-An
	for qemu-arm@nongnu.org; Tue, 25 Apr 2017 07:32:15 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:37269)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1d2yha-0005SY-2x
	for qemu-arm@nongnu.org; Tue, 25 Apr 2017 07:32:14 -0400
Received: by mail-wm0-x232.google.com with SMTP id m123so93085387wma.0
	for <qemu-arm@nongnu.org>; Tue, 25 Apr 2017 04:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r/DjmIOYbRznYPrpoHINqr2FFtEnDmgupgkIVvITAhk=;
	b=alnnCJrL2I/vslNfrJ7Rt36n8Za6BgoGiyvkHDqqccFU6BeJjd7yuzx4M8XWXFu6xE
	404vstYRaeDw7n/nTRiKxPqvgNLWLwaTpw0lR6mAkf3lNTH6lwaoVG3xtTAFIUQhPp57
	dZOaM6DXONBYz0VNzEqUTb5qtqhw9FZXdVT6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r/DjmIOYbRznYPrpoHINqr2FFtEnDmgupgkIVvITAhk=;
	b=aFjLOSd/u2kyOWkVzajl2dR7+vRl5hYBB1lMgZCnSW5qwQdzQV6AMB0ByLz6TEfCnc
	M/Apn7zsb4702oMH7XYNIP1urRxP2On6P5CPr3+U2CJGZwR7fQrJIs3g58h4rnf7g1M+
	Do0kHO8qjsgND2WJAwha4YKQGP7vvzJYo5QSvkRYeQBNRABDGwfcBTx5IuS7rMhndcAB
	DJyONp7duZnGbBRgolGLJh3CZj7tE2c8kH6npTRpsux3+ukJfbQ2tnxSp/QBCmY2XuVm
	mPRrPHv1yfO2K2wm50lBt4fnACLhW828hBRm772+rR3A/GqJR2C/+J3vkaNFVCH59Bda
	Ik6A==
X-Gm-Message-State: AN3rC/7P68m/vguyxZuQZQEshxu41NVG4qQyiEnBxfl5G7VpyGjyW12K
	mRbc2IODfLFljsB+0Pb2k8MIIVv7Udzn
X-Received: by 10.28.67.68 with SMTP id q65mr1765748wma.142.1493119933030;
	Tue, 25 Apr 2017 04:32:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Tue, 25 Apr 2017 04:31:52 -0700 (PDT)
In-Reply-To: <20170422190709.8676-1-krzk@kernel.org>
References: <20170422190709.8676-1-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Apr 2017 12:31:52 +0100
Message-ID: <CAFEAcA_jwtKpR7a7sHRtWmRcp+2g0Y3+UDm=5LW0o26hBBTGZw@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-arm] [PATCH v2] hw/arm/exynos: Add generic SDHCI devices
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZK7zxOnvaGnN

On 22 April 2017 at 20:07, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Exynos4210 has four SD/MMC controllers supporting:
>  - SD Standard Host Specification Version 2.0,
>  - MMC Specification Version 4.3,
>  - SDIO Card Specification Version 2.0,
>  - DMA and ADMA.
>
> Add emulation of SDHCI devices which allows accessing storage through SD
> cards. Differences from real hardware:
>  - Devices are shipped with eMMC memory, not SD card.
>  - The Exynos4210 SDHCI has few more registers, e.g. for
>    controlling the clocks, additional status (0x80, 0x84, 0x8c). These
>    are not implemented.
>
> Testing on smdkc210 machine with "-drive file=FILE,if=sd,bus=0,index=2".
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to master, thanks (since this is the only thing in my
ARM to-review queue...)

-- PMM
