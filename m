Received: by 10.25.85.209 with SMTP id j200csp1135139lfb;
        Mon, 13 Jun 2016 04:01:58 -0700 (PDT)
X-Received: by 10.55.105.130 with SMTP id e124mr13382880qkc.16.1465815718369;
        Mon, 13 Jun 2016 04:01:58 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m77si14882906qgd.12.2016.06.13.04.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 04:01:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCPcz-0001Rv-OM
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 07:01:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPWm-0004TT-OB
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:55:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1bCPWe-0003Hu-Ts
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 06:55:32 -0400
Received: from m50-134.163.com ([123.125.50.134]:47889)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1bCPWd-0003GD-S1; Mon, 13 Jun 2016 06:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=UKbeiz7CSDZ+LyjEJe
	pqiRRRSvuof/wgHLdURbQl/tk=; b=gk6yitH3D5IjfY1eBhgtKLU5pQe9Vi6/7k
	n+FK8ZehgTxTVoiROmqii/PeR+qqBLa08DyVQ239PyL3xKJ90ye7hUm5CMy5sqwp
	duMYA6RwD3venQW/v+g4E4TEzZcXxX7RaVFjDpcnig09bxTv/M4Ef93nP93GGhCz
	RAthQkN5A=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp4 (Coremail) with SMTP id DtGowADHQpfkkF5X+0_jBA--.36165S2;
	Mon, 13 Jun 2016 18:54:32 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 Jun 2016 18:54:03 +0800
Message-Id: <1465815255-21776-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
X-CM-TRANSID: DtGowADHQpfkkF5X+0_jBA--.36165S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrZF1xArW7Ww43WF17Zw4ruFg_yoW8Jr4Upa
	ySqF43XrW8JayfXw1a9w4jyFy5Jr1kJ3WDWw17tryrXryUAw17Ar1UWFWrZ34UJrykXF15
	JryUtr13Cw1DArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jsFxUUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiTAiHxlSIPnTMjAAAsT
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 123.125.50.134
Subject: [Qemu-devel] [RESEND PATCH 00/12] some ARM platform QOM'ify work
 (resend)
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
X-TUID: iFicSRwK05Kd

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


