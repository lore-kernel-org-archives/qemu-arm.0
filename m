Received: by 10.25.27.66 with SMTP id b63csp1933549lfb;
        Tue, 7 Jun 2016 03:41:29 -0700 (PDT)
X-Received: by 10.237.43.167 with SMTP id e36mr14170426qtd.10.1465296089904;
        Tue, 07 Jun 2016 03:41:29 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q72si13638450qkc.225.2016.06.07.03.41.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 03:41:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAERt-0000j6-Bo
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 06:41:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEMP-0004Vv-Q2
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:35:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bAEMO-0002MC-Rq
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:35:49 -0400
Received: from m12-18.163.com ([220.181.12.18]:47089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bAEMO-0002Lr-8m; Tue, 07 Jun 2016 06:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=9dwK52fzsqAZP8wA6Z
	aZJd3CeUwFVuit7UeNtsE8Rsw=; b=TCQh/ksoku9t/rptdd53/d014z+6kArQDt
	BpcDbh/+ps6FdHLLcGgddjk6sR8pb4BxufKoDUnRxsuyz06egCz72gnrfj5yg/V9
	OPqB3OIPxkcMimCsWripFG+Dt2XTArDCq7tyobcugeYOT2IrV/pU6+qG5PtqRZNJ
	fxAZ6fyLA=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowEAJmUVLo1ZXMS8LAA--.4188S2;
	Tue, 07 Jun 2016 18:35:02 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jun 2016 18:34:37 +0800
Message-Id: <1465295683-11505-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
X-CM-TRANSID: EsCowEAJmUVLo1ZXMS8LAA--.4188S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr47KF48CFy8Ar1UZw1rCrg_yoW8WF47pF
	ySgF43Xry8J3y3Xw1akw4jvFy5Jw1kG3WDWr13tr1rXry5Ar17Ar1UWFWrX34UJry8XF15
	JryUtr13Gw1DArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jY4E_UUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEBaBxlWBVzbd1QAAs8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-devel] [PATCH 00/17] some ARM platform QOM'ify work
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
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AskTz9bqe8r7

This patch series QOM'ify ARM platform related devices.
Where we drop the sysbus init function if possible and use
instance_init and DeviceClass::realize function.

xiaoqiang zhao (17):
  hw/i2c: QOM'ify bitbang_i2c.c
  hw/i2c: QOM'ify exynos4210_i2c.c
  hw/i2c: QOM'ify omap_i2c.c
  hw/i2c: QOM'ify versatile_i2c.c
  hw/gpio: QOM'ify mpc8xxx.c
  hw/gpio: QOM'ify omap_gpio.c
  hw/gpio: QOM'ify pl061.c
  hw/gpio: QOM'ify zaurus.c
  hw/misc: QOM'ify arm_l2x0.c
  hw/misc: QOM'ify eccmemctl.c
  hw/misc: QOM'ify exynos4210_pmu.c
  hw/misc: QOM'ify mst_fpga.c
  hw/misc: QOM'ify slavio_misc.c
  hw/dma: QOM'ify pxa2xx_dma.c
  hw/dma: QOM'ify sparc32_dma.c
  hw/dma: QOM'ify sun4m_iommu.c
  hw/sd: QOM'ify pl181.c

 hw/dma/pxa2xx_dma.c      | 38 +++++++++++++++++-------------
 hw/dma/sparc32_dma.c     | 25 ++++++++++++--------
 hw/dma/sun4m_iommu.c     | 12 ++++------
 hw/gpio/mpc8xxx.c        | 20 +++++++++-------
 hw/gpio/omap_gpio.c      | 61 ++++++++++++++++++++++++------------------------
 hw/gpio/pl061.c          | 24 +++++++------------
 hw/gpio/zaurus.c         | 14 +++++------
 hw/i2c/bitbang_i2c.c     | 14 +++++------
 hw/i2c/exynos4210_i2c.c  | 13 +++++------
 hw/i2c/omap_i2c.c        | 44 ++++++++++++++++++++--------------
 hw/i2c/versatile_i2c.c   | 19 +++++----------
 hw/misc/arm_l2x0.c       | 11 ++++-----
 hw/misc/eccmemctl.c      | 25 +++++++++++++-------
 hw/misc/exynos4210_pmu.c | 11 ++++-----
 hw/misc/mst_fpga.c       | 13 +++++------
 hw/misc/slavio_misc.c    | 43 ++++++++++++++--------------------
 hw/sd/pl181.c            | 26 +++++++++++++--------
 17 files changed, 207 insertions(+), 206 deletions(-)

-- 
2.1.4


