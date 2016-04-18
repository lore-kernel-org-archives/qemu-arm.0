Received: by 10.25.208.194 with SMTP id h185csp1447757lfg;
        Mon, 18 Apr 2016 09:28:57 -0700 (PDT)
X-Received: by 10.55.154.129 with SMTP id c123mr13596651qke.63.1460996937421;
        Mon, 18 Apr 2016 09:28:57 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d107si19670510qga.46.2016.04.18.09.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Apr 2016 09:28:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:40751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1asC2i-0001UF-Bw
	for alex.bennee@linaro.org; Mon, 18 Apr 2016 12:28:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1asC20-0000T9-5Y
	for qemu-devel@nongnu.org; Mon, 18 Apr 2016 12:28:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1asC1z-0002jT-52
	for qemu-devel@nongnu.org; Mon, 18 Apr 2016 12:28:12 -0400
Received: from forward16h.cmail.yandex.net ([87.250.230.158]:36013)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1asC1s-0002ck-CI; Mon, 18 Apr 2016 12:28:04 -0400
Received: from smtp2h.mail.yandex.net (smtp2h.mail.yandex.net
	[IPv6:2a02:6b8:0:f05::116])
	by forward16h.cmail.yandex.net (Yandex) with ESMTP id 12BB6220E8;
	Mon, 18 Apr 2016 19:27:59 +0300 (MSK)
Received: from smtp2h.mail.yandex.net (localhost [127.0.0.1])
	by smtp2h.mail.yandex.net (Yandex) with ESMTP id 6790E170060C;
	Mon, 18 Apr 2016 19:27:59 +0300 (MSK)
Received: by smtp2h.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	lMzqhZks40-RwIi7s6M; Mon, 18 Apr 2016 19:27:58 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1460996878; bh=rKQ4TftsyCaX5y0/58o0mmdAny7QpQ8WlHrGVPwUQOw=;
	h=From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	b=Ew5UVYzWY4sCd/G/e9dtW3gmjPpngAxQzV7XhsOI/BjkZl0xZ0WKTVPgt63iBoBaN
	nrfFJkLLmifOk2LxMIlvcZDJ22e5WQFwuu+YS6ANlu9ebddEYvOTK4VqQvHEmUU7xB
	2Kt+wqVDwja64YzW1vsR6wx5Ryb9IWGDppPfr2N4=
Authentication-Results: smtp2h.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Mon, 18 Apr 2016 19:27:33 +0300
Message-Id: <1460996853-22117-1-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.250.230.158
Subject: [Qemu-devel] [PATCH v2] target-arm: Fix descriptor address masking
 in ARM address translation
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Sergey Sorokin <afarallax@yandex.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MpFYS/LZUGQD

There is a bug in ARM address translation regime with a long-descriptor
format. On the descriptor reading its address is formed from an index
which is a part of the input address. And on the first iteration this index
is incorrectly masked with 'grainsize' mask. But it can be wider according
to pseudo-code.
On the other hand on the iterations other than first the descriptor address
is formed from the previous level descriptor by masking with 'descaddrmask'
value. It always clears just 12 lower bits, but it must clear 'grainsize'
lower bits instead according to pseudo-code.
The patch fixes both cases.

Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
---
Fixed a comment before the calculation of 'descaddrmask' value.

 target-arm/helper.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 09638b2..9bf6f17 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7248,7 +7248,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     uint32_t tg;
     uint64_t ttbr;
     int ttbr_select;
-    hwaddr descaddr, descmask;
+    hwaddr descaddr, indexmask, indexmask_grainsize;
     uint32_t tableattrs;
     target_ulong page_size;
     uint32_t attrs;
@@ -7437,28 +7437,20 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         level = startlevel;
     }
 
-    /* Clear the vaddr bits which aren't part of the within-region address,
-     * so that we don't have to special case things when calculating the
-     * first descriptor address.
-     */
-    if (va_size != inputsize) {
-        address &= (1ULL << inputsize) - 1;
-    }
-
-    descmask = (1ULL << (stride + 3)) - 1;
+    indexmask_grainsize = (1ULL << (stride + 3)) - 1;
+    indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
 
     /* Now we can extract the actual base address from the TTBR */
     descaddr = extract64(ttbr, 0, 48);
-    descaddr &= ~((1ULL << (inputsize - (stride * (4 - level)))) - 1);
+    descaddr &= ~indexmask;
 
     /* The address field in the descriptor goes up to bit 39 for ARMv7
-     * but up to bit 47 for ARMv8.
+     * but up to bit 47 for ARMv8, but we use the descaddrmask
+     * up to bit 39 for AArch32, because we don't need other bits in that case
+     * to construct next descriptor address (anyway they should be all zeroes).
      */
-    if (arm_feature(env, ARM_FEATURE_V8)) {
-        descaddrmask = 0xfffffffff000ULL;
-    } else {
-        descaddrmask = 0xfffffff000ULL;
-    }
+    descaddrmask = ((1ull << (va_size == 64 ? 48 : 40)) - 1) &
+                   ~indexmask_grainsize;
 
     /* Secure accesses start with the page table in secure memory and
      * can be downgraded to non-secure at any step. Non-secure accesses
@@ -7470,7 +7462,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         uint64_t descriptor;
         bool nstable;
 
-        descaddr |= (address >> (stride * (4 - level))) & descmask;
+        descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
         descriptor = arm_ldq_ptw(cs, descaddr, !nstable, mmu_idx, fsr, fi);
@@ -7493,6 +7485,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
              */
             tableattrs |= extract64(descriptor, 59, 5);
             level++;
+            indexmask = indexmask_grainsize;
             continue;
         }
         /* Block entry at level 1 or 2, or page entry at level 3.
-- 
1.9.3

