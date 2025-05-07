Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94245njb;
        Wed, 7 May 2025 16:42:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEYeYRHR2UPBVeUILSdP+yuK7wtD1ywaWAlc1499Se+FAm1JDsR2sF+nWJmcjtwYyWrwGXfr/ZkSFDkA==@linaro.org
X-Received: by 2002:a17:902:e950:b0:220:cd9a:a167 with SMTP id d9443c01a7336-22e5ea424e5mr80702135ad.4.1746661367331;
        Wed, 07 May 2025 16:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661367; cv=none;
        d=google.com; s=arc-20240605;
        b=dqS11P3SeoKwj4L9j7a9v7I3AdbdUVnhD4bqAlnZOagVK/S74qWDRyddwhgT5xEjmf
         q3qEnemjMIiiseAjrVFb8SUVqKRqEqd0owMS446kQqzj3tPcTTTfWflIWD/hQdwhYyob
         vKZEfh8JzPOG+arh22IwFGDmXMI2qSTjYlKV44PRl9AmpuJb5VAEWwaAMnmwboiBRpvO
         HWEvBvsngZ126KofZR4XwoPIyV2nispHRpQ1c9WTf9A+Jv7xHIRiTgMrDbWJMCz6Z0Ti
         1xb4zzOxHquhaPUk5VaIJYrSImvFZ9qqIZtWvuqDaRSKhbJxoqLjxBr41Yr2jg8WVMUH
         qY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8AlvH8T2wxvPoUN2cgh0nAAaoM8ETcHqqaWl8h2qra8=;
        fh=QFjzMxdY5T0CQoYZYRi/ophEf7WlsKSEX/VFD4dBr1w=;
        b=awqeLwmxd8YYv3sMwgY9qjst/FBt75AeBeuFJ/oPjImaeVq2IM4XNPfLHMTkFPgPza
         pO48+XGVupXHmQp4RHAqXWn4T+bXO/XFt4f2KFrcwEs0s/fI4Ti/sKM1dg797PfMIoD9
         UGNR2z0ThH2Gk9SP8AYcon56ZAFHQRonkobTFituH8D/n4Pkw5v5QbzPLDEN6hD8S1iQ
         EaWkFD6ejX09JL40CQDoviq1Dkl6WV+kgdhpS1avs7IndKF8EeD2W/5isyf2q3cT0xbU
         ZnCiwFWMhvV/eGRCjBnFUfDXM3fwYFtYXeTytPEqymQvTIriE2FcqGJdkKFlN27jm+Zp
         J+XQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pHDthf0n;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb19364sor119870425ad.4.2025.05.07.16.42.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pHDthf0n;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661367; x=1747266167; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AlvH8T2wxvPoUN2cgh0nAAaoM8ETcHqqaWl8h2qra8=;
        b=pHDthf0n7ALRRa9xoQFbQoFtVLryHnqjn3K4PWUaCfokgDhwwwL5BqdrFqoKlfWdQ0
         VvoGs2X4aKCjB3IUnX1bViaMfcjMuIwZ7I+TejfbdY5hNw4Axx99ek+JtxfSi0HA50NK
         JcX4lCuw1NU+zN+ktWHhBTr+bblDbdZpQOpWPmuO0ywXM83EHtcnOYJsLBuhQsMeyc72
         rkQyeLCUTEYqraYCNcRo+3iSRpSkuSk12tMJZeXAvUq92lqpGbnakAViOx+nB2Ab5mUg
         vyw/yHGnztFQ96O5p3mgD0uRAtYhSOqccar+XfLR6z4GEnPkoVQANLUc0ZCJYIdMxe7u
         DHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661367; x=1747266167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8AlvH8T2wxvPoUN2cgh0nAAaoM8ETcHqqaWl8h2qra8=;
        b=rH+ryUpPA0DJh1QSAX6RPWp36fKFSo7b3/vkKl6EanWBHE+s75hBhzYfaYVI5Q8qXz
         62c+3XqWISWR41/97wECN/Z/Pv4m9227EGisOhMLsy8GR9TZn+zlNVmDnWGl0+xQvhab
         3Yo60ca2LZmlaZyJq+kSTZeKDXGY7J6zD4MdCeeSN7Y+P6Pgi41J8rQbgSDdKhUH+WSZ
         FlY44NLihDDq7P/9yyvEf4BxE1AU+6vAtqCNebhN6+HMQhO0TRzUNZIAa8pzvl1kf6d4
         UThB8jVOJE/+XEY6ClNFds1fFJVisNOzDaL30IQhkI5UA/6CSKikjUnvedJTIM7xxR6C
         xRsA==
X-Forwarded-Encrypted: i=1; AJvYcCWFUETmCL/LNLtcXbudP9/4ug1RnMHXjNTmv/ZzxSnOGSvF/+ElglzxFaJRNQjkTeVtPHfTKdNAGFH6Tg==@linaro.org
X-Gm-Message-State: AOJu0Yzz9SDaTIyqZQZAk2R7FdigtOX/CggBFALmyd02YoER5N4JDp1N
	fflhPxZHORSE5HvAzbJBwW+Tjq/4ud+tbFXcUTwHokVzmzTDvdOM9iFbiubUkEQT7w==
X-Gm-Gg: ASbGncttlyUgCI1yWI3SvtluEk6m3x7B3oBbtgmU3sTbwgkveiFOe1AT/vusLYINcy1
	7kZhuiuxemwI2yQ2S6Ta2OzjsZJq13D3eZZ7u9f8V9cm3caX6nGMTTThPGCgFi7fpgyqXSAsOb1
	D+MQ5lh0/lflIpnm+7gGr+lJ1tm/yUWtqWyFH3NLHciR/EjUkg/3YlPQWXfT1aU6fdHE8chw1IL
	ksNt//KcoMhLIflz+mVzrRQBwVdGV8E71H+O+dIp8JYp+gbdax37IMC2H00vTSzeATxhDt/Pb7/
	1ZHW4uMQPo2s9B14ktZxSyrVqbuGaM14us6Yq7XY
X-Google-Smtp-Source: AGHT+IHc9BLJTRra4Ml/NypvQQD2sL46NjWq+atgO/ogg8mn3XracQtlR5Z2GwyWMF3jG2uboLtq3g==
X-Received: by 2002:a17:902:cad3:b0:22e:7c70:ed12 with SMTP id d9443c01a7336-22e7c70ee50mr26992465ad.48.1746661366936;
        Wed, 07 May 2025 16:42:46 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:46 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 04/49] target/arm: move kvm stubs and remove CONFIG_KVM from kvm_arm.h
Date: Wed,  7 May 2025 16:41:55 -0700
Message-ID: <20250507234241.957746-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mKorO/O2AZse

Add a forward decl for struct kvm_vcpu_init to avoid pulling all kvm
headers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm_arm.h  | 83 +------------------------------------------
 target/arm/kvm-stub.c | 77 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 82 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 5f17fc2f3d5..5bf5d56648f 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -94,7 +94,7 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu);
  */
 void kvm_arm_reset_vcpu(ARMCPU *cpu);
 
-#ifdef CONFIG_KVM
+struct kvm_vcpu_init;
 /**
  * kvm_arm_create_scratch_host_vcpu:
  * @fdarray: filled in with kvmfd, vmfd, cpufd file descriptors in that order
@@ -216,85 +216,4 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
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
