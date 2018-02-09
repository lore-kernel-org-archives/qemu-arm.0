Received: by 10.28.71.27 with SMTP id u27csp1165951wma;
        Fri, 9 Feb 2018 09:04:09 -0800 (PST)
X-Google-Smtp-Source: AH8x224q3dilCaHJy0re1UmsK/qnPoJJHYMbAUOeFdyeFJfqdgU/t95K45Ep9tzM1uiXtIE8uNt6
X-Received: by 10.129.123.195 with SMTP id w186mr2526453ywc.425.1518195849689;
        Fri, 09 Feb 2018 09:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518195849; cv=none;
        d=google.com; s=arc-20160816;
        b=A8Ud/9+sSJcetLrSL3ASQjivdcT+K1yP/x6/vzhh1PyqgdL4XKBNreCu8jWxuOHPxL
         I3BBo2J+fXhYWEZA3EbZCu8HuDxTAiBJeX43RtfMD5S9j4Mis6FN5hvFHbxdQC2lN/X3
         qCLmEpqioL1Ac+ZLiCfT/2jXdPOfMAVV5f7xSUbdzWTqlWGBxWhGJWlOHPwmYyIVd5yT
         ZqOa9sL3aOi6TsRoz8qkya7fejsnQSuBNVhUp4VdBuo7MBE9VGlvGPr89mecIs8bjVMJ
         8MGLP+jE4tai3BdoGETYNN7bRXypm/3vxYqDuGnMR6m72vZn1GimPZycnmO0cn2dmoXn
         9oYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=iX5+4KX0QoNuJTEmYUrR8SSTKVzn1S4JAWUtVaPRap8=;
        b=oygTJfZGFJjHh1NPFfh0UhHX7vcNlMxCfKdLL4oDqkdB6NC1cAP1BfvEPOR3RbrFhs
         m1MAbeSt0bkD2bkebDOmz9pt6si+aRKwLdTGO8obP+CgoENnSvpRfWT2hCaawN2uqF5r
         zJKoMsGAS1XR3Ld/KWD8TqjNh/Ab310bERBgfeVIMJXX2s7r3IgLUFz5iG+wCeb7l0hW
         H64GdsB07lDGYbtyNw0b/kLBG5irhRyvREKpLqHmaGvCogtufR8GcJvZvyzNLoACxllf
         WnNKbP//i3fb6fg7DPqECtrokzfvrIpqshOGVu6QJtCPX0czR0/XdNxrPPQFZgRtdNTp
         Ywdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z202si150170ywa.176.2018.02.09.09.04.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 09:04:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45143 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekC5p-0008A2-47
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 12:04:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0F-0003ym-Jo
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC0E-0007tO-D2
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:23 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46302)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ekC0E-0007rO-4E; Fri, 09 Feb 2018 11:58:22 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ekC0D-000323-1T; Fri, 09 Feb 2018 16:58:21 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Feb 2018 16:58:10 +0000
Message-Id: <20180209165810.6668-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209165810.6668-1-peter.maydell@linaro.org>
References: <20180209165810.6668-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 11/11] target/arm: Implement v8M MSPLIM and
 PSPLIM registers
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
X-TUID: Sz2aYgLAzJ/q

The v8M architecture includes hardware support for enforcing
stack pointer limits. We don't implement this behaviour yet,
but provide the MSPLIM and PSPLIM stack pointer limit registers
as reads-as-written, so that when we do implement the checks
in future this won't break guest migration.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h     |  2 ++
 target/arm/helper.c  | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c | 21 +++++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cfa92c477b..3ef523ddbd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -498,6 +498,8 @@ typedef struct CPUARMState {
         uint32_t secure; /* Is CPU in Secure state? (not guest visible) */
         uint32_t csselr[M_REG_NUM_BANKS];
         uint32_t scr[M_REG_NUM_BANKS];
+        uint32_t msplim[M_REG_NUM_BANKS];
+        uint32_t psplim[M_REG_NUM_BANKS];
     } v7m;
 
     /* Information associated with an exception about to be taken:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7c1dcb0330..03b1a3fd92 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10415,6 +10415,16 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
                 return 0;
             }
             return env->v7m.other_ss_psp;
+        case 0x8a: /* MSPLIM_NS */
+            if (!env->v7m.secure) {
+                return 0;
+            }
+            return env->v7m.msplim[M_REG_NS];
+        case 0x8b: /* PSPLIM_NS */
+            if (!env->v7m.secure) {
+                return 0;
+            }
+            return env->v7m.psplim[M_REG_NS];
         case 0x90: /* PRIMASK_NS */
             if (!env->v7m.secure) {
                 return 0;
@@ -10456,6 +10466,16 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
         return v7m_using_psp(env) ? env->v7m.other_sp : env->regs[13];
     case 9: /* PSP */
         return v7m_using_psp(env) ? env->regs[13] : env->v7m.other_sp;
+    case 10: /* MSPLIM */
+        if (!arm_feature(env, ARM_FEATURE_V8)) {
+            goto bad_reg;
+        }
+        return env->v7m.msplim[env->v7m.secure];
+    case 11: /* PSPLIM */
+        if (!arm_feature(env, ARM_FEATURE_V8)) {
+            goto bad_reg;
+        }
+        return env->v7m.psplim[env->v7m.secure];
     case 16: /* PRIMASK */
         return env->v7m.primask[env->v7m.secure];
     case 17: /* BASEPRI */
@@ -10464,6 +10484,7 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
     case 19: /* FAULTMASK */
         return env->v7m.faultmask[env->v7m.secure];
     default:
+    bad_reg:
         qemu_log_mask(LOG_GUEST_ERROR, "Attempt to read unknown special"
                                        " register %d\n", reg);
         return 0;
@@ -10501,6 +10522,18 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
             }
             env->v7m.other_ss_psp = val;
             return;
+        case 0x8a: /* MSPLIM_NS */
+            if (!env->v7m.secure) {
+                return;
+            }
+            env->v7m.msplim[M_REG_NS] = val & ~7;
+            return;
+        case 0x8b: /* PSPLIM_NS */
+            if (!env->v7m.secure) {
+                return;
+            }
+            env->v7m.psplim[M_REG_NS] = val & ~7;
+            return;
         case 0x90: /* PRIMASK_NS */
             if (!env->v7m.secure) {
                 return;
@@ -10580,6 +10613,18 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
             env->v7m.other_sp = val;
         }
         break;
+    case 10: /* MSPLIM */
+        if (!arm_feature(env, ARM_FEATURE_V8)) {
+            goto bad_reg;
+        }
+        env->v7m.msplim[env->v7m.secure] = val & ~7;
+        break;
+    case 11: /* PSPLIM */
+        if (!arm_feature(env, ARM_FEATURE_V8)) {
+            goto bad_reg;
+        }
+        env->v7m.psplim[env->v7m.secure] = val & ~7;
+        break;
     case 16: /* PRIMASK */
         env->v7m.primask[env->v7m.secure] = val & 1;
         break;
@@ -10612,6 +10657,7 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
         env->v7m.control[env->v7m.secure] |= val & R_V7M_CONTROL_NPRIV_MASK;
         break;
     default:
+    bad_reg:
         qemu_log_mask(LOG_GUEST_ERROR, "Attempt to write unknown special"
                                        " register %d\n", reg);
         return;
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 1a20d6c36c..2e28d086bd 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -246,6 +246,26 @@ static const VMStateDescription vmstate_m_other_sp = {
     }
 };
 
+static bool m_v8m_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+
+    return arm_feature(env, ARM_FEATURE_M) && arm_feature(env, ARM_FEATURE_V8);
+}
+
+static const VMStateDescription vmstate_m_v8m = {
+    .name = "cpu/m/v8m",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = m_v8m_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(env.v7m.msplim, ARMCPU, M_REG_NUM_BANKS),
+        VMSTATE_UINT32_ARRAY(env.v7m.psplim, ARMCPU, M_REG_NUM_BANKS),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_m = {
     .name = "cpu/m",
     .version_id = 4,
@@ -270,6 +290,7 @@ static const VMStateDescription vmstate_m = {
         &vmstate_m_csselr,
         &vmstate_m_scr,
         &vmstate_m_other_sp,
+        &vmstate_m_v8m,
         NULL
     }
 };
-- 
2.16.1

