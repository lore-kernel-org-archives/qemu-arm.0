Received: by 10.25.30.65 with SMTP id e62csp1245482lfe;
        Wed, 25 May 2016 04:17:32 -0700 (PDT)
X-Received: by 10.55.67.21 with SMTP id q21mr2941763qka.49.1464175052349;
        Wed, 25 May 2016 04:17:32 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n102si39452294qgn.72.2016.05.25.04.17.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 04:17:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5Wod-0008Ka-KQ
	for alex.bennee@linaro.org; Wed, 25 May 2016 07:17:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b5WWt-0000dO-6r
	for qemu-devel@nongnu.org; Wed, 25 May 2016 06:59:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b5WWj-0002O2-U9
	for qemu-devel@nongnu.org; Wed, 25 May 2016 06:59:11 -0400
Received: from m12-18.163.com ([220.181.12.18]:39502)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1b5WWj-0002K7-9u; Wed, 25 May 2016 06:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=+Xlehaq9mi23HrS1r8
	B2RjcchzDXVfFiFjzOKlVR1M4=; b=BIQWsYSCSS8mEzRQCHM/I2vLLQJI7NXmwV
	Wz/mUA5ip5uci7RQ4Uv97l5nJo0dfaWIdamkCsd+2nbeCY0LMcKEHP3cetIJxkIG
	aTVH5etw/ojjZzpCYv9H/7MNLljthsXPsKsIekoDYsWdF2LvLFudk0NdyTr1Zy5D
	zIY0CnJaQ=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowECZp0pKhUVXzcaKAA--.5553S2;
	Wed, 25 May 2016 18:58:51 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 May 2016 18:58:10 +0800
Message-Id: <1464173896-4088-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
X-CM-TRANSID: EsCowECZp0pKhUVXzcaKAA--.5553S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWDuFy3Ar45urWDZFWUJwb_yoW8Wry8pF
	WrJFZxWrWjkFy3ZF1fCw129F43JF1kW34j9ryxtryrZ343KFW0ywnrKF4rZrWxJ340qr15
	Ar9xXr9xGFnFqrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joXdbUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEAt0xlUL8osemAAAsI
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-devel] [PATCH 0/6] Drop the qemu_char_get_next_serial function
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
Cc: robh@kernel.org, peter.maydell@linaro.org, crosthwaite.peter@gmail.com,
	alistair.francis@xilinx.com, qemu-arm@nongnu.org,
	antonynpavlov@gmail.com, pbonzini@redhat.com, edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dppwuXbMacDT

This patch series's main idea is to drop the use of
qemu_char_get_next_serial. patches 1-5 QOM'ify the related 
device model and the affected board code. Most of them
are arm related. The patch 6 get rid of the function from
the code base.

I only test the code with ARM versatilepb machine. The other
machine need test!

xiaoqiang zhao (6):
  hw/char: QOM'ify pl011 model
  hw/char: QOM'ify cadence_uart model
  hw/char: QOM'ify digic-uart model
  hw/char: QOM'ify stm32f2xx_usart model
  hw/char: QOM'ify xilinx_uartlite model
  char: get rid of qemu_char_get_next_serial

 hw/arm/bcm2835_peripherals.c             | 16 ++--------
 hw/arm/digic.c                           |  2 ++
 hw/arm/highbank.c                        |  3 +-
 hw/arm/integratorcp.c                    |  5 +--
 hw/arm/realview.c                        |  9 +++---
 hw/arm/stellaris.c                       |  6 ++--
 hw/arm/stm32f205_soc.c                   |  1 +
 hw/arm/versatilepb.c                     |  9 +++---
 hw/arm/vexpress.c                        |  9 +++---
 hw/arm/virt.c                            |  1 +
 hw/arm/xilinx_zynq.c                     |  5 +--
 hw/arm/xlnx-zynqmp.c                     |  1 +
 hw/char/cadence_uart.c                   | 13 ++++----
 hw/char/digic-uart.c                     | 10 +++---
 hw/char/pl011.c                          | 11 ++++---
 hw/char/stm32f2xx_usart.c                | 11 ++++---
 hw/char/xilinx_uartlite.c                | 10 +++---
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  5 +--
 include/hw/char/cadence_uart.h           | 17 +++++++++++
 include/hw/char/pl011.h                  | 52 ++++++++++++++++++++++++++++++++
 include/hw/char/xilinx_uartlite.h        | 35 +++++++++++++++++++++
 include/sysemu/char.h                    |  1 -
 qemu-char.c                              | 16 ----------
 23 files changed, 173 insertions(+), 75 deletions(-)
 create mode 100644 include/hw/char/pl011.h
 create mode 100644 include/hw/char/xilinx_uartlite.h

-- 
2.1.4


