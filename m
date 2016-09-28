Received: by 10.80.163.71 with SMTP id 65csp355411edn;
        Wed, 28 Sep 2016 06:06:43 -0700 (PDT)
X-Received: by 10.55.138.66 with SMTP id m63mr33756156qkd.159.1475068003333;
        Wed, 28 Sep 2016 06:06:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f123si5117740qkd.299.2016.09.28.06.06.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Sep 2016 06:06:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58699 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bpEZO-00084B-O0
	for alex.bennee@linaro.org; Wed, 28 Sep 2016 09:06:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>) id 1bpDHp-0005aq-71
	for qemu-arm@nongnu.org; Wed, 28 Sep 2016 07:44:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>) id 1bpDHo-0002vr-Bj
	for qemu-arm@nongnu.org; Wed, 28 Sep 2016 07:44:29 -0400
Received: from li2-213.members.linode.com ([69.56.173.213]:49425
	helo=mail.zilogic.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijaykumar@zilogic.com>)
	id 1bpDHo-0002uS-3j; Wed, 28 Sep 2016 07:44:28 -0400
Received: from toad.zilogic (unknown [49.206.122.236])
	by mail.zilogic.com (Postfix) with ESMTP id 570371058C;
	Wed, 28 Sep 2016 07:44:22 -0400 (EDT)
From: Vijay Kumar B <vijaykumar@zilogic.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Sep 2016 17:13:53 +0530
Message-Id: <1475063033-8176-3-git-send-email-vijaykumar@zilogic.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1475063033-8176-1-git-send-email-vijaykumar@zilogic.com>
References: <1475063033-8176-1-git-send-email-vijaykumar@zilogic.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.56.173.213
X-Mailman-Approved-At: Wed, 28 Sep 2016 08:55:13 -0400
Subject: [Qemu-arm] [PATCH 2/2] mainstone: Add mapping for dot,
 slash and backspace.
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
Cc: qemu-arm@nongnu.org, balrogg@gmail.com,
	Vijay Kumar B <vijaykumar@zilogic.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0x/p/f2yz7SV

Add missed out mappings. These mappings are from the "Intel PXA27x
Processor Developer's Kit User Guide".

Signed-off-by: Vijay Kumar B. <vijaykumar@zilogic.com>
Reviewed-by: Deepak S. <deepak@zilogic.com>
---
 hw/arm/mainstone.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index e81b878..f962236 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -73,8 +73,10 @@ static const struct keymap map[0xE0] = {
     [0x2f] = {3,3}, /* v */
     [0x11] = {3,4}, /* w */
     [0x2d] = {3,5}, /* x */
+    [0x34] = {4,0}, /* . */
     [0x15] = {4,2}, /* y */
     [0x2c] = {4,3}, /* z */
+    [0x35] = {4,4}, /* / */
     [0xc7] = {5,0}, /* Home */
     [0x2a] = {5,1}, /* shift */
     /*
@@ -89,6 +91,7 @@ static const struct keymap map[0xE0] = {
      * TODO: Compare with Linux code and test real hardware.
      */
     [0x1c] = {5,4}, /* enter */
+    [0x0e] = {5,5}, /* backspace */
     [0xc8] = {6,0}, /* up */
     [0xd0] = {6,1}, /* down */
     [0xcb] = {6,2}, /* left */
-- 
2.1.4

