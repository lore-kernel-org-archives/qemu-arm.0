Received: by 10.25.208.211 with SMTP id h202csp970670lfg;
        Sun, 21 Feb 2016 19:20:13 -0800 (PST)
X-Received: by 10.55.73.74 with SMTP id w71mr32179679qka.60.1456111212448;
        Sun, 21 Feb 2016 19:20:12 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w187si27512201qhw.32.2016.02.21.19.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Feb 2016 19:20:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:46493 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXh2h-0006B7-K3
	for alex.bennee@linaro.org; Sun, 21 Feb 2016 22:20:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXh0X-00028F-J1
	for qemu-devel@nongnu.org; Sun, 21 Feb 2016 22:17:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aXh0W-0007im-Fl
	for qemu-devel@nongnu.org; Sun, 21 Feb 2016 22:17:57 -0500
Received: from m12-16.163.com ([220.181.12.16]:58505)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aXh0V-0007hE-OG; Sun, 21 Feb 2016 22:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=dfbyBZDn2VdBAlnPSq
	PKbyBgoeYZ/9fsbJdyw20Y1S4=; b=B2n+bw+qEqTNWMJZcZAYkoQ9JZISjstTuU
	bYIxz5jBBsmo6+H7W+GqEg0eS7UPzKQppo/TQ2QTp2Jn0MUFM/qWinlWoYMNbBsN
	xHuTOdeOnYeplwiR7pi2+6cU/l4lKXyZyZ3pPD7sqeOlBvdtM0WNBgokht/i2P+L
	jAgz7dEtI=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp12 (Coremail) with SMTP id EMCowEB5zUeWfcpW0G6hAA--.38100S2;
	Mon, 22 Feb 2016 11:16:45 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 11:15:24 +0800
Message-Id: <1456110933-5457-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
X-CM-TRANSID: EMCowEB5zUeWfcpW0G6hAA--.38100S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw17WF1xJrW7uw4kAFWUJwb_yoW8CrWDpr
	WfCF4fZF48A3y3Ww43CFsFqr15JF18JrW5GrnxK34rZrnIyF13tF1UWF4rJFW7JFykuF43
	ZF95tr15Gw1YvrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jSMKtUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEB0XxlUL61WOsAAAsC
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.16
Cc: peter.maydell@linaro.org, gxt@mprc.pku.edu.cn, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, edgar.iglesias@gmail.com,
	m.kozlov@samsung.com, afaerber@suse.de
Subject: [Qemu-devel] [PATCH v4 0/9] QOM'ify hw/timer/*
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
X-TUID: qNibAA0X9kJm

This patch series QOM'ify timer code under hw/timer directory.
Main idea is to split the initfn's work, some to TypeInfo.instance_init
and some is placed in DeviceClass::realize.
Drop the use of SysBusDeviceClass::init if possible.

Some patches in v3:
      hw/timer: QOM'ify arm_timer (pass 1)
      hw/timer: QOM'ify arm_timer (pass 2)
      hw/timer: QOM'ify exynos4210_mct
      hw/timer: QOM'ify exynos4210_pwm
      hw/timer: QOM'ify exynos4210_rtc
      hw/timer: QOM'ify pl031
      hw/timer: QOM'ify pxa2xx_timer
have been taken by Peter Maydell <peter.maydell@linaro.org>, others
still need some comments from the relevant maintainers.

changes in v4: 
* correct some misused "Reviewed-by" tags
* fix 'make check' fail case in the "/arm/device/introspect/concrete"
  test in tusb6010.c 

changes in v3: 
* remove unnecessary OBJECT cast
* refine some commit message
* use DeviceClass::vmsd instead of vmstate_register to register
  the VMState if possible

changes in v2: 
fix a stupid typo (timmer->timer)

xiaoqiang zhao (9):
  hw/timer: QOM'ify etraxfs_timer
  hw/timer: QOM'ify grlib_gptimer
  hw/timer: QOM'ify lm32_timer
  hw/timer: QOM'ify m48txx_sysbus (pass 1)
  hw/timer: QOM'ify m48txx_sysbus (pass 2)
  hw/timer: QOM'ify milkymist_sysctl
  hw/timer: QOM'ify puv3_ost
  hw/timer: QOM'ify slavio_timer
  hw/timer: QOM'ify tusb6010

 hw/timer/etraxfs_timer.c    | 14 +++++++-------
 hw/timer/grlib_gptimer.c    | 30 ++++++++++++++++++------------
 hw/timer/lm32_timer.c       | 19 ++++++++++++-------
 hw/timer/m48t59.c           | 39 ++++++++++++++++++++-------------------
 hw/timer/milkymist-sysctl.c | 21 +++++++++++++--------
 hw/timer/puv3_ost.c         | 18 +++++-------------
 hw/timer/slavio_timer.c     | 12 +++++-------
 hw/timer/tusb6010.c         | 23 ++++++++++++++++-------
 8 files changed, 96 insertions(+), 80 deletions(-)

-- 
2.1.4


