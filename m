Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178722njj;
        Sun, 4 May 2025 18:52:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYeAQ+OyZh3VC1H/3nx0f55vlWfF5bdG8+sv8LV1Zj2avX9l7+YwpXqC3rYud7z+lpWFNO3kiEakxrMg==@linaro.org
X-Received: by 2002:a17:902:f54f:b0:227:e74a:a057 with SMTP id d9443c01a7336-22e18c22130mr108290075ad.44.1746409952957;
        Sun, 04 May 2025 18:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409952; cv=none;
        d=google.com; s=arc-20240605;
        b=c9irMqGisHMOHXx0zy0FvBDLFo68sl825yAo3MwC/tE9/ThCeOYFUKETq0Apu9XRT7
         0WzeE/4jbs/UJJ2rQiHSeVUAczfVefKRXhBTEImIsaWm8/TRPp4xxj9g2PyvLou+aBRC
         umdLD2DtruaB8yk8AUd5NwGlxppqFo0yq4nDqToDumN9WfZBSIj57R3b66fCEes7euvf
         o9cVQlssET2dBu1f8jFoVMllROUoPdOcrBcZwuZJiipB/bI8TycgtLseFg/zv+w4c78V
         535USlPMoe/i32li8c/RaEQiC0J4W0BNkxDjcLiw2/+OHKMILhipgfxzWmK7ejRLqgB8
         hj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ktcl5OZ+t3GMcQQ7Jgx3PtMsJ0l/J5yPLlaHDm/4GNI=;
        fh=nZLyat4o5dqnCzUf7qaCz21ESrBfdeNudMTjIuSmnE4=;
        b=EPl9D5dPteDZfFsJqdApC30B9hGNY7kFCEAWZjE/Dl1RW1yZ+A1aqnoLEDpj6Kw3TS
         TacQJFgZJu4YhXNFseCBn3GqNjcN3svGWc35gPGlIBJ0o8euVbGrL7VmYWp1z4zpvaqQ
         Ug89Ur1iR/LypC/7Mc9dNXUuyhpreR9jyImtaIaDkpx5j/+qCmic4b8auKbNbTu7GsX2
         HSYLuRzof5NNtH7J5pWlYoI8vMTaQzIPWmF64UpCeQmLwZuZaDEv3+vLkwrrSY6Njf4P
         gd/8KXmzT/dzIqKkgSMPWLNVoCFlgIp9OHGbK7r2anjGEPEW7L7Tg3tm3eXQDAInhnRZ
         X6KQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JYe++H0H;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa10f4bsor6066656b3a.10.2025.05.04.18.52.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JYe++H0H;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409952; x=1747014752; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ktcl5OZ+t3GMcQQ7Jgx3PtMsJ0l/J5yPLlaHDm/4GNI=;
        b=JYe++H0HFFRq9LZOEm6DFgBAkY/hYibxXG0DxDR9b7FB3MmSLZCAXKnbC+2AxYjDa8
         Raep5AMvD4XvIjnydNVMk3xWb2sZbA8jN9MYDnoqp1ZkXso31h3lVeUFBVAXer4cVwQQ
         NLy7QXc3hfhhmj1DQb9WgcwfQkvbpgk4HW20ZQMfIDcHa9BrTkMbpz2dD7CHXgSsT56C
         9GC0pjUyHa7uqt4f+OgR4SeXZLlgVcMhauiY2I/jTgOGkrTTap9GXZEnkFcmYc5TvsgU
         LNz+HZSuAK5309O7yqqJQzVbUWVVrWZBqS+Yyar2xOg13iZ6f01Hp895VIPBwkm+9rMG
         hY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409952; x=1747014752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ktcl5OZ+t3GMcQQ7Jgx3PtMsJ0l/J5yPLlaHDm/4GNI=;
        b=Q8Ore5oKaWvnhsiKtOB2IMs9feNNt0q825xF2Q90yxb9JZLW+NMaK8VEhzV2ceeGQf
         eyNjdTw2qRZf2Mjhq0bYIrnMJK00JLSnutgKSdX1taPLvcgw+ZC58nNHkA3VfPa6EbOS
         GL7L0SPqU9J8Zcy55vTThTVZyDZfbq1kUw9RZpfdTBtGiZB2gJSdHlWPGMc7SkINOFRF
         JrJ4eBapsgRpEByL5BTAAtaRHRX9J94AGIu+XHyW3mY6sG+61q0c9HRNRkgYaGCvBpuY
         wqKF+hrLwVzCmVXdYb7t6BuKbzUsevbXfiFsso14OqYvwsSEkdiPKTooUA+eObDASEUk
         JBMw==
X-Forwarded-Encrypted: i=1; AJvYcCXeBoQ1SKFjAXdttSMKofM5hbXU0l0ZVHpYMUkSRSaGyUPS6gGzPQIAQDdMWHrWDLq0hMe1wimM5KN29g==@linaro.org
X-Gm-Message-State: AOJu0YyQZtDZy4wJzDLH3BEE+aoYQd7vIkTqBEiGUST1TC2LWAynA17p
	5p+aWAOqIZBqmsmqcfvwLBdc9VuLWQwQuvmGvrPfw6bn37+TEScPoZqHNdD3mpqbkQ==
X-Gm-Gg: ASbGncuHcTssoTlomiKKOIqGOc1WwrLN4EjwtEVEXc0K15jvOHFTKZsUAZMy+VTyEOX
	70L3vdg+uYx0lQ3ep2UUq4W1rh/4wYYkXCxxvhA9Juko6luU3X1Rw4HK0ZkN17NnxiEPluPxkQz
	RbLPaF5683998kL7je1otz2sEJ0MerLzCKR465yBRPRZtClrDu1uf1pBEIW9RD8sg3WBpyGelad
	KyvGMXhbmpwKqHcB8ejDOhV1eSKlTx5rC8fyCqeE34EP+HYIn2xDjavsWbVI/v4EWqRE1Pd2TOw
	7MzFNvMH2bt1ewEaBzLAU4wm47J9YpB3yuXmWdgq7NqrEqthJQM=
X-Google-Smtp-Source: AGHT+IFjAqwjw9q6AkboaE4/rlYL10/n/Iij4eqi9L1FrrgnixCKqfek0vtCsT6Ha/m7WQ/8koBzRg==
X-Received: by 2002:a05:6a20:9f4a:b0:1f5:80eb:8481 with SMTP id adf61e73a8af0-20e06436606mr10495461637.13.1746409952595;
        Sun, 04 May 2025 18:52:32 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:31 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 05/48] target/arm: move kvm stubs and remove CONFIG_KVM from kvm_arm.h
Date: Sun,  4 May 2025 18:51:40 -0700
Message-ID: <20250505015223.3895275-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Fgq2AL2Wr1hi

Add a forward decl for struct kvm_vcpu_init to avoid pulling all kvm
headers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
