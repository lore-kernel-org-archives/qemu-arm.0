Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp929201njm;
        Wed, 5 Mar 2025 08:39:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW2di4dG1JLa5J9mcippx6qQGNqJ1Qa1H39icz7PLFMwJr4v1fHjzbI5VDmQnUr4TW7VFVi19L4qFLQCA==@linaro.org
X-Google-Smtp-Source: AGHT+IE72zfq83Myd9A2kCkA7tOeikZcPTy8E/GHxwd1oFkCNZ2cKGtT76Sac8C8O+qj2Tj7dktI
X-Received: by 2002:a05:6214:240f:b0:6e8:f2ec:4933 with SMTP id 6a1803df08f44-6e8f2ec4a8fmr11197816d6.30.1741192780686;
        Wed, 05 Mar 2025 08:39:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741192780; cv=none;
        d=google.com; s=arc-20240605;
        b=Ts3akacUxd3a6oklNFOVKk4/1zae5zecPPwHxRQjnSR97SvqbsyclFneXASqcY8udR
         bhXxrDCVEz6CKfKed2/8q67pFHWeKT+4VCyYaGRvpIUaDeA2T0RAILAPSHOwy9e0S0HE
         22Vni2flmxVaak0sWXZBRty/yWZS9kXoiUeV9WIsbHQSVPOiIscrhlbBzHCjZ+2mV7Bc
         lxw2+m0UsYmc/qfHbA++BjA94DInhipYklpWCj3uOVp8PBkCkAAbfEy2YBNsBLRKDVlA
         WSCyU1z1vkbK20ep03FLUqYbwrjwMYy5DH7nhJ2PwHT54dRhRBhE1oKqHLjkTmZ1oTYW
         QOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i4nAvmQ/93uYKI1gE4iypCdODqiR7Tb0Sk9eQd80EE0=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=EkZ78jdr+wBkUzZknyFaiQiton7F+0zKiWi3VT52LlGlobbUcRhRJXucwsS8Fh1kd1
         218UyEOEOGtMegvSGN++3m54/QjOXQ++FevKOXYlJPCPnSguWc4l0in9hJnlA9zYiXr0
         +3alx3F4PPs1NMOqC2b2boBTcNfNoj3F9Ju4LaeNRDoc4dK4B7RjePLKhyoJ8R2D0bqL
         HQ/632p4730ohyDsQWwk8alquV9dwjw0BFTom7WTREuu6uzFs+QyTb7MwrYitoOxQ3to
         Lm9JfTibdiKW3MH/GLLnsrJFw/An9cZmrxkqWnZlAS3HWFEt8RwMeblk9q78rDr9FmZT
         eakw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fyOYo01S;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8ea136f6csi13631436d6.472.2025.03.05.08.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 08:39:40 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fyOYo01S;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741192780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i4nAvmQ/93uYKI1gE4iypCdODqiR7Tb0Sk9eQd80EE0=;
	b=fyOYo01Sx53rV2B/jxTfXeqDbnjV0khA05AjDKuBz8QeRNYuy4hMZhweZZY//Gieq5erjZ
	AbM57Ns5qESex0LeceV+kLGCMu9w8NBEqNC8hL3OVrLiOhp9Urus2v0BrL9ykh0AGv8/7s
	pJZnWNHxROsjbIaxj6aqqE9eVSdBbyQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-674-FRJ-za1mOpCdPvsaQ1zrsw-1; Wed,
 05 Mar 2025 11:39:36 -0500
X-MC-Unique: FRJ-za1mOpCdPvsaQ1zrsw-1
X-Mimecast-MFC-AGG-ID: FRJ-za1mOpCdPvsaQ1zrsw_1741192774
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AE8D3180AF5A;
	Wed,  5 Mar 2025 16:39:33 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.9])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C69D21956095;
	Wed,  5 Mar 2025 16:39:17 +0000 (UTC)
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
Subject: [PATCH v2 03/14] arm/cpu: Store aa64isar0/aa64zfr0 into the idregs arrays
Date: Wed,  5 Mar 2025 17:38:08 +0100
Message-ID: <20250305163819.2477553-4-cohuck@redhat.com>
In-Reply-To: <20250305163819.2477553-1-cohuck@redhat.com>
References: <20250305163819.2477553-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: 1LcGZlBD6qXI

From: Eric Auger <eric.auger@redhat.com>

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu-features.h | 57 ++++++++++++++++++++-------------------
 target/arm/cpu.c          | 10 +++----
 target/arm/cpu.h          |  2 --
 target/arm/cpu64.c        |  8 +++---
 target/arm/helper.c       |  6 +++--
 target/arm/hvf/hvf.c      |  3 ++-
 target/arm/kvm.c          |  8 +++---
 target/arm/tcg/cpu64.c    | 44 ++++++++++++++++++------------
 8 files changed, 75 insertions(+), 63 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 525e4cee12f6..779bcd1abb36 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -22,6 +22,7 @@
 
 #include "hw/registerfields.h"
 #include "qemu/host-utils.h"
+#include "cpu-sysregs.h"
 
 /*
  * Naming convention for isar_feature functions:
@@ -376,92 +377,92 @@ static inline bool isar_feature_aa32_doublelock(const ARMISARegisters *id)
  */
 static inline bool isar_feature_aa64_aes(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, AES) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, AES) != 0;
 }
 
 static inline bool isar_feature_aa64_pmull(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, AES) > 1;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, AES) > 1;
 }
 
 static inline bool isar_feature_aa64_sha1(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, SHA1) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, SHA1) != 0;
 }
 
 static inline bool isar_feature_aa64_sha256(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, SHA2) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, SHA2) != 0;
 }
 
 static inline bool isar_feature_aa64_sha512(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, SHA2) > 1;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, SHA2) > 1;
 }
 
 static inline bool isar_feature_aa64_crc32(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, CRC32) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, CRC32) != 0;
 }
 
 static inline bool isar_feature_aa64_atomics(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, ATOMIC) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, ATOMIC) != 0;
 }
 
 static inline bool isar_feature_aa64_rdm(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, RDM) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, RDM) != 0;
 }
 
 static inline bool isar_feature_aa64_sha3(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, SHA3) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, SHA3) != 0;
 }
 
 static inline bool isar_feature_aa64_sm3(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, SM3) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, SM3) != 0;
 }
 
 static inline bool isar_feature_aa64_sm4(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, SM4) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, SM4) != 0;
 }
 
 static inline bool isar_feature_aa64_dp(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, DP) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, DP) != 0;
 }
 
 static inline bool isar_feature_aa64_fhm(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, FHM) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, FHM) != 0;
 }
 
 static inline bool isar_feature_aa64_condm_4(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TS) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, TS) != 0;
 }
 
 static inline bool isar_feature_aa64_condm_5(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TS) >= 2;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, TS) >= 2;
 }
 
 static inline bool isar_feature_aa64_rndr(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, RNDR) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, RNDR) != 0;
 }
 
 static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, TLB) == 2;
 }
 
 static inline bool isar_feature_aa64_tlbios(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, TLB) != 0;
 }
 
 static inline bool isar_feature_aa64_jscvt(const ARMISARegisters *id)
@@ -927,52 +928,52 @@ static inline bool isar_feature_aa64_doublelock(const ARMISARegisters *id)
 
 static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SVEVER) != 0;
 }
 
 static inline bool isar_feature_aa64_sve2_aes(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, AES) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, AES) != 0;
 }
 
 static inline bool isar_feature_aa64_sve2_pmull128(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, AES) >= 2;
+    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, AES) >= 2;
 }
 
 static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, BITPERM) != 0;
 }
 
 static inline bool isar_feature_aa64_sve_bf16(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BFLOAT16) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, BFLOAT16) != 0;
 }
 
 static inline bool isar_feature_aa64_sve2_sha3(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SHA3) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SHA3) != 0;
 }
 
 static inline bool isar_feature_aa64_sve2_sm4(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SM4) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SM4) != 0;
 }
 
 static inline bool isar_feature_aa64_sve_i8mm(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, I8MM) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, I8MM) != 0;
 }
 
 static inline bool isar_feature_aa64_sve_f32mm(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, F32MM) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, F32MM) != 0;
 }
 
 static inline bool isar_feature_aa64_sve_f64mm(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, F64MM) != 0;
+    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, F64MM) != 0;
 }
 
 static inline bool isar_feature_aa64_sme_f64f64(const ARMISARegisters *id)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 656070afb597..ff4fcab35ff6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1971,6 +1971,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
     ARMCPU *cpu = ARM_CPU(dev);
+    ARMISARegisters *isar = &cpu->isar;
     ARMCPUClass *acc = ARM_CPU_GET_CLASS(dev);
     CPUARMState *env = &cpu->env;
     Error *local_err = NULL;
@@ -2172,7 +2173,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
         unset_feature(env, ARM_FEATURE_NEON);
 
-        t = cpu->isar.id_aa64isar0;
+        t = GET_IDREG(isar, ID_AA64ISAR0);
         t = FIELD_DP64(t, ID_AA64ISAR0, AES, 0);
         t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 0);
         t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 0);
@@ -2180,7 +2181,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 0);
         t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 0);
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 0);
-        cpu->isar.id_aa64isar0 = t;
+        SET_IDREG(isar, ID_AA64ISAR0, t);
 
         t = cpu->isar.id_aa64isar1;
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 0);
@@ -2222,12 +2223,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     if (!cpu->has_neon && !cpu->has_vfp) {
-        uint64_t t;
         uint32_t u;
 
-        t = cpu->isar.id_aa64isar0;
-        t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 0);
-        cpu->isar.id_aa64isar0 = t;
+        FIELD_DP64_IDREG(isar, ID_AA64ISAR0, FHM, 0);
 
         t = cpu->isar.id_aa64isar1;
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 0);
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 60335f8893fa..c7436bd29477 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1097,7 +1097,6 @@ struct ArchCPU {
         uint32_t dbgdidr;
         uint32_t dbgdevid;
         uint32_t dbgdevid1;
-        uint64_t id_aa64isar0;
         uint64_t id_aa64isar1;
         uint64_t id_aa64isar2;
         uint64_t id_aa64pfr0;
@@ -1108,7 +1107,6 @@ struct ArchCPU {
         uint64_t id_aa64mmfr3;
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
-        uint64_t id_aa64zfr0;
         uint64_t id_aa64smfr0;
         uint64_t reset_pmcr_el0;
         uint64_t idregs[NUM_ID_IDX];
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9ae78253cb34..74f9caeb0c03 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -114,7 +114,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
              * SVE is disabled and so are all vector lengths.  Good.
              * Disable all SVE extensions as well.
              */
-            cpu->isar.id_aa64zfr0 = 0;
+            SET_IDREG(&cpu->isar, ID_AA64ZFR0, 0);
             return;
         }
 
@@ -617,6 +617,7 @@ void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
 static void aarch64_a57_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
 
     cpu->dtb_compatible = "arm,cortex-a57";
     set_feature(&cpu->env, ARM_FEATURE_V8);
@@ -654,7 +655,7 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->isar.id_isar6 = 0;
     cpu->isar.id_aa64pfr0 = 0x00002222;
     cpu->isar.id_aa64dfr0 = 0x10305106;
-    cpu->isar.id_aa64isar0 = 0x00011120;
+    SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
     cpu->isar.id_aa64mmfr0 = 0x00001124;
     cpu->isar.dbgdidr = 0x3516d000;
     cpu->isar.dbgdevid = 0x01110f13;
@@ -678,6 +679,7 @@ static void aarch64_a57_initfn(Object *obj)
 static void aarch64_a53_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
 
     cpu->dtb_compatible = "arm,cortex-a53";
     set_feature(&cpu->env, ARM_FEATURE_V8);
@@ -715,7 +717,7 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->isar.id_isar6 = 0;
     cpu->isar.id_aa64pfr0 = 0x00002222;
     cpu->isar.id_aa64dfr0 = 0x10305106;
-    cpu->isar.id_aa64isar0 = 0x00011120;
+    SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
     cpu->isar.id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
     cpu->isar.dbgdidr = 0x3516d000;
     cpu->isar.dbgdevid = 0x00110f13;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 71dead7241b4..3db044f85077 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7529,6 +7529,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 {
     /* Register all the coprocessor registers based on feature bits */
     CPUARMState *env = &cpu->env;
+    ARMISARegisters *isar = &cpu->isar;
+
     if (arm_feature(env, ARM_FEATURE_M)) {
         /* M profile has no coprocessor registers */
         return;
@@ -7718,7 +7720,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 4,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->isar.id_aa64zfr0 },
+              .resetvalue = GET_IDREG(isar, ID_AA64ZFR0)},
             { .name = "ID_AA64SMFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 5,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -7778,7 +7780,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = cpu->isar.id_aa64isar0 },
+              .resetvalue = GET_IDREG(isar, ID_AA64ISAR0)},
             { .name = "ID_AA64ISAR1_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0afd96018e06..ad8b12e518d1 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -19,6 +19,7 @@
 #include "system/hw_accel.h"
 #include "hvf_arm.h"
 #include "cpregs.h"
+#include "cpu-sysregs.h"
 
 #include <mach/mach_time.h>
 
@@ -865,7 +866,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.id_aa64pfr1 },
         { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
         { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
-        { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
+        { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.idregs[ID_AA64ISAR0_EL1_IDX] },
         { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
         /* Add ID_AA64ISAR2_EL1 here when HVF supports it */
         { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 2381c87e4ba1..99f1119e59aa 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -26,6 +26,7 @@
 #include "system/kvm_int.h"
 #include "kvm_arm.h"
 #include "cpu.h"
+#include "cpu-sysregs.h"
 #include "trace.h"
 #include "internals.h"
 #include "hw/pci/pci.h"
@@ -318,6 +319,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
     ahcf->target = init.target;
     ahcf->dtb_compatible = "arm,arm-v8";
+    int fd = fdarray[2];
 
     err = read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
                          ARM64_SYS_REG(3, 0, 0, 4, 0));
@@ -349,8 +351,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 5, 0));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr1,
                               ARM64_SYS_REG(3, 0, 0, 5, 1));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar0,
-                              ARM64_SYS_REG(3, 0, 0, 6, 0));
+        err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR0_EL1_IDX);
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar1,
                               ARM64_SYS_REG(3, 0, 0, 6, 1));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar2,
@@ -459,8 +460,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
              * enabled SVE support, which resulted in an error rather than RAZ.
              * So only read the register if we set KVM_ARM_VCPU_SVE above.
              */
-            err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
-                                  ARM64_SYS_REG(3, 0, 0, 4, 4));
+            err |= get_host_cpu_reg(fd, ahcf, ID_AA64ZFR0_EL1_IDX);
         }
     }
 
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 29ab0ac79da9..f31bb9ceaac9 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -32,6 +32,7 @@
 static void aarch64_a35_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
 
     cpu->dtb_compatible = "arm,cortex-a35";
     set_feature(&cpu->env, ARM_FEATURE_V8);
@@ -66,7 +67,7 @@ static void aarch64_a35_initfn(Object *obj)
     cpu->isar.id_aa64pfr1 = 0;
     cpu->isar.id_aa64dfr0 = 0x10305106;
     cpu->isar.id_aa64dfr1 = 0;
-    cpu->isar.id_aa64isar0 = 0x00011120;
+    SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
     cpu->isar.id_aa64isar1 = 0;
     cpu->isar.id_aa64mmfr0 = 0x00101122;
     cpu->isar.id_aa64mmfr1 = 0;
@@ -204,6 +205,7 @@ static const Property arm_cpu_lpa2_property =
 static void aarch64_a55_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
 
     cpu->dtb_compatible = "arm,cortex-a55";
     set_feature(&cpu->env, ARM_FEATURE_V8);
@@ -221,7 +223,7 @@ static void aarch64_a55_initfn(Object *obj)
     cpu->ctr = 0x84448004; /* L1Ip = VIPT */
     cpu->dcz_blocksize = 4; /* 64 bytes */
     cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
-    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+    SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
     cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
     cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
@@ -276,6 +278,7 @@ static void aarch64_a55_initfn(Object *obj)
 static void aarch64_a72_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
 
     cpu->dtb_compatible = "arm,cortex-a72";
     set_feature(&cpu->env, ARM_FEATURE_V8);
@@ -311,7 +314,7 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->isar.id_isar5 = 0x00011121;
     cpu->isar.id_aa64pfr0 = 0x00002222;
     cpu->isar.id_aa64dfr0 = 0x10305106;
-    cpu->isar.id_aa64isar0 = 0x00011120;
+    SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
     cpu->isar.id_aa64mmfr0 = 0x00001124;
     cpu->isar.dbgdidr = 0x3516d000;
     cpu->isar.dbgdevid = 0x01110f13;
@@ -335,6 +338,7 @@ static void aarch64_a72_initfn(Object *obj)
 static void aarch64_a76_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
 
     cpu->dtb_compatible = "arm,cortex-a76";
     set_feature(&cpu->env, ARM_FEATURE_V8);
@@ -352,7 +356,7 @@ static void aarch64_a76_initfn(Object *obj)
     cpu->ctr = 0x8444C004;
     cpu->dcz_blocksize = 4;
     cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
-    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+    SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
     cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
     cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
@@ -408,6 +412,7 @@ static void aarch64_a76_initfn(Object *obj)
 static void aarch64_a64fx_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
 
     cpu->dtb_compatible = "arm,a64fx";
     set_feature(&cpu->env, ARM_FEATURE_V8);
@@ -431,9 +436,9 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
     cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
     cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
-    cpu->isar.id_aa64isar0 = 0x0000000010211120;
+    SET_IDREG(isar, ID_AA64ISAR0, 0x0000000010211120);
     cpu->isar.id_aa64isar1 = 0x0000000000010001;
-    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
+    SET_IDREG(isar, ID_AA64ZFR0, 0x0000000000000000);
     cpu->clidr = 0x0000000080000023;
     /* 64KB L1 dcache */
     cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 256, 64 * KiB, 7);
@@ -581,6 +586,7 @@ static void define_neoverse_v1_cp_reginfo(ARMCPU *cpu)
 static void aarch64_neoverse_n1_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
 
     cpu->dtb_compatible = "arm,neoverse-n1";
     set_feature(&cpu->env, ARM_FEATURE_V8);
@@ -598,7 +604,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
     cpu->ctr = 0x8444c004;
     cpu->dcz_blocksize = 4;
     cpu->isar.id_aa64dfr0  = 0x0000000110305408ull;
-    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
+    SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
     cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
     cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
@@ -656,6 +662,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
 static void aarch64_neoverse_v1_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
 
     cpu->dtb_compatible = "arm,neoverse-v1";
     set_feature(&cpu->env, ARM_FEATURE_V8);
@@ -676,7 +683,7 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
     cpu->id_aa64afr1 = 0x00000000;
     cpu->isar.id_aa64dfr0  = 0x000001f210305519ull;
     cpu->isar.id_aa64dfr1 = 0x00000000;
-    cpu->isar.id_aa64isar0 = 0x1011111110212120ull; /* with FEAT_RNG */
+    SET_IDREG(isar, ID_AA64ISAR0, 0x1011111110212120ull); /* with FEAT_RNG */
     cpu->isar.id_aa64isar1 = 0x0011100001211032ull;
     cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
@@ -735,7 +742,7 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
     cpu->isar.mvfr2 = 0x00000043;
 
     /* From 3.7.5 ID_AA64ZFR0_EL1 */
-    cpu->isar.id_aa64zfr0 = 0x0000100000100000;
+    SET_IDREG(isar, ID_AA64ZFR0, 0x0000100000100000);
     cpu->sve_vq.supported = (1 << 0)  /* 128bit */
                             | (1 << 1);  /* 256bit */
 
@@ -882,6 +889,7 @@ static const ARMCPRegInfo cortex_a710_cp_reginfo[] = {
 static void aarch64_a710_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
 
     cpu->dtb_compatible = "arm,cortex-a710";
     set_feature(&cpu->env, ARM_FEATURE_V8);
@@ -919,12 +927,12 @@ static void aarch64_a710_initfn(Object *obj)
     cpu->isar.id_pfr2  = 0x00000011;
     cpu->isar.id_aa64pfr0  = 0x1201111120111112ull; /* GIC filled in later */
     cpu->isar.id_aa64pfr1  = 0x0000000000000221ull;
-    cpu->isar.id_aa64zfr0  = 0x0000110100110021ull; /* with Crypto */
+    SET_IDREG(isar, ID_AA64ZFR0, 0x0000110100110021ull); /* with Crypto */
     cpu->isar.id_aa64dfr0  = 0x000011f010305619ull;
     cpu->isar.id_aa64dfr1  = 0;
     cpu->id_aa64afr0       = 0;
     cpu->id_aa64afr1       = 0;
-    cpu->isar.id_aa64isar0 = 0x0221111110212120ull; /* with Crypto */
+    SET_IDREG(isar, ID_AA64ISAR0, 0x0221111110212120ull); /* with Crypto */
     cpu->isar.id_aa64isar1 = 0x0010111101211052ull;
     cpu->isar.id_aa64mmfr0 = 0x0000022200101122ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
@@ -983,6 +991,7 @@ static const ARMCPRegInfo neoverse_n2_cp_reginfo[] = {
 static void aarch64_neoverse_n2_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
 
     cpu->dtb_compatible = "arm,neoverse-n2";
     set_feature(&cpu->env, ARM_FEATURE_V8);
@@ -1020,12 +1029,12 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
     cpu->isar.id_pfr2  = 0x00000011;
     cpu->isar.id_aa64pfr0  = 0x1201111120111112ull; /* GIC filled in later */
     cpu->isar.id_aa64pfr1  = 0x0000000000000221ull;
-    cpu->isar.id_aa64zfr0  = 0x0000110100110021ull; /* with Crypto */
+    SET_IDREG(isar, ID_AA64ZFR0, 0x0000110100110021ull); /* with Crypto */
     cpu->isar.id_aa64dfr0  = 0x000011f210305619ull;
     cpu->isar.id_aa64dfr1  = 0;
     cpu->id_aa64afr0       = 0;
     cpu->id_aa64afr1       = 0;
-    cpu->isar.id_aa64isar0 = 0x1221111110212120ull; /* with Crypto and FEAT_RNG */
+    SET_IDREG(isar, ID_AA64ISAR0, 0x1221111110212120ull); /* with Crypto and FEAT_RNG */
     cpu->isar.id_aa64isar1 = 0x0011111101211052ull;
     cpu->isar.id_aa64mmfr0 = 0x0000022200101125ull;
     cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
@@ -1083,6 +1092,7 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
 void aarch64_max_tcg_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
     uint64_t t;
     uint32_t u;
 
@@ -1133,7 +1143,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, CTR_EL0, DIC, 1);
     cpu->ctr = t;
 
-    t = cpu->isar.id_aa64isar0;
+    t = GET_IDREG(isar, ID_AA64ISAR0);
     t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
     t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
     t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2);     /* FEAT_SHA512 */
@@ -1148,7 +1158,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2);       /* FEAT_FlagM2 */
     t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);      /* FEAT_TLBIRANGE */
     t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);     /* FEAT_RNG */
-    cpu->isar.id_aa64isar0 = t;
+    SET_IDREG(isar, ID_AA64ISAR0, t);
 
     t = cpu->isar.id_aa64isar1;
     t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);      /* FEAT_DPB2 */
@@ -1244,7 +1254,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
     cpu->isar.id_aa64mmfr3 = t;
 
-    t = cpu->isar.id_aa64zfr0;
+    t = GET_IDREG(isar, ID_AA64ZFR0);
     t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
     t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);       /* FEAT_SVE_PMULL128 */
     t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);   /* FEAT_SVE_BitPerm */
@@ -1254,7 +1264,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);      /* FEAT_I8MM */
     t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);     /* FEAT_F32MM */
     t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);     /* FEAT_F64MM */
-    cpu->isar.id_aa64zfr0 = t;
+    SET_IDREG(isar, ID_AA64ZFR0, t);
 
     t = cpu->isar.id_aa64dfr0;
     t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 10); /* FEAT_Debugv8p8 */
-- 
2.48.1
