Received: by 10.80.163.71 with SMTP id 65csp351425edn;
        Wed, 28 Sep 2016 05:59:04 -0700 (PDT)
X-Received: by 10.237.33.111 with SMTP id 102mr33436309qtc.56.1475067544876;
        Wed, 28 Sep 2016 05:59:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a72si5095858qkg.290.2016.09.28.05.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Sep 2016 05:59:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58621 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bpES0-0000l9-9P
	for alex.bennee@linaro.org; Wed, 28 Sep 2016 08:59:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>) id 1bpCLZ-0005sU-BO
	for qemu-arm@nongnu.org; Wed, 28 Sep 2016 06:44:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>) id 1bpCLU-00077e-C3
	for qemu-arm@nongnu.org; Wed, 28 Sep 2016 06:44:17 -0400
Received: from li2-213.members.linode.com ([69.56.173.213]:42331
	helo=mail.zilogic.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>) id 1bpCLU-00073G-70
	for qemu-arm@nongnu.org; Wed, 28 Sep 2016 06:44:12 -0400
Received: from toad.zilogic (unknown [49.206.122.236])
	by mail.zilogic.com (Postfix) with ESMTP id AF34B1057B;
	Wed, 28 Sep 2016 06:44:01 -0400 (EDT)
From: Vijay Kumar B <vijaykumar@zilogic.com>
To: qemu-arm@nongnu.org
Date: Wed, 28 Sep 2016 16:13:49 +0530
Message-Id: <1475059431-6885-1-git-send-email-vijaykumar@zilogic.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.56.173.213
X-Mailman-Approved-At: Wed, 28 Sep 2016 08:55:13 -0400
Subject: [Qemu-arm] [PATCH 0/2] mainstone: Fix incorrect and missed out
 keypad mappings.
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
Cc: balrogg@gmail.com, Vijay Kumar B <vijaykumar@zilogic.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +LkkMaB8n9AA

This patch series fixes the key mappings for the mainstone board. The
incorrect mappings renders the console unusable when used with the
Linux kernel's fbcon driver.

Vijay Kumar B (2):
  Fix incorrect key mapping for Enter key.
  Add mapping for dot, slash and backspace.

 hw/arm/mainstone.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.1.4

