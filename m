Received: by 10.25.208.137 with SMTP id h131csp213986lfg;
        Fri, 6 May 2016 04:03:57 -0700 (PDT)
X-Received: by 10.28.18.81 with SMTP id 78mr8239280wms.59.1462532637164;
        Fri, 06 May 2016 04:03:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q145si10041807wme.41.2016.05.06.04.03.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 May 2016 04:03:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aydXn-00073G-M4
	for alex.bennee@linaro.org; Fri, 06 May 2016 07:03:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aydXY-0006aA-CO
	for qemu-arm@nongnu.org; Fri, 06 May 2016 07:03:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aydXM-0001tT-CV
	for qemu-arm@nongnu.org; Fri, 06 May 2016 07:03:18 -0400
Received: from m12-16.163.com ([220.181.12.16]:50792)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aydX0-0001eK-Cw; Fri, 06 May 2016 07:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=ZZJgTI3GvBe/tPS0Fr
	JVX6Lv3gtQ8l+liKLauycJurE=; b=OANsmSx326P7jHK3q0tOZkHbVHGLz9S8Rx
	VCesYIbIdVXR2QMOCB0IWCHwLiIX8abbOAQ8m435OJJmi4OQ30DsgTv9w5Wo8skf
	6eG/t/tvFZjzAkWciUp7NTBwL/hzP+mQqDN7qAAsK/KVZxPgNwX7RwdtAz0ZEHLQ
	K6jpzW44M=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp12 (Coremail) with SMTP id EMCowACXRsM7eSxXsYpAAA--.18847S2;
	Fri, 06 May 2016 19:01:55 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 May 2016 18:59:30 +0800
Message-Id: <1462532375-29264-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
X-CM-TRANSID: EMCowACXRsM7eSxXsYpAAA--.18847S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr4rXr45Jw1UXr1UZFWDArb_yoW3Arb_KF
	WUCFyagr42vF98tFyxJrn5uFy0qw40yw18JF9FqrW5Kry7Gr1UtF1rC3y5Wr1UZrsFkFy5
	Zr48Jr4kJwnrXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8NAw7UUUUU==
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOwNhxlXlTXqTVwAAsc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.16
Subject: [Qemu-arm] [PATCH v2 0/5] QOM'ify hw/display devices
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
Cc: peter.maydell@linaro.org, i.mitsyanko@gmail.com, armbru@redhat.com,
	michael@walle.cc, qemu-arm@nongnu.org, hirofumi@mail.parknet.co.jp
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /ZkfEHteQjUU

This patch set trys to QOM'ify hw/display files, see commit messages
for more details.

v1 -> v2:
 * fix a version variable override problem in pl110.c
 * remove the trailing punctuation in error_setg message

xiaoqiang zhao (5):
  hw/display: QOM'ify exynos4210_fimd.c
  hw/display: QOM'ify jazz_led.c
  hw/display: QOM'ify milkymist-tmu2.c
  hw/display: QOM'ify milkymist-vgafb.c
  hw/display: QOM'ify pl110.c

 hw/display/exynos4210_fimd.c | 19 ++++++++++++-------
 hw/display/jazz_led.c        | 18 +++++++++++-------
 hw/display/milkymist-tmu2.c  | 24 ++++++++++++++----------
 hw/display/milkymist-vgafb.c | 16 ++++++++++------
 hw/display/pl110.c           | 29 +++++++++++++++--------------
 5 files changed, 62 insertions(+), 44 deletions(-)

-- 
2.1.4


