Received: by 10.80.166.35 with SMTP id d32csp2123874edc;
        Sun, 23 Oct 2016 02:19:58 -0700 (PDT)
X-Received: by 10.55.166.77 with SMTP id p74mr515513qke.113.1477214398009;
        Sun, 23 Oct 2016 02:19:58 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j190si7444140qkd.277.2016.10.23.02.19.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 23 Oct 2016 02:19:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@163.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40262 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byEwf-0008GZ-F1
	for alex.bennee@linaro.org; Sun, 23 Oct 2016 05:19:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1byEvi-0008GA-Ba
	for qemu-devel@nongnu.org; Sun, 23 Oct 2016 05:18:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1byEvd-0002bm-Jx
	for qemu-devel@nongnu.org; Sun, 23 Oct 2016 05:18:58 -0400
Received: from m12-11.163.com ([220.181.12.11]:39478)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1byEvc-0002ac-I4; Sun, 23 Oct 2016 05:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=jkZlEGqyhXWajDtXHd
	54MbvxcprrNN+h7GokGmwluDw=; b=AmCw2SJUlDNNLN5QW0nGuwYT5hyuu0Okku
	pXs/H3Gz7nnXzDi5rWrmfbXM0BtNK3H43Dq/38AdeMfmZkHISpLJS2jI3/LyGJ5A
	XaorF8FE+RrFRWmcOU1qnIAkcktfjFpGnPDaeA+KN6rFpXQu8E+lnRq/9GWYzwY2
	6sC83/Y90=
Received: from debian.lan (unknown [114.111.167.207])
	by smtp7 (Coremail) with SMTP id C8CowACHR3FSgAxYG4EdBQ--.32654S2;
	Sun, 23 Oct 2016 17:18:20 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Date: Sun, 23 Oct 2016 17:18:12 +0800
Message-Id: <20161023091816.3839-1-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.9.3
X-CM-TRANSID: C8CowACHR3FSgAxYG4EdBQ--.32654S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUg9jjUUUUU
X-Originating-IP: [114.111.167.207]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbBEBAMxlUL+3wphQAAs-
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.11
Subject: [Qemu-devel] [PATCH 0/4] QOM'ify work for arm
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, jan.kiszka@web.de
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SP8h2rIWB0U3

Here is my QOM'ify work relate with arm.
See each commit for details.

xiaoqiang zhao (4):
  hw/arm: QOM'ify musicpal.c
  hw/arm: QOM'ify pxa2xx_gpio.c
  hw/arm: QOM'ify strongarm.c
  hw/display: QOM'ify pl110.c

 hw/arm/musicpal.c    | 88 +++++++++++++++++++++++++++-------------------------
 hw/arm/pxa2xx_gpio.c | 25 +++++++++------
 hw/arm/strongarm.c   | 15 ++++++---
 hw/display/pl110.c   |  9 ++----
 4 files changed, 73 insertions(+), 64 deletions(-)

-- 
2.9.3


