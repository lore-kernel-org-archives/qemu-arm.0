Received: by 10.25.208.194 with SMTP id h185csp92734lfg;
        Thu, 21 Apr 2016 03:43:14 -0700 (PDT)
X-Received: by 10.140.106.11 with SMTP id d11mr16148586qgf.80.1461235394804;
        Thu, 21 Apr 2016 03:43:14 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q140si21594qke.152.2016.04.21.03.43.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Apr 2016 03:43:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38827 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atC4o-00040j-Cx
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 06:43:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylvain@iCladMac.local>) id 1atC3o-0002nL-Q7
	for qemu-devel@nongnu.org; Thu, 21 Apr 2016 06:42:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sylvain@iCladMac.local>) id 1atC3o-0004KL-22
	for qemu-devel@nongnu.org; Thu, 21 Apr 2016 06:42:12 -0400
Received: from plr75-1-82-226-218-68.fbx.proxad.net ([82.226.218.68]:49884
	helo=iCladMac.local) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sylvain@iCladMac.local>)
	id 1atC3i-0004JM-5z; Thu, 21 Apr 2016 06:42:06 -0400
Received: by iCladMac.local (Postfix, from userid 501)
	id 332D21F36FAB; Wed, 20 Apr 2016 23:36:00 +0200 (CEST)
From: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Date: Wed, 20 Apr 2016 23:35:28 +0200
Message-Id: <1461188128-1107-1-git-send-email-sylvain@sylvaingarrigues.com>
X-Mailer: git-send-email 2.8.1
X-detected-operating-system: by eggs.gnu.org: Mac OS X  [generic]
X-Received-From: 82.226.218.68
Subject: [Qemu-devel] [PATCH] Fix the ARM bootloader so that r0 is always 0
 before jumping to the kernel entry point
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
Cc: Sylvain Garrigues <sylvain@sylvaingarrigues.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OYXOO0R6t9wx

Signed-off-by: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
---
 hw/arm/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 5975fbf..5876945 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -68,7 +68,7 @@ static const ARMInsnFixup bootloader_aarch64[] = {
  */
 
 static const ARMInsnFixup bootloader[] = {
-    { 0xe28fe008 }, /* add     lr, pc, #8 */
+    { 0xe28fe004 }, /* add     lr, pc, #4 */
     { 0xe51ff004 }, /* ldr     pc, [pc, #-4] */
     { 0, FIXUP_BOARD_SETUP },
 #define BOOTLOADER_NO_BOARD_SETUP_OFFSET 3
-- 
2.8.1

