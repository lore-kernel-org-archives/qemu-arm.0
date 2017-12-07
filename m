Received: by 10.223.159.74 with SMTP id f10csp5601812wrg;
        Thu, 7 Dec 2017 10:15:37 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbfyfa1M9GLAJx2wWptRq3S7U5agx+f7XlsV2pV9tT8+OPdG+5JUt8qXyVEgEz46Fzip6Tz
X-Received: by 10.129.95.5 with SMTP id t5mr18712432ywb.40.1512670537447;
        Thu, 07 Dec 2017 10:15:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512670537; cv=none;
        d=google.com; s=arc-20160816;
        b=LnA8LfryZZhIySVZNy2rm1MJYrl9WasiR8Ns0i/9Y2p3NKBOJaJrmePUHMDkz2xqCM
         KysEkDQhuVb3FvwjZ7flyBOjV7zp/xTZQSBFuuC/qyf+4gVd+TWSZlfxWogkMhDBvZXw
         EeHVgtlylt4T/gpQ61TK7lt5detMys2NCjko+ywKqOH+v+te7TYnO9RR2aXmJUCOwDre
         glXbOkWzN9ScruwDZeCYUk/J7QrnCN5G4YJlSqhsXb2vsSLR9ZIhZpZNKbo651E1r7Wb
         XThCUQvCIRAOr3pC85LfyioTcohdqwm27qEb4Fam41Fy/CDuko344niARtGU2MRErR9X
         4gcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gdamzciN9oYeOnQEXtDEInhoS4qKKlsZvZNP31PgOHQ=;
        b=HfgaCh59A6jU4iYbrSJ6XrSQnpMVSGdzpLm/YDKJjDz37leUoFfeQbdC+Vi863p5nE
         jvhdTE1GKRqT+gKcwr1JneFOzx0pcKcckRvFSSD2zTZ3agAvhz5tZFZThphNf4aAr9hs
         3dY26Tdyr7HpkGGJgo/vSZ9zTBtS65+Ozlxaej+elqrumfG2uI7M2gJbexsNTlCUeloY
         h7mcvx8qI8+EJi3MSW5aAJIp6nr/KFkL7QqCt6B5wtKgC7fajDrlSFUbDorCyndnuxjK
         aS6MyFhaXTWqFq4A3/YlmBPyMcN+l1LxUZ6xC/zpUVgmKFou8/duy2b7IPZHI63k4xYU
         62VA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w2si1268720ybc.28.2017.12.07.10.15.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Dec 2017 10:15:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33727 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eN0hs-0000D6-QI
	for alex.bennee@linaro.org; Thu, 07 Dec 2017 13:15:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eN0hJ-0008FO-F5
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 13:15:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eN0hI-0006mn-Kz
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 13:15:01 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38906)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eN0hI-0006ly-Dt; Thu, 07 Dec 2017 13:15:00 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eN0hE-00081p-Ew; Thu, 07 Dec 2017 18:14:56 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  7 Dec 2017 18:14:50 +0000
Message-Id: <1512670493-18114-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/6] target/arm: Move definition of 'host' cpu
 type into cpu.c
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
Cc: "Richard W . M . Jones" <rjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9BicoyZ1Z9BR

Move the definition of the 'host' cpu type into cpu.c, where all the
other CPU types are defined.  We can do this now we've decoupled it
from the KVM-specific host feature probing.  This means we now create
the type unconditionally (assuming we were built with KVM support at
all), but if you try to use it without -enable-kvm this will end
up in the "host cpu probe failed and KVM not enabled" path in
arm_cpu_realizefn(), for an appropriate error message.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 24 ++++++++++++++++++++++++
 target/arm/kvm.c | 19 -------------------
 2 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a7deb10..9304277 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1785,6 +1785,26 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
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
@@ -1822,6 +1842,10 @@ static void arm_cpu_register_types(void)
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
index 945696c..6bdc027 100644
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
2.7.4

