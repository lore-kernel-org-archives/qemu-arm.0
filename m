Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp22927njm;
        Mon, 28 Apr 2025 22:00:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWBTycojq6DokBmezMq3wIujRdi/Wa+4g+Lc77/lqAC7genLYaBEI+R8x6ybI9G4Yg+8xuqlZsPkEdTKw==@linaro.org
X-Received: by 2002:a17:90b:5403:b0:2ff:53d6:2b82 with SMTP id 98e67ed59e1d1-30a224af03cmr2689148a91.11.1745902820465;
        Mon, 28 Apr 2025 22:00:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745902820; cv=none;
        d=google.com; s=arc-20240605;
        b=HAUDyP9zIgUaxeyedQYLZrG8uXWERmZdD1Nx4GqXU3UWuWxzPdTwUg96rmfsoUbOJI
         wgpXYGv0+nMSde/UcjrBCp1oLzWYX7mnVwxEDbZ1HpJch8oIwcJiuoy2eheddh87fcai
         4OECOHsDcKe2xuytlCJY9AXohGCbznk1P3TSa6Zl77WZbOPAm8izdNXzmN3yagurpcqo
         Zp7yT3cmygVncazVPQLEM4pDLXLZaKRFrywnW5/A9qeen2Goc4XjrScRpWf24rJ7F9LF
         91yzvomVRb6kTlyOlwInxmW0Gwfgexn5FiOIEZ9hnLvWPmtzK7eniGgB/SvOVt5bRfPC
         gWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OTaFFMYBVP+QujpvomI3smt+CnB1wh0iLnUK0PT4pEc=;
        fh=4J/evER3df1KHH1OQ4FcfITVRtIYcu0IB3znBgdVpJQ=;
        b=WLqcLfamM4tndA+diqxgbVGrMaGmw41QzuLsvG0ItC41qbRKhTQ+vf/6uEET+HKUdE
         GmTNllkKZS61tvhzg18VXljAGCPK6z8aLkA9Zur178ZBPxo0mC52EBrpgTDju4JFMW43
         ZWvRNHgv535DR+ltJgNZ0SqrkguGPs7mLtNPPOWH/Xh2kVguiJ4PYN5K/pePUBjr3g5p
         LKjY6mtvysuZqYRVsq7XUqNMHs3RXVwoTO5ruQYkeR+zpiLP9OEq/Dt3ui7EVzR7AqJF
         HNPfM2TugXSsNh2XGGf4+zhxVdsB6M3n/KCWvuZLhPNqcboA97A/ocljuRhYHRpyWghl
         X/Ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YXg/PqrT";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4fda5fbsor58229875ad.3.2025.04.28.22.00.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 22:00:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YXg/PqrT";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902820; x=1746507620; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTaFFMYBVP+QujpvomI3smt+CnB1wh0iLnUK0PT4pEc=;
        b=YXg/PqrT6LuzVn4cbe3EuwHIoMex1FDu4L1TuyfbaUFY0wt/gRhmMxbXMzkwu7gmoA
         8M3VcWDXqOnPjPtOVnUekD+l643ufZ1YC1hXGzhbRYDg4z6vGoRcWXFHh8lGEWJZzdTA
         YdxDlNOSyQ5PDfES7key0lel/YpmlvxaJYzDWB7PTyfJ5Q6khbPeLcNW4jWQKkuTqfv8
         FxShoWsPGQ7khVn0zn+a3afP7X4xfu5mJp24k7wUKh9CSiL2EFrSVoqx11o9R2n7gGV7
         CYyTNXDNlMzySb8swhEFTLvL7g5MQIcPJ2cMEPnFmSYzNyw4IFmcBKMlucCdztkWEq9T
         ddng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902820; x=1746507620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OTaFFMYBVP+QujpvomI3smt+CnB1wh0iLnUK0PT4pEc=;
        b=ATD+r605GzwJ8yyLSZp9+JRP6g1Gr3oLOsUxMHyaeGiDVGo94L+uhmGDrH96z57KPw
         4CTInPJ2TCEL2I+ntj0wmcjUnzvbrLwD9xT6FEHA6O7Hp5b8fCkmXldwIoUjodLrZeVT
         qB6BNlmVn50VYhJ+/Cel8JdyKvCET8LSCI+qDbKM9IGuNh9rGP+iBqe/qMz47jdVFbTk
         D+skSgy6UQlGO3lglbwwD3gbO5Lb/G4e9Kl394Yc8FKlBBovb9bRgzGNS84ZQvIq3Yft
         UAKBuhg2v0blKm8xAyv5AjXEnC6VvDeKBhyJ98SdW2td178EkVCiWyJtNKcCLNpRNU2O
         eeIw==
X-Forwarded-Encrypted: i=1; AJvYcCWdxz0bCnMkx22BsIRyuPi9mi3vibMu7lHaVgYA3kT13BoiKXwr1zrOlj2ne6hog7Nl/DFZZ57UZh3Wvw==@linaro.org
X-Gm-Message-State: AOJu0YwN4VOab8yWIW0LWuQhHuq6AkdZBy+vL3X10NfNrXrSkzN9fTXF
	uBnI4s6h+F2IDj+Eg31ksNQqaIpLANfz8JYCcBxwsT/9q8ML5gL/ONzPQTDwsM8gag==
X-Gm-Gg: ASbGnctaRx3Nrv5OW21n7m3D8434RG/SulVIZVIt1pqHom69qiPNSXPDbgEtL1MVKOO
	Vm4m46H2Fra1wO0iUyk6CiMPTYuE58LEi4/O/3sXhWjxk07gNrwRpiD3vBCzaJyrHYtunMnxrQL
	S9QD9SDTwQMdUVB6hie2GGzl5TTTv2+2XHGkNvXIVVc/Y9g7kMgxt05kWWKcY8TkS0NG5lfgNMy
	EMPIspJojLcBSIDNnYFaAqDqPXJmADS+BCGO7LxF8/eXp/u/AE9+o40Z9tweAx76qajL94vrDYr
	LKnXm7ujDngxgoGmMmwc3YXtE+Oj4K6ykTprMbFC
X-Google-Smtp-Source: AGHT+IEx/Jh51iAi9wYCRK0qOdbUNLmln4cWvAe8L1xYO15g0HGBE2gNuockkWPBNYfIVdVxbblv3w==
X-Received: by 2002:a17:902:d488:b0:215:a56f:1e50 with SMTP id d9443c01a7336-22de6bff536mr25643515ad.8.1745902819983;
        Mon, 28 Apr 2025 22:00:19 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm93004015ad.76.2025.04.28.22.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:00:19 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	richard.henderson@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 04/13] target/arm: move kvm stubs and remove CONFIG_KVM from kvm_arm.h
Date: Mon, 28 Apr 2025 22:00:01 -0700
Message-ID: <20250429050010.971128-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UKve+vF98XbK

We have to be careful to expose struct kvm_vcpu_init only when kvm is
possible, thus the additional CONFIG_KVM_IS_POSSIBLE around
kvm_arm_create_scratch_host_vcpu.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm_arm.h  | 84 ++-----------------------------------------
 target/arm/kvm-stub.c | 77 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+), 82 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 05c3de8cd46..c8ddf8beb2e 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -94,7 +94,7 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu);
  */
 void kvm_arm_reset_vcpu(ARMCPU *cpu);
 
-#ifdef CONFIG_KVM
+#ifdef CONFIG_KVM_IS_POSSIBLE
 /**
  * kvm_arm_create_scratch_host_vcpu:
  * @cpus_to_try: array of QEMU_KVM_ARM_TARGET_* values (terminated with
@@ -116,6 +116,7 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu);
 bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
                                       int *fdarray,
                                       struct kvm_vcpu_init *init);
+#endif /* CONFIG_KVM_IS_POSSIBLE */
 
 /**
  * kvm_arm_destroy_scratch_host_vcpu:
@@ -221,85 +222,4 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
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
