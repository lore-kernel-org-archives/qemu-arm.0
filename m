Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1977977njc;
        Tue, 11 Mar 2025 09:29:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUq3VgRSZx28DYs/DPe0XtoJKZcT8gVKwD0eqn0otV9T78Ek8Vy1MkpdX/EC7Fbhk7RK+kpfyX2PTHO2g==@linaro.org
X-Google-Smtp-Source: AGHT+IFcq3AJibB5YYQHeLfPXJNsJ0V6+0yVDYg/DoQD2BFGrZSzEMS9GmHBV/WlqrTc9bb7jS4C
X-Received: by 2002:a05:6214:258d:b0:6e8:f33f:147e with SMTP id 6a1803df08f44-6e9006041cfmr195082106d6.6.1741710549103;
        Tue, 11 Mar 2025 09:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741710549; cv=none;
        d=google.com; s=arc-20240605;
        b=LTVtlMTz2rukcu0ID3FbFzW4Be2+665At+ERPv5E43DzPOgWxHzxfMNOrhBm8Yy+/v
         XNjRRkc2AtXQkyYwcmBlwYgvTLOvUQHp9g3jsiGF58T3tudfe515BtNzhU0lrArh47FZ
         LudkOKAgcvUYP9R7ouV2evBR0IMB8N/iMJ5mCauXgGqsDDDGDlzYghBUEoZIbf10r1P2
         nnISAaYna4whwyJcdJdqPgIy+VWjlGqj0MGeGVeoE4SqqsrqP7R3B35FWuddHj2ktvDl
         5QZwyBEv6x4p0qYC/i94hyYygIPfW+CBi+ENF8yedY5OMeGTqCH4llnq19c+dVQj/+zT
         bRJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=V/g7TarSB28W1Y/52yrlgDX9qyNH+w7AG3qDnHZvj68=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=EylXxYqTnu0mLbdoXn1bNaZ7hWv+uR5drGs40OfRu3Nm83myPUW0e5n0FDFEHy5yqd
         Kjw688Pk4bielKPYLAYX4yqzzaaiPjLlen6h8+DPHo847SFmy76DG9JAQLa72KGIDBNQ
         qWC5EwbZVMU2DhGcDqXsEiLNkkzx/l//mF3v43915oM1lDP/WE2Ek1hmk6w6e/16bmf7
         4IEkpsR6KDlP2MYEG9e4AIIOuayx0zVSmA3M3irq0tSt4DLHsEdxZnbw7FxKvppDzsSL
         31GOy6Z8fIC+i0GVx2UCDcFgc9vq9p9YztgcPm0LD0wX3GXUgJSlLFVMysHXz2FL4cb6
         dQMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GKijwvJ5;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f71611bdsi115499856d6.182.2025.03.11.09.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:29:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GKijwvJ5;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741710548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V/g7TarSB28W1Y/52yrlgDX9qyNH+w7AG3qDnHZvj68=;
	b=GKijwvJ5m7ZN0SljC7qvKAVe8qjIXD6Oam0fdb5QuZQdVuq59F5kwzKL2xynPJH+r8tmxN
	dSwjHuowrsIwroDzO8LYsL4Mt3RG8vdoQ4JxoaU8YM/K7yQ/XGf+qVvE1BtavDbkjaC4vu
	sSR8e8z0y8YE3IqvsVsQI51wtHVvJ/U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-673-NTBGM7QgO5O-SCpLx0BwnA-1; Tue,
 11 Mar 2025 12:29:05 -0400
X-MC-Unique: NTBGM7QgO5O-SCpLx0BwnA-1
X-Mimecast-MFC-AGG-ID: NTBGM7QgO5O-SCpLx0BwnA_1741710543
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C757C1955BC6;
	Tue, 11 Mar 2025 16:29:02 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.185])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5D471180AF7C;
	Tue, 11 Mar 2025 16:28:46 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com,
	agraf@csgraf.de
Cc: shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 01/14] arm/cpu: Add sysreg definitions in cpu-sysregs.h
Date: Tue, 11 Mar 2025 17:28:11 +0100
Message-ID: <20250311162824.199721-2-cohuck@redhat.com>
In-Reply-To: <20250311162824.199721-1-cohuck@redhat.com>
References: <20250311162824.199721-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: xzGVDTppPDVD

From: Eric Auger <eric.auger@redhat.com>

This new header contains macros that define aarch64 registers.
In a subsequent patch, this will be replaced by a more exhaustive
version that will be generated from linux arch/arm64/tools/sysreg
file. Those macros are sufficient to migrate the storage of those
ID regs from named fields in isar struct to an array cell.

[CH: reworked to use different structures]
[CH: moved accessors from the patches first using them to here,
     dropped interaction with writable registers, which will happen
     later]
[CH: use DEF magic suggested by rth]
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-sysregs.h     | 37 +++++++++++++++++++++++++++
 target/arm/cpu-sysregs.h.inc | 35 ++++++++++++++++++++++++++
 target/arm/cpu.h             | 49 ++++++++++++++++++++++++++++++++++++
 target/arm/cpu64.c           | 22 ++++++++++++++++
 4 files changed, 143 insertions(+)
 create mode 100644 target/arm/cpu-sysregs.h
 create mode 100644 target/arm/cpu-sysregs.h.inc

diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
new file mode 100644
index 000000000000..b95320b5b595
--- /dev/null
+++ b/target/arm/cpu-sysregs.h
@@ -0,0 +1,37 @@
+#ifndef ARM_CPU_SYSREGS_H
+#define ARM_CPU_SYSREGS_H
+
+/*
+ * Following is similar to the coprocessor regs encodings, but with an argument
+ * ordering that matches the ARM ARM. We also reuse the various CP_REG_ defines
+ * that actually are the same as the equivalent KVM_REG_ values.
+ */
+#define ENCODE_ID_REG(op0, op1, crn, crm, op2)          \
+    (((op0) << CP_REG_ARM64_SYSREG_OP0_SHIFT) |         \
+     ((op1) << CP_REG_ARM64_SYSREG_OP1_SHIFT) |         \
+     ((crn) << CP_REG_ARM64_SYSREG_CRN_SHIFT) |         \
+     ((crm) << CP_REG_ARM64_SYSREG_CRM_SHIFT) |         \
+     ((op2) << CP_REG_ARM64_SYSREG_OP2_SHIFT))
+
+#define DEF(NAME, OP0, OP1, CRN, CRM, OP2) NAME##_IDX,
+
+typedef enum ARMIDRegisterIdx {
+#include "cpu-sysregs.h.inc"
+    NUM_ID_IDX,
+} ARMIDRegisterIdx;
+
+#undef DEF
+#define DEF(NAME, OP0, OP1, CRN, CRM, OP2) \
+    SYS_##NAME = ENCODE_ID_REG(OP0, OP1, CRN, CRM, OP2),
+
+typedef enum ARMSysRegs {
+#include "cpu-sysregs.h.inc"
+} ARMSysRegs;
+
+#undef DEF
+
+extern const uint32_t id_register_sysreg[NUM_ID_IDX];
+
+int get_sysreg_idx(ARMSysRegs sysreg);
+
+#endif /* ARM_CPU_SYSREGS_H */
diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
new file mode 100644
index 000000000000..6c9f9981cc5d
--- /dev/null
+++ b/target/arm/cpu-sysregs.h.inc
@@ -0,0 +1,35 @@
+DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
+DEF(ID_AA64PFR1_EL1, 3, 0, 0, 4, 1)
+DEF(ID_AA64SMFR0_EL1, 3, 0, 0, 4, 5)
+DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
+DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
+DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
+DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
+DEF(ID_AA64ISAR2_EL1, 3, 0, 0, 6, 2)
+DEF(ID_AA64MMFR0_EL1, 3, 0, 0, 7, 0)
+DEF(ID_AA64MMFR1_EL1, 3, 0, 0, 7, 1)
+DEF(ID_AA64MMFR2_EL1, 3, 0, 0, 7, 2)
+DEF(ID_AA64MMFR3_EL1, 3, 0, 0, 7, 3)
+DEF(ID_PFR0_EL1, 3, 0, 0, 1, 0)
+DEF(ID_PFR1_EL1, 3, 0, 0, 1, 1)
+DEF(ID_DFR0_EL1, 3, 0, 0, 1, 2)
+DEF(ID_MMFR0_EL1, 3, 0, 0, 1, 4)
+DEF(ID_MMFR1_EL1, 3, 0, 0, 1, 5)
+DEF(ID_MMFR2_EL1, 3, 0, 0, 1, 6)
+DEF(ID_MMFR3_EL1, 3, 0, 0, 1, 7)
+DEF(ID_ISAR0_EL1, 3, 0, 0, 2, 0)
+DEF(ID_ISAR1_EL1, 3, 0, 0, 2, 1)
+DEF(ID_ISAR2_EL1, 3, 0, 0, 2, 2)
+DEF(ID_ISAR3_EL1, 3, 0, 0, 2, 3)
+DEF(ID_ISAR4_EL1, 3, 0, 0, 2, 4)
+DEF(ID_ISAR5_EL1, 3, 0, 0, 2, 5)
+DEF(ID_MMFR4_EL1, 3, 0, 0, 2, 6)
+DEF(ID_ISAR6_EL1, 3, 0, 0, 2, 7)
+DEF(MVFR0_EL1, 3, 0, 0, 3, 0)
+DEF(MVFR1_EL1, 3, 0, 0, 3, 1)
+DEF(MVFR2_EL1, 3, 0, 0, 3, 2)
+DEF(ID_PFR2_EL1, 3, 0, 0, 3, 4)
+DEF(ID_DFR1_EL1, 3, 0, 0, 3, 5)
+DEF(ID_MMFR5_EL1, 3, 0, 0, 3, 6)
+DEF(ID_AA64ZFR0_EL1, 3, 0, 0, 4, 4)
+DEF(CTR_EL0, 3, 3, 0, 0, 1)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 215845c7e256..60335f8893fa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -30,6 +30,7 @@
 #include "qapi/qapi-types-common.h"
 #include "target/arm/multiprocessing.h"
 #include "target/arm/gtimer.h"
+#include "target/arm/cpu-sysregs.h"
 
 #ifdef TARGET_AARCH64
 #define KVM_HAVE_MCE_INJECTION 1
@@ -855,6 +856,53 @@ typedef struct {
     uint32_t map, init, supported;
 } ARMVQMap;
 
+/* REG is ID_XXX */
+#define FIELD_DP64_IDREG(ISAR, REG, FIELD, VALUE)                       \
+    ({                                                                  \
+        ARMISARegisters *i_ = (ISAR);                                   \
+        uint64_t regval = i_->idregs[REG ## _EL1_IDX];                  \
+        regval = FIELD_DP64(regval, REG, FIELD, VALUE);                 \
+        i_->idregs[REG ## _EL1_IDX] = regval;                           \
+    })
+
+#define FIELD_DP32_IDREG(ISAR, REG, FIELD, VALUE)                       \
+    ({                                                                  \
+        ARMISARegisters *i_ = (ISAR);                                   \
+        uint64_t regval = i_->idregs[REG ## _EL1_IDX];                  \
+        regval = FIELD_DP32(regval, REG, FIELD, VALUE);                 \
+        i_->idregs[REG ## _EL1_IDX] = regval;                           \
+    })
+
+#define FIELD_EX64_IDREG(ISAR, REG, FIELD)                              \
+    ({                                                                  \
+        const ARMISARegisters *i_ = (ISAR);                             \
+        FIELD_EX64(i_->idregs[REG ## _EL1_IDX], REG, FIELD);            \
+    })
+
+#define FIELD_EX32_IDREG(ISAR, REG, FIELD)                              \
+    ({                                                                  \
+        const ARMISARegisters *i_ = (ISAR);                             \
+        FIELD_EX32(i_->idregs[REG ## _EL1_IDX], REG, FIELD);            \
+    })
+
+#define FIELD_SEX64_IDREG(ISAR, REG, FIELD)                             \
+    ({                                                                  \
+        const ARMISARegisters *i_ = (ISAR);                             \
+        FIELD_SEX64(i_->idregs[REG ## _EL1_IDX], REG, FIELD);           \
+    })
+
+#define SET_IDREG(ISAR, REG, VALUE)                                     \
+    ({                                                                  \
+        ARMISARegisters *i_ = (ISAR);                                   \
+        i_->idregs[REG ## _EL1_IDX] = VALUE;                            \
+    })
+
+#define GET_IDREG(ISAR, REG)                                            \
+    ({                                                                  \
+        const ARMISARegisters *i_ = (ISAR);                             \
+        i_->idregs[REG ## _EL1_IDX];                                    \
+    })
+
 /**
  * ARMCPU:
  * @env: #CPUARMState
@@ -1063,6 +1111,7 @@ struct ArchCPU {
         uint64_t id_aa64zfr0;
         uint64_t id_aa64smfr0;
         uint64_t reset_pmcr_el0;
+        uint64_t idregs[NUM_ID_IDX];
     } isar;
     uint64_t midr;
     uint32_t revidr;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 8188ede5cc8a..62eff5375c19 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -36,6 +36,28 @@
 #include "cpu-features.h"
 #include "cpregs.h"
 
+/* convert between <register>_IDX and SYS_<register> */
+#define DEF(NAME, OP0, OP1, CRN, CRM, OP2)      \
+    [NAME##_IDX] = SYS_##NAME,
+
+const uint32_t id_register_sysreg[NUM_ID_IDX] = {
+#include "cpu-sysregs.h.inc"
+};
+
+#undef DEF
+#define DEF(NAME, OP0, OP1, CRN, CRM, OP2) \
+    case SYS_##NAME: return NAME##_IDX;
+
+int get_sysreg_idx(ARMSysRegs sysreg)
+{
+    switch (sysreg) {
+#include "cpu-sysregs.h.inc"
+    }
+    g_assert_not_reached();
+}
+
+#undef DEF
+
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
 {
     /*
-- 
2.48.1
