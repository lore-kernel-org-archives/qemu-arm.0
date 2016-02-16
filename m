Received: by 10.25.208.211 with SMTP id h202csp1241656lfg;
        Tue, 16 Feb 2016 03:16:59 -0800 (PST)
X-Received: by 10.140.25.161 with SMTP id 30mr13163367qgt.73.1455621419876;
        Tue, 16 Feb 2016 03:16:59 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c191si40106035qka.29.2016.02.16.03.16.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:16:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:44388 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdcp-0006rm-8s
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:16:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXq-0006o5-SH
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aVdXn-0006m9-PS
	for qemu-devel@nongnu.org; Tue, 16 Feb 2016 06:11:50 -0500
Received: from m12-13.163.com ([220.181.12.13]:48303)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aVdXm-0006l4-05; Tue, 16 Feb 2016 06:11:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=pBW8K62/XgX/rCpb3b
	peT3bOGmnCj1hpSlJuujjRNM4=; b=lDOYj5SC7oWwy1M3WNzZU9y8NiJwFEXNuN
	H+8yoMI6BB9vw/w9jmfxlQ3iEZ9JgalgOYNwirB20iVqpbzA0FNDuBmVtUDUC19S
	S25PhmbEAMOBvgTg4vVvda88vm46P+s/DqNpvtdK1pm8T8hQdfcn9FNPduFGmZvQ
	t3ljm1RDE=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp9 (Coremail) with SMTP id DcCowACHx6HMA8NWPNreBQ--.31323S2;
	Tue, 16 Feb 2016 19:11:16 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 19:09:32 +0800
Message-Id: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
X-CM-TRANSID: DcCowACHx6HMA8NWPNreBQ--.31323S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw17WF1xJrWUZw1Dur13CFg_yoW8CFyUpr
	4fCF43Zr48A3y3Xw43CrsFqr15JF18JFy5Wwnxt34rAwnIyF15JF1UXF4rJFW7JFykZF13
	ZFyrtr15Gr15XrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRGg4DUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOxQRxlXlR13mzwAAs7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.13
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	xiaoqiang zhao <zxq_yx_007@163.com>,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v3 00/16] QOM'ify hw/timer/*
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3wQxvmLFEj0Y

This patch series QOM'ify timer code under hw/timer directory.
Main idea is to split the initfn's work, some to TypeInfo.instance_init
and some is placed in DeviceClass::realize.
Drop the use of SysBusDeviceClass::init if possible.

changes in v3: 
* remove unnecessary OBJECT cast
* refine some commit message
* use DeviceClass::vmsd instead of vmstate_register to register
  the VMState if possible

changes in v2: 
fix a stupid typo (timmer->timer)

xiaoqiang zhao (16):
  hw/timer: QOM'ify arm_timer (pass 1)
  hw/timer: QOM'ify arm_timer (pass 2)
  hw/timer: QOM'ify etraxfs_timer
  hw/timer: QOM'ify exynos4210_mct
  hw/timer: QOM'ify exynos4210_pwm
  hw/timer: QOM'ify exynos4210_rtc
  hw/timer: QOM'ify grlib_gptimer
  hw/timer: QOM'ify lm32_timer
  hw/timer: QOM'ify m48txx_sysbus (pass 1)
  hw/timer: QOM'ify m48txx_sysbus (pass 2)
  hw/timer: QOM'ify milkymist_sysctl
  hw/timer: QOM'ify pl031
  hw/timer: QOM'ify puv3_ost
  hw/timer: QOM'ify pxa2xx_timer
  hw/timer: QOM'ify slavio_timer
  hw/timer: QOM'ify tusb6010

 hw/timer/arm_timer.c        | 42 ++++++++++++++++++++----------------------
 hw/timer/etraxfs_timer.c    | 14 +++++++-------
 hw/timer/exynos4210_mct.c   | 12 +++++-------
 hw/timer/exynos4210_pwm.c   | 12 +++++-------
 hw/timer/exynos4210_rtc.c   | 12 +++++-------
 hw/timer/grlib_gptimer.c    | 30 ++++++++++++++++++------------
 hw/timer/lm32_timer.c       | 19 ++++++++++++-------
 hw/timer/m48t59.c           | 39 ++++++++++++++++++++-------------------
 hw/timer/milkymist-sysctl.c | 21 +++++++++++++--------
 hw/timer/pl031.c            | 11 +++++------
 hw/timer/puv3_ost.c         | 18 +++++-------------
 hw/timer/pxa2xx_timer.c     | 36 +++++++++++++++++++++---------------
 hw/timer/slavio_timer.c     | 12 +++++-------
 hw/timer/tusb6010.c         | 13 ++++++-------
 14 files changed, 147 insertions(+), 144 deletions(-)

-- 
2.1.4


