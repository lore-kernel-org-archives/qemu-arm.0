Received: by 10.25.21.96 with SMTP id l93csp1498692lfi;
        Mon, 4 Jul 2016 05:36:35 -0700 (PDT)
X-Received: by 10.55.88.65 with SMTP id m62mr16261614qkb.0.1467635795592;
        Mon, 04 Jul 2016 05:36:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y123si1869992qkc.0.2016.07.04.05.36.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 05:36:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK374-0004OY-TV
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 08:36:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bK2w6-0006Ah-Jg
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:25:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bK2w5-00052i-NY
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:25:14 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33683)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bK2w5-00052X-JQ
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 08:25:13 -0400
Received: by mail-vk0-x22a.google.com with SMTP id k68so142822856vkb.0
	for <qemu-arm@nongnu.org>; Mon, 04 Jul 2016 05:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=deEMrV7Cu41R4tRj6nHrWLRtRts3sVmMIaII1vYZ38s=;
	b=HOzq4CLHuGkePkc2Xrn2BBtMN7Do9riJ+a0KklvPpGXjDmIgkxvK3NtK395xNRZFM2
	MPABi/zmdMxY30KGh6DfV7jEMS/qi0WhoL0q2X82FOuR3HG9jHcOh/mm3djFyVGfqJ65
	DZKUNUSJw+rdESs+RBy6Bf3sX1kSBqXRCzQ/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=deEMrV7Cu41R4tRj6nHrWLRtRts3sVmMIaII1vYZ38s=;
	b=QPDRHAqPsJYEqznynysM9HcdUBYL1ysvgRZJF5q12yrAWFNBcttwBGZa3oi7f5fq+P
	BBVaMJATvAVtyBCGBSnD2fbj0E3OinFemAR4LL2i67+pfkz4SPmcZLLiCFWLKioGwtwO
	vHB7vZGI4RFTdwbkpFGWEDZOg+SinqyK8diFiFLdkgze92obeVDo6HGifc7UCM/gW52l
	IH9JJke+17GkmLsFKmp9WnLCU+q7EnAqMmfN8j1th9VrIf/VSTvKSmlwfRzI2y23xO1a
	A6YBDCHbFL8Gb1KUaMGKAl2lzQx3fMaNGlwwQ+Afp7p4fj7DQUBegxBhDbqKkC07uyXh
	Jf3A==
X-Gm-Message-State: ALyK8tIQWOTZS6XTdqjU1eGu5NKB6lRJMS9yQx8/YGlP3L7a7NOI2O3WGf/yr3ahYrfbOhI9hQ/CPUkr1PMVyQbR
X-Received: by 10.31.7.68 with SMTP id 65mr1091408vkh.74.1467635113210; Mon,
	04 Jul 2016 05:25:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.242.75 with HTTP; Mon, 4 Jul 2016 05:24:53 -0700 (PDT)
In-Reply-To: <1467634738-28642-2-git-send-email-clg@kaod.org>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-2-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2016 13:24:53 +0100
Message-ID: <CAFEAcA9RzmF7UcCL3fuBCPtWbBrWUYs8836=OjC5d=H3n4u+Bw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-arm] [PATCH 1/7] tests: add a m25p80 test
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Marcin_Krzemi=C5=84ski?= <mar.krzeminski@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0hzLTSL8ugKq

On 4 July 2016 at 13:18, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> This test uses the palmetto platform and the AST2400 SPI controller to
> test the m25p80 flash module device model. The flash model is defined
> by the platform (n25q256a) and it would be nice to find way to control
> it, using a property probably.


> +static inline void flash_writel(uint32_t data)
> +{
> +    data =3D cpu_to_be32(data);
> +    memwrite(AST2400_FLASH_BASE, &data, 4);
> +}
> +
> +static inline uint32_t flash_readl(void)
> +{
> +    uint32_t data;
> +
> +    memread(AST2400_FLASH_BASE, &data, 4);
> +    return be32_to_cpu(data);
> +}

These are weird. As per my question in the other thread, if you
were writing this as a piece of test code that ran natively
in the guest, how would you write it?

thanks
-- PMM
