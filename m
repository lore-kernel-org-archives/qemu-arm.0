Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778152njj;
        Mon, 5 May 2025 16:20:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUAz2xWnzxvqu4ZVUUpjW449nPDTi61cF9ftEkGu7awrwR97y+MQISGfvh6trPl18Wnpn4jhdj3L4S77A==@linaro.org
X-Received: by 2002:a17:903:2b0c:b0:21f:2ded:76ea with SMTP id d9443c01a7336-22e1eae4269mr159021385ad.36.1746487225489;
        Mon, 05 May 2025 16:20:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487225; cv=none;
        d=google.com; s=arc-20240605;
        b=H2nI4NVN9Voeh8rNMW4r4Ui/zgWX73idT6rqLSa4ub4ZlrPOFznASuys8DXBnJYeOJ
         eXBML8JtQBMY83xKwKGsJ0Rd/U/cWKyIflii0T9P7+TMY/Zz/HZ7UoggchNfsglinVRk
         7/pugxACbOMNOWYiDcnDCpEo4MYLp8Y5fy+z4q/XgMVHaIAE0JjAqcOpwADPN8UsaYOd
         Ru892UGyZtSCjB+GtWANZKgxXKZBLWJCMr/jM4pCXbTmwfccTAofnxOvxcb4jqQ4KgJ7
         DSyAkJ4pfBelob+w+GOijqVpIsf8vyNl/kQ3dUpAxI/mFOlKmVDp3hD9Cyj3zqlgL0XS
         LORA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ktcl5OZ+t3GMcQQ7Jgx3PtMsJ0l/J5yPLlaHDm/4GNI=;
        fh=MWZDj/meDOeVihhfKR8dhlaEivNrgZsdgDwzQiHm+Qg=;
        b=N3rlp1kb0uRWP6BiUk7+01eZOmerKK4UIClMnApTvtsW26I2kHhFlPDh6dUfIrA3Xt
         d8BOiXZVQPheGl4sH0QfoxLoz6d+AQSJoTG81uxQnSSQ4rp3IHXr5/H/6mDpyJb/wckF
         iTybfVkZbJHItEdWkbfjnzeIGJkHXo3bvwCP2pbrlHnOaqowx/sp3ceavwQxJtYLd9Bn
         rnxIwOCRmSAYks95d50QkK70MH+mzfPqPuTdUhwJv1x04P1/yFnUINhkhvVZzDqUl2T2
         LzBsajexefbceQUUdJK8Yc376IERSUAjhXsGPE0ViqBWeQVwL371hP4eFcqAFNx0jnI6
         /GeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P9heetsE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb1943bsor59482435ad.4.2025.05.05.16.20.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P9heetsE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487225; x=1747092025; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ktcl5OZ+t3GMcQQ7Jgx3PtMsJ0l/J5yPLlaHDm/4GNI=;
        b=P9heetsEkpyAsGlG3t13OCr4eA8fcPdPMu8fvwUuA73RTmCHfDqSwf4MH2fwXpo9Av
         gHeqKtprhKQPIy/Vzysw0VsbW2p1NkGWyNcVMmRMnpzZk9welylwAsFtZNRQtfwpOrBL
         fqbrT7wPCjx0K+P8sFwS3MpibVMcdYMex4dmv7lFXO5y9IvYFaTUTVP3k1dfJN0NSC4E
         QKRPHkFReMKjpnnvn36m+6wT4UUu6BswGpchZE0qr+bshrHS8KiFD0zYb18ajsm5J7SI
         AvZvE1sxgqaqUqq/o+57OHmrCLnBGqjVrQIJKZb2nvJ2DwREG7wZMoJS5xpVJDpmXda3
         qDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487225; x=1747092025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ktcl5OZ+t3GMcQQ7Jgx3PtMsJ0l/J5yPLlaHDm/4GNI=;
        b=nuHtFhUumkcqwrHd5kp1tU6pSvQ5VEIPCQI/SFKY/QwPlh5E1UORBmGX/YbsiNRtkv
         1zTdhWhL49xZT5sFDdeP6UUxGtDYGrBoO+Qkt1h4l2fH1gR/D+ZkgkIL8HWp1CCm7Vwv
         gIt1Tlv1bxSkzvkIQZCXsPG5mreG47Bn5BnV1c7Lzqhonwb18UtbgotJ8oOtEhuRRde/
         sVZTbmWWmXmPiE5VrnfAB142zHUo9QqACZP6tdC4v3JqpWJO+y5bqKSp+rlAa40SIZjV
         WpIEFyNo533EoD9Sxl8KlRcPv2tZDQH3E9mqd5bwodcVBlPx8rVaMomIgera0ENB6yCq
         LBvg==
X-Forwarded-Encrypted: i=1; AJvYcCVK2eK6AO+PydrTposLh7gn3dA9l/jkoyv26qvwZxk2HyKI5mUKQSTt0J8WhAkHRLyBtSZFdiKBvPz2Ng==@linaro.org
X-Gm-Message-State: AOJu0Yzm0aBBbBWLTorKMyW+jChcYSgaCgWIZ1Me/DTmYfTWlJXW6LI4
	j6abWzjNHPsntaWmYEAGgUHaP0P5O94PtAenS+wFFoEKWb9tsxWX98lb6rwXCVUYkQ==
X-Gm-Gg: ASbGnctfrjFNIwy0qwrBfA30sZqPeUbyO/fWAwERof9fUTlbRMA3dDazNgWHMrW1FhT
	b4MboxAE3uzfkqMhiC/naVQ5AF2z839l1+Pk54/1Hohmb2xTcK3aXnoqhqCekq0RRbjG7DcPzPf
	q+717JkkX2FBd5ZQSTgsyi8GSi4mUbUi2m9P1j5Ofw3sFY1uzJ4IJg7/YeRO3KYz7Fthvhf4P99
	aROY3Nt5Qu1fqo6OjydyS0oTroPWJ9CqK06w0DFBvfNkuR8oYd9NQ+WiLQLA3dr5f8ud4F/2Y/w
	BYItfFLkwXBqM8ks3Alq5Tu1lH7sZnw8zPmaZkw2
X-Google-Smtp-Source: AGHT+IEppQ78GCWxvrp1Kg3rIqo0UbIgXB98fJRAHTjCpcIyipY13SYl5qyGbdie65ZUaGKZqlqcrA==
X-Received: by 2002:a17:902:ef07:b0:223:fdac:2e4 with SMTP id d9443c01a7336-22e1ea1f373mr137466205ad.1.1746487225057;
        Mon, 05 May 2025 16:20:25 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:24 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 05/50] target/arm: move kvm stubs and remove CONFIG_KVM from kvm_arm.h
Date: Mon,  5 May 2025 16:19:30 -0700
Message-ID: <20250505232015.130990-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yAqGL9WMrKTR

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
