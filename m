Received: by 10.25.21.156 with SMTP id 28csp1673445lfv;
        Tue, 19 Jul 2016 08:57:04 -0700 (PDT)
X-Received: by 10.129.145.10 with SMTP id i10mr21969471ywg.263.1468943824560;
        Tue, 19 Jul 2016 08:57:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w127si2765610ywe.307.2016.07.19.08.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jul 2016 08:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56857 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bPXOJ-0006VV-UK
	for alex.bennee@linaro.org; Tue, 19 Jul 2016 11:57:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bPXOG-0006Tt-8a
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 11:57:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bPXOE-0003Bs-Ew
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 11:56:59 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58372)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bPXOE-0003Bj-6Z; Tue, 19 Jul 2016 11:56:58 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bPXOB-0002xP-Tl; Tue, 19 Jul 2016 16:56:55 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 19 Jul 2016 16:56:55 +0100
Message-Id: <1468943815-21092-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] disas/arm.c: Remove unused macro definitions
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p3pPD5Exp2gf

The macros ISSPACE, strneq, NUM_ELEMS and NUM_ARM_REGNAMES
are defined in disas/arm.c but never used. Remove the
unnecessary definitions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
A minor cleanup, mostly because I spotted the ISSPACE macro when
I was deleting the ATTRIBUTE_UNUSED macro that was next to it.

 disas/arm.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/disas/arm.c b/disas/arm.c
index 426270f..93c6503 100644
--- a/disas/arm.c
+++ b/disas/arm.c
@@ -24,7 +24,6 @@
 
 #include "qemu/osdep.h"
 #include "disas/bfd.h"
-#define ISSPACE(x) ((x) == ' ' || (x) == '\t' || (x) == '\n')
 
 #define ARM_EXT_V1	 0
 #define ARM_EXT_V2	 0
@@ -73,15 +72,6 @@ static void floatformat_to_double (unsigned char *data, double *dest)
 
 /* End of qemu specific additions.  */
 
-/* FIXME: Belongs in global header.  */
-#ifndef strneq
-#define strneq(a,b,n)	(strncmp ((a), (b), (n)) == 0)
-#endif
-
-#ifndef NUM_ELEM
-#define NUM_ELEM(a)     (sizeof (a) / sizeof (a)[0])
-#endif
-
 struct opcode32
 {
   unsigned long arch;		/* Architecture defining this insn.  */
@@ -1528,7 +1518,6 @@ static const char *const iwmmxt_cregnames[] =
 /* Default to GCC register name set.  */
 static unsigned int regname_selected = 1;
 
-#define NUM_ARM_REGNAMES  NUM_ELEM (regnames)
 #define arm_regnames      regnames[regname_selected].reg_names
 
 static bfd_boolean force_thumb = false;
-- 
1.9.1

