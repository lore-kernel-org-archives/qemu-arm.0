Received: by 10.25.27.66 with SMTP id b63csp618040lfb;
        Sat, 4 Jun 2016 01:22:39 -0700 (PDT)
X-Received: by 10.55.134.6 with SMTP id i6mr7094997qkd.185.1465028559607;
        Sat, 04 Jun 2016 01:22:39 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v65si5924394qtd.78.2016.06.04.01.22.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 04 Jun 2016 01:22:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59885 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b96qt-0007T6-0o
	for alex.bennee@linaro.org; Sat, 04 Jun 2016 04:22:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b96jp-00018Z-1Q
	for qemu-devel@nongnu.org; Sat, 04 Jun 2016 04:15:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1b96jf-00024x-Ii
	for qemu-devel@nongnu.org; Sat, 04 Jun 2016 04:15:19 -0400
Received: from m12-18.163.com ([220.181.12.18]:58671)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1b96jd-0001x2-O1; Sat, 04 Jun 2016 04:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=SH8G+FAJ+rNbpYTtP5
	gDA/bWLISxYBiuhJMqZofyawg=; b=g1H3nvj68+kLLT6XMa05mV1ByLqbMzQlbw
	bo89Ve8PFl0AHjEQFV7Q8omZVkNcSFxUafPxZeLWOXhK6pE/yXUW+c01Q2K9Vaxp
	BIGMi/IsEUZmN7K2ekJykDSj5DdWeghQO2HEFy4tEXnOxC1xisk9VRn1wCAj1tDV
	E9JzIprHc=
Received: from debian.lan (unknown [114.111.167.200])
	by smtp14 (Coremail) with SMTP id EsCowECpfUbfjVJXKXU9AA--.28040S2;
	Sat, 04 Jun 2016 16:14:34 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Sat,  4 Jun 2016 16:14:19 +0800
Message-Id: <1465028065-5855-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.8.1
X-CM-TRANSID: EsCowECpfUbfjVJXKXU9AA--.28040S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWDuFy3Ar45urWDZFWUJwb_yoW8Ar4rpF
	W5JFZxWrWjkFy3ZF1fCw129a13JF1kW34j9ry7tryrZ343KFW0ywnrKF4rZrWxJ340qr15
	Ar9xXr9xGFnFqrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bnCztUUUUU=
X-Originating-IP: [114.111.167.200]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiTAx+xlSIPd373wACsi
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Subject: [Qemu-devel] [PATCH v2 0/6] Drop the qemu_char_get_next_serial
 function
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
	armbru@redhat.com, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, antonynpavlov@gmail.com,
	pbonzini@redhat.com, edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PUDTkdgWQum6

This patch series's main idea is to drop the use of
qemu_char_get_next_serial. patches 1-5 QOM'ify the related 
device model and the affected board code. Most of them
are arm related. The patch 6 get rid of the function from
the code base.

I only test the code with ARM versatilepb machine. The other
machine need test!

v1 -> v2:
* fix a typo in pl011.c which failed the make check
* fix out of bound access error in stm32f205_soc.c

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
 hw/char/stm32f2xx_usart.c                | 15 ++++++---
 hw/char/xilinx_uartlite.c                | 10 +++---
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  5 +--
 include/hw/char/cadence_uart.h           | 17 +++++++++++
 include/hw/char/pl011.h                  | 52 ++++++++++++++++++++++++++++++++
 include/hw/char/xilinx_uartlite.h        | 35 +++++++++++++++++++++
 include/sysemu/char.h                    |  1 -
 qemu-char.c                              | 16 ----------
 23 files changed, 178 insertions(+), 74 deletions(-)
 create mode 100644 include/hw/char/pl011.h
 create mode 100644 include/hw/char/xilinx_uartlite.h

-- 
2.8.1


