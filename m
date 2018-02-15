Received: by 10.28.71.27 with SMTP id u27csp2941731wma;
        Thu, 15 Feb 2018 09:57:38 -0800 (PST)
X-Google-Smtp-Source: AH8x226yMwMIHPQ047+/Fv3owtNEq5VmRq/ZQpvXNa2D2NkUPor1TBmZ2HuLs0FyyCo3iwVQBWiK
X-Received: by 10.37.44.76 with SMTP id s73mr2656800ybs.156.1518717457940;
        Thu, 15 Feb 2018 09:57:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518717457; cv=none;
        d=google.com; s=arc-20160816;
        b=UE7a4IGQ01NWadb39tG2MRuNqgCjI/bvWU8U1g/g6ADij8DWkoluJZUUP9721rsJio
         tnXuEFnC0RbVLdEFBYn5RrthTi0B9Yi5KF09e+M/nWdDMTK8IPUo0aNQCCLZHYdRJhXE
         jOiPDHAqO3R0X3PxWAlJcIzYf0TFKecYvxMF9vGOrFpXH/2CE6YYljmy5jkz96bBvKb7
         oWE1RZghp625j5chxvzcde7od7yJgyIjTGM4DvGkDzg4+BVUDwDCP9Mo/8vUrvSNhoJm
         vMuE2osWqXh5dJpvl9zY/sRo0ioGSx0Ll0GrGC2ZeJMudedGHJyMJABcjRuLk53bx5sx
         cVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=x/oH7EQfYd0KYDVFpe2SsVViopOXBPeGvLjaQjLRVRQ=;
        b=SO/J8F6x4yy1hfrxsvuGyXB4K4EpKU8hmJcudZGQh8deEx+0Qsw46grhgCYEpErXOa
         vBYUfFcLEQ8Sa9b3rzYFnrfzwVxvmnXb5lvmOHuzNIQD+jCdMYaoqDQvdefHFPGYKsh/
         qbySIBZrUov3fzJ2R8+Ew/f8iBZrbBwap4RpPOQfk/6wtZcjEiLkNw4S+wl4T2TY9NbT
         3haypC7zUjpKO7g54/l7ZWI8IXlZ4gCm+0ki141+PQ9T/G2Ul3j1P70OAT84OWcWw2T4
         Z8babWuhv4YlAQLED7DU2qo6xbNzF+UdXV0LEwwUykS/iYgf5LAwfwoCq7ABuxF0GV1k
         V+uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v17si461001ywh.250.2018.02.15.09.57.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 09:57:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emNmr-0008LE-ET
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 12:57:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1emNmT-00082a-00
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 12:57:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1emNmS-0000Zx-BA
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 12:57:13 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46422)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1emNmS-0000Xo-3u; Thu, 15 Feb 2018 12:57:12 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1emNmQ-000215-JJ; Thu, 15 Feb 2018 17:57:10 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 15 Feb 2018 17:57:06 +0000
Message-Id: <20180215175707.15491-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180215175707.15491-1-peter.maydell@linaro.org>
References: <20180215175707.15491-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/3] hw/arm/armv7m: Honour CPU's address space
 for image loads
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
X-TUID: /pTUjqvSvXGo

Instead of loading guest images to the system address space, use the
CPU's address space.  This is important if we're trying to load the
file to memory or via an alias memory region that is provided by an
SoC object and thus not mapped into the system address space.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armv7m.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 56770a7048..facc536b07 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -270,6 +270,9 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
     uint64_t entry;
     uint64_t lowaddr;
     int big_endian;
+    AddressSpace *as;
+    int asidx;
+    CPUState *cs = CPU(cpu);
 
 #ifdef TARGET_WORDS_BIGENDIAN
     big_endian = 1;
@@ -282,11 +285,19 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
         exit(1);
     }
 
+    if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
+        asidx = ARMASIdx_S;
+    } else {
+        asidx = ARMASIdx_NS;
+    }
+    as = cpu_get_address_space(cs, asidx);
+
     if (kernel_filename) {
-        image_size = load_elf(kernel_filename, NULL, NULL, &entry, &lowaddr,
-                              NULL, big_endian, EM_ARM, 1, 0);
+        image_size = load_elf_as(kernel_filename, NULL, NULL, &entry, &lowaddr,
+                                 NULL, big_endian, EM_ARM, 1, 0, as);
         if (image_size < 0) {
-            image_size = load_image_targphys(kernel_filename, 0, mem_size);
+            image_size = load_image_targphys_as(kernel_filename, 0,
+                                                mem_size, as);
             lowaddr = 0;
         }
         if (image_size < 0) {
-- 
2.16.1

