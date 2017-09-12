Received: by 10.223.172.38 with SMTP id v35csp7463777wrc;
        Tue, 12 Sep 2017 11:14:02 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDij+DMZI+QobbLUdq/Wbq901NZvICLDG8X9f99IUfEQbEpWnXtTMeYsiMmyeNBLcso9WcK
X-Received: by 10.200.9.115 with SMTP id z48mr1364410qth.141.1505240042855;
        Tue, 12 Sep 2017 11:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505240042; cv=none;
        d=google.com; s=arc-20160816;
        b=lOxx/ZHnup/QaifvlGRuvFWK7Fw8rIgiKa5K5pnvSTKrrpigyUDA5Ei6WbvCuvOFY7
         6y6n94e2sPmgKep09ISiTFcPAEQSzSs9UdBNl2Ej0iAGfmsmPMuXQxJO9vXtZ0n5OWsZ
         DHh8VmGD80/OsM5k2cqdHyVNDBUI/MdqipbKOkoGp99MikfJn51xC7NFe5AlXBP6T2IF
         551MkaQDFqI0AaPjdffyitgn45QAZtkVl/fA8MMXWM4G8u+MF1Ush4CwZf539u+o/4H5
         sJF38Twew51Kyccp4Yy0iwDbkoyxN4ppy9nb409qu7OuBzVx4Ls1plxUfHRaDlr2qrMQ
         7UMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=bpESvZ/5OmlheuZ1ANsRLM3u0F8HOEBbwg6I+XzDjuU=;
        b=oJwQxZNKNew5d3VLnBhxLBdCa1sA0XQ9BxEbnRIMTk4r9nS/PGQqGF2jIRCnAUT11T
         rcLbv1yI7L6ELVV4BnJ1YlMQS3VYlk7JhjZjzWmXOMMrVELBO0xnjE6AR8C6OI2Y5diN
         fhkRrcOQerh5EX/pg2pOY05+O2YZKEQkHTdZYYEAWiHRSGDWAO07QNlvFn2lyuNl4rjP
         QI3HRJRDzfWSxmv4AuaIf9HufrXaBPsaf1UyASaOk4v7wvtg8UggCt/Apxad9TOBJYlx
         +8DwPvmVzCkzdErGYT2YOk6RLUGIjIuvkmf81ivhPJf3HM1Mm69H5EepG6E5Fc0PAk1q
         VO7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t4si12124182qkd.431.2017.09.12.11.14.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 11:14:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drphA-0003MK-En
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 14:14:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgu-0003Jn-7F
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgs-0006Kn-V4
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:44 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37276)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drpgs-0006IX-Mg; Tue, 12 Sep 2017 14:13:42 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drpgq-00013G-Tx; Tue, 12 Sep 2017 19:13:40 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 19:13:49 +0100
Message-Id: <1505240046-11454-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 02/19] nvic: Add banked exception states
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
X-TUID: 1dUbK0FdZ/4j

For the v8M security extension, some exceptions must be banked
between security states. Add the new vecinfo array which holds
the state for the banked exceptions and migrate it if the
CPU the NVIC is attached to implements the security extension.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/armv7m_nvic.h | 14 +++++++++++++
 hw/intc/armv7m_nvic.c         | 49 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 1a4cce7..317601e 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -21,6 +21,8 @@
 
 /* Highest permitted number of exceptions (architectural limit) */
 #define NVIC_MAX_VECTORS 512
+/* Number of internal exceptions */
+#define NVIC_INTERNAL_VECTORS 16
 
 typedef struct VecInfo {
     /* Exception priorities can range from -3 to 255; only the unmodifiable
@@ -41,6 +43,18 @@ typedef struct NVICState {
     ARMCPU *cpu;
 
     VecInfo vectors[NVIC_MAX_VECTORS];
+    /* If the v8M security extension is implemented, some of the internal
+     * exceptions are banked between security states (ie there exists both
+     * a Secure and a NonSecure version of the exception and its state):
+     *  HardFault, MemManage, UsageFault, SVCall, PendSV, SysTick (R_PJHV)
+     * The rest (including all the external exceptions) are not banked, though
+     * they may be configurable to target either Secure or NonSecure state.
+     * We store the secure exception state in sec_vectors[] for the banked
+     * exceptions, and otherwise use only vectors[] (including for exceptions
+     * like SecureFault that unconditionally target Secure state).
+     * Entries in sec_vectors[] for non-banked exception numbers are unused.
+     */
+    VecInfo sec_vectors[NVIC_INTERNAL_VECTORS];
     uint32_t prigroup;
 
     /* vectpending and exception_prio are both cached state that can
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index d3e2056..694b9e0 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -47,7 +47,7 @@
  * For historical reasons QEMU tends to use "interrupt" and
  * "exception" more or less interchangeably.
  */
-#define NVIC_FIRST_IRQ 16
+#define NVIC_FIRST_IRQ NVIC_INTERNAL_VECTORS
 #define NVIC_MAX_IRQ (NVIC_MAX_VECTORS - NVIC_FIRST_IRQ)
 
 /* Effective running priority of the CPU when no exception is active
@@ -1158,6 +1158,43 @@ static const VMStateDescription vmstate_VecInfo = {
     }
 };
 
+static bool nvic_security_needed(void *opaque)
+{
+    NVICState *s = opaque;
+
+    return arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY);
+}
+
+static int nvic_security_post_load(void *opaque, int version_id)
+{
+    NVICState *s = opaque;
+    int i;
+
+    /* Check for out of range priority settings */
+    if (s->sec_vectors[ARMV7M_EXCP_HARD].prio != -1) {
+        return 1;
+    }
+    for (i = ARMV7M_EXCP_MEM; i < ARRAY_SIZE(s->sec_vectors); i++) {
+        if (s->sec_vectors[i].prio & ~0xff) {
+            return 1;
+        }
+    }
+    return 0;
+}
+
+static const VMStateDescription vmstate_nvic_security = {
+    .name = "nvic/m-security",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = nvic_security_needed,
+    .post_load = &nvic_security_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT_ARRAY(sec_vectors, NVICState, NVIC_INTERNAL_VECTORS, 1,
+                             vmstate_VecInfo, VecInfo),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_nvic = {
     .name = "armv7m_nvic",
     .version_id = 4,
@@ -1195,6 +1232,16 @@ static void armv7m_nvic_reset(DeviceState *dev)
     s->vectors[ARMV7M_EXCP_NMI].prio = -2;
     s->vectors[ARMV7M_EXCP_HARD].prio = -1;
 
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
+        s->sec_vectors[ARMV7M_EXCP_HARD].enabled = 1;
+        s->sec_vectors[ARMV7M_EXCP_SVC].enabled = 1;
+        s->sec_vectors[ARMV7M_EXCP_PENDSV].enabled = 1;
+        s->sec_vectors[ARMV7M_EXCP_SYSTICK].enabled = 1;
+
+        /* AIRCR.BFHFNMINS resets to 0 so Secure HF is priority -1 (R_CMTC) */
+        s->sec_vectors[ARMV7M_EXCP_HARD].prio = -1;
+    }
+
     /* Strictly speaking the reset handler should be enabled.
      * However, we don't simulate soft resets through the NVIC,
      * and the reset vector should never be pended.
-- 
2.7.4

