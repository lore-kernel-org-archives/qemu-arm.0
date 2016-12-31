Received: by 10.25.205.13 with SMTP id d13csp7513560lfg;
        Fri, 30 Dec 2016 17:30:49 -0800 (PST)
X-Received: by 10.200.44.217 with SMTP id 25mr41188500qtx.176.1483147849189;
        Fri, 30 Dec 2016 17:30:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u58si35747215qtu.155.2016.12.30.17.30.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Dec 2016 17:30:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42176 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cN8VU-0002hz-MT
	for alex.bennee@linaro.org; Fri, 30 Dec 2016 20:30:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1cN8JX-0000yx-3A
	for qemu-devel@nongnu.org; Fri, 30 Dec 2016 20:18:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1cN8JW-0008WS-Ap
	for qemu-devel@nongnu.org; Fri, 30 Dec 2016 20:18:27 -0500
Received: from m12-14.163.com ([220.181.12.14]:44265)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1cN8JV-0008V1-Nl; Fri, 30 Dec 2016 20:18:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=jc+/Lqdsc06vMQQN59
	md3I11oeWzEIfC5e/fiF9gjO4=; b=PJIASvXZ/8Bqvl0LBKvy6i0DcNyF3ULt6g
	llZtcqTCTKFWPH/UBU3QCKiyBhpLvD+GNuqYF6hYdYgs8rNKTLWhncvh3GtdbG/G
	+uOOUgxHdZ55q29xDnN7HjcO73hNbwRpb4oQz0Kw01MlkN1xh09smOVr4IU+HNY+
	2fe8XsUvQ=
Received: from localhost.localdomain (unknown [223.104.3.243])
	by smtp10 (Coremail) with SMTP id DsCowACnzZpQB2dYbQqVFw--.11118S2;
	Sat, 31 Dec 2016 09:18:15 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Sat, 31 Dec 2016 09:18:06 +0800
Message-Id: <20161231011808.4037-1-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.11.0
X-CM-TRANSID: DsCowACnzZpQB2dYbQqVFw--.11118S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU31CJUUUUU
X-Originating-IP: [223.104.3.243]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiTBdRxlSISghVbAAAsr
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 220.181.12.14
Subject: [Qemu-devel] [PATCH 0/2] QOM'ify work for char devices
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
Cc: i.mitsyanko@gmail.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
	chouteau@adacore.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gTCzYMXpCu8h

This patch set finish QOM'ify work of char devices.
See each commit message for details.

xiaoqiang zhao (2):
  hw/char: QOM'ify exynos4210_uart.c
  hw/char: QOM'ify grlib_apbuart.c

 hw/char/exynos4210_uart.c | 16 ++++++++++------
 hw/char/grlib_apbuart.c   | 26 +++++++++++++++-----------
 2 files changed, 25 insertions(+), 17 deletions(-)

-- 
2.11.0


