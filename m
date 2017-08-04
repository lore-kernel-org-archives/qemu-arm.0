Received: by 10.25.221.202 with SMTP id w71csp2358435lfi;
        Fri, 4 Aug 2017 10:33:18 -0700 (PDT)
X-Received: by 10.55.138.67 with SMTP id m64mr3885689qkd.6.1501867997999;
        Fri, 04 Aug 2017 10:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501867997; cv=none;
        d=google.com; s=arc-20160816;
        b=rUYY1G+dkNl8x7ujk4aAOq3krQUj/VqnC8t+mi20MOj5OsUGakJDhR3PCDgVM3/zQU
         yi3WEUg0xddj4KrfLyqL4f14kmgB+aq9zu2fj7xDHWJJXn00r3fINIvl/RB/yE3rFa5c
         3gg273da8ozBzsSNsmktCelq+t2j7/o3rSB4NZ5Xoc1cOqO6CdudZuIV2+4ibIadmxLZ
         h7dalaPfsDg+GUuUNZiQmGYyuDVEEWHS+STQzB2WbBPtKFtjwcKGiwdglOFV5cN/SmFU
         sXopX0FpkAE/RKf3a3EYc6b/RxqtwXoR+nVlRYF+5FggP5o83ABYLWuaIKHgvzGNXxlG
         5kgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=53IrSyAhcN5j+8jvt4MYeo165wzW7cHXRCY6qQ+Fe+E=;
        b=nF9J1qeQbrdgbkrAyAySbErBaBEYPTJE0LkHfjr7OOq6iZs3oKeujz9aWESK1njRIt
         I6wpHFwtBP52edVNZqBQtFnpI9PAukDEGEzgJ4kWyrcH3zv54rrX+dDv3D1Yq4r2O5qb
         hsOxPPHW1MW/0PE2E3dvqPUlBdTtKbGOTiMUUHCoNfre68AFc11J1+Z/Xoun5S6OC9g6
         njFra9ehdcrzBtZDlkhWLVEO40swCf5Flghbvkuqy6TlKrZjl/iwHrNjhwBoLiU2ODf9
         henitYnp5sx1oeFclhxmA1dGO2mqtJkKytCLEx7CHQ9NpM4GfwFKAzFK1KkbceuCYQwq
         4PMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v66si2136273qkg.412.2017.08.04.10.33.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 10:33:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40477 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddgTL-0007Vn-7F
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 13:33:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgTF-0007To-5D
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:33:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgTE-0001jf-8m
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:33:09 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37805)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ddgTE-0001gy-17; Fri, 04 Aug 2017 13:33:08 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ddgHK-0006sG-Pd; Fri, 04 Aug 2017 18:20:50 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  4 Aug 2017 18:20:42 +0100
Message-Id: <1501867249-1924-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/8] memory.h: Move MemTxResult type to memattrs.h
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ofxnUc181sX4

Move the MemTxResult type to memattrs.h. We're going to want to
use it in cpu/qom.h, which doesn't want to include all of
memory.h. In practice MemTxResult and MemTxAttrs are pretty
closely linked since both are used for the new-style
read_with_attrs and write_with_attrs callbacks, so memattrs.h
is a reasonable home for this rather than creating a whole
new header file for it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memattrs.h | 10 ++++++++++
 include/exec/memory.h   | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index e601061..d4a1642 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -46,4 +46,14 @@ typedef struct MemTxAttrs {
  */
 #define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) { .unspecified = 1 })
 
+/* New-style MMIO accessors can indicate that the transaction failed.
+ * A zero (MEMTX_OK) response means success; anything else is a failure
+ * of some kind. The memory subsystem will bitwise-OR together results
+ * if it is synthesizing an operation from multiple smaller accesses.
+ */
+#define MEMTX_OK 0
+#define MEMTX_ERROR             (1U << 0) /* device returned an error */
+#define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
+typedef uint32_t MemTxResult;
+
 #endif
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 400dd44..1dcd312 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -112,16 +112,6 @@ static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
     n->end = end;
 }
 
-/* New-style MMIO accessors can indicate that the transaction failed.
- * A zero (MEMTX_OK) response means success; anything else is a failure
- * of some kind. The memory subsystem will bitwise-OR together results
- * if it is synthesizing an operation from multiple smaller accesses.
- */
-#define MEMTX_OK 0
-#define MEMTX_ERROR             (1U << 0) /* device returned an error */
-#define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
-typedef uint32_t MemTxResult;
-
 /*
  * Memory region callbacks
  */
-- 
2.7.4

