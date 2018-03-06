Received: by 10.28.91.67 with SMTP id p64csp3703409wmb;
        Tue, 6 Mar 2018 04:56:22 -0800 (PST)
X-Google-Smtp-Source: AG47ELt7h3AJICK8eiaehm32c97S/O4d2jfISoVDsmTGc8Z3cMwpRaAc9wjj+pzCSXBu8smhk1/N
X-Received: by 2002:a25:ef07:: with SMTP id g7-v6mr11184081ybd.274.1520340981904;
        Tue, 06 Mar 2018 04:56:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520340981; cv=none;
        d=google.com; s=arc-20160816;
        b=x6B1WXrFv6R4m0QXZDOd7pDXV1VxdUU2IHLyN1FKV0jDRdzSPbC8bU7vNuzF34O6vR
         xxwXfM7n0BQ8GS9r0yle0rHMh8wkEL9LHR2rFA3Z3x6UUiF0UFkmgbSKbvmqchYy42Lh
         gzOp8ImQuGBElp+HkBGL8Z4j+t258DISX2a9PSRPQkxecN0B0o3mvrTm4jgX9A83znBz
         sCskPHzznygcWn8BwJNKtRShzp9bCdIXriPMRVYSY5+4ckKYxLimDRyz1y8SDj6hRLLk
         HkGD1O/jZsfpBZeZZ56LTCopSSret8ZHtZ4hwJ6hDKQU54+RtGMplzM7FksROmNi6iUN
         fnJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=YB56CZ7qETCExJhcytcSgOLN+HdEYLWVQXtAMFFx8Sw=;
        b=N5rWPeBsb81XUrsTXgnv+hv2PaJ064ZOtmI2XS1tzQtxeBUvz4NKGTZXtSZvcV8vjY
         TLjpkW6CZwFwUGbVXFDHs17PA6bmSm68aOajR3ucQPznqNw8nRWTMs76CJvLOdwVsZW7
         b2LaNO1BJ5/TWq3AyuZrJrpa4vFE1gpGIIwF4MTItN/ERLwfVpshsc6A1au70gBkNB0T
         2+s9rRjx6JCUIvWAskvbycxUmLnsBKS4jRVWSkZHNB7TB0b02sFzfKjtdELhcIdBDLvu
         ofvgWVx3kSgfCWnE1Y+FCTN9ZfJEvr1iuiNQBeuCLlGW07iARmcpM9ltHUragf5EegLf
         hSjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q3si2612847ywi.321.2018.03.06.04.56.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 04:56:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etC8j-0000Iv-89
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 07:56:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1etC89-0008TS-W7
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 07:55:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1etC83-0004rG-TQ
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 07:55:46 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1etC83-0004jX-Lb; Tue, 06 Mar 2018 07:55:39 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1etC7u-0004WE-Ca; Tue, 06 Mar 2018 12:55:30 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  6 Mar 2018 12:55:24 +0000
Message-Id: <20180306125526.27838-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180306125526.27838-1-peter.maydell@linaro.org>
References: <20180306125526.27838-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 4/6] target/arm: Make 'any' CPU just an alias
 for 'max'
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MfewOGDdEdGP

Now we have a working '-cpu max', the linux-user-only
'any' CPU is pretty much the same thing, so implement it
that way.

For the moment we don't add any of the extra feature bits
to the system-emulation "max", because we don't set the
ID register bits we would need to to advertise those
features as present.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c   | 50 +++++++++++++++++++++++----------------------
 target/arm/cpu64.c | 59 ++++++++++++++++++++++++++----------------------------
 2 files changed, 54 insertions(+), 55 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e46ddcc613..c8d3da2140 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -965,9 +965,17 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
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
+    cpunamestr = "max";
+#endif
+    typename = g_strdup_printf(ARM_CPU_TYPE_NAME("%s"), cpunamestr);
     oc = object_class_by_name(typename);
     g_strfreev(cpuname);
     g_free(typename);
@@ -1711,29 +1719,23 @@ static void arm_max_initfn(Object *obj)
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
 
@@ -1789,7 +1791,7 @@ static const ARMCPUInfo arm_cpus[] = {
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

