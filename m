Received: by 10.80.163.71 with SMTP id 65csp351443edn;
        Wed, 28 Sep 2016 05:59:08 -0700 (PDT)
X-Received: by 10.55.75.145 with SMTP id y139mr33285870qka.26.1475067548248;
        Wed, 28 Sep 2016 05:59:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w3si5153010qkc.12.2016.09.28.05.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Sep 2016 05:59:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bpES3-0000o6-Mf
	for alex.bennee@linaro.org; Wed, 28 Sep 2016 08:59:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>) id 1bpCLZ-0005sV-BP
	for qemu-arm@nongnu.org; Wed, 28 Sep 2016 06:44:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>) id 1bpCLW-00078h-N5
	for qemu-arm@nongnu.org; Wed, 28 Sep 2016 06:44:17 -0400
Received: from li2-213.members.linode.com ([69.56.173.213]:42334
	helo=mail.zilogic.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>) id 1bpCLW-00075S-I6
	for qemu-arm@nongnu.org; Wed, 28 Sep 2016 06:44:14 -0400
Received: from toad.zilogic (unknown [49.206.122.236])
	by mail.zilogic.com (Postfix) with ESMTP id 339161058B;
	Wed, 28 Sep 2016 06:44:05 -0400 (EDT)
From: Vijay Kumar B <vijaykumar@zilogic.com>
To: qemu-arm@nongnu.org
Date: Wed, 28 Sep 2016 16:13:50 +0530
Message-Id: <1475059431-6885-2-git-send-email-vijaykumar@zilogic.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1475059431-6885-1-git-send-email-vijaykumar@zilogic.com>
References: <1475059431-6885-1-git-send-email-vijaykumar@zilogic.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.56.173.213
X-Mailman-Approved-At: Wed, 28 Sep 2016 08:55:13 -0400
Subject: [Qemu-arm] [PATCH 1/2] mainstone: Fix incorrect key mapping for
 Enter key.
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
X-TUID: 0X2HQve44qm2

According to the manual the (5, 5) corresponds to backspace key, and
not Enter key. Linux kernel maps (5, 4) to the enter key. Fixing it up
to match the mapping in the Linux kernel.

Signed-off-by: Vijay Kumar B. <vijaykumar@zilogic.com>
Reviewed-by: Deepak S. <deepak@zilogic.com>
---
 hw/arm/mainstone.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 454acc5..e81b878 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -88,7 +88,7 @@ static const struct keymap map[0xE0] = {
      * Matrix position {5,4} and other keys are missing here.
      * TODO: Compare with Linux code and test real hardware.
      */
-    [0x1c] = {5,5}, /* enter (TODO: might be wrong) */
+    [0x1c] = {5,4}, /* enter */
     [0xc8] = {6,0}, /* up */
     [0xd0] = {6,1}, /* down */
     [0xcb] = {6,2}, /* left */
-- 
2.1.4

