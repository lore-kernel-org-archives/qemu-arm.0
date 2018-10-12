Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp900335wrt;
        Fri, 12 Oct 2018 07:46:47 -0700 (PDT)
X-Google-Smtp-Source: ACcGV622TslHyYfAKITWbJE0+zG4S0pJ2i6Ly3ls7/u1zep6oieV8lIzny6Uh3eriVQCFnZAR202
X-Received: by 2002:a37:9442:: with SMTP id w63-v6mr6064534qkd.304.1539355607573;
        Fri, 12 Oct 2018 07:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539355607; cv=none;
        d=google.com; s=arc-20160816;
        b=w0pceGmVTLZ8vQ0hiFeHIIA8CxXPbqlnftUClilf1NOFPUFTB1RehzHYGg5SDrMQoP
         /FHUkapCRvuO0fpI4dQiZ2DfdXZ/NSXSdKG6O4WV+9OqqU7hsIuIrzdMNQtnn0wGsHBu
         Pnru3TBQzdCZh9NE+ni0okqKg9Gj1c+qoLGRrBgpWCiZJMZXq9KWcVWk3Qsj/sKXH+lC
         6ct5AHk4uKxcFZAbYZAPLqbpW48Y+oHu2IrNSPUNW9kKEqijzOG0Xl9ZJiPYIr65Y/f/
         Kv+BxhIfUN5c7sSqHCQlIR5JSF/yaSvjanmL9W3l/1sPhzoaSrPUrL5NR2EaLYHaaC2f
         +8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=pZ928PqtXoHiTiJza6pAV6Kf8NA0Snr65ZtehZeM3+M=;
        b=w8zK/qov6d0Vc/VxaGcV2sGvsLIY/21dXA1e3nH/BOqFUMaP1LX8n6eWV4PrwHgDVJ
         QpIcDnkNqtoXu/zcR6FsSX+y1dCVxrUN/YVDhQF8ExH0neXAjGZiXa7zCey9saDBa+J4
         2/yQmQJ1fcQ4042LqHRDgyIdA6abAZJz5AHMal2edhRANuME8HoKj1xhckevgdKu0hEz
         5TRiVxAVH0fVj0HQ7EM6tVAqIpJ41gEew8R1vJRaEyC4LZcrYNVUoihUO4uaqBrcP0gG
         WxB+335XDdauTVM3c897jIvM0OgoUohJjpG5LKIw6dqkN81AnZhRb8dLVgEI32IeJIQc
         P4RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j123-v6si1260949qkc.18.2018.10.12.07.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Oct 2018 07:46:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAyiF-0002d7-2u
	for alex.bennee@linaro.org; Fri, 12 Oct 2018 10:46:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeR-00083X-TF
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeR-00032W-0l
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:51 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51816)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gAyeQ-00031c-NF; Fri, 12 Oct 2018 10:42:50 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gAyeP-0000Pv-Cb; Fri, 12 Oct 2018 15:42:49 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 12 Oct 2018 15:42:34 +0100
Message-Id: <20181012144235.19646-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181012144235.19646-1-peter.maydell@linaro.org>
References: <20181012144235.19646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 09/10] target/arm: Get IL bit correct for v7
 syndrome values
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
X-TUID: dG7Rg8GTA+G8

For the v7 version of the Arm architecture, the IL bit in
syndrome register values where the field is not valid was
defined to be UNK/SBZP. In v8 this is RES1, which is what
QEMU currently implements. Handle the desired v7 behaviour
by squashing the IL bit for the affected cases:
 * EC == EC_UNCATEGORIZED
 * prefetch aborts
 * data aborts where ISV is 0

(The fourth case listed in the v8 Arm ARM DDI 0487C.a in
section G7.2.70, "illegal state exception", can't happen
on a v7 CPU.)

This deals with a corner case noted in a comment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h |  7 ++-----
 target/arm/helper.c    | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 516f9454e9b..cd8bc1ec3d4 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -286,11 +286,8 @@ static inline uint32_t syn_get_ec(uint32_t syn)
 /* Utility functions for constructing various kinds of syndrome value.
  * Note that in general we follow the AArch64 syndrome values; in a
  * few cases the value in HSR for exceptions taken to AArch32 Hyp
- * mode differs slightly, so if we ever implemented Hyp mode then the
- * syndrome value would need some massaging on exception entry.
- * (One example of this is that AArch64 defaults to IL bit set for
- * exceptions which don't specifically indicate information about the
- * trapping instruction, whereas AArch32 defaults to IL bit clear.)
+ * mode differs slightly, and we fix this up when populating HSR in
+ * arm_cpu_do_interrupt_aarch32_hyp().
  */
 static inline uint32_t syn_uncategorized(void)
 {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0b89804961b..0b659171b07 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8299,6 +8299,20 @@ static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
     }
 
     if (cs->exception_index != EXCP_IRQ && cs->exception_index != EXCP_FIQ) {
+
+        if (!arm_feature(env, ARM_FEATURE_V8)) {
+            /*
+             * QEMU syndrome values are v8-style. v7 has the IL bit
+             * UNK/SBZP for "field not valid" cases, where v8 uses RES1.
+             * If this is a v7 CPU, squash the IL bit in those cases.
+             */
+            if (cs->exception_index == EXCP_PREFETCH_ABORT ||
+                (cs->exception_index == EXCP_DATA_ABORT &&
+                 !(env->exception.syndrome & ARM_EL_ISV)) ||
+                syn_get_ec(env->exception.syndrome) == EC_UNCATEGORIZED) {
+                env->exception.syndrome &= ~ARM_EL_IL;
+            }
+        }
         env->cp15.esr_el[2] = env->exception.syndrome;
     }
 
-- 
2.19.0

