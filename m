Received: by 10.223.172.38 with SMTP id v35csp7471925wrc;
        Tue, 12 Sep 2017 11:20:04 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD7Z+hHZ3i0AzZgHODVd77WNzjOl56aHt+vqJcR+PywboDcTU+wGPjdttCK+KU+2EdwK/B6
X-Received: by 10.200.50.149 with SMTP id z21mr24400333qta.37.1505240403966;
        Tue, 12 Sep 2017 11:20:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505240403; cv=none;
        d=google.com; s=arc-20160816;
        b=oHVHFhYnS4yYT3A2P3+UHKl7mnHO4yatOVP4kFMNyFsm9/fnsEa2wDoRbV1ZK9w5de
         PKvykvez2jkipb753kE33uHw+jGIRVMbvp3w3kj0OZUi1lRD7qmy0s+EjiJgQjEYMVHD
         OIA61nEPDWo+n8ov0e9Y17+I4A2/Xp6GCWz7A1qLyUD+rC1SRrVqn+HLYh00iSnISJLQ
         xUEGV//q4juJGxeeCEFGZxUPLWLhzDVbNtmW/R/yFkHwPJHhCGwgm+Br8W8A8FTO4Qr8
         TJrWsD9/YM1DDNCqR0iB1rULdnzlyMcTIILF3Tsq562D9y3gsmWGeGVuJ0UqG/yxFruO
         lOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=CWTZ9IjpiVNvRzH5AMM1MnhqcHS+7K9fqJGB01gIA7w=;
        b=d12kiYqyusglvTTeaULScq1shjDQ9CfftIaniq2u2emc7/hTvuyatAm4RKZGxni265
         mUJR8yVJGd2QMwCWACdWS8Xd8HBmEqN9IvdWTcox74S7QZrjmzPpkBMkPRM7/d43EmUE
         A1j89qay6LOyUchWdG/ZgqrtslI+MHecHy7aXGa8Y0h65kBeM1Q3VP/wjQ1XKNTZLqAb
         Z5n0/HpWjTae2p7CR2IbbiCqF3nxXu7jfhq1n/nh98LklnRKwamfO82MpfvRE7prd+PR
         h2vB+rpdanOkqnQ5yzPsqyP6I7xuITxoahMS28AmF8ViR//I7ohicOmJciyTWqQ+Sbwy
         tghA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v29si13080977qtj.158.2017.09.12.11.20.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 11:20:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drpmz-0000dH-Kk
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 14:20:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drph4-0003U1-3V
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drph2-0006SO-Dn
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:54 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37316)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drph2-0006QF-5A; Tue, 12 Sep 2017 14:13:52 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drpgz-00019p-Lp; Tue, 12 Sep 2017 19:13:49 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 19:14:02 +0100
Message-Id: <1505240046-11454-16-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 15/19] nvic: Handle v8M changes in
 nvic_exec_prio()
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
X-TUID: 8BzZYMnS3lEP

Update nvic_exec_prio() to support the v8M changes:
 * BASEPRI, FAULTMASK and PRIMASK are all banked
 * AIRCR.PRIS can affect NS priorities
 * AIRCR.BFHFNMINS affects FAULTMASK behaviour

These changes mean that it's no longer possible to
definitely say that if FAULTMASK is set it overrides
PRIMASK, and if PRIMASK is set it overrides BASEPRI
(since if PRIMASK_NS is set and AIRCR.PRIS is set then
whether that 0x80 priority should take effect or the
priority in BASEPRI_S depends on the value of BASEPRI_S,
for instance). So we switch to the same approach used
by the pseudocode of working through BASEPRI, PRIMASK
and FAULTMASK and overriding the previous values if
needed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 51 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 91d2f33..b13327d 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -319,18 +319,51 @@ static void nvic_recompute_state(NVICState *s)
 static inline int nvic_exec_prio(NVICState *s)
 {
     CPUARMState *env = &s->cpu->env;
-    int running;
+    int running = NVIC_NOEXC_PRIO;
 
-    if (env->v7m.faultmask[env->v7m.secure]) {
-        running = -1;
-    } else if (env->v7m.primask[env->v7m.secure]) {
+    if (env->v7m.basepri[M_REG_NS] > 0) {
+        running = exc_group_prio(s, env->v7m.basepri[M_REG_NS], M_REG_NS);
+    }
+
+    if (env->v7m.basepri[M_REG_S] > 0) {
+        int basepri = exc_group_prio(s, env->v7m.basepri[M_REG_S], M_REG_S);
+        if (running > basepri) {
+            running = basepri;
+        }
+    }
+
+    if (env->v7m.primask[M_REG_NS]) {
+        if (env->v7m.aircr & R_V7M_AIRCR_PRIS_MASK) {
+            if (running > NVIC_NS_PRIO_LIMIT) {
+                running = NVIC_NS_PRIO_LIMIT;
+            }
+        } else {
+            running = 0;
+        }
+    }
+
+    if (env->v7m.primask[M_REG_S]) {
         running = 0;
-    } else if (env->v7m.basepri[env->v7m.secure] > 0) {
-        running = env->v7m.basepri[env->v7m.secure] &
-            nvic_gprio_mask(s, env->v7m.secure);
-    } else {
-        running = NVIC_NOEXC_PRIO; /* lower than any possible priority */
     }
+
+    if (env->v7m.faultmask[M_REG_NS]) {
+        if (env->v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK) {
+            running = -1;
+        } else {
+            if (env->v7m.aircr & R_V7M_AIRCR_PRIS_MASK) {
+                if (running > NVIC_NS_PRIO_LIMIT) {
+                    running = NVIC_NS_PRIO_LIMIT;
+                }
+            } else {
+                running = 0;
+            }
+        }
+    }
+
+    if (env->v7m.faultmask[M_REG_S]) {
+        running = (env->v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK) ? -3 : -1;
+    }
+
     /* consider priority of active handler */
     return MIN(running, s->exception_prio);
 }
-- 
2.7.4

