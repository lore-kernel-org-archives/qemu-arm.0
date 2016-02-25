Received: by 10.25.208.211 with SMTP id h202csp2730484lfg;
        Thu, 25 Feb 2016 02:35:08 -0800 (PST)
X-Received: by 10.140.94.46 with SMTP id f43mr54411207qge.95.1456396508200;
        Thu, 25 Feb 2016 02:35:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z18si7481352qhz.46.2016.02.25.02.35.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 02:35:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:41975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYtGF-0002Co-N2
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 05:35:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYtEN-0007Dv-1x
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 05:33:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aYtEI-0001kC-IQ
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 05:33:10 -0500
Received: from m12-14.163.com ([220.181.12.14]:54884)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aYtEG-0001ik-5S; Thu, 25 Feb 2016 05:33:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=cTFC2VX50xx2nOrrBj
	5qYGqMPBqJ6pEJziL2/q6+MDU=; b=RElgSH+oqVeyjbbKKZBJDEx6lmUA/lbKis
	zAgEN00U53ORiJ9spjok4l+VVXTUvU/UHLJFKcJ/G2kGHCwKL9GSM1Ilf1vNhnvI
	eCTb7lGUG94y6HlRKj0FR96aGY5yYDr+OCrCDXhW7Dl4lwM9fLmHKHu5+SBcjwpZ
	jCcMpxoRQ=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp10 (Coremail) with SMTP id DsCowAB3JtoL2M5WrXOWCA--.37006S2;
	Thu, 25 Feb 2016 18:31:51 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu, 25 Feb 2016 18:30:28 +0800
Message-Id: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
X-CM-TRANSID: DsCowAB3JtoL2M5WrXOWCA--.37006S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw17WF1xJr4kWFyUXrWDJwb_yoW8Ww4xpr
	WfCF43Zr48Aw43Ww43CFsFqry5JF1kJryrWwnrt34rZrnIyF15JF1UXF4rJFW7JFZ7ZF43
	ZFyrtr15Gw1Yvr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8o7NUUUUU=
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiEBgaxlWBT2U2GwAAsH
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.14
Cc: peter.maydell@linaro.org, i.mitsyanko@gmail.com,
	mark.cave-ayland@ilande.co.uk, michael@walle.cc,
	qemu-arm@nongnu.org, gxt@mprc.pku.edu.cn, afaerber@suse.de
Subject: [Qemu-arm] [PATCH v5 0/8] QOM'ify hw/timer/*
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ddNFUi3Kj4EA

This patch series QOM'ify timer code under hw/timer directory.
Main idea is to split the initfn's work, some to TypeInfo.instance_init
and some is placed in DeviceClass::realize.
Drop the use of SysBusDeviceClass::init if possible.

Patch 3,4 (m48t59) has been tested in a sparc vm with debian linux guest
and savevm/loadvm looks fine.

Comments from the relevant maintainers are needed!

changes in v5:
* drop patch 'hw/timer: QOM'ify tusb6010'
* fix minor errors in grlib_gptimer.c
* correct the usage of vmstate for M48txxISAState and M48txxSysBusState


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


xiaoqiang zhao (8):
  hw/timer: QOM'ify etraxfs_timer
  hw/timer: QOM'ify lm32_timer
  hw/timer: QOM'ify m48txx_sysbus (pass 1)
  hw/timer: QOM'ify m48txx_sysbus (pass 2)
  hw/timer: QOM'ify milkymist_sysctl
  hw/timer: QOM'ify puv3_ost
  hw/timer: QOM'ify slavio_timer
  hw/timer: QOM'ify grlib_gptimer

 hw/timer/etraxfs_timer.c    | 14 +++++------
 hw/timer/grlib_gptimer.c    | 32 ++++++++++++++----------
 hw/timer/lm32_timer.c       | 19 +++++++++------
 hw/timer/m48t59.c           | 59 ++++++++++++++++++++++++++++++---------------
 hw/timer/milkymist-sysctl.c | 21 ++++++++++------
 hw/timer/puv3_ost.c         | 18 ++++----------
 hw/timer/slavio_timer.c     | 12 ++++-----
 7 files changed, 101 insertions(+), 74 deletions(-)

-- 
2.1.4


