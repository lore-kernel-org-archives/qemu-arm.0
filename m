Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305979ejb;
        Wed, 4 Jan 2023 14:01:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvjlVMo/z3LZErBbnh0JAkNkUexwVDwdX/n8cFT9UMZAZUmRbz2+2qhmecVxAITudZJWBpo
X-Received: by 2002:a05:600c:a0f:b0:3cf:7704:50ce with SMTP id z15-20020a05600c0a0f00b003cf770450cemr35603220wmp.38.1672869699280;
        Wed, 04 Jan 2023 14:01:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869699; cv=none;
        d=google.com; s=arc-20160816;
        b=aYwNb+oc5uuNgsROLnxVCI/ynPkxJkyw6hhQho6sjlnUuHYCBXcJTRwwCcZ2u2Lp1F
         3zi2C/WVmMfT5lwwEBi3VAx732cpBY3S3Vo58XWDo4Kbm6mGUcTwm9oeuRribkZRS61g
         5bFjH+eEvrrO+Ug+KbXIC2+RnSUYwRbOejb01UJiRRQ/thQeCr3sP6HC5BBSzsiMkVt2
         qqctFAEB39/OLykjkIkrFjDAaMqrmJD4cz3Fpy+lqelJt/Ox6ALZTwc9OP4FlyACFGh7
         ScYSAqRzKOCU9UeCGG54PQuVpSGLlWMGNq8E5OQq1SsUGfdARV9TYo+Lp01P6Jp37gBl
         0sMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=p5ojC4527eRIiRmqJh5H1iXH5vAsoQ4LQ1DA1TKEVLM=;
        b=Br/YypTofnuVq7p1oPqq/6Y+9Kl83Pavw/jz74oq7BhK8RY7OP1A1YXkbZ7GzbanWs
         qDnnb8VnXn+tmMWBmiYkdICkzoUW+siOQ96NggEiqVKyO8YEoE9D/7sy7k/pT3OAzQgP
         vRBSawphBs2kFf2GzkfWWQQW8lyfCr6bewG35nNj+51hfR0BEfOsfv8KHqqqCmK3VxUI
         wgKwqVOn2jalltc8oI8B/kaVsc7tczh92jXbcNT7weOX1UO9OH9woTKs9yNGY+d4kFSp
         SHBzkf/3OUNn+/U1aV5vCldWqxyO9wVuTEfNwfuJKA3G4Doq9oYAMPqVET4YqZF0SYjn
         6uYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=mMnW82wq;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id s8-20020a05600c384800b003cf6acc4835si78489wmr.150.2023.01.04.14.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:39 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=mMnW82wq;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CD4392027B;
	Wed,  4 Jan 2023 22:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5ojC4527eRIiRmqJh5H1iXH5vAsoQ4LQ1DA1TKEVLM=;
	b=mMnW82wqsPXaKA9pyy+Zv7ASFsQ3eNaLLLkVDhDouzFrQ2tADhnXuW8663y4ckB1L+68m8
	RIdkai1PRXiq2JqF8SJzFZsnUIdOAJbos8P0u/GpajYW/bEfmR4DWK0iKzOKuWNtQsLHdk
	giZbsvgNi9COJCcAfdIZHigXh92+7Tc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5ojC4527eRIiRmqJh5H1iXH5vAsoQ4LQ1DA1TKEVLM=;
	b=Z0Lc2b5nGtCtHh/lFRuX50x9FCAYSm7uH2YsVMDrV1UcF5s3geyIi/HLtzhLD36T03vsvF
	wWqmrH25VkkMcpDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2300E1342C;
	Wed,  4 Jan 2023 22:01:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gE3sNj/3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:35 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH 18/27] target/arm: Move cpregs code out of cpu.h
Date: Wed,  4 Jan 2023 18:58:26 -0300
Message-Id: <20230104215835.24692-19-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: j5WhFiYuValD

Since commit cf7c6d1004 ("target/arm: Split out cpregs.h") we now have
a cpregs.h header which is more suitable for this code.

Code moved verbatim.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Extracted from:
https://lore.kernel.org/r/20210416162824.25131-15-cfontana@suse.de
[RFC v14 14/80] target/arm: split cpregs from tcg/helper.c
---
 target/arm/cpregs.h | 98 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h    | 91 -----------------------------------------
 2 files changed, 98 insertions(+), 91 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 1c35574102..9e43ea6c3c 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -120,6 +120,104 @@ enum {
     ARM_CP_SME                   = 1 << 19,
 };
 
+/*
+ * Interface for defining coprocessor registers.
+ * Registers are defined in tables of arm_cp_reginfo structs
+ * which are passed to define_arm_cp_regs().
+ */
+
+/*
+ * When looking up a coprocessor register we look for it
+ * via an integer which encodes all of:
+ *  coprocessor number
+ *  Crn, Crm, opc1, opc2 fields
+ *  32 or 64 bit register (ie is it accessed via MRC/MCR
+ *    or via MRRC/MCRR?)
+ *  non-secure/secure bank (AArch32 only)
+ * We allow 4 bits for opc1 because MRRC/MCRR have a 4 bit field.
+ * (In this case crn and opc2 should be zero.)
+ * For AArch64, there is no 32/64 bit size distinction;
+ * instead all registers have a 2 bit op0, 3 bit op1 and op2,
+ * and 4 bit CRn and CRm. The encoding patterns are chosen
+ * to be easy to convert to and from the KVM encodings, and also
+ * so that the hashtable can contain both AArch32 and AArch64
+ * registers (to allow for interprocessing where we might run
+ * 32 bit code on a 64 bit core).
+ */
+/*
+ * This bit is private to our hashtable cpreg; in KVM register
+ * IDs the AArch64/32 distinction is the KVM_REG_ARM/ARM64
+ * in the upper bits of the 64 bit ID.
+ */
+#define CP_REG_AA64_SHIFT 28
+#define CP_REG_AA64_MASK (1 << CP_REG_AA64_SHIFT)
+
+/*
+ * To enable banking of coprocessor registers depending on ns-bit we
+ * add a bit to distinguish between secure and non-secure cpregs in the
+ * hashtable.
+ */
+#define CP_REG_NS_SHIFT 29
+#define CP_REG_NS_MASK (1 << CP_REG_NS_SHIFT)
+
+#define ENCODE_CP_REG(cp, is64, ns, crn, crm, opc1, opc2)   \
+    ((ns) << CP_REG_NS_SHIFT | ((cp) << 16) | ((is64) << 15) |   \
+     ((crn) << 11) | ((crm) << 7) | ((opc1) << 3) | (opc2))
+
+#define ENCODE_AA64_CP_REG(cp, crn, crm, op0, op1, op2) \
+    (CP_REG_AA64_MASK |                                 \
+     ((cp) << CP_REG_ARM_COPROC_SHIFT) |                \
+     ((op0) << CP_REG_ARM64_SYSREG_OP0_SHIFT) |         \
+     ((op1) << CP_REG_ARM64_SYSREG_OP1_SHIFT) |         \
+     ((crn) << CP_REG_ARM64_SYSREG_CRN_SHIFT) |         \
+     ((crm) << CP_REG_ARM64_SYSREG_CRM_SHIFT) |         \
+     ((op2) << CP_REG_ARM64_SYSREG_OP2_SHIFT))
+
+/*
+ * Convert a full 64 bit KVM register ID to the truncated 32 bit
+ * version used as a key for the coprocessor register hashtable
+ */
+static inline uint32_t kvm_to_cpreg_id(uint64_t kvmid)
+{
+    uint32_t cpregid = kvmid;
+    if ((kvmid & CP_REG_ARCH_MASK) == CP_REG_ARM64) {
+        cpregid |= CP_REG_AA64_MASK;
+    } else {
+        if ((kvmid & CP_REG_SIZE_MASK) == CP_REG_SIZE_U64) {
+            cpregid |= (1 << 15);
+        }
+
+        /*
+         * KVM is always non-secure so add the NS flag on AArch32 register
+         * entries.
+         */
+         cpregid |= 1 << CP_REG_NS_SHIFT;
+    }
+    return cpregid;
+}
+
+/*
+ * Convert a truncated 32 bit hashtable key into the full
+ * 64 bit KVM register ID.
+ */
+static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
+{
+    uint64_t kvmid;
+
+    if (cpregid & CP_REG_AA64_MASK) {
+        kvmid = cpregid & ~CP_REG_AA64_MASK;
+        kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM64;
+    } else {
+        kvmid = cpregid & ~(1 << 15);
+        if (cpregid & (1 << 15)) {
+            kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM;
+        } else {
+            kvmid |= CP_REG_SIZE_U32 | CP_REG_ARM;
+        }
+    }
+    return kvmid;
+}
+
 /*
  * Valid values for ARMCPRegInfo state field, indicating which of
  * the AArch32 and AArch64 execution states this register is visible in.
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2b4bd20f9d..20fa29d119 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2663,97 +2663,6 @@ static inline bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure)
 }
 #endif
 
-/* Interface for defining coprocessor registers.
- * Registers are defined in tables of arm_cp_reginfo structs
- * which are passed to define_arm_cp_regs().
- */
-
-/* When looking up a coprocessor register we look for it
- * via an integer which encodes all of:
- *  coprocessor number
- *  Crn, Crm, opc1, opc2 fields
- *  32 or 64 bit register (ie is it accessed via MRC/MCR
- *    or via MRRC/MCRR?)
- *  non-secure/secure bank (AArch32 only)
- * We allow 4 bits for opc1 because MRRC/MCRR have a 4 bit field.
- * (In this case crn and opc2 should be zero.)
- * For AArch64, there is no 32/64 bit size distinction;
- * instead all registers have a 2 bit op0, 3 bit op1 and op2,
- * and 4 bit CRn and CRm. The encoding patterns are chosen
- * to be easy to convert to and from the KVM encodings, and also
- * so that the hashtable can contain both AArch32 and AArch64
- * registers (to allow for interprocessing where we might run
- * 32 bit code on a 64 bit core).
- */
-/* This bit is private to our hashtable cpreg; in KVM register
- * IDs the AArch64/32 distinction is the KVM_REG_ARM/ARM64
- * in the upper bits of the 64 bit ID.
- */
-#define CP_REG_AA64_SHIFT 28
-#define CP_REG_AA64_MASK (1 << CP_REG_AA64_SHIFT)
-
-/* To enable banking of coprocessor registers depending on ns-bit we
- * add a bit to distinguish between secure and non-secure cpregs in the
- * hashtable.
- */
-#define CP_REG_NS_SHIFT 29
-#define CP_REG_NS_MASK (1 << CP_REG_NS_SHIFT)
-
-#define ENCODE_CP_REG(cp, is64, ns, crn, crm, opc1, opc2)   \
-    ((ns) << CP_REG_NS_SHIFT | ((cp) << 16) | ((is64) << 15) |   \
-     ((crn) << 11) | ((crm) << 7) | ((opc1) << 3) | (opc2))
-
-#define ENCODE_AA64_CP_REG(cp, crn, crm, op0, op1, op2) \
-    (CP_REG_AA64_MASK |                                 \
-     ((cp) << CP_REG_ARM_COPROC_SHIFT) |                \
-     ((op0) << CP_REG_ARM64_SYSREG_OP0_SHIFT) |         \
-     ((op1) << CP_REG_ARM64_SYSREG_OP1_SHIFT) |         \
-     ((crn) << CP_REG_ARM64_SYSREG_CRN_SHIFT) |         \
-     ((crm) << CP_REG_ARM64_SYSREG_CRM_SHIFT) |         \
-     ((op2) << CP_REG_ARM64_SYSREG_OP2_SHIFT))
-
-/* Convert a full 64 bit KVM register ID to the truncated 32 bit
- * version used as a key for the coprocessor register hashtable
- */
-static inline uint32_t kvm_to_cpreg_id(uint64_t kvmid)
-{
-    uint32_t cpregid = kvmid;
-    if ((kvmid & CP_REG_ARCH_MASK) == CP_REG_ARM64) {
-        cpregid |= CP_REG_AA64_MASK;
-    } else {
-        if ((kvmid & CP_REG_SIZE_MASK) == CP_REG_SIZE_U64) {
-            cpregid |= (1 << 15);
-        }
-
-        /* KVM is always non-secure so add the NS flag on AArch32 register
-         * entries.
-         */
-         cpregid |= 1 << CP_REG_NS_SHIFT;
-    }
-    return cpregid;
-}
-
-/* Convert a truncated 32 bit hashtable key into the full
- * 64 bit KVM register ID.
- */
-static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
-{
-    uint64_t kvmid;
-
-    if (cpregid & CP_REG_AA64_MASK) {
-        kvmid = cpregid & ~CP_REG_AA64_MASK;
-        kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM64;
-    } else {
-        kvmid = cpregid & ~(1 << 15);
-        if (cpregid & (1 << 15)) {
-            kvmid |= CP_REG_SIZE_U64 | CP_REG_ARM;
-        } else {
-            kvmid |= CP_REG_SIZE_U32 | CP_REG_ARM;
-        }
-    }
-    return kvmid;
-}
-
 /* Return the highest implemented Exception Level */
 static inline int arm_highest_el(CPUARMState *env)
 {
-- 
2.35.3
