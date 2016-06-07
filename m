Received: by 10.25.27.66 with SMTP id b63csp2215259lfb;
        Tue, 7 Jun 2016 14:33:02 -0700 (PDT)
X-Received: by 10.55.33.153 with SMTP id f25mr1682649qki.156.1465335182576;
        Tue, 07 Jun 2016 14:33:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s92si15251576qgs.116.2016.06.07.14.33.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 14:33:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAOcP-0002ve-Ts
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 17:33:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1bAOcJ-0002uV-3z
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 17:32:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1bAOcE-00043Q-VY
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 17:32:55 -0400
Received: from chuckie.co.uk ([82.165.15.123]:34048
	helo=s16892447.onlinehome-server.info)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1bAOcE-00043H-O9; Tue, 07 Jun 2016 17:32:50 -0400
Received: from host86-181-186-5.range86-181.btcentralplus.com ([86.181.186.5]
	helo=[192.168.1.65]) by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1bAOc6-0000Fx-Dr; Tue, 07 Jun 2016 22:32:43 +0100
To: xiaoqiang zhao <zxq_yx_007@163.com>, qemu-devel@nongnu.org
References: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <57573D52.4090006@ilande.co.uk>
Date: Tue, 7 Jun 2016 22:32:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.181.186.5
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 82.165.15.123
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
X-TUID: z0nunhUoEoGn

On 07/06/16 11:34, xiaoqiang zhao wrote:

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
> 
>  hw/dma/pxa2xx_dma.c      | 38 +++++++++++++++++-------------
>  hw/dma/sparc32_dma.c     | 25 ++++++++++++--------
>  hw/dma/sun4m_iommu.c     | 12 ++++------
>  hw/gpio/mpc8xxx.c        | 20 +++++++++-------
>  hw/gpio/omap_gpio.c      | 61 ++++++++++++++++++++++++------------------------
>  hw/gpio/pl061.c          | 24 +++++++------------
>  hw/gpio/zaurus.c         | 14 +++++------
>  hw/i2c/bitbang_i2c.c     | 14 +++++------
>  hw/i2c/exynos4210_i2c.c  | 13 +++++------
>  hw/i2c/omap_i2c.c        | 44 ++++++++++++++++++++--------------
>  hw/i2c/versatile_i2c.c   | 19 +++++----------
>  hw/misc/arm_l2x0.c       | 11 ++++-----
>  hw/misc/eccmemctl.c      | 25 +++++++++++++-------
>  hw/misc/exynos4210_pmu.c | 11 ++++-----
>  hw/misc/mst_fpga.c       | 13 +++++------
>  hw/misc/slavio_misc.c    | 43 ++++++++++++++--------------------
>  hw/sd/pl181.c            | 26 +++++++++++++--------
>  17 files changed, 207 insertions(+), 206 deletions(-)

Patches 16 and 17 for sparc32_dma and sun4m_iommu are actually sun4m
SPARC rather than ARM devices, so while I don't mind if these go through
someone else's tree then please ensure that you also test
qemu-system-sparc thoroughly with these patches.


ATB,

Mark.

