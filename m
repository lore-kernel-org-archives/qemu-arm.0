Received: by 10.25.208.211 with SMTP id h202csp1185396lfg;
        Wed, 16 Mar 2016 06:22:14 -0700 (PDT)
X-Received: by 10.140.248.135 with SMTP id t129mr5312414qhc.53.1458134534601;
        Wed, 16 Mar 2016 06:22:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 138si3246847qhr.60.2016.03.16.06.22.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 06:22:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agBOw-0001s9-0x
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 09:22:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9g7-0003IF-Hg
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:31:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9g6-0008Am-M2
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:31:51 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34806)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9g6-0008AP-Hs
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 07:31:50 -0400
Received: by mail-vk0-x22a.google.com with SMTP id e185so57522968vkb.1
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 04:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RP3uyXey1MFlC1mpwHPPRvbZbcVDDDX1BY+GIa3+psA=;
	b=Y9oCYgwa35qTlfDfzjzC04VKHD0PCw6gfVtkh4kJotfaGu9snUkSIroYpXX0sx9L3Y
	Em02ob7+JEC1aRvnCcUDGgw2dmqGNUkrWBb8M7RXybvVquFH2vZ2OhdYsbhuvHkfBw+o
	JWlbYVsrlHJDvPXjSmsOnc3jExgMDCY2Pa8vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RP3uyXey1MFlC1mpwHPPRvbZbcVDDDX1BY+GIa3+psA=;
	b=VYggDRELmpMrHhT2Hq0g2uV6Bg99CSpXAc0lnV3zZfl6M9/2ADcpOAGuSAT40EOxeo
	Fw176i/nn7oiqvE57Qva4obVudMszp/s1HD8ruRf84j5PlVisL/Vy/RkrBHhhaSZ31QC
	eaDsVdxlsbCoIrX7XFefNpbwLFpHv0hRbFtP/H1ANIrS3VTPyYluXBTvwheB2wlg1hP0
	DaIbTijUoYGm2tPgyXOOwI5msQr6+kpufMg0eYRG/MglJCo8oSLdpWsyffEjkqIcpgLl
	oge1scKaCkmpxbmij7xmlVLjQoNC8BYvB1QkmxZxiiJUFtEuKYIw/iPXq5ehLj5wX4uA
	sr4Q==
X-Gm-Message-State: AD7BkJKzlZp9jYl5QN1T0jsbmtit8NWoT3sFY3Wowsohw23kZyhiDo7NEWZibvMkQEKsm5ew5lOFYr1tcr1t7flJ
X-Received: by 10.31.180.85 with SMTP id d82mr3194152vkf.83.1458127909068;
	Wed, 16 Mar 2016 04:31:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 04:31:29 -0700 (PDT)
In-Reply-To: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 11:31:29 +0000
Message-ID: <CAFEAcA98BiQipq4PL=_9fBeOa01ESzyp7U4ghN0gZuxAyAqwoA@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 0/9] some QOM'ify work under hw/arm
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
X-TUID: yTHTLd61wiKy

On 7 March 2016 at 07:05, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> This patch set trying to QOM'ify code under hw/arm directory.
> As previous patches to hw/timer/*, we use instance_init instead of
> the SysBus's init function.
>
>
> xiaoqiang zhao (9):
>   hw/arm: QOM'ify armv7m.c
>   hw/arm: QOM'ify highbank.c
>   hw/arm: QOM'ify integratorcp.c
>   hw/arm: QOM'ify pxa2xx.c
>   hw/arm: QOM'ify pxa2xx_pic.c
>   hw/arm: QOM'ify spitz.c
>   hw/arm: QOM'ify stellaris.c
>   hw/arm: QOM'ify strongarm.c
>   hw/arm: QOM'ify versatilepb.c

A general note -- since these aren't bug fixes and we're in soft
freeze now, I don't think we should put them in until 2.6 is out.
I'll review the patches in a second, though.

thanks
-- PMM
