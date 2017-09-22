Received: by 10.223.172.38 with SMTP id v35csp3211849wrc;
        Fri, 22 Sep 2017 08:02:21 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBNRFSxqPaXFhu0IMFmLBFdvs1+avM9Rx9PkEX3TDY8MzSuFHk+VYbRTlqHxkfLg6o+/yD2
X-Received: by 10.55.107.5 with SMTP id g5mr8041478qkc.344.1506092540939;
        Fri, 22 Sep 2017 08:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092540; cv=none;
        d=google.com; s=arc-20160816;
        b=o3U9cAxwxYWnWXH+JcRV/7L4tShzNjaq/EaatrBuA1ciJ5pLBvXgIRvEw6KO/TjLyL
         6vHSpPagGg9TvS4XO3LHcq9EJeVOTxcL7iDa2YGlY1w7z6vhU9oZagvWcEqjf9Z1Rk5r
         CLT5fjZtvbD0cEPoldQDG+P8Mg8BsoT9hsD6LnHk3vaBPpRmfEXSME2ewIfrHTvKiMQH
         iCmXG2Xcr9G3i/Gq+9BD4ZIGcpBwRNNus81t/LWg06ZEUWhpXEvLWyJbsWDgY4ikrTN3
         BjtIjU31Ei+7DfkB3Pq90CL8j5vwcs9GnQoIqIV0kCzaLIMPoGdhqJ8gQ1EdFqXxzHmB
         Xx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=oX3f+gdFBwxt23pFDN8S+Q+tZpoTLOMEnvtLYCzE930=;
        b=0vmJGuT+WQugRD2/mclwr4kDvggsvLodFKMjP7RSioxRFCRv0XJqnTEFA6uUQ8xHV7
         JqJHkDvo4eJEv8tIUE3k18IaNwBNmex8YRkcKGkb9LjvDmwA8t8o0b4QAi20A6QxEhSc
         6GmetmyJarJzVgXAfTSqWvXwV75wI83qAOZbbjz/2aMrwGcWFjt93rkcflEo2y2EsLv0
         QQWGpt652K0ie3ihWEdNC1XEbQqWd5sAqsYDzFUwzkJv+X0DAX2Ti7JPZEcVb126ab+W
         LZvR1kjHe986eS+7ptlW6ou3e2v4OUJ9OOzT9vDuOZAwwHMvHkZ2g97Uc5xwLNauqdFV
         CYfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z185si28516qkc.66.2017.09.22.08.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:02:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPT8-0001LV-Jo
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:02:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQZ-0007xn-Lq
	for qemu-devel@nongnu.org; Fri, 22 Sep 2017 10:59:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQY-00046p-Md
	for qemu-devel@nongnu.org; Fri, 22 Sep 2017 10:59:39 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQW-00043B-CK; Fri, 22 Sep 2017 10:59:36 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQV-0007B3-A3; Fri, 22 Sep 2017 15:59:35 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 15:59:55 +0100
Message-Id: <1506092407-26985-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 08/20] target/arm: Don't warn about exception
 return with PC low bit set for v8M
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6GlDqJTfbQvC

In the v8M architecture, return from an exception to a PC which
has bit 0 set is not UNPREDICTABLE; it is defined that bit 0
is discarded [R_HRJH]. Restrict our complaint about this to v7M.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 979129e..59a07d2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6421,16 +6421,22 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         env->regs[12] = ldl_phys(cs->as, frameptr + 0x10);
         env->regs[14] = ldl_phys(cs->as, frameptr + 0x14);
         env->regs[15] = ldl_phys(cs->as, frameptr + 0x18);
-        if (env->regs[15] & 1) {
+
+        /* Returning from an exception with a PC with bit 0 set is defined
+         * behaviour on v8M (bit 0 is ignored), but for v7M it was specified
+         * to be UNPREDICTABLE. In practice actual v7M hardware seems to ignore
+         * the lsbit, and there are several RTOSes out there which incorrectly
+         * assume the r15 in the stack frame should be a Thumb-style "lsbit
+         * indicates ARM/Thumb" value, so ignore the bit on v7M as well, but
+         * complain about the badly behaved guest.
+         */
+        if ((env->regs[15] & 1) && !arm_feature(env, ARM_FEATURE_V8)) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "M profile return from interrupt with misaligned "
-                          "PC is UNPREDICTABLE\n");
-            /* Actual hardware seems to ignore the lsbit, and there are several
-             * RTOSes out there which incorrectly assume the r15 in the stack
-             * frame should be a Thumb-style "lsbit indicates ARM/Thumb" value.
-             */
-            env->regs[15] &= ~1U;
+                          "PC is UNPREDICTABLE on v7M\n");
         }
+        env->regs[15] &= ~1U;
+
         xpsr = ldl_phys(cs->as, frameptr + 0x1c);
 
         if (arm_feature(env, ARM_FEATURE_V8)) {
-- 
2.7.4

