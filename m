Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp546696ejb;
        Mon, 13 Feb 2023 12:31:51 -0800 (PST)
X-Google-Smtp-Source: AK7set/5qVcYchzpuWTwiWalt33qbaXYIoLddkC9PYVJ7aubrEBnrVvKmc82nkYvLaZ/zfeC6m0p
X-Received: by 2002:a17:906:fc06:b0:894:acbe:7a97 with SMTP id ov6-20020a170906fc0600b00894acbe7a97mr241085ejb.13.1676320311430;
        Mon, 13 Feb 2023 12:31:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320311; cv=none;
        d=google.com; s=arc-20160816;
        b=v0/TvUHCe4L0580GeXK7V3qvjGKquZJPiWwweMjwAbsz2VGMPqYszyaHrkGYwUrGgr
         +Mk3vI6ZtKdZaAlFcr4uiUBBKDRaTAgUsFTDcCRe0xJ3dYtXK6m7ANuzhYZLGi1VqQuq
         QOlimchKRYcmjsz8nZZVjxpSn9opZhAD7kR1P7aMkFR4FPCaMU1oTJ1+sgossuFRV7Ui
         BRIpYsuYVHAfXGBHaJM0FEgfnufo39mwN22WDcWaehI1XdDHniEXXNyTqMLNb+9ujmRB
         ki+qHv6F4f5UcWtia3DOL66XUp+Jd2Pmo5W/IbBhm2H7IoDrmKk5dzEpC0Ncf9VN4/4t
         4LQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=pRXEAJI1jnhHZqXBSNTBSrxJuIrP6vE92++nhV6fyUM=;
        b=iCFl2PCVRKEwjdVnHtFl4qkUN7oZ24OyhGsBPbzCRE1WzI60wRSg4n0SjnbdyOtnka
         6vjwQGHpr2AHfodsIa5R5UL7/JCOYeBqUwqSTR62qnaJJ7NQCmZaQx1yufKb1+F6HUPK
         ve4Jj4DLZQWCAsk+2g16kJD9V6m+hyz3jU8Q4R8C8tcNulJXVTTU2kygBGGQymbBg843
         cN16HIz9jWgyXp339eGGXC1F/jAo3aZdTzd+6K2ciNMCO5PbiYs5puTu1IZLB4yoSYgW
         8BgcB+mouHQ4Z+ZaUa0xPMsKVEis68HLni6Ls8t4+I2qS08i9tDG42xoUZQnZqyDgA+E
         6H5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=D0zQsVBr;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id h18-20020a50ed92000000b004acc28218e7si5576097edr.581.2023.02.13.12.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:31:51 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=D0zQsVBr;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 04CD12233D;
	Mon, 13 Feb 2023 20:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pRXEAJI1jnhHZqXBSNTBSrxJuIrP6vE92++nhV6fyUM=;
	b=D0zQsVBrj/Ktu4rh4TzUdEN7fzLO5oqXwDNaDEk8oZA8RZzJGvmy095ftKWFKauLEzixCd
	TSwaIHPTig+lbky6LhfwHnpI6XmX154ma7uByCnvvRBCxgx3gtdybY1DSZ+Wmbu5deJ8MT
	BoyOoUO+35tWL8qFEEhoZeOSp46B1mo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320311;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pRXEAJI1jnhHZqXBSNTBSrxJuIrP6vE92++nhV6fyUM=;
	b=LlTXiX4VESCaUzsCuUBi9suaNcPKkdTpo/MMF5Os5ERXkA+yNSx6z3dBBOV7TDRkjlxucW
	joXxaaxcdTROHpAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE27F1391B;
	Mon, 13 Feb 2023 20:31:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WPhfLDOe6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:31:47 +0000
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
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RESEND v5 05/28] target/arm: Move cpregs code out of cpu.h
Date: Mon, 13 Feb 2023 17:29:04 -0300
Message-Id: <20230213202927.28992-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6yg1/ZUQSSv1

Since commit cf7c6d1004 ("target/arm: Split out cpregs.h") we now have
a cpregs.h header which is more suitable for this code.

Code moved verbatim.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpregs.h | 98 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h    | 91 -----------------------------------------
 2 files changed, 98 insertions(+), 91 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index efcf9181b9..1ee64e99de 100644
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
index 7bc97fece9..9d4573c53c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2680,97 +2680,6 @@ static inline bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure)
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
