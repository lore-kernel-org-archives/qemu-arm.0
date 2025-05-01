Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19501njj;
        Wed, 30 Apr 2025 23:23:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWz3N6OU+nwVqbra0GBozsch4GnsTfIUu9V33yB+4UMRuiiwmpJoa8mLY8YuNeOHnhK9kcVPTGtiw6Nng==@linaro.org
X-Received: by 2002:a05:6a00:170c:b0:736:42a8:a742 with SMTP id d2e1a72fcca58-7403a79b98cmr7395646b3a.11.1746080635421;
        Wed, 30 Apr 2025 23:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080635; cv=none;
        d=google.com; s=arc-20240605;
        b=A0G0Ubrn1w+2h3rgbw/76pyjyyGke3eqPWrxXIAerJk5is2Fp7gqgCQmHAaFI1sRhU
         Ajc3yPZzg/sOBrLTwVnJ690UM+vz3Y/46CMaXSytm8uKYICWGZK3qa7ME6K0K/vpJs93
         Sch5gQKKNFrXpKYqzpws1HrgEUxHH/ZI/H6qnR11a2RSEbHEfuwXSXbz2yQVXoWMI3gr
         v7BgihOVKDAaEfbIws70K7/MyrBDjzaWGaovhOhTJrKr5JTnOnmKwPHRYjVVincOWDfj
         13HEgLediZsSqPQcKAwbPR+C+fnceDoJH8XLbvZTOsRYzEx+tTn3COhMFcqDO9tGHDju
         AkQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ktcl5OZ+t3GMcQQ7Jgx3PtMsJ0l/J5yPLlaHDm/4GNI=;
        fh=PpCDz0mdO7KN1BmlO6jzAnUj8Xh03+MF9aujNT1ap7s=;
        b=DP7v3kLJEpcyMq0sPI8q7ZivZami7myFp8CH+P+oFzCjdHge5JoSt3qcen4HWIs33z
         Zv+IYCqTsDVGi4hri46SCZ03kYGCLQYvb0WHDnR7KMziG1FgkEo5FQztAYXRy588T15Z
         rPXe76OqtXUFitbdotmCfBQ1ur4QYT9xHgNZQwKQAnwRxp4LiHBwirmufgJ8dpxZ3l5P
         tsu5Qe7Mq7NsoM9j7lt4zaol+KMFW3dF5qwHsVraJECqIAFTcIEv+NApMeNnAnzb1H2C
         7y0B/Ew330nzAKY3BbLPnDl+osQpxUsu8caKwW+jVveZgrFSGWsg0ePxx2EOOfMBnJwZ
         6ReA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqbCAQVT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9e83b3sor97853b3a.7.2025.04.30.23.23.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:23:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqbCAQVT;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080635; x=1746685435; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ktcl5OZ+t3GMcQQ7Jgx3PtMsJ0l/J5yPLlaHDm/4GNI=;
        b=uqbCAQVTT1qta32PfCqkea25XdYuDl5p/WQKkVJd3WjWvNI8TfvjCnE2S9d0EeUCK+
         uUEi2xp46gl8lb5X4fKOEySp+4v5PjKolxkHuqm2MdoILNTc/kYMp8rRVs4VOZFrTy4A
         GtrfTHpLolD4l+7QTxohXW1E5SAa2PoVMClEdEPX6aNvsmVpbJzZ5HPzTITvS3KnvZeA
         bXiCYAKS2y4BtvGSoPnZjM8251DEn2my78oxBfWvAKRLmgFWM/ovT1ZDRqtjlNWWfyOP
         7lXapndGNOBS2RMQzyrc0urldlAwanES2n0NN/pdPBeXJmlV6iydNbb3nIs107gc3Mn+
         eBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080635; x=1746685435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ktcl5OZ+t3GMcQQ7Jgx3PtMsJ0l/J5yPLlaHDm/4GNI=;
        b=p+geUj2OAtWz25s9R5z2Z5ZbuBzT+03cl0ypCZXUWvR7PVJvoeoCBOZEwYRJoyyxUN
         NytVlIWMlU2+INNHFX8a4KuL7qwx2sLl6MCs/qkXss3alsCqvZV/Oo7INNr/EvqflX/8
         LCMPKt14OCjC/at33WqbEGTF6O1P9UpMbYTLZd8mGAq+pjL3o9EB2QIDSYWUSvgRY41Q
         Djt2f96CFEDfCSAV5DnOMo9uSE/pigRutWKE9m4XG/gAUOMMFpKCpslE4qnZMsCCFBS8
         TyfxfN0LJB29DSV3CGFH97aYc8BzFC0fR1eIIk4feLAC2EwwvYnqmr/z2wBEQqwY93Gl
         RznQ==
X-Forwarded-Encrypted: i=1; AJvYcCURJMPUwrwr/Mavmh7MfDwJI3h6+UaKPBI4I9zEYJU4uYExepuzSa4VbTiMbwojLr49pC1fCkSN9OJKkg==@linaro.org
X-Gm-Message-State: AOJu0YzsFU5zToPdQx6u5UKrFAWDEvMnsBz9QDg6p9sEaiFHPArMdefv
	1mtAiO/qM2cnLl06I1HU4OUrDb+uQFtCCEgzuCILyHRf1OLE+4hnCPDmxcxeWP1C4Q==
X-Gm-Gg: ASbGncvtWehJd0Rzv3YjOftYDDBsTXb6vSGaSLQMVsWw1BozwPi+tB/TwsgvWZ+Swlv
	WX16clu3ooBrN8UUQIdT/3Wxzw2qD5z6l12knIdAbTNJiHorrOaOr0xCLGGrHmFza0qetwgXihv
	Qk8XqeEgmH2F7Y+HldWDvhIeMUqmhivgzi2TvQqaAB2snSSWkJy3bdn0JekYDwhWAz4J1Rf227j
	58cnGcfpoURFm6v2VjYH1wODKu9wBJhUHBlLm6YBSsPqUAWzidl8sGZWY5NG5LoWlIUEgzFzwK/
	joWwFiXx7+6g58KFx9yaaN3M2W0qJ6kHDsmuZH5J
X-Google-Smtp-Source: AGHT+IGlMb2qztkg2Rx6pmu/u6ZCoVkAeWR3qrIvj3Q3m9yTRtGqMLCa/e0e8f+/8AZaUvVsWUmoBw==
X-Received: by 2002:a05:6a00:3997:b0:73e:598:7e5b with SMTP id d2e1a72fcca58-7403a75b2a8mr7324415b3a.1.1746080634976;
        Wed, 30 Apr 2025 23:23:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:23:54 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 04/33] target/arm: move kvm stubs and remove CONFIG_KVM from kvm_arm.h
Date: Wed, 30 Apr 2025 23:23:15 -0700
Message-ID: <20250501062344.2526061-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PKUMksFEnHaw

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
