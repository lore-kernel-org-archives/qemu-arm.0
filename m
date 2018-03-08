Received: by 10.28.91.67 with SMTP id p64csp1200965wmb;
        Thu, 8 Mar 2018 05:06:31 -0800 (PST)
X-Google-Smtp-Source: AG47ELsIoM1gCcsJpKytm/fOA/8jpUi1ARVpMzLy+KnZSlPaQbFo6BlqCc9+e9y1U8VglhI9ILsy
X-Received: by 10.28.113.79 with SMTP id m76mr12092258wmc.27.1520514391424;
        Thu, 08 Mar 2018 05:06:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520514391; cv=none;
        d=google.com; s=arc-20160816;
        b=rbf1AvaerXyHvPD5rAav5kGEoDrbVmAl8YI1z83samUGptGwF311ZisaO/LYaDUy/N
         fbu10M+akLoaP7qG4UfTEj8rIOkG8ss5QF5P+0v4wlE0FWHfMLWR0HOWUKJXIGo6cXfo
         Y7OxTJSMaarAn1zKCsBlQWU6KzaevwVwmrVP266Jqwzh++x2ORo7P0zrmMlP/O4EHv0d
         y94qNc8qif0RpoI1AkgUDQe9VfSubgofjuQpfB4Vb7BvG4nCZorQSOYr8qa70lmMubTw
         hOXQYeOJC7BeuFFf7xeT17G/dIK5QJe6Md4/mov5Dv3LXsXSHcxralCdrXs2hXg1PGQz
         AGgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=g7GVZdS2kJWGvZcqfY0PDGUXQ25SQaD2oyPYknhcc90=;
        b=F4WJ6WYEQE1NpL/kGcn+LEkP1h5+In6QCkCrVacmhZkL3mCqrqfhaCN3/bL1sbBHdb
         hwpKkaqhH/xah6mTOg8fklUvG6b2kkg0Dv287fsOf5c8dLrS6veOvrcthO6IeQBmuQ7n
         gKw1JomPQEKa1wU6+thVKHpSoaUf5lFeNW1kD8NtzutLkeU/yDVoLgdgyy2LE8bFuN23
         sp0PiJOGL4P02oR43VFOSy9nhIsTqqfN/e0FWsSnDYlp5ExHhpLctnVAJLwbGIS7YuyW
         2k9VF1szupv3Df9tMgzDTISGgiIFWW6vOFKW97KKtMwXBJhTzjDVjdHqIZt1TJa3Oe+X
         S6Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id r31si14831025wrb.482.2018.03.08.05.06.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Mar 2018 05:06:31 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1etvFe-0005zA-SR; Thu, 08 Mar 2018 13:06:30 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 4/6] target/arm: Make 'any' CPU just an alias for 'max'
Date: Thu,  8 Mar 2018 13:06:24 +0000
Message-Id: <20180308130626.12393-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180308130626.12393-1-peter.maydell@linaro.org>
References: <20180308130626.12393-1-peter.maydell@linaro.org>
X-TUID: AWe6CP0lliFO

Now we have a working '-cpu max', the linux-user-only
'any' CPU is pretty much the same thing, so implement it
that way.

For the moment we don't add any of the extra feature bits
to the system-emulation "max", because we don't set the
ID register bits we would need to to advertise those
features as present.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c   | 52 +++++++++++++++++++++++++----------------------
 target/arm/cpu64.c | 59 ++++++++++++++++++++++++++----------------------------
 2 files changed, 56 insertions(+), 55 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e46ddcc613..6068efb8ff 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -965,9 +965,19 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc;
     char *typename;
     char **cpuname;
+    const char *cpunamestr;
 
     cpuname = g_strsplit(cpu_model, ",", 1);
-    typename = g_strdup_printf(ARM_CPU_TYPE_NAME("%s"), cpuname[0]);
+    cpunamestr = cpuname[0];
+#ifdef CONFIG_USER_ONLY
+    /* For backwards compatibility usermode emulation allows "-cpu any",
+     * which has the same semantics as "-cpu max".
+     */
+    if (!strcmp(cpunamestr, "any")) {
+        cpunamestr = "max";
+    }
+#endif
+    typename = g_strdup_printf(ARM_CPU_TYPE_NAME("%s"), cpunamestr);
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
@@ -1711,29 +1721,23 @@ static void arm_max_initfn(Object *obj)
         kvm_arm_set_cpu_features_from_host(cpu);
     } else {
         cortex_a15_initfn(obj);
-        /* In future we might add feature bits here even if the
-         * real-world A15 doesn't implement them.
-         */
-    }
-}
-#endif
-
 #ifdef CONFIG_USER_ONLY
-static void arm_any_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_VFP4);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_V8_AES);
-    set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
-    set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
-    set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
-    set_feature(&cpu->env, ARM_FEATURE_CRC);
-    set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
-    set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
-    cpu->midr = 0xffffffff;
+        /* We don't set these in system emulation mode for the moment,
+         * since we don't correctly set the ID registers to advertise them,
+         */
+        set_feature(&cpu->env, ARM_FEATURE_V8);
+        set_feature(&cpu->env, ARM_FEATURE_VFP4);
+        set_feature(&cpu->env, ARM_FEATURE_NEON);
+        set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
+        set_feature(&cpu->env, ARM_FEATURE_V8_AES);
+        set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
+        set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
+        set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
+        set_feature(&cpu->env, ARM_FEATURE_CRC);
+        set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
+        set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
+#endif
+    }
 }
 #endif
 
@@ -1789,7 +1793,7 @@ static const ARMCPUInfo arm_cpus[] = {
     { .name = "max",         .initfn = arm_max_initfn },
 #endif
 #ifdef CONFIG_USER_ONLY
-    { .name = "any",         .initfn = arm_any_initfn },
+    { .name = "any",         .initfn = arm_max_initfn },
 #endif
 #endif
     { .name = NULL }
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9042d3dfd1..3429875787 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -226,38 +226,38 @@ static void aarch64_max_initfn(Object *obj)
         kvm_arm_set_cpu_features_from_host(cpu);
     } else {
         aarch64_a57_initfn(obj);
-        /* In future we might add feature bits here even if the
-         * real-world A57 doesn't implement them.
+#ifdef CONFIG_USER_ONLY
+        /* We don't set these in system emulation mode for the moment,
+         * since we don't correctly set the ID registers to advertise them,
+         * and in some cases they're only available in AArch64 and not AArch32,
+         * whereas the architecture requires them to be present in both if
+         * present in either.
          */
+        set_feature(&cpu->env, ARM_FEATURE_V8);
+        set_feature(&cpu->env, ARM_FEATURE_VFP4);
+        set_feature(&cpu->env, ARM_FEATURE_NEON);
+        set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+        set_feature(&cpu->env, ARM_FEATURE_V8_AES);
+        set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
+        set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
+        set_feature(&cpu->env, ARM_FEATURE_V8_SHA512);
+        set_feature(&cpu->env, ARM_FEATURE_V8_SHA3);
+        set_feature(&cpu->env, ARM_FEATURE_V8_SM3);
+        set_feature(&cpu->env, ARM_FEATURE_V8_SM4);
+        set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
+        set_feature(&cpu->env, ARM_FEATURE_CRC);
+        set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
+        set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
+        set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
+        /* For usermode -cpu max we can use a larger and more efficient DCZ
+         * blocksize since we don't have to follow what the hardware does.
+         */
+        cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
+        cpu->dcz_blocksize = 7; /*  512 bytes */
+#endif
     }
 }
 
-#ifdef CONFIG_USER_ONLY
-static void aarch64_any_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_VFP4);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    set_feature(&cpu->env, ARM_FEATURE_V8_AES);
-    set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
-    set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
-    set_feature(&cpu->env, ARM_FEATURE_V8_SHA512);
-    set_feature(&cpu->env, ARM_FEATURE_V8_SHA3);
-    set_feature(&cpu->env, ARM_FEATURE_V8_SM3);
-    set_feature(&cpu->env, ARM_FEATURE_V8_SM4);
-    set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
-    set_feature(&cpu->env, ARM_FEATURE_CRC);
-    set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
-    set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
-    set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
-    cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
-    cpu->dcz_blocksize = 7; /*  512 bytes */
-}
-#endif
-
 typedef struct ARMCPUInfo {
     const char *name;
     void (*initfn)(Object *obj);
@@ -268,9 +268,6 @@ static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
     { .name = "max",                .initfn = aarch64_max_initfn },
-#ifdef CONFIG_USER_ONLY
-    { .name = "any",         .initfn = aarch64_any_initfn },
-#endif
     { .name = NULL }
 };
 
-- 
2.16.2
