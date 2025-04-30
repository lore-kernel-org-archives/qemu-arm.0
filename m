Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1004547njm;
        Wed, 30 Apr 2025 07:58:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUbIMcCY3s3wFAylrHYruueVkYgvy8g2tnwDlgATt1SEIX5T7ViEYY1Dg80FbQhE/VTLRBIClAkoZNiwQ==@linaro.org
X-Received: by 2002:a17:90b:5684:b0:2fa:13d9:39c with SMTP id 98e67ed59e1d1-30a343ecce0mr5200664a91.14.1746025134571;
        Wed, 30 Apr 2025 07:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746025134; cv=none;
        d=google.com; s=arc-20240605;
        b=MpDu9QVZtAeXmL2eNXJqOhwh8Krm63EoXf4pBFYc9rY06vEC0Wxiqr7EL6UcPODpDW
         NxMT5LfBxh4uistEej1Gr7Xue7tp3r+we/HWRB8fH3Dujn3oYGtYXCcLa6O7rVPwfhwO
         QHCuEClT/bF6gmii5VAhpJiqwEl5cdF3/funpyys5qaDqya/3UoWFC3rS47wElnO/yZ9
         xbnUnFRNqg7M2bo5mDZKRpvD9DurqtD0TyIcOYTlrjRSuDLa7AzXne1jx2go+hzPsEIs
         ixwina62FDryGMj7Nl74ssLsvks0dhSlDrgx1Ec77jyZAPP6JSDdKrVK3dgcKb5DXN6/
         QZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lgiqh7bhRD5cMq/BEBKsGo2haYh+WuQTB6qucvXC4NY=;
        fh=jv98g+FK4xuffSx3nBoPoyos0UIe9nF8ywiv7rAfSvs=;
        b=LuTLs3NAbsOk6fuzlYveQ/AD22MR/zGJelk2amFfemd+Mt9v3rXQXKmL1zK3Ksnou+
         yH2RzGVDMyhkONf1XjgbJZmzQfuoc/hXRa6EooRp5Oa/8AJ74GgIviRwEeF+2+Fvf30J
         jGBPcEqoT2YtYlBY/OK+6PtkEFlXcYkjSNkJdNQSc/dNwA0xzUBBY4ICNQnA/bwDY19l
         6Oeq3MD8Q0WNABSeP+vuJO2NhUl4imGaWv4HjoenCMHBegMFqNDiO3QbGKVwBxz1pa0L
         rTy66oRSkQ4uuH9oxDb6ZusSjf/mRbAd59SHNNJFe0K5loAOiDmfAwDGXmf5rzSDOhg+
         lf+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=blgFpqak;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-309ee84891fsor9288667a91.8.2025.04.30.07.58.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 07:58:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=blgFpqak;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746025134; x=1746629934; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgiqh7bhRD5cMq/BEBKsGo2haYh+WuQTB6qucvXC4NY=;
        b=blgFpqakriixkGSPzNTDZiS67oU9NBmvjYR7GorIp2fwOSBstTgwjwocFGgyQDbm49
         wHqW+7v53XZYRpK/EbLuUSM9gbKTAScMEv2gvWTI1Gq0AJE2HcuA/swrqXi8DIybw5RI
         gRzhSyIUE/cYs1THADI51WsEBgiJ1hH4MCAH9k5bMbPSFGJCepoWwdR2fDeK3y8CzMNo
         ekxmchlTq+Mlj74KG1kIPD+pzYx1VG0i2fV4ks5dPnJ+2aqv39o02JZ+YGu1NCkC1ndq
         sRFA2N3bOn0uSMPRPMuUT29O9cOzF3pmXmEt2KJFFu37mm9GT7y0VdmN3xUdmTFck58o
         fA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025134; x=1746629934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgiqh7bhRD5cMq/BEBKsGo2haYh+WuQTB6qucvXC4NY=;
        b=c3br4kGNrNgiPBTEVzrM46uDjl4fe6UDusu1BL9pKRRLQCjIUWOMJ/HGFajqBRbt8N
         vaensZQ9+XnJ8bIP01FzVU5SyOLkNCBVxec8T81Wzb2drbXAMl3PbxAp6EPnUR7kAyYr
         Hxip0Sho2REiMyABxfsKDev3bf0fCeF8pRkHTx2nL+kZ2/fqtxOgHpymjWtvRiPK4K1e
         f/vsIka5qWZc0kZKs7us7BHbUv3S4pV8Vb5bGpTYvO3/jdTk0gv0Tjxq/tCJhNa4fYjv
         bVPrjyr5RLpcua3QoUYNETYDDdSST2499VfNYxJAwXFfK/TJpxE6G1KYouC/gA/veNcD
         IGFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrzxSsJ5ZYPuHSuVTY1VSIaQ0ueJLkMFws87DG3MCI7zvgCAPWRlNxYu9fgP0EVEVCduwYK2q7kWaI6Q==@linaro.org
X-Gm-Message-State: AOJu0Yyr8P58o/8GNy7W9RKgWETitmq5PLzSe0HkrSNOnvjGpOVEiWBJ
	dDJElU62BW3pct/SrO2kRA6byJuiNIFtOVY8//HE1dNGEMcDQrbK0saeOvX3Q9+nOw==
X-Gm-Gg: ASbGncsiA2Z+U4FFg5keiTjn0Vmvdtry9QcEiMGNgRcfx635X5njBAN1Utr4zZll99R
	tRXR5b0FNrSKMsYnUbLcSpmbP1+2Mk+6VIQ6pijSxOR+P1uCQxUMY+TT3kZP3QNchUqCyGY1duF
	bCy7eKuGN9NnWpVc8DFCfb6jsxDGQDwvlP+TKk85NIVxlshJmQQhodt5Hlh/BvtOwKehsbbKDj6
	shHBWZV1trexdG3Cpp0iKwNJoAniDPyWGkJUkJrrpGSENbNfL9vhCQKEissO5B6WJdjYpA05jQw
	gmWMCC08MeKDikxf0fwa4IfSjK0Bn/t9zZdEAI5t
X-Google-Smtp-Source: AGHT+IFieDyuyjj+C4di99eeA1PGTo0L9NwfDDFPvRC1/0a/H5Z1PDo/6bzUYYe3zw+0C9wzY3sxBg==
X-Received: by 2002:a17:90b:514c:b0:309:fffd:c15a with SMTP id 98e67ed59e1d1-30a343ecc28mr4110169a91.13.1746025134157;
        Wed, 30 Apr 2025 07:58:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a5bd78sm1705652a91.42.2025.04.30.07.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:58:53 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	anjo@rev.ng,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 04/12] target/arm: move kvm stubs and remove CONFIG_KVM from kvm_arm.h
Date: Wed, 30 Apr 2025 07:58:29 -0700
Message-ID: <20250430145838.1790471-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iIV1dLnS0y7K

Add a forward decl for struct kvm_vcpu_init to avoid pulling all kvm
headers.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm_arm.h  | 83 +------------------------------------------
 target/arm/kvm-stub.c | 77 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 82 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 05c3de8cd46..7b9c7c4a148 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -94,7 +94,7 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu);
  */
 void kvm_arm_reset_vcpu(ARMCPU *cpu);
 
-#ifdef CONFIG_KVM
+struct kvm_vcpu_init;
 /**
  * kvm_arm_create_scratch_host_vcpu:
  * @cpus_to_try: array of QEMU_KVM_ARM_TARGET_* values (terminated with
@@ -221,85 +221,4 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
 void kvm_arm_enable_mte(Object *cpuobj, Error **errp);
 
-#else
-
-/*
- * It's safe to call these functions without KVM support.
- * They should either do nothing or return "not supported".
- */
-static inline bool kvm_arm_aarch32_supported(void)
-{
-    return false;
-}
-
-static inline bool kvm_arm_pmu_supported(void)
-{
-    return false;
-}
-
-static inline bool kvm_arm_sve_supported(void)
-{
-    return false;
-}
-
-static inline bool kvm_arm_mte_supported(void)
-{
-    return false;
-}
-
-/*
- * These functions should never actually be called without KVM support.
- */
-static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
-{
-    g_assert_not_reached();
-}
-
-static inline void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
-{
-    g_assert_not_reached();
-}
-
-static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
-{
-    g_assert_not_reached();
-}
-
-static inline int kvm_arm_vgic_probe(void)
-{
-    g_assert_not_reached();
-}
-
-static inline void kvm_arm_pmu_set_irq(ARMCPU *cpu, int irq)
-{
-    g_assert_not_reached();
-}
-
-static inline void kvm_arm_pmu_init(ARMCPU *cpu)
-{
-    g_assert_not_reached();
-}
-
-static inline void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa)
-{
-    g_assert_not_reached();
-}
-
-static inline void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
-{
-    g_assert_not_reached();
-}
-
-static inline uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu)
-{
-    g_assert_not_reached();
-}
-
-static inline void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
-{
-    g_assert_not_reached();
-}
-
-#endif
-
 #endif
diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 965a486b320..2b73d0598c1 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -22,3 +22,80 @@ bool write_list_to_kvmstate(ARMCPU *cpu, int level)
 {
     g_assert_not_reached();
 }
+
+/*
+ * It's safe to call these functions without KVM support.
+ * They should either do nothing or return "not supported".
+ */
+bool kvm_arm_aarch32_supported(void)
+{
+    return false;
+}
+
+bool kvm_arm_pmu_supported(void)
+{
+    return false;
+}
+
+bool kvm_arm_sve_supported(void)
+{
+    return false;
+}
+
+bool kvm_arm_mte_supported(void)
+{
+    return false;
+}
+
+/*
+ * These functions should never actually be called without KVM support.
+ */
+void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
+void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
+int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa)
+{
+    g_assert_not_reached();
+}
+
+int kvm_arm_vgic_probe(void)
+{
+    g_assert_not_reached();
+}
+
+void kvm_arm_pmu_set_irq(ARMCPU *cpu, int irq)
+{
+    g_assert_not_reached();
+}
+
+void kvm_arm_pmu_init(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
+void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa)
+{
+    g_assert_not_reached();
+}
+
+void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
+{
+    g_assert_not_reached();
+}
+
+uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
+void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
+{
+    g_assert_not_reached();
+}
-- 
2.47.2
