Received: by 10.25.85.209 with SMTP id j200csp1127817lfb;
        Mon, 13 Jun 2016 03:42:27 -0700 (PDT)
X-Received: by 10.140.106.228 with SMTP id e91mr13017018qgf.75.1465814547867;
        Mon, 13 Jun 2016 03:42:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z63si9144326qtc.93.2016.06.13.03.42.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 03:42:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPK7-0001I9-7N
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 06:42:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPBF-0001MI-7n
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:33:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPBD-00057m-Fr
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:33:16 -0400
Received: from m12-17.163.com ([220.181.12.17]:35329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPAv-00052D-L9; Mon, 13 Jun 2016 06:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=UKbeiz7CSDZ+LyjEJe
	pqiRRRSvuof/wgHLdURbQl/tk=; b=o2I2G+J0xDCP2vwyhRCTeVA63hXaiClN/2
	tw06lYb9Kth4uVkDHMF7E+uQ+SIrVTuWw9itU+m2LXhfPwaKtEhj+cTvNT/VCsra
	JZlcSULxbXAYN4Yi7Nxn3RpabWoMz91LtZGvBrFHNQrUf/FP0Pmz/3tc+DQXipdT
	1kG8UiN38=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp13 (Coremail) with SMTP id EcCowADHYci3i15XduskAw--.9790S2;
	Mon, 13 Jun 2016 18:32:28 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:31:59 +0800
Message-Id: <1465813931-20534-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
X-CM-TRANSID: EcCowADHYci3i15XduskAw--.9790S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrZF1xArW7Ww43WF17Zw4ruFg_yoW8Jr4Upa
	ySqF43XrW8JayfXw1a9w4jyFy5Jr1kJ3WDWw17tryrXryUAw17Ar1UWFWrZ34UJrykXF15
	JryUtr13Cw1DArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxXo7UUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEByHxlWBV5hlsgAAsB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
Subject: [Qemu-arm] [PATCH 00/12] some ARM platform QOM'ify work (update)
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
	balrogg@gmail.com, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rY9YX4xOpedk

This patch series QOM'ify ARM platform related devices.
Where we drop the sysbus init function if possible and use 
instance_init and DeviceClass::realize function.

xiaoqiang zhao (12):
  hw/i2c: QOM'ify bitbang_i2c.c
  hw/i2c: QOM'ify exynos4210_i2c.c
  hw/i2c: QOM'ify omap_i2c.c
  hw/i2c: QOM'ify versatile_i2c.c
  hw/gpio: QOM'ify omap_gpio.c
  hw/gpio: QOM'ify pl061.c
  hw/gpio: QOM'ify zaurus.c
  hw/misc: QOM'ify arm_l2x0.c
  hw/misc: QOM'ify exynos4210_pmu.c
  hw/misc: QOM'ify mst_fpga.c
  hw/dma: QOM'ify pxa2xx_dma.c
  hw/sd: QOM'ify pl181.c

 hw/dma/pxa2xx_dma.c      | 38 +++++++++++++++++-------------
 hw/gpio/omap_gpio.c      | 61 ++++++++++++++++++++++++------------------------
 hw/gpio/pl061.c          | 24 +++++++------------
 hw/gpio/zaurus.c         | 14 +++++------
 hw/i2c/bitbang_i2c.c     | 14 +++++------
 hw/i2c/exynos4210_i2c.c  | 13 +++++------
 hw/i2c/omap_i2c.c        | 44 ++++++++++++++++++++--------------
 hw/i2c/versatile_i2c.c   | 19 +++++----------
 hw/misc/arm_l2x0.c       | 11 ++++-----
 hw/misc/exynos4210_pmu.c | 11 ++++-----
 hw/misc/mst_fpga.c       | 13 +++++------
 hw/sd/pl181.c            | 26 +++++++++++++--------
 12 files changed, 143 insertions(+), 145 deletions(-)

-- 
2.1.4


