Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3647601lfa;
        Sun, 1 Nov 2020 21:44:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyllWnBO3xgYBmfu9fTl4M2a0VSVijuZPLi1FiF3+3SVVuC7t475Au9/KxnJRi2mBPGSeSp
X-Received: by 2002:a05:620a:1426:: with SMTP id k6mr13621393qkj.438.1604295869555;
        Sun, 01 Nov 2020 21:44:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604295869; cv=none;
        d=google.com; s=arc-20160816;
        b=UK9Sa4rsjT5wHNnz17eUpSIpeCmQGY2MCqfDrKaprlQANOSE+x1/+eel+O5iOwerOC
         0Yqk3fN+0f1EZA8PEbaLA1s4cMOY7eqQmcb1KpyxklN72Yqa+f1i0voLKd7SDhwcVc05
         IkcANKt2DAcE5Ui6nV45V6lMwDf8rAy52nzMaCIyWWth2/XBGAO4w5z+5ugc8xrhe1sA
         2eY5CydrVyOIw2xeo1RInNayLOrJySgoO/5ULrsS7CzBJ/DNkz6KbFZw9NY6n0dJGpIm
         yxsvg6E0UfnIUg5Li5qdbb8dh+wOROY7n1FMMYgvYZgZAqpFo5fT7ydgD/yz1EAdhFNh
         5Shw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=fR5nQHqISbkY9/fuWsWen6YUx9ervXJB7tOs2BZFfyE=;
        b=vDjBZXlaO7GTTl5KkJWgAe+n875kV4+rwzIGU0PQCkwWzuT8n095UwehZmk+jcY+Xp
         wwruQLSEDo/OMt5Zf+TFvyV/LlKVMwTPwHzJshE1kUnHy4GWIQ1Bjyf4HnDSLC/qwews
         6lx9gGE0qxNmy5Q5wlzQx58NW/O2gFdvavyEl/PaohEGem+hBa101EAetlv0JQGa4LXe
         yj6oNd3H1rJBvoNwlsbP2ah7q0FzZ7h3bACx1t1kwccaTy7fx+/NGetveqJx4TlFyFKp
         CyiU5Vkwx5eJjHzlpch2vjyAQeCRxy1XYn7HH5XzA8ggE6rRhGKBUa35PnZ0WyxwGDPh
         mAWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16si8234070qkv.51.2020.11.01.21.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Nov 2020 21:44:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZSdp-0002Tb-0S
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 00:44:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdL-0002Ps-4E; Mon, 02 Nov 2020 00:43:59 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdG-0001IH-Mq; Mon, 02 Nov 2020 00:43:58 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPhft41Vcz15PqN;
 Mon,  2 Nov 2020 13:43:50 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 13:43:41 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v3 05/10] target/arm: Introduce kvm_arm_cpu_feature_supported
Date: Mon, 2 Nov 2020 13:40:50 +0800
Message-ID: <20201102054055.686143-6-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102054055.686143-1-liangpeng10@huawei.com>
References: <20201102054055.686143-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 00:43:42
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, Peng Liang <liangpeng10@huawei.com>,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VZsIlgNnJ5/9

Introduce kvm_arm_cpu_feature_supported to check whether KVM supports to
set CPU features in ARM.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/kvm64.c   | 14 ++++++++++++++
 target/arm/kvm_arm.h |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 86a5bca5a4ec..5700c4084090 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -721,6 +721,20 @@ bool kvm_arm_steal_time_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
 }
 
+bool kvm_arm_cpu_feature_supported(void)
+{
+    static bool cpu_feature_initialized;
+    static bool cpu_feature_supported;
+
+    if (!cpu_feature_initialized) {
+        cpu_feature_supported = kvm_check_extension(kvm_state,
+                                                    KVM_CAP_ARM_CPU_FEATURE);
+        cpu_feature_initialized = true;
+    }
+
+    return cpu_feature_supported;
+}
+
 QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
 
 void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index eb81b7059eb1..a6a1df775cd2 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -308,6 +308,13 @@ bool kvm_arm_pmu_supported(void);
  */
 bool kvm_arm_sve_supported(void);
 
+/**
+ * kvm_arm_cpu_feature_supported:
+ *
+ * Returns true if KVM can set CPU features and false otherwise.
+ */
+bool kvm_arm_cpu_feature_supported(void);
+
 /**
  * kvm_arm_get_max_vm_ipa_size:
  * @ms: Machine state handle
-- 
2.26.2

