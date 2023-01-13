Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp414039ejc;
        Fri, 13 Jan 2023 06:06:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu6rxKx35V0mQFEwnib3tlshgLsP3DO6JiM0tMQ6Wc+B4/wYLbq6L/urjArdtl6B6b9RpmU
X-Received: by 2002:adf:a497:0:b0:2b2:35:e0a4 with SMTP id g23-20020adfa497000000b002b20035e0a4mr21322954wrb.15.1673618800809;
        Fri, 13 Jan 2023 06:06:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618800; cv=none;
        d=google.com; s=arc-20160816;
        b=nLzXN4IMfOOQT6Soc/Cb8AzwBmFAZbW90CtzHMroOP8WMNtl5YNT2deYlCTbtxF9I1
         9kMAt9BTQHQbJ6zmvqngtmIBzZkdQvw1t8axg104bXrcvFT4hfmU9Y/MIKXa/lL9VYqm
         kGuhaQRUuuaxr7dBuCscGhjlSWld/f4ZSOoqWv/mJ7qze2a2RB9U5dKXuPPcG4em+C1w
         B2A9CpX9rqhBHF878vQ0ATw851L8Uy/cXTK2JEkLJbNFAbnXcE+e8ukSVMgtUWRar/n0
         ky+olJzalSOyYitmXX32vpczreOZxb9r6+OotrybDl8M4V0teQA6agvXJH0r4TinupT3
         bNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=w2OLM5mYa7QFJuD3yJxy3ttAqPfs5euL3xzx3UxYHtc=;
        b=hPx4jNIKATacWTZQJvCtfTzKnWWwXuHO/erdd0drR04iGylXdHuku6AUWcrd41oMl3
         FvYsklPKkThauWZb8bQYX8zSsu8BWV3RR8huP8Cgx0zvhEb2+qHoHAaNETY0XwPHhPeZ
         39yOUxcp7a/MuQJ570iBZTaqVgCShtg4o1O4VXExYDacbAJZPe/VGWqDioQtyXIwTRV9
         PO6xOWpGsZnBl6/XQKO4ZSy5GyPeah/bcHEQ5MuDj38dkldr3b1QQlZScyMgctojIVLW
         W8j/hZf3+/sPR9vBwwbMRhtCIaaMt4ZU1Nm3u+VMco82mwXHdv45bW7l778lGUqV9nKx
         dQKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Vhn1Za3z;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id x12-20020adff0cc000000b002bde4952d88si991920wro.435.2023.01.13.06.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:06:40 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Vhn1Za3z;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D860256BB;
	Fri, 13 Jan 2023 14:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2OLM5mYa7QFJuD3yJxy3ttAqPfs5euL3xzx3UxYHtc=;
	b=Vhn1Za3znJpO6I1R/N0lQ9V0gX83U/ECGXmRXikTmX0PzNhB3yTVXi1aRsQio8RKH2BWIv
	zVXXuwbrg+FSGd+BAduAXtlUaPCP2IdK3/HVgz1+rSuQcoiMOmKht9zjaur4kuQ6TDd0lY
	SjCVNJpBuhEpdHG4+qrIi5FotFAS9QM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618800;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2OLM5mYa7QFJuD3yJxy3ttAqPfs5euL3xzx3UxYHtc=;
	b=PGjhK1F67dix/tpXuNLB27jJQOJte/gdgyB8b48G4cRLO8eOtwqoeODC5mZyOJ9P4uaDjx
	Nzg1hRVrLSISvgAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF4D01358A;
	Fri, 13 Jan 2023 14:06:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sMnXIW1lwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:06:37 +0000
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
Subject: [RFC PATCH v3 05/28] target/arm: Move cpregs code out of cpu.h
Date: Fri, 13 Jan 2023 11:03:56 -0300
Message-Id: <20230113140419.4013-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LENl1vKQBXUM

Since commit cf7c6d1004 ("target/arm: Split out cpregs.h") we now have
a cpregs.h header which is more suitable for this code.

Code moved verbatim.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpregs.h | 98 +++++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h    | 91 -----------------------------------------
 2 files changed, 98 insertions(+), 91 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 7e78c2c05c..e20078a390 100644
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
index a471add499..d588bf7c2b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2669,97 +2669,6 @@ static inline bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure)
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
