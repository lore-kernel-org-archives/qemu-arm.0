Received: by 10.80.163.71 with SMTP id 65csp352152edn;
        Wed, 28 Sep 2016 06:00:43 -0700 (PDT)
X-Received: by 10.55.19.228 with SMTP id 97mr20354099qkt.238.1475067643067;
        Wed, 28 Sep 2016 06:00:43 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33si5103061qkr.272.2016.09.28.06.00.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Sep 2016 06:00:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58646 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bpETa-0001kN-FM
	for alex.bennee@linaro.org; Wed, 28 Sep 2016 09:00:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>) id 1bpDHr-0005ba-P5
	for qemu-devel@nongnu.org; Wed, 28 Sep 2016 07:44:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>) id 1bpDHp-0002wV-Nm
	for qemu-devel@nongnu.org; Wed, 28 Sep 2016 07:44:30 -0400
Received: from li2-213.members.linode.com ([69.56.173.213]:49415
	helo=mail.zilogic.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>)
	id 1bpDHn-0002u6-5Z; Wed, 28 Sep 2016 07:44:27 -0400
Received: from toad.zilogic (unknown [49.206.122.236])
	by mail.zilogic.com (Postfix) with ESMTP id 269481058B;
	Wed, 28 Sep 2016 07:44:18 -0400 (EDT)
From: Vijay Kumar B <vijaykumar@zilogic.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Sep 2016 17:13:52 +0530
Message-Id: <1475063033-8176-2-git-send-email-vijaykumar@zilogic.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1475063033-8176-1-git-send-email-vijaykumar@zilogic.com>
References: <1475063033-8176-1-git-send-email-vijaykumar@zilogic.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.56.173.213
X-Mailman-Approved-At: Wed, 28 Sep 2016 08:55:20 -0400
Subject: [Qemu-devel] [PATCH 1/2] mainstone: Fix incorrect key mapping for
 Enter key.
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
Cc: qemu-arm@nongnu.org, Vijay Kumar B <vijaykumar@zilogic.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BJ9CU98s1sZK

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

