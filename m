Received: by 10.28.91.67 with SMTP id p64csp3703100wmb;
        Tue, 6 Mar 2018 04:55:58 -0800 (PST)
X-Google-Smtp-Source: AG47ELs3hCM2pT9y1J3l1OsRqlFh3ZfnjuSYVzf3zb+bLCCxsci/LXgjn/UrU/6ocukr6OVECBtT
X-Received: by 2002:a25:9cc8:: with SMTP id z8-v6mr11549565ybo.9.1520340958487;
        Tue, 06 Mar 2018 04:55:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520340958; cv=none;
        d=google.com; s=arc-20160816;
        b=vo1qYOWv4sGyp0pEVRTkmzv8usdFSdafgLzg4TsUx+7GrEO0163BCRBJhXrkNp58Ee
         4t3zI5kOnqNNpu/+dW02zXCAxWuCjKHnMWLkuN1Yivoo0W1cqzwMiwQMdR07sWqEFdi5
         ab9OkOoz+mgiNItIur1vMFOOx6EX/j0NxFPZ+0qAZZy9roraB3+cCA23KotH5XUQ+BFf
         P3qwaAuDm1FLyU6/x2ugAGpy7vrdeLIXgN7IMOF49GV7blhgwzcHg4fZIPhEDqZI+gqY
         0DvNSwSDM1ByBP1rBusBg32UELLq5cMw6Ed2/6/0a47Ac6YrSBYxKDTlTXGfxU366DZH
         4niA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=FzJU/kEruoIH3cfzo9Hc25ssSkXhrEypFBeW/d96WUw=;
        b=QnS/Vh0nQC8jUMi+2lv3uO00h8Th7a/LKnx7BFUPiwVYrvbvEiZRvOy2fz/6Vq0zKD
         3OnFPYtUdU/OrN7rVi90DbsKYp4/NBnO6rK/Xv6cR/ZkwKF/Q1Zq8sbnWdu9DecSCDTO
         cyOBmFEE9NDbOTazHfjTtsrmBSu1Z/Pt7pcQCX26UBNtB9c1W/P4/orErqkAEjgA/+D3
         gUgtZORK+bekFy/OiiOSvdhWxYawcgtx3Obq8lps6qEt1NMOENwzuK+kdWlsXZ9WrT6J
         iMpC1fXT/haE/IS7jMt9DIt0BHdkSSwzXr4wpBMSmaI+yLv08eElD23/0wHQfIDaFcuI
         oeVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e11si2533215ywb.626.2018.03.06.04.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 04:55:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55253 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etC8L-0008Sz-SB
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 07:55:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1etC86-0008Qc-Os
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 07:55:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1etC85-0004tI-MH
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 07:55:42 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1etC85-0004jX-EX; Tue, 06 Mar 2018 07:55:41 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1etC7s-0004Va-Vy; Tue, 06 Mar 2018 12:55:28 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  6 Mar 2018 12:55:22 +0000
Message-Id: <20180306125526.27838-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180306125526.27838-1-peter.maydell@linaro.org>
References: <20180306125526.27838-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 2/6] target/arm: Move definition of 'host' cpu
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
Cc: Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aN5+0QY/ut67

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

