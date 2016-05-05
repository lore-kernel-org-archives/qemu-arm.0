Received: by 10.25.208.137 with SMTP id h131csp491818lfg;
        Wed, 4 May 2016 20:07:31 -0700 (PDT)
X-Received: by 10.28.56.69 with SMTP id f66mr642105wma.97.1462417649800;
        Wed, 04 May 2016 20:07:29 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id vy5si8694125wjc.182.2016.05.04.20.07.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 20:07:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ay9dA-0001k0-GP
	for alex.bennee@linaro.org; Wed, 04 May 2016 23:07:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay9cX-0000zC-BG
	for qemu-devel@nongnu.org; Wed, 04 May 2016 23:06:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ay9cK-0002G8-DI
	for qemu-devel@nongnu.org; Wed, 04 May 2016 23:06:27 -0400
Received: from m12-12.163.com ([220.181.12.12]:48197)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1ay9cI-00025k-JZ; Wed, 04 May 2016 23:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=l2U4swMnEB0nX1tZ2y
	d6uvlxBZIwy9B6xSZhxVLfpKk=; b=aFYC85Ds62wxrT/T/6uUUHQ6WEqnWIK0MQ
	dF7LDYnKWRMGKWWJ2twpSoyorxWtrVpge13hZAV/XnOQMVT8sWY7yTdHSOwYmnzM
	ekF+rIUwGo2OSFFhlUCwKC3Rik+hpxfrrIEhA8tCBoQHwZbIZxNZFTW87sHpyc/T
	Ai4TRVH4U=
Received: from localhost.localdomain (unknown [118.187.28.42])
	by smtp8 (Coremail) with SMTP id DMCowABXJrdyuCpXst8DBg--.1983S2;
	Thu, 05 May 2016 11:05:46 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu,  5 May 2016 11:04:44 +0800
Message-Id: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
X-CM-TRANSID: DMCowABXJrdyuCpXst8DBg--.1983S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrGw18Ww47Jw17KrWkXw1kZrb_yoWxWrc_KF
	WUCFyagr47Za98JFyxJrn5uFy0yw48tw1rJF9FqrW5Kry7XF1jyr1rCw45Wr1DZrsFyFW5
	ur4UJr4kJwsxXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0pnQUUUUUU==
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEgtgxlZXxm3+mgAAsx
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.12
Subject: [Qemu-devel] [PATCH RESEND 0/5] QOM'ify hw/display devices
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
Cc: i.mitsyanko@gmail.com, michael@walle.cc, qemu-arm@nongnu.org,
	hirofumi@mail.parknet.co.jp
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tyEFM0ElxqJT

This patch set trys to QOM'ify hw/display files, see commit messages
for more details.

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
 hw/display/pl110.c           | 19 +++++++++----------
 5 files changed, 56 insertions(+), 40 deletions(-)

-- 
2.1.4


