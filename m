Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42556njb;
        Mon, 12 May 2025 11:05:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8ZXNckKdiqVlIrIskrvU9ITWc0ZowYBIocsGTUu0v0sUOs4lXIZNyVMTUdiuM0q6k2bwVDFxVqm9B5A==@linaro.org
X-Received: by 2002:a17:902:fc45:b0:224:122d:d2de with SMTP id d9443c01a7336-22fc8b3fde0mr217574635ad.16.1747073115839;
        Mon, 12 May 2025 11:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073115; cv=none;
        d=google.com; s=arc-20240605;
        b=EfVbkSCiemfoHW7e8yIkqueSvQ2qkGJSukb8gB8/Cd4jetef3LedhVIjxBUnx6Xefp
         RWDmDGnaQJX7bKr196DuaMpmUMVo4NrG38v/KiB/KHbc8v+HESvMqvrizsrkT5/2CcqE
         PQRA9fgDBkpfj9/niP3hQmmddtM41o+jgUlVbX7bq6T7n+TtnMEeJ840h85SDaAIAJHy
         J/x6L4NAAa3UQ6akz3v++DE+pxxWqyaLuscxaChDXQjIGYOBcKBaDVwL1bGwNo7tL6uf
         MWZSQarxpKgFWTnvAlTd+LlrX1GxQxbsxdz8QiO/wdBYpK6KWaV7qaNcVqULyoqsVCtl
         gGVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8AlvH8T2wxvPoUN2cgh0nAAaoM8ETcHqqaWl8h2qra8=;
        fh=Re1VLXJ6GC61z/D8Wg+lPvyfHW2AK4KokGe3na1jEsw=;
        b=Dg+II4EfeuKuDbx5uD43UInd32Eh3PVufq8MA+D1dilvEbrR0BQlejJEOL4X+JTMrY
         MFbjNSkNFTJJRSt0PKmoOMLBYYh1d7K+6oPtoqCmannVsWaHVLj2k913TIqtVHHzQlJM
         ENDmo+r8Iru0ZIgpsuKBmgi42EHutBEi5Yh63H5rHrLWSfm1m9CMv9n6SYE7VcjJqgrt
         uh1n581+HHLo5vyKpOSLeCYptz0Cj41/xCqHqGUkDaJRkV55Jyz1FD2lwC8E28OmN8kx
         p1jWQmDD1r0Z3sXFwKhOAYfofgOaLnlgzdaoW66p6hfQYhD3soKaSOkT1Lc3Em+CvJ1s
         z5JQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pU1yU1JB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6f17aedsor50215865ad.14.2025.05.12.11.05.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pU1yU1JB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073115; x=1747677915; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AlvH8T2wxvPoUN2cgh0nAAaoM8ETcHqqaWl8h2qra8=;
        b=pU1yU1JB/81hge0kdwFWgbf9+u/hZttPedt3gAZmfj07rTKQfCxOl+1D7jPCHZV9pb
         KCrP/9YjSazM+4h95FHmE2pzq5qqrDB6YMokBG37FR2eSw1M1eIupuzKt/8DTGFkTwOL
         k1pkJf6uLWMAVDBKa11SPS8Tl6Fnxx58oTZl74x8qhQ0VsuzVf66EaGHKF1JuFFv/l+0
         +03rhbv1Co5NT5+v86eJlHiGk1IQhunqcC5M1rwhRK1I12RL2uEIal9c3oCeQsqUs2E/
         8r+ShAaTLAs/sKWdP+f61Kf0ZozPIN+Yp3JPAiH1Xbnbp4q0MCPFHnU60o0MiAoGFJkd
         1zZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073115; x=1747677915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8AlvH8T2wxvPoUN2cgh0nAAaoM8ETcHqqaWl8h2qra8=;
        b=LxmF2L7+rZ7jZQ62q5TNIZF4dbDu7/T8H/d4twFHCWnCuorp25Bc9jkiMgsjXdgslb
         B64EDZWqCwIwxbFJ5upNzDjkWbTvHpprPeirp6cG1/PVSge3Z3geXeaQs6r6SNVbw4nh
         CK1k1SDUn3dvsJHMDwSR/njhGPqorFwmaRJeO14OKFXsR4NW1/pjtlkr/8HKYiftqe/4
         J9+ROo4/1DLPrSL3BPJVELrZUruAhPhEk3IfPQXdnP6qH8ja1CHplZhOydOWGlWwCcVS
         g2ffgShTUTJppnxAZo8M/jkV5fEMot/wg7osLi+ZmAA3yv99qqpEkcdiaFEOFtxOGkRa
         RQPA==
X-Forwarded-Encrypted: i=1; AJvYcCXRCTVjjwmrU6ppBHFv+FPEY+R7uzAud3XVTRvrMvIO6D7XQ8zcJMD4LpwMwURNfKZz5MA+aHO1BbEmNQ==@linaro.org
X-Gm-Message-State: AOJu0Yw33enVCkKpx1fcuplKMtDiPr3FOy2XlOD36RdHOQQkaJOYsi6I
	d3D8PbKIMDC4qg4YTidSU+S9guT5+pdBrGaf2tG1ObATL0Qk6Z1eVWYPQQEEOAro5A==
X-Gm-Gg: ASbGncttZSwkinfNqSPicqNfZQEHseDxJaVQQ23zUiczbTcOSp/Wq/jf9wwhnQEuzyE
	7qV0Jr66FxDbqN/CEhb0XS76RJIjVrb+nT6NdkE2oasIjpOaoSCGuFrYNMHFDnGwa+7DJOBlXXQ
	dUkP6uP7qyMHbeghHhxSsnmgMrR9iJicET2a1mjMBa3fDLBuCujFXLh1rceeaxay5FTm1VWzRGM
	1t/OcokZ0KoV8PlBgKd/iTh/qMjFREDcUWT1iGBn58R+4EjDeDnyPkVtOfKqsuP5XVraRPEFYyr
	1thvLcYMe6N7azi7YRijCG8dY06yTeVyvwTsn0X0uLLk2cIVeKk=
X-Google-Smtp-Source: AGHT+IEtCiZ7pWhfj+zvU+QjNZ6OJ+sx69sEdRwyVqIutBYFsRWs/EvFgb05ePx/aof8VSDvqJ8C0A==
X-Received: by 2002:a17:902:dac5:b0:22e:5389:67fb with SMTP id d9443c01a7336-22fc8b0fab0mr193964295ad.7.1747073115383;
        Mon, 12 May 2025 11:05:15 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:15 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 04/48] target/arm: move kvm stubs and remove CONFIG_KVM from kvm_arm.h
Date: Mon, 12 May 2025 11:04:18 -0700
Message-ID: <20250512180502.2395029-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: u1ZOZmBrj0Xw

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
