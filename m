Received: by 10.223.159.74 with SMTP id f10csp2839276wrg;
        Fri, 22 Dec 2017 15:54:43 -0800 (PST)
X-Google-Smtp-Source: ACJfBotsyl6xaHdFQif4CNRTfuHYs/jQOROFLc91xSTjxiPtEiQMUK62CG9aM0K6KYy9pGvu3ygA
X-Received: by 10.129.169.6 with SMTP id g6mr11008519ywh.258.1513986883136;
        Fri, 22 Dec 2017 15:54:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513986883; cv=none;
        d=google.com; s=arc-20160816;
        b=kZKzKrOWQJagdL39ANpv79LXe99E5EU6p1X1Co0WPnAASH43Qz4EnP9qkfsiw1CKdV
         OPD15QpFd4f+RXkKAgcT5zAaENtM8+GobE5OYqM9xoRkjlKwQngXza88/+SS5HoLEJmV
         UkdS97bCHqd/e3NTtXhhdDBVoy3WiVyMZODlABTJWny38x2Ph2lVFm3hk4lB8MBXrgGK
         g6WQFMPoboUNtl2mFF25yWaPjLrhogftf8OyhwDq1Y3bAfrr0p/Q5bmEhE3esiXx7K1E
         ptMU2FXroX2JOlFtCAqgRP3iz9KRwLZ2Qg42n4J1UdTmsFj9boKQOzXvLCEE5OGHZzsm
         Ea1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=sJghIjmKA97tkF1Zqd33abV4TdDffhO6C/UdUZelRHI=;
        b=WvEJ9Hb0naLgD3v40+7HG5PClsmzcz4I6D3+bPxbLZQ3/IjuWu5ShHafIpdJSD0KVT
         omDaKiSm9vd37NNaUHzdj3kxw8g/jlmutOUSD8lxFQ9b3stf3Va3CRFj474BcGSOkinY
         oA/FpJ2+44Xl+BS/19pCKX/AvHYA9dFD5ZW8EOG8CbfpInvaUawo0x3f054K3Ba/YZZh
         rruuSwdqcRARBC0gL/izfF6ncmpQXAPtwYJ+rkie1NiV6dDNRSBYwvUEIF+M2fBHp2Wx
         j4Gnzi6MDByZSfA1tb0Ks5J3oY2TTdaQ8e0p4W3cG0feAGABdvlRf4k5Blktyjk5O9sP
         pBAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a7si4408483ywm.523.2017.12.22.15.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Dec 2017 15:54:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39486 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eSX9G-00065x-Lb
	for alex.bennee@linaro.org; Fri, 22 Dec 2017 18:54:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@dinsnail.net>) id 1eSX8G-0005jT-64
	for qemu-devel@nongnu.org; Fri, 22 Dec 2017 18:53:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@dinsnail.net>) id 1eSX8D-0003vG-3s
	for qemu-devel@nongnu.org; Fri, 22 Dec 2017 18:53:40 -0500
Received: from heinz.dinsnail.net
	([2a01:238:43b4:3200:9392:5dcc:2f0e:a960]:55414)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <michael@dinsnail.net>)
	id 1eSX8C-0003sJ-T3; Fri, 22 Dec 2017 18:53:37 -0500
Received: from localhost (p5DD4E4D5.dip0.t-ipconnect.de [93.212.228.213])
	by heinz.dinsnail.net (8.14.9/8.14.9) with ESMTP id vBMNqv5n000616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sat, 23 Dec 2017 00:52:58 +0100
From: Michael Weiser <michael.weiser@gmx.de>
To: qemu-arm@nongnu.org
Date: Fri, 22 Dec 2017 20:23:00 +0100
Message-Id: <20171222192300.46997-1-michael.weiser@gmx.de>
X-Mailer: git-send-email 2.14.3 (Apple Git-98)
X-dinsnail-net-MailScanner-Information: Please contact the ISP for more
	information
X-dinsnail-net-MailScanner-ID: vBMNqv5n000616
X-dinsnail-net-MailScanner: Found to be clean
X-dinsnail-net-MailScanner-SpamScore: ssss
X-dinsnail-net-MailScanner-From: michael@dinsnail.net
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a01:238:43b4:3200:9392:5dcc:2f0e:a960
Subject: [Qemu-devel] [RFC PATCH] target/arm: Fix stlxp for aarch64_be
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Weiser <michael.weiser@gmx.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3dpDYofNwTWm

In big-endian mode, stlxp would not only store the individual doublewords
big-endian but also swap them in memory. This does not correspond to how ldxp
behaves nor how native code expects the result of stlxp to be stored in memory.

Also, when comparing if the values in memory still match what was previously
loaded by ldxp, stlxp would also swap the values loaded from memory, making the
comparison against the previously loaded value fail always.

With this change an aarch64_be Linux 4.14.4 kernel succeeds to boots up in
system emulation mode.

This change makes paired_cmpxchg64 helpers differ only in endianness handling.
It might be possible to fold them into a single routine using variables and
function pointers or get rid of them completely in favour of tcg_gen_-routines.
Both is currently beyond my skill level, though.

Signed-off-by: Michael Weiser <michael.weiser@gmx.de>
---
 target/arm/helper-a64.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index b84ebcae6e..bab6446588 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -532,8 +532,8 @@ static uint64_t do_paired_cmpxchg64_be(CPUARMState *env, uint64_t addr,
 
         success = int128_eq(oldv, cmpv);
         if (success) {
-            stq_be_p(haddr + 0, int128_gethi(newv));
-            stq_be_p(haddr + 1, int128_getlo(newv));
+            stq_be_p(haddr + 0, int128_getlo(newv));
+            stq_be_p(haddr + 1, int128_gethi(newv));
         }
         helper_retaddr = 0;
 #else
@@ -541,14 +541,14 @@ static uint64_t do_paired_cmpxchg64_be(CPUARMState *env, uint64_t addr,
         TCGMemOpIdx oi0 = make_memop_idx(MO_BEQ | MO_ALIGN_16, mem_idx);
         TCGMemOpIdx oi1 = make_memop_idx(MO_BEQ, mem_idx);
 
-        o1 = helper_be_ldq_mmu(env, addr + 0, oi0, ra);
-        o0 = helper_be_ldq_mmu(env, addr + 8, oi1, ra);
+        o0 = helper_be_ldq_mmu(env, addr + 0, oi0, ra);
+        o1 = helper_be_ldq_mmu(env, addr + 8, oi1, ra);
         oldv = int128_make128(o0, o1);
 
         success = int128_eq(oldv, cmpv);
         if (success) {
-            helper_be_stq_mmu(env, addr + 0, int128_gethi(newv), oi1, ra);
-            helper_be_stq_mmu(env, addr + 8, int128_getlo(newv), oi1, ra);
+            helper_be_stq_mmu(env, addr + 0, int128_getlo(newv), oi1, ra);
+            helper_be_stq_mmu(env, addr + 8, int128_gethi(newv), oi1, ra);
         }
 #endif
     }
-- 
2.15.1

