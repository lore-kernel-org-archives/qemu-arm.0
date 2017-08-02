Received: by 10.25.44.15 with SMTP id s15csp6357031lfs;
        Wed, 2 Aug 2017 09:48:05 -0700 (PDT)
X-Received: by 10.55.198.132 with SMTP id s4mr29423677qkl.280.1501692484997;
        Wed, 02 Aug 2017 09:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692484; cv=none;
        d=google.com; s=arc-20160816;
        b=Rrvl+XeLwz2h/69QEn5n5Li24CL50tY2rVeiRWEU+Kpyq3Lkk1Ndg+oqmfXfUH0TpP
         XQz/1PmjJfqyTzDFNrgwoUjbOPNMvPCG9mkfsUumEJSn1xvWDNvds0QUdzP118/MytPi
         kaGIEQ0H4WrmbEV0huvyL7Ds1/kw7GAn5Xj5AoOo5WMhHgBEIk+23hsfQxQaaqEXqrEr
         taYm2WCCGi8XJQD72mH1ufj6nAgc42qb00KawBGGSfZWHU6Hn9AQGrlyC2AFVZNLiw+w
         tae5fu0d4XZGrRrXkI+dpkEl9FtaurZIQPkU3u4uwWvF5S3hNZJex6LHnGWsOCJFPZf6
         WVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=jdN+bY9wsxrm6bqr7oVJALqDb/w5x64kVPuLVrhkvpI=;
        b=FUhQ0JJ0Nhf0pdfawEJSDgcybLtEG7PwZ1lG9dfbAPMFEK1Y/3+QidTod4NW3snwjG
         JgS4FVmUgeNQqJjOxVWj/2liw7Q6VKLWRyhkmzP1O116H1jgmRq8I1feAY3EiCKqFSNS
         nL8x3nEddsvpF8ck7fD6XgoWuAJqq/sQuLUzbWiw/5fKoQeGnNosUGeSVfm9AD+TYhZN
         oYthl/C4vGGvIsbqLf2Ihk+wKvcVJXNFDHFkIc9E/htOu8PXaexNIFf2uVs/Rb7LI7YH
         9wkuq7gUS/zXEAF9UnixTFL5jUAViwOuCABbzS773IcgdJ4TLrqCcaThNBJ3rKyEhceD
         y6AA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r25si29503119qtb.242.2017.08.02.09.48.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:48:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwoU-0006Qx-9c
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:48:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl6-0003Va-5b
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl5-0004fi-69
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:32 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwl4-0003zA-V0; Wed, 02 Aug 2017 12:44:31 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwkh-0003zm-U3; Wed, 02 Aug 2017 17:44:07 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:43:57 +0100
Message-Id: <1501692241-23310-12-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 11/15] target/arm: Make arm_cpu_dump_state()
 handle the M-profile XPSR
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
X-TUID: p28vFrEL7FWv

Make the arm_cpu_dump_state() debug logging handle the M-profile XPSR
rather than assuming it's an A-profile CPSR.  On M profile the PSR
line of a register dump will now look like this:

XPSR=41000000 -Z-- T priv-thread

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 58 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 3c14cb0..e52a6d7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12215,8 +12215,6 @@ void arm_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     int i;
-    uint32_t psr;
-    const char *ns_status;
 
     if (is_a64(env)) {
         aarch64_cpu_dump_state(cs, f, cpu_fprintf, flags);
@@ -12230,24 +12228,48 @@ void arm_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
         else
             cpu_fprintf(f, " ");
     }
-    psr = cpsr_read(env);
 
-    if (arm_feature(env, ARM_FEATURE_EL3) &&
-        (psr & CPSR_M) != ARM_CPU_MODE_MON) {
-        ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        uint32_t xpsr = xpsr_read(env);
+        const char *mode;
+
+        if (xpsr & XPSR_EXCP) {
+            mode = "handler";
+        } else {
+            if (env->v7m.control & R_V7M_CONTROL_NPRIV_MASK) {
+                mode = "unpriv-thread";
+            } else {
+                mode = "priv-thread";
+            }
+        }
+
+        cpu_fprintf(f, "XPSR=%08x %c%c%c%c %c %s\n",
+                    xpsr,
+                    xpsr & XPSR_N ? 'N' : '-',
+                    xpsr & XPSR_Z ? 'Z' : '-',
+                    xpsr & XPSR_C ? 'C' : '-',
+                    xpsr & XPSR_V ? 'V' : '-',
+                    xpsr & XPSR_T ? 'T' : 'A',
+                    mode);
     } else {
-        ns_status = "";
-    }
-
-    cpu_fprintf(f, "PSR=%08x %c%c%c%c %c %s%s%d\n",
-                psr,
-                psr & (1 << 31) ? 'N' : '-',
-                psr & (1 << 30) ? 'Z' : '-',
-                psr & (1 << 29) ? 'C' : '-',
-                psr & (1 << 28) ? 'V' : '-',
-                psr & CPSR_T ? 'T' : 'A',
-                ns_status,
-                cpu_mode_names[psr & 0xf], (psr & 0x10) ? 32 : 26);
+        uint32_t psr = cpsr_read(env);
+        const char *ns_status = "";
+
+        if (arm_feature(env, ARM_FEATURE_EL3) &&
+            (psr & CPSR_M) != ARM_CPU_MODE_MON) {
+            ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
+        }
+
+        cpu_fprintf(f, "PSR=%08x %c%c%c%c %c %s%s%d\n",
+                    psr,
+                    psr & CPSR_N ? 'N' : '-',
+                    psr & CPSR_Z ? 'Z' : '-',
+                    psr & CPSR_C ? 'C' : '-',
+                    psr & CPSR_V ? 'V' : '-',
+                    psr & CPSR_T ? 'T' : 'A',
+                    ns_status,
+                    cpu_mode_names[psr & 0xf], (psr & 0x10) ? 32 : 26);
+    }
 
     if (flags & CPU_DUMP_FPU) {
         int numvfpregs = 0;
-- 
2.7.4

