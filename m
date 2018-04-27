Received: by 10.28.4.212 with SMTP id 203csp1036425wme;
        Fri, 27 Apr 2018 10:36:30 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpz9Erk8eJDRAmXonvkn2upktPYDTflEcTXdUcLCxR66n5V+8JEU/mv87vtgNRaau5rxlEe
X-Received: by 2002:ac8:2a19:: with SMTP id k25-v6mr1915964qtk.333.1524850590290;
        Fri, 27 Apr 2018 10:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524850590; cv=none;
        d=google.com; s=arc-20160816;
        b=ikwWX5vbaQO9HW3yJglb4YheAwWo6LfPMeeDREraUrXlQOaeqflzzW1JiouBmOzTi8
         zM/tau/qRLDiHc7fLAPpWDiseHjGbDafB1M5GEo6A+mnQmF3wc6RJ7qI7DKgQJYiBJtJ
         7kHXCypY/+2q6WVz1J6uMdBgv4p+/WhRENXIZKb0C6zZFY0YyMkCnesgryamnvnWLsnM
         TqHMTx7RAUE8MkE2gXyqRRI6KlTSaQhTMvHDmBIOhTMqhvaYuyO5WNXMYjqilZ0Ayd3x
         Y/NpZzpVxZw1n+njZPUdxFOri+573ZasfsxoVQSvLmA0plBbHGzWfDZgk+u7EvnFVY8l
         3ZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=N1B0bW5TbxKDdqAbPa4IVOJDhoo0iPRvgdWYp+YhJzw=;
        b=LQSC145AhO/HMvkUBTfFg4DbFpV/PT0E4k4CXK9x1QWZx16odo/j3wsMhmtPUnpQe4
         IuXKwoTz06LA745a7k5dz5LvW8JXwiWtyPvbS0SvQLvE0/LkiyOerXXZ8AnQX3u5KBfk
         tqpHwcy/DfJIVO/rL9SfAM2297u9YfDMLtA5WC1vWjJv/13QBUp5zQZfexpughO1Lnsf
         0pnY9xP0A4k2G3hIJixm/LxzupCEuy/MoOVIXbrZmFSdQ8Szk+GjhNmbilolHPre/g7W
         dAeIK1ZjSKBaVTL9sIGUP/LJsrFxw5KVOZRuSSkSOOKSnyRHfCOpnpgSrBstFwj7YC8m
         uBxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si1843695qkc.41.2018.04.27.10.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 10:36:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fC7IL-0004VP-Qk
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 13:36:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fC7I8-0004UK-Al
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 13:36:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fC7I7-0007sS-E1
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 13:36:16 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:41196)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fC7I7-0007qu-6x; Fri, 27 Apr 2018 13:36:15 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fC7I5-0001WU-Hk; Fri, 27 Apr 2018 18:36:13 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 27 Apr 2018 18:36:11 +0100
Message-Id: <20180427173611.10281-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180427173611.10281-1-peter.maydell@linaro.org>
References: <20180427173611.10281-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/2] hw/net/smc91c111: Convert away from old_mmio
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
X-TUID: gGYv9IenZShz

Convert the smc91c111 device away from using the old_mmio field of
MemoryRegionOps. This device is used by several Arm board models.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/smc91c111.c | 54 +++++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 29 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 3b16dcf5a1..c8cc5379b7 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -625,37 +625,33 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
     return 0;
 }
 
-static void smc91c111_writew(void *opaque, hwaddr offset,
-                             uint32_t value)
+static uint64_t smc91c111_readfn(void *opaque, hwaddr addr, unsigned size)
 {
-    smc91c111_writeb(opaque, offset, value & 0xff);
-    smc91c111_writeb(opaque, offset + 1, value >> 8);
+    int i;
+    uint32_t val = 0;
+
+    for (i = 0; i < size; i++) {
+        val |= smc91c111_readb(opaque, addr + i) << (i * 8);
+    }
+    return val;
 }
 
-static void smc91c111_writel(void *opaque, hwaddr offset,
-                             uint32_t value)
+static void smc91c111_writefn(void *opaque, hwaddr addr,
+                               uint64_t value, unsigned size)
 {
+    int i = 0;
+
     /* 32-bit writes to offset 0xc only actually write to the bank select
-       register (offset 0xe)  */
-    if (offset != 0xc)
-        smc91c111_writew(opaque, offset, value & 0xffff);
-    smc91c111_writew(opaque, offset + 2, value >> 16);
-}
+     * register (offset 0xe), so skip the first two bytes we would write.
+     */
+    if (addr == 0xc && size == 4) {
+        i += 2;
+    }
 
-static uint32_t smc91c111_readw(void *opaque, hwaddr offset)
-{
-    uint32_t val;
-    val = smc91c111_readb(opaque, offset);
-    val |= smc91c111_readb(opaque, offset + 1) << 8;
-    return val;
-}
-
-static uint32_t smc91c111_readl(void *opaque, hwaddr offset)
-{
-    uint32_t val;
-    val = smc91c111_readw(opaque, offset);
-    val |= smc91c111_readw(opaque, offset + 2) << 16;
-    return val;
+    for (; i < size; i++) {
+        smc91c111_writeb(opaque, addr + i,
+                         extract32(value, i * 8, 8));
+    }
 }
 
 static int smc91c111_can_receive_nc(NetClientState *nc)
@@ -747,10 +743,10 @@ static const MemoryRegionOps smc91c111_mem_ops = {
     /* The special case for 32 bit writes to 0xc means we can't just
      * set .impl.min/max_access_size to 1, unfortunately
      */
-    .old_mmio = {
-        .read = { smc91c111_readb, smc91c111_readw, smc91c111_readl, },
-        .write = { smc91c111_writeb, smc91c111_writew, smc91c111_writel, },
-    },
+    .read = smc91c111_readfn,
+    .write = smc91c111_writefn,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.17.0

