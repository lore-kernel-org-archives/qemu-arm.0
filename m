Received: by 10.25.85.209 with SMTP id j200csp1131644lfb;
        Mon, 13 Jun 2016 03:53:41 -0700 (PDT)
X-Received: by 10.55.81.70 with SMTP id f67mr12472677qkb.173.1465815221341;
        Mon, 13 Jun 2016 03:53:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c138si14791633qka.240.2016.06.13.03.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 03:53:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55261 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPUy-0002yt-JC
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 06:53:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPUW-0002eH-Uf
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:53:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPU7-0002IN-4D
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:53:11 -0400
Received: from m50-135.163.com ([123.125.50.135]:59232)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPU6-0002Gq-4I; Mon, 13 Jun 2016 06:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=rr5//
	eq/2Ihs16+qy+/sWf5ZrlV0Eed1x4oyzRTk88c=; b=o9OILsUaRXUdQHULlm6RA
	AsRttWE593e11TWkF3LHS/LuaSkCGmOkcoEgYYmz0ZRdIceWJeOkHXLD/muN+5bw
	uIJg5SZs1stLWS+n3YB4BNnmS2RXTQL9pYox/zPy8v/v5tZzisEo9MdjFto3W7uF
	AF7PesHouXfPljA0TbXtJc=
Received: from [192.168.11.127] (unknown [101.254.142.162])
	by smtp5 (Coremail) with SMTP id D9GowAC364BYkF5X5MMwAw--.1883S2;
	Mon, 13 Jun 2016 18:52:09 +0800 (CST)
To: qemu-devel@nongnu.org
References: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
From: xiaoqiang zhao <zxq_yx_007@163.com>
Message-ID: <575E904C.3090702@163.com>
Date: Mon, 13 Jun 2016 18:51:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D9GowAC364BYkF5X5MMwAw--.1883S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr17KFWfJrWfWw4fGF4xtFb_yoW8GrWkpF
	Z3KF43Xr18JrWfuwnI9w4UtF15Xw1kGayDGw13tw10gr1jyw42yr1UWrWrZ3srXrykXF15
	Jr1UJr13Cw1DArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jQID7UUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOxqHxlXlUCv3PwAAsj
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 123.125.50.135
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/12] some ARM platform QOM'ify
 work (update)
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
X-TUID: OqBM2QMgr5oR



在 2016年06月13日 18:31, xiaoqiang zhao 写道:
> This patch series QOM'ify ARM platform related devices.
> Where we drop the sysbus init function if possible and use
> instance_init and DeviceClass::realize function.
>
> xiaoqiang zhao (12):
>    hw/i2c: QOM'ify bitbang_i2c.c
>    hw/i2c: QOM'ify exynos4210_i2c.c
>    hw/i2c: QOM'ify omap_i2c.c
>    hw/i2c: QOM'ify versatile_i2c.c
>    hw/gpio: QOM'ify omap_gpio.c
>    hw/gpio: QOM'ify pl061.c
>    hw/gpio: QOM'ify zaurus.c
>    hw/misc: QOM'ify arm_l2x0.c
>    hw/misc: QOM'ify exynos4210_pmu.c
>    hw/misc: QOM'ify mst_fpga.c
>    hw/dma: QOM'ify pxa2xx_dma.c
>    hw/sd: QOM'ify pl181.c
>
>   hw/dma/pxa2xx_dma.c      | 38 +++++++++++++++++-------------
>   hw/gpio/omap_gpio.c      | 61 ++++++++++++++++++++++++------------------------
>   hw/gpio/pl061.c          | 24 +++++++------------
>   hw/gpio/zaurus.c         | 14 +++++------
>   hw/i2c/bitbang_i2c.c     | 14 +++++------
>   hw/i2c/exynos4210_i2c.c  | 13 +++++------
>   hw/i2c/omap_i2c.c        | 44 ++++++++++++++++++++--------------
>   hw/i2c/versatile_i2c.c   | 19 +++++----------
>   hw/misc/arm_l2x0.c       | 11 ++++-----
>   hw/misc/exynos4210_pmu.c | 11 ++++-----
>   hw/misc/mst_fpga.c       | 13 +++++------
>   hw/sd/pl181.c            | 26 +++++++++++++--------
>   12 files changed, 143 insertions(+), 145 deletions(-)
>
Sorry for the inconvenience. Please forget this thread.
I will resend soon.

