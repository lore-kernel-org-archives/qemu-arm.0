Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp939565njx;
        Fri, 25 Oct 2024 03:20:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlRE75JBjf0ihhtqcOzAo2ixjJxQaHgsGt7EFFtc5+eZGxoZkMPNAi1CZbUBaqd4/1dTWOvYTiC9e1WQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGVY11hC4ZmnRTh3S0OoAhakpM92r7E6LBKWHOEIuxF/epdzA7G47NZj+vstqJwvpeeUzeK
X-Received: by 2002:a05:6214:5d06:b0:6cb:e69d:4c0a with SMTP id 6a1803df08f44-6ce343042famr86084616d6.48.1729851638248;
        Fri, 25 Oct 2024 03:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729851638; cv=none;
        d=google.com; s=arc-20240605;
        b=Ql84xAQvd6lTNilfJd3vJu9JI94MBtfZaXswzwQ1C6k83ly5QhtViKyOePTgLCn4m9
         WDd4LU1rjVA2bGTN9DmIvlydPkjgqaTxdyC/ROLzcCRUxs5gFGFq6gdjLOBunXqlIR4m
         kPbpWVGkTOyWyksleJg55RC3LqoKsbZqj2e/RDcogWAfqmIQQ67ulm0zQmf3FAnCyxGl
         +zyUAPFvCpjXJIn8a0I9XJ18F3bYS6GIVo5a6YtpuhQwW9CsDyCS+YcacWwuG4jZ/EIQ
         M8pzKeif+5EmUxB8lgc7KhCGjHzWpfTulLF4BzmIKmFjN5knKjfWlq1vjLB0SxF4t2fm
         CFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ky3ThRkvDhjr0upkbEECwN+3U+A5A3WcAWKqNWydsmA=;
        fh=g9Vpjz63mVuJw8UctUd3g7QIg2gWmZ7/W2EH3lsjMnE=;
        b=EaxTKc5WGDyTj+MQMdOQSQFGvwl+ZRFo8dFrX6vSW+QppROMgLnPKkJOYBZ5pIlnBx
         VmXgZIlQRGeiHvTOTK5YWIdLxOi/9oPmw2gPJeYP+VEcTM3dMlirft0Gi4dtjE1RHdAK
         LJ2nNRq8lv17K2mJxCRoH7KmjShsjtX1WFZ3BYIJ81C64TIdTH9CgSZ5JSAwTs6E9xcQ
         qTarThUDUaF8sok+g3XyMEyQH17Kl7CV1GZc0pxwBbLTNCU36NDxkzaHD+f4yIwBwsHB
         b0ZYrTlVY8EFle63A9hSiCXnJ6OfV5K7vOVfCDjyzX/0k3vMw9XzltE4HA+v77ZwTKkH
         tuow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hiIfbDHv;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d179a11ae1si11667806d6.213.2024.10.25.03.20.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:20:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hiIfbDHv;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729851637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ky3ThRkvDhjr0upkbEECwN+3U+A5A3WcAWKqNWydsmA=;
	b=hiIfbDHvgSQjtj9+HQQausN7TnOlavWIGElvE6XFQplBFeNnKU+D7YnM79za8A+pk3HStB
	RbWFO6fbgN/KHWFcZoiVxW2uW1WfnwibeX21vuCa5Iwbfq4YU7+HGucDSBq8YUqozOgVVf
	qUmrDtAga4+X6qsqDUcqt9S7430YAGQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-533-ZohcQP7aM26-5wtACeHH9g-1; Fri,
 25 Oct 2024 06:20:33 -0400
X-MC-Unique: ZohcQP7aM26-5wtACeHH9g-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 260281956083;
	Fri, 25 Oct 2024 10:20:31 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.5])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C8165196BB7E;
	Fri, 25 Oct 2024 10:20:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	cohuck@redhat.com,
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
	pbonzini@redhat.com
Subject: [RFC 02/21] arm/cpu: Add sysreg definitions in cpu-sysegs.h
Date: Fri, 25 Oct 2024 12:17:21 +0200
Message-ID: <20241025101959.601048-3-eric.auger@redhat.com>
In-Reply-To: <20241025101959.601048-1-eric.auger@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: 8kYDXv96KMfu

This new header contains macros that define aarch64 regiters.
In a subsequent patche, this will be replaced by a more exhaustive
version that will be generated from linux arch/arm64/tools/sysreg
file. Those macros are sufficient to migrate the storage of those
ID regs from named fields in isar struct to an array cell.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/cpu-sysregs.h | 42 +++++++++++++++++++++++++++++++
 target/arm/cpu.h         | 54 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 target/arm/cpu-sysregs.h

diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
new file mode 100644
index 0000000000..f4b63a3af7
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
index 1493b35d99..0491a482f0 100644
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
@@ -834,6 +842,51 @@ typedef struct IdRegMap {
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
@@ -1043,6 +1096,7 @@ struct ArchCPU {
         uint64_t id_aa64zfr0;
         uint64_t id_aa64smfr0;
         uint64_t reset_pmcr_el0;
+        IdRegMap idregs;
     } isar;
     uint64_t midr;
     uint32_t revidr;
-- 
2.41.0
