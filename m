Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp62876lfc;
        Tue, 2 Jun 2020 19:03:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/bUF64oo5YkESLG9wQI+yKz4Dz+vdaCK8wR/5L5QmT18h3R+3u8uzweRaFnTn1SnOOWOo
X-Received: by 2002:a5b:1d2:: with SMTP id f18mr45594446ybp.32.1591149783309;
        Tue, 02 Jun 2020 19:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591149783; cv=none;
        d=google.com; s=arc-20160816;
        b=uK+I/m2LbD0HQFgs1R+uw9+C/hhR9xS2OZNlUazYv4KlSPUY5UpM0yAbulGEUlg7WA
         u06E6gTETv8pTPLetwWcO4dr9TQ2UL+SRsu7C1AuC3ewuNiHUZb6yS0iLkup6SLE7yXm
         KsOCYLjDCYEhV3k9GK86PaD39hyEzWeBGZzkEu6ScCY5+yT/nqFYF+5lBLc7EBstSv3G
         bd5HUgQ2ocvwGPyQ2PYnNvHob1yZUY/1wzUqmiBChYxz7PaW93GMC6Xg3nvhpltEKNVI
         sFcZEsNGw1liX98Taa1k8TOgseCbvbDpJmE6+i9WKyoj9UbwPy+f1lSE11t3EV4pu/ho
         n+RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=AXCWaoM6diD8Roj6IqrNgD7Pmy/LCojRu90whS6pIbY=;
        b=bSn+dJ2I2i9bnqM11Ia94dEXg/EcBDKiLEOec+r3Wph9O6B1k+rryXFd5leemnegVr
         Vn0AVfGfmqhos3AEgLW9hKZf4kFX6RGVdUHy830WCe6yl75ZqZ5X2dwUht60bf1u0i84
         1qXegs/bs6cys25W/PrmR0fS+OEzfQzSURKJ1jV0Ppiq5x1uw+V6thw6V0u3PW/m9Jr0
         D2gRPTH+lfDdih0a616qf6b2w4Q4jWBn90ZRq3jAizs4q8Qhqx/DFTzvDGO17DMnnIkk
         c2mg7cXOznCNjXivB5FuMKJE0gmHxi87qfd22XW8S1Sl38w3ZIehAUVmuFP0tAkWpFv2
         fwWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m191si399258ybm.346.2020.06.02.19.03.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 19:03:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgIkA-0004ST-MM
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 22:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1jgIk3-0004S2-0l; Tue, 02 Jun 2020 22:02:55 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3773 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1jgIjt-0006Ey-Fu; Tue, 02 Jun 2020 22:02:54 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0069960ADA7C789BF84C;
 Wed,  3 Jun 2020 10:02:37 +0800 (CST)
Received: from localhost (10.173.222.233) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Wed, 3 Jun 2020
 10:02:29 +0800
From: Ying Fang <fangying1@huawei.com>
To: <drjones@redhat.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2] target/arm/cpu: adjust virtual time for arm cpu
Date: Wed, 3 Jun 2020 10:02:08 +0800
Message-ID: <20200603020208.2089-1-fangying1@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.173.222.233]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 22:02:39
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 wu.wubin@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c9VOcxISDIO9

Virtual time adjustment was implemented for virt-5.0 machine type,
but the cpu property was enabled only for host-passthrough and
max cpu model. Let's add it for arm cpu which has the gernic
timer feature enabled.


Signed-off-by: Ying Fang <fangying1@huawei.com>

---
v2:
- move kvm_arm_add_vcpu_properties into arm_cpu_post_init

v1:
- initial commit
- https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg08518.html

---
 target/arm/cpu.c   | 3 +--
 target/arm/cpu64.c | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 32bec156f2..1e9b7a51f2 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1244,6 +1244,7 @@ void arm_cpu_post_init(Object *obj)
 
     if (arm_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER)) {
         qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property);
+        kvm_arm_add_vcpu_properties(obj);
     }
 }
 
@@ -2029,7 +2030,6 @@ static void arm_max_initfn(Object *obj)
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
-        kvm_arm_add_vcpu_properties(obj);
     } else {
         cortex_a15_initfn(obj);
 
@@ -2183,7 +2183,6 @@ static void arm_host_initfn(Object *obj)
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
-- 
2.23.0


