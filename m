Received: by 10.25.208.211 with SMTP id h202csp1717463lfg;
        Tue, 1 Mar 2016 08:28:56 -0800 (PST)
X-Received: by 10.140.194.205 with SMTP id p196mr29513762qha.30.1456849736803;
        Tue, 01 Mar 2016 08:28:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 68si31127490qkv.24.2016.03.01.08.28.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 08:28:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aanAN-0003mb-Vd
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 11:28:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aan7B-0006ZJ-Rp
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 11:25:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aan7B-0005kc-0V
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 11:25:37 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56045)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aan71-0005bI-9J; Tue, 01 Mar 2016 11:25:27 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aan6s-0005o3-Iw; Tue, 01 Mar 2016 16:25:18 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 16:25:17 +0000
Message-Id: <1456849517-26240-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH] linux-user: x86_64: Don't use 16-bit UIDs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yvjCm/83X8GL

The 64-bit x86 syscall ABI uses 32-bit UIDs; only define
USE_UID16 for 32-bit x86.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/syscall_defs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 9e2b3c2..34af15a 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -55,7 +55,8 @@
 #define TARGET_IOC_NRBITS	8
 #define TARGET_IOC_TYPEBITS	8
 
-#if defined(TARGET_I386) || (defined(TARGET_ARM) && defined(TARGET_ABI32)) \
+#if (defined(TARGET_I386) && defined(TARGET_ABI32)) \
+    || (defined(TARGET_ARM) && defined(TARGET_ABI32)) \
     || defined(TARGET_SPARC) \
     || defined(TARGET_M68K) || defined(TARGET_SH4) || defined(TARGET_CRIS)
     /* 16 bit uid wrappers emulation */
-- 
1.9.1

