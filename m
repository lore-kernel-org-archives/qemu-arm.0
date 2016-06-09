Received: by 10.25.27.66 with SMTP id b63csp458831lfb;
        Thu, 9 Jun 2016 11:26:18 -0700 (PDT)
X-Received: by 10.140.109.198 with SMTP id l64mr10762847qgf.65.1465496776678;
        Thu, 09 Jun 2016 11:26:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 94si4084575qgl.106.2016.06.09.11.26.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 11:26:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB4em-0006np-1T
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 14:26:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4bv-0004c7-68
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 14:23:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4bu-0001Rr-8N
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 14:23:19 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:35497)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4bu-0001Rf-45
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 14:23:18 -0400
Received: by mail-vk0-x22d.google.com with SMTP id d127so66691165vkh.2
	for <qemu-arm@nongnu.org>; Thu, 09 Jun 2016 11:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0wtrtcVOT9fQ12vfkdD6nO9qW/v4jZ4q72sH3HOAMks=;
	b=hGl6LgRYm+N5d/IMqkhbeWcAKneQn9a0gDh0xlan7mbk9lGqkP6eGseoWCu+gIUp3k
	rdxsZ9PXxwmV02M2wj8w6DsQXlLyb4nvi0uKfV6IT4eOh8U4cjwBgLYEF4ivfMZNmuL4
	sI5w8kN9u3Y/0Ng4XNqhIAbZWU+62R/Y11wbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0wtrtcVOT9fQ12vfkdD6nO9qW/v4jZ4q72sH3HOAMks=;
	b=ADMNXV85MTnFGgcxn7Oka1uhn3CyowI4zjjtU5U46mGrh0z4kfmc2p+q7X9ageWlJ8
	aDdYUls2n2nAnnuMgf75Lno0VSVS+9zYP6MKRtEzvV2uOIsKAvh2wGLlcB8JGmyIVFaU
	c4FDPjBgE2IjNdBuwp3xdStL1F5tubsl6DFd0Y3hoehRv4Z4zwp6J5qqESqiCjkH+boI
	rpE+3f/R60Sy2iiao65Gmoe0vV5N3ekti533uMB/2QJB/bzo6RsK1HprxrXcqUQytdLk
	Y2p+CqCQ8CA1uiYPjO+Zq9tBM+X1pHOtfVyE4nM+z+Jdq95Xa532jtFDUzfj7hIHvEtB
	8Z+Q==
X-Gm-Message-State: ALyK8tL1UFS6WEzk2TC0VAA7ccVwdLCGKm8/JLAEcxVAFIdmKpT7RIrdDAfeaGwrx6ylkC3aUrhMXfYBj16/L6Gl
X-Received: by 10.176.0.146 with SMTP id 18mr5173234uaj.17.1465496597644; Thu,
	09 Jun 2016 11:23:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Thu, 9 Jun 2016 11:22:58 -0700 (PDT)
In-Reply-To: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
References: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2016 19:22:58 +0100
Message-ID: <CAFEAcA8UCC6JBm1_QxNsgXy4++wANoGdYKRbOs7hupxPCb+qjw@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-arm] [PATCH 00/17] some ARM platform QOM'ify work
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
	Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6FtfXPzqoqwC

On 7 June 2016 at 11:34, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> This patch series QOM'ify ARM platform related devices.
> Where we drop the sysbus init function if possible and use
> instance_init and DeviceClass::realize function.
>
> xiaoqiang zhao (17):
>   hw/i2c: QOM'ify bitbang_i2c.c
>   hw/i2c: QOM'ify exynos4210_i2c.c
>   hw/i2c: QOM'ify omap_i2c.c
>   hw/i2c: QOM'ify versatile_i2c.c
>   hw/gpio: QOM'ify mpc8xxx.c
>   hw/gpio: QOM'ify omap_gpio.c
>   hw/gpio: QOM'ify pl061.c
>   hw/gpio: QOM'ify zaurus.c
>   hw/misc: QOM'ify arm_l2x0.c
>   hw/misc: QOM'ify eccmemctl.c
>   hw/misc: QOM'ify exynos4210_pmu.c
>   hw/misc: QOM'ify mst_fpga.c
>   hw/misc: QOM'ify slavio_misc.c
>   hw/dma: QOM'ify pxa2xx_dma.c
>   hw/dma: QOM'ify sparc32_dma.c
>   hw/dma: QOM'ify sun4m_iommu.c
>   hw/sd: QOM'ify pl181.c

This patch series doesn't seem to have been sent threaded
correctly -- it looks like it's three separate threads,
with 0-6 in one, 7-9 in another and 10-17 in a third.
This breaks the automatic tooling for applying patchsets.

Please fix this, and send a fresh series with only the
ARM devices. No sparc, no ppc, so drop patches 5, 10, 13, 15, 16.
You should send separate series with just the PPC devices and
just the SPARC devices, cc'ing the relevant maintainers.

thanks
-- PMM
