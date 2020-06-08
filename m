Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5019553lfc;
        Mon, 8 Jun 2020 05:13:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO/6YTSDfazObbzUjLVT4rZLkW2+5ndVfgkA5UnaHvnXCRs5zGbVLs2/wPFd7XByUVjRv0
X-Received: by 2002:a25:7ac2:: with SMTP id v185mr36386647ybc.278.1591618392907;
        Mon, 08 Jun 2020 05:13:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591618392; cv=none;
        d=google.com; s=arc-20160816;
        b=zkgBnbZhdPVAsviLVXIgj3cnz6Ob745mAvG3G9B5fSPGbGsojDyUXW6cR/JfasG19g
         IEhkM/URWRu3Sj/3F8ZSxyEc/w+PnE36O7JW4RaeQwAV4X9lTBIFRsh7noEkGvNHzwNu
         sWRwa8lJiHAjq8SfqT8Q0RumY+HAcTRjUXwGVkbsP02KnBEcOtypZ+Au28oJxov9hi60
         OH5zI1VR0HzwbPMCeCka8kb2gs/TFzgKWdGg8OJK/htRp5UbPIHEDv8JfzraC0lXPrjj
         LzO9b7AHJxjzQ6lUUfCHLbfK1WElF+Sc8x0GAJmyq69ooi6EPi2Tsu8r+UOggOrS8K9g
         EAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=+eQPfmpzKA58px5ZigkPYX0/pK3De4Xf7n/3HAuXcJA=;
        b=aLzWn/V73B4yvoO9Dh3KgZjDg5HtoitOZ/SgSmrfDlpoDkcgPB/RPWPvGTadPI+/Ab
         3ledfsEhncLaNnayTaiNwHZCOI4w1JOVyv8ZorBbU5EqQaok76ZDRfpeMqgsf3Bv08vm
         fiumDXbZS/5qfxgSQbbKRv5D7wl3DfH6CWL7tVtsg1MNSofhUV1Do4krqmO+VKaYDiQl
         gJFX8SAZ/ZZhAzuGRQMyDItf/WoHaS6GhW60K14rytkICvzWT6tIzbRehFaSjitvJbLq
         mvAknqulIIuhqNVv5s/IYXMVW3B7GeU4YOFHV297AmXchf6j1C+1lQylW4CPKp7KUo3k
         kX8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si19994741ybt.337.2020.06.08.05.13.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 05:13:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiGeO-0001gW-AZ
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 08:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1jiGeE-0001gD-Fx; Mon, 08 Jun 2020 08:13:02 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:49182 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1jiGeC-00004s-KS; Mon, 08 Jun 2020 08:13:01 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D2D89A3EF5C59D08A87C;
 Mon,  8 Jun 2020 20:12:53 +0800 (CST)
Received: from localhost (10.173.222.233) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Mon, 8 Jun 2020
 20:12:45 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Subject: [PATCH v3] target/arm/cpu: adjust virtual time for arm cpu
Date: Mon, 8 Jun 2020 20:12:43 +0800
Message-ID: <20200608121243.2076-1-fangying1@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.173.222.233]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 08:12:54
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, zhang.zhanghailiang@huawei.com, wu.wubin@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: akXSQojzQQBy

From: fangying <fangying1@huawei.com>

Virtual time adjustment was implemented for virt-5.0 machine type,
but the cpu property was enabled only for host-passthrough and
max cpu model. Let's add it for arm cpu which has the generic timer
feature enabled.

Suggested-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>

---
v3:
- set kvm-no-adjvtime property in kvm_arm_add_vcpu_properties

v2:
- move kvm_arm_add_vcpu_properties into arm_cpu_post_init

v1:
- initial commit
- https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg08518.html

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 32bec156f2..5b7a36b5d7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1245,6 +1245,10 @@ void arm_cpu_post_init(Object *obj)
     if (arm_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER)) {
         qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property);
     }
+
+    if (kvm_enabled()) {
+        kvm_arm_add_vcpu_properties(obj);
+    }
 }
 
 static void arm_cpu_finalizefn(Object *obj)
@@ -2029,7 +2033,6 @@ static void arm_max_initfn(Object *obj)
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
-        kvm_arm_add_vcpu_properties(obj);
     } else {
         cortex_a15_initfn(obj);
 
@@ -2183,7 +2186,6 @@ static void arm_host_initfn(Object *obj)
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
     }
-    kvm_arm_add_vcpu_properties(obj);
     arm_cpu_post_init(obj);
 }
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index cbc5c3868f..778cecc2e6 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -592,7 +592,6 @@ static void aarch64_max_initfn(Object *obj)
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
-        kvm_arm_add_vcpu_properties(obj);
     } else {
         uint64_t t;
         uint32_t u;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 4bdbe6dcac..eef3bbd1cc 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -194,17 +194,18 @@ static void kvm_no_adjvtime_set(Object *obj, bool value, Error **errp)
 /* KVM VCPU properties should be prefixed with "kvm-". */
 void kvm_arm_add_vcpu_properties(Object *obj)
 {
-    if (!kvm_enabled()) {
-        return;
-    }
+    ARMCPU *cpu = ARM_CPU(obj);
+    CPUARMState *env = &cpu->env;
 
-    ARM_CPU(obj)->kvm_adjvtime = true;
-    object_property_add_bool(obj, "kvm-no-adjvtime", kvm_no_adjvtime_get,
-                             kvm_no_adjvtime_set);
-    object_property_set_description(obj, "kvm-no-adjvtime",
-                                    "Set on to disable the adjustment of "
-                                    "the virtual counter. VM stopped time "
-                                    "will be counted.");
+    if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
+        cpu->kvm_adjvtime = true;
+        object_property_add_bool(obj, "kvm-no-adjvtime", kvm_no_adjvtime_get,
+                                 kvm_no_adjvtime_set);
+        object_property_set_description(obj, "kvm-no-adjvtime",
+                                        "Set on to disable the adjustment of "
+                                        "the virtual counter. VM stopped time "
+                                        "will be counted.");
+    }
 }
 
 bool kvm_arm_pmu_supported(CPUState *cpu)
-- 
2.23.0

