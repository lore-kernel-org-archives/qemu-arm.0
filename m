Received: by 10.28.91.67 with SMTP id p64csp1201033wmb;
        Thu, 8 Mar 2018 05:06:34 -0800 (PST)
X-Google-Smtp-Source: AG47ELu1YbPWFV1MK9PtnX8q2YJw/i2BHWu6w+WUsPq/+D2DEF23J27bjT0+RnJ99vGljhPBawKV
X-Received: by 10.99.110.133 with SMTP id j127mr21299638pgc.79.1520514394798;
        Thu, 08 Mar 2018 05:06:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520514394; cv=none;
        d=google.com; s=arc-20160816;
        b=kpGUqd+5lg4PcpkniZgKT1htxLjHgm83nit9NqXtrIP0oCY3z/bbh+Q29ZCfjRK+BW
         pgC4RIIe5JF53mLnGcD4BpCFi0Ia+Sojp/C/A8/uNMWxcEf5gFeksd3WaQGJtA/sH0I7
         s3IhAqBBzSh3cOHE5YkKlhemdXfAZLHew5lCD9hfDS01pwM6yfZyKrafFJF0GtUbHXoG
         BjU4mA8JA4VfKZDkwegDFYwPPDa7EpJr8D06eNtSgB6p4VTjlRyJegL9/9ifYLgQTclN
         JsarhZfqYxlZSVDhxMZdLA9H6CtqmbtwgT+IFn7anne3ohkBrvdG8kQVn2XM9ygFKjW9
         Po9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=FzJU/kEruoIH3cfzo9Hc25ssSkXhrEypFBeW/d96WUw=;
        b=Nl4Aqn2E0yvsPDUlKIcZmNlXhk2YO0NsAOXlnVIosUYgpjRG/l/LQv1K7chGXlxQQ+
         zafB8DtYzSTTc827lFNetOSG93bB8RzpRIfMSIyJFaGFK/sccM8JjwSdqEoOFJjFT5W5
         qWFSV3C1Y0Qsw8KY2cSjjVXe/mTUvVnOpBkVXSmm75TEySi7nizoUIY0r8yOsVRgAgbT
         2Ci1z79osKNgry9PT1pZpg4YHnZao38k8MooQQQppof7mOKwspe4HVq1jGa4ZMo7oaIG
         p1CqpphNPF5J4Y3/AR/DKYtoEt+24+rmZViLgZ2G08jVdVFXBcPbcvGZoA2LnE18rFVY
         YMxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id p2si13022935pga.143.2018.03.08.05.06.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Mar 2018 05:06:34 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1etvFd-0005yV-Dv; Thu, 08 Mar 2018 13:06:29 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 2/6] target/arm: Move definition of 'host' cpu type into cpu.c
Date: Thu,  8 Mar 2018 13:06:22 +0000
Message-Id: <20180308130626.12393-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180308130626.12393-1-peter.maydell@linaro.org>
References: <20180308130626.12393-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pUqT8q+4RpPQ

Move the definition of the 'host' cpu type into cpu.c, where all the
other CPU types are defined.  We can do this now we've decoupled it
from the KVM-specific host feature probing.  This means we now create
the type unconditionally (assuming we were built with KVM support at
all), but if you try to use it without -enable-kvm this will end
up in the "host cpu probe failed and KVM not enabled" path in
arm_cpu_realizefn(), for an appropriate error message.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.c | 24 ++++++++++++++++++++++++
 target/arm/kvm.c | 19 -------------------
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index abf9fb2160..1a58a2c094 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1858,6 +1858,26 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #endif
 }
 
+#ifdef CONFIG_KVM
+static void arm_host_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    kvm_arm_set_cpu_features_from_host(cpu);
+}
+
+static const TypeInfo host_arm_cpu_type_info = {
+    .name = TYPE_ARM_HOST_CPU,
+#ifdef TARGET_AARCH64
+    .parent = TYPE_AARCH64_CPU,
+#else
+    .parent = TYPE_ARM_CPU,
+#endif
+    .instance_init = arm_host_initfn,
+};
+
+#endif
+
 static void cpu_register(const ARMCPUInfo *info)
 {
     TypeInfo type_info = {
@@ -1902,6 +1922,10 @@ static void arm_cpu_register_types(void)
         cpu_register(info);
         info++;
     }
+
+#ifdef CONFIG_KVM
+    type_register_static(&host_arm_cpu_type_info);
+#endif
 }
 
 type_init(arm_cpu_register_types)
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 1c0e57690a..ecc39ac295 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -152,23 +152,6 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     env->features = arm_host_cpu_features.features;
 }
 
-static void kvm_arm_host_cpu_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    kvm_arm_set_cpu_features_from_host(cpu);
-}
-
-static const TypeInfo host_arm_cpu_type_info = {
-    .name = TYPE_ARM_HOST_CPU,
-#ifdef TARGET_AARCH64
-    .parent = TYPE_AARCH64_CPU,
-#else
-    .parent = TYPE_ARM_CPU,
-#endif
-    .instance_init = kvm_arm_host_cpu_initfn,
-};
-
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
     /* For ARM interrupt delivery is always asynchronous,
@@ -184,8 +167,6 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 
     cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
 
-    type_register_static(&host_arm_cpu_type_info);
-
     return 0;
 }
 
-- 
2.16.2
