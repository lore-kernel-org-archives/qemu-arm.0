Received: by 10.25.208.211 with SMTP id h202csp1236653lfg;
        Sun, 6 Mar 2016 23:08:40 -0800 (PST)
X-Received: by 10.55.48.80 with SMTP id w77mr26850884qkw.7.1457334520011;
        Sun, 06 Mar 2016 23:08:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w21si15680902qka.42.2016.03.06.23.08.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 23:08:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:53998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acpHT-0004Hn-9v
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 02:08:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGc-00033c-Sy
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1acpGa-0004FY-4f
	for qemu-devel@nongnu.org; Mon, 07 Mar 2016 02:07:46 -0500
Received: from m12-15.163.com ([220.181.12.15]:47937)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1acpGZ-0004Af-G8; Mon, 07 Mar 2016 02:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=qDdH/idYCkFFmjubYd
	gDXLD9l7BR9xj4ZWVVj1+M4cg=; b=V8wOkX+oGuIU4k+GLVwl8OXoHBGjEmt1aq
	oVgTh9r/L6Ln0VoYvghFig6NvEOaV9omK9ZEKSfVkXD50so9jmZ3ph14iDY/DzM7
	+dT9jd3BWy4HEmH/SGLc8AAAQmS0XW7nmsYJGW48TNFeUex+jOHAy28t0woC/VeJ
	WnRQE5EKc=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp11 (Coremail) with SMTP id D8CowED5XEaRKN1WjMdtAA--.46751S2;
	Mon, 07 Mar 2016 15:07:05 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 15:05:41 +0800
Message-Id: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
X-CM-TRANSID: D8CowED5XEaRKN1WjMdtAA--.46751S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr47Ar1ktry7JFyrKF1rZwb_yoWfKrgEqF
	W5uas8XryxuFyYgFySgF12vryUKr40vr1ktF1DWrW5JF17GryUJr15WrWrZr18XFs8Ary7
	XF45Jr48Ar1UXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0ldgJUUUUU==
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiFholxlWBPfCR5gAAsB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.15
Cc: robh@kernel.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [Qemu-devel] [PATCH 0/9] some QOM'ify work under hw/arm
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
X-TUID: wJMqQ4IyBBsz

This patch set trying to QOM'ify code under hw/arm directory.
As previous patches to hw/timer/*, we use instance_init instead of
the SysBus's init function. 


xiaoqiang zhao (9):
  hw/arm: QOM'ify armv7m.c
  hw/arm: QOM'ify highbank.c
  hw/arm: QOM'ify integratorcp.c
  hw/arm: QOM'ify pxa2xx.c
  hw/arm: QOM'ify pxa2xx_pic.c
  hw/arm: QOM'ify spitz.c
  hw/arm: QOM'ify stellaris.c
  hw/arm: QOM'ify strongarm.c
  hw/arm: QOM'ify versatilepb.c

 hw/arm/armv7m.c       | 11 ++++-----
 hw/arm/highbank.c     | 12 ++++------
 hw/arm/integratorcp.c | 32 ++++++++++---------------
 hw/arm/pxa2xx.c       | 26 +++++++++-----------
 hw/arm/pxa2xx_pic.c   |  7 ------
 hw/arm/spitz.c        | 23 +++++++-----------
 hw/arm/stellaris.c    | 48 ++++++++++++++++++-------------------
 hw/arm/strongarm.c    | 66 ++++++++++++++++++++++-----------------------------
 hw/arm/versatilepb.c  | 13 +++++-----
 9 files changed, 100 insertions(+), 138 deletions(-)

-- 
2.1.4


