Received: by 10.25.21.96 with SMTP id l93csp1116454lfi;
        Fri, 24 Jun 2016 08:55:46 -0700 (PDT)
X-Received: by 10.55.119.66 with SMTP id s63mr5805273qkc.63.1466783746790;
        Fri, 24 Jun 2016 08:55:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u24si5324349qki.197.2016.06.24.08.55.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 08:55:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGTSM-0008GS-5L
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 11:55:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bGTMe-0001ZM-0c
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 11:49:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bGTMc-0004Kj-WB
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 11:49:51 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bGTMc-0004KG-OB; Fri, 24 Jun 2016 11:49:50 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bGTMV-0003lS-Qz; Fri, 24 Jun 2016 16:49:43 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 24 Jun 2016 16:49:41 +0100
Message-Id: <1466783381-29506-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1466783381-29506-1-git-send-email-peter.maydell@linaro.org>
References: <1466783381-29506-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/2] target-arm/arm-semi.c: Fix SYS_HEAPINFO for
 64-bit guests
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	Tsung-Han Lin <tsunghan.tw@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ftpca+qjIc2j

SYS_HEAPINFO is one of the few semihosting calls which has to write
values back into a parameter block in memory.  When we added
support for 64-bit semihosting we updated the code which reads from
the parameter block to read 64-bit words but forgot to change the
code that writes back into the block. Update it to treat the
block as a set of words of the appropriate width for the guest.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/arm-semi.c | 47 ++++++++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/target-arm/arm-semi.c b/target-arm/arm-semi.c
index 8be0645..d50726f 100644
--- a/target-arm/arm-semi.c
+++ b/target-arm/arm-semi.c
@@ -564,8 +564,10 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         }
     case TARGET_SYS_HEAPINFO:
         {
-            uint32_t *ptr;
+            target_ulong retvals[4];
             uint32_t limit;
+            int i;
+
             GET_ARG(0);
 
 #ifdef CONFIG_USER_ONLY
@@ -587,30 +589,33 @@ target_ulong do_arm_semihosting(CPUARMState *env)
                 ts->heap_limit = limit;
             }
 
-            ptr = lock_user(VERIFY_WRITE, arg0, 16, 0);
-            if (!ptr) {
-                /* FIXME - should this error code be -TARGET_EFAULT ? */
-                return (uint32_t)-1;
-            }
-            ptr[0] = tswap32(ts->heap_base);
-            ptr[1] = tswap32(ts->heap_limit);
-            ptr[2] = tswap32(ts->stack_base);
-            ptr[3] = tswap32(0); /* Stack limit.  */
-            unlock_user(ptr, arg0, 16);
+            retvals[0] = ts->heap_base;
+            retvals[1] = ts->heap_limit;
+            retvals[2] = ts->stack_base;
+            retvals[3] = 0; /* Stack limit.  */
 #else
             limit = ram_size;
-            ptr = lock_user(VERIFY_WRITE, arg0, 16, 0);
-            if (!ptr) {
-                /* FIXME - should this error code be -TARGET_EFAULT ? */
-                return (uint32_t)-1;
-            }
             /* TODO: Make this use the limit of the loaded application.  */
-            ptr[0] = tswap32(limit / 2);
-            ptr[1] = tswap32(limit);
-            ptr[2] = tswap32(limit); /* Stack base */
-            ptr[3] = tswap32(0); /* Stack limit.  */
-            unlock_user(ptr, arg0, 16);
+            retvals[0] = limit / 2;
+            retvals[1] = limit;
+            retvals[2] = limit; /* Stack base */
+            retvals[3] = 0; /* Stack limit.  */
 #endif
+
+            for (i = 0; i < ARRAY_SIZE(retvals); i++) {
+                bool fail;
+
+                if (is_a64(env)) {
+                    fail = put_user_u64(retvals[i], arg0 + i * 8);
+                } else {
+                    fail = put_user_u32(retvals[i], arg0 + i * 4);
+                }
+
+                if (fail) {
+                    /* Couldn't write back to argument block */
+                    return -1;
+                }
+            }
             return 0;
         }
     case TARGET_SYS_EXIT:
-- 
1.9.1

