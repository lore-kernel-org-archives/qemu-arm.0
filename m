Received: by 10.223.172.38 with SMTP id v35csp7468325wrc;
        Tue, 12 Sep 2017 11:17:22 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDPCYBMe+UBCA3fq4wq5mUjStiQilRjKIjI7CrQ2KGr1sQCHEJ8d/m9jvMgZxRFwqWRl6MO
X-Received: by 10.55.31.80 with SMTP id f77mr19394500qkf.95.1505240242812;
        Tue, 12 Sep 2017 11:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505240242; cv=none;
        d=google.com; s=arc-20160816;
        b=q3PpA1Xf74ug5bbHFrzE4WPP+hcDaBvfBoEkxkX1aSM4MKy8IFpVMNfsrqrGVdRrl7
         vBZerN1u2ybQwPCGdQiD0ryhVqrh6+W66RjW/KP4ZQHy/gfKChbBlM576V10McUxIJ8Q
         JpFDLLo8OmWkaww7QzuImFFmudN+RtxRnqDmLJ+nTzC/MBYqhyD8AYV3NDHBZkM6WWlC
         iJu/WbxKp18O4b5IxHhrSDkaDRNDOA6Crdy4N3CEnESXLTWQVaK3F0i5oIY+3j1n+AHL
         uEdDtm/hNrXY+FAWXyCzxrfXPX3aXbhFt557ljllk9KvyDvRYOzE51lnjVFNk6HZ751J
         6yLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=kQsJmKLqlo0zU/tVNsuqSlH51deGiBgTiRR53dwMu9M=;
        b=rx01lJjcMWo7ptChnWl+UX2CgnLUUIMefmfSrniITJ77Q1P1H3MAUlwUZl2b6cTj0W
         UQE1S0CHcT0fjuKy+xstqDranI37CEmPU5mRwB/xk8B5xK+h6g4xt6q7S3oTebV4jkD8
         X/DEPGXlktlfuDEZpC9auMYTinO9c5vIydtYBH2Y1ZbqAvw8Oo7+m0TKZUZUmpPKHjOs
         HtFOfBMku2CqSVH+D8gQOnNm0yhJtDsKFMKV+dbtSUuu+zZ4OZ+Nq/D35vZnPFxL40Zo
         9IjtWVU2H9oLeAkOgivvHV5tPlgeAyKiSD590WLT7vk3m8YdxpaPELHXaRBuIrX1Hk7g
         Pdig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d40si12743721qtc.94.2017.09.12.11.17.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 11:17:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drpkO-0006Wb-Fh
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 14:17:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgy-0003OE-Q6
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgx-0006Oo-Co
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:48 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37298)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drpgx-0006Mo-3w; Tue, 12 Sep 2017 14:13:47 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drpgq-00012z-9z; Tue, 12 Sep 2017 19:13:40 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 19:13:48 +0100
Message-Id: <1505240046-11454-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 01/19] target/arm: Implement MSR/MRS access to NS
 banked registers
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
X-TUID: 3+XrqYWVklaT

In v8M the MSR and MRS instructions have extra register value
encodings to allow secure code to access the non-secure banked
version of various special registers.

(We don't implement the MSPLIM_NS or PSPLIM_NS aliases, because
we don't currently implement the stack limit registers at all.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4f41841..f4f2a87 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8892,12 +8892,68 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
         break;
     case 20: /* CONTROL */
         return env->v7m.control[env->v7m.secure];
+    case 0x94: /* CONTROL_NS */
+        /* We have to handle this here because unprivileged Secure code
+         * can read the NS CONTROL register.
+         */
+        if (!env->v7m.secure) {
+            return 0;
+        }
+        return env->v7m.control[M_REG_NS];
     }
 
     if (el == 0) {
         return 0; /* unprivileged reads others as zero */
     }
 
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        switch (reg) {
+        case 0x88: /* MSP_NS */
+            if (!env->v7m.secure) {
+                return 0;
+            }
+            return env->v7m.other_ss_msp;
+        case 0x89: /* PSP_NS */
+            if (!env->v7m.secure) {
+                return 0;
+            }
+            return env->v7m.other_ss_psp;
+        case 0x90: /* PRIMASK_NS */
+            if (!env->v7m.secure) {
+                return 0;
+            }
+            return env->v7m.primask[M_REG_NS];
+        case 0x91: /* BASEPRI_NS */
+            if (!env->v7m.secure) {
+                return 0;
+            }
+            return env->v7m.basepri[M_REG_NS];
+        case 0x93: /* FAULTMASK_NS */
+            if (!env->v7m.secure) {
+                return 0;
+            }
+            return env->v7m.faultmask[M_REG_NS];
+        case 0x98: /* SP_NS */
+        {
+            /* This gives the non-secure SP selected based on whether we're
+             * currently in handler mode or not, using the NS CONTROL.SPSEL.
+             */
+            bool spsel = env->v7m.control[M_REG_NS] & R_V7M_CONTROL_SPSEL_MASK;
+
+            if (!env->v7m.secure) {
+                return 0;
+            }
+            if (!arm_v7m_is_handler_mode(env) && spsel) {
+                return env->v7m.other_ss_psp;
+            } else {
+                return env->v7m.other_ss_msp;
+            }
+        }
+        default:
+            break;
+        }
+    }
+
     switch (reg) {
     case 8: /* MSP */
         return (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) ?
@@ -8936,6 +8992,60 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
         return;
     }
 
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        switch (reg) {
+        case 0x88: /* MSP_NS */
+            if (!env->v7m.secure) {
+                return;
+            }
+            env->v7m.other_ss_msp = val;
+            return;
+        case 0x89: /* PSP_NS */
+            if (!env->v7m.secure) {
+                return;
+            }
+            env->v7m.other_ss_psp = val;
+            return;
+        case 0x90: /* PRIMASK_NS */
+            if (!env->v7m.secure) {
+                return;
+            }
+            env->v7m.primask[M_REG_NS] = val & 1;
+            return;
+        case 0x91: /* BASEPRI_NS */
+            if (!env->v7m.secure) {
+                return;
+            }
+            env->v7m.basepri[M_REG_NS] = val & 0xff;
+            return;
+        case 0x93: /* FAULTMASK_NS */
+            if (!env->v7m.secure) {
+                return;
+            }
+            env->v7m.faultmask[M_REG_NS] = val & 1;
+            return;
+        case 0x98: /* SP_NS */
+        {
+            /* This gives the non-secure SP selected based on whether we're
+             * currently in handler mode or not, using the NS CONTROL.SPSEL.
+             */
+            bool spsel = env->v7m.control[M_REG_NS] & R_V7M_CONTROL_SPSEL_MASK;
+
+            if (!env->v7m.secure) {
+                return;
+            }
+            if (!arm_v7m_is_handler_mode(env) && spsel) {
+                env->v7m.other_ss_psp = val;
+            } else {
+                env->v7m.other_ss_msp = val;
+            }
+            return;
+        }
+        default:
+            break;
+        }
+    }
+
     switch (reg) {
     case 0 ... 7: /* xPSR sub-fields */
         /* only APSR is actually writable */
-- 
2.7.4

