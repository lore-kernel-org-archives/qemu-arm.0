Received: by 10.25.21.96 with SMTP id l93csp1114848lfi;
        Fri, 24 Jun 2016 08:51:57 -0700 (PDT)
X-Received: by 10.55.23.225 with SMTP id 94mr5508705qkx.132.1466783517131;
        Fri, 24 Jun 2016 08:51:57 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j30si5327246qta.63.2016.06.24.08.51.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 08:51:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44437 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGTOe-0002kU-G8
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 11:51:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bGTMl-0001ds-Jq
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 11:50:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bGTMj-0004Mg-NE
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 11:49:58 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bGTMd-0004KG-2w; Fri, 24 Jun 2016 11:49:51 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bGTMV-0003lC-Ce; Fri, 24 Jun 2016 16:49:43 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 24 Jun 2016 16:49:40 +0100
Message-Id: <1466783381-29506-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1466783381-29506-1-git-send-email-peter.maydell@linaro.org>
References: <1466783381-29506-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 1/2] linux-user: Make semihosting heap/stack
 fields abi_ulongs
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	Tsung-Han Lin <tsunghan.tw@gmail.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gcPmp1X7VjTU

The fields in the TaskState heap_base, heap_limit and stack_base
are all guest addresses (representing the locations of the heap
and stack for the guest binary), so they should be abi_ulong
rather than uint32_t. (This only in practice affects ARM AArch64
since all the other semihosting implementations are 32-bit.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/qemu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 56f29c3..1b3b03b 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -111,10 +111,10 @@ typedef struct TaskState {
 #endif
 #if defined(TARGET_ARM) || defined(TARGET_M68K) || defined(TARGET_UNICORE32)
     /* Extra fields for semihosted binaries.  */
-    uint32_t heap_base;
-    uint32_t heap_limit;
+    abi_ulong heap_base;
+    abi_ulong heap_limit;
 #endif
-    uint32_t stack_base;
+    abi_ulong stack_base;
     int used; /* non zero if used */
     struct image_info *info;
     struct linux_binprm *bprm;
-- 
1.9.1

