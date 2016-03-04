Received: by 10.25.208.211 with SMTP id h202csp146056lfg;
        Fri, 4 Mar 2016 08:05:15 -0800 (PST)
X-Received: by 10.140.164.71 with SMTP id k68mr109293qhk.97.1457107515770;
        Fri, 04 Mar 2016 08:05:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f80si4140841qhc.105.2016.03.04.08.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Mar 2016 08:05:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@yandex.ru;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:41999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1absE7-00089E-9w
	for alex.bennee@linaro.org; Fri, 04 Mar 2016 11:05:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1absE2-00086i-45
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 11:05:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1absDy-0003Pn-OL
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 11:05:09 -0500
Received: from forward6h.cmail.yandex.net ([87.250.230.217]:50928)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1absDy-0003P7-8Y; Fri, 04 Mar 2016 11:05:06 -0500
Received: from smtp3h.mail.yandex.net (smtp3h.mail.yandex.net
	[IPv6:2a02:6b8:0:f05::117])
	by forward6h.cmail.yandex.net (Yandex) with ESMTP id 9402E21449;
	Fri,  4 Mar 2016 19:05:01 +0300 (MSK)
Received: from smtp3h.mail.yandex.net (localhost [127.0.0.1])
	by smtp3h.mail.yandex.net (Yandex) with ESMTP id 863A71B40414;
	Fri,  4 Mar 2016 19:05:00 +0300 (MSK)
Received: by smtp3h.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	tnwJBjHsTJ-4xW49twc; Fri, 04 Mar 2016 19:04:59 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1457107500; bh=hg9GSfXwrUkXQEHMlSrORy1HhSp6Putjksj9+jVTVp8=;
	h=From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	b=Hg5KQ5AGEo3mbxG877Yywk9Yl3/QyZ07hzG2H9aKQjzSXnIiMsntoR4xfV9mYRmiT
	eq33ZH8Z7b5oZTZ3W0FJCoN++/jvtugdz9EAfl4J95RkyHfKt4aK+4bfp+XL4mVgJI
	s1deI6AML3o1WECw4wKqvlc2yqZWY7QlicljZrJk=
Authentication-Results: smtp3h.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Fri,  4 Mar 2016 19:04:33 +0300
Message-Id: <1457107473-26292-1-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.250.230.217
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Sergey Sorokin <afarallax@yandex.ru>
Subject: [Qemu-arm] [PATCH] target-arm: Fix descriptor address masking in
	ARM address translation
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
X-TUID: lKNbHlC2iClQ

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
 target-arm/helper.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index dec8e8b..b5f289c 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7243,7 +7243,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     uint32_t tg;
     uint64_t ttbr;
     int ttbr_select;
-    hwaddr descaddr, descmask;
+    hwaddr descaddr, indexmask, indexmask_grainsize;
     uint32_t tableattrs;
     target_ulong page_size;
     uint32_t attrs;
@@ -7431,28 +7431,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         }
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
 
-    /* The address field in the descriptor goes up to bit 39 for ARMv7
-     * but up to bit 47 for ARMv8.
+    /* The address field in the descriptor goes up to bit 39 for AArch32
+     * but up to bit 47 for AArch64.
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
@@ -7464,7 +7454,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         uint64_t descriptor;
         bool nstable;
 
-        descaddr |= (address >> (stride * (4 - level))) & descmask;
+        descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
         descriptor = arm_ldq_ptw(cs, descaddr, !nstable, mmu_idx, fsr, fi);
@@ -7487,6 +7477,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
              */
             tableattrs |= extract64(descriptor, 59, 5);
             level++;
+            indexmask = indexmask_grainsize;
             continue;
         }
         /* Block entry at level 1 or 2, or page entry at level 3.
-- 
1.9.3

