Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp770244njb;
        Fri, 6 Dec 2024 03:22:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVXyTxrSHk2RxKlYsRQ5imi16S4b22ibFPS1KzM1iO/HoJlHg/FPn2B6YQQrLc6d3Ncz9xlDqvQ7MrQuA==@linaro.org
X-Google-Smtp-Source: AGHT+IE4WbqhRM+FyFUJarFKrIe+/lg0J1mf89/RHk9vxk5caa5cb5q1iqfICe3U8OuoM80ZxB+l
X-Received: by 2002:a05:6902:1b84:b0:e38:19a6:bbb7 with SMTP id 3f1490d57ef6-e3a0b0c50ccmr2770702276.18.1733484162603;
        Fri, 06 Dec 2024 03:22:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733484162; cv=none;
        d=google.com; s=arc-20240605;
        b=eZYclPK/yW9rkSK7l8WhDj2BBW7tgAMeywya6LiiHcQ61vvdjsFqEl50SD0rl4nsnH
         PI/SKDUtw6KZg8aRdB19rmrEV+gz4GOZSQeqvJp37jmSBH5PM6Sigy3Q6Z0kpKb7w1F+
         pUE6TIVbrCmmuEIaxr4IpK4VzDMA4gxt4bIkvFOCT7b5meqWyg6F86Gw3+ie5rUSJwmI
         a90eNILUgPl1zwUWrtZZ5vIGDOKbTeNdGKQeBiqE8xqpbPoguZso0K97w4Dt9NFlY6D6
         TxFf+6eA69ZbqRRYofPPECFoUJmB4WC1FqoRnrNEjuQfxwfdNJWyXbzTPeI3tTdw1nGL
         WwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qmjoLu6lY502Dk2o1GeUKH/NYKFssFYjNhZ6QNGQyQg=;
        fh=ou9WwAWkFbBDtrYluijzdFLlSJKncehGww8dMC2w/x0=;
        b=eWz0wjKAj7ggu9ZUUmXV/bsFCrN1p2LG+tNrfsNIpqYGrCpMx7JUhatpTs60A9DEIY
         O/2BQIB38+8O+PR+koNbXcyVSK3VPcRtJ1SbDEDtjeFvSQwIrAOkj0l9dp2q/gv6OmCV
         M9AdVG5GV9d/2wVnRkLWn2EZWsslcGied1GhRvyh7cQuyf1QOK6S/nDmDhyx4Aq+f4nL
         hghnS4JIA+kkcnAdxj8OmlZsIRhs7lGCkHHcp4m3FSsHuWHOeP8ZRpJkGcFMMaic93Jq
         d1xNaklb5UFp/FWtj09O/vTDRrhkForCAt99xcH4gViU3zYm7URD9oSCD/kzXFScOkh5
         HynA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K9dIbNDv;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4672986f090si40710391cf.711.2024.12.06.03.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:22:42 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K9dIbNDv;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733484162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qmjoLu6lY502Dk2o1GeUKH/NYKFssFYjNhZ6QNGQyQg=;
	b=K9dIbNDvkYzNlGeecUMZ6vUKgK4oexGdBUU1jNPMlhYSJb8c5kHpPYouR57xkMbMteSdHj
	RwMr58Kfw7uIBvfIun/6VSD00QMdJvzUe11zXUJjuLjpXh9SeXdb6PeJwMrceOCJ0JqRCb
	jF6xcvrVzBT+1azFuRa+iXsku2DQ3O0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-pRJRNUj1PWO-fXvFAraEtQ-1; Fri,
 06 Dec 2024 06:22:41 -0500
X-MC-Unique: pRJRNUj1PWO-fXvFAraEtQ-1
X-Mimecast-MFC-AGG-ID: pRJRNUj1PWO-fXvFAraEtQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B5D2319560A3;
	Fri,  6 Dec 2024 11:22:38 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-244.str.redhat.com [10.33.192.244])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 98EC519560AD;
	Fri,  6 Dec 2024 11:22:32 +0000 (UTC)
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
	jdenemar@redhat.com
Cc: shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RFCv2 02/20] arm/cpu: Add sysreg definitions in cpu-sysregs.h
Date: Fri,  6 Dec 2024 12:21:55 +0100
Message-ID: <20241206112213.88394-3-cohuck@redhat.com>
In-Reply-To: <20241206112213.88394-1-cohuck@redhat.com>
References: <20241206112213.88394-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: r9Zin9iVmAai

From: Eric Auger <eric.auger@redhat.com>

This new header contains macros that define aarch64 registers.
In a subsequent patch, this will be replaced by a more exhaustive
version that will be generated from linux arch/arm64/tools/sysreg
file. Those macros are sufficient to migrate the storage of those
ID regs from named fields in isar struct to an array cell.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-sysregs.h | 42 +++++++++++++++++++++++++++++++
 target/arm/cpu.h         | 54 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 target/arm/cpu-sysregs.h

diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
new file mode 100644
index 000000000000..f4b63a3af77b
--- /dev/null
+++ b/target/arm/cpu-sysregs.h
@@ -0,0 +1,42 @@
+#ifndef ARM_CPU_SYSREGS_H
+#define ARM_CPU_SYSREGS_H
+
+/* to be generated */
+
+#define SYS_ID_AA64PFR0_EL1                             sys_reg(3, 0, 0, 4, 0)
+#define SYS_ID_AA64PFR1_EL1                             sys_reg(3, 0, 0, 4, 1)
+#define SYS_ID_AA64SMFR0_EL1                            sys_reg(3, 0, 0, 4, 5)
+#define SYS_ID_AA64DFR0_EL1                             sys_reg(3, 0, 0, 5, 0)
+#define SYS_ID_AA64DFR1_EL1                             sys_reg(3, 0, 0, 5, 1)
+#define SYS_ID_AA64ISAR0_EL1                            sys_reg(3, 0, 0, 6, 0)
+#define SYS_ID_AA64ISAR1_EL1                            sys_reg(3, 0, 0, 6, 1)
+#define SYS_ID_AA64ISAR2_EL1                            sys_reg(3, 0, 0, 6, 2)
+#define SYS_ID_AA64MMFR0_EL1                            sys_reg(3, 0, 0, 7, 0)
+#define SYS_ID_AA64MMFR1_EL1                            sys_reg(3, 0, 0, 7, 1)
+#define SYS_ID_AA64MMFR2_EL1                            sys_reg(3, 0, 0, 7, 2)
+#define SYS_ID_AA64MMFR3_EL1                            sys_reg(3, 0, 0, 7, 3)
+
+#define SYS_ID_PFR0_EL1                                 sys_reg(3, 0, 0, 1, 0)
+#define SYS_ID_PFR1_EL1                                 sys_reg(3, 0, 0, 1, 1)
+#define SYS_ID_DFR0_EL1                                 sys_reg(3, 0, 0, 1, 2)
+#define SYS_ID_MMFR0_EL1                                sys_reg(3, 0, 0, 1, 4)
+#define SYS_ID_MMFR1_EL1                                sys_reg(3, 0, 0, 1, 5)
+#define SYS_ID_MMFR2_EL1                                sys_reg(3, 0, 0, 1, 6)
+#define SYS_ID_MMFR3_EL1                                sys_reg(3, 0, 0, 1, 7)
+#define SYS_ID_ISAR0_EL1                                sys_reg(3, 0, 0, 2, 0)
+#define SYS_ID_ISAR1_EL1                                sys_reg(3, 0, 0, 2, 1)
+#define SYS_ID_ISAR2_EL1                                sys_reg(3, 0, 0, 2, 2)
+#define SYS_ID_ISAR3_EL1                                sys_reg(3, 0, 0, 2, 3)
+#define SYS_ID_ISAR4_EL1                                sys_reg(3, 0, 0, 2, 4)
+#define SYS_ID_ISAR5_EL1                                sys_reg(3, 0, 0, 2, 5)
+#define SYS_ID_MMFR4_EL1                                sys_reg(3, 0, 0, 2, 6)
+#define SYS_ID_ISAR6_EL1                                sys_reg(3, 0, 0, 2, 7)
+#define SYS_MVFR0_EL1                                   sys_reg(3, 0, 0, 3, 0)
+#define SYS_MVFR1_EL1                                   sys_reg(3, 0, 0, 3, 1)
+#define SYS_MVFR2_EL1                                   sys_reg(3, 0, 0, 3, 2)
+#define SYS_ID_PFR2_EL1                                 sys_reg(3, 0, 0, 3, 4)
+#define SYS_ID_DFR1_EL1                                 sys_reg(3, 0, 0, 3, 5)
+#define SYS_ID_MMFR5_EL1                                sys_reg(3, 0, 0, 3, 6)
+#define SYS_ID_AA64ZFR0_EL1                             sys_reg(3, 0, 0, 4, 4)
+
+#endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e359152a4dbc..9e0403c9810a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -144,6 +144,14 @@ typedef struct ARMGenericTimer {
     uint64_t ctl; /* Timer Control register */
 } ARMGenericTimer;
 
+typedef struct ARMSysReg {
+    int op0;
+    int op1;
+    int crn;
+    int crm;
+    int op2;
+} ARMSysReg;
+
 /* Define a maximum sized vector register.
  * For 32-bit, this is a 128-bit NEON/AdvSIMD register.
  * For 64-bit, this is a 2048-bit SVE register.
@@ -841,6 +849,51 @@ typedef struct IdRegMap {
     uint64_t regs[NR_ID_REGS];
 } IdRegMap;
 
+#define ARM_FEATURE_ID_RANGE_IDX(op0, op1, crn, crm, op2)               \
+        ({                                                              \
+                __u64 __op1 = (op1) & 3;                                \
+                __op1 -= (__op1 == 3);                                  \
+                (__op1 << 6 | ((crm) & 7) << 3 | (op2));                \
+        })
+
+static inline uint64_t _get_idreg(const IdRegMap *map, ARMSysReg sr)
+{
+    int index = ARM_FEATURE_ID_RANGE_IDX(sr.op0, sr.op1, sr.crn, sr.crm, sr.op2);
+
+    return map->regs[index];
+}
+
+static inline void _set_idreg(IdRegMap *map, ARMSysReg sr, uint64_t value)
+{
+    int index = ARM_FEATURE_ID_RANGE_IDX(sr.op0, sr.op1, sr.crn, sr.crm, sr.op2);
+
+    map->regs[index] = value;
+}
+
+/* REG is ID_XXX */
+#define FIELD_DP64_IDREG(MAP, REG, FIELD, VALUE)              \
+{                                                             \
+uint64_t regval = _get_idreg(MAP, SYS_ ## REG ## _EL1);       \
+regval = FIELD_DP64(regval, REG, FIELD, VALUE);               \
+_set_idreg(MAP, SYS_ ## REG ## _EL1, regval);                 \
+}
+
+#define FIELD_EX64_IDREG(MAP, REG, FIELD)                     \
+FIELD_EX64(_get_idreg(MAP, SYS_ ## REG ## _EL1), REG, FIELD)  \
+
+#define SET_IDREG(MAP, REG, VALUE)                            \
+_set_idreg(MAP, SYS_ ## REG ## _EL1, VALUE)
+
+#define GET_IDREG(MAP, REG)                                   \
+_get_idreg(MAP, SYS_ ## REG ## _EL1)
+
+static inline ARMSysReg sys_reg(int op0, int op1, int crn, int crm, int op2)
+{
+        ARMSysReg sr = {op0, op1, crn, crm, op2};
+
+        return sr;
+}
+
 /**
  * ARMCPU:
  * @env: #CPUARMState
@@ -1052,6 +1105,7 @@ struct ArchCPU {
         uint64_t id_aa64zfr0;
         uint64_t id_aa64smfr0;
         uint64_t reset_pmcr_el0;
+        IdRegMap idregs;
     } isar;
     uint64_t midr;
     uint32_t revidr;
-- 
2.47.0
