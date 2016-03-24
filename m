Received: by 10.25.208.211 with SMTP id h202csp534913lfg;
        Thu, 24 Mar 2016 03:34:49 -0700 (PDT)
X-Received: by 10.141.2.11 with SMTP id e11mr9918174qhd.69.1458815689613;
        Thu, 24 Mar 2016 03:34:49 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r79si5979779qkl.62.2016.03.24.03.34.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2016 03:34:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aj2bI-0004Eh-RU
	for alex.bennee@linaro.org; Thu, 24 Mar 2016 06:34:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aj2Yh-0007wq-NX
	for qemu-devel@nongnu.org; Thu, 24 Mar 2016 06:32:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1aj2Yd-0005cR-Lr
	for qemu-devel@nongnu.org; Thu, 24 Mar 2016 06:32:07 -0400
Received: from m12-16.163.com ([220.181.12.16]:34291)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1aj2Yc-0005W4-Ls; Thu, 24 Mar 2016 06:32:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=HD8QA9p7p58QzInUZJ
	yH7Id4aSIHUbXvogyoJ4lnzCE=; b=OQOlq1FGpVT3P2h0Pb8RIHNpXkwEs2EJMh
	Zdy6Tce2CfCyYrlAgmBgppaMUAw9Sg4Q+ekL8ZjJmVyaGmYti9d7Jwt35j9tX15b
	f5qLJdU52Xik7OlawkLzewmo4k98k13R+qwhesoa4o01AeslbuGLzsieo6A6CpDq
	cPM+W80Cs=
Received: from localhost.localdomain (unknown [101.254.142.162])
	by smtp12 (Coremail) with SMTP id EMCowEDpR1DcwfNWAMmNAA--.623S2;
	Thu, 24 Mar 2016 18:31:02 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Mar 2016 18:29:25 +0800
Message-Id: <1458815374-22279-1-git-send-email-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.1.4
X-CM-TRANSID: EMCowEDpR1DcwfNWAMmNAA--.623S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrJF1kJw18WF45ArW7KFy8Krg_yoWxWrb_KF
	WUCFyagr47Za98JFyxJrn5uFy0yw48tw1rJF9FqrW5Kry7XF1jyr1rCw45Wr1DZrsFyFW5
	ur4UJr4kJwsrXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8rOz3UUUUU==
X-Originating-IP: [101.254.142.162]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiMwc2xlXlfSdQoQAAsf
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.16
Cc: i.mitsyanko@gmail.com, peter.maydell@linaro.org, michael@walle.cc,
	qemu-arm@nongnu.org, hirofumi@mail.parknet.co.jp
Subject: [Qemu-devel] [PATCH 0/5] QOM'ify hw/display devices
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
X-TUID: 24E9IghP3GpB

This patch set trys to QOM'ify hw/display files, see commit messages
for more details

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


