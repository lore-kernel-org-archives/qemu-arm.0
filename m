Received: by 10.25.21.96 with SMTP id l93csp83487lfi;
        Tue, 14 Jun 2016 06:30:11 -0700 (PDT)
X-Received: by 10.55.89.131 with SMTP id n125mr20782262qkb.143.1465911010976;
        Tue, 14 Jun 2016 06:30:10 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x6si18357636qhc.41.2016.06.14.06.30.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 06:30:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35267 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCoPy-0002hf-C6
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 09:30:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCo8i-0002M7-70
	for qemu-devel@nongnu.org; Tue, 14 Jun 2016 09:12:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCo8d-00087I-C1
	for qemu-devel@nongnu.org; Tue, 14 Jun 2016 09:12:19 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35036)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCo8c-000873-4H
	for qemu-devel@nongnu.org; Tue, 14 Jun 2016 09:12:15 -0400
Received: by mail-vk0-x235.google.com with SMTP id j2so43997532vkg.2
	for <qemu-devel@nongnu.org>; Tue, 14 Jun 2016 06:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FwadO3g1TlkYJhAZrqbOftUIG6DoLvSApKIkqfIKs7s=;
	b=ZBEyY+d8BIe/vFHOp1n6ubSwWIA8WSmzg8qnX5e2W6Z2vdCPNE8Dyj5ZRUttL9WJ0j
	TJVfy5qr/CG7lPv+SJv8t4mSW+MIkLJPlxl6+oXnoEtht4o/Tfc2jEEipBP/FZ0KmxhB
	luVKoKVApT26E+PTzyyZlSgHz/sF5mvjy8tuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FwadO3g1TlkYJhAZrqbOftUIG6DoLvSApKIkqfIKs7s=;
	b=ZLbQYay64euaS/3T7buDkvvTWt2JE9Fq8ri5U0jsT7ZTrnJb+XfLQI6WEo9xowcNHL
	XG0TVYUYTCw2J+Ch94dLgFubPk6bEDwOqGTNbsZBBYsLgAZvBe5fbvWfl+Luu6b9PY2/
	vMZm9XzBDoinH+fJhNpReN38X7wXWkbQ2RRa7aq5LHzi/K1PvzJfXN0hrq+FZEW2y2Jt
	oTy9YtnmDrZb1EPjdWHh+p0bRh6bS+JGL54SdaGJymAxAyKNE1j9vJvSKhVQvaW67gHV
	VPfskulw1QJpa5kcabLXsWpW+wF9oZ4ljTyjNfPSU4aLSw5aJKX4M9yseHsLnpA9+G/Y
	OcgQ==
X-Gm-Message-State: ALyK8tLiBHccmoFaTlAFnK3EnbAYoqS4XniEF9wSkWcO/AplQ708QyUWXm88OD5e6oquaf7v2BF4TdC4Xa0RSoLo
X-Received: by 10.31.62.70 with SMTP id l67mr8653348vka.92.1465909933680; Tue,
	14 Jun 2016 06:12:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Tue, 14 Jun 2016 06:11:54 -0700 (PDT)
In-Reply-To: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
References: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jun 2016 14:11:54 +0100
Message-ID: <CAFEAcA-wnV1Zp=S82eWio2eewHpHn0OGFMaY34XQCeb_JBYxoQ@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-devel] [RESEND PATCH 00/12] some ARM platform QOM'ify
 work (resend)
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lZvzkzgBbTy/

On 13 June 2016 at 11:54, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> This patch series QOM'ify ARM platform related devices.
> Where we drop the sysbus init function if possible and use
> instance_init and DeviceClass::realize function.
>
> xiaoqiang zhao (12):
>   hw/i2c: QOM'ify bitbang_i2c.c
>   hw/i2c: QOM'ify exynos4210_i2c.c
>   hw/i2c: QOM'ify omap_i2c.c
>   hw/i2c: QOM'ify versatile_i2c.c
>   hw/gpio: QOM'ify omap_gpio.c
>   hw/gpio: QOM'ify pl061.c
>   hw/gpio: QOM'ify zaurus.c
>   hw/misc: QOM'ify arm_l2x0.c
>   hw/misc: QOM'ify exynos4210_pmu.c
>   hw/misc: QOM'ify mst_fpga.c
>   hw/dma: QOM'ify pxa2xx_dma.c
>   hw/sd: QOM'ify pl181.c
>

Thanks, applied to target-arm.next.

-- PMM
