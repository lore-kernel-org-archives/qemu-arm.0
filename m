Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756086njj;
        Sat, 3 May 2025 22:29:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVMdkCfbtBzj2CpAyHifUuTDbuIPmxJInM+4nFJV//d/yYHl/xiwBEPl798lKFGdp7Hb4yz6I0jQBJkQ==@linaro.org
X-Received: by 2002:a05:6a00:4c89:b0:739:4a30:b900 with SMTP id d2e1a72fcca58-740672f2d11mr6525263b3a.7.1746336565405;
        Sat, 03 May 2025 22:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336565; cv=none;
        d=google.com; s=arc-20240605;
        b=bRtP/VcV7dw5GkjB7+qKHJaK/oBc6RsLBmByMcurSo+06ou6wOt+fdL3KbB7mbsJrr
         E4yT6sYy8TI9k2dmJuLpCXQn2iKCXxzd2vfVmBevu8C4+fP7KWyjMzrKnX6/+uZXykxt
         amiy/x6pNiD1F9KCgcc3RF/ZsSt9ZqbZ1Inp65ZH++jsUINjUM0b6X85ER6AwWbLl9QB
         BjhyR3RacX5a5cYP6tQV/Du4RCZ6FR3BFu8MGZVppjZ+tAahjayYWSbY6UKEvU0dkH6c
         fHfcJf7JXuEITrdAIiLyWdcDbqRXXwoJjPo75J7zklBeQyegyNCJqJOHTd1kzeqamQO4
         zV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ktcl5OZ+t3GMcQQ7Jgx3PtMsJ0l/J5yPLlaHDm/4GNI=;
        fh=CWnP6wkZ+qXqPYcTdTNSShX7kkWxw0/BQCxUuZDb+fI=;
        b=lS7rLIb9ewHj4jeBOkGYwG7nGceEcC+J2pbX3qSSN6ERUMKZyb3DLU6Ji4CVzsjWjO
         6RT5Omt/hYTvn/H/2jZQchvHH2abbsFkBRnWiag92diWYHujuuSJMFaXsZM1Lc5Xhi+I
         KGAnGwliva3hEkGSEWQGHnkoOSveQoFdWadrJWv2BRg4gee5lEwQZKLUyo5T2Et5UJM2
         bw2mNzemF9LUy5Vv4e8AOwtvymALpHspd3G+4w4titl4jotnysjAfsYCVppQvmIZsXH4
         Otw1hhH+89gZ+ubPohDnd1rDvk/AcRnbIgO4brE85wvzsuBvZIBY8BfJngicR8GzK3cI
         tCrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tphtYvcN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eeb4fcesor2701332b3a.1.2025.05.03.22.29.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tphtYvcN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336565; x=1746941365; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ktcl5OZ+t3GMcQQ7Jgx3PtMsJ0l/J5yPLlaHDm/4GNI=;
        b=tphtYvcNHD+U2BeBFsCojP6HIQS/URPCd/+5Nnzuna8jNVwMz3+Y7oVBPces2pFvJv
         qnxwTzvmYCR8mPP1UCe+2QCciv4mY0JJYPLhDXolscjXMmFZjtXmozKujsm6agHr7cmm
         7P+wLR6LQvT05Ph4iX4sziQDZNY2/usuUtav3HVu8GRxId8VCXhCb3L44G3/tCCM6+3M
         OffnnYFt8o9efC2IeuCWo/5uBBa754HuyvLl+bdXfknsoPCk8Kj28v3J57ma1FesgGUG
         LIasrxJWNoyrORwLhZx2a0OaG/jCe+QzbQJgnTXf0RG7c3sadDYDX3A8a1H/850/vLDN
         DcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336565; x=1746941365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ktcl5OZ+t3GMcQQ7Jgx3PtMsJ0l/J5yPLlaHDm/4GNI=;
        b=he3F2gDgov2AnMwkF+XL2f6ZBOB9Pw5gjHbvUilngQJmp80ouZrpjHYFhTs4mJMOo7
         FocIzK63I8rNFMT7rDfAYKZ/PKQgLQbsm5Fl4gAmF+AznD+cRtwaSZcyFPl9UMssa/tx
         1XoZs0DARrPI2/UNL2dFHJZTuvWh1alGJjIAxH5SfX4ZdMMMloY2bJ6uzCDe85tUqe7R
         UQNeTmrbVneGqG+2kIHlsIkwICo9a5BkAVtfhNywEHsjXVa644y03petE8S37HhcuOX8
         GLP2VpvR9tVmGcSA6/6Bz3M/ljTzVcjPU0SR0QL6P3XlF2XUuaukCmZUqj2Q7JWofMcM
         UeUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoh6gxl/2hIyvgO1nwOiqlX6XLjxkEcXOvJ/WmzqPVPq3DtTpYEZEQZloX+ybtaeGQgUQhUSuvO2v82g==@linaro.org
X-Gm-Message-State: AOJu0Yw7Z/Spyx7Kl/KSWBIVW+Z8dMrKZGNlW6AxhkME5dg3OfRmL1mo
	o+4oHhB2cstZPj2xmZ68BDvxaMLpmAvYHgxc3WE09syhLdfxlwb1IVO5wqJSMKFiFmJbDVeTHMS
	LE8B5HA==
X-Gm-Gg: ASbGncug84h0CyBD3Jnn0PvnyFo7z3T9oSia4PXN4jjTqoTtGuwEiE+31g2v+5PNgxL
	tuQjSgm28/Z9nztTMSpecfOqCU259yC2Pq4vIFtE7TURIum1ToZ33dV3uvCYd+25GPyUEH3m5OB
	M95HRGxRxegwWdSAvpgrfMRaW5V/febS1+pZL6mvbp60yJl9oFjk/gbMx3u6sGUsGYrDhC5b6Av
	rQV3VSRtzn1WiGCeWd5OWQ+GQOaSyQJXxis68tJT2XH16Qj8QR4iZTAqvdsvFcam2GtMPa8yH7L
	BnMvIhjYnEKEoeEKdSGsfcYjUDkA6S3xRDiS23kN
X-Google-Smtp-Source: AGHT+IEfRJdSGLDsp6T32tCM2l+029460i4Q8IRtkfvq61UYn5o5uI0RqXkkPb/trprs30PETo/lIw==
X-Received: by 2002:a05:6a00:1384:b0:740:596b:eaf4 with SMTP id d2e1a72fcca58-740673f2464mr7015748b3a.16.1746336564975;
        Sat, 03 May 2025 22:29:24 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:24 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 05/40] target/arm: move kvm stubs and remove CONFIG_KVM from kvm_arm.h
Date: Sat,  3 May 2025 22:28:39 -0700
Message-ID: <20250504052914.3525365-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: H2MQIoiBp9kR

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
