Received: by 10.25.208.211 with SMTP id h202csp1256094lfg;
        Wed, 16 Mar 2016 08:29:05 -0700 (PDT)
X-Received: by 10.55.75.203 with SMTP id y194mr6296976qka.2.1458142145231;
        Wed, 16 Mar 2016 08:29:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j188si3671454qhd.56.2016.03.16.08.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 08:29:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56991 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agDNg-0003uN-Pg
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 11:29:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agDNd-0003sK-On
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 11:29:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agDNc-0008UK-O0
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 11:29:01 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35449)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agDNb-0008Ty-Gg
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 11:29:00 -0400
Received: by mail-vk0-x234.google.com with SMTP id e6so66168524vkh.2
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 08:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vNWJO3x5bC/2Snk6P8fN+cIr8kSDgUotRRv3H+3O+ZY=;
	b=R6OzYbHGMJMXHTIkQCjekoo/JXQLEcOdpRtustam+Wf/PDqbW9JnFQMb4+zBczIr6v
	7GvEdgdkr9QKXjLJCzrFGUt11osdrGfAAsbmcSdqTqhT23hf/miLmATPePB70tZXFv6/
	iLa+Bj8reoXsue6nh9GLflnuk+sFNAjS3dUWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vNWJO3x5bC/2Snk6P8fN+cIr8kSDgUotRRv3H+3O+ZY=;
	b=YgYGlTAsZ5hzJYP5SoDZucCvNNbUFvGzF0nrKs1q+8RtBdsYZYQqxCTryX9N27rm5G
	mZ7hvZwCZBUVu1wgN+DXC6Fqwagd7AzsoDSGLY+m1C4ZtPH2i3DVoBcaQbzvHMZt7NNv
	AWI8jLn1FUMsO9VF6gH0BtkK1dinqwgH/KtdmD9NzfXqsGNuy/eeSGURww6j4iQPa6dV
	2WQQajsUbR9ILwrjiaR7+iAYA9A3LZS3/M8hgX2QFseCrLAcwiblkB16Yn4dO4ZcWtSI
	g5pPWi70NY7kt6cYB5Msm4yxbEjS+Am4mnHsr2Rb5aGVIpamnqb4W2HwdotDjz/lkbUe
	vsTQ==
X-Gm-Message-State: AD7BkJJCJ36G621uEJHNkfsO7dOPInEDevrf23ax2NakzYYRRW7bwebfWn2TshgZB9ohesUNs4sY7A5vESa1sski
X-Received: by 10.31.141.2 with SMTP id p2mr5223907vkd.37.1458142139140; Wed,
	16 Mar 2016 08:28:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 08:28:39 -0700 (PDT)
In-Reply-To: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1457467526-8840-1-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 15:28:39 +0000
Message-ID: <CAFEAcA_mBJi-=+rA6Sm8ycNJyb-VV0eFmCb8OQnXxk+oTKu1Uw@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v3 0/5] Raspberry Pi framebuffer,
	DMA and Windows support
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
X-TUID: 3W6INJa5ciJD

On 8 March 2016 at 20:05, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
> This patch series adds support for the AUX (second UART), framebuffer
> and DMA controller on Raspberry Pi 2, and enables booting Windows on
> this device. As with the previous series, it is heavily based on the
> original (out of tree) work of Gregory Estrade, Stefan Weil and others
> to support Raspberry Pi 1.
>
> After this series, it is possible to boot Windows by following the
> instructions at https://github.com/0xabu/qemu/wiki. You also boot
> Raspbian to the GUI using a command such as:
>
>   qemu-system-arm -M raspi2 -kernel raspbian-boot/kernel7.img -sd
>   2015-09-24-raspbian-jessie.img -append "rw earlyprintk loglevel=8
>   console=ttyAMA0 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootwait"
>   -dtb raspbian-boot/bcm2709-rpi-2-b.dtb -serial stdio
>
> I plan to add USB, and remaining timers / system devices in
> future patch series, along with support for pi1 (bcm2835). In the
> meantime, the complete code is available at https://github.com/0xabu/qemu

Thanks, applied to target-arm.next.

-- PMM
