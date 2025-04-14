Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2126040njc;
        Mon, 14 Apr 2025 09:40:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNfNFNTvEX1USeIYjWztsY0AKd6bA8y3gl8cXkIw4EqvR0bkTQ6tT3QFCDtmK+pUxUOiBVhoXNKdr1Aw==@linaro.org
X-Google-Smtp-Source: AGHT+IFrjJV4x28tBiwiKS1VXdHeOxV8nmLA15c1fZnn55xInsnTZoZUzKIN+1kEWmSpClCP8q5y
X-Received: by 2002:a05:6902:d43:b0:e60:a1a8:8448 with SMTP id 3f1490d57ef6-e704de74615mr20099292276.8.1744648827410;
        Mon, 14 Apr 2025 09:40:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744648827; cv=none;
        d=google.com; s=arc-20240605;
        b=kVkwI+FsKb9+dT6+rfjzdyE9HzypQXcSoXCPcd/by5hDftAejWQW6oJzjAnDTpVfae
         bMKOS7qrIOFwlY2G7WDzbvnn7cK2DTo3or/ydOYMapJuXQhFCshOyZy5m5+ZHpNCS1ZX
         Y9Q6/1sRA87e43Sv0VQrg3D2Vc/evl9zP1inMSitbBGhdIoW5c+TZMGKPCWq9HaTRbzH
         5W0lbWSkIHbca1rVg9YetdSKA1ua9KurImIHzbrByIz6Z2r7Z8vfjDM5GkPy+g14aH3i
         THBkCOIXvDYKP8dK/7Ef4mm1/vhdDYmlsvgomUBA9NEjApvnGJZ2GgC3J8Ky01kXtzUa
         WqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/c7JiX/L4oLi4jXQpUEkVkuVVt5PROWavD7NxMww6sE=;
        fh=6xsxbRFvSPtT8TG3B9HOEDad133GF2zMAz688Nd5+nE=;
        b=dS/h0LBOnIb6BXzEpbn88MRvYGxb4b2Fvm+hs6iR6UXfXsCOGU6s4+h+XLHOBtHjIc
         4ppoPIJOhL9o3MCn9PeFURwZyD3qzktZVABZiUos2eGyVCKRKBVY4lFfxE6kU+hCgPn/
         fGQi+8zGoRe1jsDsXyVu8hYnHbLNwOUh3Y1WWG70+EVznEWhk6gz4/Pz99NLIQtc/xwa
         6jwCCXzyS2HH/HGgGDH5Cj0LFeeYDiUK/zdTYiQ5waETFs6jmsd88hcDoz/Y0WUgPU4U
         I8/61k7pD4WPLAJpBXBwF9ojxJ4Fnlxhhc2mDpy5h8Q5VLidhr0E3tZMzdYKH9NW2Qn9
         +v5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DLVYasGl;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e7032444defsi14705193276.20.2025.04.14.09.40.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 09:40:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DLVYasGl;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744648827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/c7JiX/L4oLi4jXQpUEkVkuVVt5PROWavD7NxMww6sE=;
	b=DLVYasGlABM8ZUJfQEkaP8L3vtOl+uQvhHS/1IXs+Z0BEiG+IGvkhlOrem4HLwgT6nkNZy
	Vwmh4j5j1LfpirlW9QdxXzxd6Qe98bxWpO0mp60wdMy8XpaZqEITCxJiYM2wpFYDdqpwIs
	Qmyd/ghugQl9mA2l1iSKzxWBESJSkhM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-522-rgJqEI60MIi-19Hhx40NIA-1; Mon,
 14 Apr 2025 12:40:22 -0400
X-MC-Unique: rgJqEI60MIi-19Hhx40NIA-1
X-Mimecast-MFC-AGG-ID: rgJqEI60MIi-19Hhx40NIA_1744648819
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81119180AF50;
	Mon, 14 Apr 2025 16:40:19 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.14])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 68BEB1828AAA;
	Mon, 14 Apr 2025 16:40:03 +0000 (UTC)
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
Cc: agraf@csgraf.de,
	shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 04/10] kvm: kvm_get_writable_id_regs
Date: Mon, 14 Apr 2025 18:38:43 +0200
Message-ID: <20250414163849.321857-5-cohuck@redhat.com>
In-Reply-To: <20250414163849.321857-1-cohuck@redhat.com>
References: <20250414163849.321857-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: LLYNWgLTK02g

Add an helper to retrieve the writable id reg bitmask. The
status of the query is stored in the CPU struct so that an
an error, if any, can be reported on vcpu realize().

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu.h     | 26 ++++++++++++++++++++++++++
 target/arm/kvm.c     | 32 ++++++++++++++++++++++++++++++++
 target/arm/kvm_arm.h |  7 +++++++
 3 files changed, 65 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d27134f4a025..bbee7ff2414a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -856,6 +856,26 @@ typedef struct {
     uint32_t map, init, supported;
 } ARMVQMap;
 
+typedef enum ARMIdRegsState {
+    WRITABLE_ID_REGS_UNKNOWN,
+    WRITABLE_ID_REGS_NOT_DISCOVERABLE,
+    WRITABLE_ID_REGS_FAILED,
+    WRITABLE_ID_REGS_AVAIL,
+} ARMIdRegsState;
+
+/*
+ * The following structures are for the purpose of mapping the output of
+ * KVM_ARM_GET_REG_WRITABLE_MASKS that also may cover id registers we do
+ * not support in QEMU
+ * ID registers in op0==3, op1=={0,1,3}, crn=0, crm=={0-7}, op2=={0-7},
+ * as used by the KVM_ARM_GET_REG_WRITABLE_MASKS ioctl call.
+ */
+#define NR_ID_REGS (3 * 8 * 8)
+
+typedef struct IdRegMap {
+    uint64_t regs[NR_ID_REGS];
+} IdRegMap;
+
 /* REG is ID_XXX */
 #define FIELD_DP64_IDREG(ISAR, REG, FIELD, VALUE)                       \
     ({                                                                  \
@@ -1044,6 +1064,12 @@ struct ArchCPU {
      */
     bool host_cpu_probe_failed;
 
+    /*
+     * state of writable id regs query used to report an error, if any,
+     * on KVM custom vcpu model realize
+     */
+    ARMIdRegsState writable_id_regs;
+
     /* QOM property to indicate we should use the back-compat CNTFRQ default */
     bool backcompat_cntfrq;
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 8491f42a18d2..6e3cd06e9bc5 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -50,6 +50,7 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
 static bool cap_has_mp_state;
 static bool cap_has_inject_serror_esr;
 static bool cap_has_inject_ext_dabt;
+static int cap_writable_id_regs;
 
 /**
  * ARMHostCPUFeatures: information about the host CPU (identified
@@ -488,6 +489,37 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     env->features = arm_host_cpu_features.features;
 }
 
+int kvm_arm_get_writable_id_regs(ARMCPU *cpu, IdRegMap *idregmap)
+{
+    struct reg_mask_range range = {
+        .range = 0, /* up to now only a single range is supported */
+        .addr = (uint64_t)idregmap,
+    };
+    int ret;
+
+    if (!kvm_enabled()) {
+        cpu->writable_id_regs = WRITABLE_ID_REGS_NOT_DISCOVERABLE;
+        return -ENOSYS;
+    }
+
+    cap_writable_id_regs =
+        kvm_check_extension(kvm_state, KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES);
+
+    if (!cap_writable_id_regs ||
+        !(cap_writable_id_regs & (1 << KVM_ARM_FEATURE_ID_RANGE))) {
+        cpu->writable_id_regs = WRITABLE_ID_REGS_NOT_DISCOVERABLE;
+        return -ENOSYS;
+    }
+
+    ret = kvm_vm_ioctl(kvm_state, KVM_ARM_GET_REG_WRITABLE_MASKS, &range);
+    if (ret) {
+        cpu->writable_id_regs = WRITABLE_ID_REGS_FAILED;
+        return ret;
+     }
+    cpu->writable_id_regs = WRITABLE_ID_REGS_AVAIL;
+    return ret;
+}
+
 static bool kvm_no_adjvtime_get(Object *obj, Error **errp)
 {
     return !ARM_CPU(obj)->kvm_adjvtime;
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 05c3de8cd46e..8d1f20ca8d89 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -221,6 +221,8 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
 void kvm_arm_enable_mte(Object *cpuobj, Error **errp);
 
+int kvm_arm_get_writable_id_regs(ARMCPU *cpu, IdRegMap *idregmap);
+
 #else
 
 /*
@@ -247,6 +249,11 @@ static inline bool kvm_arm_mte_supported(void)
     return false;
 }
 
+static inline int kvm_arm_get_writable_id_regs(ARMCPU *cpu, IdRegMap *idregmap)
+{
+    return -ENOSYS;
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
-- 
2.49.0
