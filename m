Received: by 10.25.27.66 with SMTP id b63csp2316738lfb;
        Tue, 7 Jun 2016 20:50:35 -0700 (PDT)
X-Received: by 10.55.119.66 with SMTP id s63mr2732420qkc.169.1465357835557;
        Tue, 07 Jun 2016 20:50:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t38si15954217qgt.91.2016.06.07.20.50.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 20:50:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAUVm-0008TM-UT
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 23:50:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAUVA-0007xY-5u
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 23:49:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAUV5-0007ai-6t
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 23:49:55 -0400
Received: from m12-13.163.com ([220.181.12.13]:35432)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAUV4-0007aB-DF; Tue, 07 Jun 2016 23:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=ogdab
	sT02NMf2qIZsssr7Ree81vunP2i3Lxz1aw+yss=; b=gABoEIiuSLlZBBcBY5p+T
	pJfOiwEuQWRzFcOwfmU7DV/no/LuxIOL822XIEgkLfi3sJekzwHswtK9Op9DPjqp
	dt4mBdW7wiLAzPDfO1PAtN7dd9JJgpZS6x9giocCqOiA/DjQtLTdEn7Zm4qKzrgy
	tcfhlugosBUYj4O1LeOqDA=
Received: from [192.168.31.184] (unknown [118.187.28.42])
	by smtp9 (Coremail) with SMTP id DcCowABXVc6ylVdX_5wFAA--.194S2;
	Wed, 08 Jun 2016 11:49:07 +0800 (CST)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
	<57573D52.4090006@ilande.co.uk>
From: xiaoqiang zhao <zxq_yx_007@163.com>
Message-ID: <575795AA.2050909@163.com>
Date: Wed, 8 Jun 2016 11:48:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <57573D52.4090006@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowABXVc6ylVdX_5wFAA--.194S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr1xCFWkWrWrurWDtF4kCrg_yoW8tw48pr
	WfKF43Zr18JrWfuwnI9w4jqF15Xw1kGa4DGr4ayr18Wr1jvr13Ar1UurWrX34DXrykXF13
	Jr1UJr9xC3WDArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jQxhLUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEBOCxlWBV0QFXQAAsY
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.13
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
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7vVrwJtqlpYl



在 2016年06月08日 05:32, Mark Cave-Ayland 写道:
> On 07/06/16 11:34, xiaoqiang zhao wrote:
>
>> This patch series QOM'ify ARM platform related devices.
>> Where we drop the sysbus init function if possible and use
>> instance_init and DeviceClass::realize function.
>>
>> xiaoqiang zhao (17):
>>    hw/i2c: QOM'ify bitbang_i2c.c
>>    hw/i2c: QOM'ify exynos4210_i2c.c
>>    hw/i2c: QOM'ify omap_i2c.c
>>    hw/i2c: QOM'ify versatile_i2c.c
>>    hw/gpio: QOM'ify mpc8xxx.c
>>    hw/gpio: QOM'ify omap_gpio.c
>>    hw/gpio: QOM'ify pl061.c
>>    hw/gpio: QOM'ify zaurus.c
>>    hw/misc: QOM'ify arm_l2x0.c
>>    hw/misc: QOM'ify eccmemctl.c
>>    hw/misc: QOM'ify exynos4210_pmu.c
>>    hw/misc: QOM'ify mst_fpga.c
>>    hw/misc: QOM'ify slavio_misc.c
>>    hw/dma: QOM'ify pxa2xx_dma.c
>>    hw/dma: QOM'ify sparc32_dma.c
>>    hw/dma: QOM'ify sun4m_iommu.c
>>    hw/sd: QOM'ify pl181.c
>>
>>   hw/dma/pxa2xx_dma.c      | 38 +++++++++++++++++-------------
>>   hw/dma/sparc32_dma.c     | 25 ++++++++++++--------
>>   hw/dma/sun4m_iommu.c     | 12 ++++------
>>   hw/gpio/mpc8xxx.c        | 20 +++++++++-------
>>   hw/gpio/omap_gpio.c      | 61 ++++++++++++++++++++++++------------------------
>>   hw/gpio/pl061.c          | 24 +++++++------------
>>   hw/gpio/zaurus.c         | 14 +++++------
>>   hw/i2c/bitbang_i2c.c     | 14 +++++------
>>   hw/i2c/exynos4210_i2c.c  | 13 +++++------
>>   hw/i2c/omap_i2c.c        | 44 ++++++++++++++++++++--------------
>>   hw/i2c/versatile_i2c.c   | 19 +++++----------
>>   hw/misc/arm_l2x0.c       | 11 ++++-----
>>   hw/misc/eccmemctl.c      | 25 +++++++++++++-------
>>   hw/misc/exynos4210_pmu.c | 11 ++++-----
>>   hw/misc/mst_fpga.c       | 13 +++++------
>>   hw/misc/slavio_misc.c    | 43 ++++++++++++++--------------------
>>   hw/sd/pl181.c            | 26 +++++++++++++--------
>>   17 files changed, 207 insertions(+), 206 deletions(-)
> Patches 16 and 17 for sparc32_dma and sun4m_iommu are actually sun4m
> SPARC rather than ARM devices, so while I don't mind if these go through
> someone else's tree then please ensure that you also test
> qemu-system-sparc thoroughly with these patches.
>
>
> ATB,
>
> Mark.
>
I have tested with following cmdline:

qemu-system-sparc -hda /home/hitmoon/debian_etch_sparc_small.qcow2

default machine is SS-5 and guest is debian, It seems everything is ok!

