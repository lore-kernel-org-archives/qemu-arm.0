Received: by 10.25.27.66 with SMTP id b63csp2217999lfb;
        Tue, 7 Jun 2016 14:42:19 -0700 (PDT)
X-Received: by 10.140.98.172 with SMTP id o41mr1674953qge.8.1465335739308;
        Tue, 07 Jun 2016 14:42:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s190si15237282qkc.198.2016.06.07.14.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 14:42:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53182 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAOlO-0006iu-Ov
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 17:42:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAOlJ-0006hM-5l
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 17:42:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAOlD-0006fo-8F
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 17:42:13 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:33918)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAOlC-0006fb-J8
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 17:42:07 -0400
Received: by mail-vk0-x229.google.com with SMTP id e4so125359292vkb.1
	for <qemu-arm@nongnu.org>; Tue, 07 Jun 2016 14:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Pz9hyfDexY4ecopsZ6Jg00VS9w56wS9VimPeH2AbiTo=;
	b=X9EBJMJUsSElmK/EvAd7gOz5wpfayGSrtVXq3WgjH9ZSzUUsWQtd1TFbK4AGf/P6An
	ddfgFVWsY11xQ3MwT2HECax3vjW6opnaIvBEwthX3G3RcW/vUzTBYFnwQRbF96U7OEbv
	4Lk8t/oZ1JWTzIT6ppF8eRVV/fEuj5z3OI9sA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Pz9hyfDexY4ecopsZ6Jg00VS9w56wS9VimPeH2AbiTo=;
	b=gpAfru7UPlznYCUK9EXLDzCdrNHly8pyyM69K0mDtmKIt/LoUebb9Kz0Q/4iPAyVMI
	RjMLyvudE8Xakm574z5XM/w4QBcwAYg7D3lJa/e5M/cMPkIolac4tw9HV40w5lXDRO7U
	61udLEa2zrh7B2frFohmovKD1u+GFerQC7cLxG8l8Fsh8b8C10bZ9UdNL8WamsYDROrP
	0HgGWpBuGm8UrsWgd7jo/PyGRosK29Ufr73jl0QZ5Pdb4p1f8CSc1OrzlVypPRw96gPv
	UEuDHMRYtSO1VAO8O5PE3KfARbX8luo7psGQD4fRUkpXmN0rAFcEPrg8fcHamcW5cRdc
	J6zQ==
X-Gm-Message-State: ALyK8tI4e4nu825TwSeF+Itaq4dX+zfNoK0WF8rtFgF52DRi2GwuzuZ5W5xP6+zeJgiY3R3iMVkwbc2GnjiXtTuS
X-Received: by 10.31.81.199 with SMTP id f190mr637935vkb.139.1465335725972;
	Tue, 07 Jun 2016 14:42:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.67.65 with HTTP; Tue, 7 Jun 2016 14:41:46 -0700 (PDT)
In-Reply-To: <57573D52.4090006@ilande.co.uk>
References: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
	<57573D52.4090006@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2016 22:41:46 +0100
Message-ID: <CAFEAcA-fk4H7-mSKJeO0dVvJKMkvrJCb6y4uVnwdw4rT1bAYLQ@mail.gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/17] some ARM platform QOM'ify
 work
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
Cc: xiaoqiang zhao <zxq_yx_007@163.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OER6ANcOJQsf

On 7 June 2016 at 22:32, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:
> On 07/06/16 11:34, xiaoqiang zhao wrote:
>
>> This patch series QOM'ify ARM platform related devices.
>> Where we drop the sysbus init function if possible and use
>> instance_init and DeviceClass::realize function.
>>
>> xiaoqiang zhao (17):
>>   hw/i2c: QOM'ify bitbang_i2c.c
>>   hw/i2c: QOM'ify exynos4210_i2c.c
>>   hw/i2c: QOM'ify omap_i2c.c
>>   hw/i2c: QOM'ify versatile_i2c.c
>>   hw/gpio: QOM'ify mpc8xxx.c
>>   hw/gpio: QOM'ify omap_gpio.c
>>   hw/gpio: QOM'ify pl061.c
>>   hw/gpio: QOM'ify zaurus.c
>>   hw/misc: QOM'ify arm_l2x0.c
>>   hw/misc: QOM'ify eccmemctl.c
>>   hw/misc: QOM'ify exynos4210_pmu.c
>>   hw/misc: QOM'ify mst_fpga.c
>>   hw/misc: QOM'ify slavio_misc.c
>>   hw/dma: QOM'ify pxa2xx_dma.c
>>   hw/dma: QOM'ify sparc32_dma.c
>>   hw/dma: QOM'ify sun4m_iommu.c
>>   hw/sd: QOM'ify pl181.c
>>
>>  hw/dma/pxa2xx_dma.c      | 38 +++++++++++++++++-------------
>>  hw/dma/sparc32_dma.c     | 25 ++++++++++++--------
>>  hw/dma/sun4m_iommu.c     | 12 ++++------
>>  hw/gpio/mpc8xxx.c        | 20 +++++++++-------
>>  hw/gpio/omap_gpio.c      | 61 ++++++++++++++++++++++++------------------------
>>  hw/gpio/pl061.c          | 24 +++++++------------
>>  hw/gpio/zaurus.c         | 14 +++++------
>>  hw/i2c/bitbang_i2c.c     | 14 +++++------
>>  hw/i2c/exynos4210_i2c.c  | 13 +++++------
>>  hw/i2c/omap_i2c.c        | 44 ++++++++++++++++++++--------------
>>  hw/i2c/versatile_i2c.c   | 19 +++++----------
>>  hw/misc/arm_l2x0.c       | 11 ++++-----
>>  hw/misc/eccmemctl.c      | 25 +++++++++++++-------
>>  hw/misc/exynos4210_pmu.c | 11 ++++-----
>>  hw/misc/mst_fpga.c       | 13 +++++------
>>  hw/misc/slavio_misc.c    | 43 ++++++++++++++--------------------
>>  hw/sd/pl181.c            | 26 +++++++++++++--------
>>  17 files changed, 207 insertions(+), 206 deletions(-)
>
> Patches 16 and 17 for sparc32_dma and sun4m_iommu are actually sun4m
> SPARC rather than ARM devices, so while I don't mind if these go through
> someone else's tree then please ensure that you also test
> qemu-system-sparc thoroughly with these patches.

I don't have a good set of sparc test images, so probably
better if you take those. I think eccmemctl.c is sparc too.
mpc8xxx.c is PPC.

thanks
-- PMM
