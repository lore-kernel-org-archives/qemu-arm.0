Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp939495njx;
        Fri, 25 Oct 2024 03:20:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXElJB5zmxMeplnyAFmGkmoaAvhvFLI+uc17MjwChqzEDsprL/QUEWRygD0fkDtXMJKLdlTrim2ye4cBg==@linaro.org
X-Google-Smtp-Source: AGHT+IFvHfaLcMZ/IVDrNna8ob+j0rKXbGV6ktAdfoSsBNJeVoYgTMDZlZUlupvjjSkGl36zS5sS
X-Received: by 2002:a05:6122:2226:b0:50d:6a43:d525 with SMTP id 71dfb90a1353d-50fd00c4921mr10412942e0c.1.1729851630704;
        Fri, 25 Oct 2024 03:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729851630; cv=none;
        d=google.com; s=arc-20240605;
        b=AoRuaRpkcXExNTm57H1uV88yOnA5dOuxaA7CAxSKtEglGup1L+GaVIhAzSsuZyNpUR
         yVBDJhWFKAHJaY1m0S+/QxuE8/XYE0qkKgTXmpLJ0dpvNoDpY8gw76EJdD/Ghq2dNTzQ
         7JIRyCAbhIPaBMkoQyATkSVdbjk+ws/KMCn0/qZ2f7thkodxAkowZNu5XyX6NObkJiO9
         oF2p+ERuIB8rRSmnBMJC9B7j2sP6kexIkPw1PjkB/QOrk+oB51ikiPcJVLWW/Yff65/p
         3Kv2YGccs93/PkIFL2tACJUexazRdp6leK2bJ/FLP/CzmigU69HtBTAsNpbLz2hlbsLi
         iCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kp5QFl0T+y2RN+mj0Xap6zvqN21krl+Kxh65E9f4CQI=;
        fh=g9Vpjz63mVuJw8UctUd3g7QIg2gWmZ7/W2EH3lsjMnE=;
        b=Y/y59MbjFse/bC+liNpnU4424DF9XaVyM1y0+BYPMR3b+ECOk18cRWDihB5Lw8adgL
         jT/vxJ+KztS2xnGP+pMR+lOdURYNcxmjmTnKoV/VnS3mFsr6vZcLlDrU6gZKatCWU22M
         l9Ynnlu0mlsS9TNgC90JHoKG3cUwUD3dKCUhxPOPZYqhgAQhesS+9fOuo78KkDLOryEs
         ZBUiXVBK1KDEG9pkqrzlp93NTOUcBPWwbgnfGfWNbp9GSzzm/Xa4akV9Q0tradkUckc7
         EYLgk+zMeiIwrc09ZnttAHm+ySm7EPWTD4JBTRxEYJkffi7lqSFmsANoILQpPRzC4nUu
         Suvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aOJfebS9;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d35b962si113224085a.541.2024.10.25.03.20.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:20:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aOJfebS9;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729851630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kp5QFl0T+y2RN+mj0Xap6zvqN21krl+Kxh65E9f4CQI=;
	b=aOJfebS99HiHQ0ids/ETdrg5GAt0P8HQU/BGvy1O3PTS6wjc3hhYchtWzN/eZrLOv+rFcp
	vv5qJQTfmpvomxj8QMzLFi18651xXcgS0MJOCEP273CmomPtGmu/vhpvhOW3TQ1THZI/ym
	3/1nIgrpn9NdMeE+kGEL7AE/uatvgtg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-111-vN9ycNIOMZenEaTWGsnKyw-1; Fri,
 25 Oct 2024 06:20:27 -0400
X-MC-Unique: vN9ycNIOMZenEaTWGsnKyw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E0B019560BA;
	Fri, 25 Oct 2024 10:20:24 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.5])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 37739196BB7D;
	Fri, 25 Oct 2024 10:20:17 +0000 (UTC)
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
Subject: [RFC 01/21] kvm: kvm_get_writable_id_regs
Date: Fri, 25 Oct 2024 12:17:20 +0200
Message-ID: <20241025101959.601048-2-eric.auger@redhat.com>
In-Reply-To: <20241025101959.601048-1-eric.auger@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: pZ1fZtDx18vx

From: Cornelia Huck <cohuck@redhat.com>

Add an helper to retrieve the writable id reg bitmask. The
status of the query is stored in the CPU struct so that an
an error, if any, can be reported on vcpu realize().

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu.h     | 19 +++++++++++++++++++
 target/arm/kvm_arm.h |  7 +++++++
 target/arm/kvm.c     | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d8eb986a04..1493b35d99 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -821,6 +821,19 @@ typedef struct {
     uint32_t map, init, supported;
 } ARMVQMap;
 
+typedef enum ARMIdRegsState {
+    WRITABLE_ID_REGS_UNKNOWN,
+    WRITABLE_ID_REGS_NOT_DISCOVERABLE,
+    WRITABLE_ID_REGS_FAILED,
+    WRITABLE_ID_REGS_AVAIL,
+} ARMIdRegsState;
+
+#define NR_ID_REGS (3 * 8 * 8)
+
+typedef struct IdRegMap {
+    uint64_t regs[NR_ID_REGS];
+} IdRegMap;
+
 /**
  * ARMCPU:
  * @env: #CPUARMState
@@ -960,6 +973,12 @@ struct ArchCPU {
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
 
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index cfaa0d9bc7..9868065277 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -214,6 +214,8 @@ void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa);
 
 int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
+int kvm_arm_get_writable_id_regs(ARMCPU *cpu, IdRegMap *idregmap);
+
 #else
 
 /*
@@ -235,6 +237,11 @@ static inline bool kvm_arm_sve_supported(void)
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
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 70f79eda33..be98f8be18 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -47,6 +47,7 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
 static bool cap_has_mp_state;
 static bool cap_has_inject_serror_esr;
 static bool cap_has_inject_ext_dabt;
+static int cap_writable_id_regs;
 
 /**
  * ARMHostCPUFeatures: information about the host CPU (identified
@@ -478,6 +479,37 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
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
-- 
2.41.0
